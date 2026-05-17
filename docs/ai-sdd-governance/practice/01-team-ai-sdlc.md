# Team AI SDLC Architecture

Chinese version: [../zh/practice/01-团队级ai-sdlc.md](../zh/practice/01-团队级ai-sdlc.md)

## Purpose

This chapter reorganizes the handbook around a team-level AI SDLC. SDLC means Software Development Life Cycle: the full lifecycle of software work from idea and requirements through design, implementation, testing, release, operation, and improvement. The existing articles remain valid, but readers need a clearer architecture for how SDD, Superpowers, GSD-style context engineering, gstack-style product and QA review, CI/CD, and governance fit together.

The recommended structure is:

```text
Team AI SDLC
├── Spec / Plan Layer
│   ├── Requirements
│   ├── ADR
│   ├── Architecture Constraints
│   └── Implementation Plan
│
├── Execution Layer
│   ├── Superpowers: TDD / subagent / review
│   └── GSD: long-running phase execution
│
├── Verification Layer
│   ├── Unit / Integration / Contract Test
│   ├── Architecture Fitness Function
│   ├── Security Scan
│   └── gstack-style Browser QA
│
└── Governance Layer
    ├── Human approval gate
    ├── PR review
    ├── CI quality gate
    ├── Dependency policy
    └── Release checklist
```

## Main Recommendation

For agile delivery teams that receive ready Story cards, use Superpowers as the default AI-assisted development workflow.

Use GSD-style practices for large, long-running, multi-phase work where context rot is the main risk.

Use gstack-style practices selectively for product clarification, design review, browser QA, release checklist, and sprint reflection.

In short:

```text
Story is clear -> Superpowers
Story is large -> GSD decomposes and preserves state, then Superpowers executes tasks
Story is unclear -> gstack-style discovery clarifies it, then Superpowers executes
```

## Why Superpowers Is The Default For Story Delivery

Once a Story card is ready, product discovery should already be mostly complete. The delivery team needs to:

1. Understand acceptance criteria.
2. Analyze impact.
3. Write an implementation plan.
4. Add or update tests.
5. Implement within scope.
6. Review against the spec.
7. Review code quality.
8. Package the MR with evidence.

This is where Superpowers fits best. It is an AI development skill set rather than a full project-management system. Its strengths are planning, TDD, subagent execution, code review, Git worktrees, verification, and finishing a branch.

Superpowers' `subagent-driven-development` skill is especially relevant: it uses a fresh subagent per task and a two-stage review loop, with spec compliance review before code quality review.

## Where GSD Fits

GSD is best understood as context engineering plus spec-driven long-task execution.

It is useful when:

- A feature is too large for one Story-sized implementation session.
- The work needs multiple phases.
- The team needs persistent state across sessions.
- Context rot is the main risk.
- Independent tasks can run in parallel with fresh executor context.

GSD-style practices worth adopting:

- Maintain structured project state.
- Keep requirements, roadmap, state, and phase context explicit.
- Break long work into phases.
- Execute independent plans with fresh context.
- Verify before declaring a phase complete.

Enterprise caution:

- Do not let a long-running execution engine bypass architecture, security, dependency, or owner review.
- Use GSD-style execution inside the same governance gates as other tools.

## Where gstack Fits

gstack is best understood as a role-based delivery workflow: product framing, plan pressure-testing, engineering review, browser QA, release checks, and retrospective.

It is useful when:

- The Story is not ready.
- Product intent or UX is unclear.
- A web product needs real browser QA.
- A small team wants a lightweight virtual delivery team.
- The team wants stronger pre-merge review and release discipline.

gstack-style practices worth adopting:

- Product clarification before a Story becomes ready.
- Architecture and test review before implementation.
- Browser QA for web user journeys.
- Release checklist before merge or deployment.
- Retrospective after delivery.

Enterprise caution:

- Role personas do not replace real owners, architecture review, security review, or CI/CD.
- Use gstack-style commands as review aids, not as final approval authorities.

## Tool Comparison

| Tool | Abstraction Level | Core Problem | Best Fit | Enterprise Fit |
| --- | --- | --- | --- | --- |
| Superpowers | AI coding skills and workflow skills | Execute ready work with engineering discipline | Daily Story delivery, existing repos, teams with Git/PR/tests | High |
| gstack | Role-based virtual software team and delivery loop | Add product, architecture, QA, release, and reflection pressure | Founders, product teams, web apps, early-stage workflows | Medium; use selectively |
| GSD | Context engineering and long-task spec execution | Avoid context rot during long-running AI work | Large features, multi-phase execution, stateful AI work | Medium; wrap with governance |

## How The Existing Handbook Maps To The AI SDLC

### Spec / Plan Layer

Purpose:

- Turn business intent into a bounded, reviewable, testable plan.

Primary documents:

- [AI-SDD Overview](../knowledge/01-ai-sdd-overview.md)
- [SDD Methodology](../knowledge/02-sdd-methodology.md)
- [Developer Guide](./04-developer-guide.md)
- [Priorities And Roadmap](./06-priorities-and-roadmap.md)

Primary templates:

- [SDD Story Spec](../../../templates/sdd-story-spec.md)
- [Technical Spec](../../../templates/technical-spec.md)
- [ADR](../../../templates/adr.md)
- [Test Spec](../../../templates/test-spec.md)
- [Prompt Card](../../../templates/prompt-card.md)

