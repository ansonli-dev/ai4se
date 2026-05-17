# AI-SDD Governance Handbook

This repository is a practical handbook for adopting AI-assisted development with Spec-Driven Development (SDD) in large-scale agile software delivery programs.

It is written for delivery owners, architects, tech leads, QA, security leads, internal developers, AI champions, and supplier managers who need both speed and consistency while keeping delivery quality, ownership, and auditability under control.

## How To Read This Handbook

Chinese version: [README.zh.md](README.zh.md)

Read this repository like a book first, then use it like a reference library.

The documents under `docs/ai-sdd-governance/` are individual articles. Their content is useful on its own, but the recommended reading order is not the same as the file number order for every reader.

Start here:

1. Understand the overall story in this README.
2. Read the chapters that match your role.
3. Use the templates, policies, and checklists when you start execution.
4. Separate process changes from infrastructure work before planning rollout.

## The Core Idea

AI-assisted development should not start from free-form prompts.

For this program, AI work starts from reviewed specifications, bounded context, explicit human ownership, quality gates, and evidence-based acceptance.

```text
Business goal
  -> SDD specifications and acceptance criteria
  -> Internal AI-SDD execution workflow
  -> Context, tool, permission, and verification control
  -> Code, tests, contracts, and documentation
  -> CI/CD, owner review, and quality gates
  -> Acceptance, metrics, review, and continuous improvement
```

The project uses five layers:

- SDD defines what should be built and how it will be accepted.
- Superpowers defines the internal execution workflow for AI-assisted development.
- Harness Engineering controls AI context, tools, permissions, verification, and evidence.
- Quality Gates define what must pass before merge, release, or acceptance.
- Metrics show whether speed, quality, and consistency are improving together.

For the team-level architecture that connects these pieces, read [Team AI SDLC Architecture](docs/ai-sdd-governance/14-team-ai-sdlc.md).

## What This Handbook Is Not

This is not only an AI tool guide.

It is also not a requirement that every team immediately builds a full AI platform. Some parts can be adopted through workflow, templates, reviews, and training. Other parts require real engineering work such as CI/CD pipelines, Git hooks, scanners, repository rules, dashboards, and service catalogs.

The rollout should distinguish:

- Must-have from nice-to-have.
- Directly actionable process changes from infrastructure work.
- Internal team workflow from supplier acceptance rules.
- Manual pilot discipline from platform-scale automation.

For that distinction, read [Priorities And Roadmap](docs/ai-sdd-governance/12-priorities-and-roadmap.md).

## Reader Paths

### Delivery Owner

Read these first:

- [Executive Summary](docs/ai-sdd-governance/00-executive-summary.md)
- [Operating Model](docs/ai-sdd-governance/01-operating-model.md)
- [Priorities And Roadmap](docs/ai-sdd-governance/12-priorities-and-roadmap.md)
- [Rollout And Acceptance](docs/ai-sdd-governance/06-rollout-and-acceptance.md)
- [Metrics](docs/ai-sdd-governance/05-metrics.md)

Focus on:

- Governance model.
- Pilot scope.
- Must-have versus nice-to-have.
- Internal and supplier boundaries.
- Rollout phases and acceptance criteria.

### Architect Or Tech Lead

Read these first:

- [SDD Methodology](docs/ai-sdd-governance/02-sdd-methodology.md)
- [Toolchain](docs/ai-sdd-governance/03-toolchain.md)
- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md)
- [Harness Engineering](docs/ai-sdd-governance/10-harness-engineering.md)
- [Priorities And Roadmap](docs/ai-sdd-governance/12-priorities-and-roadmap.md)
- [Agent Tooling](docs/ai-sdd-governance/13-agent-tools.md)

Focus on:

- Spec-driven delivery.
- Architecture decision rules.
- Repository and CI/CD baseline.
- Owner review.
- API, event, data, and error-code contracts.

### Developer

Read these first:

- [SDD And Superpowers Developer Guide](docs/ai-sdd-governance/09-sdd-and-superpowers-developer-guide.md)
- [Superpowers Adoption Strategy](docs/ai-sdd-governance/08-superpowers-adoption.md)
- [AI Engineering Constitution](ai/engineering-constitution.md)
- [AI Context Policy](ai/context-policy.md)
- [Testing Policy](ai/testing-policy.md)

Focus on:

- Story intake.
- Tier A/B/C classification.
- Superpowers workflow.
- AI context boundary.
- Tests, MR evidence, review, and verification.

