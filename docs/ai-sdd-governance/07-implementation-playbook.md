# Implementation Playbook

## Week 0 Preparation

Before the pilot starts, complete these actions:

- Appoint the AI-SDD governance committee.
- Appoint one AI Champion per participating internal team.
- Identify the pilot domain and pilot Stories.
- Confirm module owners for pilot modules.
- Approve the initial SDD, Technical Spec, Test Spec, Prompt Card, and MR templates.
- Approve Superpowers workflow tiers for lightweight, standard, and high-risk changes.
- Configure repository branch protection and merge request approval rules.
- Configure required CI/CD quality gates.
- Confirm which AI tools and context sources are approved.

## Kickoff Agenda

Use this 90-minute agenda for the pilot kickoff:

1. Delivery owner explains goals and boundaries.
2. Architect explains SDD and technical governance.
3. QA lead explains test evidence and quality gates.
4. Security lead explains AI data boundaries and audit rules.
5. AI Champions demonstrate one full internal Story from spec to merge request using Superpowers.
6. Team leads confirm pilot Stories and owners.

## Pilot Story Package

Every pilot Story package contains:

- SDD Story Spec.
- Technical Spec when architecture, API, data, permission, or integration is affected.
- Test Spec.
- API contract or event schema when applicable.
- Prompt Card.
- Merge request template.
- Acceptance checklist.

For outsourced delivery, the required package contains the approved SDD Spec, interface contract, test evidence, deployment notes, rollback notes, and acceptance checklist. It does not require Prompt Cards or Superpowers records.

## Weekly AI-SDD Review Agenda

Use this agenda every week:

1. Review delivery flow metrics.
2. Review quality gate failures.
3. Review AI-generated defects or near misses.
4. Review outsourced deliverable quality when applicable.
5. Review template issues and improvement requests.
6. Confirm actions, owners, and due dates.

## Supplier Review Agenda

Use this agenda monthly for the outsourced team:

- Artifact completeness.
- Acceptance pass rate.
- Defect and rework rate after delivery review.
- Owner review findings.
- Quality gate pass rate.
- Delivery note, rollback note, and change note completeness.
- Improvement actions for the next month.

## Minimum Repository Setup

Recommended files for each application repository:

- `README.md`
- `docs/specs/`
- `docs/adrs/`
- `docs/api/`
- `docs/data-dictionary.md`
- `docs/error-code-registry.md`
- `.gitlab/merge_request_templates/ai-sdd.md`
- `CODEOWNERS`
- CI/CD pipeline definition

## RACI Matrix

| Activity | Delivery Owner | Architect | QA Lead | Security Lead | Team Lead | AI Champion | Module Owner | Outsourced Lead |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Approve governance policy | A | R | C | C | C | C | C | C |
| Approve SDD template | A | R | C | C | C | R | C | C |
| Approve Story Spec | C | C | C | C | A | R | R | R |
| Approve architecture decision | C | A | C | C | R | C | R | C |
| Approve test strategy | C | C | A | C | R | C | C | C |
| Approve security exception | A | C | C | A | C | C | C | C |
| Approve core module change | C | C | C | C | R | C | A | R |
| Review weekly metrics | A | R | R | R | R | R | C | R |

Legend:

- R: Responsible.
- A: Accountable.
- C: Consulted.
