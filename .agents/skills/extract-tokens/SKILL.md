---
name: extract-tokens
description: Extract inferred design tokens (colour, type, spacing) from a benchmark study's screenshots into lenses/tokens.md — pixel-inferred, flagged for validation.
---

Extract a first-pass **design-token set** — colour, typography, spacing, radius, elevation — from a benchmark study's captured screenshots. These tokens are **inferred from pixels**, not read from the platform's real CSS, so the output is a *starting point to validate*, never a source of truth. Captures-based lens; it never browses the platforms and works on a closed study.

Steps:

1. **Locate the study & confirm it's a benchmark.** If arguments name a folder, use it (a lens may target a **closed** study); otherwise resolve it per `.claude/references/active-research.md` (this terminal's binding, else the sole active study, else ask). Read `README.md`, check `Type`: this lens is **benchmark-only** (it reads `platforms/*/screenshots/`). If `Type` is `usability` or there's no `platforms/` folder, STOP and say so. If the study has more than one platform, extract tokens **per platform** (design systems don't merge) — one section each; do not blend palettes across products.

2. **Gather the screenshots.** List `platforms/<platform>/screenshots/*.png`. If none, STOP — there are no pixels to sample.

3. **Sample the tokens with Pillow.** Write any helper script to the **scratchpad** (never into the research folder). Using `Pillow` (the only image lib available — no ffmpeg/ImageMagick):
   - **Colour** — sample recurring colours across the screenshots (quantize to a small palette per image, then reconcile across images). Capture hex values and assign **semantic roles you can justify from what the pixel is used for** in the capture (brand/primary, surface/background, text, muted, success, warning, danger, accent). Cite the screenshot each colour came from.
   - **Typography** — infer a type scale (display / heading / body / caption) from the relative text sizes and weights visible; give approximate px sizes and note these are estimates.
   - **Spacing & radius** — the observable spacing rhythm (e.g. 4/8px feel), corner radius, and any consistent elevation/shadow.
   - **Components** — notable component-level tokens (button height/shape, chip, card padding) where a capture shows them clearly.

4. **Write `lenses/tokens.md`** in the study folder (create `lenses/` if absent):
   - `## Overview` — study, platform(s), method (pixel-sampled via Pillow), and the **validation caveat** up top: *these are inferred approximations; confirm against the platform's real CSS / a colour picker / a design tool before any reuse.*
   - One `## <Platform>` section, each with tables: **Colour** (Token · Hex · Role · Source screenshot), **Type scale** (Token · ~Size/Weight · Usage), **Spacing & radius**, **Components**. Embed a representative screenshot per platform.
   - Optionally also emit a `lenses/<platform>-tokens.json` starter (primitive → semantic) mirroring the colour + type tables, for hand-off — clearly marked *draft, unvalidated*.
   - `## Limits` — pixel sampling drifts from true CSS (anti-aliasing, compression, gradients, opacity); type sizes are eyeballed; nothing here reflects state variants, dark mode, or tokens not visible in a capture.

   **Only record a token you can point to in a screenshot.** Do not invent a palette or a scale to look complete.

5. **Update the log** in the study `README.md` with a dated "tokens extracted" entry (platforms, colour count).

6. **Report**: platforms processed, the core palette (hex) and type scale per platform, the file path(s), and a reminder that the set is unvalidated.
