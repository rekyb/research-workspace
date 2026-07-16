---
description: Turn a synthesized study into a Canva stakeholder deck — draft the slide story, gate it through the Principal Designer (Mode R), then build it in Canva on approval.
argument-hint: [optional study folder; defaults to the active research]
---

Produce the **stakeholder deck** for a synthesized research study: a
presentation-ready brief that tells the story of the findings and the
recommendation it implies. This is the workspace's design-facing deliverable — it
turns `SYNTHESIS.md` into something a Head of Product, PM, or engineer can be walked
through.

The deck is **built in Canva** via the Canva MCP tools. Creating a Canva design is
an **outward-facing action on an external service**, so this command never exports
without (a) a Principal Designer review and (b) explicit user approval, and it runs
the PII guardrail first — the same rule that governs `/publish-research`.

This is a synthesis-to-deliverable step, not a capture step. Every slide must trace
back to what is already in the research folder — **do not invent findings, metrics,
evidence, or sources** (same guardrail as the rest of the workspace).

## Steps

1. **Locate the study & its synthesis.** If `$ARGUMENTS` names a study folder, use
   it; otherwise resolve it per `.claude/references/active-research.md` (this
   terminal's binding, else the sole active study, else ask). If nothing
   resolves, STOP and tell the user to pass a study folder or run `/new-research`.
   Confirm `<folder>/SYNTHESIS.md` exists — if not, STOP and tell the user to run
   `/synth-findings` first (there is nothing to brief yet).

   **Prefer a reviewed synthesis.** If `SYNTHESIS.md` has no `## Peer Review`
   section (nor a legacy `## Agent Review`), warn the user that the deck will present
   findings that haven't passed
   `/review-research`, and ask whether to proceed anyway. Only continue on their yes.

2. **Read the ground truth & note the type.** Read `SYNTHESIS.md` in full, plus the
   research `README.md` (for `Type` + the stated `## Goal`). The deck structure
   branches on `Type`:
   - **benchmark** → a *feature story* (one section per synthesized feature);
   - **usability** → *severity-ranked findings* (one section per finding, highest
     severity first).
   Also note which evidence (screenshots, `flow.gif`) the synthesis cites, so the
   deck can point at real captures.

3. **Draft the slide outline WITH the user — do not build in Canva yet.** Work
   through the deck section by section (template below), pulling every claim from
   `SYNTHESIS.md`. Keep slides skimmable: one idea per slide, a headline that states
   the takeaway (not "Feature 2"), and the supporting evidence beneath it. Present
   the full outline in chat and refine it with the user before any review or build.

4. **Principal Designer review (Mode R — quality gate, before Canva).** Dispatch the
   Principal Designer as a subagent (Agent tool, `general-purpose`) in **Mode R**,
   handing it `.claude/personas/principal-designer.md`, the drafted outline,
   `SYNTHESIS.md`, and the `README.md` (goal + type). It judges the deck for design
   coherence and evidence grounding — does the story follow from the synthesis, is
   every claim evidenced, is the recommendation actionable — and returns a verdict:
   **ready / revise / reject**, with reasons. **Revise the outline** to address its
   points, then re-run if it said *reject*. Relay its verdict to the user.

5. **PII / guardrail gate (before anything leaves the workspace).** Re-check the deck
   text and any evidence it will carry for un-redacted PII — real names (including
   third parties on social/leaderboard captures), avatars, emails, account data,
   or un-pseudonymized participants. Canva is a published surface: if anything is
   unsafe, STOP and flag it, exactly as `/publish-research` does. Never pay for or
   upgrade Canva — the free tier only.

6. **Checkpoint — get explicit approval to build in Canva.** Present the
   review-cleared outline and confirm the user wants it created in Canva. Only
   proceed on a clear yes. (Creating the design is the outward-facing step.)

7. **Build the deck in Canva.** Use the Canva MCP tools (load them via ToolSearch if
   deferred). Create a presentation from the approved outline — one slide per outline
   section, headline + supporting points + evidence caption. Prefer a structured
   generation tool so the slide breakdown is honest to the outline. **Evidence
   images:** our captures are local PNGs/GIFs; embed them only if the Canva tools can
   ingest a local/URL asset, otherwise reference the capture by filename in the slide
   and note in the report that images should be dropped in manually (same limitation
   the `.docx` export has). Do not fabricate charts or numbers to fill a slide.

8. **Return the deck & (optionally) export.** Give the user the Canva design link. If
   they want a file, use the Canva export tool and report the path/URL. Do not
   auto-publish or share the design beyond the user's own Canva.

9. **Update the log** in the study `README.md` with a dated "feature brief deck
   created" entry (slide count, Principal Designer verdict, Canva link).

10. **Report** to the user: the deck link, the slide count, the Principal Designer's
    verdict and what was addressed, any evidence that needs manual placement, and any
    PII items flagged.

---

Deck outline template (adapt the middle to the study `Type`):

```
Slide 1 — Title
  <Study topic> · Feature Brief · <date> · researcher
Slide 2 — Why this research (context & goal)
  The stated ## Goal from the README, in one or two lines. What decision it informs.
Slide 3 — Evidence base / method
  benchmark: platforms studied + what was captured (screens, flows, sources).
  usability: method, participant count (P01…), tasks, metrics collected.

--- Middle (branches on Type) ---

benchmark → one slide per feature (or a pair if dense):
  Headline = the takeaway, not the feature number.
  • What it is (1 line) · Key finding (what the user sees / does / the system does,
    condensed) · Why it works · How we'd validate it. Cite the platform + evidence.

usability → a Metrics-summary slide, then one slide per finding, severity-first:
  Headline = the problem/insight. • Evidence (sessions, success/fail, redacted
  quote) · Severity (0–4) + affected task/heuristic · Recommendation.

--- Close ---

Slide N-1 — Recommendation / what to build (or fix) next
  The prioritized call the synthesis points to; sequence it if the synthesis does.
Slide N   — Risks & what to validate first
  Gaps & caveats from the synthesis; the cheapest validation to de-risk the bet.
Appendix  — Sources & evidence index (from sources.md / references.md).
```
