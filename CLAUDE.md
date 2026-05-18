# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A documentation-only governance handbook and working kit for AI-assisted agile delivery ("AI-SDD"). There is no application code, no package manager, no build system, and no test framework. Content is Markdown, YAML policies, and a few POSIX shell scripts under `ai-harness/scripts/`.

The audience is delivery owners, architects, tech leads, developers, QA, security leads, AI champions, and supplier teams — not end users of a library. Edits must read as governance prose, not as a project README.

## Top-Level Structure (Why It's Split This Way)

The split is deliberate: prose explains the system, executable assets are kept outside the prose folder so they can be linked into and used in real delivery without dragging the handbook along.

- `docs/ai-sdd-governance/` — the handbook. Two parallel paths: `knowledge/` (concepts, read in numbered order 00 → 12) and `practice/` (delivery flow, run in numbered order). `README.md` is the navigation entry point.
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
- Long docs (currently only 06 Testing) split content into a **Learn** front half and a **Reference** back half, with the back half's H2s prefixed `Reference:`. Preserve this pattern if other docs grow past ~300 lines.

## Tier Model (Pervasive Vocabulary)

Almost every policy and template branches on **Tier A / Tier B / Tier C** for internal work. When writing or editing content, keep these distinctions accurate:

- Tier A — minimal artifacts, smallest useful set.
- Tier B — Story-level specs, tests, implementation plan, evidence.
- Tier C — full set including technical, security, owner, release, and rollback artifacts; harness execution report expected.

Outsourced/supplier work is governed by deliverable evidence, not by the internal AI workflow, unless the contract says otherwise. Do not require Prompt Cards or Superpowers records from suppliers by default.

## Cross-Linking Rules

The handbook is held together by relative links. The link graph matters more than any single document.

- Use relative paths (e.g. `../../templates/adr.md`, `../../../ai/security-policy.md`) — never absolute paths and never bare filenames.
- When you add a new template under `templates/`, link it from the appropriate stage in `docs/ai-sdd-governance/practice/05-ai-context-artifact-map.md` and from any role entry point in the top-level `README.md` / `docs/ai-sdd-governance/README.md` that should surface it.
- When you add a new handbook doc, add it to the numbered list in both `README.md` and `docs/ai-sdd-governance/README.md` (and the `zh/` mirrors), and renumber siblings if needed.
- The artifact map (`practice/05-...`) is the canonical index of which artifact appears at which stage with which trigger level (Must-have / Conditional / Optional). Keep it in sync when artifacts are added, removed, or change criticality.

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
