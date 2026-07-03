# Research Workspace

> A secondary desk-research / benchmarking workspace that studies how existing
> products solve UX and product problems, and turns those observations into
> design-ready feature write-ups.

This repository is where we **observe and document publicly available products**,
capture evidence as we go (screenshots, recorded user flows, cited URLs), and
synthesize the findings into structured feature briefs that inform what we
should build.

Every claim here is grounded in captured evidence. We do not fabricate findings
or sources.

## What this repo is (and isn't)

- **Is:** A research workspace. We study competitor and reference products,
  benchmark how they solve a given problem, and produce evidence-backed
  synthesis that design and product teams can act on.
- **Is not:** A place where features get built. We do *desk research only* — we
  watch how publicly observable products work and write up why their patterns
  succeed or fail. The output is research that informs decisions, not code.

The work is run from the perspective of a **Senior UI/UX Designer**: opinionated
and analytical (explaining *why* a pattern works, not just *that* it exists),
and always thinking in terms of user goals, flows, friction, and reusable
patterns.

## Guardrails

Two hard rules govern all research in this workspace (see `CLAUDE.md` for the
full wording):

- **Never pay for anything.** This is desk research — no purchases,
  subscriptions, upgrades, paid trials, or checkouts on a benchmarked platform.
  When a paywall blocks a flow, we capture what is observable for free, note that
  the rest is gated, and move on.
- **Redact sensitive info before saving any capture.** When a logged-in session
  is used, personal/account data (real names, avatars, emails, other PII) is
  blurred or masked *before* a screenshot or flow recording is saved. Non-
  sensitive feature mechanics (XP, streaks, progress) may remain visible as
  evidence.

## Requirements & setup

Clone the repository:

```bash
git clone https://github.com/rekyb/research-workspace.git
cd research-workspace
```

This is a research/automation workspace rather than a buildable app — there is no
package to compile. What you need is the tooling that runs the research and
produces its artifacts:

| Tool | Used for | Notes |
|---|---|---|
| **Claude Code** | Runs the workflow commands (`/new-research`, `/synth-findings`, `/close-research`) and drives the research. | The workspace is designed to be operated through it; see `CLAUDE.md`. |
| **Google Chrome** + **Claude-in-Chrome** tools | Browsing benchmarked platforms and capturing evidence (screenshots, recorded flows). | Chrome installed at `/usr/bin/google-chrome`. |
| **Python 3** | Runs the helper scripts below. | Standard CPython 3. |
| ├─ **python-docx** | Markdown → `.docx` export via `.claude/scripts/md_to_docx.py` (used by `/synth-findings --docx`). | `pip install python-docx`. **`pandoc` is *not* used.** |
| └─ **Pillow (PIL)** | Extracting PNG stills from recorded flow GIFs into `screenshots/`. | `pip install Pillow`. |
| **git** + **GitHub CLI (`gh`)** | Version control and pushing evidence to the remote. | Auth handled by `gh auth login`; the remote is `research-workspace`. |

> Nothing here transacts or installs system packages on its own. Evidence capture
> uses a logged-in browser session you control; personal data is redacted before
> anything is saved (see **Guardrails**).

## Repository structure

Each research topic lives in its own dated folder under `research/`:

```
research-workspace/
├── README.md                       # this file
├── CLAUDE.md                       # authoritative project brief & working rules
├── .claude/
│   ├── .active-research            # pointer to the currently active research folder
│   ├── commands/                   # workflow commands (new / synth / close)
│   └── scripts/
│       └── md_to_docx.py           # Markdown → .docx export (python-docx)
└── research/
    └── YYYY-MM-DD-<slug>/
        ├── README.md               # brief: goal, scope, platforms, status
        ├── sources.md              # running log of every URL visited (with date)
        ├── platforms/
        │   └── <platform-name>/
        │       ├── screenshots/    # key-screen captures (numbered, described)
        │       ├── flow.gif        # recording of the core user flow
        │       └── notes.md        # observations, flow steps, source links
        └── SYNTHESIS.md            # cross-platform synthesis (created at synth time)
```

The **currently active** research is tracked in `.claude/.active-research`, a
small pointer file holding the active folder path. The workflow commands read
and write it, so the folder rarely needs to be named explicitly.

## Workflow

Research moves through three commands. **Only one research is active at a time** —
run `/close-research` before starting the next, or `/new-research` will warn you.

| Command | What it does |
|---|---|
| `/new-research <topic>` | Creates a new dated research folder, scaffolds it, and marks it active. |
| `/synth-findings [--docx]` | Reads the active research and writes `SYNTHESIS.md` (add `--docx` for a Word copy). |
| `/close-research` | Verifies synthesis exists, marks the research closed, and clears the active pointer. |
| `/publish-research [-m "msg"]` | Safety-checks captures for PII, commits the active research, and pushes to GitHub via the `gh` CLI. |

## Capture standards

When benchmarking a platform, capture evidence as you observe it:

- **Screenshots** — one per key screen of the relevant flow, saved to
  `platforms/<platform>/screenshots/` with descriptive, numbered names
  (`01-onboarding.png`, `02-empty-state.png`, …).
- **Flow recording** — the core user flow captured as `flow.gif`, with a few
  extra frames before and after each action for smooth playback.
- **Notes** — `platforms/<platform>/notes.md` logs the step-by-step user flow,
  what stood out, and the source URL(s).
- **Sources** — every URL visited is appended to the research-level
  `sources.md` with the date it was accessed.

## Synthesis format

`SYNTHESIS.md` is organized as a list of **features**. Every feature entry
contains these five fields, in this order:

1. **Feature name** — e.g. "AI Companion".
2. **Short description** — one or two sentences on what it is.
3. **Key findings** — what we learned from observing it across platforms.
4. **Why this feature works (rationale)** — the UX / product reasoning.
5. **How to validate this feature in the future** — concrete next steps to test
   the idea (usability test, prototype, metric, experiment, …).

Each feature cites the platform(s) and evidence (screenshot / flow / source) it
draws from.

## Current research

| Research | Started | Status |
|---|---|---|
| [DataCamp — 3 most valuable learning-experience features](research/2026-07-03-datacamp-learning-experience/) | 2026-07-03 | Active (in progress) |

## Tooling notes

- **Browsing & capture:** the Claude-in-Chrome MCP tools (`navigate`,
  `computer`, `read_page`, `gif_creator`, …). Chrome is installed at
  `/usr/bin/google-chrome`.
- **Screenshots:** the core flow is recorded as a GIF and downloaded, then key
  frames are extracted to numbered PNGs via **Pillow (PIL)** — redaction is
  applied in-page before capture, so saved frames carry no PII.
- **Word export:** `pandoc` is *not* installed. `.docx` files are generated
  from Markdown via `python-docx` using `.claude/scripts/md_to_docx.py`.
- Temporary and working files stay in the session scratchpad — never inside a
  research folder unless they are real evidence.
