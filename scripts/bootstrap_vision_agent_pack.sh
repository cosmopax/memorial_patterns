#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/Users/cosmopax/Desktop/memorial_patterns"
REMOTE_URL="https://github.com/cosmopax/memorial_patterns.git"
BRANCH="docs/vision-agent-playbook-v1"

log(){ printf "\033[1;32m==>\033[0m %s\n" "$*"; }
warn(){ printf "\033[1;33m!!\033[0m %s\n" "$*"; }

log "Entering repo directory..."
mkdir -p "$REPO_DIR"
cd "$REPO_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  log "Initializing git repo and setting origin."
  git init
  git remote add origin "$REMOTE_URL" || true
  git fetch origin || true
  git checkout -B main || true
else
  log "Git repo detected."
fi

if git remote get-url origin >/dev/null 2>&1; then
  CUR_ORIGIN="$(git remote get-url origin)"
  [ "$CUR_ORIGIN" != "$REMOTE_URL" ] && warn "Origin is $CUR_ORIGIN (expected $REMOTE_URL). Using existing origin."
else
  git remote add origin "$REMOTE_URL"
fi

log "Creating/switching to feature branch: $BRANCH"
git checkout -B "$BRANCH"

log "Ensuring folders exist..."
mkdir -p docs prompts deep_research_outputs indexes scripts

# --- docs/vision_overview_roadmap.md ---
cat > docs/vision_overview_roadmap.md <<'EOF'
# memorial_patterns — Vision, Overview & Roadmap
version: 1.0 • date: 2025-08-11 • owner: @cosmopax

## 0) One-sentence vision
A self-improving, persona-aware assistant framework that turns Patrick’s thought-space into reliable, executable progress across research, coding, entrepreneurship, and personal growth — with elegant language, academic rigor, and agentic automation.

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
│  └─ agent_task_templates.md
├─ deep_research_outputs/
│  ├─ ci_v2_support.md
│  └─ literature_maps/
├─ docs/
│  ├─ vision_overview_roadmap.md
│  ├─ agent_mode_playbook.md
│  └─ runbook_agent.md
├─ indexes/
│  ├─ kb_index.csv
│  └─ sources.csv
├─ scripts/
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
EOF

# --- docs/agent_mode_playbook.md ---
cat > docs/agent_mode_playbook.md <<'EOF'
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
EOF

# --- prompts/agent_task_templates.md ---
cat > prompts/agent_task_templates.md <<'EOF'
# Agent Task Templates (PR-ready)

## Maintain & Improve CI v2
Inputs: prompts/custom_instructions_v2.md, project_overview.md, status.md
Tasks:
- Validate fit; propose micro-edits; bump version/date.
- Print full updated CI v2 + one-line status entry.
Output:
- Updated custom_instructions_v2.md
- Status entry: "YYYY-MM-DD — CI v2.x: <short change>"

## Research Digest (topic)
Inputs: <topic>, constraints (*doi, recency)
Tasks:
- 6–12 bullets; clickable DOIs; 1-line takeaway each; limits & disagreements.
Output:
- deep_research_outputs/<topic>_digest.md

## Code Change (scaffold/fix)
Inputs: <files>, goal, constraints
Tasks:
- Assumptions/env → file tree → commands → source → tests → rollback.
Output:
- PR diff + test steps + status update snippet
EOF

# --- prompts/agent_mode_superprompt.md ---
cat > prompts/agent_mode_superprompt.md <<'EOF'
# Agent Mode Superprompt — memorial_patterns
version: 1.1 • date: 2025-08-11

## Role
You are the **Orchestrator-Agent** for the memorial_patterns project. Operate under CI v2 and maximize execution with minimal user intervention while staying safe, accurate, and PR-ready.

## Canonical Inputs (always load)
- prompts/custom_instructions_v2.md  (CI v2)
- project_overview.md  (vision/roadmap)
- docs/agent_mode_playbook.md  (this runbook)
- status.md  (current state)
- prompts/agent_task_templates.md  (task formats)

## Golden Rules (enforced)
- Read overview/status **before** work; update status **after**.
- Prefer feature branches + PRs; do not push to main.
- Default to non-destructive steps; include verification and rollback.
- Respect CI v2 personas, shortcuts, style, and guardrails.

## Autonomy Budget
- Default: proceed without asking if ambiguity is low and risk is minimal.
- If blocked: ask **one** focused question, propose best-guess path, and proceed after 60s unless overruled.
- Defer only on safety, policy, or irreversible operations.

## Runbook (per task)
1) **Clarify & Assumptions** — restate goal, constraints, and explicit assumptions.
2) **Plan** — tiny numbered steps; file tree if code.
3) **Execute** — produce commands/scripts/files (copy-paste-ready).
4) **Verify** — minimal checks; show expected outputs.
5) **PR** — propose branch name, commit message, PR title/body.
6) **Status** — print a status.md snippet to prepend.

## Output Contract
- Use the applicable template from prompts/agent_task_templates.md.
- Include only PR-ready artifacts and the status update snippet.

## Safety & Alignment
- Adhere to CI v2 safety notes and platform policies.
- Refuse or sanitize disallowed content; explain briefly and offer safe alternatives.

## Kickoff Macro (fill and run each time)
Goal: <1 sentence>  
Context: <paths/files/constraints>  
Assumptions: <bullets>  
Plan: <1–6 steps>  
Deliverables: <files/PR>  
Verification: <how to check>  
Next action: <single command or PR creation>
EOF

log "Staging and committing..."
git add docs/vision_overview_roadmap.md docs/agent_mode_playbook.md prompts/agent_task_templates.md prompts/agent_mode_superprompt.md
git commit -m "docs/prompts: add vision overview, agent playbook, task templates, and Agent Mode superprompt (v1)"

log "Pushing branch $BRANCH..."
git push -u origin "$BRANCH"

log "Creating Pull Request (opens in browser)..."
if command -v gh >/dev/null 2>&1; then
  gh pr create --fill \
    --title "docs: vision overview + agent playbook + task templates + Agent Mode superprompt (v1)" \
    --body "Adds vision_overview_roadmap.md, agent_mode_playbook.md, agent_task_templates.md, and agent_mode_superprompt.md. Agents must load CI v2, read overview/status before tasks, and update status after. Establishes autonomy budget and PR-ready output contracts." \
    --base main --head "$BRANCH" --web || warn "PR creation skipped; run: gh pr create"
else
  warn "gh not found; create PR manually on GitHub."
fi

log "Done."
