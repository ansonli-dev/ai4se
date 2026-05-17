# Testing Strategy For AI-Assisted SDD

Chinese version: [../zh/knowledge/05-测试策略.md](../zh/knowledge/05-测试策略.md)

## Purpose

This article summarizes important testing ideas from Martin Fowler's testing guide and related articles, then adapts them for AI-assisted development, SDD, Superpowers, and lightweight Harness Engineering.

The central point is simple:

> AI can generate code faster than teams can safely understand it. Testing must become the team's executable understanding of the system, not just a post-coding safety net.

## Key Ideas From Martin Fowler's Testing Materials

Martin Fowler's testing guide collects articles on self-testing code, test-driven development, the test pyramid, microservice testing, test doubles, non-deterministic tests, coverage, exploratory testing, and production testing.

Several ideas are especially relevant for AI-assisted development.

## 1. Self-Testing Code Is The Foundation

Self-testing code means the codebase can check its own behavior through automated tests.

For an AI-assisted team, this matters because AI-generated code can look plausible while being wrong. A self-testing codebase gives the team a fast feedback loop:

- Does the new behavior work?
- Did existing behavior break?
- Can the team change design without fear?
- Can reviewers trust evidence instead of prose summaries?

Testing is not only a QA activity. It is part of engineering design, review, and delivery.

## 2. The Test Pyramid Is A Heuristic, Not A Law

The test pyramid says teams usually need many focused, fast tests and fewer broad, slow, brittle tests.

For this project, the practical interpretation is:

- Put most business rule checks in unit or component tests.
- Put service collaboration in contract and integration tests.
- Put critical user journeys in a small number of end-to-end tests.
- Avoid duplicating the same assertion at every layer.

The pyramid is a cost and feedback model, not a strict shape. If a broader test is fast, reliable, and cheap to maintain, it can be valuable. If a unit test is tightly coupled to implementation details and fails on every refactor, it is not valuable.

## 3. Acceptance Tests Should Prove Features, Not Replace All Lower-Level Tests

Acceptance tests confirm whether a feature works from the user's or business perspective.

They should be tied to SDD acceptance criteria, but they should not be the only automated tests. If an acceptance test exposes a bug, add a more focused regression test before fixing the bug so the defect stays fixed at the right level.

## 4. Contract Tests Matter For Service Boundaries

In service-oriented and microservice systems, many failures happen at boundaries:

- API shape mismatch.
- Response field meaning mismatch.
- Event schema drift.
- Consumer expectation not captured by provider tests.
- Backward compatibility break.

Contract tests reduce this risk by making provider and consumer expectations executable.

For large-scale enterprise systems, contract tests are important for:

- Core business services.
- Workflow and approval services.
- Inventory or resource services.
- Billing, fee, or settlement services.
- Notification services.
- External enterprise integrations.

## 5. Test Doubles Are Useful, But Dangerous When Overused

Mocks, stubs, fakes, and other test doubles help isolate behavior and make tests faster.

But overuse can create tests that only prove the mock was called, not that the system works. AI-generated tests are especially prone to this failure mode because they often mock too much.

Use test doubles when they reduce external noise. Avoid them when they hide important behavior.

## 6. Non-Deterministic Tests Must Be Treated As Defects

A flaky test is not harmless. It teaches the team to ignore red builds.

Common causes:

- Shared state.
- Time-dependent logic.
- Asynchronous behavior.
- External services.
- Resource leaks.
- Race conditions.

Policy:

- Quarantine flaky tests so they do not hide real regressions.
- Create a fix ticket immediately.
- Do not let quarantined tests become permanent.
- Record the cause in weekly quality review.

## 7. Coverage Is A Signal, Not A Goal

Coverage helps identify untested areas, but high coverage does not prove good tests.

For AI-assisted development, this is critical. AI can generate high-coverage tests that assert shallow behavior, mirror implementation details, or miss the real business rule.

Use coverage to ask questions:

- Which important branches are untested?
- Which business rules lack regression tests?
- Which error paths and permissions are uncovered?

Do not use coverage as the only quality measure.

## 8. Test Code Is Production Engineering Work

Test code must be clean, readable, and maintainable.

Good tests:

- Have clear names.
- Follow Arrange / Act / Assert or Given / When / Then.
- Assert behavior, not implementation noise.
- Use realistic data.
- Avoid unnecessary mocking.
- Are deterministic.
- Fail with useful messages.

