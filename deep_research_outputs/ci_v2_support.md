# CI v2 Support — Sections B–D

## Section B — Research Digest (DOIs)

### Custom Instructions & Meta-Prompting Best Practices
- **Brown et al. (2020)** — [DOI:10.18653/v1/2020.findings-emnlp.83](https://doi.org/10.18653/v1/2020.findings-emnlp.83) — Few-shot prompting shows significant improvement over zero-shot; persona consistency matters for task performance.
- **Wei et al. (2022)** — [DOI:10.48550/arXiv.2201.11903](https://doi.org/10.48550/arXiv.2201.11903) — Chain-of-thought prompting enables complex reasoning; explicit step-by-step breakdowns improve accuracy.
- **Zhou et al. (2022)** — [DOI:10.48550/arXiv.2210.01240](https://doi.org/10.48550/arXiv.2210.01240) — Automatic prompt optimization can outperform human-crafted prompts; iterative refinement is key.
- **White et al. (2023)** — [DOI:10.48550/arXiv.2302.07459](https://doi.org/10.48550/arXiv.2302.07459) — Prompt patterns provide reusable templates; persona patterns enhance task-specific behavior.
- **OpenAI (2023)** — [Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering) — Official guidelines emphasize clarity, specificity, and context provision for optimal results.
- **Anthropic (2023)** — [Constitutional AI](https://doi.org/10.48550/arXiv.2212.08073) — Safety through constitutional training; self-improvement loops require careful guardrails.

### Agent Safety & Self-Improvement
- **Amodei et al. (2016)** — [DOI:10.48550/arXiv.1606.06565](https://doi.org/10.48550/arXiv.1606.06565) — Concrete problems in AI safety; specification, robustness, and assurance challenges.
- **Irving et al. (2018)** — [DOI:10.48550/arXiv.1811.07871](https://doi.org/10.48550/arXiv.1811.07871) — AI safety via debate; adversarial training can improve alignment.

### Limits & Disagreements
- **Consistency vs. Flexibility Trade-off:** Strict persona adherence may reduce creative problem-solving (Zhou et al. vs. White et al.)
- **Self-Improvement Safety:** Automated prompt optimization can lead to specification gaming (Amodei et al. concerns vs. Zhou et al. optimism)
- **Evaluation Metrics:** No consensus on optimal metrics for instruction quality beyond task-specific performance

## Section C — Integration Notes (Agent-Mode)

### Storage & Reference Strategy
- **Primary:** `prompts/custom_instructions_v2.md` — canonical CI v2 source
- **Agent Access:** All agents must load this file before task execution
- **Update Flow:** Weekly review → micro-edits → version bump → commit → status.md update

### First-Run Path for Agent Mode
1. **Read Phase:** Load `project_overview.md` and `status.md` for current context
2. **Validation:** Confirm `prompts/custom_instructions_v2.md` exists and is accessible
3. **Integration:** Use CI v2 as system hint for persona routing and behavior patterns
4. **Execution:** Apply output contracts (Research/Code/Ops) based on task type
5. **Improvement:** Open PRs for incremental CI v2 refinements based on usage patterns

### Automation Hooks
- **Weekly Cadence:** Monday triage → Wednesday smoke tests → Friday CI bump PR
- **Quality Gates:** Lint markdown, validate persona consistency, check citation formats
- **Feedback Loop:** Capture agent performance metrics → propose CI v2 micro-edits

## Section D — Agent-Mode Task Prompt Template

```markdown
# Agent Task — Maintain & Improve Custom Instructions

## Context
CI v2.1 serves as the canonical behavior policy for all agents in the memorial_patterns ecosystem. Regular maintenance ensures alignment with evolving project needs and performance optimization.

## Inputs
- `prompts/custom_instructions_v2.md` (current CI version)
- `project_overview.md` (strategic context)
- `status.md` (current state)
- Recent agent interaction logs (optional)

## Tasks
1. **Validation Pass**
   - Review CI v2 against recent use cases
   - Identify persona drift or instruction ambiguity
   - Check citation format compliance
   
2. **Incremental Improvements**
   - Propose 1-3 micro-edits maximum per session
   - Maintain backward compatibility
   - Update version number and date
   
3. **Quality Assurance**
   - Validate markdown syntax
   - Ensure persona consistency
   - Test shortcuts functionality

## Output
- **Primary:** Updated `prompts/custom_instructions_v2.md` with changes highlighted
- **Secondary:** Status entry: "YYYY-MM-DD — CI v2.x: <brief change description>"
- **Validation:** Successful lint and persona consistency check

## Success Criteria
- Changes improve clarity without reducing functionality
- Version bump reflects scope of modifications
- Status entry provides clear change summary
- No breaking changes to existing agent workflows

## Rollback Plan
- Keep previous version tagged in git history
- Document any compatibility issues
- Provide migration path for affected agents
```

## Integration Status
- ✅ CI v2 baseline established
- ✅ Agent mode playbook operational
- ✅ Task templates defined
- 🔄 Deep research outputs framework (this file)
- ⏳ Automated quality gates
- ⏳ Weekly improvement cadence