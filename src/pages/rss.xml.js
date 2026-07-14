import rss from '@astrojs/rss';
import { sortedPosts, postPath } from '../lib/posts';

export async function GET(context) {
  const posts = await sortedPosts();
  return rss({
    title: "yui's blog",
    description: "yui's blog — notes on travel, photography, tech, and life.",
    site: context.site,
    items: posts.map((post) => ({
      title: post.data.title,
      pubDate: post.data.date,
      link: postPath(post),
    })),
    customData: '<language>zh-hant</language>',
  });
}
