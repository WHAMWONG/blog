import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// 文章直接从原 Hexo 目录读取，Obsidian 写作流程不变。
const posts = defineCollection({
  loader: glob({ pattern: '*.md', base: './source/_posts' }),
  schema: z.object({
    title: z.string(),
    subtitle: z.string().nullish(),
    date: z.coerce.date(),
    tags: z.array(z.string()).nullish(),
    // 正文语言:旧文多为中文,默认 zh-Hant;英文文章在 frontmatter 写 lang: en
    lang: z.string().nullish(),
    // 旧 Hexo frontmatter 字段，保留兼容
    layout: z.string().nullish(),
    author: z.string().nullish(),
    'header-img': z.string().nullish(),
  }),
});

const pages = defineCollection({
  loader: glob({ pattern: 'about/index.md', base: './source' }),
  schema: z.object({
    layout: z.string().nullish(),
    title: z.string().nullish(),
  }),
});

export const collections = { posts, pages };
