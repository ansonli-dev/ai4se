# 团队级 AI SDLC 架构

English version: [../14-team-ai-sdlc.md](../14-team-ai-sdlc.md)

## 目的

本章用团队级 AI SDLC 重新组织手册。现有文章内容仍然有效，但读者需要一套更清晰的架构，理解 SDD、Superpowers、GSD-style context engineering、gstack-style product/QA review、CI/CD 和治理之间的关系。

推荐结构：

```text
团队级 AI SDLC
├── Spec / Plan 层
│   ├── Requirements
│   ├── ADR
│   ├── Architecture Constraints
│   └── Implementation Plan
│
├── Execution 层
│   ├── Superpowers: TDD / subagent / review
│   └── GSD: long-running phase execution
│
├── Verification 层
│   ├── Unit / Integration / Contract Test
│   ├── Architecture Fitness Function
│   ├── Security Scan
│   └── gstack-style Browser QA
│
└── Governance 层
    ├── Human approval gate
    ├── PR review
    ├── CI quality gate
    ├── Dependency policy
    └── Release checklist
```

## 核心建议

对已经领取 ready Story card 的敏捷交付团队，默认使用 Superpowers 作为 AI-assisted development workflow。

对大型、长周期、多阶段任务，使用 GSD-style 做 context engineering 和 phase execution。

对产品澄清、设计 review、browser QA、release checklist 和 sprint reflection，选择性吸收 gstack-style 实践。

简化判断：

```text
Story 清楚 -> Superpowers
Story 很大 -> GSD 拆解并维护状态，再由 Superpowers 执行任务
Story 不清楚 -> gstack-style discovery 澄清，再由 Superpowers 执行
```

## 为什么 Story 交付默认选择 Superpowers

Story card ready 后，产品发现应该基本完成。交付团队需要：

1. 理解 acceptance criteria。
2. 分析 impact。
3. 写 implementation plan。
4. 新增或更新 tests。
5. 在 scope 内实现。
6. 按 spec review。
7. 做 code quality review。
8. 用 evidence 打包 MR。

这正是 Superpowers 最匹配的阶段。它是 AI development skill set，而不是完整项目管理系统。它的强项是 planning、TDD、subagent execution、code review、Git worktree、verification 和 finishing a branch。

Superpowers 的 `subagent-driven-development` 尤其相关：每个任务使用 fresh subagent，并进行两阶段 review，先 spec compliance review，再 code quality review。

## GSD 放在哪里

GSD 更像 context engineering + spec-driven long-task execution。

适用：

- 一个 feature 太大，超过普通 Story implementation session。
- 工作需要多个 phase。
- 团队需要跨 session 持久状态。
- context rot 是主要风险。
- 独立任务可以用 fresh executor context 并行执行。

值得采用的 GSD-style 实践：

- 维护结构化项目状态。
- 明确 requirements、roadmap、state 和 phase context。
- 将长任务拆成 phases。
- 用 fresh context 执行独立 plans。
- phase 完成前必须 verify。

企业使用注意：

- 不允许长任务执行引擎绕过 architecture、security、dependency 或 owner review。
- GSD-style execution 必须放在同一套 governance gates 内。

## gstack 放在哪里

gstack 更像 role-based delivery workflow：product framing、plan pressure-testing、engineering review、browser QA、release checks 和 retrospective。

适用：

- Story 还不 ready。
- Product intent 或 UX 不清楚。
- Web 产品需要真实 browser QA。
- 小团队需要轻量 virtual delivery team。
- 团队想加强 pre-merge review 和 release discipline。

值得采用的 gstack-style 实践：

- Story ready 前做 product clarification。
- 实现前做 architecture 和 test review。
- Web 用户路径做 browser QA。
- 合入或部署前做 release checklist。
- 交付后做 retrospective。

企业使用注意：

- Role persona 不能替代真实 Owner、architecture review、security review 或 CI/CD。
- gstack-style commands 是 review aids，不是最终审批权威。

## 工具对比

| Tool | 抽象层级 | 核心问题 | 最适合 | 企业适配 |
| --- | --- | --- | --- | --- |
| Superpowers | AI coding skills 和 workflow skills | 用工程纪律执行 ready work | 日常 Story 交付、既有仓库、有 Git/PR/tests 的团队 | 高 |
| gstack | 角色化虚拟软件团队和交付闭环 | 增加产品、架构、QA、发布和复盘压力 | Founder、产品团队、Web app、早期 workflow | 中，选择性借鉴 |
| GSD | Context engineering 和长任务 spec execution | 避免长时间 AI 工作中的 context rot | 大 feature、多阶段执行、有状态 AI 工作 | 中，需要治理封装 |

## 现有手册如何映射到 AI SDLC

### Spec / Plan 层

目的：

- 将业务意图转为有边界、可评审、可测试的计划。

主要文档：

- [00-executive-summary.md](./00-executive-summary.md)
- [02-sdd-methodology.md](./02-sdd-methodology.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)
- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)

主要模板：

- [SDD Story Spec](../../../templates/sdd-story-spec.md)
- [Technical Spec](../../../templates/technical-spec.md)
- [ADR](../../../templates/adr.md)
- [Test Spec](../../../templates/test-spec.md)
- [Prompt Card](../../../templates/prompt-card.md)

