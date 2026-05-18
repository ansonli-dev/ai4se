# Role × Stage Matrix

Chinese version: [../zh/practice/08-角色阶段矩阵.md](../zh/practice/08-角色阶段矩阵.md)

## Purpose

The [Artifact Map](02-ai-context-artifact-map.md) tells you *what artifacts* exist at each delivery stage. This doc tells you *who produces them, and how*. It is the second canonical practice reference, sister to the artifact map.

Read in either direction:

- **By stage (time-walking)** — pick a column and read down: who is doing what at this point in the iteration.
- **By role (role-walking)** — pick a row and read across: your work across the whole lifecycle.

For roles whose micro-flow is substantial (Developer, BA), the cell here is a brief summary plus a link to the deep guide. For other roles the full micro-flow lives in this doc.

## Stages And Roles Used Here

**Stages** (same as the artifact map):

- **S0 Project / Iteration Preparation**
- **S1 Architecture And Technical Boundary Design**
- **S2 Requirement → Three Reviews → Story Breakdown**
- **S3 Story Ready → Backlog → Sprint Selection**
- **S4 Story Development And MR**
- **S5 Story Acceptance**
- **S6 System Integration And Release Preparation**
- **S7 User Acceptance And Feedback Loop**

**Roles**:

- **PO** — Product Owner
- **BA** — Business Analyst
- **Arch/TL** — Architect or Tech Lead
- **MO** — Module Owner
- **Dev** — Developer
- **QA** — QA / Test
- **Sec** — Security Lead
- **AIC** — AI Champion
- **DO** — Delivery Owner

A "—" in the matrix means no significant work at that stage for that role (they may still be informed, but produce no output).

## Overview Matrix

| Stage | PO | BA | Arch/TL | MO | Dev | QA | Sec | AIC | DO |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| S0 Iter Prep | Frame pilot scope | Feed BA process input | Approve arch baseline | Confirm module ownership | Read AI Constitution | Confirm test policy | Confirm security policy | Coach team setup | Approve roles, gates |
| S1 Architecture | — | Consulted | Produce arch context + ADRs | Approve constraints for owned modules | — | Review test impact | Review security boundary | — | Informed |
| S2 Req → 3 Reviews → Stories | Frame Requirement | **Own end-to-end** + lead Requirements Review | Lead Technical Review | Consulted on Tech Review | — | Lead Test Review | Join Tech Review when sensitive | Monitor failure cases | Informed |
| S3 Story Ready → Backlog → Sprint | Confirm Story priority | Run handoff checklist, place on backlog | Confirm Tech Spec needed | Approve Tier C Story scope | Read Story, raise DoR questions | Confirm Test Spec needed | Confirm sec review needed | Coach Story intake | Approve iteration scope |
| S4 Story Dev / MR | — | Answer dev questions | Plan review for Tier C | Review code for owned modules | **Own end-to-end**: plan → TDD → MR | TDD review, test quality review | Security scan + review | Coach Superpowers usage | — |
| S5 Story Acceptance | Accept business outcome | Capture acceptance evidence | — | Approve merge | Verify completion evidence | Run acceptance tests | Sec acceptance check | Capture failure cases | — |
| S6 Integration / Release | — | Provide release-notes input | Integration review | Approve release for owned modules | Deployment notes, rollback notes | E2E + smoke + UAT prep | SAST/SCA/Secret-scan gates | — | Sign off release readiness |
| S7 UAT / Feedback | UAT decision | Capture feedback, propose Requirement updates | — | — | Fix follow-ups | UAT evidence, defect attribution | Sec UAT participation | Update prompt cards from failure cases | Review program metrics |

This matrix is the index. The next two sections give the full detail by **stage** (time-walking) and by **role** (role-walking).

---

## By Stage (Time-Walking View)

Each section below expands one stage, listing each participating role's micro-flow at that stage: inputs, steps, outputs, and the AI-readiness condition the output must satisfy.

### S0 Project / Iteration Preparation