### QA

Read these first:

- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md)
- [Testing Strategy For AI-SDD](docs/ai-sdd-governance/11-testing-strategy-for-ai-sdd.md)
- [Testing Policy](ai/testing-policy.md)
- [Test Spec Template](templates/test-spec.md)
- [Quality Gate Checklist](quality-gates/checklist.md)

Focus on:

- Test evidence.
- Acceptance criteria.
- Contract and integration testing.
- Quality gate exceptions.
- Defect traceability.

### Security Lead

Read these first:

- [Toolchain](docs/ai-sdd-governance/03-toolchain.md)
- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md)
- [Security Policy](ai/security-policy.md)
- [AI Context Policy](ai/context-policy.md)
- [Allowed Tools](ai/allowed-tools.md)

Focus on:

- Sensitive data boundaries.
- Secret handling.
- Production logs and customer data.
- SAST, SCA, Secret Scan.
- Security exceptions.

### AI Champion

Read these first:

- [Superpowers Adoption Strategy](docs/ai-sdd-governance/08-superpowers-adoption.md)
- [SDD And Superpowers Developer Guide](docs/ai-sdd-governance/09-sdd-and-superpowers-developer-guide.md)
- [Harness Engineering](docs/ai-sdd-governance/10-harness-engineering.md)
- [Prompt Card Template](templates/prompt-card.md)
- [Weekly AI-SDD Review Template](templates/weekly-ai-sdd-review.md)

Focus on:

- Coaching internal developers.
- Maintaining examples.
- Recording AI failure cases.
- Improving prompt cards and workflow guidance.

### Supplier Or Outsourced Delivery Lead

Read these first:

- [Executive Summary](docs/ai-sdd-governance/00-executive-summary.md)
- [Operating Model](docs/ai-sdd-governance/01-operating-model.md)
- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md)
- [Implementation Playbook](docs/ai-sdd-governance/07-implementation-playbook.md)
- [Supplier Scorecard Template](templates/supplier-scorecard.md)

Focus on:

- Delivery artifacts.
- Test evidence.
- Acceptance rules.
- Deployment, rollback, and change notes.
- Internal owner approval for core modules.

## Book Structure

### Part I: Why AI-SDD

Start here if you need the big picture.

- [Executive Summary](docs/ai-sdd-governance/00-executive-summary.md): explains the delivery context, governance approach, and default policy.
- [SDD Methodology](docs/ai-sdd-governance/02-sdd-methodology.md): explains why work starts from specifications, not free-form prompts.

Key message:

AI is useful only when its inputs, boundaries, outputs, and review responsibilities are clear.

### Part II: Operating Model

Read this to understand how the program is governed.

- [Operating Model](docs/ai-sdd-governance/01-operating-model.md): roles, governance layers, team rules, owner model, and quality arbitration.
- [Implementation Playbook](docs/ai-sdd-governance/07-implementation-playbook.md): Week 0 preparation, kickoff agenda, weekly review agenda, supplier review, and RACI.

Key message:

Internal teams and outsourced teams can use different working methods, but they must meet the same acceptance and quality expectations.

### Part III: Developer Workflow

Read this to understand what happens after a Story is assigned.

- [Team AI SDLC Architecture](docs/ai-sdd-governance/14-team-ai-sdlc.md): maps SDD, Superpowers, GSD-style long-task execution, gstack-style QA, verification, and governance into one delivery architecture.
- [Superpowers Adoption Strategy](docs/ai-sdd-governance/08-superpowers-adoption.md): Tier A/B/C workflow levels for internal teams.
- [SDD And Superpowers Developer Guide](docs/ai-sdd-governance/09-sdd-and-superpowers-developer-guide.md): developer workflow from Story intake to verified MR.
- [AI Engineering Constitution](ai/engineering-constitution.md): baseline AI-assisted development rules.
- [AI Context Policy](ai/context-policy.md): what context is required, allowed, and forbidden.

Key message:

Context management and Superpowers usage can be adopted first as explicit workflow methods. They do not require a full platform before they become useful.

### Part IV: Quality And Infrastructure

Read this to understand which rules must become real engineering controls.

- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md): merge policy, human review checklist, exceptions, and outsourced acceptance rules.
- [Testing Strategy For AI-SDD](docs/ai-sdd-governance/11-testing-strategy-for-ai-sdd.md): testing strategy for AI-assisted SDD.
- [Toolchain](docs/ai-sdd-governance/03-toolchain.md): recommended enterprise-first toolchain.
- [Harness Engineering](docs/ai-sdd-governance/10-harness-engineering.md): execution-control layer for AI agents and coding agents.
- [Agent Tooling](docs/ai-sdd-governance/13-agent-tools.md): Claude Code, Codex, Cursor, skills, MCP, plugins, memory, hooks, and tool governance.
- [Quality Gate Checklist](quality-gates/checklist.md): practical checklist.
- [CI Gate Policy](quality-gates/ci-gate-policy.md): CI/CD gate policy.

Key message:

Quality gates cannot remain policy text. Build, tests, static analysis, security scans, branch protection, and owner approvals need to become CI/CD and repository controls.

### Part V: Rollout Roadmap

Read this before planning adoption.

- [Priorities And Roadmap](docs/ai-sdd-governance/12-priorities-and-roadmap.md): must-have, should-have, nice-to-have, directly actionable items, infrastructure work, and rollout phases.
- [Agent Tooling](docs/ai-sdd-governance/13-agent-tools.md): tool choices and governance for Claude Code, Codex, and Cursor.
- [Rollout And Acceptance](docs/ai-sdd-governance/06-rollout-and-acceptance.md): 12-week rollout plan and acceptance scenarios.
- [Metrics](docs/ai-sdd-governance/05-metrics.md): efficiency, quality, consistency, and review cadence.

Key message:

Do not implement everything at once. Start with controlled pilot behavior, then make repeated checks enforceable, then invest in dashboards and platform capabilities.

### Part VI: Templates And Checklists

Use these when executing real work.

Templates:

- [SDD Story Spec](templates/sdd-story-spec.md)
- [Technical Spec](templates/technical-spec.md)
- [Test Spec](templates/test-spec.md)
- [ADR](templates/adr.md)
- [Prompt Card](templates/prompt-card.md)
- [OpenAPI](templates/openapi.yaml)
- [Event Schema](templates/event-schema.json)
- [Data Dictionary](templates/data-dictionary.md)
- [Error Code Registry](templates/error-code-registry.md)
- [Agent Execution Report](templates/agent-execution-report.md)
- [Story Package Checklist](templates/story-package-checklist.md)
- [Weekly AI-SDD Review](templates/weekly-ai-sdd-review.md)
- [Supplier Scorecard](templates/supplier-scorecard.md)

Policies and checklists:

- [AI Engineering Constitution](ai/engineering-constitution.md)
- [AI Context Policy](ai/context-policy.md)
- [Allowed Tools](ai/allowed-tools.md)
- [Security Policy](ai/security-policy.md)
- [Testing Policy](ai/testing-policy.md)
- [Review Checklist](ai/review-checklist.md)
- [Quality Gate Checklist](quality-gates/checklist.md)
- [Exception Request](quality-gates/exception-request.md)
- [CI Gate Policy](quality-gates/ci-gate-policy.md)

Harness assets:

- [Lightweight AI Harness](ai-harness/README.md)
- [Task Executor Prompt](ai-harness/prompts/task-executor.md)
- [Spec Reviewer Prompt](ai-harness/prompts/spec-reviewer.md)
- [Code Reviewer Prompt](ai-harness/prompts/code-reviewer.md)
- [Context Policy YAML](ai-harness/policies/context-policy.yaml)
- [Permissions YAML](ai-harness/policies/permissions.yaml)
- [Verification Policy YAML](ai-harness/policies/verification-policy.yaml)
- [Story Readiness Script](ai-harness/scripts/check-story-ready.sh)
- [Verification Script](ai-harness/scripts/run-verification.sh)
- [Execution Report Script](ai-harness/scripts/generate-execution-report.sh)

## Must-Have Versus Nice-To-Have

### Must-Have For A Controlled Pilot

- Clear pilot scope.
- Named governance roles, AI Champion, and Module Owners.
- Tier A/B/C classification.
- SDD Story Spec for Tier B and Tier C.
- AI context boundary.
- Superpowers workflow for internal Tier B and Tier C.
- MR template with AI usage and evidence.
- Owner Review for core modules.
- Minimal build and unit test verification.
- Branch protection and minimal CI for pilot repositories.

### Should-Have For Team Expansion

