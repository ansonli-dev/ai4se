# AI-SDD Governance Navigation

这份文档是本治理包的总览入口。它面向第一次进入项目的人，帮助快速回答四个问题：

- 这个项目到底要建立什么能力。
- 前期需要准备哪些组织、流程、模板和工具。
- 进入正常迭代后，开发人员每天按什么方式工作。
- 不同角色应该先看哪些文档、产出哪些交付物。
- 哪些内容可以直接按流程落实，哪些需要额外建设 CI/CD、Git hooks、扫描器、报表或平台能力。

## 一句话定位

本项目是一套面向大型企业售后系统交付的 AI-SDD 研发治理包。

它不是单纯的 AI 工具说明，也不是只给开发人员看的编码规范。它的核心目标是：用 Spec-Driven Development、内部 Superpowers 工作流、轻量 AI Harness、质量门禁和交付证据，把多团队、多角色、多供应商的交付过程变得一致、可审计、可度量、可验收。

## 项目主线

```text
业务目标
  -> SDD 规格和验收标准
  -> 内部 AI-SDD 执行流程
  -> Harness 上下文、工具、权限和验证控制
  -> 代码、测试、契约和文档交付
  -> CI/CD、Owner Review 和质量门禁
  -> 验收、度量、复盘和持续改进
```

这条主线里，几个关键词的关系是：

- SDD 定义要做什么、验收什么。
- Superpowers 定义内部开发人员如何有纪律地执行。
- Harness Engineering 定义 AI 执行时的上下文、工具、权限和证据。
- Quality Gates 定义什么情况下可以合入、发布和验收。
- Metrics 定义如何看趋势、质量和一致性，而不是排名个人。

## 1. 项目层面要做什么

项目层面的工作可以分成五条脉络。

### 1.1 建立统一交付方法

所有重要研发工作从 Story、规格、验收标准和上下文边界开始，而不是从一句自由 prompt 开始。

主要文件：

- [00-executive-summary.md](./00-executive-summary.md)
- [02-sdd-methodology.md](./02-sdd-methodology.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)

核心产出：

- SDD Story Spec
- Technical Spec
- Test Spec
- ADR
- OpenAPI 契约
- Event Schema
- Data Dictionary
- Error Code Registry

### 1.2 建立组织和责任边界

项目需要明确谁定义规则、谁负责模块、谁做最终审批、外包团队如何参与。

主要文件：

- [01-operating-model.md](./01-operating-model.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)

核心机制：

- AI-SDD Governance Committee
- Team AI Champion
- Module Owner
- CODEOWNERS
- Quality Arbitration
- Supplier Review

### 1.3 建立内部 AI 辅助开发工作流

内部团队使用 Superpowers 作为默认 AI-SDD 执行工作流，把 AI 使用纳入澄清、计划、测试、实现、评审和验证的工程节奏。

主要文件：

- [08-superpowers-adoption.md](./08-superpowers-adoption.md)
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)

核心分层：

- Tier A：轻量变更
- Tier B：标准业务 Story
- Tier C：高风险、核心、权限、数据、生产影响或架构变更

### 1.4 建立质量门禁和验收体系

所有内部合入和外包验收都需要围绕交付物、测试证据、质量门禁和人工审批展开。

主要文件：

- [04-quality-gates.md](./04-quality-gates.md)
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)
- [../quality-gates/checklist.md](../../quality-gates/checklist.md)
- [../quality-gates/ci-gate-policy.md](../../quality-gates/ci-gate-policy.md)

核心检查：

- Build
- Unit Test
- Integration 或 Contract Test
- Static Analysis
- SonarQube Quality Gate
- SAST
- SCA
- Secret Scan
- Owner Review
- AI Usage Declaration

### 1.5 建立度量和持续改进机制

项目不只看是否用了 AI，而是同时看效率、质量和一致性。

主要文件：

- [05-metrics.md](./05-metrics.md)
- [templates/weekly-ai-sdd-review.md](../../templates/weekly-ai-sdd-review.md)
- [templates/supplier-scorecard.md](../../templates/supplier-scorecard.md)

核心指标：

- Story Cycle Time
- Spec Ready to MR Ready Time
- Defect Escape Rate
- Rework Rate
- MR First-Pass Rate
- Spec Template Compliance
- OpenAPI Coverage
- Owner Review Coverage
- Outsourced Deliverable Quality Delta

### 1.6 明确优先级和落地路线

完整治理模型不能当成一次性建设清单。上下文管理、Superpowers 使用、Story Intake、MR 声明等可以先按流程方法落地；质量门禁、CI/CD、Git hooks、扫描器、dashboard、服务目录等需要作为基础设施 backlog 单独建设。