Goal: establish delivery boundary, team rules, AI policies, ownership baseline.

**Delivery Owner (DO)** — *Approve roles and gates*
- Inputs: program charter, prior iteration retro.
- Steps: name governance committee, AI Champion, Module Owners; approve Tier rules; approve baseline CI/test/security plan.
- Outputs: signed-off role list, approved Tier rules.
- AI-readiness: governance roles are recorded in a place an agent can read (CODEOWNERS, service catalog, team agreement).

**Architect or Tech Lead (Arch/TL)** — *Approve architecture baseline*
- Inputs: existing architecture overview, prior ADRs.
- Steps: review Architecture Overview for the pilot domain; flag anything that needs an ADR refresh; agree allowed-dependency rules.
- Outputs: confirmed [Architecture Overview](../../../templates/architecture-overview.md), updated [Architecture Constraints](../../../templates/architecture-constraints.md).
- AI-readiness: constraints are written down as rules an agent could grep, not as committee-meeting tribal knowledge.

**Module Owner (MO)** — *Confirm ownership*
- Inputs: service catalog, CODEOWNERS draft.
- Steps: claim modules; confirm scope of accountability.
- Outputs: entry in [CODEOWNERS](../../../templates/CODEOWNERS), entry in service catalog.
- AI-readiness: every owned path in CODEOWNERS is a path an agent can resolve.

**Product Owner (PO)** — *Frame pilot scope*
- Inputs: business roadmap.
- Steps: pick pilot domain; identify pilot Requirements; confirm success criteria for the iteration.
- Outputs: [Project Brief](../../../templates/project-brief.md) / [Iteration Brief](../../../templates/iteration-brief.md).
- AI-readiness: the brief names scope and non-scope explicitly so future Requirements can be checked against it.

**BA** — *Feed BA process input*
- Inputs: Project / Iteration Brief.
- Steps: confirm Requirement intake channel; agree review cadence with Tech Lead and QA; pre-flight any Requirements already in queue.
- Outputs: BA workflow agreement (informal note or section in Team Working Agreement).
- AI-readiness: the BA's queue is visible — agents and humans both know where Requirements live.

**QA** — *Confirm test policy*
- Inputs: [Testing Policy](../../../ai/testing-policy.md), [Test Spec](../../../templates/test-spec.md) template.
- Steps: confirm required test layers, flaky-test policy, evidence requirements; brief the team.
- Outputs: confirmed policy adoption, any local QA notes.
- AI-readiness: the test policy is the same document the agent's Harness verification policy points to.

**Security Lead (Sec)** — *Confirm security policy*
- Inputs: [Security Policy](../../../ai/security-policy.md), [AI Context Policy](../../../ai/context-policy.md), [Allowed Tools](../../../ai/allowed-tools.md).
- Steps: confirm forbidden-context list; confirm secret-scan and SAST/SCA plan; approve AI model and context layer for the pilot.
- Outputs: signed-off policies for the pilot.
- AI-readiness: policies are linked from the AI Engineering Constitution that every agent reads.

**AI Champion (AIC)** — *Coach team setup*
- Inputs: Superpowers documentation, this handbook.
- Steps: install / configure Superpowers for the team; run a kickoff demo from spec to MR.
- Outputs: working Superpowers setup, example Story package.
- AI-readiness: the team has at least one end-to-end Story example to mimic.

### S1 Architecture And Technical Boundary Design

Goal: define the architecture boundaries AI must respect during Story-level implementation.

**Arch/TL** — *Produce architecture context + ADRs*
- Inputs: pilot scope, existing architecture, business intent for the pilot.
- Steps: produce or refresh the [Architecture Overview](../../../templates/architecture-overview.md); decide whether an [ADR](../../../templates/adr.md) is needed; specify the [Architecture Constraints](../../../templates/architecture-constraints.md); identify which contracts (OpenAPI / Event Schema / Data Dictionary / Error Code) will be in play.
- Outputs: Architecture Overview, Architecture Constraints, any new ADRs.
- AI-readiness: an agent can tell which modules, services, data stores, APIs, events, permissions, and architectural constraints are relevant before reading code.

