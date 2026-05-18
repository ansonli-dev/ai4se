# 团队级 AI SDLC 架构

英文版：[../../practice/01-team-ai-sdlc.md](../../practice/01-team-ai-sdlc.md)

## 目的

本章用团队级 AI SDLC 重新组织手册。SDLC 是 Software Development Life Cycle，即软件开发生命周期，覆盖从想法、需求、设计、实现、测试、发布、运行到持续改进的全过程。现有文章内容仍然有效，但读者需要一套更清晰的架构，理解 SDD、Superpowers、GSD-style context engineering、gstack-style product/QA 评审、CI/CD 和治理之间的关系。

推荐结构：

```text
团队级 AI SDLC
├── 规格 / 计划层
│   ├── Requirements
│   ├── ADR
│   ├── 架构约束
│   └── 实现计划
│
├── 执行层
│   ├── Superpowers: TDD / subagent / 评审
│   └── GSD: long-running phase execution
│
├── 验证层
│   ├── Unit / Integration / Contract Test
│   ├── Architecture Fitness Function
│   ├── Security Scan
│   └── gstack-style Browser QA
│
└── 治理层
    ├── Human approval gate
    ├── PR 评审
    ├── CI quality gate
    ├── Dependency policy
    └── Release checklist
```

## 核心建议

对已经领取 ready Story card 的敏捷交付团队，默认使用 Superpowers 作为 AI-assisted development 工作流。

对大型、长周期、多阶段任务，使用 GSD-style 做 context engineering 和 phase execution。

对产品澄清、设计 评审、browser QA、release checklist 和 sprint reflection，选择性吸收 gstack-style 实践。

简化判断：

```text
Story 清楚 -> Superpowers
Story 很大 -> GSD 拆解并维护状态，再由 Superpowers 执行任务
Story 不清楚 -> gstack-style discovery 澄清，再由 Superpowers 执行
```

## 为什么 Story 交付默认选择 Superpowers

Story card ready 后，产品发现应该基本完成。交付团队需要：

1. 理解 验收标准。
2. 分析 impact。
3. 写 implementation plan。
4. 新增或更新 tests。
5. 在 范围 内实现。
6. 按 spec 评审。
7. 做 code quality 评审。
8. 用 evidence 打包 MR。

这正是 Superpowers 最匹配的阶段。它是 AI development skill set，而不是完整项目管理系统。它的强项是 planning、TDD、subagent execution、code 评审、Git worktree、verification 和 finishing a branch。

Superpowers 的 `subagent-driven-development` 尤其相关：每个任务使用 fresh subagent，并进行两阶段 评审，先 spec compliance 评审，再 code quality 评审。

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

- 不允许长任务执行引擎绕过 architecture、security、dependency 或 owner 评审。
- GSD-style execution 必须放在同一套 governance gates 内。

## gstack 放在哪里

gstack 更像 role-based delivery 工作流：product framing、plan pressure-testing、engineering 评审、browser QA、release checks 和 retrospective。

适用：

- Story 还不 ready。
- Product intent 或 UX 不清楚。
- Web 产品需要真实 browser QA。
- 小团队需要轻量 virtual delivery team。
- 团队想加强 pre-merge 评审 和 release discipline。

值得采用的 gstack-style 实践：

- Story ready 前做 product clarification。
- 实现前做 architecture 和 test 评审。
- Web 用户路径做 browser QA。
- 合入或部署前做 release checklist。
- 交付后做 retrospective。

企业使用注意：

- Role persona 不能替代真实 Owner、architecture 评审、security 评审 或 CI/CD。
- gstack-style commands 是 评审 aids，不是最终审批权威。

## 工具对比

| Tool | 抽象层级 | 核心问题 | 最适合 | 企业适配 |
| --- | --- | --- | --- | --- |
| Superpowers | AI coding skills 和 工作流 skills | 用工程纪律执行 ready work | 日常 Story 交付、既有仓库、有 Git/PR/tests 的团队 | 高 |
| gstack | 角色化虚拟软件团队和交付闭环 | 增加产品、架构、QA、发布和复盘压力 | Founder、产品团队、Web app、早期 工作流 | 中，选择性借鉴 |
| GSD | Context engineering 和长任务 spec execution | 避免长时间 AI 工作中的 context rot | 大 feature、多阶段执行、有状态 AI 工作 | 中，需要治理封装 |

## 现有手册如何映射到 AI SDLC

### 规格 / 计划层

目的：

- 将业务意图转为有边界、可评审、可测试的计划。

主要文档：

- [AI-SDD 总览](../knowledge/01-ai-sdd总览.md)
- [SDD 方法论](../knowledge/02-sdd方法论.md)
- [开发者指南](./04-开发者指南.md)
- [优先级与路线图](./06-优先级与路线图.md)

主要模板：

- [SDD Story 规格](../../../../templates/sdd-story-spec.md)
- [技术规格](../../../../templates/technical-spec.md)
- [ADR](../../../../templates/adr.md)
- [测试规格](../../../../templates/test-spec.md)
- [Prompt Card](../../../../templates/prompt-card.md)

