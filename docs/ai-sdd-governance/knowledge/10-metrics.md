# Metrics

Chinese version: [../zh/knowledge/10-指标.md](../zh/knowledge/10-指标.md)

## Metric Principles

- Metrics must drive improvement, not individual blame.
- Metrics must compare trend and team-level process health.
- AI metrics must be interpreted with quality metrics together.

## Efficiency Metrics

Story Cycle Time:

- Definition: time from Story development start to accepted completion.
- Use: measure delivery flow efficiency.

Spec Ready to MR Ready Time:

- Definition: time from approved SDD Spec to merge request ready for review.
- Use: measure AI-assisted development speed.

AI Code Adoption Rate:

- Definition: accepted AI-generated or AI-assisted code divided by total AI-generated code proposed.
- Use: identify useful and wasteful AI usage inside internal teams.

Stories Completed per Developer:

- Definition: accepted Stories per developer per iteration.
- Use: observe capacity trend, not rank individuals.

Automation Reuse Rate:

- Definition: repeated work handled by templates, scripts, generated tests, or reusable prompts.
- Use: measure platform leverage.

## Quality Metrics

Defect Escape Rate:

- Definition: defects found after acceptance divided by total accepted Stories.

Rework Rate:

- Definition: Stories reopened or materially changed after review or acceptance.

MR First-Pass Rate:

- Definition: merge requests that pass review and quality gates without major rework.

New Code Coverage:

- Definition: test coverage for newly added or changed code.

SonarQube Issue Density:

- Definition: new code issues per thousand lines or per Story.

Production Issue Source:

- Categories: requirement ambiguity, AI incorrect generation, review omission, test omission, integration environment issue, release operation issue.

## Consistency Metrics

Spec Template Compliance:

- Definition: Stories with complete required SDD fields divided by total Stories.

OpenAPI Coverage:

- Definition: service APIs with OpenAPI contracts divided by total service APIs.

MR Template Completion:

- Definition: merge requests with all required template sections completed.

Outsourced Deliverable Quality Delta:

- Definition: difference in defect rate, rework rate, acceptance pass rate, and post-acceptance defect rate between outsourced deliverables and internal team output.

Owner Review Coverage:

- Definition: core module changes approved by the correct owner divided by all core module changes.

## Review Cadence

Weekly:

- Review delivery flow, merge request health, quality gate failures, and AI failure cases.

Bi-weekly:

- Review template improvements and prompt card changes.

Monthly:

- Review supplier deliverable quality, module ownership, security posture, and rollout progress.

## Key Takeaways

- Metrics drive improvement, not individual blame — read them as trends, not scoreboards.
- Efficiency, quality, and consistency metrics are interpreted together; AI Code Adoption Rate alone is misleading without Defect Escape Rate beside it.
- Weekly / bi-weekly / monthly cadences correspond to delivery health, process tuning, and supplier or rollout review respectively.
- The metric loop closes by feeding back into specs, prompts, harness policies, and tests — measurement without feedback is overhead.

## Next

- [Capstone: From Concepts To Delivery](11-capstone.md) — one Story walked through every doc you have just read, including how each metric in this doc gets recorded for that Story.
