<!-- Extracted verbatim from the Claude Design Prompt Pack for use by /design-prototype. Product-agnostic methodology; safe to commit. -->

# Claude Design Prompt Pack — Production-Ready App Standard

Goal: consistent · integrated · wired-in · smooth flows · meaningful everywhere · pixel-perfect · world-class · loved.
Usage: prompts are copy-paste verbatim. `{placeholders}` are yours to fill. Run categories in order for a new build; run 3–13 as standalone gates on existing work.

---

## 0. Session Opener (run first, every session)

**0.1 Context lock**
```
Before designing anything, load and restate my constraints:
1. Design tokens: use ONLY the tokens in {tokens file / skill name}. No invented colors, sizes, or shadows.
2. Reference screens: match the structure, density, and spacing rhythm of {reference/screen.tsx} exactly.
3. Stack: {Next.js + Tailwind + shadcn / etc}. Output must be drop-in code, not pseudo-design.
4. Users: {persona, device, context of use}.
Confirm each in one line. If any is missing, ask — do not guess.
```

**0.2 Definition of Done (paste once, reference forever)**
```
For this project, "done" means every screen passes ALL gates:
G1 Tokens only, zero hardcoded values
G2 Every interactive element has hover, focus-visible, active, disabled
G3 Every data view has loading, empty, error, and long-content states
G4 Every screen is reachable and exitable — no dead ends
G5 WCAG 2.1 AA: contrast ≥4.5:1, targets ≥44px, full keyboard path
G6 Responsive at 375 / 768 / 1440 with no overflow or orphaned UI
G7 All copy is specific to context — zero "Lorem", zero generic labels
G8 Wired to real data shape {schema/types file}, not invented props
Do not present work as finished unless you state which gates it passes and which it fails.
```

---

## 1. Design System Foundation

**1.1 Extract system from references**
```
Here are {N} screenshots/files of our current UI. Reverse-engineer the design system as code:
1. :root CSS variables (color, type scale, spacing scale, radius, shadow, motion timing)
2. Component inventory with one canonical snippet each (button, input, card, nav, modal, table, toast)
3. Layout archetypes (grid, page shell, nav model)
4. Anti-rules: list everything our UI never does.
Output as a single design-system.md I can reuse in every future session.
```

**1.2 Harden the tokens**
```
Audit {tokens}: flag any color pair that fails 4.5:1 contrast, any type scale step ratio outside 1.2–1.333, any spacing value not on the {4/8}px grid, and any missing semantic tokens (success, warning, danger, info, surface levels 0–3, border-subtle/strong). Propose fixes without changing the brand feel.
```

**1.3 Component states matrix**
```
For every component in {inventory}, generate a states matrix: default, hover, focus-visible, active, disabled, loading, error, selected. Where a state is missing, design it using existing tokens only. Output the matrix as a table + updated component code.
```

**1.4 Anti-example wall**
```
Write the "never do" list for this product: forbidden patterns, colors, layouts, copy styles, animations. Be specific enough that a stranger could enforce it. Example format: "Never center-align body paragraphs. Never use pure #000. Never stack two primary buttons."
```

---

## 2. Screen Generation

**2.1 New screen (the workhorse)**
```
Design {screen} for {persona} whose job here is {user goal in one sentence}.
Constraints: match {reference screen} in layout rhythm and density; tokens only; real data shape from {types}; mobile-first.
Deliver: (1) the screen at all three breakpoints, (2) its loading, empty, and error variants, (3) a 5-line rationale of hierarchy decisions — what draws the eye first and why that is correct.
```

**2.2 Screen from job-to-be-done**
```
The user arrives at {screen} in this state: {context, emotion, prior step}. In 5 seconds they must be able to {primary action}. Everything that does not serve that action must be demoted or removed. Design it, then list every element with its justification. Any element you cannot justify — delete it before showing me.
```

**2.3 Variant exploration (before committing)**
```
Give me 3 structurally different layouts for {screen} — not color swaps: different information architecture, different hierarchy bets. For each: who it serves best, what it sacrifices. Recommend one with a verdict-first argument.
```

