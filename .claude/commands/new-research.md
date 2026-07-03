---
description: Start a new benchmarking research — creates a dated folder, scaffolds it, and marks it active.
argument-hint: <research topic>
---

You are starting a new secondary desk-research effort. The topic is: **$ARGUMENTS**

Follow these steps exactly:

1. **Check for an already-active research.** Read `.claude/.active-research` if it
   exists. If it points to a research whose `README.md` is not marked `Status: Closed`,
   STOP and tell the user there's an open research (`<path>`); ask them to run
   `/close-research` first, or confirm they want to switch anyway.

2. **Establish and confirm the goal (required).** The research goal drives everything
   downstream — in particular `/review-research` judges the synthesis *against this
   goal* — so it must be explicit and unambiguous before anything else happens.
   - If `$ARGUMENTS` already states a clear goal (what we want to learn *and* why —
     e.g. "benchmark X's onboarding to inform our redesign", or "purely benchmark how
     X does Y, no build decision"), capture it and continue.
   - **If the goal is vague, implicit, or missing, STOP and ask the user before
     scaffolding.** Do not invent or assume it, and never leave it as `TBD`. Ask
     specifically: *what do you want to learn, and is this observation/benchmark only,
     or input to a build decision?* That framing changes how `/review-research` later
     judges the work (a benchmark-only goal is judged on soundness/completeness, not a
     build Go/No-Go). Record the confirmed goal in the README `## Goal` section.

3. **Derive the slug.** Build it defensively from the topic:
   - lowercase everything;
   - strip quotes, apostrophes, brackets, and other punctuation entirely (don't
     turn them into hyphens — `"users' data"` → `users-data`, not `users--data`);
   - replace any run of spaces/remaining separators with a single hyphen;
   - collapse repeated hyphens and trim leading/trailing hyphens;
   - keep it concise — if the topic is a long sentence, use the meaningful head
     (roughly the first 5–6 words / ~50 chars), not the whole thing.

   Get today's date with `date +%F` (or the harness-provided current date if
   available). Folder path = `research/<YYYY-MM-DD>-<slug>/`.

4. **Scaffold the folder:**
   - `research/<...>/platforms/` (empty; one subfolder per platform gets added later)
   - `research/<...>/sources.md` — header `# Sources — <topic>` and a table with
     columns: Platform | URL | Accessed | Notes.
   - `research/<...>/README.md` — the research brief (see template below).
   - `research/<...>/PLAN.md` — the research plan (see template below). Leave the
     platform-specific sections as a skeleton if the platforms are not named yet.

5. **Set the active pointer.** Write the folder path (no trailing slash) into
   `.claude/.active-research`.

6. **Draft and review the research plan (quality gate — before any capture).**
   The plan is what the Principal Researcher signs off on before fieldwork starts,
   so no browsing/capture happens until this gate passes.
   - **You need the platforms first.** If the topic already names them, draft the
     plan now. If not, ask the user which platforms to benchmark, and run this step
     as soon as they answer — do not draft a plan against unknown platforms.
   - **Draft `PLAN.md`:** derive key research questions from the `## Goal`, list the
     platforms, and for each name the specific flows/screens to capture, the success
     criteria (what "done" looks like), and known risks (paywalls, login/PII).
   - **Dispatch the Principal Researcher in plan-review mode.** Use the Agent tool
     (`general-purpose`) and hand it the persona spec at
     `.claude/personas/principal-researcher.md` (Mode A) plus the drafted `PLAN.md`
     and the `README.md`. It returns a critique with must-fixes.
   - **Revise `PLAN.md`** to address the must-fixes (plan revisions may be applied
     directly — this is pre-capture), then **present the plan to the user for
     approval.** Only once they approve does capture begin.

7. **Confirm** to the user: folder created, the confirmed goal, the approved plan,
   and that capture happens next via the Claude-in-Chrome tools.

README.md template (fill in what you know from the topic; the `## Goal` is required —
it must hold the confirmed goal from step 2, never `TBD`; leave other fields TBD only
where genuinely unknown):

```
# Research: <Topic>

- **Status:** Active
- **Started:** <YYYY-MM-DD>
- **Researcher:** Claude (acting Senior UI/UX Designer)

## Goal
<the confirmed goal from step 2 — what we want to learn and why. State whether this is
observation/benchmark only, or input to a build decision; /review-research judges the
synthesis against this.>

## Scope
<what's in / out of scope>

## Platforms to benchmark
- [ ] <platform 1>
- [ ] <platform 2>

## Log
- <YYYY-MM-DD> — research created.
```

PLAN.md template (fill from the goal; leave the per-platform block as a skeleton if
platforms are not named yet — it gets completed in step 6 before the plan review):

```
# Research Plan: <Topic>

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Goal it serves:** <one line — the confirmed goal from the README>

## Key research questions
- <question 1 derived from the goal>
- <question 2 …>

## Per-platform capture plan
### <platform 1>
- **Flows/screens to capture:** <the specific flows and key screens>
- **What we're looking for:** <the patterns/answers tied to the questions above>
- **Risks:** <paywalls, login/PII, capture blockers>

## Success criteria (what "done" looks like)
- <concrete, checkable — e.g. "core learning flow recorded end-to-end on each platform">

## Principal Researcher review
<filled in during step 6: critique summary + verdict, then user approval>
```

After creating everything, do NOT start browsing yet. First complete the plan gate
(step 6): once the platforms are known, draft `PLAN.md`, have the Principal Researcher
review it, revise, and get the user's approval. Capture begins only after that.
