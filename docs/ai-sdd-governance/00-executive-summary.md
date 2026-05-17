# AI-Assisted Agile Delivery And SDD Governance

## Purpose

This governance kit helps delivery leaders establish an executable, auditable, and measurable AI-assisted development model for large-scale agile software delivery programs.

For internal teams, the goal is not to let every developer use AI freely. The goal is to bring AI-assisted output into a controlled delivery loop through SDD specifications, Superpowers workflow, engineering guardrails, platform-enabled toolchains, and layered governance.

External supplier teams are not governed by the internal AI working method by default. Supplier delivery is managed primarily through deliverables, test evidence, quality gates, and acceptance results.

## Delivery Context

- Project type: large-scale enterprise software delivery program.
- Delivery mode: agile and iterative delivery.
- Team structure: multiple internal teams, mixed-seniority developers, contractors, and one or more external supplier teams.
- People structure: experienced employees, new hires, graduates, contractors, and supplier developers may work together.
- AI strategy: internal teams use AI-assisted development to improve delivery flow while keeping human ownership explicit.
- Workflow strategy: internal teams adopt Superpowers as the preferred AI-SDD execution workflow.
- Methodology strategy: the delivery program adopts Spec-Driven Development.

## Recommended Approach

Use a model of centralized governance, team autonomy, and platform-enforced controls.

Centralized governance:

- Establish an AI-SDD delivery governance committee.
- Standardize SDD templates, technical templates, quality gates, metric definitions, and audit rules.
- Standardize AI usage boundaries, prompt assets, and approved knowledge-source rules.

Team autonomy:

- Each agile team keeps flexibility over sprint rhythm, task breakdown, and day-to-day engineering practices.
- Internal teams appoint AI Champions to support Superpowers adoption, collect feedback, and reuse examples.

Platform-enforced controls:

- Use requirement templates, repositories, CI/CD, review rules, SonarQube, test coverage, dependency security scanning, and artifact repositories to make consistency the default.
- Supplier teams are not required to use the internal AI workflow. If their work is merged into internal repositories, it must satisfy the same deliverable expectations, quality gates, and Owner Review rules.

## What This Governance Prevents

- Different teams producing inconsistent artifacts.
- AI generating incorrect implementations from vague requirements.
- Supplier output being accepted with unstable quality standards.
- New hires and graduates creating hidden rework because expectations are implicit.
- AI-generated code lacking tests, audit trails, or clear accountability.
- Requirements, design, code, tests, release, and acceptance becoming untraceable.

## Default Policy

- Enterprise-private AI is preferred by default.
- Core production code must not be merged only because AI generated it.
- All AI-generated or AI-assisted output must pass human review and automated quality gates.
- Core modules must have accountable internal owners.
- Internal teams follow the agreed Superpowers workflow tiers by default.
- Supplier teams are not required to use Superpowers, Prompt Cards, or internal AI context unless explicitly agreed.
- New service APIs must have OpenAPI contracts.
- Cross-team data objects must have data dictionary entries.
- Asynchronous events must have event schemas.
- Error codes must be recorded in a shared error-code registry.
