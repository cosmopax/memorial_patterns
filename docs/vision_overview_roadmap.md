# memorial_patterns — Vision, Overview & Roadmap
version: 1.0 • date: 2025-08-11 • owner: @cosmopax

## 0) One-sentence vision
A self-improving, persona-aware assistant framework that turns Patrick's thought-space into reliable, executable progress across research, coding, entrepreneurship, and personal growth — with elegant language, academic rigor, and agentic automation.

## 1) Strategic objectives (12–18 months)
1) Sharper interaction intelligence
2) Agentic execution under a unified CI policy
3) Research depth with DOIs & disagreement mapping
4) Code & lab automation (incl. flow chemistry)
5) Entrepreneurship engine (peptides, consulting)
6) Personal OS (health, learning, writing)

## 2) Principles
Persona routing • Evidence first • Command-centric delivery • Shortcuts • Weekly self-improvement loops

## 3) Working model
- CI v2 = canonical behavior policy (style, rigor, shortcuts, guardrails)
- Agents: Jules, ChatGPT Agent Mode, Copilot CLI, Gemini CLI, Qwen/local
- KB: prompts/, docs/, deep_research_outputs/, indexes/
- Cadence: weekly DR+Agent pass → CI micro-edits → PR

## 4) Architecture
repo/
├─ prompts/
│  ├─ custom_instructions_v2.md
│  ├─ prompt_persona_library_v1.md
│  ├─ agent_mode_superprompt.md
│  └─ agent_task_templates.md
├─ deep_research_outputs/
│  ├─ ci_v2_support.md
│  └─ literature_maps/
├─ docs/
│  ├─ vision_overview_roadmap.md
│  └─ agent_mode_playbook.md
├─ indexes/
│  ├─ kb_index.csv
│  └─ sources.csv
├─ scripts/
│  ├─ bootstrap_vision_agent_pack.sh
│  └─ sync_ci.sh
├─ status.md
└─ project_overview.md

## 5) Core modes
Coding • Academic research • Personal growth • Finance/business • Language/writing • Everyday ops

## 6) Roadmap
Phase 1 (0–2w): CI v2 committed; add playbook/templates/index; DR Run 01 (B–D)
Phase 2 (2–6w): enable agents; configure persistent instruction channels
Phase 3 (2–4m): domain packs (drug discovery, peptides, consulting, personal OS)
Phase 4 (4m+): retrieval-lite, auto-proposal bot, Drive mirror (no secrets)

## 7) Weekly loop
Collect samples → CI micro-edits → smoke tests → PR + status bump → tag

## 7a) Resources & Assimilation (Gemini DR PDFs)
- Location: `resources/central_agency_research_literature_GEMINI/` (tracked via Git LFS; see INDEX.csv).
- What to extract: instruction/meta-prompt patterns; persona routing heuristics; evaluation frameworks; autonomy loop designs; safety/guardrail practices; ops templates.
- Synthesis path:
  1) Map sources → `indexes/sources.csv` (title, upstream URL/DOI if any, topics, recency).
  2) Distill → `deep_research_outputs/literature_maps/gemini_dr_synthesis.md` (principles, patterns, contradictions).
  3) Propose updates → `prompts/custom_instructions_v2.2_proposed.md` and `docs/agent_mode_playbook_addendum.md`.
  4) Open PRs with diffs + a status.md snippet.

## 8) Metrics
TTV ↓ • Edit rate ↓ • DOI density ↑ • PR velocity ↑ • Persona fit ↑ • Agent coverage ↑

## 9) Risks & mitigations
Prompt injection/drift → explicit safety layer + tests
Tool inconsistency → per-agent checklists
Stale CI → weekly ritual + rollback plan

## 10) Next 72h
- Commit CI v2 (prompts/custom_instructions_v2.md)
- Save this file; update project_overview.md pointer
- Run DR Run 01 (B–D) → deep_research_outputs/ci_v2_support.md
- Add docs/agent_mode_playbook.md & prompts/agent_task_templates.md
- Seed indexes/kb_index.csv