---
description: Expert heuristic evaluation (Nielsen's 10) of a benchmark study's captured platforms, written to lenses/heuristic-eval.md.
argument-hint: [research-folder]
---

Run an expert **heuristic evaluation** over a benchmark study's already-captured
evidence, scoring each platform against **Nielsen's 10 usability heuristics**. This
is a retrospective analysis *lens* — it reads what is on disk and never browses the
platforms, so it works on a closed study just as well as the active one.

Steps:

1. **Locate the study & confirm it's a benchmark.** If `$ARGUMENTS` names a folder,
   use it (a lens may target a **closed** study); otherwise resolve it per
   `.claude/references/active-research.md` (this terminal's binding, else the sole
   active study, else ask which study to evaluate). Read its `README.md` and check `Type`:
   - This lens is **benchmark-only** (it reads `platforms/*/`). If `Type` is
     `usability` (or anything without a `platforms/` folder), STOP and tell the user
     heuristic evaluation runs on benchmark captures — a usability study's expert
     review belongs in its `SYNTHESIS.md` findings instead.

2. **Gather the evidence.** For each `platforms/<platform>/`, read `notes.md` and
   `flow.md`, and list the `screenshots/*.png` (and `flow.gif`). If no platform has
   any captured evidence, STOP — there's nothing to evaluate yet.

3. **Evaluate each platform against Nielsen's 10 heuristics**, grounded only in the
   captures. The ten: (1) Visibility of system status, (2) Match between system &
   the real world, (3) User control & freedom, (4) Consistency & standards, (5) Error
   prevention, (6) Recognition rather than recall, (7) Flexibility & efficiency of
   use, (8) Aesthetic & minimalist design, (9) Help users recognize/diagnose/recover
   from errors, (10) Help & documentation.

4. **Write `lenses/heuristic-eval.md`** in the study folder (create the `lenses/`
   subfolder if absent). Structure:
   - `## Overview` — study + goal, platforms evaluated, method (Nielsen's 10, expert
     review over captured stills/flows), and an issue tally by severity.
   - One `## <Platform>` section each. Within it, list findings as entries — cover
     both **violations** and **exemplary uses** (benchmarking is here to harvest good
     patterns, not just faults). Each entry has, in order:
     1. **Heuristic** — number + name.
     2. **Observation** — what the capture shows (violation or strength).
     3. **Severity (0–4)** — Nielsen's scale (0 = not a problem … 4 = usability
        catastrophe); use `—` for a positive/exemplary finding.
     4. **Evidence** — cite and embed the specific screenshot/flow step with relative
        markdown (`![...](../platforms/<platform>/screenshots/NN-....png)`), or the
        `flow.gif`.
     5. **Recommendation** — the change it implies (for a violation) or the reusable
        takeaway (for a strength).
   - `## Cross-platform heuristic patterns` — what generalizes across the platforms
     (recurring strengths worth stealing; recurring violations worth avoiding).
   - `## Limits` — an expert review over stills cannot fully judge interaction-only
     heuristics (system-status feedback timing, error recovery, control/undo); name
     which heuristics would need live use or a moderated test to confirm.

   **Do not invent findings.** Every observation traces to a specific capture. If a
   heuristic can't be judged from what was captured, say so rather than guessing.

5. **Update the log** in the study `README.md` with a dated "heuristic evaluation
   run" entry (platforms covered, issue count by severity).

6. **Report** to the user: platforms evaluated, top violations by severity, the
   strongest exemplary patterns worth reusing, the file path, and any heuristic that
   couldn't be assessed from the captures.
