# Jules Kickoff — memorial_patterns

## Purpose
Enable **Jules** to operationalize the memorial_patterns project with minimal oversight:
- Enforce collaboration rules (always consult `project_overview.md` and `status.md`).
- Keep the repo in a “green” state.
- Propose focused PRs that move the roadmap forward.

## Scope
Repo: `https://github.com/cosmopax/memorial_patterns`  
Local path (Patrick’s Early‑2015 MacBook Pro): `/Users/cosmopax/Desktop/memorial_patterns`  
Primary owner: @cosmopax (patrick.p.schimpl@gmail.com)

## Mandatory Behaviors (ALWAYS)
1. **BEFORE any task:** read `project_overview.md` (roadmap) and `status.md` (current state).
2. **AFTER any contribution:** update `status.md` (and `project_overview.md` if the roadmap/vision changed).
3. Default to **feature branches + PRs** (never push to `main`).

## Prerequisites
- GitHub access with write permission to `cosmopax/memorial_patterns`.
- If mirroring to Google Drive (later): rclone config stored as GitHub Actions secret (not required now).

## Day‑0 Verification Tasks
- [ ] Confirm the repo exists and is accessible.
- [ ] Confirm these files exist at repo root:
  - `deep_research_brief.md`
  - `deep_research_instance_brief.md`
  - `prompt_persona_library_v1.md`
  - `project_overview.md`
  - `status.md`
- [ ] If any are missing, open a PR that restores them exactly (no extra changes).

## Roadmap‑Aligned Workstream (Week‑Zero)
### M1 — Custom Instructions v2.0+ (NOW)
- **Wait for** the Deep Research result (Custom Instructions v2.0+) to be posted in the conversation and added to repo.
- [ ] Once available, create `custom_instructions_v2.md` in repo root with the final text, then open PR:  
  **Title:** `feat: add Custom Instructions v2.0+ (baseline)`  
  **Body:** summary, rationale, future tuning hooks.
- [ ] Update `status.md` with date, PR link, next step.

### M2 — Agentic Framework Setup
- [ ] Open PR scaffolding `agents/` (runner stub, task schema stub, tasks folder, connectors stubs), **no secrets**.
- [ ] Open PR adding `docs/runbook_agent.md` with First‑Run checklist.
- [ ] Open PR adding `.github/PULL_REQUEST_TEMPLATE.md` and `.github/ISSUE_TEMPLATE/agent_task.md`.

### M3 — Continuous Improvement
- [ ] Propose a weekly cadence issue: “Weekly Deep Research pass (+ Agent dry‑run)”.
- [ ] Add `indexes/` CSVs via a small script in `scripts/` (future PR).
- [ ] Keep `status.md` & `project_overview.md` synchronized.

## PR Hygiene
- Branch naming: `feat/...`, `chore/...`, `docs/...`
- Small, reviewable diffs; each PR has:
  - **Summary**
  - **Why now** (ties to roadmap)
  - **Test/Verification steps**
  - **Rollback notes** (how to revert)

## Status Update Format (append to top of `status.md`)
```

## Last Updated

YYYY-MM-DD by Jules

## Current State

* <what exists now>

## In Progress

* \<current tasks + PR links>

## Blockers

* <anything blocking>

## Notes

* <anything that helps collaborators>

```

## Done Definition (per PR)
- Checks pass (if/when CI is present).
- `status.md` updated.
- `project_overview.md` updated if the roadmap changed.
- Owner review available when changes are non‑trivial.

## Do/Don’t
- **Do** prefer minimal scaffolding PRs early; evolve incrementally.
- **Don’t** add credentials or secrets to repo.
- **Don’t** bypass the roadmap; if priorities shift, propose an edit to `project_overview.md`.
