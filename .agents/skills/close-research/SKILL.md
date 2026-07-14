---
name: close-research
description: Close the active research — verify synthesis exists, extract/merge PATTERNS.md (if benchmark), mark it closed, and clear the active pointer.
---

Close the active research. This is the official completion step of the research lifecycle: it locks the study, extracts reusable patterns into the workspace pattern library (`PATTERNS.md`), and frees up `.claude/.active-research` so a new effort can start.

## Steps

1. **Locate the research.** Read `.claude/.active-research`. If it is missing or empty, STOP — there is no active research to close. Read the folder's `README.md` and check its `Type` (`benchmark` or `usability`).

2. **Verify readiness.**
   - Check that `SYNTHESIS.md` exists inside the research folder. If it does not, STOP and tell the user to run `synth-findings` first (never close an unsynthesized research).
   - Read `SYNTHESIS.md` and check whether it contains an `## Agent Review` section (the stakeholder critique from `review-research`). If `## Agent Review` is missing, warn the user that they are closing research without a recorded stakeholder review, and ask if they want to proceed anyway or run `review-research` first. Only continue on explicit approval.

3. **Pattern extraction (Principal Designer — Mode P, before closing).** Dispatch the Principal Designer as a subagent (`general-purpose` / `research` or subagent configured with same rules) in **Mode P (pattern extraction)**, handing it `.claude/personas/principal-designer.md`, the study's `SYNTHESIS.md`, and the workspace pattern library `research/PATTERNS.md`. It will extract the reusable design patterns right out of the synthesis (if `Type: benchmark`, `benchmark-observed` patterns; if `Type: usability`, `usability-validated` patterns) and merge them into `PATTERNS.md` — adding new ones and linking back to the closing study on existing ones. It modifies `PATTERNS.md` directly. Tell the user what the Principal Designer extracted / merged.
   - If `research/PATTERNS.md` does not exist yet, the Principal Designer will create it using the standard pattern library structure.

4. **Mark closed.**
   - In `<folder>/README.md`, change `Status: Active` to `Status: Closed` and set `Closed: <YYYY-MM-DD>` (today's date). Add a dated entry to the `## Log` saying the research was closed and patterns extracted into `PATTERNS.md`.
   - Empty `.claude/.active-research` (write the empty string or delete its contents so it reads zero bytes).

5. **Refresh the board.** Run the same board-reconciliation logic (`BOARD.md`) as `research-board` does: re-derive `BOARD.md` from the `research/` folders + the now-empty `.claude/.active-research` so the study moves from the `## Active` table to the `## Closed & archived` table (most recent first) and the `_Last updated:_` date reflects today. Do not print the full board here — just keep `BOARD.md` in sync.

6. **Report** to the user:
   - What research was closed (`<folder>`).
   - Which reusable patterns were added or updated in `research/PATTERNS.md`.
   - That `BOARD.md` was updated (`Active` → `Closed & archived`).
   - That `.claude/.active-research` is cleared, and they can start a new topic anytime with `new-research`.
