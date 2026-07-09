# Patterns — interaction, motion, forms, navigation, data-viz

> Loaded per task area. Jump to the tagged section: **INT · MOT · FRM · NAV · VIZ**.
> Token VALUES → `tokens.md`. Component states → `components.md`. A11y detail → `accessibility.md`.

---

## INT · Interaction & touch

- **INT-01** Touch targets ≥ 44×44px, ≥ 8px apart; expand hit area for small icons.
- **INT-02** Visual feedback within ~100ms of tap; pressed state on every tappable element.
- **INT-03** Don't rely on hover for essential info — hover is enhancement only (touch devices).
- **INT-04** `touch-action: manipulation` to drop the 300ms tap delay.
- **INT-05** Respect safe areas (notch / Dynamic Island / home indicator); don't place CTAs under OS chrome.
- **INT-06** One primary gesture per region; avoid nested tap/drag conflicts; don't block system gestures (back-swipe).

---

## MOT · Motion & animation

- **MOT-01** Duration 150–300ms (`motion-fast/base/slow`); ≤400ms for complex; never >500ms for UI.
- **MOT-02** Ease-out entering, ease-in exiting; exit ≈ 60–70% of enter. No `linear` for UI transitions.
- **MOT-03** Animate `transform`/`opacity` only — never `width/height/top/left` (causes reflow/CLS).
- **MOT-04** ≤ 2 key elements animated per view; motion must express cause→effect, not decorate.
- **MOT-05** Loading > 300ms → skeleton/spinner (`StateView` / `Progress`), never a frozen blank UI.
- **MOT-06** All motion respects `prefers-reduced-motion` (enforced globally). Animations stay interruptible; never block input.
- **MOT-07** Modals/sheets animate from their trigger/source (scale+fade or slide); forward = left/up, back = right/down.

---

## FRM · Forms & feedback

- **FRM-01** Visible label per input — never placeholder-only.
- **FRM-02** Required fields: visible `*` (aria-hidden) + `aria-required` on the control. Standardize in `TextField`; don't hand-roll.
- **FRM-03** Validate on **blur**, not per keystroke. Error shown **directly below** the field.
- **FRM-04** Errors announced: `role="alert"` / `aria-live` (red border alone is insufficient).
- **FRM-05** Error text = **cause + fix**, with a recovery path (retry/edit/help). Never bare "Invalid input".
- **FRM-06** Submit: loading → success/error; disable the button while submitting.
- **FRM-07** Multiple errors: summary at top with anchors; auto-focus first invalid field.
- **FRM-08** Semantic input types (`email/tel/number`) + `autoComplete`; password fields get show/hide toggle.
- **FRM-09** Empty states use `StateView` — encouraging message + next action.
- **FRM-10** Long forms auto-save drafts; confirm before dismissing a sheet/modal with unsaved changes.
- **FRM-11** Use `ValidationRuleList` for live rule checklists (e.g. password rules).
- **FRM-12** Mobile input height ≥ 44px (touch target).

---

## NAV · Navigation

- **NAV-01** Active location always visible (color/weight/indicator) in `AppBar`/`BottomNavigation`/`Tabs`.
- **NAV-02** Bottom navigation ≤ 5 items, top-level destinations only, icon **+** text label. Never nest sub-nav inside it.
- **NAV-03** Predictable back — preserve history, scroll, filter/input state; never silently reset the stack.
- **NAV-04** Sticky `AppBar` reserves content offset; pair with `scroll-padding-top` so keyboard focus isn't obscured (WCAG 2.4.11).
- **NAV-05** `SideNavigation`/drawer for secondary nav; ≥1024px may prefer sidebar, small screens use bottom/top nav.
- **NAV-06** Deep-linking: every key screen reachable by URL.
- **NAV-07** Modals are **not** navigation — `Dialog` for focused tasks; clear close affordance + Escape; swipe-down on mobile sheets.
- **NAV-08** Consistent nav placement across pages; don't mix tab + sidebar + bottom nav at one hierarchy level.
- **NAV-09** Dangerous actions (logout, delete) visually + spatially separated from normal nav items.

---

## VIZ · Data visualization

For learning charts (skill radar, score ring, progress/comparison bars):

- **VIZ-01** A11y: decorative layers `aria-hidden`; meaningful charts use `role="img"` + descriptive `aria-label` summarizing the insight (e.g. `"Score: 72%"`). Provide a table/text alternative.
- **VIZ-02** Never color-only: add labels/patterns/shapes; avoid red/green-only pairs (colorblind).
- **VIZ-03** Contrast: data marks vs bg ≥ 3:1; data text labels ≥ 4.5:1; gridlines low-contrast (`neutral-200`).
- **VIZ-04** Match type to data: trend → line · comparison → bar · proportion → ≤5-slice donut (else bar) · multi-axis competency → radar.
- **VIZ-05** States: empty ("No data yet" + guidance) · loading (skeleton, not empty axis) · error (message + retry). Never a broken/blank chart.
- **VIZ-06** Direct-label small datasets; tooltips on tap (mobile) with ≥44pt tap area; locale-aware numbers.
- **VIZ-07** Responsive: simplify on small screens (fewer ticks, horizontal bars); entrance animation respects reduced-motion; data readable immediately.
