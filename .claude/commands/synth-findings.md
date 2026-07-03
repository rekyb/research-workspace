---
description: Synthesize the active research into SYNTHESIS.md (add --docx for a Word copy).
argument-hint: [--docx]
---

Synthesize the currently active research into a design-ready findings document.

Arguments: `$ARGUMENTS` (if it contains `--docx`, also produce a Word file).

Steps:

1. **Locate the research.** Read `.claude/.active-research` for the folder path. If it's
   missing or empty, STOP and tell the user to run `/new-research` first.

2. **Gather the evidence.** Read the folder's `README.md`, `sources.md`, and every
   `platforms/*/notes.md` and `platforms/*/flow.md`. Note which platforms have
   screenshots and a `flow.gif`. If there are no platform notes yet, STOP and tell
   the user there's nothing to synthesize — capture some platforms first.

3. **Write `SYNTHESIS.md`** in the research folder. Structure it as a list of
   **features** distilled across the benchmarked platforms. Lead with a short
   `## Overview` (goal, platforms studied, headline takeaways), then one `##` section
   per feature. Every feature MUST have these five fields, in this order:

   1. **Feature name**
   2. **Short description** — 1–2 sentences.
   3. **Key findings** — what we learned observing it (bullet points). Cite the
      platform(s) and evidence. **CRITICAL:** When citing a screenshot or GIF, embed
      it directly using relative markdown syntax (e.g., `![description](../platforms/<platform>/screenshots/filename.png)` or `![flow](../platforms/<platform>/flow.gif)`).
   4. **Why this feature works (rationale)** — the UX/product reasoning.
   5. **How to validate this feature in the future** — concrete next steps
      (usability test, prototype, metric, experiment…).

   After all features, end the document with a final `## Gaps & caveats` section detailing
   methodological limitations, paywalls encountered, or unanswered questions.

   Be analytical and opinionated, as a Senior UI/UX Designer. Do not invent findings
   or sources — everything must trace back to captured evidence.

4. **Principal Researcher QA pass (quality gate — before `/review-research`).**
   Dispatch the Principal Researcher as a subagent (Agent tool, `general-purpose`) in
   synthesis-QA mode, handing it the persona spec at
   `.claude/personas/principal-researcher.md` (Mode B), the freshly written
   `SYNTHESIS.md`, the `README.md` (goal/scope), and every `platforms/*/notes.md`
   and `platforms/*/flow.md`. It will:
   - **review** each feature for the five required fields, evidence grounding (no
     fabrication), testable validation steps, and gaps/overlaps;
   - **auto-fix prose** directly in `SYNTHESIS.md` and every `platforms/*/notes.md`
     and `platforms/*/flow.md` — rewrite AI-slop sentences and remove em-dashes,
     changing no findings, numbers, or citations (style only; meaning preserved);
   - **flag content problems as inline `> [Principal Researcher] …` annotations**
     (never silently editing substance) and append a dated
     `## Principal Researcher QA — <date>` record to `SYNTHESIS.md`.

   Do this **before** the docx export so the cleaned, annotated version is what gets
   exported. Relay the agent's readiness verdict and flagged items to the user — those
   are what they resolve before running `/review-research`.

5. **Optional docx.** If `$ARGUMENTS` contains `--docx`, run:
   `python3 .claude/scripts/md_to_docx.py "<research-folder>/SYNTHESIS.md"`
   and confirm the `.docx` path to the user.

6. **Update the log** in the research `README.md` with a dated "synthesis written" entry
   (note that the Principal Researcher QA pass ran, with the flagged-item count).

7. **Report** to the user: how many features were synthesized, the file path(s), the
   Principal Researcher's readiness verdict, the content items it flagged for
   resolution, and any gaps you noticed (platforms with thin evidence).
