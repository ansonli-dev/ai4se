# SDD and Superpowers Developer Guide

## Purpose

This guide explains what Spec-Driven Development means for this project, which SDD-related frameworks are relevant, what Superpowers is, why we recommend it for internal teams, and how developers should use it after receiving a Story card.

This guide applies to internal development teams. Outsourced teams are not required to use Superpowers unless explicitly agreed in the supplier contract; outsourced work is accepted by deliverables, test evidence, quality gates, and acceptance results.

## What Is SDD

SDD means Spec-Driven Development.

In AI-assisted development, SDD means the team does not start from a free-form prompt such as "implement this feature." The team first describes the intended behavior, constraints, interfaces, acceptance criteria, and risks in structured specifications. The AI agent then works from those specifications.

SDD shifts the center of development from code-first to spec-first:

- The Story card defines what business outcome is needed.
- The spec defines what behavior must exist and how it will be accepted.
- The technical design defines how the implementation should fit the system.
- Tasks define the implementation steps.
- Tests and quality gates prove that the implementation matches the spec.

The goal is not to create documents for their own sake. The goal is to give people and AI agents enough shared context to reduce misunderstanding, uncontrolled invention, inconsistent outputs, and unreviewable code.

## SDD Frameworks and Related Methods

The current ecosystem has several relevant approaches.

GitHub Spec Kit:

- A toolkit for SDD that places specifications at the center of AI-assisted software development.
- Its core flow is Spec -> Plan -> Tasks -> Implement.
- It is useful when a team wants a complete default SDD structure and agent-neutral commands.
- Official docs: https://github.github.com/spec-kit/index.html

Kiro Specs:

- A spec workflow in Kiro that turns ideas into structured artifacts.
- Its core files are requirements, design, and tasks.
- It is useful when a team uses Kiro as the development environment and wants requirements, design, tasks, and execution in one tool.
- Official docs: https://kiro.dev/docs/specs/

BMAD:

- BMAD stands for Breakthrough Method of Agile AI-driven Development.
- It is an AI-assisted agile framework with stronger product, architecture, and review roles.
- It is useful as an escalation path for complex, ambiguous, cross-domain, or high-risk work.
- In this project, BMAD is not the default developer workflow. It is considered before Story cards are handed to development when the work is too ambiguous or too broad.
- Reference: https://bmad.fr/en/bmad-method

Superpowers:

- A composable skills framework and software development methodology for coding agents.
- It focuses on execution discipline: brainstorming, planning, TDD, debugging, review, subagent-driven development, and verification.
- In this project, Superpowers is the default internal developer workflow after a Story card is ready.
- Official repository: https://github.com/obra/superpowers

In-house SDD templates:

- This governance kit also defines local templates for SDD Story Specs, Technical Specs, Test Specs, Prompt Cards, ADRs, data dictionaries, API contracts, event schemas, and quality gates.
- These templates are the project-level contract. Tools and frameworks must support them, not replace them without approval.

## Why Superpowers Is Recommended

We recommend Superpowers for internal teams because most development problems after a Story card is assigned are execution problems:

- The developer starts coding before clarifying unclear requirements.
- The AI agent invents fields, APIs, edge cases, or business rules.
- The implementation plan is implicit and hard to review.
- Tests are written after code and miss the real behavior.
- Review happens too late.
- Completion is claimed before verification.

Superpowers directly targets these failure modes.

Its value is not that it replaces SDD. Its value is that it turns a ready Story card into a disciplined engineering workflow:

- `brainstorming` checks whether the Story is actually ready for development.
- `writing-plans` converts the Story into implementation steps.
- `test-driven-development` encourages behavior-first tests.
- `subagent-driven-development` enables fresh-context implementation and two-stage review for separable tasks.
- `requesting-code-review` creates focused review before problems cascade.
- `receiving-code-review` prevents blind acceptance of review feedback.
- `systematic-debugging` forces root cause analysis instead of guesswork.
- `verification-before-completion` prevents unverified completion claims.

