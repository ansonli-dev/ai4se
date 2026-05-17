# AI-SDD Governance Navigation

Chinese version: [zh/README.md](./zh/README.md)

This page is the start-here navigation for the governance articles. It helps readers answer four questions quickly:

- What capability is this project trying to establish?
- What organization, process, template, and tooling preparation is needed first?
- What does a developer's daily workflow look like after the process is running?
- Which parts can be adopted directly, and which parts require CI/CD, Git hooks, scanners, dashboards, or platform work?

## One-Sentence Positioning

This project is an AI-SDD governance handbook for large-scale agile software delivery.

It is not only an AI tool guide and not only a coding standard. Its core goal is to make AI-assisted delivery consistent, auditable, measurable, and acceptable across multiple teams, mixed experience levels, contractors, and suppliers.

## Main Delivery Flow

```text
Business goal
  -> SDD specifications and acceptance criteria
  -> Internal AI-SDD execution workflow
  -> Harness context, tools, permissions, and verification control
  -> Code, tests, contracts, and documentation
  -> CI/CD, Owner Review, and quality gates
  -> Acceptance, metrics, review, and continuous improvement
```

Key relationships:

- SDD defines what should be built and how it will be accepted.
- Superpowers defines how internal developers execute AI-assisted work with discipline.
- Harness Engineering defines context, tools, permissions, verification, and evidence for AI execution.
- Quality Gates define what can merge, release, or be accepted.
- Metrics show delivery flow, quality, and consistency trends.

## 1. Project-Level Workstreams

### 1.1 Establish A Unified Delivery Method

Important work starts from a Story, specification, acceptance criteria, and context boundary rather than a free-form prompt.

Read:

- [00-executive-summary.md](./00-executive-summary.md)
- [02-sdd-methodology.md](./02-sdd-methodology.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)

Core outputs:

- SDD Story Spec
- Technical Spec
- Test Spec
- ADR
- OpenAPI contract
- Event Schema
- Data Dictionary
- Error Code Registry

### 1.2 Establish Governance And Ownership

The program needs clear rules for who owns standards, who owns modules, who approves risky changes, and how suppliers participate.

Read:

- [01-operating-model.md](./01-operating-model.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)

Core mechanisms:

- AI-SDD Governance Committee
- Team AI Champion
- Module Owner
- CODEOWNERS
- Quality Arbitration
- Supplier Review

### 1.3 Establish Internal AI-Assisted Development Workflow

Internal teams use Superpowers as the default AI-SDD execution workflow. AI usage is placed inside an engineering rhythm of clarification, planning, testing, implementation, review, and verification.

Read:

- [08-superpowers-adoption.md](./08-superpowers-adoption.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)

Workflow tiers:

- Tier A: lightweight changes.
- Tier B: standard business Stories.
- Tier C: high-risk, core, permission, data, production-impacting, or architecture changes.

### 1.4 Establish Quality Gates And Acceptance

Internal merges and supplier acceptance both need deliverables, test evidence, quality gates, and human approval.

Read:

- [04-quality-gates.md](./04-quality-gates.md)
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)
- [../../quality-gates/checklist.md](../../quality-gates/checklist.md)
- [../../quality-gates/ci-gate-policy.md](../../quality-gates/ci-gate-policy.md)

Core checks:

- Build
- Unit Test
- Integration or Contract Test
- Static Analysis
- SonarQube Quality Gate
- SAST
- SCA
- Secret Scan
- Owner Review
- AI Usage Declaration

### 1.5 Establish Metrics And Continuous Improvement

The program should not measure AI usage alone. It should measure speed, quality, and consistency together.

Read:

- [05-metrics.md](./05-metrics.md)
- [../../templates/weekly-ai-sdd-review.md](../../templates/weekly-ai-sdd-review.md)
- [../../templates/supplier-scorecard.md](../../templates/supplier-scorecard.md)

Core metrics:

- Story Cycle Time
- Spec Ready to MR Ready Time
- Defect Escape Rate
- Rework Rate
- MR First-Pass Rate
- Spec Template Compliance
- OpenAPI Coverage
- Owner Review Coverage
- Outsourced Deliverable Quality Delta

### 1.6 Clarify Priorities And Roadmap

The complete governance model should not be treated as a single same-priority checklist. Context management, Superpowers usage, Story intake, and MR evidence can be adopted first as process methods. Quality gates, CI/CD, Git hooks, scanners, dashboards, and service catalogs require infrastructure backlog work.

Read:

- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)

Core distinctions:

- P0: required for a controlled pilot.
- P1: required for team expansion.
- P2: useful after scale.
- Directly Actionable: can be adopted through process, templates, review, and enablement.
- Infrastructure Required: requires CI/CD, repository configuration, hooks, scanners, scripts, dashboards, or platform work.

### 1.7 Clarify Agent Tooling