主要文件：

- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)

核心分层：

- P0：受控试点必须具备。
- P1：团队扩展应当具备。
- P2：规模化后再投入的平台能力。
- Directly Actionable：可通过流程、模板、评审和培训直接落实。
- Infrastructure Required：需要 CI/CD、仓库配置、hooks、扫描器、脚本、dashboard 或平台建设。

## 2. 前期准备和搭建工作

建议按 Week 0 到试点阶段的顺序推进。

### 2.1 组织准备

- 任命 AI-SDD Governance Committee。
- 每个内部团队任命 1 到 2 名 AI Champion。
- 识别试点业务域和试点 Story。
- 确认试点模块的 Module Owner。
- 确认外包团队的交付边界和验收方式。

参考：

- [01-operating-model.md](./01-operating-model.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)

### 2.2 方法和模板准备

- 批准 SDD Story Spec、Technical Spec、Test Spec 和 ADR 模板。
- 批准 Prompt Card、Agent Execution Report 和 MR 模板。
- 批准 API、事件、数据字典、错误码等契约模板。
- 明确 Tier A、Tier B、Tier C 的使用条件和必需交付物。

参考：

- [02-sdd-methodology.md](./02-sdd-methodology.md)
- [08-superpowers-adoption.md](./08-superpowers-adoption.md)
- [templates/](../../templates/)

### 2.3 仓库和工具链准备

- 配置 GitLab 分支保护和 MR 审批规则。
- 配置 CI/CD 质量门禁。
- 接入 SonarQube、SAST、SCA、Secret Scan。
- 建立 API 契约、测试资产和知识库位置。
- 为应用仓库准备 README、docs/specs、docs/adrs、docs/api、CODEOWNERS 和 MR 模板。

参考：

- [03-toolchain.md](./03-toolchain.md)
- [04-quality-gates.md](./04-quality-gates.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)

### 2.4 AI 使用边界准备

- 明确允许进入 AI 上下文的资料。
- 明确禁止进入 AI 上下文的数据、日志、凭据和供应商内部材料。
- 明确允许工具、禁止操作和人工确认点。
- 明确 AI 产出如何记录、审查和追溯。

参考：

- [../../ai/engineering-constitution.md](../../ai/engineering-constitution.md)
- [../../ai/context-policy.md](../../ai/context-policy.md)
- [../../ai/allowed-tools.md](../../ai/allowed-tools.md)
- [../../ai/security-policy.md](../../ai/security-policy.md)

### 2.5 Harness 准备

- 采用 `/ai/` 下的团队级 AI 工程政策。
- 对 Tier B 和 Tier C 工作要求明确 AI Context Boundary。
- 使用 `ai-harness` 的 prompt、policy 和脚本做轻量执行控制。
- 逐步把 readiness check、verification 和 execution report 接入 CI 或 MR 流程。

参考：

- [10-harness-engineering.md](./10-harness-engineering.md)
- [../../ai-harness/README.md](../../ai-harness/README.md)

### 2.6 优先级和基础设施拆分

准备阶段要避免把所有治理要求都变成同一优先级。

先直接落实：

- Tier A/B/C 分类。
- SDD Story Spec 和 AI Context Boundary。
- Superpowers 内部执行方法。
- MR 模板、AI 使用声明、测试证据和 Owner Review。
- 每周 AI-SDD Review。

作为基础设施建设：

- CI/CD pipeline。
- Branch protection。
- CODEOWNERS 和 MR approval rules。
- SonarQube、SAST、SCA、Secret Scan。
- Pre-commit 或 pre-push hooks。
- Story readiness 和 verification 脚本。
- Metrics dashboard 和 developer portal。

参考：

- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)

## 3. 步入正轨后的开发人员日常

开发人员的日常可以按下面的顺序执行。

### 3.1 Story Intake

收到 Story 后，先确认：

- 业务目标是否清楚。
- 用户角色和主流程是否清楚。
- 验收标准是否可测试。
- 权限、审计、数据、异常流是否明确。
- 影响的 API、事件、数据库字段和集成是否识别。
- Module Owner 是否明确。

不清楚时，不进入实现；先返回澄清。

### 3.2 判断工作等级

- Tier A：小范围、低风险、轻量变更。
- Tier B：普通业务功能、API 变更、数据库变更、跨模块行为、重要缺陷修复。
- Tier C：核心售后流程、权限、客户数据、费用、结算、审计、生产风险或架构决策。

等级决定文档、测试、评审和门禁要求。

### 3.3 做 DoR 和计划

