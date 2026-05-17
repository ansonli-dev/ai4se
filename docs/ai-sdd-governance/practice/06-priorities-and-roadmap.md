# Priorities And Roadmap

Chinese version: [../zh/practice/06-优先级与路线图.md](../zh/practice/06-优先级与路线图.md)

## Purpose

This document separates governance ideas from implementation work.

The full AI-SDD governance model contains process rules, developer workflows, templates, quality gates, CI/CD, hooks, dashboards, and platform capabilities. They should not be treated as one all-or-nothing package.

The practical rollout needs three distinctions:

- Must-have versus nice-to-have.
- Directly actionable process changes versus infrastructure work.
- Immediate operating rules versus medium-term platform capabilities.

## Guiding Direction

The first goal is not to build a perfect AI engineering platform. The first goal is to make AI-assisted delivery controlled enough that teams can use it without losing traceability, quality, and ownership.

Recommended direction:

1. Start with clear workflow and artifact discipline.
2. Make developer behavior observable through merge requests and review evidence.
3. Add lightweight scripts before building platform automation.
4. Move quality gates into CI/CD once the manual standard is stable.
5. Add dashboards only after the underlying data is reliable.

## Classification Model

### Directly Actionable

These can be adopted mostly through agreements, templates, reviews, and team discipline.

Examples:

- SDD Story Spec usage.
- AI context boundary in Story or Spec.
- Superpowers workflow tiering.
- Developer checklist.
- MR AI usage declaration.
- Owner Review rule.
- Manual quality checklist.
- Weekly review cadence.

These items require enablement and enforcement, but not much technical platform work.

### Infrastructure Required

These require CI/CD, repository configuration, hooks, scanners, integrations, dashboards, or custom scripts.

Examples:

- Required CI pipeline stages.
- Branch protection.
- Merge request approval rules.
- SonarQube Quality Gate.
- SAST, SCA, Secret Scan.
- Pre-commit or pre-push hooks.
- Automated Story readiness checks.
- Automated execution report generation.
- Metrics dashboards.
- Developer portal and service catalog.

These should be planned as engineering work, not only written as policy.

## Priority Levels

### P0: Must-Have For Controlled Pilot

P0 items are required before claiming the pilot is controlled.

| Area | Item | Type | Why It Matters |
| --- | --- | --- | --- |
| Direction | One approved pilot domain and pilot Story set | Directly actionable | Keeps rollout bounded and testable. |
| Governance | Governance owner, Tech Lead, QA, Security, AI Champion roles named | Directly actionable | Makes decisions and exceptions accountable. |
| Ownership | Module Owner identified for pilot modules | Directly actionable | Prevents AI or supplier work from bypassing domain ownership. |
| SDD | SDD Story Spec required for Tier B and Tier C | Directly actionable | Gives humans and AI a stable input. |
| Scope | Tier A/B/C classification rule | Directly actionable | Avoids applying heavyweight process to trivial changes. |
| AI Context | Allowed and forbidden context policy | Directly actionable | Prevents leaking sensitive data or using wrong context. |
| Superpowers | Internal developer workflow for Tier B/C | Directly actionable | Turns AI usage into a repeatable engineering workflow. |
| MR Evidence | MR template with AI usage, test evidence, risk, rollback, and review sections | Directly actionable | Makes output auditable before automation is mature. |
| Review | Owner Review for core module changes | Directly actionable plus repository configuration | Keeps high-risk decisions with accountable humans. |
| Verification | Build and unit test command documented for each pilot repo | Directly actionable | Establishes the first evidence baseline. |
| CI/CD | Minimal CI pipeline for build and unit tests | Infrastructure required | Prevents broken changes from relying only on human memory. |
| Repository | Branch protection for main branch | Infrastructure required | Stops direct merge of unreviewed AI-assisted work. |

P0 completion rule:

- A Tier B pilot Story can move from approved spec to MR using the agreed workflow.
- The MR contains required evidence.
- Build and unit tests run in CI.
- Human review and Owner Review rules are visible and enforceable.

