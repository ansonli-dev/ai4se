# AI-SDD 交付治理手册

English version: [README.md](README.md)

本仓库是一套面向大型项目敏捷软件交付的 AI 辅助研发治理手册。它帮助交付负责人、架构师、Tech Lead、QA、安全负责人、内部开发者、AI Champion 和供应商管理者，在提升交付效率的同时，保持质量、责任归属和审计能力。

## 如何阅读

先把这个仓库当作一本书阅读，再把它当作资料库查阅。

建议顺序：

1. 先阅读本入口，理解整体故事。
2. 按自己的角色选择阅读路径。
3. 真正执行时再使用模板、政策和检查清单。
4. 在规划落地时，把流程方法和基础设施建设分开。

## 核心思想

AI 辅助开发不应该从自由 prompt 开始。

在本治理模型中，AI 工作从经过评审的规格、受控上下文、明确人工责任、质量门禁和可验证验收证据开始。

```text
业务目标
  -> SDD 规格和验收标准
  -> 内部 AI-SDD 执行流程
  -> 上下文、工具、权限和验证控制
  -> 代码、测试、契约和文档
  -> CI/CD、Owner Review 和质量门禁
  -> 验收、指标、复盘和持续改进
```

本项目由五层组成：

- SDD 定义要做什么，以及如何验收。
- Superpowers 定义内部团队如何有纪律地执行 AI 辅助开发。
- Harness Engineering 控制 AI 上下文、工具、权限、验证和证据。
- Quality Gates 定义合入、发布或验收前必须满足的条件。
- Metrics 用于观察效率、质量和一致性是否同步改善。

## 这本手册不是什么

它不是单纯的 AI 工具指南。

它也不要求每个团队立刻建设完整 AI 平台。有些内容可以通过流程、模板、评审和培训先落地；另一些内容需要真正的工程建设，例如 CI/CD、Git hooks、扫描器、仓库规则、dashboard 和 service catalog。

落地时需要区分：

- Must-have 和 nice-to-have。
- 可直接落实的流程变化和需要基础设施建设的工作。
- 内部团队工作流和供应商验收规则。
- 手工试点纪律和平台化自动化能力。

优先阅读：[优先级与路线图](docs/ai-sdd-governance/zh/12-priorities-and-roadmap.md)。

## 按角色阅读

### Delivery Owner

先读：

- [执行摘要](docs/ai-sdd-governance/zh/00-executive-summary.md)
- [运行模型](docs/ai-sdd-governance/zh/01-operating-model.md)
- [优先级与路线图](docs/ai-sdd-governance/zh/12-priorities-and-roadmap.md)
- [推广与验收](docs/ai-sdd-governance/zh/06-rollout-and-acceptance.md)
- [指标](docs/ai-sdd-governance/zh/05-metrics.md)

关注治理模型、试点范围、优先级、内部与供应商边界、推广阶段和验收标准。

### 架构师或 Tech Lead

先读：

- [SDD 方法论](docs/ai-sdd-governance/zh/02-sdd-methodology.md)
- [工具链](docs/ai-sdd-governance/zh/03-toolchain.md)
- [质量门禁](docs/ai-sdd-governance/zh/04-quality-gates.md)
- [Harness Engineering](docs/ai-sdd-governance/zh/10-harness-engineering.md)
- [优先级与路线图](docs/ai-sdd-governance/zh/12-priorities-and-roadmap.md)

关注规格驱动交付、架构决策、仓库和 CI/CD 基线、Owner Review，以及 API、事件、数据和错误码契约。

### 开发人员

先读：

- [SDD 与 Superpowers 开发者指南](docs/ai-sdd-governance/zh/09-sdd-and-superpowers-developer-guide.md)
- [Superpowers 采用策略](docs/ai-sdd-governance/zh/08-superpowers-adoption.md)
- [AI Engineering Constitution](ai/engineering-constitution.md)
- [AI Context Policy](ai/context-policy.md)
- [Testing Policy](ai/testing-policy.md)

关注 Story Intake、Tier A/B/C 分类、Superpowers 工作流、AI Context Boundary、测试、MR 证据、评审和验证。

### QA

先读：

- [质量门禁](docs/ai-sdd-governance/zh/04-quality-gates.md)
- [AI-SDD 测试策略](docs/ai-sdd-governance/zh/11-testing-strategy-for-ai-sdd.md)
- [Testing Policy](ai/testing-policy.md)
- [Test Spec Template](templates/test-spec.md)
- [Quality Gate Checklist](quality-gates/checklist.md)

关注测试证据、验收标准、契约测试、集成测试、质量门禁例外和缺陷追溯。

### 安全负责人

先读：

- [工具链](docs/ai-sdd-governance/zh/03-toolchain.md)
- [质量门禁](docs/ai-sdd-governance/zh/04-quality-gates.md)
- [Security Policy](ai/security-policy.md)
- [AI Context Policy](ai/context-policy.md)
- [Allowed Tools](ai/allowed-tools.md)

关注敏感数据边界、Secret 处理、生产日志和客户数据、SAST、SCA、Secret Scan，以及安全例外。