Tier A 可以使用轻量 SDD note 或 MR checklist。

Tier B 和 Tier C 需要：

- 使用 SDD Story Spec 明确行为和验收。
- 使用 Superpowers `brainstorming` 做 DoR 检查。
- 使用 `writing-plans` 或等价方式形成实现计划。
- 明确要改哪些代码、测试、契约和文档。
- 明确验证命令和人工 review 点。

### 3.4 开发和测试

行为变更优先使用测试先行方式。

至少需要做到：

- 新增或更新单元测试。
- 接口变化时更新契约测试。
- 跨服务行为变化时补集成测试。
- 权限、安全、审计、异常流有明确测试证据。
- AI 产出必须由开发者理解、修改、负责。

### 3.5 更新交付物

代码变化可能触发以下文档或契约更新：

- SDD Story Spec
- Technical Spec
- Test Spec
- OpenAPI
- Event Schema
- Data Dictionary
- Error Code Registry
- ADR
- Deployment Notes
- Rollback Notes

代码完成但交付物没有同步更新，不能视为完成。

### 3.6 开 MR 和接受评审

MR 必须说明：

- Requirement ID 和 Story ID。
- 链接的 SDD Story Spec。
- 链接的 Technical Spec 和 Test Spec。
- AI 使用声明。
- 测试证据。
- 风险评估。
- 回滚方案。
- Owner Review，若涉及核心模块或 Tier C 变更。

### 3.7 验证后才完成

开发人员不能基于自信或 AI 的回答声明完成。完成必须基于证据：

- 构建通过。
- 自动化测试通过。
- 静态检查和安全扫描通过。
- 质量门禁通过。
- 人工评审完成。
- 验收证据已记录。

## 4. 不同角色的阅读路径

### 交付负责人

先看：

- [00-executive-summary.md](./00-executive-summary.md)
- [01-operating-model.md](./01-operating-model.md)
- [05-metrics.md](./05-metrics.md)
- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md)

重点关注：

- 治理节奏。
- 团队和外包边界。
- 试点到规模化路线。
- 度量和验收标准。

### 架构师或 Tech Lead

先看：

- [02-sdd-methodology.md](./02-sdd-methodology.md)
- [03-toolchain.md](./03-toolchain.md)
- [04-quality-gates.md](./04-quality-gates.md)
- [10-harness-engineering.md](./10-harness-engineering.md)

重点关注：

- 技术规格和 ADR。
- API、事件、数据、错误码契约。
- Owner Review。
- 工具链和质量门禁固化。

### 开发人员

先看：

- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)
- [08-superpowers-adoption.md](./08-superpowers-adoption.md)
- [../../ai/engineering-constitution.md](../../ai/engineering-constitution.md)
- [../../ai/context-policy.md](../../ai/context-policy.md)

重点关注：

- Story Intake。
- Tier 判断。
- Superpowers 工作步骤。
- 测试、MR、验证和交付物更新。

### QA

先看：

- [04-quality-gates.md](./04-quality-gates.md)
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)
- [../../ai/testing-policy.md](../../ai/testing-policy.md)
- [../../templates/test-spec.md](../../templates/test-spec.md)

重点关注：

- Test Spec。
- 验收标准。
- 测试证据。
- 质量门禁异常。

### 安全负责人

先看：

- [03-toolchain.md](./03-toolchain.md)
- [04-quality-gates.md](./04-quality-gates.md)
- [../../ai/security-policy.md](../../ai/security-policy.md)
- [../../ai/context-policy.md](../../ai/context-policy.md)

重点关注：

- AI 上下文边界。
- 敏感数据和生产日志。
- SAST、SCA、Secret Scan。
- 安全例外审批。

### 外包负责人

先看：

- [00-executive-summary.md](./00-executive-summary.md)
- [01-operating-model.md](./01-operating-model.md)
- [04-quality-gates.md](./04-quality-gates.md)
- [07-implementation-playbook.md](./07-implementation-playbook.md)

重点关注：

- 外包不强制使用内部 Superpowers 流程。
- 外包按规格、交付物、测试证据和验收结果管理。
- 外包不能做核心模块最终审批。
- 质量门禁和 Owner Review 仍然适用。

## 5. 常见场景怎么走

### 新业务 Story

1. Story 拆分并补齐业务目标、角色、流程和验收标准。
2. 编写 SDD Story Spec。
3. 判断是否需要 Technical Spec、ADR、OpenAPI、事件 Schema、数据字典或错误码。
4. 开发人员按 Tier B 或 Tier C 执行。
5. MR 提交测试证据、AI 使用声明、风险和回滚。
6. 通过质量门禁和人工评审后验收。

