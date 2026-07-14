# Gemini Integration Guide (Antigravity CLI)

This workspace is optimized for desk-research, UX benchmarking, and usability testing. While originally configured for Claude Code via the `.claude/commands/` slash commands, it is fully compatible with Gemini running within the Antigravity CLI. 

This file acts as the bridge for Gemini to understand how to operate this workspace natively. All 11 slash commands have been fully ported into first-class Gemini Skills (`.agents/skills/*/SKILL.md`).

---

## How to Work in this Repository

As Gemini, you do not use the `.claude` slash commands directly. Instead, you operate via your intent-matching capabilities or by invoking the skills inside `.agents/skills/`. When the user asks you to perform research tasks, follow these mapped workflows:

### 1. Starting New Research (`new-research`)
When the user asks to start a new research topic (or run `new-research`):
- Read `.claude/.active-research` to ensure no research is currently active. If one is, ask the user to close it first.
- Check for an optional `--type <benchmark | usability>` flag (defaulting to `benchmark`).
- **Confirm the goal:** Explicitly establish the `## Goal` (what we want to learn and why, or what decision the usability test informs) before scaffolding.
- Create a new directory at `research/<YYYY-MM-DD>-<topic-slug>`.
- Scaffold the directory by type (`README.md`, `PLAN.md`, `sources.md`, plus `platforms/` for benchmark or `sessions/` for usability).
- Write the new folder path to `.claude/.active-research` and automatically refresh `BOARD.md` to show the new study as **Active**.
- Dispatch the Principal Researcher (`Mode A`) to review the drafted `PLAN.md` before user approval and capture/fielding.

### 2. Capturing Evidence (`benchmark` Studies)
- **Browser Control:** Use your available browser/web tools to navigate and interact with benchmarked platforms.
- **Redaction is CRITICAL (Hard Rule):** Before saving any visual evidence, you MUST inject CSS or manipulate the DOM to blur personal data (avatars, names, emails) to comply with the workspace's zero-PII policy. 
- Save screenshots as numbered PNGs in `platforms/<platform>/screenshots/`.

### 3. Usability Instrument Planning (`plan-usability`)
When the active study is `Type: usability` and the user asks to design the test plan:
- Draft `test-plan.md` in the research folder with non-leading task scenarios, moderator script, metrics (SEQ/SUS), and severity scale (0–4).
- Gate the instrument through the Principal Researcher (`Mode A — methodology review`) to check that tasks don't give away UI hints before presenting for user sign-off.
- Field sessions externally, then drop PII-redacted participant notes into `sessions/session-NN.md`.

### 4. Synthesizing Findings (`synth-findings`)
When asked to synthesize the active research:
- Read the active folder path from `.claude/.active-research` and note its `Type`.
- **Benchmark:** Read `platforms/*/notes.md` and generate `SYNTHESIS.md` with the 5-part feature structure (Feature Name, Short Description, Key Findings, Rationale, Validation). Ensure the key findings section follows the flow: **what the user sees, what the user does, and what the system does**.
- **Usability:** Read `test-plan.md` and `sessions/session-*.md` and generate `SYNTHESIS.md` ordered by **severity (highest first)**, citing pseudonymized participants (P01…).
- Embed relative Markdown images directly (`![flow](../platforms/app/flow.gif)`).
- Gate through the Principal Researcher (`Mode B — synthesis QA`) to auto-fix prose and flag structural gaps via inline `> [Principal Researcher]...` annotations before any `.docx` export (`python3 .claude/scripts/md_to_docx.py`).

### 5. Multi-Persona Stakeholder Review (`review-research`)
When asked to review the active research synthesis:
- Run three chained subagent personas (`Product Manager`, `Tech Lead`, `Head of Product`) from `.claude/personas/` against the stated `## Goal`.
- Assemble their feedback into a clear `## Agent Review` block (with a `### Legend` defining PM soundness, Tech Lead build effort, and Head of Product Go/Conditional Go/No-Go calls).
- Present the review block in chat for user approval before appending it to `SYNTHESIS.md`.

### 6. Canva Feature & Stakeholder Briefs (`brief-feature`)
When asked to create a Canva presentation deck for a reviewed study:
- Draft a skimmable slide outline branching on `Type` (`benchmark` feature story vs. `usability` severity-ranked findings).
- Gate the outline through the Principal Designer (`Mode R — design review`) and verify zero-PII compliance.
- Once approved by the user, build the presentation via Canva MCP tools using the free tier only.

### 7. Closing Research & Pattern Extraction (`close-research`)
When asked to close the active research:
- Verify that `SYNTHESIS.md` exists and check whether `## Agent Review` is present.
- **Pattern Extraction:** Dispatch the Principal Designer (`Mode P`) to extract reusable design patterns (`benchmark-observed` or `usability-validated`) and merge them into `research/PATTERNS.md`.
- Mark the status in the research's `README.md` to `Closed` and empty `.claude/.active-research`.
- Refresh `BOARD.md` so the study moves from **Active** to **Closed & archived**.

### 8. Publishing (`publish-research`)
When asked to publish or commit:
- Perform a final visual safety check on all benchmark captures (`screenshots/*.png`, `flow.gif`) and usability session notes (`session-*.md`) to guarantee zero PII is visible.
- Ensure no paywalls were breached.
- Commit via standard `git` terminal commands and `git push` (or `gh pr create`).

### 9. Showing the Research Board (`research-board`)
When asked to show the research board, or which studies exist:
- Treat `research/` folders as the source of truth.
- Print two tables (`Active` and `Closed & archived`) to the terminal.
- Automatically refresh `BOARD.md` (`## Active` and `## Closed & archived` tables + `_Last updated:_` date) so the committed board never drifts.

### 10. Benchmark Analysis Lenses (`heuristic-eval`, `a11y-audit`, `extract-tokens`)
Optional retrospective analysis passes over a **benchmark** study's captured evidence (`platforms/`), writing to a `lenses/` subfolder:
- **Heuristic eval (`heuristic-eval`):** Score each captured platform against Nielsen's 10 heuristics (violations and exemplary patterns), severity-ranked (`0–4`).
- **A11y audit:** Sample pixels with Pillow to measure colour contrast, target size, and visible labels (`lenses/a11y-audit.md`).
- **Extract tokens:** Sample design tokens (colour/type/spacing/radius) with Pillow (`lenses/tokens.md`).

---

## Skill Architecture

All 11 skills reside in `.agents/skills/<skill-name>/SKILL.md` with complete YAML frontmatter (`name`, `description`). Gemini automatically triggers these workflows when matching conversational intent or when invoked directly.
