---
name: close-research
description: Close the active research — verify synthesis exists, mark it closed, clear the active pointer.
---

Close out the currently active research.

Steps:

1. **Locate the research.** Read `.claude/.active-research`. If missing/empty, tell the
   user there's no active research and stop.

2. **Check for synthesis.** Confirm `SYNTHESIS.md` exists in the research folder.
   If it does NOT, warn the user and ask whether to run `synth-findings` first or
   close anyway. Only proceed on their confirmation.

3. **Mark closed.** In the research `README.md`, set `**Status:** Closed`, add a
   `**Closed:** <date from today's date>` line, and append a dated "research closed"
   entry to the Log.

4. **Clear the pointer.** Empty (or delete) `.claude/.active-research`.

5. **Report** a short closeout summary: research topic, platforms benchmarked, number
   of features synthesized, and the location of `SYNTHESIS.md` (+ `.docx` if present).
