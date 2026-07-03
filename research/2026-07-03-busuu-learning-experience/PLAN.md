# Research Plan: Benchmark Busuu — 3 most valuable learning-experience features

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Goal it serves:** Identify Busuu's three most valuable learning-experience
  features, with evidence + UX rationale, to inform our own learning-product design
  (input to a build decision).

## Key research questions
- What is the **core learn-by-doing loop** in a Busuu lesson — how does a concept
  get introduced, practised, and reinforced, and what makes the loop feel light?
- How does Busuu **handle getting it wrong / getting stuck** — correction UX,
  hints, feedback timing, and the human "Conversations" community-correction layer
  that is Busuu's signature differentiator vs. purely automated apps?
- How does Busuu drive **retention & motivation** — streaks, study plan/goals,
  spaced-repetition vocabulary review, leaderboards, certificates?
- Which three of these most improve *how effectively and enjoyably a user learns*,
  and why (the UX/product reasoning)?

**Note on selecting the top 3:** the five capture flows below yield **more than
three** distinct candidate features (e.g. adaptive placement/study plan,
instant-feedback correction, spaced-repetition review, human community-correction,
streaks/leaderboard, certificates). Capture the **full candidate pool**, then
select the top 3 as a genuine evidence-based judgement (on soundness *and* build
value). Do not pre-decide the three at plan time.

## Per-platform capture plan
### Busuu (busuu.com)
- **Flows/screens to capture:**
  1. **Onboarding & placement** — sign-up, language/level selection, goal &
     study-plan setup, placement/quick level check (entry point + as far as is
     free).
  2. **Core lesson player** — a full lesson end-to-end: vocabulary introduction,
     multiple-choice / matching / fill-in exercises, listening, and the
     speaking/writing prompt. Capture the instant-feedback correction states
     (right vs. wrong) and lesson-complete summary.
  3. **Spaced-repetition / Vocabulary Review** — the review entry point and a
     review round (flashcard-style recall), if reachable on the free tier.
  4. **Conversations (community correction)** — the write/speak-a-response prompt
     and how submissions are sent to native speakers for correction. The
     **receiving side** (native-speaker corrections arriving) is asynchronous and
     partly premium, so treat it as a **possible documented gap, not a required
     capture**: capture the submission prompt and the correction-inbox entry
     point; if the corrected-feedback interior is gated or hasn't arrived in
     session, capture the entry/upsell and note it as gated/async in `notes.md`.
  5. **Motivation & progress** — dashboard/home, streak, study-plan progress,
     leaderboard (if present), certificate/level-completion surface (entry point).
- **What we're looking for:** the tightest evidence for the core loop (learn →
  practise → instant feedback), the differentiating human-correction layer, and
  the retention scaffolding — the raw material to pick and justify the top 3.
- **Risks:**
  - **Paywall (primary risk).** Much of Busuu (grammar reviews, offline, most
    vocabulary review, full Conversations, McGraw-Hill certificates) sits behind
    **Busuu Premium**. Hard rule: never pay, never start a paid trial. Capture
    what is observable free; where a surface is gated, capture its entry
    point/upsell and note in `notes.md` that the interior is paywalled.
  - **Login / PII.** Busuu requires an account for lessons. If a logged-in session
    is used, redact PII **before every capture**: the account holder's name,
    email, avatar — and **critically, third-party PII in Conversations/community**
    (other learners' names, avatars, and native-speaker correctors). Target the
    name/avatar *slots* by role/position, re-apply after each navigation, and
    verify redaction in the captured image before saving.
  - **Speaking exercises** may request microphone access — decline / skip;
    capture the prompt UI, not a real recording.
  - **Capture blockers** — SPA re-renders and modal onboarding may need re-tries;
    if a flow fails 2–3 times, stop and check in.

## Success criteria (what "done" looks like)
- Busuu's **core lesson flow recorded end-to-end** as `flow.gif` + written
  `flow.md`, with numbered key-screen screenshots.
- A **candidate pool of more than three** learning-experience features captured
  with evidence (spanning the core loop, correction/feedback, SRS review, the
  human-correction layer, and retention/motivation) — enough that the final top 3
  is a real selection, not a restatement of the capture buckets.
- `notes.md` records observations + patterns and every gated/paywalled surface;
  `sources.md` logs every URL with date.
- **Documented gaps are acceptable, not failures:** where a surface is paywalled
  or async (e.g. the Conversations correction-receipt interior), capturing its
  entry point/upsell and noting it gated counts as done for that surface.
- Enough grounded evidence to name and justify the **three most valuable
  learning-experience features** in `SYNTHESIS.md`.

## Account access (safe default + options)
Busuu needs a login for lessons, and the richest surface (Conversations) is partly
premium. **Default (so fieldwork isn't blocked):** proceed **logged-out + free
tier** — option (c) below — unless the user provides an account.

- **(a) Free account the user provides/creates** — unlocks the lesson player,
  study plan, and vocabulary review, and the Conversations *submission* side;
  most Premium interiors (grammar review, full vocab review, certificates,
  received corrections) stay gated. Higher PII-redaction burden (account holder +
  third parties in community).
- **(b) An account already logged in to Chrome** — same surfaces as (a), whatever
  tier that account holds; same PII burden.
- **(c) Logged-out + free tier (default)** — onboarding/placement entry, marketing
  and free-preview surfaces, and any lesson content Busuu exposes without login;
  lessons and Conversations largely gated. Lowest PII burden.

Whichever is used, the hard rules hold: **never pay / never start a paid trial**,
and **redact PII before every capture**.

## Principal Researcher review
- **Verdict (2026-07-03):** *Plan needs revision* — three must-fixes, now applied:
  1. **Safe default for account access** — proceed logged-out + free tier if no
     account is provided, with each option's unlocked surfaces stated (done: see
     "Account access" above).
  2. **Stop pre-bucketing the answer into three** — capture a broader candidate
     pool and select the top 3 as a real judgement (done: note added under Key
     research questions + success criteria).
  3. **Treat Conversations correction-receipt as a documented gap, not a required
     capture** (done: flow 4 + success criteria updated).
- Strengths noted: goal alignment strong, scope disciplined, PII/paywall/mic risks
  well anticipated.
- **Status after revision:** ready for user approval.
