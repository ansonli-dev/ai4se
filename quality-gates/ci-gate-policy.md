# CI Gate Policy

## Pipeline Stages

1. Validate metadata.
2. Build.
3. Unit test.
4. Static analysis.
5. Contract test.
6. Integration test.
7. Security scan.
8. Package and publish artifact.

## Metadata Validation

The pipeline should verify that merge requests include:

- Requirement ID.
- Story ID.
- SDD Spec link.
- AI usage declaration.
- Test evidence.
- Owner approval for core modules.

For outsourced delivery imported into an internal repository, the pipeline should verify delivery evidence and quality results. It should not require internal Prompt Card or Superpowers records unless contractually agreed.

## Recommended Thresholds

These thresholds should be tuned after the pilot.

- Build: must pass.
- Unit tests: must pass.
- New code coverage: 80% minimum, 90% for core domain modules.
- SonarQube Quality Gate: must pass.
- Critical vulnerabilities: zero.
- High vulnerabilities: zero unless approved by exception.
- Secret Scan: zero findings.
- Contract tests: must pass for changed APIs and events.

## Exception Handling

Exceptions require:

- Risk description.
- Business impact.
- Technical impact.
- Expiration date.
- Owner.
- Delivery owner approval.
- Module owner approval.

Exceptions are reviewed weekly until closed.
