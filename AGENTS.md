# AGENTS.md — Core Policy Reminder

All agents (Jules, Copilot, Gemini CLI, Qwen/local, ChatGPT Agent Mode) MUST:
- Read `project_overview.md` and `status.md` **before any task**.
- Enforce `prompts/custom_instructions_v2.md` (CI v2.x) at runtime (personas, shortcuts, guardrails).
- Use feature branches + small PRs; never push to default branch.
- After any contribution, **prepend** a new block to `status.md` (date, PR link, next steps).

If in doubt:
- Surface uncertainty, propose 1–2 safe options, then proceed on the safest default.
- No secrets in repo; refuse and propose a compliant alternative when needed.
