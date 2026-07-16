# Design Foundations — AI-Literacy Upskilling for Indonesian Teachers

*Design tokens + language system for the mobile-first course + app. A companion to
`SYNTHESIS.md` and `CURRICULUM-MAP.md`, and the intended input to `/draft-spec` (so the SPEC
builds on these, not its own invented styling).*

- **Version:** draft v0, 2026-07-15
- **Grounded in:** `lenses/tokens.md` (benchmark palettes), `lenses/a11y-audit.md` (the
  contrast fails we deliberately fix), `lenses/heuristic-eval.md` (plain language, honesty,
  no clutter), `SYNTHESIS.md` F8 (Bahasa, jenjang/mapel, PD-credential), `CURRICULUM-MAP.md`
  (the win moment, the verify habit, module framing).
- **Status of values:** hex/sizes are a **considered starting point** — confirm on real
  devices and have Bahasa copy reviewed by a native-speaker educator before ship. Items needing
  that are marked **[to validate]**.

## Locked decisions
| Decision | Choice |
|---|---|
| Brand direction | **Calm & credible** — deep-teal primary + warm off-white + amber accent reserved for "win" moments |
| Primary hue | **Deep, serious teal `#0F766E`** |
| Typeface | **Plus Jakarta Sans** (open-source, Jakarta-designed, Latin-extended, subsettable) |
| Register | **"Anda" + colloquial rhythm** (Gojek Mitra pattern; `kamu` considered and rejected 2026-07-15, see §5) |
| Jargon | **Teach real terms, scaffolded** (plain framing → name the term → reuse) |
| Win moment | **Medium** — badge + subtle burst + value line (not confetti, not silent) |
| Component shape | **Pill-first** — pill buttons / text fields / chips / tabs / badges; softly-rounded (xl) cards & sheets |
| Iconography | **SVG icon set (Lucide), never emoji** — outline, 24px grid, `currentColor` |
| Platform | **Mobile-first** — designed at 360–390px portrait; larger screens scale up, they are not the source of truth |
| Dark mode | **In v1** (light is the default; dark is a full peer theme) |
| Illustration | **Clean-neutral UI**; any Indonesian character lives in illustration/examples, not chrome |

---

## 0. Layout & platform — mobile-first (the governing constraint)

The product is designed **on the phone, for the phone**. Every layout decision starts at a
low-end Android in portrait; larger screens are a graceful scale-up, never the reference design.

- **Design canvas:** **360–390px wide, portrait.** If it doesn't work one-handed at 360px in
  daylight, it isn't done.
- **Single column, vertical scroll, content-first.** No multi-column desktop layouts; no
  horizontal scrolling for primary content.
- **Thumb-zone navigation:** a **bottom tab bar** for top-level nav and a **sticky bottom pill
  button** for the screen's primary action (both in the natural thumb reach). Keep destructive
  actions out of the easy-tap zone.
- **One primary action per screen** — reduces cognitive load for a low-confidence teacher (and
  suits the micro-learning unit loop).
- **Forms:** full-width pill inputs, generous vertical spacing, and **bottom-sheet pickers**
  (not top dropdowns) for jenjang/mapel selection.
- **Performance is a design constraint:** flat surfaces, near-zero gradients, subsetted font +
  icons, image-light screens, and **offline-capable** lesson delivery (the F7 spine) — the app
  must load and complete on a patchy, low-bandwidth connection.
- **Orientation:** portrait-first; tolerate landscape but don't optimize for it.
- **Scale-up rule:** on tablet/desktop, cap content width and add whitespace — do **not** invent a
  separate layout. Mobile is the single source of truth.
- **Verify on device:** test at 360px, one-handed, on a real mid/low-end Android in bright light
  (this is also where the a11y reflow gap from the audit gets closed).

---

## 1. Colour tokens (theme-aware)

Every meaning-colour has a **text-safe form** — this is the direct fix for the audit's two
contrast fails (low-contrast gold/grey text). Contrast targets: **body ≥ 7:1** where possible,
**≥ 4.5:1 minimum**; large text / UI components **≥ 3:1**.

