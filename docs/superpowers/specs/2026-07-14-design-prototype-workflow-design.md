# Design: `/design-prototype` — Prompt-Pack-to-Prototype Workflow

- **Date:** 2026-07-14
- **Status:** Approved (brainstorm) — ready for implementation plan
- **Scope:** Build the reusable **workflow only**. Applying it to the onboarding-activation study to produce an actual prototype is an explicit *later* step, out of scope here.

## Purpose

Convert `raw-data/onboarding-flow/claude-design-prompt-pack.md` (a manual, copy-paste
library of 14 design gate-categories) into an **agentic workflow**: a new
`/design-prototype` command + skill that turns a research study's synthesis (ideally
via its `SPEC.md`) into a **clickable, self-contained HTML prototype published as a
claude.ai Artifact**, generated and audited against the prompt pack's gates.

It is the **third design-output step** on the research spine:

```
brief-feature   → Canva deck     "should we build this?"      (narrative)
draft-spec      → SPEC.md        "what to build"              (definition)
design-prototype → HTML Artifact "what it looks / feels like" (artifact)  ← new
```

The prototype lands in the user's Artifacts gallery at `claude.ai/code/artifacts`:
default-private, shareable when the user chooses, and updatable in place at the same URL.

## Decisions (from brainstorm)

| Decision | Choice |
|---|---|
| Deliverable of this effort | The reusable workflow only; prototype is a later application |
| Form | Workspace command + skill (dual-registered like `/draft-spec`), conversational, Principal-Designer-gated |
| Output artifact | Self-contained HTML prototype published as a claude.ai Artifact (same-URL redeploy on updates) |
| Precondition | **Soft gate**: prefers `SPEC.md`; warns + offers `/draft-spec` if absent; proceeds from a reviewed synthesis on override |
| Gate execution | Core spine always + opt-in deepening passes |
| Flexibility axes | **Fidelity** (lo-fi ↔ hi-fi per run) and **à-la-carte gates** (any of the 14 individually invokable) |
| Flow-scope / invocation-style | Sensible defaults only (full-arc default + optional `--scope` arg; standard `$ARGUMENTS` flags) — not first-class asks |

## Files

**Created:**
- `.claude/commands/design-prototype.md` — frontmatter `description` + `argument-hint`; body uses `$ARGUMENTS`; slashed command refs.
- `.agents/skills/design-prototype/SKILL.md` — mirror in skill style: frontmatter `name` + `description` only; body uses "arguments"; command refs de-slashed; prose unwrapped. (Same skill/command pairing convention as all 12 existing spine steps.)
- `.claude/references/design-gates.md` — the prompt pack extracted once to a **committed** reference (it is pure methodology, product-agnostic, safe to commit). The command reads gate definitions from here instead of from gitignored `raw-data/`.

**Modified:**
- `.claude/personas/principal-designer.md` — add **Mode T — Prototype review** alongside existing Modes P / R / S.
- `CLAUDE.md` — add `/design-prototype` to the workflow-command table and to the "optional design-output steps" prose; extend the Principal Designer section to describe Mode T.

## Flexibility model 1 — Fidelity (`--fidelity lo|hi`, default `hi`)

Fidelity sets both the visual bar and which gates auto-run:

| | **lo-fi** | **hi-fi** (default) |
|---|---|---|
| Look | Grayscale wireframe, structure only | Full tokens, color, type, motion |
| Goal | Cheap structural exploration | Pixel-perfect, shareable |
| Auto-runs | context-lock → screens → states → copy → *structural* a11y → DoD (structure subset) | full core spine: context-lock → tokens → screens → states → copy → a11y → responsive → **DoD G1–G8 audit** |
| Skips | color / motion / delight / pixel-polish | nothing in the core spine |

## Flexibility model 2 — À-la-carte gate registry

Most prompt-pack categories become a **named pass** runnable individually against the
*existing* artifact via `/design-prototype --gate <name>` (or `--deepen a,b,c`). Each
redeploys to the **same Artifact URL** (no new link). The three inherently-generative
categories are **not** standalone passes — they live in the core spine: §0 context-lock
(runs every time), §2 screen-generation (the core generate step), and §4 integration/
wiring (folded into the generate step + the G8 real-data-shape gate).

| Gate name | Pack § | What the pass does |
|---|---|---|
| `tokens` | 1 | Extract/harden token set (pulls from `lenses/tokens.md` if `/extract-tokens` ran) |
| `consistency` | 3 | Cross-screen audit + hardcode/terminology/drift sweep, then fix |
| `states` | 6 | Full loading / empty / error / partial / success pass |
| `copy` | 7 | Rewrite every string to be specific + load-bearing |
| `pixel` | 8 | Spacing / type / edge polish to the grid |
| `a11y` | 9 | WCAG 2.2 AA audit + fixes (contrast, targets, keyboard, focus) |
| `responsive` | 10 | 375 / 768 / 1440 proof, no overflow |
| `qa` | 11 | Full DoD G1–G8 gate table, pass/fail + evidence |
| `friction` | 5 | Skeptical-user friction walk; redesign top frictions |
| `critique` | 12 | Structured critique (first impression, hierarchy, consistency) |
| `delight` | 13 | Signature moments + personality (hi-fi only) |