### P1: Should-Have For Team Adoption

P1 items make the process scalable across multiple teams.

| Area | Item | Type | Why It Matters |
| --- | --- | --- | --- |
| Templates | Technical Spec, Test Spec, ADR, Prompt Card, OpenAPI, Event Schema, Data Dictionary, Error Code templates | Directly actionable | Standardizes artifacts when changes touch architecture, tests, APIs, data, and errors. |
| Harness | Lightweight Story readiness script | Infrastructure required | Catches missing spec fields before implementation. |
| Harness | Lightweight verification script | Infrastructure required | Gives teams a common local verification entrypoint. |
| Harness | Agent execution report template | Directly actionable plus optional script | Captures assumptions, context, commands, failures, and review needs. |
| Quality | Static analysis in CI | Infrastructure required | Raises baseline maintainability. |
| Quality | Contract tests for interface changes | Infrastructure required | Prevents API drift across teams. |
| Security | Secret Scan in CI | Infrastructure required | Blocks one of the highest-risk failure modes. |
| Security | SCA dependency scan | Infrastructure required | Makes dependency risk visible. |
| Review | MR approval rules by owner or code path | Infrastructure required | Turns ownership into enforceable workflow. |
| Enablement | AI Champion onboarding guide and examples | Directly actionable | Helps new hires and contractors follow the same path. |
| Cadence | Weekly AI-SDD quality review | Directly actionable | Converts failures into process improvements. |

P1 completion rule:

- Multiple internal teams can run the same Tier B workflow.
- Missing Story information is caught before or during MR review.
- Common quality and security checks run consistently.
- Weekly review produces tracked actions.

### P2: Nice-To-Have Or Scale Capability

P2 items are valuable after the basic workflow and CI baseline are stable.

| Area | Item | Type | Why It Matters |
| --- | --- | --- | --- |
| Dashboard | AI usage dashboard | Infrastructure required | Useful only after MR evidence and execution reports are consistent. |
| Dashboard | Quality and consistency dashboard | Infrastructure required | Supports governance review at scale. |
| Portal | Backstage service catalog | Infrastructure required | Centralizes ownership, API docs, runtime links, and dependencies. |
| Platform | Context service | Infrastructure required | Controls what AI agents can retrieve. |
| Platform | Tool gateway and permission service | Infrastructure required | Provides stronger AI execution control. |
| Platform | Trace store for AI runs | Infrastructure required | Enables deeper audit and failure analysis. |
| Automation | Automated supplier scorecard | Infrastructure required | Useful after supplier quality data is stable. |
| Evaluation | AI output evaluation suite | Infrastructure required | Helps compare prompts, models, and workflows. |

P2 completion rule:

- The organization has enough stable process data to justify dashboards or platform investment.
- Teams are no longer debating the basic workflow.

## What Can Be Implemented Immediately

The following can be started before CI/CD and hooks are fully built.

### Process And Method

- Use Tier A/B/C classification for every Story.
- Require SDD Story Spec for Tier B and Tier C.
- Require AI Context Boundary in Tier B and Tier C specs.
- Require Technical Spec or ADR when architecture, API, data, permissions, or production risk is involved.
- Require Test Spec when behavior is non-trivial.
- Use Superpowers workflow for internal Tier B and Tier C work.
- Use lightweight workflow for Tier A work.

### Review And Evidence

- Use the AI-SDD MR template.
- Require AI usage declaration when AI is used.
- Require test evidence in MR.
- Require risk and rollback notes for production-impacting work.
- Require Module Owner approval for core modules.
- Run weekly AI-SDD review using the weekly review template.

### Team Enablement

- Name AI Champions.
- Create example Story packages.
- Pair new hires, graduates, and contractors with AI Champions for the first two iterations.
- Maintain a small set of approved prompt cards.
- Record AI failure cases and common corrections.

## What Requires Additional Work

The following should be treated as engineering backlog items.

