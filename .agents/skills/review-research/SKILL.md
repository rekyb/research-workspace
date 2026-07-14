---
name: review-research
description: Review the active research's SYNTHESIS.md through three stakeholder personas (Head of Product, PM, Tech Lead), then — on approval — append the verdict as an Agent Review section.
---

Run a multi-persona stakeholder review of the **active research's** synthesis, then — only after the user approves — record it in `SYNTHESIS.md` under `## Agent Review`.

This is a critique step, not a capture step. The reviewers judge the *features or findings we synthesized*, they do not go browsing. Everything they say must trace back to what is already in the research folder — **do not invent evidence, metrics, or findings** (same guardrail as the rest of the workspace).

## Steps

1. **Locate the research & its synthesis.** Read `.claude/.active-research` for the folder path. If it's missing/empty, STOP and tell the user to run `new-research`. Then check that `<folder>/SYNTHESIS.md` exists. If it does not, STOP and tell the user to run `synth-findings` first — there is nothing to review yet.

2. **Gather the ground truth.** Read `SYNTHESIS.md` in full, plus the research `README.md` and every `platforms/*/notes.md` (or `sessions/session-*.md`), so the reviewers judge against real captured evidence (screenshots, `flow.gif`, source URLs, participant notes) and the stated goal/scope/type. If the user passed a specific focus/argument, weight the review toward it but still cover the whole synthesis.

   **Anchor every persona to the research's stated `## Goal` (from its README).** The goal sets what "good" means and how the personas judge:
   - If the goal is **observation / benchmark only** (no build intent), the personas judge the synthesis on *soundness, completeness, and decision-usefulness of the benchmark* — is it accurate, well-evidenced, and does it surface the right patterns? A build **Go/No-Go is out of scope**; instead the Head of Product gives a "benchmark is solid / has gaps / redo" style call. Say so explicitly rather than forcing a build verdict.
   - If the goal is **input to a build decision** (what should *we* build), apply the full lens: PM soundness, Tech Lead feasibility, Head of Product Go / Conditional Go / No-Go.
   If the README `## Goal` is vague or missing, STOP and ask the user to state it before reviewing — the review is only meaningful against an explicit goal.

3. **Run the three personas as separate subagents, chained so they can cross-talk.** Each persona is defined in its own spec under `.claude/personas/` — dispatch it via subagent (`general-purpose` / `research` or subagent configured with same rules), handing it its spec file plus the ground truth from step 2. Run them **sequentially**, passing each later persona the full text of the earlier personas' reviews so they can agree with, build on, or challenge each other. Order and specs:

   1. **Product Manager (PM)** — `.claude/personas/product-manager.md`. Product-side soundness. Verdict per feature/finding: **Sound / Needs refinement / Reject**.

   2. **Tech Lead** — `.claude/personas/tech-lead.md`. Implementation feasibility; has read the PM's review. Verdict per feature/finding: **Low / Medium / High build effort**, plus the top feasibility risk.

   3. **Head of Product** — `.claude/personas/head-of-product.md`. High-level business judgment, decides last, having read both prior reviews. Verdict per feature/finding: **Go / Conditional Go / No-Go** (or, for a benchmark-only goal, a benchmark solid / has gaps / redo call — see step 2).

   Each spec carries that persona's full remit, verdict scale, and guardrails; the personas must be **opinionated and specific**, cite each entry by name, and ground every claim in the synthesis/evidence — no fabricated numbers.

4. **Assemble the review block** as a single markdown section titled `## Agent Review`, with a dated subheading and one `###` subsection per persona (PM, Tech Lead, Head of Product), followed by a short `### Consolidated verdict` table (Feature/Finding | PM | Tech Lead | Head of Product call). Keep it tight and skimmable.

   **Always include a `### Legend` (verdict key)** right after the consolidated table so a reader never has to guess what a rating means. This legend is the canonical, reader-facing definition of each scale; the persona specs in `.claude/personas/` mirror it, so keep the two in sync if either changes. Define every scale used:
   - **PM soundness** — *Sound* (right feature/finding for the goal, well-scoped and coherent — ship/validate as-is) · *Needs refinement* (valuable but has scope, framing, or evidence gaps to resolve before committing) · *Reject* (not the right feature/finding for the goal, or not worth pursuing).
   - **Tech Lead build effort** — *Low* (authored content/config or standard components; no novel infra or ML) · *Medium* (non-trivial but well-trodden engineering — state, scheduling, aggregation; no major new risk surface) · *High* (a major workstream: novel infra, a security surface, or recurring ML/inference cost plus eval).
   - **Head of Product call** — *Go* (build it; clear impact and fit) · *Conditional Go* (pursue only once a stated condition is met — state the condition) · *No-Go* (do not build now).

5. **Checkpoint — do NOT write yet.** Present the assembled `## Agent Review` block to the user in chat and ask for explicit approval to save it. If they want changes, revise and re-present. **Only proceed to step 6 on a clear yes.** (This mirrors the workspace rule to confirm before writing a deliverable.)

6. **On approval, write it into `SYNTHESIS.md`.** Append the `## Agent Review` section at the end of the file. If an `## Agent Review` section already exists from a prior run, replace it (keep only the latest) rather than stacking duplicates. Then add a dated "agent review recorded" entry to the research `README.md` log.

7. **Report** to the user: the per-item consolidated verdict in one line each, the file updated, and any item the reviewers flagged as high-risk or No-Go.
