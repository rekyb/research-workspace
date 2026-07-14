# Khan Academy — Onboarding Flow (desktop web)

**Surface:** desktop web (`khanacademy.org`), captured 2026-07-13 (logged-out). Desktop-labeled; see `notes.md` for mobile divergence.
**Entry point → goal:** landing → **role selection → age gate → mandatory account creation** before any personalized content. Two distinct entries captured: the **organic** self-signup path and the **class-code (linked-entry)** path.
**One-line summary:** Khan front-loads identity — you declare your role, pass an age gate, and create an account *before* reaching a learning path; the more relevant pattern for us is the separate `/join` **class-code** entry, which routes a learner straight to an assigned class instead of the full catalogue.

Evidence: `flow.gif` (organic onboarding), `classcode-flow.gif` (class-code path); stills in `screenshots/`.

---

## Path A — Organic self-signup

1. **Landing / value framing + role split.** The homepage leads with "Khan Academy boosts scores!" and a subhead about videos, practice, and AI support. The right rail is a **role chooser presented as the primary action** — cards for **Student** ("learning on my own"), **Family** ("supporting my child's learning"), and Teacher. Unlike Duolingo, sign-up is front-and-center, not deferred. → `01-landing-role-split.png`

2. **Age gate (date of birth first).** Selecting **Student** opens "Sign up as a learner today! First, we need your date of birth to help us give you the best experience!" — **Month + Year** dropdowns and a Next button, with a "Choose a different role" back link. DOB is collected before anything else (COPPA compliance) and branches the flow: an under-13 birth year routes to a parent-consent path; an adult year proceeds. → `02-age-gate-date-of-birth.png`

3. **Account creation wall.** After the age gate (`/signup/learner/over-age-gate`): "Sign up as a learner today!" with a **Terms of Service consent checkbox**, a full-width **Continue with Google** (primary), secondary **Facebook / Apple / Microsoft** icon buttons, and an **email** option below. A "Did you know?" engagement panel sits on the left. **Account creation is mandatory here — there is no guest path to content.** *(Capture stops here; we do not create accounts.)* → `03-signup-wall-social-email.png`

## Path B — Class code (linked entry) — *the assigned-course-routing analogue*

4. **Dedicated `/join` page.** A learner arriving via a class link lands on a **focused, chrome-free page**: "Join your class on Khan Academy" + a **segmented class-code input** (fixed-length, one box per character) + Continue. No nav, no catalogue, no distraction — a single task. → `04-classcode-entry.png`

5. **Code entry + validation.** Typing a code fills the segmented boxes and enables Continue. A **valid teacher-issued code routes the learner directly into their assigned class**; an invalid code is rejected inline (we entered a dummy code and it returned an `invalidCode` error — notably a raw error key, not a friendly message). Completing the join requires a real code, so capture stops at the gate. → `05-classcode-filled.png`

## Context — the catalogue a learner faces without routing

6. **Grade-organized catalogue.** Subject pages (e.g. `/math`) are browsable logged-out and list courses **by grade** (Early math → Kindergarten → 1st grade → 2nd grade → …), each course exposing its units. A learner without a class code must know their grade and scroll a long list to self-locate — precisely the "which course is mine?" problem the class-code path short-circuits. A recurring "Create a free account as a Teacher / Student / Family" banner nudges signup throughout. → `06-catalogue-grade-organized.png`

---

## Where friction / delight / dead-ends appear
- **Friction:** account creation is mandatory *before* any personalized learning — the opposite of try-before-signup. A low-context learner must commit identity first.
- **Delight / clarity:** the `/join` page is exemplary — one task, zero distraction, a segmented input that makes the code format obvious.
- **Dead-end risk:** the organic learner must self-select the correct grade/course from a large catalogue; the class-code path removes that burden entirely (when a code exists).
- **Nit:** the `invalidCode` raw error string is developer-facing, not learner-friendly.