Key rule:

- A Story is not ready for AI-assisted implementation until acceptance criteria, context boundary, impacted artifacts, and verification expectations are clear.

### Execution Layer

Purpose:

- Convert the plan into code, tests, contracts, and documentation without uncontrolled scope drift.

Primary documents:

- [Superpowers Adoption](./03-superpowers-adoption.md)
- [Developer Guide](./04-developer-guide.md)
- [Harness Engineering](../knowledge/08-harness-engineering.md)
- [Agent Tools](../knowledge/07-agent-tools.md)

Recommended default:

- Tier A: lightweight workflow.
- Tier B: Superpowers planning, TDD where practical, review, verification.
- Tier C: full Superpowers workflow, Owner Review, full quality gates.
- Long-running feature: GSD-style phase state plus Superpowers task execution.

Key rule:

- The execution tool can vary, but the required artifacts, review, and evidence do not.

### Verification Layer

Purpose:

- Prove that the implementation matches the spec and did not introduce unacceptable risk.

Primary documents:

- [Quality Gates](../knowledge/04-quality-gates.md)
- [Testing Strategy](../knowledge/05-testing-strategy.md)
- [Harness Engineering](../knowledge/08-harness-engineering.md)

Primary policies and checklists:

- [Quality Gate Checklist](../../../quality-gates/checklist.md)
- [CI Gate Policy](../../../quality-gates/ci-gate-policy.md)
- [Testing Policy](../../../ai/testing-policy.md)
- [Review Checklist](../../../ai/review-checklist.md)

Verification practices:

- Unit tests for business rules and edge cases.
- Integration tests for cross-module behavior.
- Contract tests for APIs and events.
- Architecture fitness functions for structural constraints.
- Security scans for SAST, SCA, secrets, and dependency risk.
- gstack-style browser QA for web user journeys.

Key rule:

- Completion is evidence-based. Agent confidence is not verification.

### Governance Layer

Purpose:

- Keep AI-assisted delivery accountable, auditable, and safe across teams and suppliers.

Primary documents:

- [Operating Model](../knowledge/03-operating-model.md)
- [Toolchain](../knowledge/06-toolchain.md)
- [Metrics](../knowledge/09-metrics.md)
- [Rollout And Acceptance](./07-rollout-and-acceptance.md)
- [Implementation Playbook](./02-implementation-playbook.md)
- [Priorities And Roadmap](./06-priorities-and-roadmap.md)

Primary controls:

- Human approval gate.
- Owner Review.
- PR review.
- CI quality gate.
- Dependency policy.
- Release checklist.
- Supplier deliverable review.
- Weekly AI-SDD review.

Key rule:

- Internal teams may use AI workflow tools differently, and suppliers may use their own methods, but acceptance evidence and quality gates must be consistent.

## SDD And Superpowers Chapter Summary

Use the following reading path when introducing the method to a delivery team:

1. [SDD Methodology](../knowledge/02-sdd-methodology.md): explains why AI-assisted work starts from approved specs.
2. [Superpowers Adoption](./03-superpowers-adoption.md): defines Tier A/B/C and when Superpowers is required.
3. [Developer Guide](./04-developer-guide.md): explains Story intake, planning, TDD, artifact updates, review, verification, and MR completion.
4. [Harness Engineering](../knowledge/08-harness-engineering.md): defines the controlled execution environment for context, tools, permissions, verification, and evidence.
5. [Agent Tools](../knowledge/07-agent-tools.md): explains how Claude Code, Codex, Cursor, skills, MCP, plugins, memory, and hooks fit into the workflow.

The short version:

- SDD is the specification layer.
- Superpowers is the default internal execution discipline after a Story is ready.
- Harness Engineering is the execution-control layer.
- Quality Gates and CI/CD are the merge and release control layer.

## Default Team Workflow

```text
Story Card
  -> Story Intake
  -> Tier Classification
  -> SDD / Technical Spec / ADR if required
  -> Implementation Plan
  -> TDD or test strategy
  -> Implementation
  -> Spec Compliance Review
  -> Code Quality Review
  -> Verification Evidence
  -> MR Packaging
  -> Owner / Human Review
  -> CI Quality Gate
  -> Merge / Release / Acceptance
```

## Recommended Adoption Policy

### For Daily Story Development

Default to Superpowers.

Use it for:

- Story intake.
- Implementation planning.
- TDD or test-first behavior changes.
- Subagent execution for independent tasks.
- Spec compliance review.
- Code quality review.
- Verification before completion.

### For Complex Stories Or Technical Stories

Use GSD-style phase execution plus Superpowers.

GSD-style practices handle:

- Long context.
- Requirements and roadmap state.
- Phase planning.
- Task state.
- Fresh executor context.

Superpowers handles:

- TDD.
- Task implementation.
- Review.
- Branch finishing.

### For Unclear Stories

Use gstack-style discovery before development.

Borrow:

- Product clarification.
- Design review.
- Architecture and test review.
- Browser QA for web flows.
- Ship checklist.

Then return to Superpowers for implementation.

## Sources

- [Superpowers subagent-driven-development](https://github.com/obra/superpowers/blob/main/skills/subagent-driven-development/SKILL.md)
- [gstack](https://gstack.lol/)
- [GSD: Get Shit Done](https://github.com/gsd-build/get-shit-done)