**2.4 Data-dense screen**
```
Design {dashboard/table screen} for daily power users. Optimize for scan speed: alignment, column order by decision-priority, numeric tabular alignment, row density options. No decoration that doesn't encode information. Show it with realistic data at min (0 rows), typical ({N} rows), and stress (10x) volume.
```

---

## 3. Consistency Enforcement

**3.1 Cross-screen audit**
```
Compare {screens A, B, C}. Produce a consistency diff table: element | screen | deviation | canonical version | fix. Cover spacing, type, color, component variants, icon style, corner radius, terminology, empty-state style. Then apply the fixes and re-output all screens.
```

**3.2 Hardcode hunt**
```
Scan all code you've produced this session for hardcoded values (hex, px, rgb, font names, magic numbers, ad-hoc shadows). Replace every one with the correct token. Output a table of what changed. Zero hardcoded values may remain.
```

**3.3 Terminology sweep**
```
Extract every user-facing noun and verb across all screens. Flag synonyms used for the same concept (e.g. "remove/delete", "course/lesson/module"). Propose one canonical term each, then apply globally.
```

**3.4 Component drift check**
```
List every button/input/card instance across screens. Any instance that is not one of the canonical variants is drift — replace it or, if genuinely needed, promote it into the system as a named variant with a documented reason.
```

---

## 4. Integration & Wiring

**4.1 Real data contract**
```
Here is the actual API/schema: {paste types or endpoint shape}. Rewire every screen to consume exactly this shape. Flag every field the design needs but the API doesn't provide, and every API field the design ignores. No invented props, no convenient fake fields.
```

**4.2 State wiring**
```
For {screen/flow}, define the full state machine: states, events, transitions, side effects (fetch, mutate, navigate, toast). Then wire the UI so every visual state maps to a machine state. Show what the user sees during each transition — including the awkward in-between moments (optimistic update, retry, stale data).
```

**4.3 Navigation graph**
```
Draw the complete navigation graph of the app: every screen as a node, every transition as an edge with its trigger. Flag: dead ends, orphan screens, back-button ambiguity, flows deeper than 3 levels, and any state loss on back/refresh. Fix each.
```

**4.4 Failure wiring**
```
For every network call in {flow}: design the UI for slow (>3s), failed, partial, offline, and retry. Errors must say what happened, what it means for the user, and what to do next — never a bare "Something went wrong".
```

**4.5 Cross-feature integration**
```
{Feature A} and {Feature B} share {data/entity}. Design how changes in one appear in the other: where, how fast, with what notification. The user must never see stale or contradictory state between them.
```

---

## 5. User Flow Smoothness

**5.1 Flow compression**
```
Map {flow} step by step: screens, taps, inputs, decisions, waits. Count total interactions. Now compress: merge steps, defer optional inputs, prefill from known data, remove confirmations that aren't destructive. Target: {N} interactions max. Show before/after step counts.
```

**5.2 First-run flow**
```
Design the first 60 seconds for a brand-new user of {app}: from open to first meaningful value ("aha"). Rules: no permission requests before value, no forms longer than {N} fields, progressive disclosure only. Mark the exact moment of first value and justify everything that comes before it.
```

**5.3 Interruption resilience**
```
For {flow}: the user gets interrupted at every step (call, app switch, connection drop). Design resume behavior for each step: what's saved, what they see on return, how they re-orient in <2 seconds.
```

**5.4 Friction audit**
```
Walk {flow} as a skeptical first-time user narrating aloud. At every step ask: Do I know where I am? What to do next? What happens if I do it? Can I undo it? Log every hesitation as a friction point with severity, then redesign the top 3.
```

**5.5 Momentum design**
```
For {multi-step flow}: add momentum — progress indication, per-step completion feedback, and one sentence per step framing why it's worth continuing. No step may end without telling the user what comes next.
```

---

## 6. States & Microinteractions

**6.1 Full state pass**
```
For {screen}: design loading (skeleton matching real layout, not spinner), empty (with a next action, not just an illustration), error (cause + remedy), partial (some data failed), and success. Each must use tokens and feel like the same product.
```

**6.2 Empty states that convert**
```
Every empty state in the app must answer: why is this empty, what will appear here, what's the one action to fill it. Rewrite all empty states to that spec. First-time empty ≠ user-cleared empty ≠ filtered-to-nothing — design all three where relevant.
```