### AI Champion

先读：

- [Superpowers 采用策略](docs/ai-sdd-governance/zh/08-superpowers-adoption.md)
- [SDD 与 Superpowers 开发者指南](docs/ai-sdd-governance/zh/09-sdd-and-superpowers-developer-guide.md)
- [Harness Engineering](docs/ai-sdd-governance/zh/10-harness-engineering.md)
- [Prompt Card Template](templates/prompt-card.md)
- [Weekly AI-SDD Review Template](templates/weekly-ai-sdd-review.md)

关注辅导内部开发者、维护示例、记录 AI 失败案例、改进 Prompt Card 和工作流说明。

### 供应商交付负责人

先读：

- [执行摘要](docs/ai-sdd-governance/zh/00-executive-summary.md)
- [运行模型](docs/ai-sdd-governance/zh/01-operating-model.md)
- [质量门禁](docs/ai-sdd-governance/zh/04-quality-gates.md)
- [实施 Playbook](docs/ai-sdd-governance/zh/07-implementation-playbook.md)
- [Supplier Scorecard Template](templates/supplier-scorecard.md)

关注交付物、测试证据、验收规则、部署说明、回滚说明、变更说明，以及核心模块的内部 Owner 审批。

## 手册结构

- Part I：为什么需要 AI-SDD
- Part II：组织如何运转
- Part III：开发工作如何发生
- Part IV：质量与基础设施如何落地
- Part V：如何分阶段推广
- Part VI：模板、政策和检查清单

中文治理文章入口：[docs/ai-sdd-governance/zh/README.md](docs/ai-sdd-governance/zh/README.md)

## Must-Have / Should-Have / Nice-To-Have

### 受控试点的 Must-Have

- 清晰的试点范围。
- 明确的治理角色、AI Champion 和 Module Owner。
- Tier A/B/C 分类。
- Tier B/C 使用 SDD Story Spec。
- AI Context Boundary。
- 内部 Tier B/C 使用 Superpowers 工作流。
- MR 模板包含 AI 使用和证据。
- 核心模块需要 Owner Review。
- 最小构建和单元测试验证。
- 试点仓库具备分支保护和最小 CI。

### 团队扩展的 Should-Have

- Technical Spec、Test Spec 和 ADR 按触发条件使用。
- 核心模块具备 CODEOWNERS。
- Static Analysis。
- Secret Scan。
- SCA。
- SonarQube Quality Gate。
- 接口变更具备 Contract Test。
- Story readiness script。
- Verification script。
- Tier B/C 使用 Execution Report。
- 每周质量复盘。

### 规模化后的 Nice-To-Have

- 完整 Developer Portal。
- 自动化 dashboards。
- 平台级 AI Context Service。
- Tool Gateway 和 Permission Service。
- AI Run Trace Store。
- 自动化 Supplier Scorecard。
- AI 输出评估平台。

## 可以立即落实的内容

- 每个 Story 使用 Tier A/B/C 分类。
- Tier B/C 要求 SDD Story Spec。
- Tier B/C 要求 AI Context Boundary。
- 内部 Tier B/C 使用 Superpowers 工作流。
- 使用 AI-SDD MR 模板。
- 使用 AI 时声明 AI Usage。
- MR 中提供测试证据。
- 核心模块要求 Module Owner approval。
- 每周进行 AI-SDD Review。

## 需要工程建设的内容

- CI/CD build 和 test pipeline。
- Branch protection。
- CODEOWNERS 和 MR approval rules。
- Pre-commit 或 pre-push hooks。
- SonarQube Quality Gate。
- SAST。
- SCA。
- Secret Scan。
- Contract test automation。
- 针对仓库适配 Story readiness 和 verification scripts。
- Metrics dashboard。
- Developer portal 和 service catalog。

## 快速索引

- [中文治理导航](docs/ai-sdd-governance/zh/README.md)
- [执行摘要](docs/ai-sdd-governance/zh/00-executive-summary.md)
- [运行模型](docs/ai-sdd-governance/zh/01-operating-model.md)
- [SDD 方法论](docs/ai-sdd-governance/zh/02-sdd-methodology.md)
- [工具链](docs/ai-sdd-governance/zh/03-toolchain.md)
- [质量门禁](docs/ai-sdd-governance/zh/04-quality-gates.md)
- [指标](docs/ai-sdd-governance/zh/05-metrics.md)
- [推广与验收](docs/ai-sdd-governance/zh/06-rollout-and-acceptance.md)
- [实施 Playbook](docs/ai-sdd-governance/zh/07-implementation-playbook.md)
- [Superpowers 采用策略](docs/ai-sdd-governance/zh/08-superpowers-adoption.md)
- [开发者指南](docs/ai-sdd-governance/zh/09-sdd-and-superpowers-developer-guide.md)
- [Harness Engineering](docs/ai-sdd-governance/zh/10-harness-engineering.md)
- [AI-SDD 测试策略](docs/ai-sdd-governance/zh/11-testing-strategy-for-ai-sdd.md)
- [优先级与路线图](docs/ai-sdd-governance/zh/12-priorities-and-roadmap.md)
