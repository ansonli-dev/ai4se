# AI Engineering Constitution

## Purpose

This file defines the baseline rules for internal AI-assisted development.

AI tools and agents may help with implementation, tests, documentation, and analysis, but humans remain accountable for business behavior, architecture, security, and production outcomes.

## Principles

- Start from an approved Story, spec, or task.
- Use the minimum sufficient context.
- Do not invent business rules, data fields, APIs, permissions, or error codes.
- Keep changes within the declared task scope.
- Prefer small, reviewable changes.
- Write or update tests for behavior changes.
- Run verification before claiming completion.
- Record AI usage, context, tests, risks, and review needs.

## Non-Negotiable Rules

- Do not use production customer data in prompts or context unless explicitly approved and masked.
- Do not expose credentials, tokens, secrets, or private keys to AI tools.
- Do not bypass CI/CD, review, or module Owner approval.
- Do not modify quality gate configuration without approval.
- Do not make production-impacting changes without rollback or recovery notes.

## Human Accountability

The developer is responsible for:

- Understanding AI output before using it.
- Removing invented or unnecessary code.
- Confirming the implementation matches the spec.
- Running required verification.
- Explaining risks and assumptions in the merge request.

