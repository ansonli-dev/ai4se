# AI-SDD 交付治理手册

English version: [README.md](README.md)

本仓库是一套面向 AI 辅助敏捷软件交付的治理手册和工作套件。它帮助交付负责人、架构师、Tech Lead、开发人员、QA、安全负责人、AI Champion 和供应商团队，在提升效率的同时保持质量、责任归属、证据和审计能力。

## 如何使用这个仓库

先把它当作手册阅读，再把它当作工作套件使用。

1. 从治理导航开始：[docs/ai-sdd-governance/zh/README.md](docs/ai-sdd-governance/zh/README.md)。
2. 通过知识路径理解概念。
3. 通过实践路径执行交付工作。
4. 只有在具体交付步骤需要时，再使用模板、政策、检查清单和 harness 脚本。

## 主体结构

- [治理手册](docs/ai-sdd-governance/zh/README.md)：中文主入口，拆分为知识路径和实践路径。
- [English governance handbook](docs/ai-sdd-governance/README.md)：与中文保持一致的英文结构。
- [模板](templates/)：规格、ADR、计划、证据、发布说明和供应商评分等交付工件。
- [AI 政策](ai/)：团队级 AI 工程、上下文、安全、工具、测试和评审政策。
- [质量门禁](quality-gates/)：合入、CI、例外和验收控制。
- [AI Harness](ai-harness/README.md)：用于受控 AI agent 执行的轻量 prompt、policy YAML 和脚本。

## 知识路径

按照更容易学习和理解的顺序阅读：

1. [AI-SDD 总览](docs/ai-sdd-governance/zh/knowledge/01-ai-sdd总览.md)
2. [SDD 方法论](docs/ai-sdd-governance/zh/knowledge/02-sdd方法论.md)
3. [运行模型](docs/ai-sdd-governance/zh/knowledge/03-运行模型.md)
4. [质量门禁](docs/ai-sdd-governance/zh/knowledge/04-质量门禁.md)
5. [测试策略](docs/ai-sdd-governance/zh/knowledge/05-测试策略.md)
6. [工具链](docs/ai-sdd-governance/zh/knowledge/06-工具链.md)
7. [Agent 工具](docs/ai-sdd-governance/zh/knowledge/07-agent工具.md)
8. [Harness Engineering](docs/ai-sdd-governance/zh/knowledge/08-harness工程.md)
9. [指标](docs/ai-sdd-governance/zh/knowledge/09-指标.md)
10. [术语表](docs/ai-sdd-governance/zh/knowledge/10-术语表.md)

## 实践路径

按照开发流程和角色执行工作：

1. [团队级 AI SDLC](docs/ai-sdd-governance/zh/practice/01-团队级ai-sdlc.md)
2. [实施 Playbook](docs/ai-sdd-governance/zh/practice/02-实施playbook.md)
3. [Superpowers 采用策略](docs/ai-sdd-governance/zh/practice/03-superpowers采用策略.md)
4. [开发者指南](docs/ai-sdd-governance/zh/practice/04-开发者指南.md)
5. [AI 上下文工件地图](docs/ai-sdd-governance/zh/practice/05-ai上下文工件地图.md)
6. [优先级与路线图](docs/ai-sdd-governance/zh/practice/06-优先级与路线图.md)
7. [推广与验收](docs/ai-sdd-governance/zh/practice/07-推广与验收.md)

## 按角色进入

- Delivery Owner：先读 [AI-SDD 总览](docs/ai-sdd-governance/zh/knowledge/01-ai-sdd总览.md)、[运行模型](docs/ai-sdd-governance/zh/knowledge/03-运行模型.md)、[优先级与路线图](docs/ai-sdd-governance/zh/practice/06-优先级与路线图.md)、[推广与验收](docs/ai-sdd-governance/zh/practice/07-推广与验收.md)。
- 架构师或 Tech Lead：先读 [SDD 方法论](docs/ai-sdd-governance/zh/knowledge/02-sdd方法论.md)、[质量门禁](docs/ai-sdd-governance/zh/knowledge/04-质量门禁.md)、[工具链](docs/ai-sdd-governance/zh/knowledge/06-工具链.md)、[Agent 工具](docs/ai-sdd-governance/zh/knowledge/07-agent工具.md)、[团队级 AI SDLC](docs/ai-sdd-governance/zh/practice/01-团队级ai-sdlc.md)。
- 开发人员：先读 [开发者指南](docs/ai-sdd-governance/zh/practice/04-开发者指南.md)、[Superpowers 采用策略](docs/ai-sdd-governance/zh/practice/03-superpowers采用策略.md)、[AI Engineering Constitution](ai/engineering-constitution.md)、[AI Context Policy](ai/context-policy.md)。
- QA：先读 [测试策略](docs/ai-sdd-governance/zh/knowledge/05-测试策略.md)、[质量门禁](docs/ai-sdd-governance/zh/knowledge/04-质量门禁.md)、[Testing Policy](ai/testing-policy.md)、[Quality Gate Checklist](quality-gates/checklist.md)。
- 安全负责人：先读 [工具链](docs/ai-sdd-governance/zh/knowledge/06-工具链.md)、[质量门禁](docs/ai-sdd-governance/zh/knowledge/04-质量门禁.md)、[Security Policy](ai/security-policy.md)、[Allowed Tools](ai/allowed-tools.md)。
- AI Champion：先读 [Superpowers 采用策略](docs/ai-sdd-governance/zh/practice/03-superpowers采用策略.md)、[开发者指南](docs/ai-sdd-governance/zh/practice/04-开发者指南.md)、[Harness Engineering](docs/ai-sdd-governance/zh/knowledge/08-harness工程.md)、[Weekly AI-SDD Review](templates/weekly-ai-sdd-review.md)。
- 供应商交付负责人：先读 [AI-SDD 总览](docs/ai-sdd-governance/zh/knowledge/01-ai-sdd总览.md)、[运行模型](docs/ai-sdd-governance/zh/knowledge/03-运行模型.md)、[质量门禁](docs/ai-sdd-governance/zh/knowledge/04-质量门禁.md)、[实施 Playbook](docs/ai-sdd-governance/zh/practice/02-实施playbook.md)、[Supplier Scorecard](templates/supplier-scorecard.md)。