**6.3 Motion system**
```
Define the motion system: durations (fast/base/slow in ms), easings, and which gets used for enter/exit/move/emphasis. Rules: nothing over 300ms on interaction paths, respect prefers-reduced-motion, motion must explain spatial relationships not decorate. Apply to {screens}.
```

**6.4 Feedback loop check**
```
For every action a user can take in {screen}: what feedback appears within 100ms? List every action with its feedback (visual, haptic, textual). Any action with no immediate feedback is a defect — fix it.
```

**6.5 Optimistic UI**
```
For {mutations list}: implement optimistic updates with visible rollback on failure. The user should never wait for the server to see their own action — but must clearly see when it didn't stick.
```

---

## 7. Meaning & Copy (nothing generic)

**7.1 Copy pass**
```
Rewrite all copy in {screen} to be specific and load-bearing: buttons say what happens ("Save lesson" not "Submit"), titles state the user's situation, helper text prevents the most likely mistake, errors give cause + fix. Tone: {tone}. Reading level: plain. Output old → new table.
```

**7.2 Justify every pixel**
```
For {screen}, list every element top-to-bottom with a one-line answer to "what user decision or action does this serve?" Elements serving only aesthetics or "we had space" get deleted or demoted. Show the screen after the cut.
```

**7.3 Microcopy for the hard moments**
```
Write copy for the emotionally loaded moments in {flow}: destructive confirmation, payment failure, data loss risk, permission ask, account deletion. Each: honest, specific, calm, with the safe path visually primary and the destructive path clearly marked but not hidden.
```

**7.4 Localization stress**
```
Test every label and button against +40% text length (Indonesian/German-length strings) and RTL where relevant. Flag every truncation, wrap, or overflow. Fix layouts so copy length never breaks the UI.
```

---

## 8. Pixel-Perfect Polish

**8.1 Spacing audit**
```
Audit {screen} against the {4/8}px grid: every margin, padding, and gap. Output violations as a table (element | current | correct token). Check optical alignment separately from mathematical: icons next to text, button labels, badge centering. Fix all.
```

**8.2 Typography pass**
```
Audit type in {screen}: scale steps used, line-height per size (target 1.4–1.6 body, 1.1–1.3 headings), max line length 45–75ch, orphan/widow risk in headings, weight hierarchy (max 3 weights per screen), tabular-nums on all numerics. Fix and show diff.
```

**8.3 Edge & detail pass**
```
Zoom in: border consistency (width, color, radius continuity on nested elements), shadow direction consistency, icon optical sizing and stroke weight uniformity, divider necessity (remove any divider whitespace could replace), focus ring style uniformity. List findings, fix all.
```

**8.4 Screenshot diff discipline**
```
Render {screen} and compare against {reference screenshot} region by region. Report every deviation >2px in spacing or any token mismatch. Do not report "looks close" — report exact deltas, then eliminate them.
```

---

## 9. Accessibility (WCAG 2.1 AA gate)

**9.1 Full audit**
```
Run a WCAG 2.1 AA audit on {screen/flow}: contrast (4.5:1 text, 3:1 UI), touch targets ≥44px, visible focus indicators, logical focus order, keyboard-only completion of every task, labels on every input, error identification, name/role/value on custom components, 200% zoom without breakage. Output: findings table with criterion, severity, fix. Then apply all fixes.
```

**9.2 Keyboard walkthrough**
```
Complete {primary task} using only Tab, Shift-Tab, Enter, Space, Escape, arrows. Narrate each keystroke and what receives focus. Any trap, skip, or invisible focus is a critical defect — fix in code.
```

**9.3 Screen reader script**
```
Write the exact screen-reader announcement sequence for {screen} top to bottom. If any announcement is redundant, missing, or confusing, fix the semantic HTML/ARIA — prefer native semantics over ARIA patches.
```

---

## 10. Responsive & Platform

**10.1 Three-breakpoint proof**
```
Show {screen} at 375, 768, and 1440. For each transition, state what changes and why (not just "it stacks"). Rules: no horizontal scroll, no touch target shrinkage on mobile, content priority order preserved, nav pattern appropriate per size.
```

