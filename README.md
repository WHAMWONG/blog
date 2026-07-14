# whamwong's blog

这里是 whamwong 的 blog,谢谢关注🙏。

基于 [Astro](https://astro.build) 构建,文章为纯 Markdown,存放在 `source/_posts/`(可直接用 Obsidian 编辑,frontmatter 沿用原 Hexo 字段)。

## 日常使用

```bash
npm install        # 首次
npm run dev        # 本地预览 http://localhost:4321
npm run build      # 构建到 dist/
```

推送到 `master` 后,GitHub Actions 会自动构建并发布到 `gh-pages` 分支(见 `.github/workflows/deploy.yml`)。

## 写新文章

在 `source/_posts/` 新建 `YYYY-MM-DD.md`:

```markdown
---
title: "文章標題"
date: 2026-07-03 12:00:00
tags:
    - Tech
---

正文……图片直接用 Markdown 语法:![描述](https://图床地址/xx.jpg)
```

文章 URL 为 `/:年/:月/:日/:文件名/`(与旧 Hexo 链接一致)。

## 图床迁移(阿里云 OSS → Cloudflare R2)

1. `npm run images:download` — 把文章里所有 OSS 图片下载到 `migration/images/`(已完成,62 张)
2. 创建 R2 bucket 并上传:`wrangler login && bash migration/upload-to-r2.sh`
3. 在 Cloudflare 控制台为 bucket 绑定自定义域名(如 `img.whamwong.me`)
4. `npm run images:rewrite -- --base https://img.whamwong.me` — 批量改写文章里的链接
5. 本地预览确认后提交

设计文档见 [DESIGN.md](DESIGN.md) 与 [PRODUCT.md](PRODUCT.md)。
