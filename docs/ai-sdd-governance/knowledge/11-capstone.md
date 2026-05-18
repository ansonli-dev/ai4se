# Capstone: From Concepts To Delivery

Chinese version: [../zh/knowledge/11-概念到交付.md](../zh/knowledge/11-概念到交付.md)

## Purpose

The previous ten docs explained the AI-SDD governance model one piece at a time. This doc puts them in motion by walking a single, realistic Story through the entire stack — Operating Model, SDD, Execution Stack, Quality Gates, Testing, Toolchain, Agent Tools, Harness, Metrics — and shows where each concept fires.

If after reading this you cannot see how every doc you just read maps to one or more steps below, that doc is the one to re-read.

After the walkthrough, this doc hands the reader off to the Practice path, where the same concepts are operationalised by role and stage.

## The Story Used In This Walkthrough

**Story-1287: Restrict the "approve refund" API to users with the `refund.approver` permission.**

Why this Story is a good test case:

- It is a single bounded change, not a project.
- It touches an existing API (contracts), a permission model (security), an audit log (observability), and a database column read (data). That is wide enough to engage most of the layers without being overwhelming.
- It has an obvious wrong answer ("just add an `if` somewhere") that the governance model is designed to prevent.

This Story is hypothetical. None of the team names, IDs, or thresholds below are claims about real artifacts — they illustrate where the model fires.

## Stage 0: The Story Arrives In The Backlog

The product owner files Story-1287 after a customer-support escalation: a junior agent approved a refund they should not have authority to approve.

**What the model says happens:**

- [Operating Model](04-operating-model.md): the Story lands in the backlog of the Payments team, which owns the refund module. The Payments tech lead is the module owner; the security lead is consulted because permission semantics change.
- [Glossary](12-glossary.md): "Story" and "Owner Review" are the relevant terms.

**What would have gone wrong without this layer:**

The Story would have been assigned to whichever developer picked it up, with no clear owner approval downstream. Reviewer accountability would be ambiguous when the change later affected another module that consumed the refund API.

## Stage 1: Making The Story Ready (SDD, Layer 1)

The product owner drafts an SDD Story Spec from the [template](../../../templates/sdd-story-spec.md). Before the Story can be picked up:

**What the model says happens:**

- [SDD Methodology](02-sdd-methodology.md) — Definition of Ready: business goal, user role, preconditions, main flow, alternative and exception flows, Given/When/Then acceptance criteria, API contract impact, non-functional requirements for permission and audit, AI Context Boundary.
- The team writes acceptance criteria explicitly:
  - *Given* a user without the `refund.approver` permission, *when* they POST `/refunds/{id}/approve`, *then* the response is HTTP 403 and the attempt is written to the audit log.
  - *Given* a user with the permission, *when* they POST, *then* the existing behavior is preserved.
- The OpenAPI for `/refunds/{id}/approve` is reviewed: a new 403 response shape is added.
- The error code registry gets a new entry for `REFUND_APPROVE_FORBIDDEN`.
- The AI Context Boundary lists exactly which files, contracts, and tests the agent may see: the refund controller, the existing permission middleware, the audit logger, the OpenAPI, and the existing refund tests. Production logs and customer data are explicitly forbidden.

**What would have gone wrong without this layer:**

A free-form prompt ("add a permission check to the refund approve endpoint") would have left the AI to invent the permission name (`refund_approve`? `approve-refund`? `RefundApprover`?), the error response shape, and whether to log denied attempts. Reviewers would have to read the code to discover what behavior was implemented.

## Stage 2: Picking The Tier (Layer 2 setup)

The developer reads the Story and consults [Superpowers Adoption](../practice/03-superpowers-adoption.md):

**What the model says happens:**

- This Story changes permission semantics and an API contract → **Tier C**.
- Tier C means: full SDD Story Spec, Technical Spec, ADR if architecture is affected, full test coverage including permission tests, owner approval, full quality gate, agent execution report attached to MR.
- The developer skims [Reading Guide](00-reading-guide.md) and confirms the four-layer stack is the right mental frame; this is not a "just add an if" Story.

**What would have gone wrong without this layer:**

Without an explicit tier decision, the developer might apply Tier A weight ("small change") and skip the Technical Spec, the security review, and the audit-log test. The Story would still merge, and the gap would only become visible when the second junior agent finds another loophole.

