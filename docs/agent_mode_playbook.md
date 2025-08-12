# Agent Mode Playbook — memorial_patterns
version: 1.0 • date: 2025-08-11

## Purpose
Make Jules, ChatGPT Agent Mode, Copilot CLI, Gemini CLI, and Qwen/local effective immediately under CI v2.

## Golden rules
1) Before task: read project_overview.md and status.md
2) Runtime: load prompts/custom_instructions_v2.md (CI v2)
3) After task: update status.md (prepend block) and link PR/issues

## Quick-start per agent
- Jules: reference CI v2 in task prompts; use PR template; small diffs
- ChatGPT Agent Mode: paste CI v2 into Custom Instructions; new chat per task
- Copilot CLI: set Personal/Repo Instructions to reflect CI v2; smoke-test
- Gemini CLI: supply CI v2 as system prompt; verify style compliance
- Qwen/local: pass CI v2 as system message; smoke tests; adjust phrasing if needed

## Task Template (Agent-Mode)
Goal • Context • Assumptions • Plan • Deliverables • Verification • Next action

## Output contracts
Research: TL;DR → Evidence (DOIs) → Limits → Related
Code: Assumptions/Env → Tree → Commands → Source → Tests → Troubleshooting
Ops: Safety → Prereqs → Steps → Verification → Rollback

## Weekly cadence
Mon triage → mid-week smoke tests → Fri CI bump PR + status update
