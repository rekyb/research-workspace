# Review gate — anti-slop · tokens · a11y · brand fit

> Load when **reviewing** UI output. Report in this order: (1) findings, (2) checks passed/failed,
> (3) exceptions + whether justified. If multiple checks fail, revise/regenerate before approval.

## REV · Anti-slop (reject or revise)
- [ ] Generic hero-metric dashboard (giant number + small label + supporting stats + gradient).
- [ ] Dark-neon or light-neon enterprise-dashboard styling.
- [ ] Card-grid repetition with no information-hierarchy reason (consider list / table / timeline / single-focus).
- [ ] Default SaaS copy ("Welcome back", "Get started", "Powered by AI").
- [ ] AI-hivemind reflexes: Inter/Roboto-default look, neon-on-navy, rounded-icon-over-every-heading, generic spinner, subtle-gradient + frosted-blur, 4px-radius-on-everything.
- [ ] Visual choices that ignore Solve's warmer, human, curved brand.

## REV · Token & implementation
- [ ] No hardcoded hex/rgb where tokens exist (NN-01); no raw px spacing/radius without justification.
- [ ] Typography stays on the scale (TYP-*); nothing bypasses the design system without a stated reason.
- [ ] `data-testid` on interactive elements (NN-08); `App*` wrappers preferred (NN-02).

## REV · Accessibility
- [ ] WCAG AA contrast met or flagged for follow-up (A11Y-*); touch targets ≥ 44px; focus-visible rings intact.
- [ ] All **8 states** considered (NN-03); reduced-motion fallback present where motion is used.

## REV · Brand fit
- [ ] Human + optimistic, not corporate/hostile; curved/active/learner-centered.
- [ ] One dominant color per surface + solid fills (NN-09); curves over angles (NN-10).
- [ ] Copy on-voice, real strings, sentence case (VOX-*); no placeholders presented as validated facts.
- [ ] Approval filter passes (`design-system/brand.md` → BRD approval filter).
