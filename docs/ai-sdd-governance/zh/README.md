# AI-SDD 治理导航

英文版：[../README.md](../README.md)

这是 AI-SDD 治理手册的中文主入口。手册分成两条路径：

- **知识路径：** 按易于学习和理解的顺序掌握概念。
- **实践路径：** 按开发流程、角色、工件和推广阶段执行工作。

可执行资产保留在本目录之外：模板在 [../../../templates/](../../../templates/)，政策在 [../../../ai/](../../../ai/)，质量门禁在 [../../../quality-gates/](../../../quality-gates/)，harness 资产在 [../../../ai-harness/](../../../ai-harness/)。

## 一句话定位

AI-SDD 是一种 AI 辅助软件交付治理模型：工作从经过评审的规格、受控上下文、明确人工责任、质量门禁和可验证验收证据开始。

## 主交付流程

```text
业务目标
  -> SDD 规格和验收标准
  -> 内部 AI-SDD 执行流程
  -> 上下文、工具、权限和验证控制
  -> 代码、测试、契约和文档
  -> CI/CD、Owner Review 和质量门禁
  -> 验收、指标、复盘和持续改进
```

## 知识路径

学习模型时建议按顺序阅读：

1. [AI-SDD 总览](knowledge/01-ai-sdd总览.md)：交付背景、治理方式和默认政策。
2. [SDD 方法论](knowledge/02-sdd方法论.md)：为什么 AI 辅助交付要从规格、就绪条件和验收开始。
3. [运行模型](knowledge/03-运行模型.md)：治理层级、责任归属、仲裁和团队规则。
4. [质量门禁](knowledge/04-质量门禁.md)：合入政策、人工评审、例外和供应商验收。
5. [测试策略](knowledge/05-测试策略.md)：AI-SDD 工作的测试策略。
6. [工具链](knowledge/06-工具链.md)：企业工具链和 AI 平台架构。
7. [Agent 工具](knowledge/07-agent工具.md)：Claude Code、Codex、Cursor、skills、MCP、plugins、memory、hooks 和工具治理。
8. [Harness 工程](knowledge/08-harness工程.md)：受控上下文、工具、权限、验证和证据。
9. [指标](knowledge/09-指标.md)：效率、质量、一致性和复盘节奏。
10. [术语表](knowledge/10-术语表.md)：手册中的术语和缩写。

## 实践路径

执行真实交付工作时使用：

1. [团队级 AI SDLC](practice/01-团队级ai-sdlc.md)：连接 SDD、Superpowers、agent、验证和治理的团队级架构。
2. [实施 Playbook](practice/02-实施playbook.md)：Week 0 准备、Kickoff、复盘节奏、供应商评审、最小仓库设置和 RACI。
3. [Superpowers 采用策略](practice/03-superpowers采用策略.md)：内部 Tier A/B/C 工作流规则和采用边界。
4. [开发者指南](practice/04-开发者指南.md)：从 Story 接收 到 已验证 MR 的开发者工作流。
5. [AI 上下文工件地图](practice/05-ai上下文工件地图.md)：按阶段说明 AI 上下文交接所需工件。
6. [优先级与路线图](practice/06-优先级与路线图.md)：必需、应具备、可选增强、可直接落实项和基础设施 待办列表。
7. [推广与验收](practice/07-推广与验收.md)：12 周推广模型和验收场景。

## 角色路径

- 交付负责人：[AI-SDD 总览](knowledge/01-ai-sdd总览.md)、[运行模型](knowledge/03-运行模型.md)、[优先级与路线图](practice/06-优先级与路线图.md)、[推广与验收](practice/07-推广与验收.md)、[指标](knowledge/09-指标.md)。
- 架构师或技术负责人：[SDD 方法论](knowledge/02-sdd方法论.md)、[质量门禁](knowledge/04-质量门禁.md)、[工具链](knowledge/06-工具链.md)、[Agent 工具](knowledge/07-agent工具.md)、[团队级 AI SDLC](practice/01-团队级ai-sdlc.md)。
- 开发人员：[开发者指南](practice/04-开发者指南.md)、[Superpowers 采用策略](practice/03-superpowers采用策略.md)、[AI 工程宪章](../../../ai/engineering-constitution.md)、[AI 上下文政策](../../../ai/context-policy.md)、[测试政策](../../../ai/testing-policy.md)。
- QA：[测试策略](knowledge/05-测试策略.md)、[质量门禁](knowledge/04-质量门禁.md)、[测试政策](../../../ai/testing-policy.md)、[测试规格模板](../../../templates/test-spec.md)、[质量门禁检查清单](../../../quality-gates/checklist.md)。
- 安全负责人：[工具链](knowledge/06-工具链.md)、[质量门禁](knowledge/04-质量门禁.md)、[安全政策](../../../ai/security-policy.md)、[AI 上下文政策](../../../ai/context-policy.md)、[允许工具](../../../ai/allowed-tools.md)。
- AI Champion：[Superpowers 采用策略](practice/03-superpowers采用策略.md)、[开发者指南](practice/04-开发者指南.md)、[Harness 工程](knowledge/08-harness工程.md)、[Prompt Card 模板](../../../templates/prompt-card.md)、[每周 AI-SDD 复盘](../../../templates/weekly-ai-sdd-review.md)。
- 供应商交付负责人：[AI-SDD 总览](knowledge/01-ai-sdd总览.md)、[运行模型](knowledge/03-运行模型.md)、[质量门禁](knowledge/04-质量门禁.md)、[实施 Playbook](practice/02-实施playbook.md)、[供应商评分卡](../../../templates/supplier-scorecard.md)。

## 最小可执行清单

- [ ] 已明确治理角色、AI Champion 和 模块负责人。
- [ ] 已选择试点范围和试点 Story。
- [ ] 已批准 SDD Story 规格、技术规格、测试规格 和 MR 模板。
- [ ] 已批准 Tier A/B/C 规则。
- [ ] 已定义基础 CI、测试、静态检查和安全扫描计划。
- [ ] 已批准 AI 上下文政策 和 安全政策。
- [ ] 一个内部团队已用 Superpowers 跑通完整 Story。
- [ ] 供应商交付按交付物和测试证据验收。
- [ ] 每周复盘质量门禁失败、AI 失败案例和模板改进点。
