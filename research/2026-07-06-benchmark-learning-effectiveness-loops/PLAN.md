# Research Plan: Learning loop, engagement loop & measuring real upskilling

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Goal it serves:** Understand the learning loop, the engagement loop, and how
  platforms measure genuine upskilling, to inform how we define our own core
  learning platform (build decision).

## Key research questions
1. **Learning loop** — What is the atomic loop of a Khan Academy session? Trace
   present → practice → feedback → next-step. How does the platform decide *what to
   show next* (fixed sequence, adaptive difficulty, remediation on error)? How does
   it handle a wrong answer (hints, step-by-step, video, retry) versus a right one?
2. **Mastery / proficiency model** — How does Khan represent "you have learned
   this"? (Mastery levels — Attempted / Familiar / Proficient / Mastered — mastery
   points, unit progress, course mastery %.) What action moves a skill up a level?
   We prove this by capturing the **state change**, not just the static UI: the
   mastery bar/level *before* a practice session vs. *after*, and what a wrong→right
   sequence does to the proficiency estimate. (Mastery *decay* / re-practice is
   time-delayed and likely **not observable in a single session** — note it as such
   rather than over-claiming or dropping it.)
3. **Efficacy signals to the learner** — What does the platform *show the user* to
   claim they are improving? (Skill progress, mastery bars, unit tests, course
   challenge, progress/report dashboards.) Is improvement measured against a
   **baseline** (diagnostic/placement) or only as coverage/completion? Whether Khan
   sets a measured baseline is **itself a primary finding** — actively look for a
   diagnostic / "Get ready" course / course-placement / mastery-challenge seeding,
   and treat *"no baseline exists"* as a substantive answer, not a skipped screen.
4. **Engagement loop** — What brings the user back and sustains a session? (Energy
   points, streaks, goals, badges/avatars, daily streak, reminders/emails.) How
   tightly is the reward tied to *demonstrated learning* vs. mere activity? **Tagging
   rule (applied to every mechanic):** a mechanic is **learning-tied** if earning it
   requires a *correct / mastery-advancing* action, and **activity-tied** if time,
   attempts, or mere presence earns it regardless of correctness. Tag each observed
   mechanic by this rule so the call is grounded, not an opinion.
5. **Loop interaction** — Where do the engagement mechanics reinforce real learning,
   and where (if anywhere) do they risk rewarding activity over mastery? This is the
   core question that separates a genuine learning loop from an engagement-only one.

## Per-platform capture plan
### Khan Academy (khanacademy.org) — logged-in account provided by user
- **Skill to trace (named up front):** one skill in **Algebra 1 → "Solving
  equations"** (rich path: has an intro video, hints, and step-by-step, so the full
  present→practice→feedback→remediation loop is observable). **Fallback:** if that
  skill is already Proficient/Mastered on the provided account (a logged-in account
  may carry progress that hides the early/empty states), switch to a fresh unstarted
  skill in the same course, or spin up a brand-new course ("Get ready for Algebra")
  to observe the untouched Attempted→Familiar transition. Pick ONE and go deep.
- **Flows/screens to capture:**
  1. **Entry / dashboard** — the learner home: courses, "Get started", progress,
     any streak/goal surface.
  2. **Onboarding / placement** — course sign-up and any diagnostic/"get started"
     or level-check that sets a baseline (capture if present; note if absent).
  3. **Core exercise loop** — a single skill's practice: question → answer →
     feedback → hint/"I'd like a hint" → step-by-step / video bailout → correct →
     next question. This is the primary `flow.gif` + `flow.md`.
  4. **Mastery mechanics + state change** — the mastery-level UI (Attempted/
     Familiar/Proficient/Mastered), mastery points, "Level up", unit test, and
     course challenge screens. **Capture the before/after:** the skill's mastery
     bar/level immediately before the practice session and again after, so the
     *movement* (what earns a level-up) is evidenced, not asserted.
  5. **Progress / efficacy surface** — the course/unit progress view and any
     learner-facing "how you're doing" report or mastery percentage.
  6. **Engagement surface** — energy points, streak/goals, badges, and any reminder/
     notification prompt observable in-session.
- **What we're looking for:** the answers to Q1–Q5 — specifically the concrete
  mechanics of the learning loop, the mastery model that stands in for "measured
  upskilling", and how the engagement layer wraps it.
- **Risks:**
  - **Login/PII** — logged-in account. Redact account holder name/avatar/email and
    any third-party names (class/coach surfaces) *before* every capture; verify in
    the saved image. Use a `window.__redact()` helper, re-apply after each nav.
  - **No hard paywall expected** — Khan Academy is free; no purchase risk. Still,
    never transact. If a "Khanmigo" AI feature is gated, capture what's observable
    and note the gate.
  - **Adaptive content** — the "next question" logic is inferred from observed
    behaviour, not source; be careful to describe it as *observed*, not claimed as
    the platform's internal algorithm. Do not over-claim adaptivity we cannot see.
  - **Breadth vs depth** — Khan spans many subjects; trace the ONE named skill
    deeply rather than sampling widely.
  - **Account already has progress** — the provided logged-in account may have
    completed the target skill, hiding the Attempted/empty starting states. Use the
    fallback above (fresh skill or new "Get ready" course) to observe the untouched
    early-state transitions.

## Success criteria (what "done" looks like)
- The core exercise/learning loop for one Khan skill recorded end-to-end
  (`flow.gif` + written `flow.md`) and the numbered key screens captured.
- The mastery/proficiency model documented with evidence: what the levels are,
  what moves a skill between them (shown via a **before/after** capture of the
  mastery bar across a practice session), and how "mastered" is reached
  (screenshots of the mastery UI, unit test, course challenge).
- Whether Khan sets a **measured baseline** (diagnostic/placement) answered
  explicitly, with evidence for either presence or absence.
- The engagement mechanics catalogued with evidence (energy points, streak/goals,
  badges) and each tagged as *tied to demonstrated learning* or *tied to activity*.
- `notes.md` answers Q1–Q5 for Khan Academy, grounded in the captured evidence,
  with an explicit read on where the engagement loop reinforces vs. risks diluting
  the learning loop.
- `notes.md` ends with an explicit **build-relevant takeaway** — which of Khan's
  learning-loop / mastery / efficacy / engagement mechanics are worth **adopting,
  adapting, or avoiding** for our own platform — so the output serves the build
  decision, not just describes Khan.
- All PII redacted and verified; every URL logged in `sources.md`.

## Principal Researcher review
- **2026-07-06 — Verdict: Plan needs revision (6 must-fixes), all applied:**
  1. Capture the mastery-bar **state change** (before/after a session; wrong→right),
     not just static mastery screens → added to Q2 + capture step 4 + success criteria.
  2. State an **explicit tagging rule** for engagement mechanics (learning-tied vs.
     activity-tied) → added to Q4.
  3. Elevate **placement/diagnostic** to a primary finding; treat "absent" as a real
     answer → strengthened in Q3 + added success criterion.
  4. **Name the skill** to trace up front (Algebra 1 → Solving equations) + a fallback
     if already mastered on the account → added to the Khan block + risks.
  5. Add a **build-relevant takeaway** (adopt/adapt/avoid) as a success criterion → added.
  6. Flag **mastery decay/re-practice** as likely not-observable-in-session → noted in Q2.
- **Status after revision:** Ready for user approval.
