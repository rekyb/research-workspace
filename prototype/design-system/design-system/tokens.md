# Design Tokens — full reference

> Loaded when a task touches concrete **values** (color/spacing/type/radius/shadow/z/motion).
> This file holds VALUES; rules about *using* them live in `../DESIGN.md` and the pattern modules.

## TYP · Typography

Families: **Plus Jakarta Sans** (`font-heading`, 200–800) · **Open Sans** (`font-body`, 300–800).
Loaded via Google Fonts, `font-display: swap`. CSS vars `--font-heading` / `--font-body`.

| Token | Family | Weight | Size / Line | Usage |
|---|---|---|---|---|
| `display-lg` | Jakarta | 700 | 56 / 64 | Hero / onboarding headline |
| `display-md` | Jakarta | 700 | 48 / 56 | Secondary hero |
| `heading-lg` | Jakarta | 700 | 32 / 40 | Page title |
| `heading-md` | Jakarta | 700 | 28 / 36 | Section title |
| `heading-sm` | Jakarta | 600 | 24 / 32 | Small section title |
| `title-lg` | Jakarta | 600 | 20 / 28 | Card / dialog title |
| `title-md` | Jakarta | 600 | 18 / 26 | AppBar title |
| `title-sm` | Jakarta | 600 | 16 / 24 | Small card title |
| `body-lg` | Open Sans | 400 | 16 / 24 | Main readable content |
| `body-md` | Open Sans | 400 | 14 / 20 | Default text |
| `body-sm` | Open Sans | 400 | 12 / 18 | Helper text |
| `label-lg` | Open Sans | 600 | 16 / 24 | Large button label |
| `label-md` | Open Sans | 600 | 14 / 20 | Default button/input label |
| `label-sm` | Open Sans | 600 | 12 / 16 | Small label / badge |
| `caption` | Open Sans | 400 | 10 / 14 | Metadata / timestamp |

- **TYP-01** Body ≥ 16px on mobile (`body-lg`) — avoids iOS auto-zoom.
- **TYP-02** Weight carries hierarchy: headings 600–700 · body 400 · labels 600.
- **TYP-03** Never invent sizes outside this scale.
- **TYP-04** Tabular figures for data columns, timers, scores (prevent layout shift).
- **TYP-05** Line length 35–60 chars mobile / 60–75 desktop.

## CLR · Color

Two layers: **(a) semantic vars** (default for surfaces/text, themeable) · **(b) named scales** (specific step).

**Brand tokens** (`bg-brand-*`): `dark #32323A · accent #FFCB1D · cta #EC1A64 · success #2D8B55 · warning #F9B60A · info #2193C8 · error #EA4134 · background #FAF8F8 · white #FFFFFF`

**Scales** (`100…700`, **500 = main**):
- **primary (yellow):** `#FFF8D8 #FFF0AE #FFE37A #FFD84C #FFCB1D #E8B500 #C99700`
- **secondary (blue):** `#E6F5FC #C6E8F8 #92D2EF #58B7E0 #2193C8 #1B78A4 #155C7D`
- **accent-pink (reward, GAIN AI Coach):** `#FDE1EB #F9B8CE #F58AAD #F05C8B #EC1A64 #C81453 #980F3F`
- **accent-red (urgency):** `#FCE1DF #F8B8B3 #F28A82 #ED6257 #EA4134 #C53328 #97271F`
- **accent-purple (GAIN Incentives):** `#F1E3F4 #DDBAE4 #C58FD0 #AA5AB8 #8E279B #721F7D #55175E`
- **neutral 0…900:** `#FFFFFF #FAF8F8 #F3F4F6 #E5E7EB #D1D5DB #9CA3AF #6B7280 #4B5563 #374151 #1F2937 #111827`

**Semantic** (100 bg / 500 main / 700 hi-contrast): success `#DDF3E6 #2D8B55 #1F633C` · warning `#FFF1C9 #F9B60A #B07D00` · error `#FCE1DF #EA4134 #97271F` · info `#E3F4FB #2193C8 #155C7D`

**Semantic CSS vars** (`:root`, used as `hsl(var(--x))`):

