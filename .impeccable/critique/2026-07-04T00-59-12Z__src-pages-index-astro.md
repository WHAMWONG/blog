---
target: homepage (src/pages/index.astro)
total_score: 28
p0_count: 0
p1_count: 2
timestamp: 2026-07-04T00-59-12Z
slug: src-pages-index-astro
---
⚠️ DEGRADED: single-context (both sub-agents hit the account session limit and returned no output; detector + inline review run in parent context)

# Critique — src/pages/index.astro (homepage) + shell

## Design Health Score

| # | Heuristic | Score | Key Issue |
|---|-----------|-------|-----------|
| 1 | Visibility of System Status | 3 | Theme toggle gives instant feedback; no nav active-states needed |
| 2 | Match System / Real World | 3 | English UI over `lang="zh-Hant"` + Chinese content is a slight register split |
| 3 | User Control and Freedom | 3 | Theme persists, prev/next on posts, browser-back; no search |
| 4 | Consistency and Standards | 3 | Cohesive; `lang` attribute + Chinese meta description are the outliers |
| 5 | Error Prevention | 3 | Almost no failure surface (no forms); 404 exists |
| 6 | Recognition Rather Than Recall | 2 | Hover easter eggs are pure discovery with zero affordance |
| 7 | Flexibility and Efficiency | 2 | No search, no year jump, no shortcuts across a 10-yr archive |
| 8 | Aesthetic and Minimalist Design | 4 | Genuinely minimal; every element earns its place |
| 9 | Error Recovery | 3 | 404 clear, English, has a back link |
| 10 | Help and Documentation | 2 | None — acceptable for a blog, but eggs have no hint |
| **Total** | | **28/40** | **Good** |

## Anti-Patterns Verdict

**LLM assessment**: Does NOT read as AI-generated. The cold-blue-ink palette (not cream/beige), the single serif system carried across Latin + CJK, the flat divider list, and especially the two hover easter eggs (MPC pad grid on "beat", Tokyo Tower with a blinking aviation beacon on "Tokyo") are specific, personal, non-templated choices. No gradient text, no eyebrows, no card grid, no side-stripes, no hero-metric. This passes both the first-order and second-order category-reflex checks.

**Deterministic scan**: detect.mjs → 1 finding, `single-font` (warning) at Base.astro:29. Suspected FALSE POSITIVE: the font stack is a deliberate cross-script pairing (Literata for Latin + Noto Serif SC/TC for CJK) in one custom property; the detector can't see the CJK half. DESIGN.md documents this as intentional. No action.

**Visual overlays**: not available — no browser-mutation/injection path in this degraded run. Fallback signal: dev server responds at :4322; mobile (375px) and desktop rendered screenshots inspected manually.

## Overall Impression

This is a confident, quiet, personal site — the strongest thing about it is restraint plus two moments of genuine delight. The single biggest liability is that those delight moments are invisible to most visitors: they're `:hover`-only, and "Tokyo" isn't even a link, so on touch devices (likely the majority of a personal-blog audience) the easter eggs simply don't exist and give no hint they ever could.

## What's Working

1. **Palette + type as identity.** Cold DÁI-blue ink on near-white / ink-blue-black, one serif system across scripts. It reads as "a person made this," which is exactly the brief (安静·疏朗·文人气).
2. **The easter eggs are real personality.** The MPC pad grid and the beacon-blinking tower are the kind of detail that makes someone screenshot a site. Mechanically clean too: animations paused until hover, `aria-hidden`, `prefers-reduced-motion` fallbacks.
3. **Flat list is honest.** Title + year·month·day, divider-separated, full-width tap rows that stack title-over-date on mobile. No cards, no fake metadata.

## Priority Issues

- **[P1] Easter eggs are undiscoverable and dead on touch.** "Tokyo" is a bare `<span>` with no affordance and no link; on mobile it's completely inert, and even on desktop nothing signals that hovering does anything. The delight we built reaches almost no one. **Fix**: give both words a persistent low-key affordance (dotted underline or a `cursor` change) and a touch path — e.g. reveal on tap for `.tokyo`, or accept it as a deliberate desktop-only wink but still mark the words as interactive. *Command: /impeccable delight or /impeccable adapt.*

- **[P1] Language metadata contradicts the content.** `<html lang="zh-Hant">` while the chrome + intro are English and the `meta description` is still Chinese ("yui's blog——旅行、攝影…"). Screen readers announce English UI in a Chinese-Han voice; the SEO snippet won't match an English-first landing. **Fix**: set the shell `lang` to match the dominant UI language (or per-node lang), and rewrite the meta description in English. *Command: /impeccable clarify or /impeccable harden.*

- **[P2] The archive has no wayfinding, and lost its signature.** DESIGN.md's signature element was the vertical year "spine"; the flat list dropped it. At 16 posts that's fine, but a 10-year archive becomes one long undifferentiated scroll with no year anchors, no tags, no search. **Fix**: keep the flat rhythm but reintroduce lightweight year separators or a year rail; or consciously accept "one quiet scroll" as the design and note it. *Command: /impeccable layout.*

- **[P2] "beat" focus state hides its own label.** On `:focus-visible` the word goes `color: transparent` and the pads take over. The accessible name survives (text node stays), but a sighted keyboard user watches the label vanish. **Fix**: keep the text visible on keyboard focus (reserve the swap for pointer hover), or show pads alongside rather than replacing. *Command: /impeccable adapt.*

- **[P3] single-font detector finding.** False positive (see above). No action.

## Persona Red Flags

**Jordan (first-time visitor)**: Lands on intro + list — clear enough, "about" is the intro itself. But will never learn the "beat"/"Tokyo" interactions exist; no hint, no hover on phone. Net: fine for reading, misses the charm.

**Sam (screen reader / keyboard)**: `lang="zh-Hant"` mismatch is the real flag — wrong pronunciation voice for English chrome. Good: theme toggle has an aria-label, eggs are `aria-hidden`, global `:focus-visible` outline exists. "beat" label going transparent on focus is a visual-only wrinkle, name intact.

**Casey (distracted mobile)**: Both easter eggs are dead (no hover). Theme toggle top-right is a ~18px icon with 0.3rem padding — reachable but on the small side for a thumb. Post rows are large, easy taps; state (theme) persists across returns. Main loss is delight, not function.

## Minor Observations

- Meta `description` and RSS description are Chinese while the visible brand is English — pick one voice.
- Theme-toggle tap target is smaller than the 44×44pt guideline; a touch user gets a tiny hit area.
- No `<h1>` on the homepage — the intro leads with an `<h2>`-less paragraph; fine visually, but the page has no top-level heading for AT/outline.
- The "beat" link is the only easter egg that also does something on tap (opens SoundCloud); "Tokyo" does nothing — inconsistent interaction for two visually-parallel words.

## Questions to Consider

- Should the easter eggs announce themselves at all, or is "only some people find them" the point?
- Is the site English-first now, or Chinese-first with English chrome? The answer settles the `lang`/description question.
- What does this list look like at 80 posts — still one scroll, or does the year come back?
