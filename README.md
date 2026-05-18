# AI-SDD Delivery Governance Handbook

Chinese version: [README.zh.md](README.zh.md)

This repository is a governance handbook and working kit for AI-assisted agile software delivery. It is designed for delivery owners, architects, tech leads, developers, QA, security leads, AI champions, and supplier teams who need faster delivery without losing quality, ownership, evidence, or auditability.

## How To Use This Repository

Read it first as a handbook, then use it as a working kit.

1. Start with the governance navigation: [docs/ai-sdd-governance/README.md](docs/ai-sdd-governance/README.md).
2. Learn the concepts through the knowledge path.
3. Run delivery work through the practice path.
4. Use templates, policies, checklists, and harness scripts only when they support a concrete delivery step.

## Main Structure

- [Governance handbook](docs/ai-sdd-governance/README.md): the main English guide, split into knowledge and practice.
- [Chinese governance handbook](docs/ai-sdd-governance/zh/README.md): the same structure and content organization in Chinese.
- [Templates](templates/): delivery artifacts such as specs, ADRs, plans, evidence records, release notes, and supplier scorecards.
- [AI policies](ai/): team-level AI engineering, context, security, tool, testing, and review policies.
- [Quality gates](quality-gates/): practical merge, CI, exception, and acceptance controls.
- [AI harness](ai-harness/README.md): lightweight prompts, policy YAML, and scripts for controlled AI-agent execution.

## Knowledge Path

Use this path to understand the system in a learning-friendly order:

0. [Reading Guide](docs/ai-sdd-governance/knowledge/00-reading-guide.md)
1. [AI-SDD Overview](docs/ai-sdd-governance/knowledge/01-ai-sdd-overview.md)
2. [SDD Methodology](docs/ai-sdd-governance/knowledge/02-sdd-methodology.md)
3. [Execution Stack](docs/ai-sdd-governance/knowledge/03-execution-stack.md)
4. [Operating Model](docs/ai-sdd-governance/knowledge/04-operating-model.md)
5. [Quality Gates](docs/ai-sdd-governance/knowledge/05-quality-gates.md)
6. [Testing Strategy](docs/ai-sdd-governance/knowledge/06-testing-strategy.md)
7. [Toolchain](docs/ai-sdd-governance/knowledge/07-toolchain.md)
8. [Agent Tools](docs/ai-sdd-governance/knowledge/08-agent-tools.md)
9. [Harness Engineering](docs/ai-sdd-governance/knowledge/09-harness-engineering.md)
10. [Metrics](docs/ai-sdd-governance/knowledge/10-metrics.md)
11. [Capstone: From Concepts To Delivery](docs/ai-sdd-governance/knowledge/11-capstone.md)
12. [Glossary](docs/ai-sdd-governance/knowledge/12-glossary.md)

## Practice Path

Use this path to run work through delivery roles and flow:

0. [Reading Guide](docs/ai-sdd-governance/practice/00-reading-guide.md)
1. [Team AI SDLC](docs/ai-sdd-governance/practice/01-team-ai-sdlc.md)
2. [AI Context Artifact Map](docs/ai-sdd-governance/practice/02-ai-context-artifact-map.md)
3. [Superpowers Adoption](docs/ai-sdd-governance/practice/03-superpowers-adoption.md)
4. [Developer Guide](docs/ai-sdd-governance/practice/04-developer-guide.md)
5. [Implementation Playbook](docs/ai-sdd-governance/practice/05-implementation-playbook.md)
6. [Priorities And Roadmap](docs/ai-sdd-governance/practice/06-priorities-and-roadmap.md)
7. [Rollout And Acceptance](docs/ai-sdd-governance/practice/07-rollout-and-acceptance.md)
8. [Role × Stage Matrix](docs/ai-sdd-governance/practice/08-role-stage-matrix.md)
9. [BA Guide](docs/ai-sdd-governance/practice/09-ba-guide.md)

## Role Entry Points

- Delivery Owner: start with [AI-SDD Overview](docs/ai-sdd-governance/knowledge/01-ai-sdd-overview.md), [Operating Model](docs/ai-sdd-governance/knowledge/04-operating-model.md), [Priorities And Roadmap](docs/ai-sdd-governance/practice/06-priorities-and-roadmap.md), and [Rollout And Acceptance](docs/ai-sdd-governance/practice/07-rollout-and-acceptance.md).
- Architect or Tech Lead: start with [SDD Methodology](docs/ai-sdd-governance/knowledge/02-sdd-methodology.md), [Quality Gates](docs/ai-sdd-governance/knowledge/05-quality-gates.md), [Toolchain](docs/ai-sdd-governance/knowledge/07-toolchain.md), [Agent Tools](docs/ai-sdd-governance/knowledge/08-agent-tools.md), and [Team AI SDLC](docs/ai-sdd-governance/practice/01-team-ai-sdlc.md).
- BA / Business Analyst: start with [BA Guide](docs/ai-sdd-governance/practice/09-ba-guide.md), [AI Context Artifact Map](docs/ai-sdd-governance/practice/02-ai-context-artifact-map.md), [Role × Stage Matrix](docs/ai-sdd-governance/practice/08-role-stage-matrix.md), and [Requirement Review Record template](templates/requirement-review-record.md).
- Product Owner: start with [Team AI SDLC](docs/ai-sdd-governance/practice/01-team-ai-sdlc.md), [BA Guide](docs/ai-sdd-governance/practice/09-ba-guide.md) (to know what BA needs from you), and [Role × Stage Matrix](docs/ai-sdd-governance/practice/08-role-stage-matrix.md).
- Developer: start with [Developer Guide](docs/ai-sdd-governance/practice/04-developer-guide.md), [Superpowers Adoption](docs/ai-sdd-governance/practice/03-superpowers-adoption.md), [AI Engineering Constitution](ai/engineering-constitution.md), and [AI Context Policy](ai/context-policy.md).
- QA: start with [Testing Strategy](docs/ai-sdd-governance/knowledge/06-testing-strategy.md), [Quality Gates](docs/ai-sdd-governance/knowledge/05-quality-gates.md), [Testing Policy](ai/testing-policy.md), and [Quality Gate Checklist](quality-gates/checklist.md).
- Security Lead: start with [Toolchain](docs/ai-sdd-governance/knowledge/07-toolchain.md), [Quality Gates](docs/ai-sdd-governance/knowledge/05-quality-gates.md), [Security Policy](ai/security-policy.md), and [Allowed Tools](ai/allowed-tools.md).
- AI Champion: start with [Superpowers Adoption](docs/ai-sdd-governance/practice/03-superpowers-adoption.md), [Developer Guide](docs/ai-sdd-governance/practice/04-developer-guide.md), [Harness Engineering](docs/ai-sdd-governance/knowledge/09-harness-engineering.md), and [Weekly AI-SDD Review](templates/weekly-ai-sdd-review.md).
- Supplier Lead: start with [AI-SDD Overview](docs/ai-sdd-governance/knowledge/01-ai-sdd-overview.md), [Operating Model](docs/ai-sdd-governance/knowledge/04-operating-model.md), [Quality Gates](docs/ai-sdd-governance/knowledge/05-quality-gates.md), [Implementation Playbook](docs/ai-sdd-governance/practice/05-implementation-playbook.md), and [Supplier Scorecard](templates/supplier-scorecard.md).