关键规则：

- 在 acceptance criteria、context boundary、impacted artifacts 和 verification expectations 清楚前，Story 不能进入 AI-assisted implementation。

### Execution 层

目的：

- 将计划转为代码、测试、契约和文档，同时控制 scope drift。

主要文档：

- [08-superpowers-adoption.md](./08-superpowers-adoption.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)
- [10-harness-engineering.md](./10-harness-engineering.md)
- [13-agent-tools.md](./13-agent-tools.md)

推荐默认：

- Tier A：lightweight workflow。
- Tier B：Superpowers planning、可行时 TDD、review、verification。
- Tier C：完整 Superpowers workflow、Owner Review、完整 quality gates。
- Long-running feature：GSD-style phase state + Superpowers task execution。

关键规则：

- 执行工具可以不同，但必需工件、review 和 evidence 不变。

### Verification 层

目的：

- 证明实现匹配 spec，且没有引入不可接受风险。

主要文档：

- [04-quality-gates.md](./04-quality-gates.md)
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)
- [10-harness-engineering.md](./10-harness-engineering.md)

主要政策和清单：

- [Quality Gate Checklist](../../../quality-gates/checklist.md)
- [CI Gate Policy](../../../quality-gates/ci-gate-policy.md)
- [Testing Policy](../../../ai/testing-policy.md)
- [Review Checklist](../../../ai/review-checklist.md)

验证实践：

- Unit tests 验证业务规则和边界场景。
- Integration tests 验证跨模块行为。
- Contract tests 验证 API 和 event。
- Architecture fitness functions 验证结构约束。
- Security scans 覆盖 SAST、SCA、secrets 和 dependency risk。
- Web 用户路径使用 gstack-style browser QA。

关键规则：

- 完成必须基于证据。Agent confidence 不是 verification。

### Governance 层

目的：

- 让 AI-assisted delivery 在多团队和供应商场景下保持责任明确、可审计、可控。

主要文档：

- [01-operating-model.md](./01-operating-model.md)
- [03-toolchain.md](./03-toolchain.md)
- [05-metrics.md](./05-metrics.md)
- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)
- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)

主要控制：

- Human approval gate。
- Owner Review。
- PR review。
- CI quality gate。
- Dependency policy。
- Release checklist。
- Supplier deliverable review。
- Weekly AI-SDD review。

关键规则：

- 内部团队可以使用不同 AI workflow tools，供应商也可以使用自己的方法，但验收证据和质量门禁必须一致。

## SDD 与 Superpowers 章节汇总

给交付团队介绍方法时，建议按以下顺序阅读：

1. [02-sdd-methodology.md](./02-sdd-methodology.md)：说明为什么 AI-assisted work 从 approved specs 开始。
2. [08-superpowers-adoption.md](./08-superpowers-adoption.md)：定义 Tier A/B/C，以及何时要求 Superpowers。
3. [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)：说明 Story intake、planning、TDD、artifact updates、review、verification 和 MR completion。
4. [10-harness-engineering.md](./10-harness-engineering.md)：定义 context、tools、permissions、verification 和 evidence 的受控执行环境。
5. [13-agent-tools.md](./13-agent-tools.md)：说明 Claude Code、Codex、Cursor、skills、MCP、plugins、memory 和 hooks 如何进入 workflow。

简版：

- SDD 是 specification layer。
- Superpowers 是 Story ready 后内部默认 execution discipline。
- Harness Engineering 是 execution-control layer。
- Quality Gates 和 CI/CD 是 merge and release control layer。

## 默认团队工作流

```text
Story Card
  -> Story Intake
  -> Tier Classification
  -> SDD / Technical Spec / ADR if required
  -> Implementation Plan
  -> TDD or test strategy
  -> Implementation
  -> Spec Compliance Review
  -> Code Quality Review
  -> Verification Evidence
  -> MR Packaging
  -> Owner / Human Review
  -> CI Quality Gate
  -> Merge / Release / Acceptance
```

## 推荐采用政策

### 日常 Story 开发

默认使用 Superpowers。

用于：

- Story intake。
- Implementation planning。
- TDD 或 test-first behavior changes。
- 独立任务的 subagent execution。
- Spec compliance review。
- Code quality review。
- Verification before completion。

### 复杂 Story 或 Technical Story

使用 GSD-style phase execution + Superpowers。

GSD-style practices 处理：

- Long context。
- Requirements and roadmap state。
- Phase planning。
- Task state。
- Fresh executor context。

Superpowers 处理：

- TDD。
- Task implementation。
- Review。
- Branch finishing。

### 不清楚的 Story

开发前使用 gstack-style discovery。

借鉴：

- Product clarification。
- Design review。
- Architecture and test review。
- Web flow 的 Browser QA。
- Ship checklist。

然后回到 Superpowers 执行实现。

## 来源

- [Superpowers subagent-driven-development](https://github.com/obra/superpowers/blob/main/skills/subagent-driven-development/SKILL.md)
- [gstack](https://gstack.lol/)
- [GSD: Get Shit Done](https://github.com/gsd-build/get-shit-done)

