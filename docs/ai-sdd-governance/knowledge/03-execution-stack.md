# The Execution Stack

Chinese version: [../zh/knowledge/03-执行栈.md](../zh/knowledge/03-执行栈.md)

## Purpose

The [Reading Guide](00-reading-guide.md) introduced the four-layer execution stack as a one-glance diagram. This doc is the layer-by-layer treatment. Every later doc — Operating Model, Quality Gates, Testing Strategy, Toolchain, Agent Tools, Harness Engineering, Metrics — drops into one or more of these four layers. Knowing the stack changes how you read the rest.

By the end of this doc you should be able to:

- Name the four layers in order and the one question each layer answers.
- Recognise which layer a policy or template belongs to.
- See why none of the four layers can be skipped, and why none of them does the job of another.

## The Stack

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

The stack is read top-down for any new piece of work, and bottom-up when something goes wrong (a defect in production triggers a CI/Review look, then a Harness look, then a Superpowers look, then an SDD look — until the missing layer is found).

## Layer 1: SDD — The Specification Layer

**Question this layer answers:** What behavior must exist, and how will we know it works?

**Why this layer is first:** AI-assisted work that starts from a free-form prompt invents business rules. A reviewed spec stops that at the source. The spec is what makes AI output reviewable by people who were not in the room when it was generated.

**What lives in this layer:**

- Story card, SDD Story Spec, Technical Spec, ADR, Test Spec.
- Acceptance criteria in Given/When/Then.
- API contracts (OpenAPI), event schemas (JSON Schema), data dictionary entries, error code registry entries.
- AI Context Boundary: which documents, APIs, code, and tests the agent is allowed to see.

**Failure mode without this layer:** AI generates plausible-looking code from vague intent. Reviewers cannot tell whether the output matches the actual business requirement because no one wrote down what the requirement was.

**Read more:** [SDD Methodology](02-sdd-methodology.md).

## Layer 2: Superpowers — The Execution Discipline Layer

**Question this layer answers:** How does the developer-plus-agent move from a ready Story to a verified MR?

**What Superpowers is:** Superpowers is a composable skills framework and software development methodology for coding agents. It packages execution discipline as named skills: `brainstorming`, `writing-plans`, `test-driven-development`, `subagent-driven-development`, `requesting-code-review`, `receiving-code-review`, `systematic-debugging`, `verification-before-completion`. In this handbook, Superpowers is the **default internal developer workflow** after a Story card is ready. Suppliers are not required to use Superpowers unless contractually agreed.

Official repository: https://github.com/obra/superpowers

**Why this layer matters even with good specs:** Most defects after a ready Story are execution defects, not spec defects. Developers start coding before clarifying. AI agents invent fields and edge cases. Implementation plans stay implicit. Tests get written after the code they should have constrained. Review happens too late. Completion gets claimed before verification.

**What lives in this layer:**

- The Superpowers skill library and the team's chosen subset.
- Prompt Cards: versioned, reviewed prompts that encode an execution step.
- The Tier A / B / C decision — which weight of workflow this Story warrants.
- The plan that an agent commits to before editing files.
- The TDD loop, the subagent split for separable work, the explicit code-review request.

**Failure mode without this layer:** AI generates working-looking code without a plan, with too much mocking, without tests that would fail for the wrong implementation, and the developer accepts review feedback blindly. The MR passes the gates but the next iteration finds the defect.

**Read more:** [Superpowers Adoption](../practice/03-superpowers-adoption.md), [Developer Guide](../practice/04-developer-guide.md), [Agent Tools](08-agent-tools.md).

## Layer 3: Harness — The Controlled Runtime Layer

**Question this layer answers:** What context, tools, and permissions does the agent get, and how is its completion claim turned into evidence?

**What a harness is:** The harness is the execution-control layer around the agent. It is broader than a test harness and more concrete than prompt engineering. It defines: which artifacts must be present before execution starts; what context the agent may read and what it may not; what files it may edit, what commands it may run, and what requires human confirmation; what verification must pass before completion is claimed; what gets recorded in the execution report.

**Why this layer matters even with good specs and good execution discipline:** Without a harness, every developer's controls drift. One agent gets the right context, another gets none. One agent runs migrations, another is blocked. One MR has an execution report, another has a transcript. Failure attribution becomes "the agent didn't work" — which is not actionable.

**What lives in this layer:**

- The AI Engineering Constitution and the four `/ai/` policies (context, allowed-tools, security, testing).
- The `/ai-harness/` policies (`context-policy.yaml`, `permissions.yaml`, `verification-policy.yaml`).
- The harness scripts: `check-story-ready.sh`, `run-verification.sh`, `generate-execution-report.sh`.
- The Agent Execution Report attached to MRs for Tier B/C work.
- Failure attribution categories: spec ambiguity, missing/wrong context, tool/permission issue, environment issue, test failure, agent error, review gap.

