---
description: Show the research board — the active study and all past/closed research — in the terminal, and refresh BOARD.md.
---

Render the **research board** to the terminal: every currently active study and
every past (closed / archived) one. Then refresh `BOARD.md` so the committed board
never drifts from what's actually on disk.

The **source of truth** is the research folders themselves — never trust a stale
table. Derive everything fresh, then reconcile `BOARD.md` to match.

Steps:

1. **Find the active studies.** Read `.claude/.active-research` (the registry — see
   `.claude/references/active-research.md`). **Each line** names an active study;
   every one is an **Active** row (there may be several). If the file is
   missing/empty, there is no active study — say so in the Active section. As
   housekeeping, prune stale per-terminal bindings: delete any file in
   `.claude/.current-research/` whose path is not a line in the registry.

2. **Enumerate every study.** List the folders under `research/` (ignore
   `PATTERNS.md` and any non-study file). For each folder, read its `README.md` and
   extract:
   - **Title** — the first `#` heading (strip a leading `Research:` prefix).
   - **Type** — the `**Type:**` line if present; if absent, treat it as `benchmark`
     (the workspace default, pre-dating the type-aware spine). `litreview` is a fully
     valid `Type` value and renders in the tables exactly like `benchmark` or
     `usability` — no special-casing needed.
   - **Started** — the `**Started:**` date.
   - **Closed** — the `**Closed:**` date if present, else `—`.
   - **Status** — the `**Status:**` value (Active / Closed).
   A folder with **no `README.md`** (e.g. an early notes-only capture) is listed as
   **Archived (notes only)** with Started taken from its `YYYY-MM-DD-` folder-name
   prefix and Closed `—`. Never fabricate a status; report what the folder actually
   shows.

3. **Print the board to the terminal**, most recent first within each group:

   - A short header line: total studies, and how many active vs closed/archived.
   - **Active** — a table (or "No active research — run `/new-research` to start
     one.") with one row per registry line and columns: Research (title + folder
     path) · Type · Started · Status.
   - **Closed & archived** — a table with columns: Research · Type · Started ·
     Closed · Status.

   Keep it skimmable — this is a terminal readout, so a compact markdown table is
   fine; link each study to its folder.

4. **Refresh `BOARD.md`.** Rewrite `BOARD.md` from the same derived data so it
   matches what you just printed: the `## Active` table and the `## Closed &
   archived` table (most recent first), and update the `_Last updated: <date>_`
   line using `date +%F`. Preserve the file's intro paragraph. If `BOARD.md` is
   missing, create it with that structure. Only touch `BOARD.md` — do not edit any
   study's `README.md`.

5. **Report** one line noting whether `BOARD.md` changed (and how — e.g. "moved
   Khan study from Active to Closed", "added new study") or was already in sync.

This command is **read-mostly**: it only ever writes `BOARD.md`. It never changes a
study's status, never closes or opens research, and never browses any platform.
