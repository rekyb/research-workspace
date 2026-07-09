---
description: Close the active research — verify synthesis exists, mark it closed, clear the active pointer.
---

Close out the currently active research.

Steps:

1. **Locate the research.** Read `.claude/.active-research`. If missing/empty, tell the
   user there's no active research and stop.

2. **Check for synthesis.** Confirm `SYNTHESIS.md` exists in the research folder.
   If it does NOT, warn the user and ask whether to run `/synth-findings` first or
   close anyway. Only proceed on their confirmation.

3. **Update the pattern library (Principal Designer).** Dispatch the Principal
   Designer as a subagent (Agent tool, `general-purpose`) in **Mode P**, handing it
   `.claude/personas/principal-designer.md`, the closing study's `SYNTHESIS.md` and
   `README.md` (for `TYPE` + goal), and the current `research/PATTERNS.md` (it creates
   the file if absent). It extracts the study's reusable patterns, dedupes them
   against the library, merges them in, and flags any contradictions with existing
   entries. Relay its summary (patterns added / updated / contradictions). If
   `SYNTHESIS.md` was missing and the user chose to close anyway, skip this step and
   say so.

4. **Mark closed.** In the research `README.md`, set `**Status:** Closed`, add a
   `**Closed:** <date from `date +%F`>` line, and append a dated "research closed"
   entry to the Log.

5. **Clear the pointer.** Empty (or delete) `.claude/.active-research`.

6. **Report** a short closeout summary: research topic and type, what was studied
   (platforms benchmarked / participants tested), number of features or findings
   synthesized, the patterns contributed to `research/PATTERNS.md`, and the location
   of `SYNTHESIS.md` (+ `.docx` if present).
