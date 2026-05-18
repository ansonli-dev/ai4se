# Rollout And Acceptance

Chinese version: [../zh/practice/07-推广与验收.md](../zh/practice/07-推广与验收.md)

## Purpose

This doc owns **acceptance** for the AI-SDD rollout — the concrete scenarios and program-level criteria that prove the rollout planned in [Priorities And Roadmap](06-priorities-and-roadmap.md) actually produced the behavior change you wanted.

It deliberately does not maintain its own rollout phases. [Priorities And Roadmap](06-priorities-and-roadmap.md) is the canonical 5-phase rollout sequence (Phase 0 → Phase 4); this doc verifies the result of each of those phases.

## Relationship To The Roadmap

```text
Priorities And Roadmap (doc 06)         Rollout And Acceptance (doc 07)
────────────────────────────────         ───────────────────────────────
Phase 0: Direction And Minimum Rules     → Scenarios apply once Phase 1 begins.
Phase 1: Manual-First Controlled Pilot   → Pilot scenarios (this doc) verify a controlled pilot.
Phase 2: CI And Quality Baseline         → Quality-gate scenarios verify gates actually block.
Phase 3: Multi-Team Expansion            → Cross-team scenarios verify scaled adoption.
Phase 4: Platform And Dashboard          → Program-level criteria verify the measurable system.
```

If a Phase X in doc 06 is "complete" but the corresponding scenarios in this doc do not pass, the phase is not actually complete.

## Pilot Acceptance Scenarios

These six scenarios are the core acceptance test for the AI-SDD rollout. Each one verifies a specific governance property is real, not aspirational.

### Same Acceptance Standard, Different Delivery Modes

What it tests: that internal AI-assisted work and supplier deliverable-only work are held to the same outputs even though they use different workflows.

How to run it:

- Pick one internal Story going through the Superpowers workflow and one supplier deliverable in the same iteration.
- Check whether both outputs satisfy the same SDD Spec, API contract, test evidence, and quality gate expectations.
- Verify acceptance is decided by the deliverable evidence, not by which workflow produced it.

Pass criterion: both pass or both fail by the same standard.

### AI Merge Request Audit

What it tests: that AI-assisted MRs are auditable.

How to run it:

- Randomly sample 10 AI-assisted merge requests from recent iterations.
- Confirm each has: requirement link, SDD Spec link, AI usage declaration, test evidence, human review.

Pass criterion: 10 / 10 have all five elements present.

### Core API Change

What it tests: that contract discipline holds when a core interface changes.

How to run it:

- Change one core interface as a planned Story.
- Verify OpenAPI is updated, mocks are updated, contract tests are updated, caller impact analysis is recorded.

Pass criterion: no contract test missing; no caller surprised by the change.

### Low-Quality AI Output

What it tests: that quality gates actually block bad output.

How to run it:

- Submit a deliberately incomplete or shallow AI-generated implementation on a controlled branch.
- Verify quality gates block the merge and the reviewer's checklist catches what the gates missed.

Pass criterion: the bad change does not merge through any path.

### New Member Enablement

What it tests: that the workflow is teachable to someone new.

How to run it:

- Ask one new hire to complete a low-risk Story using the lightweight Superpowers flow.
- Verify the new hire can complete the internal workflow with limited coaching.

Pass criterion: the new hire completes the Story without needing private exception rules or undocumented hand-holding.

### Defect Traceability

What it tests: that a defect can be traced through every layer of the [Execution Stack](../knowledge/03-execution-stack.md).

How to run it:

- Pick one defect (real or planted).
- Trace it back to requirement, SDD Spec, code, test, review, and release.
- Run the bottom-up diagnosis from doc 03: CI? Harness? Superpowers? SDD?

Pass criterion: the layer that let the defect through can be named, and the next-iteration improvement target is clear.

## Program-Level Success Criteria

These are the steady-state criteria once the full rollout from [Priorities And Roadmap](06-priorities-and-roadmap.md) is complete. They are not gates for any single Story; they are the program health indicators.

- Three or more internal teams use the same SDD artifact templates.
- Internal teams use the agreed Superpowers workflow tiers.
- 100% of core modules have owners recorded in `CODEOWNERS`.
- 100% of new service APIs have OpenAPI contracts.
- 100% of merge requests pass automated quality gates before merge.
- 100% of AI-assisted code has human review and audit records.
- Pilot cycle time improves without increasing defect escape rate.

These criteria are also the inputs to [Metrics](../knowledge/10-metrics.md) for ongoing governance review.

## When To Run Acceptance

- **End of Phase 1 (Manual-First Controlled Pilot):** run the *Same Acceptance Standard*, *AI MR Audit*, and *New Member Enablement* scenarios. The other three need CI/Phase 2 maturity to be meaningful.
- **End of Phase 2 (CI And Quality Baseline):** add *Low-Quality AI Output* and *Core API Change*. *Defect Traceability* becomes meaningful once a real defect cycle has happened.
- **End of Phase 3 (Multi-Team Expansion):** run all six scenarios across at least two teams. Begin tracking program-level criteria as trends, not pass/fail.
- **Phase 4 onward:** acceptance scenarios become regression checks — run quarterly or after major governance changes.

## Key Takeaways

- This doc owns acceptance; doc 06 owns the rollout phases.
- Six pilot scenarios verify governance properties that must be real, not aspirational.
- Program-level criteria are steady-state health indicators, not per-Story gates.
- A phase is not complete until the acceptance scenarios for it pass.

## Next

- [Metrics](../knowledge/10-metrics.md) — once acceptance scenarios pass, the program-level criteria become trend metrics in the ongoing governance review cadence.