Bad tests:

- Only check that mocks were called.
- Duplicate implementation logic.
- Depend on execution order.
- Rely on real time, remote services, or random data without control.
- Assert too much in one test.

## Testing Strategy For AI-Assisted SDD

AI changes the economics of development: generating code and tests becomes cheap, but validating correctness becomes the bottleneck.

Therefore, our testing strategy emphasizes:

- Tests as executable acceptance criteria.
- Tests as guardrails for AI output.
- Tests as review evidence.
- Tests as failure attribution data.
- Tests as regression protection for fast iteration.

## Required Test Layers

### Unit Tests

Purpose:

- Verify business rules and small units of behavior.
- Provide fast feedback during TDD.

AI-SDD rule:

- For every behavior change, add or update focused unit tests unless the behavior can only be verified at a higher level.

Review focus:

- Does the test assert business behavior?
- Does it fail if the rule is wrong?
- Is it independent and deterministic?

### Component Or Module Tests

Purpose:

- Verify a module with realistic collaborators where useful.
- Catch wiring and interaction issues without full system cost.

AI-SDD rule:

- Use when a unit test would over-mock important logic.

Review focus:

- Does the test cover meaningful module behavior?
- Does it avoid unnecessary infrastructure?

### Contract Tests

Purpose:

- Verify API, event, and integration expectations across service boundaries.

AI-SDD rule:

- Required when a service API, event schema, or consumer expectation changes.

Review focus:

- Are both request and response expectations captured?
- Are backward compatibility risks tested?
- Are error responses covered?

### Integration Tests

Purpose:

- Verify real integration with databases, message brokers, file systems, or external service adapters.

AI-SDD rule:

- Required when persistence, transaction behavior, external adapters, or cross-service flows change.

Review focus:

- Is the integrated dependency real or sufficiently realistic?
- Is the test deterministic?
- Is test data isolated?

### End-To-End And Smoke Tests

Purpose:

- Verify the most important user journeys and deployment health.

AI-SDD rule:

- Keep E2E tests few, stable, and focused on critical paths.
- Do not use E2E tests as the only proof of business rules.

Review focus:

- Is this journey truly critical?
- Is the test stable and maintainable?
- Can failures be diagnosed quickly?

### Exploratory Testing

Purpose:

- Discover unknown risks that scripted tests miss.

AI-SDD rule:

- Use exploratory testing for new workflows, ambiguous UI, business-heavy flows, or risky integrations.
- Feed discovered defects back into automated regression tests.

Review focus:

- Were findings converted into actionable defects or regression tests?

## AI-Specific Testing Risks

### Risk 1: AI Generates Tests That Only Prove Its Own Implementation

Symptoms:

- Tests assert internal helper calls.
- Tests mirror implementation logic.
- Tests pass even if the business rule is wrong.

Mitigation:

- Write tests from acceptance criteria before implementation when practical.
- Review tests before trusting them.
- Ask whether the test would fail for a plausible wrong implementation.

### Risk 2: AI Over-Mocks

Symptoms:

- Every collaborator is mocked.
- No real business path is exercised.
- Refactoring breaks tests without behavior changes.

Mitigation:

- Prefer real domain objects.
- Use fakes for expensive boundaries.
- Add component or integration tests when mocks hide important behavior.

### Risk 3: AI Misses Negative And Boundary Cases

Symptoms:

- Only happy paths are tested.
- Permission failures are not tested.
- Empty, duplicate, expired, invalid, concurrent, or partial-failure cases are missing.

Mitigation:

- Require boundary and failure cases in Test Spec.
- Use review checklist to challenge missing paths.
- Add regression tests for every escaped defect.

### Risk 4: AI Creates Brittle Snapshot Or UI Tests

Symptoms:

- Tests fail on harmless layout changes.
- Large snapshots hide meaningful changes.
- UI tests duplicate lower-level assertions.

Mitigation:

- Assert user-visible behavior, not incidental structure.
- Keep UI tests focused on critical journeys.
- Push business logic tests down to lower layers.

### Risk 5: AI Produces Flaky Tests

Symptoms:

- Tests depend on real time, random data, external services, or async timing.

Mitigation:

- Control time.
- Seed randomness.
- Isolate test data.
- Replace remote services with test doubles or contract tests.
- Quarantine and fix flaky tests quickly.

## Test Requirements By Story Type