**Module Owner (MO)** — *Approve constraints for owned modules*
- Inputs: draft Architecture Constraints affecting the owned module.
- Steps: review, push back, approve.
- Outputs: approval recorded against the constraint.
- AI-readiness: approval is recorded so the agent doesn't need to relitigate it.

**BA** — *Consulted*
- Inputs: draft architecture.
- Steps: sanity-check that the architecture supports the upcoming Requirements; flag mismatches early.
- Outputs: comments on draft.
- AI-readiness: no direct output, but BA absorbs constraints to use when writing future Requirements.

**QA** — *Review test impact*
- Inputs: draft architecture.
- Steps: identify which boundaries will need contract tests, which integrations will need integration tests.
- Outputs: test-impact note.
- AI-readiness: feeds into stage S3 Test Spec.

**Security Lead (Sec)** — *Review security boundary*
- Inputs: draft architecture.
- Steps: identify auth/audit boundaries; raise concerns; require ADR if needed.
- Outputs: security-impact note.
- AI-readiness: feeds into Tech Review at S2.

### S2 Requirement → Three Reviews → Story Breakdown

Goal: turn a business Requirement (Feature-sized) into ready Stories via the three gating reviews.

**BA** — *Own end-to-end + lead Requirements Review* — [Deep guide](09-ba-guide.md)
- Inputs: business request (ticket, conversation, stakeholder ask).
- Steps:
  1. **Intake**: capture the raw ask; identify originating stakeholder; create a Requirement ID.
  2. **Analyse**: draft the [Feature Spec / Requirement Spec](../../../templates/feature-spec.md) — business goal, users, scope, non-scope, business rules, data/interface impact, NFRs.
  3. **Lead Requirements Review** (Section 1 of [Requirement Review Record](../../../templates/requirement-review-record.md)): confirm what, scope, success criteria, stakeholders.
  4. **Convene Technical Review** with Arch/TL (Section 2).
  5. **Convene Test Review** with QA (Section 3).
  6. **Reconcile**: capture conditions, re-draft Requirement if needed, repeat reviews until overall outcome is *Approved* or *Conditionally Approved*.
  7. **Story Breakdown**: split the Requirement into Stories with acceptance criteria; record traceability in the review record's Traceability table.
- Outputs:
  - Approved [Feature Spec / Requirement Spec](../../../templates/feature-spec.md).
  - Completed [Requirement Review Record](../../../templates/requirement-review-record.md).
  - Initial Story Cards (one per Story identified in the breakdown).
- AI-readiness: every Story carries a back-link to the parent Requirement and its review record; an agent reading any Story can trace upstream context.

**Arch/TL** — *Lead Technical Review*
- Inputs: BA's draft Requirement, Section 1 outcome.
- Steps: assess feasibility, architecture impact, complexity, risks, dependencies; require ADR if decisions are needed.
- Outputs: Section 2 of [Requirement Review Record](../../../templates/requirement-review-record.md) completed; ADR if applicable.
- AI-readiness: the technical impact list names actual modules / contracts / files.

**QA** — *Lead Test Review*
- Inputs: BA's draft Requirement, Section 1 + Section 2 outcomes.
- Steps: confirm testability of acceptance criteria; identify required test layers; confirm test environment and data needs; flag UAT scope.
- Outputs: Section 3 of [Requirement Review Record](../../../templates/requirement-review-record.md) completed.
- AI-readiness: acceptance criteria gaps are closed before Story breakdown.

**Module Owner (MO)** — *Consulted on Tech Review*
- Inputs: Section 2 draft.
- Steps: review impact on owned modules; approve or push back.
- Outputs: approval / objection recorded in Section 2.
- AI-readiness: scope on owned modules is agreed before Stories enter backlog.