### Neutrals & brand
| Semantic token | Light | Dark | Usage / contrast intent |
|---|---|---|---|
| `surface` | `#FBF9F5` | `#16140F` | page background (warm) |
| `surface-alt` | `#F3F0E9` | `#211E18` | sections / wells |
| `card` | `#FFFFFF` | `#262019` | raised content |
| `border` | `#E7E2D8` | `#3A342B` | dividers, inputs |
| `ink` | `#1C1917` | `#F5F1EA` | body + headings (≈15:1 both themes) |
| `ink-muted` | `#57534E` | `#B8B0A4` | secondary text — **≈7:1** (NOT the failing pale grey) |
| `primary` | `#0F766E` | `#2DD4BF` | brand, primary buttons |
| `primary-strong` | `#115E56` | `#5EEAD4` | pressed / heading-on-tint |
| `primary-tint` | `#CCFBF1` | `#0F2E2A` | quiet teal backgrounds |
| `on-primary` | `#FFFFFF` | `#0B1F1C` | text/icon on a primary fill |

*Note:* white-on-`primary` ≈ 4.8:1 (fine for buttons/large; **don't** use `primary` for small body
text on white). In dark mode the primary fill is the lighter teal with dark `on-primary` text.

### Meaning colours (each teaches one thing)
| Token | Light fill / text | Dark fill / text | Appears ONLY on… |
|---|---|---|---|
| `win` | `#F59E0B` / `#B45309` | `#F59E0B` / `#FBBF24` | a **win** — M2 first artifact, streaks, module complete |
| `verify` | `#DBEAFE` / `#1D4ED8` | `#1E3A5F` / `#93C5FD` | a **check-it** cue — the M3 critical-evaluation habit |
| `safe` | — / `#047857` | — / `#34D399` | **privacy-safe / correct** confirmations |
| `danger` | — / `#B91C1C` | — / `#F87171` | a **never-do** — "don't paste student data", real errors |

**Rule:** these hues are semantic, not decorative. Amber never appears except on a win; red never
except on a never-do. Consistent use makes the colour a *learnable signal* (recognition, H6).

---

## 2. Typography — Plus Jakarta Sans

One family; weights **400 / 500 / 600 / 700**, subsetted (Latin + Latin-ext) for bandwidth.

| Token | Size / line | Weight | Usage |
|---|---|---|---|
| `display` | 28 / 34 | 700 | module titles |
| `h1` | 24 / 30 | 700 | screen titles |
| `h2` | 20 / 26 | 600 | section headings |
| `body-lg` | 18 / 28 | 400 | **lesson prose (default reading)** — large for sunlight/low-end screens |
| `body` | 16 / 26 | 400 | UI text (never below 16) |
| `label` | 15 / 20 | 600 | buttons, chips |
| `caption` | 13 / 18 | 500 | metadata (grade/time) |

---

## 3. Spacing, shape, elevation, motion

- **Spacing scale:** `4 · 8 · 12 · 16 · 24 · 32 · 48` (8px base rhythm).
- **Shape language — pill-first.** Interactive **controls are fully pill**; **containers are
  softly rounded** to stay usable while matching the family.

  | Radius token | Value | Applies to |
  |---|---|---|
  | `pill` | 999 | **buttons, text fields, chips, tabs, segmented controls, badges, avatars** |
  | `card` | 20 | cards, list rows, tiles |
  | `sheet` | 24 | modals, bottom sheets |
  | `md` | 12 | inner elements (thumbnails, images inside a card) |
  | `sm` | 8 | tight inline tags / dense metadata |

  - **Pill inputs need breathing room:** text fields/selects get **≥20px horizontal padding** so
    text and placeholder clear the curve; height ≥44px (see below). Icon-only pill buttons become
    **circles** (44×44).
  - **Cards are *not* literal pills** (999px radius would clip rectangular content) — the soft
    `card 20` keeps them recognizably part of the rounded family without breaking layout.
- **Touch targets:** **min 44×44px** (well past the 24px a11y floor — one-handed phone use in the
  field); pill buttons carry **≥16px horizontal padding** around the label.
- **Elevation:** flat by default; a single subtle shadow token `elevation-1`
  (`0 1px 2px rgba(0,0,0,.06)`) for cards. **Near-zero gradients** (perf + contrast; avoids the
  Ruangguru scrim problem).
- **Motion:** default `150–200ms ease-out`; reserved for the **win moment**. Honour
  `prefers-reduced-motion` (see §4).

### Iconography — SVG, not emoji
- **Set:** **Lucide** (open-source ISC, ~1k+ icons, consistent 24px grid) — outline style that
  pairs with Plus Jakarta Sans's humanist tone and the pill-soft shapes. Inline SVG, subsetted to
  the icons actually used (bandwidth).