## How To Use Superpowers After Receiving A Story Card

The developer starts from the Story card. The Story card should already contain business goal, user role, acceptance criteria, affected module, and known constraints.

### Step 1: Do Story Intake

Read the Story card and linked materials.

Check:

- Is the business goal clear?
- Are acceptance criteria testable?
- Are permissions, audit, data, and exception flows clear?
- Are affected APIs, events, database fields, or integrations identified?
- Is the module owner known?
- Is this Tier A, Tier B, or Tier C work according to `08-superpowers-adoption.md`?

If the Story is unclear, do not start implementation. Return it for clarification or use `brainstorming` to produce specific questions.

Output:

- Intake notes in the Story or merge request.
- List of open questions, if any.
- Workflow tier decision: Tier A, Tier B, or Tier C.

### Step 2: Use Brainstorming As DoR Check

For development teams, `brainstorming` is not a full product discovery process. It is a Definition of Ready check.

Use it to confirm:

- What behavior will be built.
- What is out of scope.
- Which acceptance criteria matter.
- Which interfaces, data, permissions, and error cases are involved.
- Whether the Story needs a Technical Spec or ADR.

For Tier A work, this can be a short note.

For Tier B and Tier C work, capture the result in the SDD Story Spec or Technical Spec.

Output:

- Updated SDD Story Spec or Story notes.
- Confirmed scope.
- Confirmed non-goals.
- Decision on whether Technical Spec, ADR, API contract, or data dictionary update is required.

### Step 3: Write The Implementation Plan

Use `writing-plans` for Tier B and Tier C work.

The plan should identify:

- Files or modules likely to change.
- Tests to add or update.
- API, event, data, or error-code artifacts to update.
- Implementation steps.
- Verification commands.
- Review checkpoints.

For Tier A work, a short checklist in the merge request is enough.

Output:

- Implementation plan for Tier B and Tier C.
- Lightweight checklist for Tier A.

### Step 4: Develop With Test Discipline

Use `test-driven-development` for behavior changes whenever practical.

Expected pattern:

1. Write a failing test for one behavior.
2. Run the test and confirm it fails for the expected reason.
3. Implement the smallest change that makes it pass.
4. Run the test and confirm it passes.
5. Refactor only after tests pass.
6. Repeat for the next behavior.

If TDD is not practical, document why and still provide equivalent test evidence.

Output:

- Unit tests.
- Contract tests when APIs or events change.
- Integration tests when cross-service behavior changes.
- Updated Test Spec.

### Step 5: Update Required Artifacts

Update artifacts as the implementation changes.

Required when applicable:

- SDD Story Spec.
- Technical Spec.
- Test Spec.
- OpenAPI contract.
- Event schema.
- Data dictionary.
- Error code registry.
- ADR.
- Deployment notes.
- Rollback notes.

The implementation is not complete if the code changed but the relevant contract or documentation did not.

Output:

- Updated artifacts committed with the code or linked in the merge request.

### Step 6: Request Review

Use review in layers.

For normal changes:

- Human reviewer checks business behavior, code quality, and tests.

For Tier C or separable multi-task work:

- Use spec compliance review first.
- Use code quality review second.

Spec compliance review asks:

- Did we build what was requested?
- Did we miss anything?
- Did we add anything not requested?
- Did the implementation misunderstand the spec?

Code quality review asks:

- Is the implementation maintainable?
- Are boundaries and responsibilities clean?
- Are edge cases handled?
- Are tests meaningful?
- Are security, performance, and production risks handled?

Output:

- Review comments resolved.
- Owner approval when required.

### Step 7: Verify Before Completion

Use `verification-before-completion` before saying the Story is done.

Run the relevant verification commands:

- Build or compilation.
- Unit tests.
- Contract tests.
- Integration tests.
- Static analysis.
- Security scans.
- Manual acceptance checks, if required.