**Product Owner (PO)** — *Frame Requirement*
- Inputs: business request.
- Steps: collaborate with BA on business goal and success criteria; participate in Requirements Review.
- Outputs: signoff in Section 1.
- AI-readiness: success criteria are explicit, not implicit.

**Security Lead (Sec)** — *Join Tech Review when sensitive*
- Inputs: Section 2 draft.
- Steps: review when auth / customer-data / payment / audit changes are involved; require security controls.
- Outputs: contribution to Section 2 + may trigger a separate Security note.
- AI-readiness: required security controls become non-negotiable Story-level requirements.

**AI Champion (AIC)** — *Monitor failure cases*
- Inputs: prior AI-failure pattern library.
- Steps: warn the BA / Arch / QA if this Requirement matches a known failure mode (e.g., ambiguous AC, missing permission tests).
- Outputs: notes / examples to apply.
- AI-readiness: failure-prone patterns flagged early instead of debugged in MR.

### S3 Story Ready → Backlog → Sprint Selection

Goal: take each Story from "broken out by BA" to "picked into a sprint with full context".

**BA** — *Run handoff checklist, place on backlog* — [Deep guide](09-ba-guide.md)
- Inputs: Stories from S2 Story Breakdown.
- Steps:
  1. Complete the [BA Handoff Checklist](../../../templates/ba-handoff-checklist.md) for each Story.
  2. Write or update the [SDD Story Spec](../../../templates/sdd-story-spec.md) (Tier B/C).
  3. Confirm AI Context Boundary, tier, module owner, dependencies.
  4. Resolve every open question (any unresolved question stays on the parent Requirement, not on a Story).
  5. Place the Story on the backlog with priority and dependency labels.
- Outputs: Stories on backlog, each with passing handoff checklist; SDD Story Spec linked.
- AI-readiness: the AI-readiness self-test on the handoff checklist passes for every backlog Story.

**Tech Lead (Arch/TL)** — *Confirm Tech Spec needed*
- Inputs: BA's Stories.
- Steps: decide whether a [Technical Spec](../../../templates/technical-spec.md) is needed per Story; sign off Tier B/C SDD Story Specs.
- Outputs: Technical Spec links on Stories that need them.
- AI-readiness: Stories with technical impact have a Technical Spec before the developer picks them up.

**QA** — *Confirm Test Spec needed*
- Inputs: BA's Stories.
- Steps: decide whether a [Test Spec](../../../templates/test-spec.md) is needed; co-author for Tier B/C.
- Outputs: Test Spec links on Stories that need them.
- AI-readiness: behavior-change Stories have testable AC and a known test approach.

**Module Owner (MO)** — *Approve Tier C Story scope*
- Inputs: Tier C Stories touching owned modules.
- Steps: review scope; approve.
- Outputs: approval recorded.
- AI-readiness: agent execution on owned-module Stories has explicit owner consent.

**Security Lead (Sec)** — *Confirm sec review needed*
- Inputs: Stories that may touch auth / data / audit.
- Steps: confirm if a focused security review at MR time is needed; flag the Story.
- Outputs: security-review-required label.
- AI-readiness: developer knows to request security review at MR time.

**Product Owner (PO)** — *Confirm Story priority*
- Inputs: backlog snapshot.
- Steps: order Stories for sprint planning; communicate priority changes.
- Outputs: prioritised backlog.
- AI-readiness: prioritisation is visible (no "ask the PO" hidden state).

**Delivery Owner (DO)** — *Approve iteration scope*
- Inputs: proposed sprint scope.
- Steps: confirm team capacity; approve scope; ratify any Tier C inclusions.
- Outputs: signed-off iteration scope (in [Iteration Brief](../../../templates/iteration-brief.md)).
- AI-readiness: iteration scope is the authoritative "what's in this sprint" source for the agent and humans.

