# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A documentation-only governance handbook and working kit for AI-assisted agile delivery ("AI-SDD"). There is no application code, no package manager, no build system, and no test framework. Content is Markdown, YAML policies, and a few POSIX shell scripts under `ai-harness/scripts/`.

The audience is delivery owners, architects, tech leads, developers, QA, security leads, AI champions, and supplier teams — not end users of a library. Edits must read as governance prose, not as a project README.

## Top-Level Structure (Why It's Split This Way)

The split is deliberate: prose explains the system, executable assets are kept outside the prose folder so they can be linked into and used in real delivery without dragging the handbook along.

- `docs/ai-sdd-governance/` — the handbook. Two parallel paths: `knowledge/` (concepts, read in numbered order 00 → 12) and `practice/` (delivery flow, read in numbered order 00 → 07). `README.md` is the navigation entry point.
- `templates/` — delivery artifact templates (SDD story spec, ADR, technical spec, test spec, MR evidence, etc.). Referenced from handbook prose via relative links.
- `ai/` — team-level AI policies (engineering constitution, context, security, testing, allowed tools, review checklist). These are the "non-negotiable rules" cited throughout.
- `quality-gates/` — merge/CI/exception policies and the pre-merge checklist.
- `ai-harness/` — lightweight, opt-in harness for Tier B/C internal work: `prompts/`, `policies/` (YAML), `scripts/` (shell), and `reports/` (generated).
- `.gitlab/merge_request_templates/ai-sdd.md` — the MR template that the CI gate policy expects.

## Bilingual Mirror Constraint

Every English document under `docs/ai-sdd-governance/` has a Chinese counterpart under `docs/ai-sdd-governance/zh/` with a matching numbered filename (Chinese filenames use Chinese characters, e.g. `05-质量门禁.md` mirrors `05-quality-gates.md`). The two top-level READMEs (`README.md` and `README.zh.md`) also mirror each other.

When editing handbook content:

- If you change an English doc, update the matching `zh/` doc in the same change, and vice versa. Out-of-sync mirrors are a defect.
- Each doc links to its counterpart on line 3 with `Chinese version:` or `English version:`. Preserve that link when renaming files.
- Templates, policies, quality gates, harness assets, and the MR template are **not** mirrored — they exist once and are linked from both languages.

## Knowledge Path Conventions

The knowledge path (`docs/ai-sdd-governance/knowledge/`) is a curated learning sequence numbered 00 → 12, with deliberate gaps at 03 (Execution Stack) and 11 (Capstone). It is not just a catalogue.

- The numbering is the reading order: 00 Reading Guide → 01 Overview → 02 SDD → 03 Execution Stack → 04 Operating Model → 05 Quality Gates → 06 Testing → 07 Toolchain → 08 Agent Tools → 09 Harness → 10 Metrics → 11 Capstone → 12 Glossary.
- The four-layer **Execution Stack** (SDD + Superpowers + Harness + CI/Review) is the unifying mental model — doc 03 is canonical, and several later docs (05, 06, 09) cross-reference it. Keep these references intact.
- Every concept doc (01-11) ends with `## Key Takeaways` (3-5 bullets) and `## Next` (one-sentence hand-off to the next-numbered doc). When restructuring or renumbering, update both — `Next` text references the destination doc by title.
- Doc 11 (Capstone) walks a single hypothetical Story (Story-1287, refund-approval permission) through every prior doc. If a stage in the Capstone no longer maps to its referenced doc, the Capstone is wrong, not the doc.
- Doc 00 (Reading Guide) lists 7 core terms inline with one-line definitions. Adding new high-frequency vocabulary? Add it here too, then to the [Glossary](docs/ai-sdd-governance/knowledge/12-glossary.md).
- Long docs (currently only 06 Testing and practice 06 Roadmap) split content into a **Learn** front half and a **Reference** back half, with the back half's H2s prefixed `Reference:`. Preserve this pattern if other docs grow past ~300 lines.

## Practice Path Conventions

The practice path (`docs/ai-sdd-governance/practice/`) is a curated operating sequence numbered 00 → 09. Each doc serves a different audience but is held together by two central references.

- The numbering is the reading order: 00 Reading Guide → 01 Team AI SDLC → 02 AI Context Artifact Map → 03 Superpowers Adoption → 04 Developer Guide → 05 Implementation Playbook → 06 Priorities And Roadmap → 07 Rollout And Acceptance → 08 Role × Stage Matrix → 09 BA Guide.
- **Doc 02 (AI Context Artifact Map) is the canonical artifact reference.** Other practice docs defer to it for "what artifact does stage/tier X require?" Do not maintain duplicate Tier × artifact tables elsewhere — link to 02 instead.
- **Doc 08 (Role × Stage Matrix) is the canonical role reference**, sister of doc 02. It enumerates who produces what at each stage. For roles with substantial micro-flows (Developer = 04, BA = 09), doc 08 cells link to the dedicated guide. For other roles the micro-flow lives inline in doc 08. Do not duplicate role-stage tables elsewhere — link to 08.
- **Doc 06 owns the rollout phases; doc 07 owns acceptance.** Doc 06's Phase 0-4 is the canonical 5-phase rollout sequence. Doc 07 verifies each phase via acceptance scenarios and does not maintain its own roadmap.
- Practice docs do **not** re-invent the four-layer execution stack from knowledge/03. Practice/01 maps the stack onto SDLC stages instead of introducing a parallel "AI SDLC architecture."
- GSD and gstack are introduced (with definitions) in practice/01. They are not assumed elsewhere. BMAD is referenced only as an upstream escalation pattern.
- Every practice doc (00-09) ends with `## Key Takeaways` and `## Next`, same convention as knowledge.

