# Accessibility Audit (WCAG 2.2 AA) — AI-Literacy Upskilling for Indonesian Teachers

## Overview

- **Study & goal:** benchmark to ground a mobile-first course + app that builds Indonesian
  teachers' own AI fluency first, then equips them to teach students proper AI use.
- **Platforms audited (6):** MagicSchool AI, Khanmigo, Elements of AI, Common Sense (AI
  Literacy), Google AI Essentials, Ruangguru. **Excluded:** Platform Merdeka Mengajar (no
  screenshots).
- **Standard:** WCAG 2.2 level **AA**.
- **Method:** captures-based. Colour contrast was **measured** by region-sampling foreground/
  background pixels from the screenshots (clustering the dominant background and the most
  contrasting text colour in each region) and computing the WCAG ratio; sampled fg/bg hex is
  reported so each verdict is verifiable. Pixel-sampled ratios are **approximate** (anti-aliasing,
  JPEG/GIF compression, gradients). Non-contrast checks (target size, colour-only meaning, visible
  labels) are judged by visual inspection. Everything else is **live-only** (see the dedicated
  section) and is never given a Pass.

**Tally (assessable checks):**
| Verdict | Count |
|---|---|
| Pass | 10 (contrast) + several structural |
| **Fail** | **2 measured contrast fails** (MagicSchool gold card text; Khanmigo grey tool descriptions) |
| Partial | target size, colour-only selection, placeholder/icon-only labels |
| Not assessable from captures | keyboard, name/role/value, focus order/visibility, reflow at 400%, motion/timing, screen-reader — plus 2 contrast samples that missed their target |

**Headline for our build:** the measured fails are the pattern to *avoid* — **low-contrast
coloured or grey text** (category labels, secondary/meta text). For our learner, often on a
low-end phone in bright outdoor light, contrast is not a nicety; keep all text ≥ 4.5:1.

---

## MagicSchool AI