**Developer (Dev)** — *Read Story, raise DoR questions*
- Inputs: Stories about to be assigned.
- Steps: skim Story + linked artifacts; raise DoR gaps to BA before sprint start; do not start Stories that fail self-test.
- Outputs: clarification requests; refusal to start unready Stories.
- AI-readiness: developer's own DoR check is the last line of defence before the AI executes.

**AI Champion (AIC)** — *Coach Story intake*
- Inputs: BA's checklist, developer DoR questions.
- Steps: coach developers on intake patterns; flag recurring DoR gaps for BA improvement.
- Outputs: examples, anti-patterns captured.
- AI-readiness: DoR quality improves over iterations.

### S4 Story Development And MR

Goal: convert Story to code + tests + contracts + evidence.

**Developer (Dev)** — *Own end-to-end: plan → TDD → MR* — [Deep guide](04-developer-guide.md)
- See [Developer Guide](04-developer-guide.md) for the eight-step daily workflow.
- Outputs: code, tests, updated contracts, MR with all required evidence, Agent Execution Report for Tier B/C AI-assisted work.
- AI-readiness: the MR is the next stage's input — it must include verification evidence, AI usage declaration, and traceability to Story and Requirement.

**Tech Lead (Arch/TL)** — *Plan review for Tier C*
- Inputs: developer's implementation plan, draft MR.
- Steps: review plan against Tech Spec / ADR; review code in MR for Tier C; spec-compliance review before code-quality review.
- Outputs: review comments; approval.
- AI-readiness: review focuses on whether implementation matches the spec, not whether code "looks fine".

**Module Owner (MO)** — *Review code for owned modules*
- Inputs: MR touching owned modules.
- Steps: review against [Review Checklist](../../../ai/review-checklist.md); confirm no invented business rules or fields; approve.
- Outputs: Owner Review approval on MR.
- AI-readiness: the merge gate has a real human owner attached.

**QA** — *TDD review, test quality review*
- Inputs: MR with tests.
- Steps: confirm tests assert observable behavior, not implementation noise; confirm AI-generated tests would fail for a plausible wrong implementation; confirm coverage of negative / boundary / permission cases.
- Outputs: test review comments.
- AI-readiness: tests are evidence, not theatre.

**Security Lead (Sec)** — *Security scan + review*
- Inputs: MR, scan results.
- Steps: review SAST / SCA / Secret Scan findings; require fixes; review code if security-flagged Story.
- Outputs: security signoff.
- AI-readiness: security findings become non-mergeable until resolved.

**BA** — *Answer dev questions*
- Inputs: developer clarification requests.
- Steps: clarify scope / AC ambiguity; update Story or parent Requirement if needed.
- Outputs: clarifications recorded against the Story (not in chat).
- AI-readiness: clarifications become part of the Story context so they survive into the next agent session.

**AI Champion (AIC)** — *Coach Superpowers usage*
- Inputs: live MR work.
- Steps: pair with developers on Superpowers skill usage (planning, TDD, verification); collect failure cases for the library.
- Outputs: improved usage patterns, captured failure modes.
- AI-readiness: failure patterns become tomorrow's improvements.

### S5 Story Acceptance

Goal: confirm the Story behavior is accepted and capture evidence for release planning.

**Developer (Dev)** — *Verify completion evidence*
- Steps: run verification; attach evidence to MR.
- Outputs: [Story Acceptance Record](../../../templates/story-acceptance-record.md) data, verification evidence.

**QA** — *Run acceptance tests*
- Steps: run acceptance / E2E tests for the Story.
- Outputs: [Acceptance Evidence](../../../templates/acceptance-evidence.md).
- AI-readiness: acceptance evidence is linked from the MR.

**Module Owner (MO)** — *Approve merge*
- Steps: final approval for owned modules.
- Outputs: merge approval.
- AI-readiness: merge approval is logged.

**Product Owner (PO)** — *Accept business outcome*
- Steps: confirm the Story delivers the business value.
- Outputs: PO acceptance recorded.
- AI-readiness: business acceptance is recorded against the Story.

