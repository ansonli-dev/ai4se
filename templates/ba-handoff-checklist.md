# BA Handoff Checklist

> **Purpose:** Before a Story leaves the BA's hands and enters the backlog, this checklist proves it has enough context for a developer-plus-AI-agent to pick it up later without coming back for clarification. Use one checklist per Story (it can be a section in the Story Card or a linked file).
>
> If any "must" box is unchecked, the Story is **not ready** for the backlog. Park it.
>
> See [BA Guide](../docs/ai-sdd-governance/practice/09-ba-guide.md) for the BA workflow this checklist sits inside.

## Story Metadata

- Story ID:
- Story Name:
- Parent Requirement ID:
- Parent Requirement Review Record:
- Tier classification: ☐ A ☐ B ☐ C
- Module Owner:
- Estimated Sprint (if known):

## Provenance (Must)

- [ ] Story is traceable to a parent Requirement that has passed all three reviews.
- [ ] Tier classification is recorded with the reason.
- [ ] Module Owner identified and notified.

## Story Card Completeness (Must)

- [ ] Business goal stated in one sentence.
- [ ] User role identified.
- [ ] Main flow described.
- [ ] At least one alternative or exception flow recorded, or explicit "none expected" note.
- [ ] Acceptance criteria in Given/When/Then form.
- [ ] AC's are testable — each one names an observable behavior.

## AI Context Boundary (Must when AI will be used)

- [ ] Allowed context sources listed (specs, contracts, code entry points, tests).
- [ ] Forbidden context explicitly noted (production data, customer PII, unrelated modules).
- [ ] Editable scope specified (which files / directories an agent may modify).
- [ ] Forbidden scope specified (which paths the agent must not touch).
- [ ] Required verification commands listed.

## Linked Artifacts (Must when applicable)

- [ ] SDD Story Spec link (must for Tier B/C).
- [ ] Technical Spec link (must for Tier C with technical impact).
- [ ] ADR link (must if architecture decision recorded).
- [ ] Test Spec link (must for Tier B/C non-trivial behavior).
- [ ] OpenAPI / Event Schema link (must if API or event changes).
- [ ] Data Dictionary entry link (must if cross-team data object changes).
- [ ] Error Code Registry entry link (must if user-facing or cross-service error changes).
- [ ] Permission Model entry (must if auth or audit behavior changes).
- [ ] Observability Plan section (must if production-risk change).

## Dependencies And Sequencing (Must when present)

- [ ] Upstream dependencies named (other Stories, services, suppliers, environments).
- [ ] Downstream dependencies named (what gets unblocked when this completes).
- [ ] Cross-team coordination needs flagged.
- [ ] Estimated effort or T-shirt size recorded.

## Open Questions (Must be empty before handoff)

| # | Question | Owner | Resolved On |
| --- | --- | --- | --- |
| | | | |

All open questions must be resolved before the Story enters the backlog. Unresolved questions belong on the parent Requirement, not on a Story.

## Definition Of Ready Signoff

- [ ] BA signoff:                                 Date:
- [ ] Tech Lead signoff (Tier B/C):               Date:
- [ ] QA signoff (Tier B/C):                      Date:
- [ ] Module Owner aware (Tier C):                Date:

## AI-Readiness Self-Test

Before placing this Story on the backlog, the BA mentally walks an AI agent through it and answers:

- [ ] Could an agent identify the goal without asking a human? Yes
- [ ] Could an agent identify scope and non-scope? Yes
- [ ] Could an agent identify which files / APIs / tests it may use? Yes
- [ ] Could an agent identify the acceptance criteria and verify them? Yes
- [ ] Could an agent identify which risks need human review? Yes

If any answer is "no", the Story is not ready. Fix the gap before backlog placement.
