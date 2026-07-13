# Functional Requirements — S1 Activation (Onboarding)

**Product:** Solve Education! learning system
**Stage:** S1 · Activate (first step of the Learn-to-Hire Loop)
**Status:** Draft for review · 2026-07-10
**Prototype:** `prototype/landing.html` → `prototype/s1-activation-onboarding.html`
**Design system:** binding — see `prototype/design-system/` (DESIGN.md + modules)

---

## 1. Purpose

Turn a first-time visitor into an activated learner by getting them to **experience value before signing up**: choose a focus, prove their level through a short check, then create a free profile. Activation ends when a profile is created (or intentionally deferred).

## 2. Scope

In scope: the **role landing** and the **learner activation flow** (Meet Ed → Goal → Level check → Result → Create profile → Done).

Out of scope: the **job seeker** flow (entry point shown, experience not built), post-activation learning (S2+), real authentication, real backend persistence, and real Learning-Code / classroom services.

## 3. Actors

| Actor | Entry | This document |
|---|---|---|
| **Learner** | "I'm a learner" on the landing | Fully specified |
| **Job seeker** | "I'm a job seeker" on the landing | Entry point only; flow deferred |

## 4. Flow map (learner)

```
Landing (role select)
  └─ Learner ─► 0 Meet Ed ─► 1 Goal ─► 2 Level-check intro
                              ▲            └─► 3 Level check (Q1→Q2→Q3)  ── Skip ─┐
                              └── Choose something else                          │
                                            ▼                                    ▼
                                     4 Done (level complete / skipped)
                                            └─► 5 Create profile ─► 6 All set
```

---

## 5. Functional requirements

### 5.0 Landing — role selection
- **FR-0.1** The landing MUST present exactly two role options: **"I'm a learner"** and **"I'm a job seeker"**, each with an icon, title, and one-line description.
- **FR-0.2** Selecting **learner** MUST navigate to the learner activation flow.
- **FR-0.3** The **job seeker** option MUST be visibly marked "Coming soon" and, when selected, MUST show an inline explanatory message rather than a broken link or a dead end.
- **FR-0.4** The landing MUST offer a "Log in" affordance for returning users. *(Prototype routes it to the same flow; real auth is out of scope.)*

### 5.1 Meet Ed (screen 0)
- **FR-1.1** The flow MUST open by introducing the AI coach **"Ed"** with a single primary action ("Start"). No form fields on this screen.
- **FR-1.2** The value proposition MUST be stated plainly ("learn by doing, short tasks, no long videos").

### 5.2 Goal selection (screen 1)
- **FR-2.1** The learner MUST choose exactly **one focus** from a fixed single-select list: Data & numbers, Business operations, Problem solving, Writing at work.
- **FR-2.2** Free-text goal entry MUST NOT be offered (removed by decision — constrained choices only).
- **FR-2.3** "Continue" MUST be disabled until a focus is selected.
- **FR-2.4** The chosen focus MUST determine which level-check question set is served (§5.4).

### 5.3 Level-check intro (screen 2)
- **FR-3.1** After a focus is chosen, the system MUST show a brief "Ed is preparing" state, then reveal the check's title and a one-line description of what it involves (count + rough time).
- **FR-3.2** Copy MUST set the expectation that **there are no wrong answers** and the purpose is to pitch tasks at the right level.
- **FR-3.3** The learner MUST be able to **"Choose something else"** to return to goal selection.

### 5.4 Level check (screen 3) — replaces self-reported level
- **FR-4.1** The system MUST NOT ask the learner to self-report their level. Level MUST be **inferred** from performance on this check.
- **FR-4.2** The check MUST present **3 questions**, one at a time, with a visible **"Question X of 3"** counter and a clear single-question prompt.
- **FR-4.3** Each question MUST be one of two interaction types:
  - **Multiple choice (MCQ)** — single-select from 3–4 options, optionally with a supporting data table.
  - **Drag-to-sort** — reorder items into a correct sequence.
- **FR-4.4** Questions per set SHOULD progress easy → hard to spread results across levels.
- **FR-4.5** For MCQ, the "Next"/"Finish" action MUST require a selection; for sort, any arrangement is a valid submission.
- **FR-4.6** The check MUST be **non-blocking**: a wrong answer does NOT force a retry. Each answer is recorded and the flow advances. (Rationale: forcing correctness would make everyone score full marks and defeat leveling.)
- **FR-4.7** The final question's action MUST read **"Finish"**; earlier ones **"Next"**.
- **FR-4.8** The learner MUST be able to **"Skip this check"**; skipping leaves level unset.
- **FR-4.9** On finish, the system MUST compute a level band from the score: **3/3 → confident**, **2/3 → some**, **0–1 → new** (generalizes to `≥ total → confident`, `≥ ⌈total/2⌉ → some`, else `new`).
- **FR-4.10** The drag-to-sort MUST work with **mouse and touch**, with the dragged item tracking the pointer and neighbours animating out of the way.

### 5.5 Result (screen 4)
- **FR-5.1** On completion the system MUST confirm **"Level check complete"**; on skip it MUST show a neutral, non-celebratory state ("Check skipped") — never falsely congratulate a skip.
- **FR-5.2** This screen MUST prompt profile creation as the next action ("Create a free profile").

