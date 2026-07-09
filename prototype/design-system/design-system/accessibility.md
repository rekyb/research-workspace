# Accessibility — WCAG 2.1 AA + 2.2 AA

> Loaded for a11y work or audits. Target: WCAG 2.1 AA baseline + 2.2 AA deltas.

## A11Y · Built into the system

- **A11Y-01** Focus not obscured (2.4.11): `html { scroll-padding-top: 5rem }` keeps keyboard focus clear of the sticky `AppBar`.
- **A11Y-02** Focus ring = primary yellow `--ring`; visible focus is a first-class token — **never remove it**.
- **A11Y-03** Reduced motion: `@media (prefers-reduced-motion: reduce)` zeroes durations + disables smooth scroll.
- **A11Y-04** Labels/Instructions (3.3.2): visible `*` + `aria-required` on required inputs.
- **A11Y-05** Identify Input Purpose (1.3.5): fields carry `name` + `autoComplete`.

## A11Y · Conventions (apply when building)

- **A11Y-06** Contrast: body ≥ 4.5:1, large/non-text ≥ 3:1. Use `*-700` steps for colored text.
- **A11Y-07** Color is never the only signal — pair with icon/text. (See CLR-04.)
- **A11Y-08** Heading order sequential `h1 → h2 → h3`, no skips; one `h1` per page.
- **A11Y-09** Decorative SVG `aria-hidden`; informative SVG `role="img"` + `aria-label`.
- **A11Y-10** Keyboard: tab order = visual order; full operability; modals trap focus + Escape closes.
- **A11Y-11** Move focus to main content region on route change (SPA).
- **A11Y-12** Icon-only controls need `aria-label`; form errors use `role="alert"`/`aria-live`; toasts `aria-live="polite"` (don't steal focus).
- **A11Y-13** Support dynamic text scaling without truncation/overlap.

## A11Y · Enforcement (recommended toolchain)

- `jsx-a11y/recommended` ESLint gate · `jest-axe` unit checks.
- Playwright a11y spec over the core journey (`/`, `/onboarding`, `/dashboard`, `/learn`, `/me`, `/prove`), tags `wcag2a wcag2aa wcag22aa`.
- Track any deferred violations (with reason + priority) in this module so they stay visible.
