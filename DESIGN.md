# Design

whamwong.me 的视觉系统。气质:安静 · 疏朗 · 文人气——排版是主角,留白是呼吸,照片大而不加修饰。

## Theme

浅色为主,`prefers-color-scheme: dark` 自动切换深色(墨蓝黑)。全部颜色用 OKLCH,色相统一偏向品牌色(黛蓝,hue ≈ 255–262)。

## Colors

定义在 [src/styles/global.css](src/styles/global.css) 的 `:root`(深色在 `@media (prefers-color-scheme: dark)` 覆盖):

| Token | Light | Dark | 用途 |
|---|---|---|---|
| `--bg` | `oklch(0.978 0.004 255)` | `oklch(0.213 0.016 260)` | 页面背景(冷调近白,非暖米色) |
| `--surface` | `oklch(0.952 0.007 255)` | `oklch(0.255 0.016 260)` | 代码块、行内 code |
| `--ink` | `oklch(0.28 0.022 260)` | `oklch(0.9 0.01 255)` | 正文墨色 |
| `--ink-secondary` | `oklch(0.44 …)` | `oklch(0.73 …)` | 副文本、引用 |
| `--ink-muted` | `oklch(0.5 …)` | `oklch(0.68 …)` | 日期、图注、页脚 |
| `--accent` | `oklch(0.42 0.09 262)` | `oklch(0.79 0.07 255)` | 黛蓝:链接、当前导航、句号点缀 |
| `--rule` | `oklch(0.885 …)` | `oklch(0.33 …)` | 1px 发丝分隔线 |

色彩策略:Restrained(克制)——黛蓝 accent 占比 ≤10%,其余交给墨色层级。

## Typography

单一衬线体系,跨文字配对:Latin 用 **Literata**(Google Fonts,400/600 + italic),CJK 用 **Noto Serif SC/TC**,回退 Songti SC。不引入无衬线体;层级靠字号 + 字重 + 墨色深浅。

- 正文 `--text-body: 1.125rem`,行高 1.95(CJK 疏朗)
- 字阶 1.25 比例:meta 0.8125 / small 0.9375 / body 1.125 / lg 1.375 / xl 1.75 / title clamp(1.75–2.375rem)
- 行长 `--measure: 34em`(每行约 34 个汉字)
- `hanging-punctuation: first allow-end`、`text-wrap: pretty/balance`

## Layout

- 单栏,`max-width: calc(34em + 12rem)`,居中
- 间距 4pt 基准 token(`--space-2xs` … `--space-2xl`,大间距用 clamp 呼吸)
- **签名元素:竖排年份**——首页按年分组,年份 `writing-mode: vertical-rl; text-orientation: upright` 立在文章列表左侧,如书脊落款;移动端转横排
- 列表用发丝线分隔,不用卡片

## Motion

克制:main 入场一次 fade-rise(0.55s,ease-out-quint),首页列表 30ms 递进;链接仅过渡 `color` / `text-decoration-color`。所有动效在 `prefers-reduced-motion: reduce` 下停用。

## Components

- **Base.astro** — 页面骨架:顶部 brand + 導航(文章/標籤/關於),底部版权 + RSS/Email
- **`.prose`** — 文章正文:全宽图片(无边框无阴影)、`hr` 渲染为 ❋、引用 1px 发丝左线、Shiki 双主题代码块
- 旧文章内嵌 HTML 图注块有 CSS 兜底(深色模式重着色)

## Voice

站点框架文字用繁體中文;品牌词 "whamwong" 与 "Serenity" 保留英文。日期格式「YYYY 年 M 月 D 日」,列表内「MM · DD」。
