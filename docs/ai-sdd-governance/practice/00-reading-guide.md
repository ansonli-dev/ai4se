# Practice Reading Guide

Chinese version: [../zh/practice/00-阅读指南.md](../zh/practice/00-阅读指南.md)

## Purpose

This is the first thing to read in the practice path. It hands you a map of how the seven practice docs fit together, in which order each role should read them, and which one is the **central reference** the others all defer to.

By the end of this doc you should know:

- What practice does that knowledge does not.
- Which doc is the canonical answer for "what artifact do I need at stage X?"
- Which doc to read first in your role.
- Where the four-layer Execution Stack from the knowledge path resurfaces.

## What Practice Does That Knowledge Does Not

Knowledge teaches the model. Practice operationalises it. The same four layers from [Execution Stack](../knowledge/03-execution-stack.md) are still in play — SDD, Superpowers, Harness, CI/Review — but now they are stitched into a team's real SDLC stages, attached to concrete artifacts and roles, and rolled out over a real timeline.

If you finished [Capstone](../knowledge/11-capstone.md), you have already seen one Story walked through the stack. Practice gives you the operating manual for doing this every day, at scale, across multiple teams and suppliers.

## The Ten Docs On One Page

```text
00 Reading Guide               ← you are here
01 Team AI SDLC                ← the stack mapped onto SDLC stages; where Superpowers / GSD / gstack fit
02 AI Context Artifact Map     ★ canonical reference: stage × artifact × tier × template
03 Superpowers Adoption        ← Tier A/B/C rules and adoption boundaries
04 Developer Guide             ← daily workflow: Story intake → verified MR
05 Implementation Playbook     ← rollout operations: Week 0, kickoff, RACI, repo setup
06 Priorities And Roadmap      ← P0/P1/P2 classification, 5-phase roadmap, backlogs
07 Rollout And Acceptance      ← acceptance scenarios that prove the rollout is real
08 Role × Stage Matrix         ★ canonical reference: who produces what at each stage
09 BA Guide                    ← BA's deep workflow: Requirement → 3 reviews → Story → close
```

Three structural points to internalise:

- **Doc 02 (AI Context Artifact Map) is the canonical artifact reference.** Every other practice doc points to it for stage × artifact × tier questions.
- **Doc 08 (Role × Stage Matrix) is the canonical role reference.** It is the sister of doc 02 — artifacts vs roles. For deep per-role workflows, doc 08 links to dedicated guides (currently 04 Developer Guide and 09 BA Guide).
- **Doc 06 (Roadmap) is the canonical rollout sequence.** Doc 07 contains acceptance scenarios that verify the rollout from doc 06 actually worked; it does not maintain a separate roadmap.

## Role-Based Reading Orders

After 00, the docs are largely independent and can be re-read by need. First-pass orders by role:

- **First full read (everyone):** 00 → 01 → 02 → 03 → 04 → 08 → 09 → 05 → 06 → 07. Read 08 and 09 immediately after the artifact map to see who produces what; the rest is operations and rollout.
- **Delivery Owner:** 00 → 01 → 08 → 05 → 06 → 07. Skip 03/04/09 unless you also lead engineering or BA work.
- **Architect / Tech Lead:** 00 → 01 → 02 → 03 → 04 → 08, with 06 when planning roadmap. Read 09 to know what the BA owes you.
- **Developer:** 00 → 03 → 04 → 08 (your row), with 02 as a lookup whenever "what artifact do I need?" comes up.
- **BA:** 00 → 02 → **09 (your deep guide)** → 08 (your row) → 05 → 07. The Requirement → three-reviews → Story flow is your home.
- **PO:** 00 → 01 → 09 (read it to know what the BA needs from you) → 08 → 06 → 07.
- **QA:** 00 → 02 → 04 → 08 (your row) → 07, plus [Testing Strategy](../knowledge/06-testing-strategy.md) and [Testing Policy](../../../ai/testing-policy.md).
- **Security Lead:** 00 → 02 → 08 (your row) → 05 → 07, plus [Security Policy](../../../ai/security-policy.md).
- **AI Champion:** 00 → 03 → 04 → 05 → 08 (your row), with 02 as the artifact reference.
- **Module Owner:** 00 → 08 (your row) → 02 (for owned-module artifacts). Mostly a review/approval role.
- **Supplier Lead:** 00 → 01 → 02 (read only the stages that apply to deliverables) → 05 (supplier review section) → 07.

Every doc ends with a **Key Takeaways** block and a **Next** pointer.

## Where The Four-Layer Stack Resurfaces

The [Execution Stack](../knowledge/03-execution-stack.md) layers map onto practice docs as follows. If a practice section feels disconnected from the bigger picture, find the layer here and re-read knowledge/03.

| Layer | Where it lives in practice |
| --- | --- |
| SDD (layer 1) | 02 Artifact Map stages S0-S3; 03 Tier definitions reference SDD Story Spec for Tier B/C; 04 Steps 1-2. |
| Superpowers (layer 2) | 01 (positioning vs GSD/gstack); 03 (Tier rules); 04 (Steps 3-7 — the daily skill loop). |
| Harness (layer 3) | 02 stage S4 (Implementation Evidence Package); 04 Step 4 (verification commands); 05 (minimum repo setup, harness scripts). |
| CI/Review (layer 4) | 02 stages S4-S6 (MR Evidence, Quality Gate Evidence); 04 Steps 6-8; 05 (RACI for approvals); 06 (CI/CD backlog). |
| Cross-cutting governance | 01 (where governance lives in the SDLC); 05 (Week 0, RACI); 06 (roadmap); 07 (acceptance scenarios including supplier acceptance and defect traceability). |

## Vocabulary Carried Forward From Knowledge

Practice assumes you have the knowledge-path vocabulary (SDD, Superpowers, Harness, Tier A/B/C, MR, Owner Review, AI Champion). One practice-specific term you will meet:

- **Context Package** — a named bundle of artifacts handed from one delivery stage to the next so the receiving stage (including AI agents) does not have to guess. Doc 02 lists eight of these (Project, Architecture, Requirement Breakdown, Story, Implementation Evidence, Story Acceptance, Release Readiness, UAT And Feedback).

Two adjacent frameworks introduced in doc 01 (definitions there):

- **GSD** — Get Shit Done. A context engineering and spec-driven long-task execution pattern; used to wrap multi-phase work where context rot is the risk.
- **gstack** — A role-based delivery loop with product framing, design review, browser QA, and release checklist; used selectively for discovery, web QA, and release discipline.

## Key Takeaways

- Practice operationalises the same four-layer stack from knowledge; nothing in practice introduces a new mental model.
- Doc 02 (Artifact Map) is the canonical reference for stage × artifact × tier; other practice docs defer to it.
- Doc 06 owns the roadmap; doc 07 owns acceptance scenarios that verify the roadmap actually shipped.
- Role-based reading orders save time — most readers do not need all seven docs on first pass.

## Next

- [Team AI SDLC](01-team-ai-sdlc.md) — how the execution stack lands in a team's real SDLC stages, and where Superpowers / GSD / gstack each fit.
