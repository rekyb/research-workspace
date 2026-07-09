# Optimize Design System for Claude Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Optimize the design system files for Claude Projects by making guidelines deterministic, adding copy-pasteable Tailwind templates, and adding a root-level instructions file.

**Architecture:** 
1. Resolve typeface ambiguity in `DESIGN.md` and clean up the Module Map paths.
2. Add canonical Tailwind + React components for buttons and text fields to `design-system/components.md`.
3. Create `CLAUDE.md` in the root directory to direct Claude Projects to use the design system.

**Tech Stack:** Markdown, HTML/CSS (Tailwind, Lucide, React conventions)

## Global Constraints
- **NN-01** Use tokens, never raw values. Tailwind classes mapped to tokens; raw hex only inside `aria-hidden` decorative SVG.
- **NN-05** Honor `prefers-reduced-motion`; motion 150–300ms; **≥ 30fps on low-tier Android/3G or drop to instant**.
- **NN-12** Typeface = **Plus Jakarta Sans + Open Sans** (current code/tokens).

---

### Task 1: Update DESIGN.md (Typeface & Module Map Paths)

**Files:**
- Modify: `DESIGN.md`

- [ ] **Step 1: Update NN-12 to remove the open typeface question**
  Replace line 35 in [DESIGN.md](file:///home/reky/se-workspace/design-system-v1/DESIGN.md):
  ```markdown
  - **NN-12** Typeface = **Plus Jakarta Sans** (headings) + **Open Sans** (body text) (current code/tokens). **Use Open Sans by default for body text; do not change this typeface unilaterally.**
  ```

- [ ] **Step 2: Update Module Map to use absolute file links**
  Change the Module Map table in [DESIGN.md](file:///home/reky/se-workspace/design-system-v1/DESIGN.md) to make paths clearly linkable:
  ```markdown
  | If your task touches… | Load |
  |---|---|
  | color / type / spacing / radius / shadow / z / motion **values** | [design-system/tokens.md](file:///home/reky/se-workspace/design-system-v1/design-system/tokens.md) |
  | building or using a component; component states | [design-system/components.md](file:///home/reky/se-workspace/design-system-v1/design-system/components.md) |
  | forms, inputs, validation, feedback | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **FRM** |
  | navigation, menus, modals, tabs, back | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **NAV** |
  | animation, transitions, gestures, touch | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **MOT / INT** |
  | charts, graphs, data viz | [design-system/patterns.md](file:///home/reky/se-workspace/design-system-v1/design-system/patterns.md) → **VIZ** |
  | performance / low-end Android / 3G budget | [design-system/performance.md](file:///home/reky/se-workspace/design-system-v1/design-system/performance.md) |
  | accessibility work or audit | [design-system/accessibility.md](file:///home/reky/se-workspace/design-system-v1/design-system/accessibility.md) |
  | writing in-product UI copy, errors, empty states (quick) | [design-system/brand-voice.md](file:///home/reky/se-workspace/design-system-v1/design-system/brand-voice.md) |
  | substantial copy — marketing, long-form, headlines, per-audience, pillars, proof, approval | [design-system/copy.md](file:///home/reky/se-workspace/design-system-v1/design-system/copy.md) |
  | brand DNA — shape, color treatment, imagery, GAIN, approval filter | [design-system/brand.md](file:///home/reky/se-workspace/design-system-v1/design-system/brand.md) |
  | reviewing UI output — anti-slop / brand-fit gate | [design-system/review.md](file:///home/reky/se-workspace/design-system-v1/design-system/review.md) |
  ```

- [ ] **Step 3: Verify link changes**
  Open the file and ensure the markdown renders and paths are correct.

- [ ] **Step 4: Commit**
  ```bash
  git add DESIGN.md
  git commit -m "docs: resolve typeface ambiguity and update module map links"
  ```

---

### Task 2: Add Canonical Tailwind Recipes to design-system/components.md

**Files:**
- Modify: `design-system/components.md`

- [ ] **Step 1: Append the visual Tailwind code recipes**
  Add a new section `## CMP · Canonical Tailwind Recipes` at the bottom of [design-system/components.md](file:///home/reky/se-workspace/design-system-v1/design-system/components.md):
  ```markdown
  ## CMP · Canonical Tailwind Recipes
  
  Use these exact structures when generating key brand elements under Claude:
  
  ### Primary Button CTA (CMP-08, CMP-09, CLR-05, NN-03)
  Required state styling (All 8 states implemented):
  ```html
  <button 
    data-testid="primary-cta"
    class="w-full bg-[#FFCB1D] text-[#261F10] font-sans font-semibold rounded-full py-3.5 px-6 transition-all duration-200 hover:bg-[#E8B500] focus-visible:ring-4 focus-visible:ring-[#FFCB1D] focus-visible:outline-none active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer"
  >
    I'm ready
  </button>
  ```
  
  ### Text Input Field (CMP-13, CMP-14, NN-03)
  Required shape, placeholder, and focus states:
  ```html
  <div class="relative w-full">
    <input 
      type="text" 
      id="username"
      data-testid="username-input"
      placeholder="Enter your username"
      class="w-full bg-white text-[#261F10] placeholder-[#9CA3AF] border border-[#DCD9D2] rounded-full py-3.5 px-6 focus:border-[#FFCB1D] focus:ring-1 focus:ring-[#FFCB1D] focus:outline-none disabled:opacity-50 disabled:cursor-not-allowed"
    />
  </div>
  ```
  ```

- [ ] **Step 2: Commit**
  ```bash
  git add design-system/components.md
  git commit -m "docs: add canonical tailwind recipes to components.md"
  ```

---

### Task 3: Create CLAUDE.md Entry Instructions

**Files:**
- Create: `CLAUDE.md`

- [ ] **Step 1: Write CLAUDE.md in the root workspace directory**
  Create [CLAUDE.md](file:///home/reky/se-workspace/design-system-v1/CLAUDE.md) with instructions directing Claude Projects:
  ```markdown
  # Claude Developer Instructions — Solve.Education
  
  You are working on the Solve.Education learning system.
  Before performing any UI/UX, copywriting, or styling task, you MUST read and conform to the design system.
  
  ## 🎨 Design System Entrypoint
  - Entry Point: [DESIGN.md](file:///home/reky/se-workspace/design-system-v1/DESIGN.md)
  - Follow all rule IDs (e.g., `NN-01`, `CMP-08`, `CLR-05`) strictly.
  - When generating code, use the canonical Tailwind recipes in `components.md`.
  
  ## ⚙️ Development Commands
  - Dev Server: `npm run dev`
  - Production Build: `npm run build`
  - Run Tests: `npm run test`
  ```

- [ ] **Step 2: Commit**
  ```bash
  git add CLAUDE.md
  git commit -m "docs: create CLAUDE.md entrypoint guidelines for Claude Projects"
  ```
