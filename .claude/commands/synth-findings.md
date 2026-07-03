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
   `platforms/*/notes.md`. Note which platforms have screenshots and a `flow.gif`.
   If there are no platform notes yet, STOP and tell the user there's nothing to
   synthesize — capture some platforms first.

3. **Write `SYNTHESIS.md`** in the research folder. Structure it as a list of
   **features** distilled across the benchmarked platforms. Lead with a short
   `## Overview` (goal, platforms studied, headline takeaways), then one `##` section
   per feature. Every feature MUST have these five fields, in this order:

   1. **Feature name**
   2. **Short description** — 1–2 sentences.
   3. **Key findings** — what we learned observing it (bullet points; cite the
      platform(s) and evidence: screenshot filename, `flow.gif`, or source URL).
   4. **Why this feature works (rationale)** — the UX/product reasoning.
   5. **How to validate this feature in the future** — concrete next steps
      (usability test, prototype, metric, experiment…).

   Be analytical and opinionated, as a Senior UI/UX Designer. Do not invent findings
   or sources — everything must trace back to captured evidence.

4. **Optional docx.** If `$ARGUMENTS` contains `--docx`, run:
   `python3 .claude/scripts/md_to_docx.py "<research-folder>/SYNTHESIS.md"`
   and confirm the `.docx` path to the user.

5. **Update the log** in the research `README.md` with a dated "synthesis written" entry.

6. **Report** to the user: how many features were synthesized, the file path(s), and
   any gaps you noticed (platforms with thin evidence).