### 小缺陷或配置修改

1. 判断是否属于 Tier A。
2. 使用轻量 Story note 或 MR checklist。
3. 实现并运行聚焦验证。
4. 完成 MR 模板。
5. 正常 Review 后合入。

### 核心接口变更

1. 使用完整 SDD Story Spec。
2. 编写 Technical Spec。
3. 更新 OpenAPI。
4. 分析调用方影响。
5. 增加契约测试和必要集成测试。
6. 获取 Module Owner 审批。
7. 通过完整质量门禁。

### 外包交付验收

1. 提供批准后的 SDD Spec 和接口契约。
2. 外包团队按自身方式实现。
3. 外包提交代码或包、测试证据、部署说明、回滚说明和变更说明。
4. 内部执行质量门禁。
5. 核心模块由内部 Owner 最终审批。
6. 按供应商质量评分记录结果。

### AI 生成代码出现问题

1. 先判断问题来源：规格不清、上下文错误、工具限制、环境失败、测试缺失、AI 实现错误或评审遗漏。
2. 更新 SDD、Prompt Card、测试或 Harness 政策。
3. 在每周 AI-SDD Review 中记录失败案例和改进动作。

## 6. 12 周落地路径

### Phase 1：试点，Weeks 1-4

目标是验证流程能跑通，不急着追求生产率提升。

完成：

- 选择一个中等复杂度售后领域。
- 一个内部团队采用 Superpowers。
- 模板、MR、质量门禁和初始指标可用。
- 跑通一个从 SDD 到 MR 到验收的完整 Story。

### Phase 2：扩展，Weeks 5-8

目标是让 SDD 和内部 AI-SDD 工作流成为默认方式。

完成：

- 扩展到三个团队。
- 建立批准后的知识库、API 契约库和测试资产库。
- 接入 SonarQube、SCA、Secret Scan 和制品库。
- 开始每周 AI-SDD 质量复盘。

### Phase 3：规模化，Weeks 9-12

目标是从流程 adoption 进入可度量的交付系统。

完成：

- 建立服务目录。
- 建立 Module Owner registry。
- 建立依赖地图。
- 建立 AI 使用、质量和一致性 dashboard。
- 建立供应商质量 scorecard。

参考：

- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md)

## 7. 最小可执行清单

如果只能先做最小版本，建议从下面这些开始：

- [ ] 任命治理委员会、AI Champion 和 Module Owner。
- [ ] 选定一个试点业务域和一组试点 Story。
- [ ] 启用 SDD Story Spec、Technical Spec、Test Spec 和 MR 模板。
- [ ] 明确 Tier A、Tier B、Tier C。
- [ ] 配置基础 CI、测试、静态检查和安全扫描。
- [ ] 明确 AI Context Policy 和 Security Policy。
- [ ] 内部团队用 Superpowers 跑通一个完整 Story。
- [ ] 外包交付按统一交付物和测试证据验收。
- [ ] 每周复盘质量门禁失败、AI 失败案例和模板改进点。

## 8. 目录速查

- [00-executive-summary.md](./00-executive-summary.md)：项目目标和默认政策。
- [01-operating-model.md](./01-operating-model.md)：组织、角色、治理节奏和团队规则。
- [02-sdd-methodology.md](./02-sdd-methodology.md)：SDD 流程、DoR、DoD 和工件生命周期。
- [03-toolchain.md](./03-toolchain.md)：企业级工具链和 AI 平台架构。
- [04-quality-gates.md](./04-quality-gates.md)：合入门禁、人工评审和外包验收规则。
- [05-metrics.md](./05-metrics.md)：效率、质量和一致性指标。
- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md)：12 周落地计划和验收场景。
- [07-implementation-playbook.md](./07-implementation-playbook.md)：Week 0、Kickoff、周会、供应商 review 和 RACI。
- [08-superpowers-adoption.md](./08-superpowers-adoption.md)：内部 Superpowers 分层采用策略。
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)：开发者日常执行指南。
- [10-harness-engineering.md](./10-harness-engineering.md)：AI Harness 的控制层、成熟度和 rollout。
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)：AI-SDD 测试策略。
- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)：优先级、must-have/nice-to-have、直接落地项和基础设施建设路线图。
- [../../ai/](../../ai/)：团队级 AI 工程政策。
- [../../ai-harness/](../../ai-harness/)：轻量 Harness prompt、policy、script 和 report。
- [../../templates/](../../templates/)：可复用模板。
- [../../quality-gates/](../../quality-gates/)：质量门禁清单和例外申请。
