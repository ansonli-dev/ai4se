# AI-SDD Governance Navigation

Chinese version: [zh/README.md](zh/README.md)

This is the main English entry point for the AI-SDD governance handbook. The handbook is organized into two paths:

- **Knowledge path:** learn the concepts in a sequence that builds understanding.
- **Practice path:** run delivery work by flow, role, artifact, and rollout stage.

The executable assets remain outside this folder: templates under [../../templates/](../../templates/), policies under [../../ai/](../../ai/), quality gates under [../../quality-gates/](../../quality-gates/), and harness assets under [../../ai-harness/](../../ai-harness/).

## One-Sentence Positioning

AI-SDD is a governance model for AI-assisted software delivery where work starts from reviewed specifications, controlled context, explicit human ownership, quality gates, and verifiable acceptance evidence.

## Main Delivery Flow

```text
Business objective
  -> SDD specs and acceptance criteria
  -> Internal AI-SDD execution workflow
  -> Context, tool, permission, and verification controls
  -> Code, tests, contracts, and documentation
  -> CI/CD, owner review, and quality gates
  -> Acceptance, metrics, retrospectives, and continuous improvement
```

## Knowledge Path

Read these in order when learning the model:

0. [Reading Guide](knowledge/00-reading-guide.md): start here. Panoramic overview, the four-layer execution stack, core vocabulary, and how to navigate the rest of this path.
1. [AI-SDD Overview](knowledge/01-ai-sdd-overview.md): delivery context, governance approach, and default policy.
2. [SDD Methodology](knowledge/02-sdd-methodology.md): why AI-assisted delivery starts from specifications, readiness, and acceptance.
3. [Execution Stack](knowledge/03-execution-stack.md): the SDD + Superpowers + Harness + CI/Review four-layer mental model that holds everything else together.
4. [Operating Model](knowledge/04-operating-model.md): governance layers, ownership, arbitration, and team rules.
5. [Quality Gates](knowledge/05-quality-gates.md): merge policy, human review, exceptions, and supplier acceptance.
6. [Testing Strategy](knowledge/06-testing-strategy.md): test strategy for AI-assisted SDD work.
7. [Toolchain](knowledge/07-toolchain.md): enterprise toolchain and AI platform architecture.
8. [Agent Tools](knowledge/08-agent-tools.md): Claude Code, Codex, Cursor, skills, MCP, plugins, memory, hooks, and tool governance.
9. [Harness Engineering](knowledge/09-harness-engineering.md): the harness layer in depth — maturity levels, rollout phases, and the minimum standard.
10. [Metrics](knowledge/10-metrics.md): efficiency, quality, consistency, and review cadence.
11. [Capstone: From Concepts To Delivery](knowledge/11-capstone.md): one Story walked through all ten concept docs, then handed to the Practice path.
12. [Glossary](knowledge/12-glossary.md): terms and abbreviations used across the handbook.

## Practice Path

Use these when running real delivery work:

0. [Reading Guide](practice/00-reading-guide.md): start here. Role-based reading orders, where the four-layer execution stack resurfaces, and which docs are the canonical references.
1. [Team AI SDLC](practice/01-team-ai-sdlc.md): how the execution stack lands in a team's real SDLC stages, and where Superpowers, GSD, gstack, and BMAD each fit.
2. [AI Context Artifact Map](practice/02-ai-context-artifact-map.md): the canonical stage × artifact × tier × template reference that other practice docs defer to.
3. [Superpowers Adoption](practice/03-superpowers-adoption.md): internal Tier A/B/C workflow rules and adoption boundaries.
4. [Developer Guide](practice/04-developer-guide.md): the eight-step daily workflow from Story intake to verified MR.
5. [Implementation Playbook](practice/05-implementation-playbook.md): Week 0 preparation, kickoff, review cadence, supplier review, minimum repo setup, and RACI (now including BA and PO).
6. [Priorities And Roadmap](practice/06-priorities-and-roadmap.md): the canonical 5-phase rollout sequence — P0/P1/P2 classification and operational backlogs.
7. [Rollout And Acceptance](practice/07-rollout-and-acceptance.md): acceptance scenarios that verify the rollout from doc 06 actually produced the behavior change you wanted.
8. [Role × Stage Matrix](practice/08-role-stage-matrix.md): the canonical role × stage reference — who produces what at each stage, with per-role micro-flows.
9. [BA Guide](practice/09-ba-guide.md): BA's deep workflow — Requirement intake → three-reviews → Story breakdown → backlog → support → close.