| Var | HSL | ≈Hex | Note |
|---|---|---|---|
| `--background` | `30 13% 97%` | `#FAF8F8` | App bg |
| `--foreground` | `36 42% 11%` | `#261F10` | Default text (warm near-black) |
| `--card`/`--popover` | `0 0% 100%` | `#FFFFFF` | Raised surfaces |
| `--primary` | `46 100% 56%` | `#FFCB1D` | Yellow |
| `--primary-foreground` | `36 42% 11%` | `#261F10` | Text on yellow (**dark, never white**) |
| `--secondary` | `199 71% 47%` | `#2397CB` | Blue |
| `--secondary-foreground` | `0 0% 100%` | `#FFFFFF` | Text on blue |
| `--muted` | `35 18% 91%` | `#EEEBE5` | Muted surface |
| `--muted-foreground` | `36 11% 36%` | — | Muted text |
| `--accent` | `339 84% 51%` | `#EC1A64` | Pink |
| `--accent-foreground` | `0 0% 100%` | `#FFFFFF` | Text on pink |
| `--destructive` | `5 81% 56%` | `#EA4134` | Red |
| `--border`/`--input` | `38 14% 84%` | `#DCD9D2` | Borders/inputs |
| `--ring` | `46 100% 56%` | `#FFCB1D` | Focus ring (= primary) |

- **CLR-01** `--foreground` (`#261F10`) ≠ `brand.dark` (`#32323A`): body text uses `--foreground`.
- **CLR-02** Surfaces: `--background` page · `--card` raised · `--muted` quiet sections.
- **CLR-03** One primary CTA *button* per screen: solid yellow `--primary` fill + `--primary-foreground` text. Pink `--accent` is the reward/celebration color for non-button surfaces (badges, SkillRing outer ring, GAIN A — AI Coach) — never a button fill (see `components.md` CMP-09).
- **CLR-04** Color never sole signal — pair icon/text (error = red + icon + message).
- **CLR-05** **Never white on yellow** (fails contrast). Verified pairs below.

**Contrast pairs (safe):** dark `#261F10` on `#FAF8F8`/white ✅ body · dark `#261F10` on yellow ✅ button · white on blue/pink/red ✅ · `*-700` on matching `*-100` ✅ chips.

**Dark mode (CLR-06):** define a `.dark` variant — desaturated tonal variants (not inverted); surfaces lift to `neutral-800/900`, text `neutral-100`; keep yellow primary but re-verify text contrast per theme. Design light + dark together.

- **CLR-07** One dominant color per surface + neutral support; solid fills over heavy gradients (subtle gradients only when they clearly support the direction). Don't stack many bright colors or slip into muted corporate palettes. (See NN-09, BRD-05.)
- **CLR-08** Form fields signal state with yellow `--primary` (interactive) and red `--destructive` (error) only — never blue `--secondary` as a field border (see `components.md` CMP-14).

## SPC · Spacing
4px base. `space-1..12` = `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48` px. Keep 4/8px rhythm; section tiers 16/24/32/48 by hierarchy.

## RAD · Radius
`--radius: 0.75rem` (12px). Tailwind: `rounded-lg = radius`, `-md = −2px`, `-sm = −4px`. Scale: `sm 4 · md 8 · lg 12 · xl 16 · 2xl 24 · full 9999`. Pills/avatars = `full`.

## ELV · Elevation (use these, never ad-hoc shadows)
`elev-0 shadow-none` (flat) · `elev-1 shadow-sm` (cards rest) · `elev-2 shadow-md` (raised/dropdown) · `elev-3 shadow-lg` (popover/sticky) · `elev-4 shadow-xl` (dialog/sheet). Monotonic with stacking.

## ZIX · Z-index (named layers, never `z-[999]`)
`base 0 · dropdown 10 · sticky 20 · appbar 30 · overlay/scrim 40 · modal 50 · popover 60 · toast 70`.

## BRK · Breakpoints (mobile-first, design at 375 first)
`sm 640 · md 768 · lg 1024 · xl 1280 · 2xl 1400` (container max 1400, centered, 1rem pad). Use `min-h-dvh` over `100vh`; no horizontal scroll; `viewport = width=device-width, initial-scale=1` (never disable zoom).

## MOT · Motion tokens
`motion-fast 150ms` (hover/small) · `motion-base 200ms` (default/press) · `motion-slow 300ms` (enter/expand/modal). Ease-out enter, ease-in exit; exit ≈ 60–70% of enter. Animate `transform`/`opacity` only. Respect `prefers-reduced-motion`.

## ICO · Icons
One SVG set (**Lucide**). Sizes `icon-sm 16 · icon-md 20/24 · icon-lg 32`. Stroke 1.5–2px consistent; don't mix filled+outline at one hierarchy level. Decorative `aria-hidden`; icon-only buttons need `aria-label`.
