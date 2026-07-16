---
name: synth-findings
description: Synthesize the active research into SYNTHESIS.md, using the template for its Type (add --docx for a Word copy).
---

Synthesize the currently active research into a design-ready findings document. The synthesis template is chosen by the research **type**.

Arguments: if the user prompt/arguments contain `--docx`, also produce a Word file.

Steps:

1. **Locate the research & read its type.** Resolve the target study per `.claude/references/active-research.md` (explicit `[folder]` arg, else this terminal's binding, else the sole active study, else ask). If the registry is empty, STOP and tell the user to run `new-research` first. Read the folder's `README.md` and note its `Type` (`benchmark` or `usability`). Everything below branches on it.

2. **Gather the evidence — by type.**
   - **Benchmark:** read `README.md`, `sources.md`, and every `platforms/*/notes.md` and `platforms/*/flow.md`. Note which platforms have screenshots and a `flow.gif`. If there are no platform notes yet, STOP — capture some platforms first.
   - **Usability:** read `README.md`, `test-plan.md`, and every `sessions/session-*.md`. If there is no `test-plan.md`, STOP and tell the user to run `plan-usability` first. If there are no session notes yet, STOP — the sessions must be fielded and written into `sessions/` before there's anything to synthesize.

3. **Write `SYNTHESIS.md`** in the research folder, using the template for the type.

   **Benchmark → a list of features.** Lead with a short `## Overview` (goal, platforms studied, headline takeaways), then one `##` section per feature. Every feature MUST have these five fields, in this order:
   1. **Feature name**
   2. **Short description** — 1–2 sentences.
   3. **Key findings** — what we learned observing it. Cite the platform(s) and evidence. **CRITICAL:** embed each cited screenshot or GIF directly with relative markdown (e.g. `![description](../platforms/<platform>/screenshots/filename.png)` or `![flow](../platforms/<platform>/flow.gif)`).
   4. **Why this feature works (rationale)** — the UX/product reasoning.
   5. **How to validate this feature in the future** — concrete next steps (usability test, prototype, metric, experiment…).

   **Usability → a list of findings, severity-ranked.** Lead with an `## Overview` (goal, method, participant count, headline findings) and a `## Metrics summary` (task success rates, SEQ/SUS, time-on-task — a small table). Then one `##` section per finding, **ordered by severity, highest first.** Every finding MUST have, in this order:
   1. **Finding** — the observed problem or insight.
   2. **Evidence** — which sessions/participants, task success/failure counts, and **redacted** quotes support it (embed any relevant capture with relative markdown). Reference participants by pseudonym (P01…), never real names.
   3. **Severity (0–4)** and the **affected task / usability heuristic**.
   4. **Recommendation** — the concrete design change it implies.
   Then add a `## What worked` section (positive findings worth preserving).

   For **both** types, end with a `## Gaps & caveats` section (methodological limits, paywalls, thin evidence, unanswered questions). Be analytical and opinionated as a Senior UI/UX Designer. **Do not invent findings, participants, or sources** — everything traces to captured evidence or a session note.

4. **Principal Researcher QA pass (quality gate — before `review-research`).** Dispatch the Principal Researcher as a subagent (`general-purpose` / `research` or subagent configured with same rules) in **Mode B (synthesis QA)**, handing it `.claude/personas/principal-researcher.md`, the freshly written `SYNTHESIS.md`, the `README.md` (goal/scope/type), and the type's source material (benchmark: every `platforms/*/notes.md` and `platforms/*/flow.md`; usability: `test-plan.md` and every `sessions/session-*.md`). Tell it the research **type** so it checks the right required fields (the five feature fields, or the four finding fields + severity-ordering). It will:
   - **review** each entry for its required fields, evidence grounding (no fabrication), testable/actionable next steps, and gaps/overlaps;
   - **auto-fix prose** directly in `SYNTHESIS.md` and the source notes — rewrite AI-slop and remove em-dashes, changing no findings, numbers, or citations;
   - **flag content problems as inline `> [Principal Researcher] …` annotations** (never silently editing substance) and append a dated `## Principal Researcher QA — <date>` record to `SYNTHESIS.md`.

   Do this **before** the docx export so the cleaned, annotated version is what gets exported. Relay the agent's readiness verdict and flagged items to the user.

5. **Optional docx.** If arguments contain `--docx`, run:
   `python3 .claude/scripts/md_to_docx.py "<research-folder>/SYNTHESIS.md"`
   and confirm the `.docx` path to the user.

6. **Update the log** in the research `README.md` with a dated "synthesis written" entry (note the type, the entry count, and that the Principal Researcher QA pass ran with the flagged-item count).

7. **Report** to the user: the type, how many features/findings were synthesized, the file path(s), the Principal Researcher's readiness verdict, the content items it flagged for resolution, and any gaps you noticed (thin evidence, few participants).
