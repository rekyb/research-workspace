# Research Workspace

> A UX-research workspace with a **type-aware research spine**: desk research /
> benchmarking of existing products, and primary-research design & synthesis
> (planning usability studies and synthesizing the results brought back), both
> turned into design-ready write-ups.

This repository does two kinds of research. **Desk research / benchmarking**
studies how existing platforms solve product problems — we **observe and
document publicly available products**, capture evidence as we go (screenshots,
recorded user flows, cited URLs), and synthesize the findings into structured
feature briefs. **Primary-research design & synthesis** plans research
instruments (usability tests today; surveys and A/B tests are planned) and
synthesizes the results the user brings back.

Every claim here is grounded in captured evidence. We do not fabricate findings
or sources.

## What this repo is (and isn't)

- **Is:** A research workspace. We plan and synthesize research and observe
  publicly available products — benchmarking how they solve a given problem, or
  designing and synthesizing primary research (usability studies) — to produce
  evidence-backed synthesis that design and product teams can act on.
- **Is not:** A place where features get built, and not a place that fields
  research itself (no live participant recruiting or running from here). The
  output is the research that informs what to build, not code.

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
| **Claude Code** / **Google Antigravity (`agy`)** | Runs the workflow commands (`/new-research`, `/plan-usability`, `/synth-findings`, `/review-research`, `/close-research`, `/publish-research`, and the optional design-output/lens commands) and drives the research. | The workspace is designed to be operated through Claude or Antigravity; see `CLAUDE.md` and `GEMINI.md`. |
| **Google Chrome** + **Antigravity Browser Extension** or **Claude-in-Chrome** | Browsing benchmarked platforms and capturing evidence (screenshots, recorded flows). | Chrome extension ID: `eeijfnjmjelapkebgockoeaadonbchdd` (or MCP tools like `BrowserMCP`/`WebMCP` for Antigravity). |
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
├── GEMINI.md                       # Antigravity/Gemini entry point (mirrors CLAUDE.md)
├── ROADMAP.md                      # workspace roadmap
├── BOARD.md                        # research board (active + closed studies), rendered by /research-board
├── .claude/
│   ├── .active-research            # pointer to the currently active research folder
│   ├── commands/                   # workflow commands (new / plan-usability / synth / review /
│   │                                #   brief-feature / draft-spec / design-prototype / close / publish / board / lenses)
│   ├── references/
│   │   └── design-gates.md         # design-gate definitions used by /draft-spec & /design-prototype
│   ├── personas/                   # reviewer subagent specs: principal-researcher, principal-designer,
│   │                                #   product-manager, tech-lead, head-of-product
│   └── scripts/
│       ├── md_to_docx.py           # Markdown → .docx export (python-docx)
│       └── md_to_docx.ps1          # dependency-free PowerShell fallback for the same export
└── research/
    ├── PATTERNS.md                 # cross-study reusable-pattern library (owned by the Principal Designer)
    └── YYYY-MM-DD-<slug>/
        ├── README.md               # brief: goal, scope, type, platforms, status
        ├── PLAN.md                 # research plan (reviewed & approved before capture)
        ├── sources.md              # running log of every URL visited (with date)
        ├── platforms/              # benchmark studies: one folder per platform
        │   └── <platform-name>/
        │       ├── screenshots/    # key-screen captures (numbered, described)
        │       ├── flow.gif        # recording of the core user flow
        │       ├── flow.md         # written step-by-step of that same flow
        │       └── notes.md        # observations & patterns, source links
        ├── test-plan.md            # usability studies: the instrument (tasks, script, metrics)
        ├── sessions/                # usability studies: session-NN.md, one per PII-redacted participant
        ├── lenses/                 # optional benchmark analysis passes (heuristic-eval / a11y-audit / tokens)
        ├── SYNTHESIS.md            # cross-platform / cross-session synthesis (created at synth time)
        └── SPEC.md                 # optional build-ready spec (created by /draft-spec, post-review)