### 5.6 Create profile (screen 5)
- **FR-6.1** The learner MUST be able to create a profile via **two methods**: **Continue with Google** or **email**.
- **FR-6.2** Google sign-in is **simulated** in the prototype (no real OAuth, no credentials handled). On success it MUST autofill the identity and reveal the remaining fields.
- **FR-6.3** When connected via Google, the **Google button and the email section MUST hide**, and a "Connected as {email}" confirmation with an **Unlink** action MUST appear.
- **FR-6.4** **Unlink** MUST restore the Google button and email section and collapse the remaining fields back to hidden (fresh start).
- **FR-6.5** For the email method, typing an email MUST progressively reveal the remaining fields (no upfront wall of inputs).
- **FR-6.6** Required profile fields: **email**, **display name**, **date of birth**, **country**. Email MUST pass basic format validation.
- **FR-6.7** **Country** MUST be a **searchable** dropdown (type to filter), keyboard-operable, with target markets (Indonesia, Malaysia, Singapore, …) surfaced first.
- **FR-6.8** **Age gate:** date of birth MUST be collected and the learner MUST be **15 or older** to create a profile. Under-15 MUST be blocked inline with a clear message; the attempt is logged. *(Stakeholder requirement.)*
- **FR-6.9** **Learning Code** MUST be **optional**, revealed by a checkbox, and clearly labelled as optional (for learners given a code by a teacher/partner).
- **FR-6.10** The Learning Code MUST be **≤ 6 characters** and validated asynchronously, showing **in-field loading → success → failed** states. On success it MUST tell the learner what the code does (e.g. *"You'll be added to Teacher Ulfa's English A1 Classroom."*).
- **FR-6.11** "Create profile" MUST stay disabled until email, display name, date of birth, and country are valid — and, if the code box is checked, until the code validates successfully.
- **FR-6.12** No payment, subscription, or paid step may appear anywhere in activation.

### 5.7 Success (screen 6)
- **FR-7.1** On profile creation the system MUST confirm success ("You're all set") and point to the next task.

### 5.8 Navigation & state
- **FR-8.1** A **stepper** MUST show progress through the flow; a **back** control MUST be available on the goal, intro, level-check, and create-profile screens.
- **FR-8.2** The flow MUST be a single-column app shell: full-width top nav (stepper + back), a scrollable content area, and a full-width bottom action bar.
- **FR-8.3** The primary action for each screen MUST live in the bottom action bar.

## 6. Data captured (activation)

On profile creation the system MUST record:

| Field | Source | Notes |
|---|---|---|
| `method` | Google / email | how they signed up |
| `email` | Google or typed | |
| `displayName` | Google or typed | |
| `dob`, `ageYears` | DOB field | age gate + retention analytics |
| `country` | searchable dropdown | |
| `learningCode` | optional | null if not provided |
| `goal` | focus selection | |
| `level` | inferred from check | `new` / `some` / `confident`, or unset if skipped |
| `collectedAt` | timestamp | |

*(Prototype logs this to the console; production writes to the profile service.)*

## 7. Non-functional requirements

- **NFR-1 · Design system:** MUST conform to `prototype/design-system/` — token colors (yellow = only CTA fill), Plus Jakarta Sans + Open Sans, pill buttons/fields, SVG icons only (never emoji), sentence-case on-voice copy, "learners" not "users".
- **NFR-2 · Accessibility:** WCAG AA contrast; visible focus rings; all interactive elements ≥ 44×44px with `data-testid`; `role`/`aria` on radiogroups, alerts, and the searchable combobox; `aria-live` on async validation; honors `prefers-reduced-motion`; color never the only signal.
- **NFR-3 · Performance:** mobile-first, tuned for low-tier Android on 3G; motion 150–300ms or instant under reduced-motion.
- **NFR-4 · Privacy / PII:** minors-adjacent data (DOB) collected once, with a plain reason; no PII in URLs; the demo creates no real account and handles no real credentials.
- **NFR-5 · Responsive:** full-width navs with the content column centred (~60% on desktop, full-width with gutters ≤ 720px).

## 8. Open questions

- **OQ-1** Should the age gate sit at first PII collection (current) or at app entry, if under-15s must be excluded entirely?
- **OQ-2** Does a real Learning Code resolve to a specific classroom/teacher server-side, and what happens for an unrecognised-but-well-formed code?
- **OQ-3** Level inference thresholds (3/2/1) — validate against real completion + retention data before locking.
- **OQ-4** Should the level check adapt difficulty within the 3 questions, or stay fixed?
- **OQ-5** Job seeker activation — separate flow, or a shared shell with a different instrument?

## 9. Traceability

| Requirement area | Prototype anchor |
|---|---|
| Role landing | `landing.html` |
| Meet Ed → All set | `s1-activation-onboarding.html` (screens 0–6) |
| Level check | `MAP` question sets + `buildQuestion` / `finishQuiz` |
| Age gate + data capture | `submitProfile` handler |
| Learning Code validation | `setCodeStatus` / code input handler |
