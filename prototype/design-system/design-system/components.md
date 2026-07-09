# Components — catalog & state model

> Loaded when building or using a component. Token VALUES → `tokens.md`. Behavioral rules → `patterns.md`.

## CMP · Component library

Import from the design-system barrel (`@/core/design-system` or project equivalent). Each component ships
a Storybook story and (where it has contracts) a test. Prefer `App*` wrappers over bare shadcn primitives.

| Category | Components |
|---|---|
| Layout / surfaces | `AppPage`, `AppSection`, `Card` (+ `Header/Content/Footer/Title/Description`), `FeatureCard`, `PathCard`, `HeroBanner` |
| Navigation | `AppBar`, `BottomNavigation`, `SideNavigation`, `Tabs`, `Pagination`, `Stepper` |
| Inputs / forms | `TextField`, `Textarea`, `Label`, `Dropdown`, `CountryDropdown`, `OptionTile`, `ValidationRuleList`, `Command` |
| Actions | `Button` — variants `primary · secondary · outline · ghost · floating · destructive` × sizes `sm · md · lg` |
| Display | `Avatar`, `Image`, `Badge`, `Chip`, `Progress` |
| Feedback / overlay | `Alert`, `Dialog`, `Popover`, `StateView` (empty / loading / error) |

- **CMP-01** Reuse before building. Never duplicate an existing primitive in feature code.
- **CMP-02** New shared UI lives in the design-system module with a colocated story (+ test if it has contracts).
- **CMP-03** Compose from primitives; keep feature components thin.

## CMP · Required state model (every interactive component — all 8)

| State | Requirement |
|---|---|
| **Default** | On-token colors + correct typography token |
| **Hover** (web) | Subtle bg/elevation change + `cursor-pointer`; ~150ms (`motion-fast`) |
| **Focus-visible** | Visible ring (`--ring` yellow), 2–4px — **never remove** |
| **Pressed/active** | Slight feedback (600-step token / scale 0.95–1.05), **no layout shift** |
| **Disabled** | Reduced opacity + `cursor-not-allowed` + `disabled`/`aria-disabled`; not tappable |
| **Loading** | Buttons: spinner + disabled · Surfaces: skeleton via `StateView` |
| **Error** | Error styling + message; `aria-invalid` / `role="alert"` (see FRM-04) |
| **Empty** | `StateView` — encouraging message + next action (see FRM-09 / VOX-07) |

- **CMP-04** A clickable element with no hover **and** no focus feedback is a defect.
- **CMP-05** Press feedback must not shift surrounding layout (use transform/opacity/elevation).
- **CMP-06** Disabled state needs all three: visual (opacity), affordance (`cursor-not-allowed`), semantic (`aria-disabled`/`disabled`).
- **CMP-07** `data-testid` on every interactive element (NN-08).

## CMP · Button shape & color hierarchy

- **CMP-08** Buttons are **pill-shaped** — `--radius-full`, not the standard component radius. Applies to all variants and sizes, including icon-only buttons (which render as circles).
- **CMP-09** `primary` = solid `--primary` (yellow) fill + `--primary-foreground` text (dark, never white — CLR-05). Reserved for the **single main CTA per screen** (CLR-03). Never pink `--accent` — accent is the reward/celebration color for non-button surfaces.
- **CMP-10** `outline` = transparent fill, `--foreground`/`--border` outline, `--foreground` text. Use for the **secondary action paired with a primary CTA** (e.g. an alternate sign-in path, "not now"). Never a second filled button competing with the primary.
- **CMP-11** `ghost` = no fill, no border — tertiary actions and nav-level links only (e.g. `Masuk` in the header).
- **CMP-12** `destructive` = solid `--destructive` fill — irreversible/dangerous actions only; keep rare.

## CMP · TextField shape & color

- **CMP-13** Text inputs are **pill-shaped** — `--radius-full`, same as buttons (CMP-08). Use generous horizontal padding (`space-5`+) so typed text and placeholders don't crowd the rounded ends.
- **CMP-14** Only two accent hues signal field state: `--primary` (yellow) for interactive states — hover, focus-visible, pressed — and `--destructive` (red) for error. Never `--secondary` (blue) as a field border; blue is reserved for Ed/info surfaces, not form validation. Background stays `--card` and typed text stays `--foreground` in **every** state, including disabled — disabled signals via reduced opacity, not a background-color change.
- **CMP-15** Icons/controls overlaid inside a field (validation icon, loading spinner, password-visibility toggle) are absolutely positioned with explicit `top: 50%; transform: translateY(-50%)` — flexbox `align-items: center` does not reach absolutely positioned children, so omitting this leaves the icon's vertical position to chance. Non-interactive overlay icons also need `pointer-events: none` so they never intercept clicks meant for the input.

## CMP · OptionTile anatomy

Follows the canonical tile pattern (pattern ref: [mobbin.com/glossary/tile](https://mobbin.com/glossary/tile)): container · selection indicator · icon (optional) · label · description.

- **CMP-16** Layout is a horizontal row: optional leading icon → label+description stack → trailing selection indicator. Not a vertical icon-on-top stack.
- **CMP-17** Single-select contexts (goal picker, lesson answers) get a **persistent radio indicator** — visible as an empty ring in every state, not only once selected. A checkmark that only appears on selection gives no upfront affordance that the tile is selectable; the empty ring does.
- **CMP-18** Indicator fills `--accent` when selected; fills `--destructive` when error (a wrong-answer tile reads as "you picked this and it's wrong," not merely "unselected with a red border").
- **CMP-19** The leading icon is optional — omit the slot entirely for text-only options rather than leaving an empty placeholder.

## CMP · Component-driving pattern (recommended)

Drive interactive state colors via CSS variables, expose a `loading` prop:

```
--button-bg / --button-bg-hover / --button-bg-active / --button-fg / --button-focus-ring
```

This keeps variants declarative and states consistent. Reuse the pattern for new interactive components
(chips, tiles, nav items) rather than hardcoding per-state classes.
