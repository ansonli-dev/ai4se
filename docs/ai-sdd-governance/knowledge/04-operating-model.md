# Operating Model

Chinese version: [../zh/knowledge/04-运行模型.md](../zh/knowledge/04-运行模型.md)

## Governance Layers

The delivery program uses five governance layers:

1. Project AI-SDD Governance Committee — cross-team standards.
2. Team AI Champion — per-team enablement and feedback.
3. Code Owner Model — per-module accountability.
4. Business Analyst (BA) Accountability — per-Requirement upstream ownership.
5. Quality Arbitration — dispute resolution.

## 1. Project AI-SDD Governance Committee

Members:

- Delivery owner.
- Chief architect or architecture lead.
- QA lead.
- Security lead.
- Tech Lead from each internal team.
- Outsourced team delivery lead, when outsourced deliverables are in review.

Responsibilities:

- Own the internal AI-SDD process and the overall quality bar.
- Approve standard templates and changes to templates.
- Define quality gates and metric definitions.
- Review weekly AI-SDD delivery metrics.
- Resolve disputes around architecture, security, and core business behavior.

Cadence:

- Weekly 60-minute AI-SDD quality review.
- Bi-weekly template and toolchain improvement review.
- Monthly outsourced deliverable quality review.

## 2. Team AI Champion

Each internal team appoints 1-2 AI Champions.

Responsibilities:

- Coach team members on SDD and AI usage.
- Maintain team-level Superpowers usage examples and prompt cards.
- Collect AI failure cases and submit them to the governance committee.
- Help new hires, graduates, and contractors use the internal Superpowers-based workflow.

## 3. Code Owner Model

Every critical module has an owner.

Rules:

- Core business modules must be owned by internal employees.
- Outsourced developers may deliver code or packages for core modules, but cannot be the final approver for internal repository merge or acceptance.
- Module owners approve changes that affect domain behavior, data models, interface contracts, permissions, or production risk.
- Ownership is recorded in the service catalog and repository `CODEOWNERS` file when available.

## 4. Business Analyst (BA) Accountability

The BA is the owner of the upstream **Requirement → three-reviews → Story breakdown** flow. Without a clear BA role, the SDD layer of the [Execution Stack](03-execution-stack.md) is weak — defects later attributed to "spec ambiguity" usually trace to a missing BA step.

Responsibilities:

- Own each Requirement end-to-end from intake to closure.
- Convene and lead the Requirements Review; co-lead the Technical and Test Reviews with Tech Lead and QA.
- Drive Story Breakdown only after all three reviews are *Approved* or *Conditionally Approved*.
- Run the [BA Handoff Checklist](../../../templates/ba-handoff-checklist.md) for every Story before backlog placement; refuse to place Stories that fail the AI-readiness self-test.
- Support development by updating artifacts (not chat) when developers raise questions.
- Link Story acceptance back to the parent Requirement and close Requirements with lessons learned.

Authority limits:

- The BA does not approve architecture decisions, security exceptions, or core module changes (those remain with Architect/Tech Lead, Security Lead, and Module Owner).
- The BA cannot override the three-review outcomes — a Failed review must go back through rework, not be bypassed by BA judgment.

Relationship to other roles:

- With **PO**: PO frames business intent and accepts business outcome; BA turns intent into specifiable artifacts and runs the reviews.
- With **Tech Lead** and **QA**: BA convenes the Technical and Test Reviews; Tech Lead and QA chair them respectively.
- With **Module Owner**: Module Owner is consulted on Technical Review for owned modules and approves Tier C Story scope.
- With **AI Champion**: AI Champion flags Requirement-level patterns that historically caused AI failure modes.

Full BA workflow: [BA Guide](../practice/09-ba-guide.md). BA's per-stage participation: [Role × Stage Matrix](../practice/08-role-stage-matrix.md).

## 5. Quality Arbitration

When a team cannot resolve a dispute, the governance committee arbitrates.

Common arbitration topics:

- Whether a change affects architecture.
- Whether an AI-generated solution is acceptable.
- Whether a quality gate exception is justified.
- Whether a defect is caused by requirement ambiguity, AI misuse, missing test design, or review omission.
- Whether an outsourced deliverable satisfies acceptance standards.

## Team Rules

Old employees:

- Act as module owners and reviewers.
- Maintain examples for high-quality SDD specs.
- Review AI-generated designs for core business flows.

New hires, graduates, and contractors:

- Use standard templates without local variation.
- Pair with AI Champions for the first two iterations.
- Start from low-risk stories until their delivery quality is stable.
- Use the lightweight or standard Superpowers flow according to change risk.

Outsourced team:

- Work method is not constrained by the internal Superpowers workflow.
- Deliver against approved SDD specs, interface contracts, test expectations, and acceptance criteria.
- Provide agreed delivery artifacts, test evidence, deployment notes, rollback notes, and change notes.
- Must pass agreed quality gates before acceptance or internal merge.
- Cannot be the final approver for core modules or production-impacting changes.

## Key Takeaways

- Five governance layers — committee, AI Champion, code owner, BA, arbitration — divide decision-making by scope and time horizon.
- BA owns the upstream Requirement → three-reviews → Story flow; without that, downstream "spec ambiguity" defect attributions have nowhere to land.
- Old employees, new hires, contractors, and supplier teams each get rules that match their accountability and learning curve.
- Module ownership is recorded in `CODEOWNERS`; supplier developers may write code for core modules but cannot be the final approver.
- Arbitration exists for the predictable hard calls: did a change affect architecture, was an AI solution acceptable, was a gate exception justified, who caused a defect.

## Next

- [Quality Gates](05-quality-gates.md) — the visible enforcement layer where governance, ownership, and arbitration meet a concrete merge decision.
