---
name: a11y-audit
description: Accessibility (WCAG 2.2) audit of a benchmark study's captures — what stills can show, honest about what needs live testing. Writes lenses/a11y-audit.md.
---

Run an **accessibility audit** over a benchmark study's captured evidence against **WCAG 2.2**. This is a *captures-based* lens: it judges what screenshots and flows can actually reveal and is explicit about what only live testing can confirm. It never browses the platforms, so it works on a closed study too.

Steps:

1. **Locate the study & confirm it's a benchmark.** If arguments name a folder, use it (a lens may target a **closed** study); otherwise resolve it per `.claude/references/active-research.md` (this terminal's binding, else the sole active study, else ask which study to audit). Read its `README.md` and check `Type`: this lens is **benchmark-only** (it reads `platforms/*/`). If `Type` is `usability` or there's no `platforms/` folder, STOP and say so.

2. **Gather the evidence.** For each `platforms/<platform>/`, list `screenshots/*.png` and note `flow.gif` / `flow.md`. If nothing is captured, STOP.

3. **Assess only what captures can support — and split the report honestly.**

   **Assessable from stills/flows** (do these, citing the specific capture):
   - **Colour contrast (1.4.3 / 1.4.11)** — sample foreground/background pixels from the screenshots and compute the contrast ratio; compare to AA (4.5:1 body text, 3:1 large text & UI components). Use **Pillow** for sampling — write any helper script to the **scratchpad**, never into the research folder — and report the measured ratio + Pass/Fail per sampled pair. Note that pixel-sampled values are approximate (anti-aliasing, compression).
   - **Text sizing / truncation (1.4.4, 1.4.10 reflow signs)** — visibly tiny text, clipped labels.
   - **Target size (2.5.8)** — controls that look below ~24×24 CSS px.
   - **Use of colour alone (1.4.1)** — status/meaning shown only by colour.
   - **Visible labels & instructions (2.4.6, 3.3.2)** — inputs/icons without a visible text label; icon-only controls.
   - **Visible focus indicator (2.4.7)** — only if a capture happens to show focus.
   - **Heading/structure & meaningful sequence (1.3.1, 2.4.6)** — insofar as the visual hierarchy reveals it.

   **Needs live testing — FLAG, never fake a verdict** (2.1.1 keyboard, 4.1.2 name/role/value & ARIA, 2.4.3 focus order, 1.4.13 hover/focus content, 2.2 timing, 2.3 motion, 1.4.10 true reflow at 400% zoom, screen-reader output). List these as **Not assessable from captures** with a one-line note on why.

4. **Write `lenses/a11y-audit.md`** in the study folder (create `lenses/` if absent):
   - `## Overview` — study + goal, platforms audited, standard (WCAG 2.2 AA), and a tally: Pass / Fail / Partial / Not-assessable.
   - One `## <Platform>` section, each with a check table: **Check** · **WCAG SC** · **Verdict** (Pass / Fail / Partial / Not assessable from captures) · **Evidence** (embedded/cited capture; for contrast, the measured ratio) · **Fix note**.
   - `## Not assessable from captures` — the live-only criteria from step 3, so the gaps are explicit rather than silently passed.
   - `## Limits` — restate that a stills audit is a floor, not a certification; recommend a live axe/keyboard/screen-reader pass to complete it.

   **Never invent a Pass.** An unmeasured criterion is *Not assessable*, not a pass. Every verdict traces to a capture or a measured value.

5. **Update the log** in the study `README.md` with a dated "a11y audit run" entry (platforms, Pass/Fail/Partial/Not-assessable tally).

6. **Report**: platforms audited, the clearest failures (esp. measured contrast fails), how much was live-only, and the file path.