| Story Type | Required Tests | Notes |
| --- | --- | --- |
| Business rule change | Unit tests, regression tests when fixing bugs | Start from acceptance criteria |
| API change | Unit tests, OpenAPI update, contract tests | Include error responses and compatibility |
| Event change | Event schema update, producer/consumer tests | Include versioning and optional fields |
| Database change | Migration review/test, integration test when needed | Include rollback or recovery notes |
| Permission change | Permission tests, audit log validation | Include allowed and denied cases |
| Cross-service flow | Contract tests, integration tests, targeted E2E | Avoid relying only on UI E2E |
| UI workflow | Component/UI tests, limited E2E, exploratory testing | Assert behavior and accessibility |
| Production defect | Regression test at the narrowest useful level | Add before or with the fix |

## Test Design Checklist For Developers

Before implementation:

- [ ] Acceptance criteria are testable.
- [ ] Test layer is selected intentionally.
- [ ] Boundary and failure cases are identified.
- [ ] Required contract or schema tests are identified.
- [ ] Existing regression tests are located.

During implementation:

- [ ] Write tests before or alongside code.
- [ ] Confirm new tests fail for the expected reason when doing TDD.
- [ ] Avoid tests that only mirror implementation details.
- [ ] Avoid unnecessary mocking.
- [ ] Keep test data isolated and deterministic.

Before merge:

- [ ] Unit tests pass.
- [ ] Contract tests pass when APIs or events change.
- [ ] Integration tests pass when integrations change.
- [ ] E2E or smoke tests pass for critical flows.
- [ ] Flaky tests are not ignored.
- [ ] Coverage gaps in important behavior are explained.
- [ ] Test evidence is linked in the merge request.

## Test Review Checklist For AI-Generated Tests

Reviewers should challenge AI-generated tests:

- Would this test fail if the implementation used the wrong business rule?
- Does it assert observable behavior?
- Does it cover negative cases?
- Does it cover boundary cases?
- Does it test permissions and audit behavior when relevant?
- Does it avoid excessive mocking?
- Does it avoid duplicating implementation logic?
- Is the test deterministic?
- Is the test readable enough for future maintainers?

## How Testing Fits Superpowers

In the internal Superpowers workflow:

- `brainstorming` checks whether acceptance criteria are testable.
- `writing-plans` identifies test files, test layers, and verification commands.
- `test-driven-development` creates a red-green-refactor loop for behavior changes.
- `subagent-driven-development` should require spec compliance review before code quality review.
- `requesting-code-review` should include test quality review, not only production code review.
- `verification-before-completion` requires fresh test evidence before completion is claimed.

## How Testing Fits Harness Engineering

Harness Engineering makes testing part of the controlled AI runtime:

- The context policy tells the agent which specs, tests, contracts, and code entry points to use.
- The verification policy tells the agent which checks must run.
- The execution report records which tests ran, what failed, what was fixed, and what remains risky.
- Failure attribution separates bad specs, bad context, environment failure, agent error, and test weakness.

## Quality Gate Policy

The merge gate should block when:

- Build fails.
- Required tests fail.
- Required contract tests are missing.
- Critical security scans fail.
- Flaky tests are ignored instead of quarantined and tracked.
- AI-generated tests are shallow and no meaningful behavior evidence exists.
- A production defect fix lacks a regression test unless an explicit exception is approved.

## Practical Rollout

Phase 1:

- Add the updated Test Spec template.
- Require test evidence in merge requests.
- Require regression tests for defect fixes.
- Require contract tests for API or event changes.

Phase 2:

- Add flaky test quarantine policy.
- Track escaped defects by missing test layer.
- Review AI-generated tests in weekly quality review.

Phase 3:

- Add automated test impact selection.
- Store execution reports as merge request artifacts.
- Use failure attribution to improve specs, prompts, harness policies, and test suites.

## Sources

- Martin Fowler Testing Guide: https://martinfowler.com/testing/
- Martin Fowler, Test Pyramid: https://martinfowler.com/bliki/TestPyramid.html
- Ham Vocke, The Practical Test Pyramid: https://martinfowler.com/articles/practical-test-pyramid.html
- Martin Fowler, Eradicating Non-Determinism in Tests: https://martinfowler.com/articles/nonDeterminism.html
- Martin Fowler, Test Coverage: https://martinfowler.com/bliki/TestCoverage.html
- Martin Fowler, Testing Strategies in a Microservice Architecture: https://martinfowler.com/articles/microservice-testing/