Do not claim completion from confidence. Claim completion only from fresh evidence.

Output:

- Verification commands and results in the merge request.
- Test report or CI link.

### Step 8: Complete The Merge Request

Use the AI-SDD merge request template.

The merge request must include:

- Requirement ID and Story ID.
- Linked SDD Story Spec.
- Linked Technical Spec, if required.
- Linked Test Spec.
- AI usage declaration for internal AI-assisted work.
- Test evidence.
- Risk assessment.
- Rollback plan.
- Owner approval for core modules.

Output:

- Merge request ready for review and merge.

## Required Artifacts By Tier

| Artifact | Tier A Lightweight | Tier B Standard | Tier C High Risk |
| --- | --- | --- | --- |
| Story card | Required | Required | Required |
| SDD Story Spec | Short note acceptable | Required | Required |
| Technical Spec | Optional | Required when technical impact exists | Required |
| Implementation Plan | MR checklist acceptable | Required | Required |
| Test Spec | Optional if tests are simple | Required | Required |
| OpenAPI/Event Schema | Required if changed | Required if changed | Required if changed |
| Data Dictionary | Required if changed | Required if changed | Required if changed |
| Error Code Registry | Required if changed | Required if changed | Required if changed |
| ADR | Optional | Required for architecture decisions | Required for architecture or major tradeoffs |
| AI Usage Declaration | Required if AI used | Required if AI used | Required if AI used |
| Owner Approval | Normal review | Required for owned modules | Required |
| Verification Evidence | Required | Required | Required |

## Required Steps By Tier

Tier A:

1. Read Story card.
2. Confirm acceptance criteria.
3. Implement.
4. Run focused verification.
5. Complete merge request.
6. Get normal review.

Tier B:

1. Run Superpowers `brainstorming` as a DoR check.
2. Write or update SDD Story Spec.
3. Use `writing-plans`.
4. Use TDD where practical.
5. Update contracts and test artifacts.
6. Request review.
7. Run quality gates.
8. Verify before completion.

Tier C:

1. Run full DoR check.
2. Confirm Technical Spec and ADR needs.
3. Use `writing-plans`.
4. Prefer TDD.
5. Use subagent-driven development when tasks are separable.
6. Perform spec compliance review.
7. Perform code quality review.
8. Get module Owner approval.
9. Run full quality gates.
10. Verify before completion.

## When Is A Story Card Complete

A Story card is complete only when all applicable conditions are true:

- Acceptance criteria are implemented.
- No unapproved scope was added.
- Required tests pass.
- Required quality gates pass.
- Required artifacts are updated.
- API, event, data, and error-code changes are documented.
- AI usage is declared for internal AI-assisted work.
- Review comments are resolved.
- Module Owner approval is present when required.
- Rollback or recovery plan is documented for production-impacting changes.
- Verification evidence is linked.
- Product, QA, or business acceptance is recorded when required.

In short: a Story is done when the behavior works, the evidence proves it, the artifacts match it, and the responsible reviewers have accepted it.

## Minimum Developer Checklist

Before starting:

- [ ] Story card is clear enough to implement.
- [ ] Acceptance criteria are testable.
- [ ] Workflow tier is selected.
- [ ] Missing information is clarified.

Before opening merge request:

- [ ] Tests are written or updated.
- [ ] Contracts and documentation are updated.
- [ ] AI usage is documented if AI was used.
- [ ] Risks and rollback are described.

Before marking done:

- [ ] CI quality gates pass.
- [ ] Required reviews are complete.
- [ ] Verification evidence is linked.
- [ ] Acceptance is recorded when required.

## Sources

- GitHub Spec Kit documentation: https://github.github.com/spec-kit/index.html
- Kiro Specs documentation: https://kiro.dev/docs/specs/
- BMAD Method overview: https://bmad.fr/en/bmad-method
- Superpowers repository: https://github.com/obra/superpowers

