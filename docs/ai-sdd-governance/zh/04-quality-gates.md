# 质量门禁

English version: [../04-quality-gates.md](../04-quality-gates.md)

## 合入政策

AI 生成或 AI 辅助代码不能直接进入主干。

内部团队的 AI 辅助 MR 按 `08-superpowers-adoption.md` 定义的 Superpowers workflow level 执行。

供应商工作不受内部流程约束。供应商验收基于交付物、测试证据、质量门禁，以及合入内部仓库时的内部 Owner approval。

每个 MR 必须通过：

- 编译或构建检查。
- 单元测试。
- 接口变化时的集成或契约测试。
- 静态分析。
- SonarQube Quality Gate。
- SAST。
- SCA。
- Secret Scan。
- 数据库 schema 变化时的 migration check。
- 核心模块变化时的 Owner approval。
- AI usage declaration。

## 人工评审清单

Reviewer 检查：

- 实现是否匹配批准的 SDD Spec。
- 方案是否引入隐藏范围。
- 边界条件是否覆盖。
- 错误处理是否明确。
- 权限和审计日志是否正确。
- 敏感数据是否未暴露。
- 测试是否验证业务行为，而不仅是 happy path。
- AI 生成代码是否可理解、可维护。

## 质量门禁例外

只有在以下条件满足时允许例外：

- 风险已记录。
- Module Owner 批准。
- Delivery Owner 接受交付影响。
- Follow-up issue 有 owner 和 due date。

以下情况不允许例外：

- Secret 泄漏。
- Critical security vulnerability。
- Broken build。
- 核心模块缺少 Owner approval。
- 缺少到需求或批准规格的追溯。

## 供应商团队规则

供应商团队不要求遵循内部 Superpowers 工作流或内部 AI 使用流程。

验收规则：

- 必须按批准的 SDD Spec 和验收标准交付。
- 必须提供约定测试证据、部署说明、回滚说明和变更说明。
- 验收或内部合入前必须通过约定 build、test、code quality 和 security gates。
- 不能成为核心模块最终审批人。
- 不能修改质量门禁配置。
- 未经明确批准和脱敏，不能访问生产数据。