关键规则：

- 在 验收标准、上下文边界、受影响工件 和 验证预期 清楚前，Story 不能进入 AI 辅助实现。

### 执行层

目的：

- 将计划转为代码、测试、契约和文档，同时控制 范围漂移。

主要文档：

- [Superpowers 采用策略](./03-superpowers采用策略.md)
- [开发者指南](./04-开发者指南.md)
- [Harness 工程](../knowledge/09-harness工程.md)
- [Agent 工具](../knowledge/08-agent工具.md)

推荐默认：

- Tier A：轻量工作流。
- Tier B：Superpowers planning、可行时 TDD、评审、verification。
- Tier C：完整 Superpowers 工作流、Owner Review、完整 quality gates。
- Long-running feature：GSD-style phase state + Superpowers task execution。

关键规则：

- 执行工具可以不同，但必需工件、评审 和 evidence 不变。

### 验证层

目的：

- 证明实现匹配 spec，且没有引入不可接受风险。

主要文档：

- [质量门禁](../knowledge/05-质量门禁.md)
- [测试策略](../knowledge/06-测试策略.md)
- [Harness 工程](../knowledge/09-harness工程.md)

主要政策和清单：

- [质量门禁检查清单](../../../../quality-gates/checklist.md)
- [CI 门禁政策](../../../../quality-gates/ci-gate-policy.md)
- [测试政策](../../../../ai/testing-policy.md)
- [Review 检查清单](../../../../ai/review-checklist.md)

验证实践：

- Unit tests 验证业务规则和边界场景。
- Integration tests 验证跨模块行为。
- Contract tests 验证 API 和 event。
- Architecture fitness functions 验证结构约束。
- Security scans 覆盖 SAST、SCA、secrets 和 dependency risk。
- Web 用户路径使用 gstack-style browser QA。

关键规则：

- 完成必须基于证据。Agent confidence 不是 verification。

### 治理层

目的：

- 让 AI-assisted delivery 在多团队和供应商场景下保持责任明确、可审计、可控。

主要文档：

- [运行模型](../knowledge/04-运行模型.md)
- [工具链](../knowledge/07-工具链.md)
- [指标](../knowledge/10-指标.md)
- [推广与验收](./07-推广与验收.md)
- [实施 Playbook](./02-实施playbook.md)
- [优先级与路线图](./06-优先级与路线图.md)

主要控制：

- Human approval gate。
- Owner Review。
- PR 评审。
- CI quality gate。
- Dependency policy。
- Release checklist。
- 供应商交付物评审。
- Weekly AI-SDD 评审。

关键规则：

- 内部团队可以使用不同 AI 工作流 工具，供应商也可以使用自己的方法，但验收证据和质量门禁必须一致。

## SDD 与 Superpowers 章节汇总

给交付团队介绍方法时，建议按以下顺序阅读：

1. [SDD 方法论](../knowledge/02-sdd方法论.md)：说明为什么 AI 辅助工作 从 已批准的规格 开始。
2. [Superpowers 采用策略](./03-superpowers采用策略.md)：定义 Tier A/B/C，以及何时要求 Superpowers。
3. [开发者指南](./04-开发者指南.md)：说明 Story 接收、planning、TDD、artifact updates、评审、verification 和 MR completion。
4. [Harness 工程](../knowledge/09-harness工程.md)：定义 上下文、工具、权限、验证和证据 的受控执行环境。
5. [Agent 工具](../knowledge/08-agent工具.md)：说明 Claude Code、Codex、Cursor、skills、MCP、plugins、memory 和 hooks 如何进入 工作流。

简版：

- SDD 是 specification layer。
- Superpowers 是 Story ready 后内部默认 execution discipline。
- Harness 工程 是 execution-control layer。
- 质量门禁s 和 CI/CD 是 合入与发布控制层。

## 默认团队工作流

```text
Story 卡片
  -> Story Intake
  -> Tier Classification
  -> SDD / 技术规格 / ADR if required
  -> 实现计划
  -> TDD or test strategy
  -> Implementation
  -> Spec Compliance Review
  -> Code Quality Review
  -> 验证证据
  -> MR Packaging
  -> Owner / Human Review
  -> CI 质量门禁
  -> Merge / Release / Acceptance
```

## 推荐采用政策

### 日常 Story 开发

默认使用 Superpowers。

用于：

- Story 接收。
- Implementation planning。
- TDD 或 test-first behavior changes。
- 独立任务的 subagent execution。
- Spec compliance 评审。
- Code quality 评审。
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
- Design 评审。
- Architecture and test 评审。
- Web flow 的 Browser QA。
- Ship checklist。

然后回到 Superpowers 执行实现。

## 来源

- [Superpowers subagent-driven-development](https://github.com/obra/superpowers/blob/main/skills/subagent-driven-development/SKILL.md)
- [gstack](https://gstack.lol/)
- [GSD: Get Shit Done](https://github.com/gsd-build/get-shit-done)
