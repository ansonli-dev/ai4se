# Quality Gate Checklist

## Required Before Merge

- [ ] Build or compilation passes.
- [ ] Unit tests pass.
- [ ] New code coverage meets project threshold.
- [ ] Contract tests pass when APIs or events change.
- [ ] Integration tests pass for cross-service changes.
- [ ] Regression tests are added for production defects or bug fixes.
- [ ] Boundary and negative cases are covered for important business rules.
- [ ] SonarQube Quality Gate passes.
- [ ] SAST passes without critical findings.
- [ ] SCA passes without unapproved critical dependencies.
- [ ] Secret Scan passes.
- [ ] Database migration check passes when schema changes.
- [ ] SDD Spec, Technical Spec, Test Spec, and API documentation are updated.
- [ ] MR includes AI usage declaration.
- [ ] Module Owner approval is present for core modules.

## Required For AI-Assisted Code

These checks apply to internal AI-assisted work. Outsourced teams are assessed through deliverable evidence unless their contract explicitly requires the internal AI workflow.

- [ ] Prompt Card is referenced.
- [ ] Approved context is listed.
- [ ] Reviewer checked for invented requirements.
- [ ] Reviewer checked business boundary conditions.
- [ ] Reviewer checked permission, audit, and sensitive data handling.
- [ ] Reviewer checked tests are meaningful and not only generated boilerplate.
- [ ] Reviewer checked AI-generated tests would fail for plausible wrong implementations.
- [ ] Reviewer checked test doubles do not hide important behavior.
- [ ] Reviewer checked flaky tests are quarantined and tracked, not ignored.

## Stop-The-Line Conditions

Do not merge when any of these are true:

- Build is broken.
- Critical or high security issue is unresolved.
- Secret leakage is detected.
- Core module has no owner approval.
- AI output cannot be traced to an approved spec.
- Customer or production data was used without approval and masking.