**Definition of Done (G1–G8) is the acceptance contract**, not merely a gate:
G1 tokens-only · G2 interactive states · G3 data states · G4 no dead-ends ·
G5 WCAG AA · G6 responsive 375/768/1440 · G7 specific copy · G8 real data shape.
Any default hi-fi run ends with the `qa` gate table; the Principal Designer will not
pass a prototype that fails a gate unless the failure is declared. (Mirrors the pack's
rule: *"Do not present work as finished unless you state which gates it passes and which it fails."*)

## Run flow (default run — mirrors `/draft-spec`'s 10-step shape)

1. **Locate study & synthesis** — `$ARGUMENTS` folder, else `.claude/.active-research`; STOP if neither resolves or no `SYNTHESIS.md`.
2. **Soft gate on `SPEC.md`** — if present, use it as the screen/flow/IA/state source; if absent, warn, offer `/draft-spec`, and on override derive screens from the synthesis (flagged as lower traceability).
3. **Read ground truth & note type** — SPEC or synthesis + README (`Type`, `Goal`, the study's user types); note `--fidelity` and any `--gate` / `--scope` args.
4. **Context-lock (pack §0.1)** — restate the token source (prefer `lenses/tokens.md` if `/extract-tokens` ran, else derive a minimal set), reference screens, personas, and the DoD. Confirm each in one line; ask if anything's missing rather than guess.
5. **Generate the prototype (pack §1–2, 5–7)** — build the flow's screens grounded in SPEC/synthesis: tokens-only, all states, specific copy, the target flow. **No invented screens or data** beyond what traces to the research; extrapolation flagged as an assumption (same non-fabrication rule as `/draft-spec`).
6. **Self-audit vs DoD G1–G8 (pack §11.1)** — gate table, fix fails; includes a11y + responsive on a hi-fi run.
7. **Principal Designer review — Mode T** (below); revise to address, re-run if rejected; relay verdict.
8. **PII / guardrail gate** — re-check the prototype carries zero internal specifics (product / program / funder / real names) and no un-redacted PII; product-agnostic only.
9. **Checkpoint — explicit approval to publish** (publishing to claude.ai is outward-facing).
10. **Publish via the Artifact tool** → return the `claude.ai/code/artifacts` URL. À-la-carte / `--deepen` passes redeploy the same file path → same URL.
11. **Update README log** — dated "prototype drafted" entry: fidelity, screen count, gates passed/failed, Mode T verdict, artifact URL.
12. **Report** — URL, screen count, gate table, PD verdict + what was addressed, assumptions flagged, PII items caught.

## Principal Designer — Mode T (Prototype review)

New section in `principal-designer.md`, alongside Modes P/R/S. Like the others, it
**never opens the tool or browses platforms** — it judges the prototype on disk against
the synthesis/spec, on:

- **Traceability** — every screen maps to a SPEC FR or synthesis finding; nothing invented.
- **Gate compliance** — the declared DoD table is honest; no silent fails.
- **Flow completeness** — no dead-ends; error / empty / loading states present (G3/G4).
- **Fidelity honesty** — a lo-fi run isn't dressed up as hi-fi, and vice-versa.
- **PII-safety** — no internal specifics or real names rode along.

Returns **ready / revise / reject** with section-referenced reasons.

## Guardrails (inherited, made explicit)

- **Outward-facing publish** — Artifacts go to claude.ai; treated like `/brief-feature` / `/publish-research`: PII gate + explicit approval before it leaves the workspace.
- **Never impersonate** — the Artifact tool's own rule: no real org's name / branding / byline; a research prototype is generic-branded.
- **Self-contained** — Artifacts block external hosts, so all CSS/JS inline, assets as `data:` URIs (embedded capture stills, if any).
- **Confidentiality firewall** — the committed command carries no study specifics; each *run* re-checks its output. This is why the effort is scoped to "workflow only".

## Explicitly out of scope (YAGNI)

- Building the actual onboarding-activation prototype (a later application of this workflow).
- Figma / React-code / `claude.ai/design`-sync output formats — HTML Artifact only.
- A `--format` flag — output format is fixed to HTML Artifact.
- First-class flow-scope selection and dual flag/menu invocation — defaults only.
- Multi-agent `Workflow` fan-out for the gates — the command runs conversationally in-session; a background workflow can be layered later if the heavy QA gates justify it.

## Open questions for spec review

- **Default fidelity when no `SPEC.md` exists** — proposal: still default `hi`, but the missing-spec warning nudges toward `--fidelity lo` for a cheap first pass. Confirm.
- **Token source precedence** — proposal: `lenses/tokens.md` (from `/extract-tokens`) > tokens named in `SPEC.md` > minimal derived set. Confirm ordering.
- **`--scope` argument** — include a lightweight `--scope <moment>` (e.g. `landing`) now, or defer entirely? Currently proposed as a defaulted, optional arg.
