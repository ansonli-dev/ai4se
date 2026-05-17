# Superpowers Adoption Strategy

## Positioning

Superpowers is the default AI-SDD execution workflow for internal teams.

It is not the complete enterprise delivery methodology by itself. The project still relies on SDD specs, quality gates, owner review, CI/CD, security scanning, and acceptance management.

Outsourced teams are not required to use Superpowers. Their work is accepted by deliverables, test evidence, quality gates, and acceptance results.

## Why Use Superpowers Internally

Superpowers is useful because it turns free-form AI usage into an engineering workflow:

- Clarify intent before implementation.
- Convert requirements into plans.
- Prefer test-first development for behavior changes.
- Use fresh context for implementation tasks.
- Review against the spec before reviewing code quality.
- Verify before claiming completion.

This is especially valuable for new hires, graduates, contractors, and mixed-seniority internal teams.

## Workflow Tiers

### Tier A: Lightweight Changes

Use for:

- Copy changes.
- Small configuration changes.
- Low-risk internal tools.
- Small bug fixes with limited blast radius.

Required flow:

1. Use a lightweight SDD note or issue description.
2. Implement with AI assistance if useful.
3. Complete the merge request template.
4. Run relevant verification.
5. Get normal review.

Superpowers usage:

- Recommended: `verification-before-completion`.
- Optional: `brainstorming`, `writing-plans`, `test-driven-development`.

### Tier B: Standard Stories

Use for:

- Normal business features.
- API changes.
- Database changes.
- Cross-module behavior.
- Meaningful bug fixes.

Required flow:

1. Use `brainstorming` or equivalent SDD clarification.
2. Use `writing-plans` for the implementation plan.
3. Use `test-driven-development` for behavior changes when practical.
4. Use the AI-SDD merge request template.
5. Run quality gates.
6. Use `verification-before-completion` before reporting completion.

### Tier C: High-Risk Changes

Use for:

- Core after-sales flows.
- Permission, customer data, fee, settlement, or audit logic.
- Production-risk changes.
- Architectural decisions.
- Changes requiring module Owner approval.

Required flow:

1. Use full SDD Story Spec and Technical Spec.
2. Create ADR when architecture or major tradeoffs are involved.
3. Use `writing-plans` before implementation.
4. Use `test-driven-development` unless explicitly exempted.
5. Prefer `subagent-driven-development` for separable implementation tasks.
6. Perform spec compliance review before code quality review.
7. Require module Owner approval.
8. Run full quality gates and completion verification.

## Internal Role Mapping

Product owner or business analyst:

- Uses SDD templates and may use `brainstorming` to clarify stories.

Developer:

- Uses `writing-plans`, `test-driven-development`, and `verification-before-completion`.

Tech Lead:

- Reviews plans, enforces workflow tiering, and requests code review when needed.

QA:

- Reviews Test Specs, acceptance evidence, and verification results.

AI Champion:

- Maintains team examples, prompt cards, and common failure cases.
- Coaches new hires, graduates, and contractors.

## Simplification Rules

- Do not require full design documents for Tier A changes.
- Do not require Prompt Cards for every trivial internal change.
- Do not require subagents for tightly coupled or small changes.
- Do not use Superpowers as a supplier management mechanism.
- Do not measure individual productivity with AI metrics.

## Exceptions

Allowed exceptions:

- Throwaway prototypes.
- Spikes used only for learning.
- Emergency production hotfixes.
- Generated boilerplate that is later reviewed and tested.

Exception handling:

- Emergency hotfixes may fix first and complete traceability within 24-48 hours.
- Core business, permission, sensitive data, and security changes cannot skip Owner approval or quality gates.