## BA Workflow And Requirement Terminology

The handbook explicitly models the upstream client-driven flow: **Requirement → three reviews → Story breakdown → backlog → sprint selection**. This is owned by BA and defined in `practice/09-ba-guide.md`.

- "Requirement" (需求) is a Feature-sized business unit; the [Feature Spec template](templates/feature-spec.md) is used as the Requirement Spec (alias note at the top of that file). Do not create a separate `requirement-spec.md` — reuse `feature-spec.md`.
- The three reviews (Requirements / Technical / Test) share **one** evidence file: [Requirement Review Record](templates/requirement-review-record.md). Don't split into three separate templates.
- Every Story leaving BA's hands passes the [BA Handoff Checklist](templates/ba-handoff-checklist.md) AI-readiness self-test before entering the backlog. The checklist's existence and pass condition is the contract for "Story is ready for AI-assisted execution."
- BA's responsibility surfaces in: `knowledge/04-operating-model.md` § BA Accountability, `practice/02-ai-context-artifact-map.md` S2-S3 sub-flows, `practice/05-implementation-playbook.md` RACI (BA + PO columns), `practice/08-role-stage-matrix.md` BA row, and `practice/09-ba-guide.md` (full workflow).

## Tier Model (Pervasive Vocabulary)

Almost every policy and template branches on **Tier A / Tier B / Tier C** for internal work. When writing or editing content, keep these distinctions accurate:

- Tier A — minimal artifacts, smallest useful set.
- Tier B — Story-level specs, tests, implementation plan, evidence.
- Tier C — full set including technical, security, owner, release, and rollback artifacts; harness execution report expected.

Outsourced/supplier work is governed by deliverable evidence, not by the internal AI workflow, unless the contract says otherwise. Do not require Prompt Cards or Superpowers records from suppliers by default.

## Cross-Linking Rules

The handbook is held together by relative links. The link graph matters more than any single document.

- Use relative paths (e.g. `../../templates/adr.md`, `../../../ai/security-policy.md`) — never absolute paths and never bare filenames.
- When you add a new template under `templates/`, link it from the appropriate stage in `docs/ai-sdd-governance/practice/02-ai-context-artifact-map.md` and from any role entry point in the top-level `README.md` / `docs/ai-sdd-governance/README.md` that should surface it.
- When you add a new handbook doc, add it to the numbered list in both `README.md` and `docs/ai-sdd-governance/README.md` (and the `zh/` mirrors), and renumber siblings if needed.
- The artifact map (`practice/02-ai-context-artifact-map.md`) is the canonical index of which artifact appears at which stage with which trigger level (Must-have / Conditional / Optional). Keep it in sync when artifacts are added, removed, or change criticality.

## Harness Scripts

The only executable code in the repo. POSIX `sh`, designed to run from the repo root. They are starter scripts, not a framework — keep them small and dependency-free.

- `ai-harness/scripts/check-story-ready.sh <file>` — greps for required section markers (`Acceptance Criteria`, `AI Context Boundary`, `Traceability`, `Story ID`). Add a marker here when you add a corresponding required section to the SDD story spec template.
- `ai-harness/scripts/run-verification.sh` — auto-detects `package.json`, `pom.xml`, `build.gradle[.kts]` and runs the matching test command. Skips silently if the tool is missing.
- `ai-harness/scripts/generate-execution-report.sh [run-id]` — writes a templated report to `ai-harness/reports/<run-id>.md`. The report template embedded in this script must stay consistent with `templates/agent-execution-report.md`; if you change one, change the other.

The YAML policies in `ai-harness/policies/` (`context-policy.yaml`, `permissions.yaml`, `verification-policy.yaml`) are the machine-readable counterparts of the prose policies under `ai/`. Keep both forms aligned when rules change.

## Editing Conventions

- Markdown is plain CommonMark with GitHub-flavored tables and Mermaid blocks. No emoji unless the user asks.
- Heading numbering inside docs uses `##`/`###` — only the file's title is `#`.
- Avoid invented numeric thresholds, dates, role names, or acronyms. The glossary (`knowledge/12-glossary.md`) is authoritative for terms.
- Don't add "Common Development Tasks", "Tips", or "Support" sections to handbook docs — keep them prescriptive and structured (Purpose, then numbered/bulleted policy).
- When citing policies in prose, link to the policy file rather than restating it. The non-negotiable rules live in `ai/engineering-constitution.md`.
