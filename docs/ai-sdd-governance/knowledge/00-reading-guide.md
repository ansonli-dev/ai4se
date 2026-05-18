# Reading Guide

Chinese version: [../zh/knowledge/00-阅读指南.md](../zh/knowledge/00-阅读指南.md)

## Purpose

This is the first thing to read in the knowledge path. By the end of doc 11, you will:

- Understand what AI-SDD governance is and the problems it prevents.
- Carry one shared mental model — the **four-layer execution stack** — that the other ten docs all map onto.
- Know the small vocabulary the rest of the handbook assumes (Tier, SDD, Superpowers, MR, Owner Review, AI Champion, Harness).
- Be ready to move from concepts (knowledge path) to running real delivery work (practice path).

This doc does not replace the others. It frames them.

## The Four-Layer Execution Stack

Everything in this handbook fits one mental model. AI-assisted delivery is built as four cooperating layers, each with its own failure mode and its own controls.

```text
Business goal / Product intent
        ↓
1. SDD layer            — what to build and how it will be accepted
        ↓
2. Superpowers layer    — disciplined execution workflow inside the agent
        ↓
3. Harness layer        — controlled context, tools, permissions, verification, trace
        ↓
4. CI/CD + Review layer — automated gates and human owner approval before merge
        ↓
Acceptance, metrics, retrospective → feedback into the next iteration
```

What each layer answers:

| Layer | Answers | Without it, you get |
| --- | --- | --- |
| SDD | "What behavior is required and how do we know it works?" | AI invents business rules and edge cases. |
| Superpowers | "How does the developer-plus-agent move from a ready Story to a verified MR?" | Implicit, unreviewable execution; tests written after code. |
| Harness | "What context, tools, and permissions does the agent get, and how is completion proven?" | Uncontrolled context, risky commands, completion declared without evidence. |
| CI/CD + Review | "Who approves, what blocks merge, what proves the change is safe to release?" | Defects, scope creep, and unowned changes leak to production. |

The full layer-by-layer treatment is in [Execution Stack](03-execution-stack.md). Read this diagram first; the four layers reappear throughout the rest of the path.

## How The 13 Docs Map To The Stack

```text
00 Reading Guide          ← you are here
01 AI-SDD Overview        ← context for the whole stack
02 SDD Methodology        ← layer 1
03 Execution Stack        ← the stack itself
04 Operating Model        ← cross-cutting: governance and ownership
05 Quality Gates          ← layer 4
06 Testing Strategy       ← cross-cutting: how tests serve every layer
07 Toolchain              ← cross-cutting: enterprise tools that host the stack
08 Agent Tools            ← layer 2 + layer 3, agent capability detail
09 Harness Engineering    ← layer 3 in depth
10 Metrics                ← feedback loop measuring the stack
11 Capstone               ← one Story walked through all four layers
12 Glossary               ← reference, consult anytime
```

## Core Vocabulary You Will Meet Immediately

These terms appear in doc 01 onward. Inline definitions below; full entries in [Glossary](12-glossary.md).

- **SDD** — Spec-Driven Development. Work starts from a reviewed specification, not a free-form prompt.
- **Superpowers** — A composable skills framework and execution methodology for coding agents. In this handbook, it is the default internal developer workflow after a Story is ready. Concept introduced in [Execution Stack](03-execution-stack.md); applied in [Developer Guide](../practice/04-developer-guide.md).
- **Harness** — The controlled execution environment around an AI agent: context boundary, allowed tools, permissions, verification commands, execution evidence.
- **Tier A / B / C** — Risk-graded workflow weight for internal work. Tier A is lightweight; Tier B is the standard Story flow; Tier C is high-risk / core / production-impacting / security-sensitive. Defined in [Superpowers Adoption](../practice/03-superpowers-adoption.md).
- **MR** — Merge Request. GitLab-style request to merge code; equivalent to PR.
- **Owner Review** — Approval by the accountable module owner for changes affecting domain behavior, contracts, permissions, or production risk.
- **AI Champion** — A team member who coaches AI-SDD usage, maintains examples, and collects failure cases.

If a term feels unfamiliar later, jump to the glossary — it is short and acronym-first.

## How To Read This Path

Read 00 → 03 in order. They build the shared mental model and the vocabulary. After that, the docs are largely independent and can be revisited by need:

- **First full read (everyone):** 00 → 01 → 02 → 03 → 04 → 05 → 06 → 07 → 08 → 09 → 10 → 11. Capstone (11) makes the prior ten click into place.
- **Delivery Owner:** 00 → 01 → 03 → 04 → 05 → 10 → 11.
- **Architect / Tech Lead:** 00 → 02 → 03 → 05 → 07 → 08 → 09 → 11.
- **Developer:** 00 → 02 → 03 → 06 → 08 → 09 → 11, then jump to [Developer Guide](../practice/04-developer-guide.md).
- **BA:** 00 → 02 → 04 → 11, then jump to [BA Guide](../practice/09-ba-guide.md). BA work centres on layer 1 (SDD), so docs 02 and 04 are the most directly applicable.
- **PO:** 00 → 01 → 02 → 04 → 11, then read [BA Guide](../practice/09-ba-guide.md) to know what the BA owes you and vice versa.
- **QA:** 00 → 02 → 05 → 06 → 11, then jump to [Testing Policy](../../../ai/testing-policy.md).
- **Security Lead:** 00 → 03 → 05 → 07 → 09 → 11, then jump to [Security Policy](../../../ai/security-policy.md).
- **AI Champion:** 00 → 03 → 06 → 08 → 09 → 11, then jump to [Superpowers Adoption](../practice/03-superpowers-adoption.md).
- **Supplier Lead:** 00 → 01 → 04 → 05 → 11. The internal Superpowers / Harness details (03, 08, 09) are not required reading for supplier teams unless contractually agreed.

Each doc ends with a **Key Takeaways** block and a **Next** pointer. If you finish a doc and the takeaways do not match what you remember, re-read the doc rather than moving on — the next doc assumes those takeaways.

## Where This Path Ends, And Where Practice Begins

Knowledge teaches the model. [Practice](../practice/) runs delivery work through it.

When you finish doc 11, the natural next step is one of:

1. [Team AI SDLC](../practice/01-team-ai-sdlc.md) — see the same four layers wired into a team's actual SDLC.
2. [Implementation Playbook](../practice/05-implementation-playbook.md) — Week 0, kickoff, review cadence, minimum repo setup.
3. [Developer Guide](../practice/04-developer-guide.md) — what a developer does day-to-day after a Story is ready.

## Key Takeaways

- The handbook rests on one mental model: SDD → Superpowers → Harness → CI/Review.
- The numbered order of the knowledge path is a learning sequence, not just a catalogue.
- Seven terms unlock most of the prose; the glossary covers the rest.
- Knowledge ends at doc 11; the next move is into the Practice path.

## Next

- [AI-SDD Overview](01-ai-sdd-overview.md) — the delivery context, default policy, and what this governance prevents.
