# Gemini Integration Guide (Antigravity CLI)

This workspace is optimized for desk-research and benchmarking. While originally configured for Claude Code via the `.claude/commands/` slash commands, it is fully compatible with Gemini running within the Antigravity CLI. 

This file acts as the bridge for Gemini to understand how to operate this workspace natively.

## How to Work in this Repository

As Gemini, you do not use the `.claude` slash commands directly. Instead, you operate via your intent-matching capabilities. When the user asks you to perform research tasks, follow these mapped workflows:

### 1. Starting New Research (Equivalent to `/new-research`)
When the user asks to start a new research topic:
- Read `.claude/.active-research` to ensure no research is currently active. If one is, ask the user to close it first.
- Create a new directory at `research/<YYYY-MM-DD>-<topic-slug>`. Derive the date from your system metadata.
- Scaffold the directory with `README.md`, `sources.md`, and an empty `platforms/` folder.
- Write the new folder path to `.claude/.active-research`.

### 2. Capturing Evidence
- **Browser Control:** Use your available browser/web tools to navigate and interact with benchmarked platforms.
- **Redaction is CRITICAL (Hard Rule):** Before saving any visual evidence, you MUST inject CSS or manipulate the DOM to blur personal data (avatars, names, emails) to comply with the workspace's zero-PII policy. 
- Save screenshots as numbered PNGs in `platforms/<platform>/screenshots/`.

### 3. Synthesizing Findings (Equivalent to `/synth-findings`)
When asked to synthesize the active research:
- Read the active folder path from `.claude/.active-research`.
- Read the evidence in `platforms/*/notes.md` and `sources.md`.
- Generate `SYNTHESIS.md` following the strict 5-part structure: Feature Name, Short Description, Key Findings, Rationale, Validation. 
- Ensure you embed Markdown images for evidence directly in the document (e.g., `![flow](../platforms/app/flow.gif)`).
- End with a `## Gaps & caveats` section.

### 4. Closing Research (Equivalent to `/close-research`)
When asked to close the active research:
- Verify that `SYNTHESIS.md` exists.
- Mark the status in the research's `README.md` to `Closed`.
- Empty the `.claude/.active-research` pointer file.

### 5. Publishing (Equivalent to `/publish-research`)
When asked to publish or commit:
- Perform a final visual safety check on all images to guarantee no PII is visible.
- Ensure no paywalls were breached (no purchases made).
- Commit via standard `git` terminal commands and `git push` (or `gh` if you prefer).

---

## Tip: Full Gemini Automation via Skills
To make Gemini automatically adopt these commands as first-class citizens, you can migrate the markdown files from `.claude/commands/` into Gemini Skills. 

To do this:
1. Create the workspace customization root: `.agents/skills/`
2. Create folders for each skill (e.g., `.agents/skills/new-research/`)
3. Copy the logic from `.claude/commands/new-research.md` into `.agents/skills/new-research/SKILL.md` (ensuring you add the required YAML frontmatter with `name` and `description`). 
4. Once ported, Gemini will automatically trigger these workflows based on the user's conversational intent!