- Technical Spec, Test Spec, and ADR by trigger condition.
- CODEOWNERS across core modules.
- Static analysis.
- Secret Scan.
- SCA.
- SonarQube Quality Gate.
- Contract tests for interface changes.
- Story readiness script.
- Verification script.
- Execution report for Tier B and Tier C.
- Weekly quality review.

### Nice-To-Have For Scale

- Full developer portal.
- Automated dashboards.
- Platform-level AI context service.
- Tool gateway and permission service.
- Trace store for AI runs.
- Automated supplier scorecards.
- AI output evaluation platform.

## What Can Be Done Immediately

These are mostly process and method changes:

- Use Tier A/B/C classification for every Story.
- Require SDD Story Spec for Tier B and Tier C.
- Require AI Context Boundary in Tier B and Tier C specs.
- Use Superpowers workflow for internal Tier B and Tier C work.
- Use the AI-SDD MR template.
- Require AI usage declaration when AI is used.
- Require test evidence in MR.
- Require Module Owner approval for core modules.
- Hold weekly AI-SDD review.

## What Requires Engineering Work

These should be planned as infrastructure backlog:

- CI/CD build and test pipeline.
- Branch protection.
- CODEOWNERS and MR approval rules.
- Pre-commit or pre-push hooks.
- SonarQube Quality Gate.
- SAST.
- SCA.
- Secret Scan.
- Contract test automation.
- Story readiness and verification scripts adapted per repo.
- Metrics dashboard.
- Developer portal and service catalog.

## Recommended Rollout

### Phase 0: Direction And Minimum Rules

Timeframe: 1 week.

Define pilot scope, roles, Tier A/B/C rules, minimum templates, AI context boundaries, and verification expectations.

### Phase 1: Manual-First Controlled Pilot

Timeframe: 2 to 4 weeks.

Run the workflow manually with SDD specs, Superpowers, MR evidence, Owner Review, local verification, weekly review, and minimal CI.

### Phase 2: CI And Quality Baseline

Timeframe: 4 to 8 weeks.

Make build, unit tests, static analysis, secret scanning, branch protection, and MR approvals enforceable.

### Phase 3: Multi-Team Expansion

Timeframe: 8 to 12 weeks.

Expand the same Tier model, templates, quality gates, owner review, and supplier acceptance standards across all teams.

### Phase 4: Platform And Dashboard Investment

Timeframe: after process and CI baseline are stable.

Invest in service catalog, dashboards, context service, tool gateway, trace store, and evaluation capabilities only after the underlying data is reliable.

## Default Principles

- SDD means Spec-Driven Development.
- AI work starts from approved specs, not free-form prompts.
- Enterprise-private AI is the default.
- Human ownership remains explicit for architecture, business-critical logic, security, and production risk.
- Internal teams use Superpowers as the default AI-SDD execution workflow.
- Outsourced delivery is accepted by artifacts, test evidence, quality gates, and delivery outcomes.
- Supplier teams are not required to use Superpowers or the internal AI workflow unless explicitly agreed.

## Quick Index

- [Governance Navigation](docs/ai-sdd-governance/README.md)
- [Executive Summary](docs/ai-sdd-governance/00-executive-summary.md)
- [Operating Model](docs/ai-sdd-governance/01-operating-model.md)
- [SDD Methodology](docs/ai-sdd-governance/02-sdd-methodology.md)
- [Toolchain](docs/ai-sdd-governance/03-toolchain.md)
- [Quality Gates](docs/ai-sdd-governance/04-quality-gates.md)
- [Metrics](docs/ai-sdd-governance/05-metrics.md)
- [Rollout And Acceptance](docs/ai-sdd-governance/06-rollout-and-acceptance.md)
- [Implementation Playbook](docs/ai-sdd-governance/07-implementation-playbook.md)
- [Superpowers Adoption Strategy](docs/ai-sdd-governance/08-superpowers-adoption.md)
- [Developer Guide](docs/ai-sdd-governance/09-sdd-and-superpowers-developer-guide.md)
- [Harness Engineering](docs/ai-sdd-governance/10-harness-engineering.md)
- [Testing Strategy For AI-SDD](docs/ai-sdd-governance/11-testing-strategy-for-ai-sdd.md)
- [Priorities And Roadmap](docs/ai-sdd-governance/12-priorities-and-roadmap.md)
- [Agent Tooling](docs/ai-sdd-governance/13-agent-tools.md)
- [Team AI SDLC Architecture](docs/ai-sdd-governance/14-team-ai-sdlc.md)