## Stage 3: Execution (Superpowers, Layer 2)

The developer engages Superpowers skills in sequence — this is the [Execution Stack](03-execution-stack.md)'s layer 2 in action.

**What the model says happens:**

- `brainstorming` — confirm acceptance criteria are testable, confirm the AI Context Boundary is complete, confirm there are no implicit assumptions about who calls this API today.
- `writing-plans` — produce an implementation plan: which files to edit, which tests to write first, which OpenAPI section to update, which audit-log assertion to add, what to verify at the end.
- `test-driven-development` — write the failing permission test first. Confirm it fails for the right reason (the endpoint does not yet check permissions). Then write the failing audit-log test. Then implement.
- `subagent-driven-development` (optional for Tier C) — a separate agent context reviews the spec compliance before the code-quality review.
- `requesting-code-review` — the developer requests review with a clear summary of what changed, what tests were added, and what was deliberately not changed.
- `verification-before-completion` — no completion claim until tests, static analysis, and the contract test pass.

**What would have gone wrong without this layer:**

The developer would have asked the agent to "implement the permission check," accepted the first plausible diff, and discovered during PR review that the agent had also "helpfully" refactored the audit logger in a way that broke the audit format consumed by the compliance dashboard.

## Stage 4: Controlled Runtime (Harness, Layer 3)

The agent executes inside the harness defined in [Harness Engineering](09-harness-engineering.md) and the [`/ai/`](../../../ai/) and [`/ai-harness/`](../../../ai-harness/) policies.

**What the model says happens:**

- Context (per [`ai/context-policy.md`](../../../ai/context-policy.md) and [`ai-harness/policies/context-policy.yaml`](../../../ai-harness/policies/context-policy.yaml)): only the approved files in the AI Context Boundary are loaded; production logs are blocked.
- Tools (per [`ai/allowed-tools.md`](../../../ai/allowed-tools.md) and [`ai-harness/policies/permissions.yaml`](../../../ai-harness/policies/permissions.yaml)): the agent may read files, edit files inside `src/refunds/`, run unit tests, run the contract test. It may not run database migrations, change CI configuration, or modify files outside scope without human confirmation.
- Verification (per [`ai-harness/policies/verification-policy.yaml`](../../../ai-harness/policies/verification-policy.yaml)): build, unit tests, static analysis, secret scan must pass; contract tests must pass because the API changed; permission tests and audit log validation are required because permissions changed.
- The developer runs `ai-harness/scripts/check-story-ready.sh` against the Story spec at the start, and `ai-harness/scripts/generate-execution-report.sh` at the end. The execution report lists context used, files changed, tests added, verification run, remaining risks.

**What would have gone wrong without this layer:**

The agent would have read whatever was easy to grep, run whatever commands seemed useful, and completed when its self-evaluation said "done." Failure attribution after a defect would be the unsatisfying "the agent didn't work."

## Stage 5: Tests (Cross-Cutting)

Test choices are guided by [Testing Strategy](06-testing-strategy.md) and the [Testing Policy](../../../ai/testing-policy.md).

**What the model says happens:**

- Unit test for the permission check (asserts business behavior, fails for a plausible wrong implementation — e.g. checking the wrong permission name).
- Permission test covering the denied case and the allowed case.
- Audit log test asserting the denied attempt is logged with the user ID and timestamp.
- Contract test for the new 403 response shape.
- No new E2E test — the existing refund-approval E2E already exercises the happy path; the boundary cases belong in lower layers.
- The reviewer checks AI-generated tests against the review checklist in doc 06 — would the test fail for a plausible wrong implementation? Are mocks hiding real behavior?

**What would have gone wrong without this layer:**

The AI would have generated a single high-coverage test that mocked the permission service and asserted it was called. The test would pass even if the call was made with the wrong permission name.

## Stage 6: The Merge Gate (Layer 4)

The MR opens using the [AI-SDD MR template](../../../.gitlab/merge_request_templates/ai-sdd.md). It runs through [Quality Gates](05-quality-gates.md) and the [CI Gate Policy](../../../quality-gates/ci-gate-policy.md).

**What the model says happens:**

