# Khan Academy — Onboarding Notes & Analysis

**Surface:** desktop web, logged-out. Captured 2026-07-13.
**Paths captured:** (A) organic self-signup `khanacademy.org` → role → age gate → account wall; (B) class-code `khanacademy.org/join`. Content catalogue `/math` for context.
**Variant caveat:** one observed variant/session.

## Scored against the six moments (0–2)

| # | Moment | Score | How Khan does it |
|---|--------|:---:|---|
| 1 | Value framing / landing | **1** | Benefit headline ("boosts scores!") is fine, but the landing's primary action is a **role/sign-up chooser**, not a low-commitment "try it". Asks for identity immediately. |
| 2 | Account creation | **0–1** | **Mandatory and up-front.** Role → age gate → ToS + social/email account. **No guest path to content** on the organic route. Opposite of Duolingo's deferral. |
| 3 | Personalization intake | **1** | Personalization is **role + age + (post-signup) grade/course**. Pre-signup we see role and DOB only; the richer intake is gated behind the account. |
| 4 | Placement / advanced routing | **1** (est.) | Placement is **grade-level self-selection**, plus per-course mastery challenges to test out of units (account-gated, not captured). No single upfront placement test like Duolingo's. |
| 5 | Path assignment | **1 / 2 split** | Organic: learner self-locates in a **grade-organized catalogue** (weak — the "which course is mine?" burden). Class-code: **routes straight to the assigned class** (strong — score 2 for this path). |
| 6 | First-task guidance | n/a | Gated behind account creation; not observable logged-out. |
| ★ | First win (activation) | — | Not reachable without an account. |

## Patterns worth synthesizing (why they work)

1. **Class-code / linked-entry routing — the single most relevant pattern for us.** A dedicated `/join` page takes a learner from a code straight to their **assigned class**, bypassing the entire catalogue. This is the direct analogue to our program-code problem (learners dumped into the full catalogue instead of their course). Design cues to steal: a **standalone, chrome-free page** with **one task**; a **segmented fixed-length code input** that makes the format self-evident; inline validation. *Evidence: `04`, `05`.*

2. **Role-based branching at the very first step.** Student / Family / Teacher fork the entire downstream experience from screen one. Useful if our product must serve learners *and* facilitators/teachers from one entry — but note the cost (pattern #3). *Evidence: `01`.*

3. **Age gate before content (DOB-first).** Collecting birth date first enables compliant branching (under-13 → parent consent) and age-appropriate tailoring. Directly relevant to our under-15 / email-less learners: Khan solves the *compliance* half but still ultimately requires an account, which our youngest users can't create — so we'd want Khan's age-branching **without** Khan's hard account wall. *Evidence: `02`.*

## The cautionary contrast (what NOT to copy)
- **Mandatory up-front registration is the anti-pattern for our audience.** Our low-tech-literacy, low-context, often email-less learners are exactly the users who stall at a "create an account / continue with Google" wall (our email-free-registration pain, and the "Start Now felt like an ad" disengagement). Khan's organic path would reproduce that failure. The lesson: **borrow Khan's routing (class code) and age-branching, but keep Duolingo's deferral** — let the learner reach a first win in a guest session, and wall registration behind "save your progress."
- The `invalidCode` raw error string is a reminder to write learner-facing error copy.

## Where mobile would diverge (desktop-capture caveat)
- Mobile web/app collapses the two-column landing to a single stacked column; the role chooser becomes full-width stacked cards.
- The `/join` class-code entry is essentially identical on mobile (already a single centered card) — its simplicity travels well, which is part of why it works.
- Social-auth buttons (Google/Apple) invoke OS-level account pickers on mobile; the friction of "which account?" is higher for shared-device learners (relevant to our shared-school-device reconciliation problem).

## Sources
- https://www.khanacademy.org/ (landing + role split) — 2026-07-13
- https://www.khanacademy.org/lohp/learner (learner age gate) — 2026-07-13
- https://www.khanacademy.org/signup/learner/over-age-gate (account creation wall) — 2026-07-13
- https://www.khanacademy.org/join (class-code linked entry) — 2026-07-13
- https://www.khanacademy.org/math (grade-organized catalogue, logged-out) — 2026-07-13