**Failure mode without this layer:** Completion is declared on agent confidence. Production data leaks into prompts. The MR passes review because nobody noticed the agent edited a forbidden path. When something fails, the team cannot tell whether the spec, the context, the tools, or the agent was at fault — so they cannot improve any of them.

**Read more:** [Harness Engineering](09-harness-engineering.md), [Agent Tools](08-agent-tools.md).

## Layer 4: CI/CD + Review — The Gate Layer

**Question this layer answers:** Who approves, what blocks merge, and what proves the change is safe to release?

**Why this layer is last and indispensable:** The three layers above are about producing trustworthy output. This layer is about not merging untrustworthy output regardless of where it came from — internal team, supplier team, or pure-human work. CI/Review is also the layer that supplier work is accepted through when the supplier does not run the internal Superpowers/Harness flow.

**What lives in this layer:**

- The CI pipeline stages: validate metadata, build, unit test, static analysis, contract test, integration test, security scan, package.
- The Quality Gate Checklist and Stop-the-Line conditions.
- SonarQube, SAST, SCA, Secret Scan, migration check.
- Owner Review and CODEOWNERS.
- The MR template (`/.gitlab/merge_request_templates/ai-sdd.md`) and AI usage declaration.
- Exception handling with explicit risk, owner, and expiration date.

**Failure mode without this layer:** Code that passed every internal control still merges with a secret in it, or with no owner approval on a core module, or with a critical CVE in a new dependency. The first three layers are necessary; this one is the safety net that catches anything they missed.

**Read more:** [Quality Gates](05-quality-gates.md), [CI Gate Policy](../../../quality-gates/ci-gate-policy.md).

## What Sits Across The Stack

Not everything is a layer. Some elements are cross-cutting — they apply to every layer or to the system as a whole.

| Cross-cutting element | What it does | Relevant doc |
| --- | --- | --- |
| Operating Model | Decides who owns each layer, how disputes are arbitrated, how roles divide work. | [Operating Model](04-operating-model.md) |
| Testing Strategy | Defines what tests are produced at every layer and how AI-specific test risks are countered. | [Testing Strategy](06-testing-strategy.md) |
| Toolchain | The enterprise tools (Jira, GitLab, SonarQube, Backstage, AI platform) that host the layers. | [Toolchain](07-toolchain.md) |
| Metrics | The feedback loop that tells you whether the stack is actually improving delivery. | [Metrics](10-metrics.md) |

## How To Recognise A Layer Confusion

A surprising amount of well-meant change introduces failures at the wrong layer. Quick test: if a proposal does not name the layer it changes, ask.

- "Let's add more reviewers" — layer 4. Will not fix bad specs (layer 1) or weak verification (layer 3).
- "Let's write better prompts" — usually layer 2, sometimes layer 3. Will not fix missing acceptance criteria (layer 1) or absent owner approval (layer 4).
- "Let's give the agent more context" — layer 3. Will not fix an ambiguous spec (layer 1).
- "Let's require a regression test" — layer 1 (Test Spec) and layer 4 (gate enforces it).
- "Let's quarantine the flaky test" — layer 4 to keep main green, but the real fix is in layer 2 (TDD discipline) and layer 3 (test harness control).

A change applied at the wrong layer can look like progress while leaving the real failure mode untouched.

## Bottom-Up Diagnosis

When a defect escapes to production, walk the stack bottom-up to find which layer let it through:

1. CI/Review: was the gate skipped or exception-approved? Was Owner Review missing?
2. Harness: was context wrong or missing? Did the agent run with the wrong permissions? Was the execution report incomplete?
3. Superpowers: was the plan written? Was TDD applied? Was code review requested before merge?
4. SDD: was the acceptance criterion missing or ambiguous? Was the API contract or error code registry out of date?

The first "yes" up the stack is the layer that needs the next iteration's investment. The Defect Attribution template at [`templates/defect-attribution.md`](../../../templates/defect-attribution.md) records this analysis.

## Key Takeaways

- Four layers — SDD, Superpowers, Harness, CI/Review — each owns one question and one failure mode.
- Operating Model, Testing, Toolchain, and Metrics are cross-cutting, not extra layers.
- Most changes that "don't work" are changes applied at the wrong layer.
- Production defects are diagnosed by walking the stack bottom-up until a layer says "yes, that slipped through me."

## Next

- [Operating Model](04-operating-model.md) — who owns each layer, how decisions get made, how disputes are arbitrated.
