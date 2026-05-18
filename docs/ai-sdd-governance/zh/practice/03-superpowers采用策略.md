# Superpowers 采用策略

英文版：[../../practice/03-superpowers-adoption.md](../../practice/03-superpowers-adoption.md)

## 定位

Superpowers 是内部团队默认 AI-SDD 执行工作流。

它本身不是完整企业交付方法论。项目仍依赖 SDD specs、quality gates、owner 评审、CI/CD、安全扫描和验收管理。

供应商团队不要求使用 Superpowers。供应商工作按交付物、测试证据、质量门禁和验收结果接受。

## 为什么内部使用 Superpowers

Superpowers 将自由 AI 使用转化为工程工作流：

- 实现前澄清意图。
- 将需求转为计划。
- 行为变更优先 test-first。
- 对实现任务使用 fresh context。
- 先按 spec 评审，再做 code quality 评审。
- 验证后才声明完成。

这对新员工、毕业生、承包商和混合经验团队尤其有价值。

## Workflow Tiers

### Tier A：轻量变更

适用：

- 文案变更。
- 小配置变更。
- 低风险内部工具。
- 影响面有限的小缺陷修复。

必需流程：

1. 使用轻量 SDD note 或 issue description。
2. 需要时使用 AI 辅助实现。
3. 完成 MR template。
4. 运行相关验证。
5. 获得普通 评审。

Superpowers 使用：

- 推荐：`verification-before-completion`。
- 可选：`brainstorming`、`writing-plans`、`test-driven-development`。

### Tier B：标准 Story

适用：

- 普通业务功能。
- API 变更。
- 数据库变更。
- 跨模块行为。
- 有意义的缺陷修复。

必需流程：

1. 使用 `brainstorming` 或等价 SDD 澄清。
2. 使用 `writing-plans` 形成实现计划。
3. 行为变更在可行时使用 `test-driven-development`。
4. 使用 AI-SDD MR template。
5. 运行 quality gates。
6. 报告完成前使用 `verification-before-completion`。

### Tier C：高风险变更

适用：

- 核心业务流程。
- 权限、客户数据、费用、结算或审计逻辑。
- 生产风险变更。
- 架构决策。
- 需要 模块负责人 approval 的变更。

必需流程：

1. 使用完整 SDD Story 规格 和 技术规格。
2. 架构或重大 tradeoff 需要 ADR。
3. 实现前使用 `writing-plans`。
4. 除非明确豁免，使用 `test-driven-development`。
5. 可拆分任务优先使用 `subagent-driven-development`。
6. 先做 spec compliance 评审，再做 code quality 评审。
7. 要求 模块负责人 approval。
8. 运行完整 quality gates 和 completion verification。

## 内部角色映射

产品负责人 或 BA：

- 使用 SDD templates，可用 `brainstorming` 澄清 Story。

开发人员：

- 使用 `writing-plans`、`test-driven-development` 和 `verification-before-completion`。

技术负责人：

- 评审计划、执行 工作流 tiering，需要时请求 code 评审。

QA：

- 评审 测试规格、验收证据和验证结果。

AI Champion：

- 维护团队示例、Prompt Card 和常见失败案例。
- 辅导新员工、毕业生和承包商。

## 简化规则

- Tier A 不要求完整设计文档。
- 不要求每个轻量变更都有 Prompt Card。
- 紧耦合或小变更不要求 subagents。
- 不把 Superpowers 用作供应商管理机制。
- 不用 AI 指标衡量个人生产率。

## 例外

允许例外：

- 一次性 prototype。
- 只用于学习的 spike。
- 紧急生产 hotfix。
- 后续会被评审和测试的 generated boilerplate。

例外处理：

- 紧急 hotfix 可先修复，并在 24-48 小时内补齐追溯。
- 核心业务、权限、敏感数据和安全变更不能跳过 Owner approval 或 quality gates。

## 要点回顾

- Superpowers 是 [执行栈](../knowledge/03-执行栈.md) 第 2 层的默认内部执行工作流，不是整套交付方法。
- Tier A / B / C 不是随意分的——它们直接映射到哪些 Superpowers skill 变必需、[工件地图](02-ai上下文工件地图.md) 的哪些工件适用。
- 供应商工作不按 Superpowers 衡量；按交付物和质量门禁衡量。
- 例外规则是存在的；"我们什么都要"是错的，"赶时间就跳过 Tier C 控制"也是错的。

## 下一篇

- [开发者指南](04-开发者指南.md)——把这些 Tier 规则落到日常的八步流程，从 Story 接收到已验证 MR。