- **Why not emoji:** emoji render inconsistently across Android versions/vendor fonts (a real risk
  on low-end Indonesian devices), can't inherit theme colour, and vary in size/baseline. SVG is
  crisp, offline, and theme-aware.
- **Style tokens:** default **24px** (dense **20px**); stroke **~1.75px** to match body weight;
  fill/stroke = **`currentColor`** so icons take the text/meaning colour automatically.
- **Meaning pairing:** a meaning-colour icon **always** sits beside a text label (never
  colour-alone) — the icon is the label's partner (H6 / WCAG 1.4.1). Examples: `clock` = time
  saved (win), `shield-check` = privacy-safe, `alert-triangle` = never-do, `circle-check` =
  verified.
- **A11y:** decorative icons `aria-hidden`; meaningful icon-only controls get an accessible name
  and a 44×44 (circular pill) target.

---

## 4. The "win moment" (medium) — the app's key emotional beat (M2)

Triggered on completing the first-win artifact, later module completions, and streak marks.
- **Elements:** an **amber check + subtle particle burst (≤600ms)**, a **completion badge**, and a
  **concrete value line** with a leading SVG `clock` icon (`currentColor`) — e.g.,
  *"Selesai! Anda baru saja menghemat ~40 menit."* (no emoji — SVG only).
- **Not** persistent confetti; **not** silent. One celebratory beat, then out of the way.
- **Colour:** `win` amber only.
- **Reduced-motion fallback:** static badge + value line, no burst (respects a11y 2.3 / motion).
- *Why:* M2 is where a low-confidence teacher's self-efficacy is made or lost (SYNTHESIS F1 /
  Bandura enactive-mastery); the value line ("time saved") makes the win concrete and repeatable.

---

## 5. Language system

### Register — "Anda" + colloquial rhythm (the Gojek Mitra pattern)
Address the teacher as a professional. Warm, concise, never chummy, never corporate.

**Confirmed and sharpened 2026-07-15** by the Gojek voice pass (`platforms/gojek/notes.md`), after a
`kamu` alternative was considered and rejected by the design lead.

