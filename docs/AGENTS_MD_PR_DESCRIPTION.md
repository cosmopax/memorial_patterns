# Complete PR Description for AGENTS.md Addition

This document provides the complete PR description content for the `AGENTS.md` addition, filling in all the sections that were incomplete in the original PR template.

## Summary
- Added `AGENTS.md` file to establish core policy reminders for all AI agents working on the memorial_patterns repository
- Provides mandatory behavioral guidelines for agent consistency and compliance
- Ensures all agents read key project files (`project_overview.md`, `status.md`, `prompts/custom_instructions_v2.md`) before task execution
- Establishes workflow requirements for feature branches, PR hygiene, and status updates

## Why now
- **M2 Milestone Preparation**: As we transition from M1 (Custom Instructions v2.0+) to M2 (Agentic Framework Setup), consistent agent behavior becomes critical
- **Multi-Agent Environment**: The repository now supports multiple AI agents (Jules, Copilot, Gemini CLI, Qwen/local, ChatGPT Agent Mode) requiring standardized policies
- **Governance Gap**: Without explicit agent guidelines, inconsistent behavior patterns could compromise repository integrity and project progression
- **Roadmap Alignment**: Directly supports the automation loops and agent scaffolding objectives outlined in the M2 milestone
- **Quality Assurance**: Proactive measure to prevent agent-introduced errors and ensure compliance with established repository patterns

## Changes
- **Added**: `AGENTS.md` - New file containing core policy reminders for all AI agents
- **Content Structure**:
  - Mandatory pre-task behaviors (read key files, enforce CI v2.x)
  - Workflow requirements (feature branches, PR hygiene)
  - Post-contribution requirements (status.md updates)
  - Uncertainty handling protocols
  - Security guidelines (no secrets in repo)
- **File Location**: Repository root for maximum visibility and accessibility
- **Format**: Markdown with clear, actionable bullet points for easy agent parsing

## Verification
- Steps:
  1. **File Existence**: Verify `AGENTS.md` exists in repository root
  2. **Content Validation**: Confirm all mandatory behaviors are clearly specified
  3. **Repository Health Check**: Run `./scripts/validate_repo.sh` to ensure no structural issues
  4. **Cross-Reference Validation**: Verify referenced files exist:
     - `project_overview.md` (✓ exists)
     - `status.md` (✓ exists) 
     - `prompts/custom_instructions_v2.md` (✓ exists)
  5. **Format Check**: Ensure Markdown formatting is clean and readable
  6. **Integration Test**: Verify file aligns with existing repository patterns and conventions
- Expected result:
  - `AGENTS.md` file accessible and readable
  - All validation scripts pass
  - No conflicts with existing repository structure
  - Clear, actionable guidelines for agent behavior

## Rollback
- **Simple Revert**: `git revert <commit-sha>` to remove the `AGENTS.md` file addition
- **Manual Removal**: `git rm AGENTS.md && git commit -m "Remove AGENTS.md"`
- **No Dependencies**: File removal has no impact on other repository components
- **Clean State**: Rollback returns repository to previous state without agent policy documentation
- **Alternative**: If content needs modification rather than removal, edit `AGENTS.md` directly and commit changes

## Links
- Issue(s): Addresses incomplete PR description sections for AGENTS.md addition
- Related PRs: Part of M2 milestone progression (Agentic Framework Setup)
- Documentation: Aligns with `jules_kickoff_memorial_patterns.md` PR hygiene guidelines
- Context: Supports roadmap objectives in `project_overview.md`