**BA** — *Capture acceptance evidence*
- Steps: link Story acceptance back to parent Requirement; update Requirement status.
- Outputs: parent Requirement updated with Story-level acceptance.
- AI-readiness: Requirement-level status reflects accumulated Story acceptance.

**Security Lead (Sec)** — *Sec acceptance check*
- Steps: confirm security gates passed.
- Outputs: security acceptance signoff.

**AI Champion (AIC)** — *Capture failure cases*
- Steps: log any AI failure modes seen during this Story.
- Outputs: failure-case entries for the library.
- AI-readiness: tomorrow's prompts and policies improve from today's failures.

### S6 System Integration And Release Preparation

Goal: prove integrated work is releasable and recoverable.

**Tech Lead (Arch/TL)** — *Integration review*
- Steps: integration test runs, cross-service compatibility check, contract-test results review.
- Outputs: [Quality Gate Report](../../../templates/quality-gate-report.md), integration-test evidence.

**Module Owner (MO)** — *Approve release for owned modules*
- Steps: confirm owned modules are release-ready.
- Outputs: release approval.

**Developer (Dev)** — *Deployment notes, rollback notes*
- Steps: write [Deployment Notes](../../../templates/deployment-notes.md) and [Rollback Plan](../../../templates/rollback-plan.md) for production-impacting work.
- Outputs: linked from release artifact.

**QA** — *E2E + smoke + UAT prep*
- Steps: run E2E and smoke; prepare UAT environment and data.
- Outputs: [Integration Plan](../../../templates/integration-plan.md), test evidence.

**Security Lead (Sec)** — *SAST/SCA/Secret-scan gates*
- Steps: confirm production-bound build passes all security gates.
- Outputs: security signoff.

**BA** — *Provide release-notes input*
- Steps: collaborate with PO / Tech Lead on user-facing release notes.
- Outputs: contribution to [Release Notes](../../../templates/release-notes.md).

**Delivery Owner (DO)** — *Sign off release readiness*
- Steps: confirm all gates passed; authorise release.
- Outputs: [Release Acceptance Record](../../../templates/release-acceptance-record.md) signoff.

### S7 User Acceptance And Feedback Loop

Goal: capture real user acceptance and feed it into the next iteration.

**Product Owner (PO)** — *UAT decision*
- Steps: oversee UAT; make accept / reject call.
- Outputs: acceptance decision.

**QA** — *UAT evidence, defect attribution*
- Steps: run [UAT Plan](../../../templates/uat-plan.md); capture [UAT Evidence](../../../templates/uat-evidence.md); attribute any defects per [Defect Attribution](../../../templates/defect-attribution.md).
- Outputs: UAT evidence + defect attribution.
- AI-readiness: defect attribution feeds back through the [Execution Stack](../knowledge/03-execution-stack.md) bottom-up walk to find which layer let the defect through.

**BA** — *Capture feedback, propose Requirement updates*
- Steps: collect user feedback; propose [Change Requests](../../../templates/change-request.md) or [Knowledge Base Updates](../../../templates/knowledge-base-update.md); update parent Requirement status to Accepted.
- Outputs: change requests, knowledge base updates, Requirement status update.
- AI-readiness: feedback becomes structured input for the next iteration's Requirements.

**Developer (Dev)** — *Fix follow-ups*
- Steps: address UAT defects via the normal Story flow.

**Security Lead (Sec)** — *Sec UAT participation*
- Steps: participate in security-sensitive UAT.

**AI Champion (AIC)** — *Update prompt cards from failure cases*
- Steps: turn captured failure cases into improved [Prompt Cards](../../../templates/prompt-card.md), context policy updates, harness improvements.
- Outputs: updated prompt cards, updated policies.
- AI-readiness: the harness improves between iterations, not just within them.

**Delivery Owner (DO)** — *Review program metrics*
- Steps: review [Metrics](../knowledge/10-metrics.md) trends; trigger process improvements.
- Outputs: governance actions in [Weekly AI-SDD Review](../../../templates/weekly-ai-sdd-review.md).