Gojek runs **three tones for three audiences**: the consumer app is witty/casual (`kamu`, `-mu`,
`yuk`), while the **driver and merchant partner apps are deliberately more formal and business-like**,
because the relationship is different (their own UX-writing team, [Language No Bar](https://www.gojek.io/blog/language-no-bar-how-we-localise-ux-copies-at-gojek)).
Their live Mitra Driver page shows the exact pattern: **formal pronoun, informal rhythm** —
"sekarang giliran **Anda**!", "**Pilih armada Anda**", yet "Jutaan Mitra Driver **udah** gabung dan
**ningkatin** penghasilannya" and "**Yuk**, dengar cerita dari Mitra".

**The rule:** `Anda` is not a licence to write like a government circular. Keep the respectful
pronoun, then **buy the warmth back** with:
- **particles** — `ya`, `kok`, `aja`, `nih`, `yuk` (one per string at most; never in a warning)
- **short/colloquial verbs** — `bikin`, `pakai`, `ngajar`, `lagi disusun`, `kerjaan`, `cuma`, `buat`
- **questions as headings** — "Anda ngajar di jenjang apa?", "Lagi offline?"
- **reassurance before instruction** — "Lagi offline? Tenang, materi tersimpan tetap bisa dipakai."

`Anda` and `kamu` are **never mixed** for the same reader. One product, one pronoun.

**[to validate]** Whether `kamu` would in fact outperform `Anda` with Indonesian teachers is an open
question — the teacher-as-learner framing (our onboarding copies Duolingo, which uses `kamu`) argues
for it, the teacher-as-professional framing argues against. Not settled by desk research; settle it
with teachers (ties to the F8 primary-research precondition).

### Tone ladder — register is fixed, warmth scales with stakes
Gojek localised the *same* server error as a joke in Bahasa ("Server padat merayap", the phrase for
crawling traffic) but as a **plain apology in Thai**, because Thai users expect the company to own
its fault. Tone follows *who is at fault and what is at stake*, so:

| Stakes | States | Register |
|---|---|---|
| **Low** | offline, empty, loading, progress, wins, onboarding | Warm hybrid. Particle allowed, reassurance first. |
| **Medium** | validation, quality-gate fail, retry | Plain and helpful. No particle, no joke. Say the fix. |
| **High** | PII / student-data warnings (FR-13), privacy rules | **Formal and unadorned. No warmth, no metaphor.** Full `tidak`, never `nggak`. |

When the user can be harmed, wit reads as evasion. The FR-13 callouts are deliberately the coldest
copy in the product; that is a feature, not an oversight.

### Jargon — split by surface (Gojek's "live tracking" lesson)
Gojek dropped the technical term "live tracking" because research showed users called it the
driver's position, and shipped "Posisi driver akurat, kah?". Their user's goal is to get a ride, so
vocabulary is not the product. **Ours is different** — AI vocabulary *is* part of the learning
outcome (F2 fluency ladder). The resolution is a split, not a copy:
- **UI chrome** (buttons, labels, nav, errors) → the **teacher's** word. Never make the interface a
  vocabulary test.
- **Learning content** (units, definitions) → the **real term, scaffolded** (see below).

### Jargon — the scaffolding pattern (learning content)
Pattern: **plain framing → name the term → reuse it bare.**
```
"Tuliskan apa yang Anda butuhkan. Instruksi singkat ini disebut prompt."      (M2, introduce)
"Perbaiki prompt Anda agar hasilnya lebih tepat."                              (M4, reuse)
"Kadang AI menjawab dengan yakin tapi keliru — ini disebut halusinasi.
 Selalu verifikasi sebelum dipakai."                                           (M3)
```
Rationale: the fluency ladder (F2) requires teachers to eventually own the vocabulary to use any
AI tool, so we don't hide it — we scaffold into it. **[to validate: term choices with native-
speaker educators — e.g., keep "prompt" as a loanword vs a Bahasa gloss.]**

### Voice principles (with microcopy)
| Principle | ✅ Do | ❌ Don't |
|---|---|---|
| Peer, not corporate | "Ayo coba dengan materi kelas Anda sendiri." | "Manfaatkan solusi AI mutakhir kami." |
| Fear-reducing (M1) | "AI tidak akan menggantikan Anda — ia mengembalikan waktu Anda." | "Revolusikan pengajaran dengan AI." |
| Honest about cost | "Gratis untuk guru." *(only if true, stated at the decision point)* | "free" framing that later hits a paywall (the benchmark fail) |
| Celebratory on wins | "Selesai! Anda baru saja menghemat ~40 menit." | (silent completion) |
| Privacy in the never-do tone | "Jangan tempelkan data pribadi siswa (nama, nilai) ke AI." | burying it in fine print |

### Anchoring & credential terms (F8)
- Onboard by **jenjang** (PAUD/SD/SMP/SMA/SMK) and **mapel**, in Bahasa, on first contact
  (Ruangguru pattern; heuristic-eval's best H2 example).
- Frame the credential in terms teachers know: **"Sertifikat + Jam PKB"** — not an invented badge
  word. **[to validate: actual PKB/PD-hour recognition attainability — SYNTHESIS F8 precondition.]**

---

## 6. Accessibility guardrails (baked into the tokens, not audited after)
- All text meets **≥4.5:1** (aim **≥7:1** for body); `ink-muted` is deliberately dark enough — the
  fix for the audit's failing greys/gold.
- Meaning is **never colour-alone** (SVG icon + label always accompany a meaning-colour) — H6 / 1.4.1.
- **SVG icons, not emoji** (consistent rendering + theme colour); decorative icons `aria-hidden`,
  meaningful ones get an accessible name.
- **Touch targets ≥44px** (icon-only controls = 44×44 circular pill); visible focus ring token
  (`focus` = 2px `primary` outline + offset), which follows the pill/rounded shape.
- **Body ≥16px**; lesson prose 18px.
- Motion respects `prefers-reduced-motion`.
- Ship-time: run axe + keyboard + screen-reader (TalkBack) + 400%/mobile reflow — the live-only
  checks the audit couldn't cover.

## 7. Illustration & local character
Keep the **UI chrome clean and neutral** (Direction B). Put Indonesian character into
**illustrations, examples, and scenarios** (classroom settings, mapel content, local names in
sample artifacts), never into the core component styling. Avoids Direction C's cultural/political
risk while still feeling built-for-Indonesia.

## 8. Open / to validate
- Exact hex values on real low-end device screens in daylight **[to validate]**.
- Bahasa copy + term choices reviewed by a native-speaker educator **[to validate]**.
- PKB / PD-hour recognition language depends on the F8 recognition precondition **[to validate]**.
- Regional-language support beyond Bahasa: **deferred** (Bahasa is the teacher lingua franca for v1).
- Dark-theme hues are a first pass; verify contrast pairs on device.
