import { defineConfig } from 'astro/config';
import remarkBreaks from 'remark-breaks';

export default defineConfig({
  site: 'https://whamwong.me',
  trailingSlash: 'ignore',
  build: {
    format: 'directory',
  },
  markdown: {
    // 旧 Hexo(marked)把单个换行渲染为 <br>,文章都按此习惯书写
    remarkPlugins: [remarkBreaks],
    shikiConfig: {
      themes: {
        light: 'github-light',
        dark: 'github-dark-dimmed',
      },
    },
  },
});
