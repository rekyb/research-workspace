# Design Tokens (inferred) — AI-Literacy Upskilling for Indonesian Teachers

## Overview

- **Study:** `2026-07-14-ai-literacy-upskilling-indonesian-teachers` (benchmark).
- **Platforms processed (6):** MagicSchool AI, Khanmigo, Elements of AI, Common Sense (AI
  Literacy), Google AI Essentials, Ruangguru. **Excluded:** Platform Merdeka Mengajar
  (context-only, no screenshots to sample).
- **Method:** pixel-sampled from `platforms/*/screenshots/*.png` via **.NET `System.Drawing`**
  (Pillow is not available in this environment). Each platform's screenshots were
  nearest-neighbour downsampled (to preserve true pixel colours), histogrammed, and the most
  frequent colours reconciled across images and assigned semantic roles from *what the pixel is
  used for* in the capture.

> ⚠ **Validation caveat — read first.** These tokens are **inferred approximations from
> compressed marketing screenshots, not the platforms' real CSS.** Hex values drift from source
> (anti-aliasing, JPEG/GIF compression, gradients, opacity), type sizes are **eyeballed**, and
> small-area brand colours (CTA buttons) often do not surface in a histogram, so those are marked
> **[eyeballed]**. Treat everything here as a *starting point to confirm* with a colour picker /
> the real stylesheet / a design tool before any reuse. Design systems don't merge, one section
> per platform; do not blend palettes across products.

Design systems here split into two visual families worth noting for our own design: **warm,
rounded, high-chroma** consumer-friendly brands (MagicSchool purple-on-cream; Ruangguru
teal/orange) vs **clean, near-monochrome, text-first** course brands (Elements of AI, Google/
Coursera). Our low-bandwidth, low-confidence Indonesian teacher likely reads the warm-rounded
family as more approachable, and the text-first family as more trustworthy/serious — a tension
to resolve in our own token set.

---

## MagicSchool AI

![MagicSchool hero](../platforms/magicschool-ai/screenshots/01-hero-positioning.png)

**Signature:** deep-purple brand on a warm cream canvas, with pastel per-tool accent colours.

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface / canvas (cream) | `#FFFFF0` | dominant background (hero, nav) — 33% of pixels | 01-hero-positioning |
| surface-alt (pale cream) | `#FFF8D8` | secondary warm background | 01, 05 |
| surface (white) | `#FFFFFF` | tool cards, panels | 03-teacher-tools-showcase |
| brand / primary-dark (indigo) | `#301070` | dark section + heading ink — 15% of pixels | 02-built-for-learning |
| brand / primary (vivid purple) | `#7828F8` | logo, decorative stars, CTA | 03, 04-tools-and-ai-tutor |
| brand / primary-light | `#8840E0` | lighter purple accents | 02, 03 |
| surface-tint (lavender) | `#E8E0FF` | tinted panels | 03 |
| gradient accent (mauve) | `#B868A0` | hero gradient midtone | 01 |
| accent (coral/orange) | `[eyeballed]` warm orange | hero "sun", some tool icons (small area, not histogram-surfaced) | 01, 03 |
| tool-category pastels | `[eyeballed]` green/yellow/pink | per-tool card icons (Idea=green, Report Card=yellow, Quiz=orange) | 03 |

Text/ink reads as the deep indigo `#301070` for headings and near-black for body.

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| display | ~64–72px, bold, rounded sans | hero "Find your 'wow!'" |
| h2 | ~40px, bold | section headings ("Amplify educator impact") |
| body | ~18px, regular | paragraph copy |
| nav / label | ~16px, medium | nav items, buttons |

Typeface reads as a **rounded geometric sans** (friendly, high x-height).

### Spacing & radius
- Generous vertical rhythm; feels like an **8px** base scale.
- **Pill / heavily-rounded buttons** (~8–12px radius); **rounded cards** (~16px); rounded tool
  tiles with icon + title + one-line description.