---

## By Role (Role-Walking View)

Quick index for each role: where in this doc to find your work, and where the deep guide lives if you have one.

### Product Owner (PO)
- Active stages: S0 (frame scope), S2 (frame Requirement), S3 (prioritise), S5 (accept), S6 (release), S7 (UAT decision).
- Deep guide: none yet — Product Owner work is mostly upstream of this handbook.

### Business Analyst (BA)
- Active stages: S0 (process input), S1 (consulted), **S2 (own end-to-end)**, **S3 (handoff to backlog)**, S4 (answer questions), S5 (link acceptance to Requirement), S6 (release notes input), S7 (feedback capture).
- Deep guide: [BA Guide](09-ba-guide.md).

### Architect / Tech Lead (Arch/TL)
- Active stages: S0 (arch baseline), **S1 (architecture context)**, S2 (lead Tech Review), S3 (confirm Tech Spec), S4 (plan review), S5 (—), S6 (integration review).
- Deep guide: none yet — architect work spans many tools and judgment areas; covered by [Toolchain](../knowledge/07-toolchain.md), [Operating Model](../knowledge/04-operating-model.md), and [Execution Stack](../knowledge/03-execution-stack.md).

### Module Owner (MO)
- Active stages: S0 (claim ownership), S1 (approve constraints), S2 (consulted), S3 (approve Tier C scope), S4 (Owner Review), S5 (approve merge), S6 (approve release).
- Deep guide: none — Module Owner is an accountability role rather than a workflow role. See [Operating Model](../knowledge/04-operating-model.md).

### Developer (Dev)
- Active stages: S0 (read constitution), S3 (raise DoR questions), **S4 (own end-to-end)**, S5 (verify completion), S6 (deployment/rollback notes), S7 (fix follow-ups).
- Deep guide: [Developer Guide](04-developer-guide.md).

### QA
- Active stages: S0 (test policy), S1 (test impact), **S2 (lead Test Review)**, S3 (Test Spec), S4 (test review), S5 (acceptance tests), S6 (E2E/smoke/UAT prep), **S7 (UAT evidence + defect attribution)**.
- Deep guide: none yet — QA work is governed by [Testing Strategy](../knowledge/06-testing-strategy.md) and [Testing Policy](../../../ai/testing-policy.md).

### Security Lead (Sec)
- Active stages: S0 (security policy), S1 (security boundary), S2 (Tech Review when sensitive), S3 (flag sec-review needed), S4 (security scans + review), S5 (sec acceptance), S6 (security gates), S7 (sec UAT).
- Deep guide: none yet — see [Security Policy](../../../ai/security-policy.md) and [Quality Gates](../knowledge/05-quality-gates.md).

### AI Champion (AIC)
- Active stages: S0 (team setup), S2 (monitor failure cases), S3 (coach intake), S4 (coach Superpowers), S5 (capture failure cases), S7 (improve prompt cards).
- Deep guide: covered by [Superpowers Adoption](03-superpowers-adoption.md) and [Harness Engineering](../knowledge/09-harness-engineering.md).

### Delivery Owner (DO)
- Active stages: S0 (approve roles/gates), S3 (approve iteration scope), S6 (sign off release), S7 (program metrics).
- Deep guide: none — see [Operating Model](../knowledge/04-operating-model.md) and [Priorities And Roadmap](06-priorities-and-roadmap.md).

## Key Takeaways

- This matrix is the second canonical practice reference: artifact map (doc 02) answers "what artifact", this doc answers "who produces it and how".
- Every cell either describes the role's micro-flow inline, or links to the deep guide (Developer, BA).
- Every output has an AI-readiness condition — if the output does not satisfy it, the next stage is not safely AI-assistable.
- The matrix exposes who is missing at each stage; "—" cells are deliberate, not gaps.

## Next

- [BA Guide](09-ba-guide.md) — the deep workflow for the BA role across S2-S7, including the Requirement → three-reviews → Story flow.
