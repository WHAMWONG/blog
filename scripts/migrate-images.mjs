#!/usr/bin/env node
/**
 * 阿里云 OSS 图床迁移工具
 *
 * 用法:
 *   node scripts/migrate-images.mjs download
 *     把文章里所有 OSS 图片下载到 migration/images/(已 gitignore),
 *     并生成 migration/manifest.json 与 migration/upload-to-r2.sh。
 *
 *   node scripts/migrate-images.mjs rewrite --base https://img.whamwong.me
 *     把文章里的 OSS 链接改写为新图床地址(--base 为 R2 绑定的自定义域名),
 *     同时把旧的 <div><img …><p …></p></div> HTML 块清理成 Markdown 图片语法。
 */

import { readdir, readFile, writeFile, mkdir, access, chmod } from 'node:fs/promises';
import { createWriteStream } from 'node:fs';
import { Readable } from 'node:stream';
import { pipeline } from 'node:stream/promises';
import path from 'node:path';

const POSTS_DIR = 'source/_posts';
const OUT_DIR = 'migration/images';
const MANIFEST = 'migration/manifest.json';
const UPLOAD_SCRIPT = 'migration/upload-to-r2.sh';
const OSS_HOST = 'whamwong-blog.oss-cn-shenzhen.aliyuncs.com';
const OSS_URL_RE = new RegExp(`https?://${OSS_HOST.replaceAll('.', '\\.')}/[^)"'\\s<]+`, 'g');

async function postFiles() {
  const entries = await readdir(POSTS_DIR);
  return entries.filter((f) => f.endsWith('.md')).map((f) => path.join(POSTS_DIR, f));
}

/** URL → R2 对象键(解码、去掉 OSS 处理参数) */
function urlToKey(url) {
  const u = new URL(url);
  return decodeURIComponent(u.pathname.replace(/^\//, ''));
}

async function collectUrls() {
  const urls = new Set();
  for (const file of await postFiles()) {
    const text = await readFile(file, 'utf8');
    for (const m of text.matchAll(OSS_URL_RE)) urls.add(m[0]);
  }
  return [...urls];
}

async function download() {
  const urls = await collectUrls();
  console.log(`共发现 ${urls.length} 个 OSS 图片链接`);
  const manifest = [];
  let ok = 0;
  let failed = 0;

  for (const url of urls) {
    const key = urlToKey(url);
    if (!key || key.endsWith('/')) {
      console.warn(`⚠ 跳过目录形式的链接(可能是文章里的 URL 断行):${url}`);
      continue;
    }
    const dest = path.join(OUT_DIR, key);
    manifest.push({ url, key });

    try {
      await access(dest);
      ok++;
      continue; // 已下载
    } catch {}

    await mkdir(path.dirname(dest), { recursive: true });
    const httpsUrl = url.replace(/^http:/, 'https:');
    try {
      const res = await fetch(httpsUrl.split('?')[0]);
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      await pipeline(Readable.fromWeb(res.body), createWriteStream(dest));
      ok++;
      console.log(`✓ ${key}`);
    } catch (err) {
      failed++;
      console.error(`✗ ${key}: ${err.message}`);
    }
  }

  await mkdir('migration', { recursive: true });
  await writeFile(MANIFEST, JSON.stringify(manifest, null, 2));

  const lines = [
    '#!/usr/bin/env bash',
    '# 把已下载的图片上传到 Cloudflare R2。',
    '# 前提:npm i -g wrangler && wrangler login,并已创建 bucket(默认名 blog-images):',
    '#   wrangler r2 bucket create blog-images',
    '# 用法:bash migration/upload-to-r2.sh [bucket 名]',
    'set -euo pipefail',
    'BUCKET="${1:-blog-images}"',
    'cd "$(dirname "$0")/.."',
    ...manifest.map(
      ({ key }) => `wrangler r2 object put "$BUCKET/${key}" --file "migration/images/${key}" --remote`
    ),
    'echo "全部上传完成。到 Cloudflare 控制台为 bucket 绑定自定义域名后,运行:"',
    'echo "  npm run images:rewrite -- --base https://<你的图床域名>"',
  ];
  await writeFile(UPLOAD_SCRIPT, lines.join('\n') + '\n');
  await chmod(UPLOAD_SCRIPT, 0o755);

  console.log(`\n完成:成功 ${ok},失败 ${failed}`);
  console.log(`清单:${MANIFEST}`);
  console.log(`上传脚本:${UPLOAD_SCRIPT}`);
}

/** 旧 Hexo 时代的内嵌 HTML 图片块 → Markdown */
function tidyLegacyHtml(text) {
  return text.replace(
    /<div><img src='([^']+)'[^>]*\/?>\s*<p[^>]*>([^<]*)<\/p>\s*<\/div>/g,
    (_, src, caption) => `![${caption.trim()}](${src})`
  );
}

async function rewrite(base) {
  if (!base) {
    console.error('缺少 --base 参数,例如:--base https://img.whamwong.me');
    process.exit(1);
  }
  const baseUrl = base.replace(/\/$/, '');
  let totalReplaced = 0;

  for (const file of await postFiles()) {
    const before = await readFile(file, 'utf8');
    let text = tidyLegacyHtml(before);
    text = text.replace(OSS_URL_RE, (url) => {
      totalReplaced++;
      return `${baseUrl}/${encodeURI(urlToKey(url))}`;
    });
    if (text !== before) {
      await writeFile(file, text);
      console.log(`✎ ${file}`);
    }
  }
  console.log(`\n共改写 ${totalReplaced} 个链接。请本地预览确认后再提交。`);
}

const [, , cmd, ...args] = process.argv;
const baseIdx = args.indexOf('--base');
const base = baseIdx >= 0 ? args[baseIdx + 1] : undefined;

if (cmd === 'download') await download();
else if (cmd === 'rewrite') await rewrite(base);
else {
  console.log('用法:node scripts/migrate-images.mjs <download|rewrite --base URL>');
  process.exit(1);
}
