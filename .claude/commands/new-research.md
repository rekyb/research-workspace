---
description: Start a new research effort (benchmark or usability) — creates a dated folder, scaffolds it by type, and marks it active.
argument-hint: <research topic> [--type benchmark|usability]
---

You are starting a new UX-research effort. Parse `$ARGUMENTS` for the topic and an
optional `--type` flag.

Follow these steps exactly:

1. **Check for an already-active research.** Read `.claude/.active-research` if it
   exists. If it points to a research whose `README.md` is not marked `Status: Closed`,
   STOP and tell the user there's an open research (`<path>`); ask them to run
   `/close-research` first, or confirm they want to switch anyway.

2. **Determine the research type.** Look for `--type <value>` in `$ARGUMENTS`.
   - Accepted values: `benchmark` (default if the flag is absent) and `usability`.
   - `survey` and `abtest` are planned but not yet implemented — if asked, tell the
     user those types aren't wired up yet and offer `benchmark` or `usability`.
   - Strip the flag out of the topic string before deriving the slug.

3. **Establish and confirm the goal (required).** The goal drives everything
   downstream — `/review-research` judges the synthesis *against this goal* — so it
   must be explicit before anything else happens.
   - **Benchmark:** the goal is what we want to learn from observing products *and
     why* (e.g. "benchmark X's onboarding to inform our redesign", or "purely
     benchmark how X does Y, no build decision").
   - **Usability:** the goal is what **decision the test informs** and which
     product/flow is under test (e.g. "find where our checkout flow confuses users
     before the redesign ships").
   - **If the goal is vague, implicit, or missing, STOP and ask the user before
     scaffolding.** Do not invent it, and never leave it as `TBD`. Record the
     confirmed goal in the README `## Goal` section.

4. **Derive the slug.** Build it defensively from the topic (after stripping the
   `--type` flag):
   - lowercase everything;
   - strip quotes, apostrophes, brackets, and other punctuation entirely (don't turn
     them into hyphens — `"users' data"` → `users-data`, not `users--data`);
   - replace any run of spaces/remaining separators with a single hyphen;
   - collapse repeated hyphens and trim leading/trailing hyphens;
   - keep it concise — if the topic is a long sentence, use the meaningful head
     (roughly the first 5–6 words / ~50 chars), not the whole thing.

   Get today's date with `date +%F` (or the harness-provided current date if
   available). Folder path = `research/<YYYY-MM-DD>-<slug>/`.

5. **Scaffold the folder — by type.** Every type gets `README.md`, `PLAN.md`, and
   `sources.md`; the middle differs.
   - **Common to all types:**
     - `research/<...>/sources.md` — header `# Sources — <topic>` and a table with
       columns: Source | URL | Accessed | Notes.
     - `research/<...>/README.md` — the research brief (template below; set the
       `TYPE` line to the chosen type).
     - `research/<...>/PLAN.md` — the plan (template below).
   - **`benchmark`:** also create `research/<...>/platforms/` (empty; one subfolder
     per platform gets added during capture).
   - **`usability`:** also create `research/<...>/sessions/` (empty; one
     `session-NN.md` per participant gets added after fielding). The detailed
     instrument (`test-plan.md`) is **not** created here — it is built by
     `/plan-usability` in step 7.

6. **Set the active pointer and refresh the board.** Write the folder path (no
   trailing slash) into `.claude/.active-research`, then refresh `BOARD.md` so the
   new study shows as **Active** — re-derive it from the `research/` folders + the
   active pointer exactly as `/research-board` does (update the `## Active` and
   `## Closed & archived` tables and the `_Last updated:_` date). Don't print the
   full board here; just keep the file in sync.

7. **Draft the plan and run the quality gate — by type.**

   **Benchmark** (as before — the plan is what the Principal Researcher signs off on
   before any capture):
   - **You need the platforms first.** If the topic names them, draft the plan now;
     if not, ask the user which platforms to benchmark before drafting.
   - **Draft `PLAN.md`:** derive key research questions from the `## Goal`, list the
     platforms, and for each name the specific flows/screens to capture, the success
     criteria, and known risks (paywalls, login/PII).
   - **Dispatch the Principal Researcher (Mode A)** via the Agent tool
     (`general-purpose`) with `.claude/personas/principal-researcher.md`, the drafted
     `PLAN.md`, and the `README.md`. It returns must-fixes.
   - **Revise `PLAN.md`** and **present it to the user for approval.** Capture begins
     (via the Claude-in-Chrome tools) only after they approve.

   **Usability** (the plan here is the lightweight brief; the detailed instrument
   comes next):
   - **Draft `PLAN.md`** with the objectives + research questions derived from the
     `## Goal`, the product/flow under test, and the intended participant profile at
     a high level. This is the goal-alignment plan, not the full script.
   - **Dispatch the Principal Researcher (Mode A)** with the persona spec, `PLAN.md`,
     and `README.md`, to check the objectives actually serve the goal and are
     answerable by a usability test. Revise and **present to the user for approval.**
   - Then tell the user the next step is **`/plan-usability`**, which designs the
     `test-plan.md` instrument (tasks, script, metrics) and runs its own Principal
     Researcher methodology review before any sessions are fielded. **Do not** start
     designing tasks here.

8. **Confirm** to the user: folder created, the type, the confirmed goal, the
   approved plan, and the correct next step for the type (capture via Claude-in-Chrome
   for benchmark; `/plan-usability` for usability).

---

README.md template (set `TYPE`; the `## Goal` is required — never `TBD`; leave other
fields TBD only where genuinely unknown):

```
# Research: <Topic>

- **Status:** Active
- **Type:** <benchmark | usability>
- **Started:** <YYYY-MM-DD>
- **Researcher:** Claude (acting Senior UI/UX Designer)

## Goal
<the confirmed goal from step 3 — what we want to learn and why. For benchmark,
state whether this is observation only or input to a build decision. For usability,
state which product/flow is under test and what decision the results inform.
/review-research judges the synthesis against this.>

## Scope
<what's in / out of scope>

## <Platforms to benchmark | Product & participants>        <!-- benchmark: platforms list; usability: product under test + participant profile -->
- [ ] <platform 1, or participant-profile note>
- [ ] <platform 2>

## Log
- <YYYY-MM-DD> — research created (type: <type>).
```

PLAN.md template — **benchmark** (leave the per-platform block as a skeleton if
platforms are not named yet):

```
# Research Plan: <Topic>

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Type:** benchmark
- **Goal it serves:** <one line — the confirmed goal from the README>

## Key research questions
- <question 1 derived from the goal>

## Per-platform capture plan
### <platform 1>
- **Flows/screens to capture:** <the specific flows and key screens>
- **What we're looking for:** <the patterns/answers tied to the questions above>
- **Risks:** <paywalls, login/PII, capture blockers>

## Success criteria (what "done" looks like)
- <concrete, checkable>

## Principal Researcher review
<filled in during step 7: critique summary + verdict, then user approval>
```

PLAN.md template — **usability**:

```
# Research Plan: <Topic>

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Type:** usability
- **Goal it serves:** <one line — the confirmed goal from the README>

## Objectives & research questions
- <what decision this test informs>
- <question 1 the test must answer>

## Product / flow under test
- <the specific product and flow participants will attempt>

## Participants (high level)
- **Profile:** <who we want>   **Target N:** <e.g. 5–8>

## Success criteria (what "done" looks like)
- <e.g. "each research question answered by observed behaviour across ≥5 participants">

## Principal Researcher review
<filled in during step 7: goal-alignment critique + verdict, then user approval>

> Next: run `/plan-usability` to design the test-plan.md instrument (tasks,
> moderator script, metrics) and pass its methodology review before fielding.
```

After creating everything, do NOT jump ahead. Complete the type-appropriate plan gate
in step 7 and get the user's approval first. For benchmark, capture begins only after
that; for usability, the next step is `/plan-usability`.