```

The **currently active** research is tracked in `.claude/.active-research`, a
small pointer file holding the active folder path. The workflow commands read
and write it, so the folder rarely needs to be named explicitly. A study's
`platforms/` vs. `test-plan.md` + `sessions/` middle depends on its `Type`
(benchmark vs. usability) — see **Workflow** below.

## Workflow

The workflow is **one shared lifecycle** — create → design/capture → synthesize
→ review → close → publish — that adapts to the research **type** (`benchmark`,
the default, or `usability`; `survey`/`abtest` are planned). `/new-research`
takes a `--type` flag, and every downstream command reads it and branches its
template accordingly, so the same commands drive both kinds of research.

Research moves through a sequence of commands — capture with `/new-research`
(and, for usability, design the instrument with `/plan-usability`), distill with
`/synth-findings`, stress-test with `/review-research`, optionally turn the
synthesis into a design deliverable, then `/close-research` and
`/publish-research`. **Only one research is active at a time** — run
`/close-research` before starting the next, or `/new-research` will warn you.

For the full command reference — every workflow command plus the optional benchmark
lenses, with what each one does — see [`CLAUDE.md`](CLAUDE.md).

`/brief-feature`, `/draft-spec`, and `/design-prototype` are three **optional
design-output steps**, run only when asked, each gated by the Principal
Designer: `/brief-feature` is the stakeholder **narrative** ("should we build
this"), `/draft-spec` is the maker's **definition** ("here is what to build"),
and `/design-prototype` is the clickable **artifact** ("here is what it looks
and feels like"). `/draft-spec` requires a reviewed synthesis; `/design-prototype`
prefers a `SPEC.md` (it will fall back to `SYNTHESIS.md` with weaker
traceability if none exists).

A **Principal Researcher** review persona
(`.claude/personas/principal-researcher.md`) runs as a subagent quality gate at
two points: it reviews the research `PLAN.md` before capture begins (inside
`/new-research`), and it QA-checks the finished `SYNTHESIS.md` (inside
`/synth-findings`) — auto-cleaning the prose (AI-slop and em-dashes in the
research outputs), flagging content problems as inline annotations for you to
resolve, and never silently changing a finding.

A **Principal Designer** persona (`.claude/personas/principal-designer.md`)
owns `research/PATTERNS.md`, the cross-study pattern library, and reviews every
design-output step (`/brief-feature`, `/draft-spec`, `/design-prototype`)
against the study's synthesis — never browsing the benchmarked platforms
itself — returning ready / revise / reject.

## Capture standards

When benchmarking a platform, capture evidence as you observe it:

- **Screenshots** — one per key screen of the relevant flow, saved to
  `platforms/<platform>/screenshots/` with descriptive, numbered names
  (`01-onboarding.png`, `02-empty-state.png`, …).
- **Flow recording** — the core user flow captured as `flow.gif`, with a few
  extra frames before and after each action for smooth playback.
- **Written flow** — the same flow written up as `platforms/<platform>/flow.md`:
  a numbered step-by-step (each step = the user action + the screen's response,
  with the matching screenshot/GIF cited), so the flow is readable without
  opening the GIF.
- **Notes** — `platforms/<platform>/notes.md` logs the observations and patterns
  worth synthesizing, plus the source URL(s).
- **Sources** — every URL visited is appended to the research-level
  `sources.md` with the date it was accessed.

## Synthesis format

`SYNTHESIS.md` is **type-aware**. For a **benchmark** study it is organized as a
list of **features**. Every feature entry contains these five fields, in this
order:

1. **Feature name** — e.g. "AI Companion".
2. **Short description** — one or two sentences on what it is.
3. **Key findings** — what we learned from observing it across platforms,
   following the logic of what the user sees, what the user does, and what the
   system does in response.
4. **Why this feature works (rationale)** — the UX / product reasoning.
5. **How to validate this feature in the future** — concrete next steps to test
   the idea (usability test, prototype, metric, experiment, …).

Each feature cites the platform(s) and evidence (screenshot / flow / source) it
draws from.

For a **usability** study, `SYNTHESIS.md` is organized as **findings** instead,
ordered by severity (0–4, highest first), each with evidence (pseudonymized
participants, task success/failure, redacted quotes), the affected task/
heuristic, and a recommendation — led by an `## Overview` and a `## Metrics
summary` (task success rates, SEQ/SUS, time-on-task).

## Research board

The active study and the full history of closed/archived research live on the
**[Research Board](BOARD.md)**. Render it to the terminal any time with
**`/research-board`** (it also refreshes `BOARD.md` from the research folders and
the active pointer, so the board never drifts).

## Benchmark analysis lenses (optional)

Beyond the core spine, three optional lenses run *retrospective analysis* over a
benchmark study's already-captured evidence (they never re-browse, so they work on
closed studies via a `[folder]` argument). Each writes to the study's `lenses/`
folder and stays grounded in the captures:

- **`/heuristic-eval`** — expert evaluation against Nielsen's 10 heuristics
  (violations *and* exemplary patterns), severity-ranked and evidence-cited.
- **`/a11y-audit`** — a WCAG 2.2 pass on what stills can show (measured colour
  contrast, target size, colour-only meaning, visible labels), explicitly flagging
  the criteria that only live testing can confirm.
- **`/extract-tokens`** — pixel-samples screenshots into an inferred design-token
  set (colour / type / spacing), flagged for validation against the real CSS.

## Tooling notes

- **Browsing & capture:** The Claude-in-Chrome MCP tools or the Antigravity Browser Extension (ID: `eeijfnjmjelapkebgockoeaadonbchdd`) and associated MCP tools (like BrowserMCP/WebMCP). Chrome is used as the browser runtime.
- **Screenshots:** the core flow is recorded as a GIF and downloaded, then key
  frames are extracted to numbered PNGs via **Pillow (PIL)** — redaction is
  applied in-page before capture, so saved frames carry no PII.
- **Word export:** `pandoc` is *not* installed. `.docx` files are generated
  from Markdown via `python-docx` using `.claude/scripts/md_to_docx.py`, with a
  dependency-free PowerShell fallback, `.claude/scripts/md_to_docx.ps1`.
- **Stakeholder decks:** built in **Canva** via the Canva MCP tools (used by
  `/brief-feature`) — free tier only.
- **Clickable prototypes:** `/design-prototype` generates a self-contained HTML
  prototype and publishes it as a **claude.ai Artifact** — default-private,
  shareable when the user chooses, redeployed to the same URL on later passes.
- Temporary and working files stay in the session scratchpad — never inside a
  research folder unless they are real evidence.
