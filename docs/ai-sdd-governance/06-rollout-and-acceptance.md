# Rollout and Acceptance

## Phase 1: Pilot, Weeks 1-4

Scope:

- Select one medium-complexity business domain, such as account management, workflow processing, approval flows, or service integration.
- Include one internal team for Superpowers workflow adoption.
- Include outsourced work only as deliverable-based acceptance if supplier output is part of the pilot domain.

Deliverables:

- SDD Story Spec template.
- Technical Spec template.
- Test Spec template.
- Prompt Card template.
- Merge request template.
- Quality gate checklist.
- Initial metric dashboard definition.
- Superpowers lightweight, standard, and high-risk workflow definitions.

Goal:

- Validate whether the process works.
- Do not optimize for full productivity gain yet.

## Phase 2: Expansion, Weeks 5-8

Scope:

- Expand to all three teams.
- Include more service modules and interface changes.

Deliverables:

- Approved knowledge base.
- API contract repository.
- Test asset repository.
- SonarQube, SCA, Secret Scan, and artifact repository integration.
- Weekly AI-SDD quality review.

Goal:

- Make SDD and Superpowers-based AI governance the default internal delivery workflow.

## Phase 3: Scale, Weeks 9-12

Scope:

- Establish developer portal and module ownership map.
- Include outsourced deliverable quality in supplier management.

Deliverables:

- Service catalog.
- Module Owner registry.
- Dependency map.
- AI usage dashboard.
- Quality and consistency dashboard.
- Supplier quality scorecard.

Goal:

- Move from process adoption to measurable delivery system.

## Pilot Acceptance Scenarios

Same Acceptance Standard, Different Delivery Modes:

- An internal team uses the Superpowers workflow, while outsourced work is assessed only by deliverables.
- Check whether both outputs satisfy the same SDD Spec, API contract, test evidence, and quality gate expectations.

AI Merge Request Audit:

- Randomly sample 10 AI-assisted merge requests.
- Confirm each has requirement link, SDD Spec, AI usage declaration, test evidence, and human review.

Core API Change:

- Change one core interface.
- Verify OpenAPI, Mock, tests, and caller impact analysis are updated.

Low-Quality AI Output:

- Submit a deliberately incomplete AI-generated implementation in a controlled branch.
- Verify quality gates block the merge.

New Member Enablement:

- Ask one new hire to complete a low-risk Story using the lightweight Superpowers flow.
- Verify the new hire can complete the internal workflow with limited coaching.

Defect Traceability:

- Pick one defect and trace it back to requirement, SDD Spec, code, test, review, and release.

## Program-Level Success Criteria

- Three teams use the same SDD artifact templates.
- Internal teams use the agreed Superpowers workflow tiers.
- 100% of core modules have owners.
- 100% of new service APIs have OpenAPI contracts.
- 100% of merge requests pass automated quality gates.
- 100% of AI-assisted code has human review and audit records.
- Pilot cycle time improves without increasing defect escape rate.