### Components
- **CTA buttons:** cream-outline and solid-purple pill variants ("Free for teachers", "Get in
  touch"). Tool cards: coloured icon + bold title + muted one-line description.

---

## Khanmigo

![Khanmigo learner section](../platforms/khanmigo/screenshots/03-for-learners-socratic.png)

**Signature:** Khan blue CTAs on a soft lavender/white canvas, warm-cream secondary sections.

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface (white) | `#FFFFFF` | dominant background — 66% of pixels | 02-for-teachers-tools |
| surface-alt (lavender) | `#E0D8F8` | hero / learner section background | 01-audiences-and-press, 03-for-learners-socratic |
| surface-alt2 (warm cream) | `#F8F0E0` | "Turn homework" / parent section | 04-for-parents-tutor |
| text / ink | `#303030` (→ `#000000`) | body + headings | all |
| brand deep-purple | `#602060` | Khanmigo logo + "Tutor Me" chat header | 04-for-parents-tutor |
| tint (pink) | `#F8E0FF` | soft decorative tint | 03 |
| primary / CTA (Khan blue) | `#1865F2` **[eyeballed]** | "Sign up for free" / "Get Khanmigo" buttons (small area — not histogram-surfaced) | 01, 03, 04 |

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| display | ~48px, regular/medium | hero ("always-available …") |
| h2 | ~40px, bold | section headings |
| body | ~18–20px, regular | paragraph copy |
| label | ~16px, medium | nav, buttons |

Rounded sans; the wordmark uses a custom rounded display face.

### Spacing & radius
- ~8px base rhythm; **rounded buttons (~8px)**, rounded cards, and fully-rounded **chat bubbles**.

### Components
- Solid-blue rounded **CTA buttons**; three audience columns; tool cards ("Exit tickets",
  "Lesson plan"); conversational chat-bubble mockups.

---

## Elements of AI

![Elements of AI positioning](../platforms/elements-of-ai/screenshots/01-positioning-demystify.png)

**Signature:** near-monochrome, editorial, text-first. Almost no chrome.

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface (white) | `#FFFFFF` | background — 92% of pixels | 01-positioning-demystify |
| text / ink | `#303030` (→ `#000000`) | headings + body | 01 |
| muted / grey | `#C0C0C0`–`#F0F0F0` | partner logos, dividers, secondary text | 01 |
| brand (indigo dot) | `~#4B3FBE` **[eyeballed]** | the "Elements of AI" dot logo (tiny) | 01 |
| accent (mint/teal) | `~#3DD6B0` **[eyeballed]** | "Allow cookies" button (not in captured frame's top palette) | (landing, from capture session) |

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| display | ~44–56px, bold sans | "Our goal is to demystify AI" |
| body | ~20px, **serif** | paragraph copy (reads as a serif — Georgia-like) |
| nav | ~16px, regular sans | top nav |

Notable: **bold sans headings + serif body** — an editorial pairing that signals "course/read",
not "app".

### Spacing & radius
- Very airy, large whitespace margins; buttons are near-rectangular with a **small radius (~4px)**.

### Components
- Minimal: text blocks, a thin top nav, plain rectangular buttons, greyscale partner logos.

---

## Common Sense — AI Literacy

![Common Sense lesson collection](../platforms/common-sense-ai-literacy/screenshots/01-ai-literacy-lessons-collection.png)

**Signature:** Common Sense green brand + an indigo call-to-action, on white / pale-blue.

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface (white) | `#FFFFFF` | background — 38% | 01-ai-literacy-lessons-collection |
| surface-alt (pale blue) | `#F0F8FF` | page tint / content band | 01 |
| brand / primary (green) | `#188020` (dark) / `#30A040` (bright) | top nav bar + brand | 01 |
| action / accent (indigo) | `#4040E0` | "Register" button + privacy banner | 01 |
| text / ink | `#282830` | headings + body | 01 |
| teal (logo) | `#387078` | logo mark / secondary | 01 |

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| h1 | ~40px, bold | "AI Literacy Lessons for Grades 6–12" |
| h3 | ~20px, bold | lesson titles |
| body | ~16px, regular | descriptions |
| meta | ~13px, medium | grade/time/format tags |

### Spacing & radius
- ~8px rhythm; **pill "Register" button** (~20px radius); lesson rows as list cards.

### Components
- Green top nav; pill primary button; **lesson-list rows** (title + one-line + grade/time/format
  metadata) — a clean model for a "grab-and-go lesson library" UI.

---

## Google AI Essentials (on Coursera)

![Google AI Essentials course series](../platforms/google-ai-essentials/screenshots/01-specialization-5-courses.png)

**Signature:** Coursera blue on a clean white, near-monochrome, credential-forward.

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface (white) | `#FFFFFF` | background — 85% | 01-specialization-5-courses |
| muted / border grey | `#E8E8E8`–`#F0F0F0` | card borders, dividers | 01 |
| primary / CTA (Coursera blue) | `#2870D8` | "Enroll for free", links, tab underline | 01 |
| muted text (grey) | `#909098` | secondary/meta text | 01 |
| tint (pale blue) | `#D0E0FF` / `#D8E0F0` | subtle blue tints | 01 |
| text / ink | `~#1F1F1F` **[eyeballed]** | headings + body (dark, small-area) | 01 |
| Google brand multicolour | `[eyeballed]` red/yellow/green/blue | "G" logo (tiny) | 01 |

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| h1 | ~28–32px, bold | "Specialization - 5 course series" |
| h3 | ~20px, medium | course titles ("Introduction to AI") |
| body | ~16px, regular | descriptions |
| meta | ~14px, regular | "Course 1 • 1 hour" |

Humanist sans (Coursera's "Source Sans"-style).

### Spacing & radius
- ~8px rhythm; **cards with ~8px radius**; solid-blue rounded CTA button.

### Components
- Solid-blue **"Enroll for free"** button; **course accordion cards** (thumbnail + title +
  duration); instructor card. A clean model for a "course syllabus" screen.

---

## Ruangguru

![Ruangguru Bahasa onboarding modal](../platforms/ruangguru/screenshots/01-bahasa-onboarding-modal.png)

**Signature:** teal→blue brand gradient, orange primary CTA, white modal — the most localized,
consumer-playful palette. **⚠ This capture has a dark modal scrim over the hero, so the sampled
background colours are darkened/desaturated and especially unreliable here.**

### Colour
| Token | Hex | Role | Source screenshot |
|---|---|---|---|
| surface (white) | `#FFFFFF` | onboarding modal | 01-bahasa-onboarding-modal |
| brand / primary (teal-blue) | `#307070` / `#005890` | hero gradient + brand (darkened by the scrim; true colour is brighter) | 01 |
| brand deep-blue | `#086088` / `#005898` | gradient end / selected chip ("SMA") | 01 |
| dark banner (navy) | `#080820` | top promo banner | 01 |
| text / ink | `#282828` | modal text | 01 |
| tint (pale blue) | `#E0F0F8` | light surface tint | 01 |
| **scrim / overlay** | `#909098`–`#989898` | **modal dimming layer, NOT a brand token** (~16% of pixels) | 01 |
| primary CTA (orange) | `~#F5A623` **[eyeballed]** | "Klaim Sekarang" promo button (small area) | 01 |

### Type scale (estimates)
| Token | ~Size / weight | Usage |
|---|---|---|
| h2 | ~32–40px, bold | hero headline ("Bimbel Online …") |
| modal-title | ~22px, bold | "Selamat datang di Ruangguru!" |
| body | ~16px, regular | modal copy |
| chip | ~16px, medium | level selectors (PAUD/SD/SMP/SMA) |

Rounded sans.

### Spacing & radius
- ~8px rhythm; **strongly rounded**: pill level-chips (~24px), rounded modal (~16px), rounded
  input field with "+62" prefix.

### Components
- **Level-select chips** (jenjang PAUD→SMA, selected = blue outline/fill); rounded phone-input;
  orange promo CTA. This chip-based **segment-by-level onboarding** is the reusable pattern
  (see SYNTHESIS F8), not the exact colours.

---

## Limits

- **Pixel sampling drifts from true CSS:** anti-aliasing, JPEG/GIF compression, gradients, and
  layer opacity all shift hex; values are quantized to the nearest 8 per channel.
- **Type sizes are eyeballed** from relative on-screen size, not measured; weights are inferred.
- **Small-area brand colours don't surface in a histogram** — CTA/button colours (Khan blue,
  Coursera blue, Ruangguru orange, Elements of AI indigo/teal) are marked **[eyeballed]** and are
  the least reliable entries here.
- **Ruangguru's palette is compromised by a modal scrim** in its only capture (background colours
  darkened; the grey is the overlay, not a brand token).
- **No state, mode, or hidden tokens:** nothing here reflects hover/active/disabled states, dark
  mode, focus rings, or any token not visible in a static marketing capture.
- **Single-screenshot platforms** (Elements of AI, Common Sense, Google, Ruangguru) yield a
  narrow palette by definition — absence of a colour here is not evidence the brand lacks it.
- These are **inferred approximations, not a source of truth.** Confirm against the real
  stylesheet / a colour picker before any reuse.
