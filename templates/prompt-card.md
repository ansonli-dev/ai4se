# Prompt Card

## Metadata

- Prompt Card ID:
- Version:
- Owner:
- Approved By:
- Applicable Role:
- Applicable Work Type:

## Purpose

Describe what this prompt is allowed to help with.

## Required Inputs

- SDD Story Spec:
- Technical Spec:
- API Contract:
- Coding Standard:
- Existing tests:

## Prompt Template

```text
You are assisting with a large-scale enterprise software system.

Use only the approved context below.
Do not invent business rules, data fields, APIs, permissions, or error codes.
If information is missing, list questions instead of generating code.

Task:

Approved context:

Required output format:

Review checklist:
```

## Output Format

- Summary:
- Files or artifacts affected:
- Proposed implementation:
- Tests:
- Risks and assumptions:
- Questions:

## Forbidden Content

- Production customer data.
- Credentials, secrets, or tokens.
- Unapproved logs.
- Unapproved architecture assumptions.
- Direct changes to quality gate policies.

## Human Review Checklist

- Does the output match the approved spec?
- Did the AI invent requirements?
- Are boundary conditions covered?
- Are tests meaningful?
- Are security and permission rules correct?
- Is the output maintainable by the team?
