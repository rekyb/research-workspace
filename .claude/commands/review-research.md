---
description: Review the active research's SYNTHESIS.md through three stakeholder personas (Head of Product, PM, Tech Lead), then — on approval — append the verdict as an Agent Review section.
argument-hint: [optional focus, e.g. "focus on feature 2"]
---

Run a multi-persona stakeholder review of the **active research's** synthesis, then
— only after the user approves — record it in `SYNTHESIS.md` under `## Agent Review`.

This is a critique step, not a capture step. The reviewers judge the *features we
synthesized*, they do not go browsing. Everything they say must trace back to what is
already in the research folder — **do not invent evidence, metrics, or findings**
(same guardrail as the rest of the workspace).

## Steps

1. **Locate the research & its synthesis.** Read `.claude/.active-research` for the
   folder path. If it's missing/empty, STOP and tell the user to run `/new-research`.
   Then check that `<folder>/SYNTHESIS.md` exists. If it does not, STOP and tell the
   user to run `/synth-findings` first — there is nothing to review yet.

2. **Gather the ground truth.** Read `SYNTHESIS.md` in full, plus the research
   `README.md` and every `platforms/*/notes.md`, so the reviewers judge against real
   captured evidence (screenshots, `flow.gif`, source URLs) and the stated goal/scope.
   If the user passed a focus in `$ARGUMENTS`, weight the review toward it but still
   cover the whole synthesis.

   **Anchor every persona to the research's stated `## Goal` (from its README).** The
   goal sets what "good" means and how the personas judge:
   - If the goal is **observation / benchmark only** (no build intent), the personas
     judge the synthesis on *soundness, completeness, and decision-usefulness of the
     benchmark* — is it accurate, well-evidenced, and does it surface the right
     patterns? A build **Go/No-Go is out of scope**; instead the Head of Product gives
     a "benchmark is solid / has gaps / redo" style call. Say so explicitly rather than
     forcing a build verdict.
   - If the goal is **input to a build decision** (what should *we* build), apply the
     full lens: PM soundness, Tech Lead feasibility, Head of Product Go / Conditional
     Go / No-Go.
   If the README `## Goal` is vague or missing, STOP and ask the user to state it before
   reviewing — the review is only meaningful against an explicit goal.

3. **Run the three personas as separate subagents, chained so they can cross-talk.**
   Dispatch them **sequentially** with the Agent tool (`general-purpose`), passing each
   later persona the full text of the earlier personas' reviews so they can agree with,
   build on, or challenge each other. Order and remit:

   1. **Product Manager (PM) — product-side soundness.** Are these the right features
      for the stated user goal? Is each feature well-scoped, coherent, and framed around
      a real user problem? Flag gaps, overlaps, weak problem statements, missing user
      segments, and whether the "how to validate" step for each feature is actually
      testable. Verdict per feature: **Sound / Needs refinement / Reject**, with reasons.

   2. **Tech Lead — implementation feasibility.** Given each feature as described, how
      hard is it to build? Call out technical complexity, dependencies, data/ML needs
      (e.g. an AI tutor implies models + eval), platform/infra assumptions, and risks.
      This persona has read the PM's review and may agree or push back on it. Verdict per
      feature: **Low / Medium / High build effort**, plus the top feasibility risk.

   3. **Head of Product — high-level business judgment (decides last).** Having read
      both the PM and Tech Lead reviews, give the executive take: business impact,
      strategic fit, priority/sequencing, and a clear **Go / Conditional Go / No-Go**
      call per feature (state the condition when Conditional). Close with a one-paragraph
      overall verdict and the single most important next step.

   Each persona must be **opinionated and specific**, cite the feature by name, and
   ground claims in the synthesis/evidence — no fabricated numbers.

4. **Assemble the review block** as a single markdown section titled `## Agent Review`,
   with a dated subheading and one `###` subsection per persona (PM, Tech Lead, Head of
   Product), followed by a short `### Consolidated verdict` table (Feature | PM | Tech
   Lead | Head of Product call). Keep it tight and skimmable.

   **Always include a `### Legend` (verdict key)** right after the consolidated table so
   a reader never has to guess what a rating means. Define every scale used:
   - **PM soundness** — *Sound* (right feature for the goal, well-scoped and coherent —
     ship/validate as-is) · *Needs refinement* (valuable but has scope, framing, or
     evidence gaps to resolve before committing) · *Reject* (not the right feature for
     the goal, or not worth pursuing).
   - **Tech Lead build effort** — *Low* (authored content/config or standard components;
     no novel infra or ML) · *Medium* (non-trivial but well-trodden engineering — state,
     scheduling, aggregation; no major new risk surface) · *High* (a major workstream:
     novel infra, a security surface, or recurring ML/inference cost plus eval).
   - **Head of Product call** — *Go* (build it; clear impact and fit) · *Conditional Go*
     (pursue only once a stated condition is met — state the condition) · *No-Go* (do
     not build now).

5. **Checkpoint — do NOT write yet.** Present the assembled `## Agent Review` block to
   the user in chat and ask for explicit approval to save it. If they want changes,
   revise and re-present. **Only proceed to step 6 on a clear yes.** (This mirrors the
   workspace rule to confirm before writing a deliverable.)

6. **On approval, write it into `SYNTHESIS.md`.** Append the `## Agent Review` section
   at the end of the file. If an `## Agent Review` section already exists from a prior
   run, replace it (keep only the latest) rather than stacking duplicates. Then add a
   dated "agent review recorded" entry to the research `README.md` log.

7. **Report** to the user: the per-feature consolidated verdict in one line each, the
   file updated, and any feature the reviewers flagged as high-risk or No-Go.
