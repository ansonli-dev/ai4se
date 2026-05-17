# AI Context Policy

## Required Context

For Tier B and Tier C internal AI-assisted work, provide:

- Story card.
- SDD Story Spec.
- Acceptance criteria.
- Relevant Technical Spec or ADR.
- Relevant API contract or event schema.
- Relevant data dictionary or error code registry.
- Relevant tests.
- Relevant code entry points.

## Allowed Context

- Approved requirements.
- Approved architecture documents.
- Approved API contracts.
- Approved event schemas.
- Approved coding standards.
- Approved test policies.
- Existing source code needed for the task.
- Historical defects that are already approved for internal use.

## Forbidden Context

- Unmasked production customer data.
- Credentials, tokens, secrets, or private keys.
- Unapproved production logs.
- Unapproved personal data.
- Private supplier internals not approved for use.
- Documents outside the task scope unless the reviewer approves.

## Context Selection Rule

Use the minimum sufficient context.

The agent should see what it needs to complete the bounded task, not the entire system by default.

## Missing Context Rule

If required context is missing, stop and ask for clarification. Do not let the agent infer missing business rules or interfaces.

