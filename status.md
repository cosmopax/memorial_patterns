## Last Updated
2025-08-14 by Patrick (@cosmopax)

## Executive Summary
- Goal: CI v2.1 canonical policy; Gemini CLI project context; ingest Gemini DR PDFs; synthesize toward CI v2.2.
- Current branch: `docs/resources-gemini-dr-v1`; PR: TBD

## Current State (best-effort)
- CI v2.1 present: `prompts/custom_instructions_v2.md`
- Agent docs present: `docs/vision_overview_roadmap.md`, `docs/agent_mode_playbook.md`
- Prompts present: `prompts/agent_mode_superprompt.md`, `prompts/agent_task_templates.md`
- Resources (Gemini DR PDFs): branch `docs/resources-gemini-dr-v1` (PR link above if created)

## Next
1) Ensure resources PR is open & visible on GitHub.
2) After PR visible: run “crawl resources now” → generate:
   - deep_research_outputs/literature_maps/gemini_dr_synthesis.md
   - prompts/custom_instructions_v2.2_proposed.md
   - docs/agent_mode_playbook_addendum.md
   - indexes/sources.csv

## Notes
- Run heredoc scripts in `/bin/bash`. Keep PDFs under Git LFS.

---

# Project Status — memorial_patterns (History)

## Last Updated
2025-08-11 by Jules

### Current State

- `custom_instructions_v2.md` added to repo root.

- `project_overview.md` updated to reflect M1 completion.

### In Progress
- PR for `feat/custom-instructions-v2` is being prepared.

### Blockers
- None.

### Notes
- Awaiting review on the new custom instructions baseline.

---

## Last Updated
(please fill) YYYY-MM-DD by <contributor>

## Current State
- Repo seed files present (briefs, library, overview, status).

## In Progress
- Milestone M1: Deep Research run to produce Custom Instructions v2.0+ in this conversation.

## Blockers
- None noted.

## Notes
- All contributors (humans and agents) must update this file after making changes.
- Agents must consult `project_overview.md` BEFORE starting work.