### Repository And Git Controls

- Add branch protection.
- Add CODEOWNERS.
- Configure required MR approvals.
- Add merge request template to each application repo.
- Add pre-commit hooks for formatting, linting, and secret checks where appropriate.
- Add pre-push hooks only for fast checks; slow verification belongs in CI.

### CI/CD Pipeline

- Add build stage.
- Add unit test stage.
- Add integration or contract test stage when relevant.
- Add static analysis stage.
- Add SonarQube Quality Gate.
- Add SAST.
- Add SCA.
- Add Secret Scan.
- Add database migration validation when schema changes are used.
- Publish test reports and scan reports as pipeline artifacts.

### Harness Automation

- Adapt `ai-harness/scripts/check-story-ready.sh` for actual Story file locations and required fields.
- Adapt `ai-harness/scripts/run-verification.sh` for each technology stack.
- Generate execution reports automatically or semi-automatically.
- Attach execution reports to merge requests.
- Add failure categories for weekly review.

### Data And Metrics

- Define where Story IDs, Spec links, MR links, AI usage, test results, and review outcomes are stored.
- Build dashboards only after data capture is consistent.
- Start with weekly manual review before investing in automation.

## Recommended Roadmap

### Phase 0: Direction And Minimum Rules

Timeframe: 1 week.

Goal: make the target operating model explicit enough that pilot teams know what to do.

Must complete:

- Choose pilot domain.
- Choose pilot internal team.
- Name governance roles, AI Champion, and Module Owners.
- Approve Tier A/B/C definitions.
- Approve SDD Story Spec and MR template.
- Approve AI context and security boundaries.
- Define minimum verification command per pilot repo.

Exit criteria:

- A developer can look at a Story and know whether it is Tier A, Tier B, or Tier C.
- A reviewer can look at an MR and know what evidence is required.

### Phase 1: Manual-First Controlled Pilot

Timeframe: 2 to 4 weeks.

Goal: run the process with minimal automation.

Must complete:

- Use SDD Story Spec for Tier B/C pilot Stories.
- Use Superpowers workflow for internal Tier B/C work.
- Use MR template for all pilot changes.
- Require Owner Review for pilot core modules.
- Run build and unit tests locally and record evidence in MR.
- Hold weekly AI-SDD review.

Infrastructure work:

- Add minimal CI for build and unit tests.
- Add branch protection.
- Add CODEOWNERS for pilot modules.

Exit criteria:

- At least one Tier B Story completes from approved SDD Spec to accepted MR.
- Evidence gaps and process friction are visible.

### Phase 2: CI And Quality Baseline

Timeframe: 4 to 8 weeks.

Goal: turn manual quality expectations into enforceable pipeline checks.

Must complete:

- Build and unit tests are required in CI.
- Static analysis is in CI.
- Secret Scan is in CI.
- MR approvals are enforced for protected branches.
- Story readiness and verification scripts are adapted for pilot repos.
- Test evidence is attached or linked in MR.

Should complete:

- SonarQube Quality Gate.
- SCA.
- Contract tests for API changes.
- Execution report generation for Tier B/C.

Exit criteria:

- A change cannot merge if the basic checks fail.
- Reviewers spend less time checking whether evidence exists and more time reviewing behavior and risk.

### Phase 3: Multi-Team Expansion

Timeframe: 8 to 12 weeks.

Goal: expand from pilot team to all internal teams and supplier acceptance.

Must complete:

- All internal teams use the same Tier model.
- All internal teams use agreed SDD and MR templates.
- Core modules have CODEOWNERS.
- External supplier acceptance uses the same deliverable and evidence checklist.
- Weekly review includes quality gate failures, AI failures, and supplier quality.

Should complete:

- Contract test baseline for core APIs.
- Shared prompt card examples.
- Common AI failure case library.
- Supplier scorecard used monthly.

Exit criteria:

- Internal and outsourced delivery can be compared by artifact completeness, quality gate pass rate, defect rate, and rework rate.