**10.2 Thumb-zone check**
```
On mobile, overlay the thumb-reach map: primary actions must sit in the easy zone, destructive actions out of accidental-tap range, and nothing critical in the top corners. Rearrange {screen} accordingly.
```

**10.3 Platform conventions**
```
Audit {screen} against {iOS/Android/web} conventions: back behavior, sheet vs modal usage, system font handling, safe areas, pull-to-refresh expectations. Deviating from platform convention requires a stated reason; otherwise conform.
```

---

## 11. Production QA Gate (pre-ship)

**11.1 Gate run**
```
Run the full Definition of Done (G1–G8) against {screen/flow}. Output a gate table: gate | pass/fail | evidence | fix if fail. A single fail blocks ship. Then fix all fails and re-run until green.
```

**11.2 Adversarial user**
```
Attack {flow} as a hostile/chaotic user: double-tap every button, submit empty forms, paste 10,000 characters, go back mid-transaction, lose connection mid-save, rotate the device, use it with one hand while walking. Log every break, rank by severity, fix top-down.
```

**11.3 Stale-data & race audit**
```
List every place two sources of truth could disagree on screen ({examples}). For each: which wins, how conflict is shown, how it self-heals. No screen may silently show wrong data.
```

**11.4 Performance perception**
```
Audit perceived speed: what renders in the first 100ms of each screen, what's skeleton vs blocked, are images sized/lazy, does any interaction wait on network without feedback. Optimize the first-paint story of {screen} — the app must feel instant even when it isn't.
```

---

## 12. Critique & Iteration Loops

**12.1 Structured critique**
```
Critique {screen} in this exact frame: (1) 2-second first impression — what draws the eye, is that correct; (2) usability — can {persona} do {goal} without instruction; (3) hierarchy — reading order and emphasis; (4) consistency vs system; (5) accessibility. Findings table with severity, then top-3 priority fixes with reasoning. No praise padding.
```

**12.2 Compare-to-best**
```
Compare {screen} against the best-in-class equivalent ({Linear/Duolingo/Stripe/etc — name one}). What do they do that we don't, structurally? Which of those moves fit our system, and which are their brand not ours? Apply the fits.
```

**12.3 Regression guard**
```
Before applying this change: list everything currently working in {screen} that this change could break (states, breakpoints, flows in, flows out). After applying, verify each item explicitly.
```

**12.4 Taste calibration**
```
Here are 3 screens I consider excellent and 3 I consider bad from our own history: {links/files}. Extract the difference as explicit rules. Add them to the anti-example wall and apply to current work.
```

---

## 13. Delight & Love (the last 5%)

**13.1 Signature moments**
```
Pick the 3 moments in {app} where users feel most success ({e.g. streak hit, lesson complete, first payout}). Design a signature celebration for each — distinctive, on-brand, <1.5s, skippable, never blocking. These are the moments users screenshot; make them ours alone.
```

**13.2 Anticipation design**
```
Find 5 places where the app can act before the user asks: prefill, smart defaults from history, remembering position, suggesting the likely next step. Implement them. Rule: anticipation must be reversible and never surprising in a bad way.
```

**13.3 Personality pass**
```
Inject personality only where stakes are low: empty states, success moments, loading messages, easter eggs. Never in errors, payments, or destructive flows — those stay calm and precise. Apply to {app} with our voice: {voice description}.
```

**13.4 The care test**
```
Final pass: go through {screen} and find 5 details that prove someone cared — a perfectly aligned icon, a thoughtful default, a transition that explains itself, copy that anticipated the user's worry. If you can't find 5, create them. Users can't articulate craft, but they feel it.
```

---

## Appendix: Recommended Sequencing

- **New feature:** 0 → 1 (if system gaps) → 2 → 4 → 5 → 6 → 7 → 3 → 8 → 9 → 10 → 11 → 13
- **Fixing an existing app:** 0 → 3 → 11.1 (baseline gate run) → worst-failing categories first
- **Weekly hygiene:** 3.1, 3.2, 11.1 on all touched screens
- **Pre-release:** 11 full, 9 full, 10.1, 12.1 on hero screens