- Pipeline: validate metadata → build → unit test → static analysis → contract test → integration test → security scan → package.
- The MR is rejected automatically if: the build fails, unit tests fail, the contract test fails because the OpenAPI was not updated to match, the secret scan finds anything, SonarQube Quality Gate fails, the AI usage declaration is missing.
- The MR cannot merge without Owner Review from the Payments tech lead (CODEOWNERS for `src/refunds/`) plus security review (triggered by the permission change per [`ai/security-policy.md`](../../../ai/security-policy.md)).
- The reviewer works through the [Review Checklist](../../../ai/review-checklist.md): no invented business rules, permission check is correct, audit log captures the right fields, tests verify observable behavior, no sensitive data exposed.

**What would have gone wrong without this layer:**

A merged refund-approval change with no owner sign-off and no security review — exactly the class of change that justifies having the gate in the first place.

## Stage 7: Acceptance And Feedback (Metrics)

The Story moves through acceptance using the [story-acceptance-record](../../../templates/story-acceptance-record.md). [Metrics](10-metrics.md) capture what happened.

**What the model says happens:**

- Story Cycle Time and Spec-Ready-to-MR-Ready Time are recorded for the iteration trend.
- MR First-Pass Rate increases because the gate-blocking work was caught earlier.
- AI Code Adoption Rate is recorded — how much of the AI-proposed code survived review.
- If a defect later escapes, [Defect Attribution](../../../templates/defect-attribution.md) walks the [Execution Stack](03-execution-stack.md) bottom-up: did CI miss it? Did the harness allow bad context? Did Superpowers discipline lapse? Did the spec have a gap?
- The Weekly AI-SDD Review takes the attribution and feeds improvements into specs, prompts, harness policies, and test suites.

**What would have gone wrong without this layer:**

Each Story would be done when it merged. The team would have no data to tell whether the model was actually helping, no signal that one stage of the stack was leaking, and no record of why.

## What This Walkthrough Showed

| Doc | Stage Where It Fired |
| --- | --- |
| 01 AI-SDD Overview | Stage 0 — framed why this Story is governed at all |
| 02 SDD Methodology | Stage 1 — Definition of Ready, acceptance criteria, context boundary |
| 03 Execution Stack | Stages 3-6 — the layer model that organises every later stage |
| 04 Operating Model | Stage 0 — ownership, security consultation |
| 05 Quality Gates | Stage 6 — gate pipeline, Owner Review, exception rules |
| 06 Testing Strategy | Stage 5 — layer choice, AI-specific test risks, review checklist |
| 07 Toolchain | Stages 3-7 — Jira, GitLab, SonarQube, CI runners that host the work |
| 08 Agent Tools | Stages 3-4 — which agent surface, which skills, which tool permissions |
| 09 Harness Engineering | Stage 4 — context, permissions, verification, execution report |
| 10 Metrics | Stage 7 — what was measured, how feedback flows back |

If any row above feels unclear, doc on the left is the one to revisit before moving to Practice.

## Where Knowledge Hands Off To Practice

[Practice](../practice/) takes the same concepts and operationalises them by role and stage. Natural next reads:

1. [Team AI SDLC](../practice/01-team-ai-sdlc.md) — the same four layers wired into a team's actual SDLC.
2. [Implementation Playbook](../practice/02-implementation-playbook.md) — Week 0, kickoff, review cadence, minimum repo setup.
3. [Superpowers Adoption](../practice/03-superpowers-adoption.md) — Tier A/B/C rules and adoption boundaries.
4. [Developer Guide](../practice/04-developer-guide.md) — what a developer does day-to-day after a Story is ready.
5. [AI Context Artifact Map](../practice/05-ai-context-artifact-map.md) — what artifacts each stage must produce so the next AI-assisted stage can proceed safely.
6. [Priorities And Roadmap](../practice/06-priorities-and-roadmap.md) — what to do first when adopting this model.
7. [Rollout And Acceptance](../practice/07-rollout-and-acceptance.md) — the 12-week rollout model and acceptance scenarios.

## Key Takeaways

- One Story exercises the entire stack — the docs are not parallel options but composing layers.
- Each layer prevents a specific failure mode; skipping a layer turns it into a latent defect.
- The Defect Attribution template and the bottom-up walk of the Execution Stack make failures into improvement input, not blame.
- Knowledge teaches the model; Practice operationalises it by role, stage, and rollout.

## Next

- [Glossary](12-glossary.md) — reference for any term you want to nail down — and then jump into the [Practice path](../practice/).