### Phase 4: Platform And Dashboard Investment

Timeframe: after process and CI baseline are stable.

Goal: invest in platform capabilities only after the workflow produces reliable data.

Candidates:

- Backstage service catalog.
- Ownership and dependency map.
- AI usage dashboard.
- Quality and consistency dashboard.
- Context service.
- Tool gateway.
- Trace store.
- Evaluation service.

Exit criteria:

- Dashboard data is trusted enough for governance decisions.
- Platform work reduces repeated manual effort or prevents known recurring failures.

## Must-Have Versus Nice-To-Have Summary

### Must-Have

- Clear pilot scope.
- Named owners and governance roles.
- Tier A/B/C classification.
- SDD Story Spec for Tier B/C.
- AI context boundary.
- Superpowers workflow for internal Tier B/C.
- MR template with AI usage and evidence.
- Owner Review for core modules.
- Minimal build and test verification.
- Branch protection and minimal CI for pilot repos.

### Should-Have

- Technical Spec, Test Spec, ADR usage by trigger condition.
- CODEOWNERS across core modules.
- Static analysis.
- Secret Scan.
- SCA.
- SonarQube Quality Gate.
- Contract tests for interface changes.
- Story readiness script.
- Verification script.
- Execution report for Tier B/C.
- Weekly quality review.

### Nice-To-Have

- Full developer portal.
- Automated dashboards.
- Platform-level AI context service.
- Tool gateway and permission service.
- Trace store for every AI run.
- Automated supplier scorecards.
- AI output evaluation platform.

## Practical Sequencing Rule

Use this rule when there is disagreement about priority:

1. If it prevents unclear or unsafe AI execution, do it early.
2. If it prevents broken code from merging, put it in CI/CD as soon as possible.
3. If it only improves reporting, wait until the source data is reliable.
4. If it requires platform engineering, wait until the manual process has proven repeated value.
5. If it is only nice process language and does not change behavior, simplify or remove it.

## Decision Table

| Question | Recommended Decision |
| --- | --- |
| Should context management be automated first? | No. Start with explicit AI Context Boundary in specs and MR review, then automate once patterns stabilize. |
| Should Superpowers be enforced through tooling first? | No. Treat it as an internal workflow method first; enforce evidence through MR template and review. |
| Should quality gates be policy-only? | No. Quality gates must become CI/CD checks, otherwise they remain guidance. |
| Should hooks block everything locally? | No. Use hooks for fast local checks. Use CI for authoritative checks. |
| Should dashboards be built early? | No. Manual weekly review comes first; dashboards come after consistent data capture. |
| Should outsourced teams use Superpowers? | Not by default. Accept outsourced work by spec, deliverables, test evidence, quality gates, and owner approval. |

## Backlog For Infrastructure Work

### CI/CD Backlog

- Define common pipeline template.
- Add build job.
- Add unit test job.
- Add test report publishing.
- Add static analysis job.
- Add SonarQube integration.
- Add Secret Scan job.
- Add SCA job.
- Add SAST job.
- Add contract test job for API repos.
- Add database migration check where applicable.

### Git And Repository Backlog

- Add branch protection.
- Add MR template.
- Add CODEOWNERS.
- Configure required approvals by branch and path.
- Add pre-commit configuration.
- Add fast formatting and lint checks to hooks.
- Add secret detection hook if the team accepts local hook enforcement.

### Harness Backlog

- Map Story and Spec file locations.
- Customize required Story fields.
- Customize `check-story-ready.sh`.
- Customize `run-verification.sh` by stack.
- Generate execution report from command outputs.
- Store reports as MR artifacts.
- Add failure attribution categories.

### Metrics Backlog

- Define metric source of truth.
- Capture Story ID and Spec link in MR.
- Capture AI usage declaration in MR.
- Capture pipeline result and test evidence.
- Capture review outcome.
- Capture defect and rework outcome.
- Build dashboard after two or more iterations of reliable data.

