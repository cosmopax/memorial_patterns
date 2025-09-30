# Project Status — memorial_patterns

## Last Updated
2025-09-30 by Copilot Agent

## Executive Summary
- Goal: Verify and approve AGENTS.md file presence in repository
- Current PR: #16 `copilot/fix-5ed0fed8-4b2d-47be-a747-d14188665d51`
- Status: AGENTS.md verified as properly configured in base branch

## Current State
- ✅ **AGENTS.md** verified and approved: Present in base branch with proper content
- ✅ CI v2.1 present: `prompts/custom_instructions_v2.md`
- ✅ Agent docs present: `docs/vision_overview_roadmap.md`, `docs/agent_mode_playbook.md`
- ✅ Prompts present: `prompts/agent_mode_superprompt.md`, `prompts/agent_task_templates.md`
- ✅ Deep research outputs framework: `deep_research_outputs/ci_v2_support.md`
- ✅ Knowledge index validated: `indexes/kb_index.csv` (all 13 files exist)
- ✅ Repository architecture aligned with actual file structure

## AGENTS.md Verification Details
The AGENTS.md file is correctly configured with:
- Core policy requirements for all agents (Jules, Copilot, Gemini CLI, Qwen/local, ChatGPT Agent Mode)
- Mandatory behaviors: Read project_overview.md and status.md before tasks
- Enforcement of prompts/custom_instructions_v2.md (CI v2.x) at runtime
- Feature branch workflow and status.md update requirements
- Safety guidelines for handling uncertainty and secrets

## Next
1) Continue with automated literature synthesis tasks
2) Set up weekly deep research run automation  
3) Begin M2 milestone: full agentic framework setup
4) Implement quality gates and validation scripts

## Notes
- AGENTS.md file successfully verified - already present in base branch (commit c191373)
- PR #8 (old 'feat: add AGENTS.md') has merge conflicts and should be closed
- Repository has clean, validated structure with no missing references
- All architectural files exist and are properly indexed
- Knowledge base ready for agent automation

---

## History

### 2025-08-14 by Patrick (@cosmopax)
- Goal: CI v2.1 canonical policy; Gemini CLI project context; ingest Gemini DR PDFs
- Added resources for Gemini DR PDFs processing
- Branch: `docs/resources-gemini-dr-v1`

### 2025-08-11 by Jules  
- `custom_instructions_v2.md` added to repo root
- `project_overview.md` updated to reflect M1 completion
- PR for `feat/custom-instructions-v2` prepared