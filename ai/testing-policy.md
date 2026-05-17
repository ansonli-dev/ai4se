# AI Testing Policy

## Purpose

AI-assisted code must be verified by tests and quality gates, not by agent confidence.

Tests are executable understanding. They should prove business behavior, protect existing behavior, and give reviewers evidence that AI output is correct.

## Testing Principles

- Prefer fast, focused tests for business rules.
- Use contract tests for API and event boundaries.
- Use integration tests for real infrastructure or cross-service behavior.
- Keep end-to-end tests few, stable, and focused on critical journeys.
- Treat flaky tests as defects.
- Use coverage as a signal, not as proof of quality.
- Review AI-generated tests as carefully as AI-generated production code.

## Required Testing By Change Type

Behavior change:

- Unit tests for the changed behavior.
- Regression test for bug fixes.
- Integration test when behavior crosses module or service boundaries.
- Boundary and failure cases for important business rules.

API change:

- OpenAPI update.
- Contract test.
- Backward compatibility check when existing clients may be affected.

Event change:

- Event schema update.
- Producer and consumer compatibility check.

Data model change:

- Migration test or migration review.
- Rollback or recovery strategy.

Permission or audit change:

- Permission tests.
- Audit log validation.

Production defect:

- Regression test at the narrowest useful level.
- Failure attribution: missing spec, missing test, implementation error, review gap, or environment issue.

## TDD Guidance

For Tier B and Tier C work, prefer test-first development:

1. Write a failing test.
2. Verify it fails for the expected reason.
3. Implement the smallest change.
4. Verify the test passes.
5. Refactor only after tests pass.

## Evidence Rule

Merge requests must record:

- Test commands.
- Test results or CI link.
- Known untested areas.
- Manual verification evidence when applicable.
- Flaky tests quarantined, fixed, or tracked with owner and due date.

## AI-Generated Test Review

Reviewers must check whether AI-generated tests:

- Assert observable behavior.
- Would fail for a plausible wrong implementation.
- Avoid excessive mocking.
- Avoid duplicating implementation logic.
- Cover negative and boundary cases.
- Cover permission, audit, and security behavior when relevant.
- Are deterministic and maintainable.
