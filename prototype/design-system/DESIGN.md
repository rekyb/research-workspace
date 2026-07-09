# The Design (core)

> **Source of truth for all UI work, read by AI agents before any UI task.**
> Read this core in full, then **LAZY-LOAD only the module(s) your task needs** (Module Map). Don't load modules you won't use.
>
> This doc is a **reference / rules** doc (convergent). A separate divergent design *process* may be owned by a
> future UXD agent. Stack: Next.js (App Router) · Tailwind · shadcn/ui · TypeScript. Mobile-first PWA.

## Audience & product context

- **Learners 16–24**; **Indonesia-first** (then MY/SG; secondary IN/TH); **low-tier Android on 3G** → performance is a hard constraint, not a nicety.
- Product = **Solve Education!**, a *learning system*. Say **"learners"** (not "users"), **"learning system"** (not "EdTech platform").
- **GAIN** = how persistence is created: **G**amification · **A**I Coach ("Ed") · **I**ncentives · **N**etwork. Always capitalize GAIN. Never imply guaranteed outcomes.
- Brand feel: human, optimistic, curved/active, *looks like learning* — not corporate, not a toy. (Detail → `design-system/brand.md`.)

## How agents use this doc

1. **Always** read this core (~75 lines).
2. **Lazy-load** only the matching module(s) from the Module Map.
3. Rules are **addressable by ID** (`NN-03`, `CLR-04`, `FRM-02`, `VOX-02`) — cite IDs in reviews/PRs.

## Non-negotiables (apply to every task — never break without EM/brand sign-off)

- **NN-01** Use tokens, never raw values. Tailwind classes mapped to tokens; raw hex only inside `aria-hidden` decorative SVG.
- **NN-02** Reuse the component library; never rebuild an existing primitive; prefer `App*` wrappers.
- **NN-03** Every interactive element ships **all 8 states**: default · hover · focus-visible · pressed · disabled · loading · **error** · **empty**.
- **NN-04** Contrast ≥ 4.5:1 (text) / ≥ 3:1 (large/non-text), WCAG AA. **Color is never the only signal** — pair with icon/text.
- **NN-05** Honor `prefers-reduced-motion`; motion 150–300ms; **≥ 30fps on low-tier Android/3G or drop to instant** (`design-system/performance.md`).
- **NN-06** Touch targets ≥ 44×44px, ≥ 8px apart.
- **NN-07** SVG icons only (Lucide / project library). **Never emoji** as icons, status, or empty-state filler.
- **NN-08** `data-testid` on every interactive element.
- **NN-09** **One dominant color per surface** + neutral support; **solid fills over heavy gradients** (subtle gradients only when they clearly support the direction).
- **NN-10** **Curves over angles** — prefer soft / rounded / organic forms; avoid boxy or hostile geometry as the dominant language. Dense admin/sponsor surfaces may be structured but must keep warmth (spacing, color, copy).
- **NN-11** Sentence case; **real strings only** (no Lorem / "Click here" / placeholders); **no exclamation marks** unless earning genuine celebration. (Full voice → `design-system/brand-voice.md`.)
- **NN-12** Typeface = **Plus Jakarta Sans** (headings) + **Open Sans** (body text) (current code/tokens). **Use Open Sans by default for body text; do not change this typeface unilaterally.**

## Token quick-reference (names only — full values in `design-system/tokens.md`)

- **Semantic color vars:** `--background --foreground --card --primary`(yellow) `--secondary`(blue) `--accent`(pink) `--muted --destructive`(red) `--border --ring`
- **Color roles** (one dominant per surface): yellow `#FFCB1D` = primary emphasis **+ the only button CTA fill + the only field interactive-state accent** · blue `#2193C8` = info/educational (never a field border) **+ GAIN G (Gamification)** · pink `#EC1A64` = reward/celebration (badges, SkillRing, GAIN A — AI Coach — never a button fill) · purple `#8E279B` = **GAIN I (Incentives)** · red `#EA4134` = urgency/error (the only other field-state accent) **+ GAIN N (Network)** · neutrals = support. Full GAIN color mapping (verified against `solveeducation.org/gain`): `brand.md` BRD-12.
- **Brand scales:** `primary · secondary · accent-pink · accent-red · accent-purple · neutral` + semantic `success/warning/error/info` (100/500/700)
- **Type:** `font-heading`(Plus Jakarta) · `font-body`(Open Sans); scale `display-lg … caption` (16 tokens)
- **Spacing:** `space-1..12` (4px base) · **Radius:** `--radius .75rem`; `sm/md/lg/xl/2xl/full` — **buttons and text fields are always pill (`full`)**, see `components.md` CMP-08..15
- **Elevation:** `elev-0..4` · **Z-index:** `base..toast(70)` · **Breakpoints:** `sm640..2xl1400` (375-first) · **Motion:** `fast150/base200/slow300`

## Module Map — LAZY LOAD only what the task touches

| If your task touches… | Load |
|---|---|
| color / type / spacing / radius / shadow / z / motion **values** | [design-system/tokens.md](file:///home/reky/se-workspace/design-system-v1/design-system/tokens.md) |
| building or using a component; component states | [design-system/components.md](file:///home/reky/se-workspace/design-system-v1/design-system/components.md) |
| forms, inputs, validation, feedback | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **FRM** |
| navigation, menus, modals, tabs, back | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **NAV** |
| animation, transitions, gestures, touch | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **MOT / INT** |
| charts, graphs, data viz | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **VIZ** |
| performance / low-end Android / 3G budget | [design-system/performance.md](file:///home/reky/se-workspace/design-system-v1/design-system/performance.md) |
| accessibility work or audit | [design-system/accessibility.md](file:///home/reky/se-workspace/design-system-v1/design-system/accessibility.md) |
| writing in-product UI copy, errors, empty states (quick) | [design-system/brand-voice.md](file:///home/reky/se-workspace/design-system-v1/design-system/brand-voice.md) |
| substantial copy — marketing, long-form, headlines, per-audience, pillars, proof, approval | [design-system/copy.md](file:///home/reky/se-workspace/design-system-v1/design-system/copy.md) |
| brand DNA — shape, color treatment, imagery, GAIN, approval filter | [design-system/brand.md](file:///home/reky/se-workspace/design-system-v1/design-system/brand.md) |
| reviewing UI output — anti-slop / brand-fit gate | [design-system/review.md](file:///home/reky/se-workspace/design-system-v1/design-system/review.md) |

## Pre-delivery gate (run before "done")

- [ ] **NN-01…12** all hold.
- [ ] 8 states complete; `data-testid` on interactive elements.
- [ ] a11y pass (`design-system/accessibility.md`); perf budget OK on low-tier Android (`design-system/performance.md`).
- [ ] Copy is real + on-voice (`design-system/brand-voice.md`); tested at **375px**, **reduced-motion**, **dark-mode contrast**.
- [ ] If reviewing: run `design-system/review.md` anti-slop + brand-fit checks.

---
_Solve Education! DESIGN.md · self-contained core index over the `design-system/` modules. Keep token names in sync with the code._