![tool cards](../platforms/magicschool-ai/screenshots/03-teacher-tools-showcase.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| Heading text on cream | 1.4.3 | **Pass** | dark indigo on cream ≈ **16.8:1** (`05-ai-for-teachers.png`) | — |
| White text on indigo section | 1.4.3 | **Pass** | white on `#301070` ≈ **14.8:1** (`02-built-for-learning.png`) | — |
| Tool-card **category text** (gold "Report Card Comments") | 1.4.3 | **Fail** | gold `≈#C0B050` on light card ≈ **2.19:1** (`03-teacher-tools-showcase.png`) | Darken category text to ≥4.5:1; use the colour only on the icon, keep the label near-black |
| Colour-only meaning (tool categories) | 1.4.1 | **Pass** | each card also has a distinct icon + text label, not colour alone (`03`, `04`) | — |
| Favourite **star icon** (icon-only, ~16px) | 2.4.6 / 2.5.8 | **Partial** | small icon-only control on each card (`03`) | Add a visible/aria label; ensure ≥24×24px target |
| Signup fields labelled by placeholder only | 3.3.2 | **Partial** | Email/Password/Confirm placeholders as sole labels (`flow.md` signup) | Use persistent visible labels, not placeholders alone |

## Khanmigo

![teacher tools](../platforms/khanmigo/screenshots/02-for-teachers-tools.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| Section heading on lavender | 1.4.3 | **Pass** | dark on lavender ≈ **>15:1** (`03-for-learners-socratic.png`; bg cluster spanned lavender→white, still a clear pass) | — |
| **Tool-description grey text** ("Create end-of-lesson assessments") | 1.4.3 | **Fail** | grey `≈#808080` on white ≈ **3.98:1** (`02-for-teachers-tools.png`) | Darken secondary text to ≥4.5:1 |
| Press-quote grey italic on white | 1.4.3 | **Pass** | `≈#404040` on white ≈ **10.5:1** (`01-audiences-and-press.png`) | — |
| "Free" vs paid meaning conveyed in text | 1.4.1 | **Pass** | pricing conveyed by words, not colour (`04`) | (usability concern noted in heuristic-eval, not a11y) |

## Elements of AI

![demystify](../platforms/elements-of-ai/screenshots/01-positioning-demystify.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| Heading black on white | 1.4.3 | **Pass** | ≈ **21:1** (`01-positioning-demystify.png`) | — |
| Serif body on white | 1.4.3 | **Pass** | dark serif on white, high contrast (`01`) | — |
| Partner logos as greyscale | 1.4.11 (non-text) | **Not assessable** | decorative/low-emphasis; too small to sample reliably | — |

> Only the landing was captured (course interior gated), so almost all interaction-level criteria
> are unevaluable for Elements of AI — see the live-only section.

## Common Sense — AI Literacy

![lesson collection](../platforms/common-sense-ai-literacy/screenshots/01-ai-literacy-lessons-collection.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| Collection heading black on white | 1.4.3 | **Pass** | ≈ **17:1** (`01-ai-literacy-lessons-collection.png`) | — |
| Nav white text on green bar | 1.4.3 | **Pass (marginal)** | white on green `≈#208020` ≈ **4.85:1** (`01`) | Only just clears AA; darken the green slightly for headroom |
| Lesson metadata tags (grade/time/format) | 1.4.4 | **Partial** | small tag text; readable but sample not isolated (`01` + `notes.md`) | Confirm tag text ≥ AA on the live page |
| Interstitial popup covering content | 1.4.10 / usability | **Not assessable** (a11y) | Instagram popup overlays content (`01`) | Reflow/close-affordance need live check |

## Google AI Essentials (Coursera)

![course series](../platforms/google-ai-essentials/screenshots/01-specialization-5-courses.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| "Enroll for free" white on blue button | 1.4.3 / 1.4.11 | **Pass** | white on Coursera blue `≈#2870D8` ≈ **5.9:1** (`01-specialization-5-courses.png`) | — |
| Course meta grey ("Course 1 · 1 hour") | 1.4.3 | **Pass** | grey `≈#606060` on white ≈ **6.3:1** (`01`) | — |
| Tabbed nav (About/Outcomes/Courses) structure | 1.3.1 | **Partial** | visual tab structure present; semantics not verifiable from a still (`01`) | Confirm tabs are real ARIA tabs |

## Ruangguru

![onboarding modal](../platforms/ruangguru/screenshots/01-bahasa-onboarding-modal.png)

| Check | WCAG SC | Verdict | Evidence (measured) | Fix note |
|---|---|---|---|---|
| Modal title dark on white | 1.4.3 | **Pass** | ≈ **13.6:1** (`01-bahasa-onboarding-modal.png`) | — |
| Modal subtext grey on white | 1.4.3 | **Not reliably measurable** | region sample missed the grey text (hit a pale-blue gradient → 1.36:1, invalid) | Re-measure on the live page |
| Selected level chip ("SMA") state | 1.4.1 / 1.4.3 | **Not reliably measurable / Partial** | chip-text sample returned uniform (1:1 — missed); selected state appears cued mainly by **blue** vs black text | Ensure the selected chip is distinguished by more than colour (e.g., fill + check) and its text ≥4.5:1 |
| Modal ✕ close (icon-only, small) | 2.5.8 / 2.4.6 | **Partial** | small icon-only control (`01`) | Ensure ≥24×24px + accessible name |
| Promo clutter density | 1.4.10 | **Not assessable** | banner + badge + modal stack; reflow behaviour unknown | Live check |

---

## Not assessable from captures (live-only — flagged, never passed)

These WCAG 2.2 criteria **cannot be judged from static marketing stills** and require live use,
a keyboard, a screen reader, and zoom testing. They are explicitly *unknown* here, not passes:

- **2.1.1 Keyboard / 2.1.2 No keyboard trap** — no keyboard interaction observable.
- **2.4.3 Focus order & 2.4.7 Focus visible / 2.4.11 Focus not obscured** — no focus states were
  captured for any platform.
- **4.1.2 Name, Role, Value / 1.3.1 semantics** — ARIA roles, labels, and programmatic structure
  are invisible in a screenshot (only visual hierarchy hints).
- **1.4.10 Reflow at 400% / mobile** — captures are **desktop-width**; despite the mobile-first
  goal, no mobile-viewport captures exist, so reflow and small-screen behaviour are unknown for
  every core platform (a key gap given our learner is on a phone).
- **1.4.13 Content on hover/focus** — tooltips/menus not exercised.
- **2.2.1/2.2.2 Timing & moving content, 2.3.1 flashes** — the marketing `flow.gif` animations are
  scroll captures, not product motion; real timing/auto-advance behaviour unknown.
- **1.4.12 Text spacing, 3.3.x input assistance/errors** — form validation and error messaging not
  captured (no error states anywhere).
- **Screen-reader output** — entirely unverifiable from images.
- Plus the **2 contrast samples that missed their target** (Ruangguru subtext & chip) — re-measure
  on the live pages.

## Limits

- **A stills audit is a floor, not a certification.** It can catch clear contrast and
  visible-label problems but cannot confirm keyboard, screen-reader, focus, or reflow conformance.
- **Contrast ratios are pixel-approximations** (quantized, compression-affected, gradient
  backgrounds); treat the two fails as strong signals to re-verify with a browser inspector, and
  the marginal pass (Common Sense nav, 4.85:1) as "verify on live."
- **Single-screenshot platforms** (Elements of AI, Common Sense, Google, Ruangguru) expose only a
  sliver of each product; absence of a finding is not conformance.
- **No mobile-viewport evidence** for any core platform — the most important a11y unknown given
  the mobile-first, low-bandwidth Indonesian context.
- **Recommended next step:** a live pass with **axe DevTools + keyboard-only navigation + a screen
  reader (NVDA/TalkBack) + 400%/mobile reflow** on each platform to complete the audit. For *our*
  build, bake these into the design system from day one rather than auditing after.