## Role Paths

- Delivery Owner: [AI-SDD Overview](knowledge/01-ai-sdd-overview.md), [Operating Model](knowledge/04-operating-model.md), [Priorities And Roadmap](practice/06-priorities-and-roadmap.md), [Rollout And Acceptance](practice/07-rollout-and-acceptance.md), [Metrics](knowledge/10-metrics.md).
- Architect or Tech Lead: [SDD Methodology](knowledge/02-sdd-methodology.md), [Quality Gates](knowledge/05-quality-gates.md), [Toolchain](knowledge/07-toolchain.md), [Agent Tools](knowledge/08-agent-tools.md), [Team AI SDLC](practice/01-team-ai-sdlc.md), [Role × Stage Matrix](practice/08-role-stage-matrix.md).
- BA / Business Analyst: [BA Guide](practice/09-ba-guide.md), [AI Context Artifact Map](practice/02-ai-context-artifact-map.md), [Role × Stage Matrix](practice/08-role-stage-matrix.md), [Requirement Review Record](../../templates/requirement-review-record.md), [BA Handoff Checklist](../../templates/ba-handoff-checklist.md).
- Product Owner: [Team AI SDLC](practice/01-team-ai-sdlc.md), [BA Guide](practice/09-ba-guide.md), [Role × Stage Matrix](practice/08-role-stage-matrix.md), [Rollout And Acceptance](practice/07-rollout-and-acceptance.md).
- Developer: [Developer Guide](practice/04-developer-guide.md), [Superpowers Adoption](practice/03-superpowers-adoption.md), [AI Engineering Constitution](../../ai/engineering-constitution.md), [AI Context Policy](../../ai/context-policy.md), [Testing Policy](../../ai/testing-policy.md).
- QA: [Testing Strategy](knowledge/06-testing-strategy.md), [Quality Gates](knowledge/05-quality-gates.md), [Testing Policy](../../ai/testing-policy.md), [Test Spec Template](../../templates/test-spec.md), [Quality Gate Checklist](../../quality-gates/checklist.md).
- Security Lead: [Toolchain](knowledge/07-toolchain.md), [Quality Gates](knowledge/05-quality-gates.md), [Security Policy](../../ai/security-policy.md), [AI Context Policy](../../ai/context-policy.md), [Allowed Tools](../../ai/allowed-tools.md).
- AI Champion: [Superpowers Adoption](practice/03-superpowers-adoption.md), [Developer Guide](practice/04-developer-guide.md), [Harness Engineering](knowledge/09-harness-engineering.md), [Prompt Card Template](../../templates/prompt-card.md), [Weekly AI-SDD Review](../../templates/weekly-ai-sdd-review.md).
- Supplier Lead: [AI-SDD Overview](knowledge/01-ai-sdd-overview.md), [Operating Model](knowledge/04-operating-model.md), [Quality Gates](knowledge/05-quality-gates.md), [Implementation Playbook](practice/05-implementation-playbook.md), [Supplier Scorecard](../../templates/supplier-scorecard.md).

## Minimum Executable Checklist

- [ ] Governance roles, AI Champion, and Module Owner are named.
- [ ] Pilot scope and pilot Stories are selected.
- [ ] SDD Story Spec, Technical Spec, Test Spec, and MR templates are approved.
- [ ] Tier A/B/C rules are approved.
- [ ] Baseline CI, tests, static checks, and security scan plan are defined.
- [ ] AI Context Policy and Security Policy are approved.
- [ ] One internal team has run a full Story through the Superpowers workflow.
- [ ] Supplier delivery is accepted by artifacts and test evidence.
- [ ] Weekly review captures quality gate failures, AI failure cases, and template improvements.
