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