Agent tools such as Claude Code, Codex, and Cursor are execution environments. They should support the governance model rather than replace it.

Read:

- [13-agent-tools.md](./13-agent-tools.md)

Core topics:

- Claude Code CLI, app, IDE plugins, skills, MCP, plugins, memory, hooks, and subagents.
- OpenAI Codex terminal-native coding workflow.
- Cursor editor-native AI workflow.
- Tool-neutral SDD, review, verification, and evidence rules.

## 2. Preparation Work

### 2.1 Organization

- Appoint the AI-SDD Governance Committee.
- Appoint one or two AI Champions per internal team.
- Select the pilot domain and pilot Stories.
- Confirm Module Owners for pilot modules.
- Confirm supplier delivery boundaries and acceptance rules.

### 2.2 Methods And Templates

- Approve SDD Story Spec, Technical Spec, Test Spec, and ADR templates.
- Approve Prompt Card, Agent Execution Report, and MR templates.
- Approve API, event, data dictionary, and error-code templates.
- Define Tier A, Tier B, and Tier C triggers and required artifacts.

### 2.3 Repository And Toolchain

- Configure branch protection and MR approval rules.
- Configure CI/CD quality gates.
- Integrate SonarQube, SAST, SCA, and Secret Scan.
- Establish API contract, test asset, and knowledge base locations.
- Prepare application repositories with README, docs/specs, docs/adrs, docs/api, CODEOWNERS, and MR templates.

### 2.4 AI Usage Boundary

- Define allowed AI context.
- Define forbidden AI context.
- Define allowed tools, forbidden operations, and human confirmation points.
- Define how AI usage is recorded, reviewed, and traced.

### 2.5 Harness

- Adopt team-level policies under `/ai/`.
- Require AI Context Boundary for Tier B and Tier C work.
- Use `ai-harness` prompts, policies, and scripts as a lightweight execution-control layer.
- Gradually integrate readiness checks, verification, and execution reports into CI or MR workflow.

## 3. Developer Daily Workflow

1. Perform Story intake.
2. Classify the work as Tier A, Tier B, or Tier C.
3. Confirm Definition of Ready and implementation plan.
4. Develop with test discipline.
5. Update required contracts and artifacts.
6. Open a merge request with evidence.
7. Verify before claiming completion.

## 4. Role-Based Reading Paths

- Delivery Owner: read `00`, `01`, `05`, `06`, and `12`.
- Architect or Tech Lead: read `02`, `03`, `04`, `10`, and `12`.
- Developer: read `08`, `09`, `ai/engineering-constitution.md`, and `ai/context-policy.md`.
- QA: read `04`, `11`, `ai/testing-policy.md`, and `templates/test-spec.md`.
- Security Lead: read `03`, `04`, `ai/security-policy.md`, and `ai/context-policy.md`.
- Supplier Lead: read `00`, `01`, `04`, `07`, and `templates/supplier-scorecard.md`.

## 5. Minimum Executable Checklist

- [ ] Governance roles, AI Champions, and Module Owners are named.
- [ ] One pilot domain and pilot Story set are selected.
- [ ] SDD Story Spec, Technical Spec, Test Spec, and MR templates are adopted.
- [ ] Tier A/B/C rules are approved.
- [ ] Basic CI, tests, static analysis, and security scan plan are defined.
- [ ] AI Context Policy and Security Policy are approved.
- [ ] One internal team completes a Story using the Superpowers workflow.
- [ ] Supplier delivery is accepted by artifacts and test evidence.
- [ ] Weekly review captures quality gate failures, AI failure cases, and template improvements.

## 6. Document Index

- [00-executive-summary.md](./00-executive-summary.md): project purpose and default policy.
- [01-operating-model.md](./01-operating-model.md): governance layers, roles, cadence, and team rules.
- [02-sdd-methodology.md](./02-sdd-methodology.md): SDD flow, DoR, DoD, and artifact lifecycle.
- [03-toolchain.md](./03-toolchain.md): enterprise toolchain and AI platform architecture.
- [04-quality-gates.md](./04-quality-gates.md): merge gates, review policy, and supplier acceptance.
- [05-metrics.md](./05-metrics.md): efficiency, quality, and consistency metrics.
- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md): 12-week rollout plan and acceptance scenarios.
- [07-implementation-playbook.md](./07-implementation-playbook.md): Week 0, kickoff, review cadence, supplier review, and RACI.
- [08-superpowers-adoption.md](./08-superpowers-adoption.md): internal Superpowers adoption strategy.
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md): developer execution guide.
- [10-harness-engineering.md](./10-harness-engineering.md): AI Harness control layer, maturity levels, and rollout.
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md): AI-SDD testing strategy.
- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md): priorities, directly actionable items, infrastructure work, and roadmap.
- [13-agent-tools.md](./13-agent-tools.md): Claude Code, Codex, Cursor, agent capabilities, and tool governance.
