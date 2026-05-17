# Operating Model

Chinese version: [../zh/knowledge/03-运行模型.md](../zh/knowledge/03-运行模型.md)

## Governance Layers

The delivery program uses four governance layers.

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

## 4. Quality Arbitration

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
