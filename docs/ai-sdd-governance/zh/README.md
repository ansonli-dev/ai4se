# AI-SDD 治理导航

English version: [../README.md](../README.md)

本页是治理文章的中文入口，帮助读者快速理解：

- 本项目要建立什么能力。
- 前期需要准备哪些组织、流程、模板和工具。
- 进入正常迭代后，开发人员日常如何工作。
- 哪些内容可以直接通过流程落实，哪些需要 CI/CD、Git hooks、扫描器、dashboard 或平台建设。

## 一句话定位

本项目是一套面向大型敏捷软件交付的 AI-SDD 治理手册。

它不是单纯的 AI 工具说明，也不是单纯的编码规范。它的核心目标是让多团队、多经验层次、承包商和供应商参与的 AI 辅助交付过程保持一致、可审计、可度量、可验收。

## 主流程

```text
业务目标
  -> SDD 规格和验收标准
  -> 内部 AI-SDD 执行流程
  -> Harness 上下文、工具、权限和验证控制
  -> 代码、测试、契约和文档
  -> CI/CD、Owner Review 和质量门禁
  -> 验收、指标、复盘和持续改进
```

## 项目级工作流

1. 建立统一交付方法：从 Story、规格、验收标准和上下文边界开始，而不是从自由 prompt 开始。
2. 建立治理和责任边界：明确谁制定规则、谁负责模块、谁审批高风险变更、供应商如何参与。
3. 建立内部 AI 辅助开发工作流：内部团队使用 Superpowers，把 AI 使用放进澄清、计划、测试、实现、评审和验证节奏。
4. 建立质量门禁和验收体系：内部合入和供应商验收都需要交付物、测试证据、质量门禁和人工审批。
5. 建立指标和持续改进机制：同时观察效率、质量和一致性。
6. 明确优先级和路线图：区分 P0/P1/P2、可直接落实项和基础设施建设项。
7. 明确 Agent 工具：说明 Claude Code、Codex、Cursor、skills、MCP、plugins、memory 和 hooks 如何纳入治理模型。
8. 按团队级 AI SDLC 组织文档：用 Spec / Plan、Execution、Verification、Governance 四层重新串联现有内容。
9. 解释缩写：将 SDLC、SDD、CI/CD、MR、ADR、MCP、SAST、SCA 等集中说明。

## 前期准备

- 任命 AI-SDD Governance Committee。
- 每个内部团队任命 AI Champion。
- 选择试点领域和试点 Story。
- 确认试点模块的 Module Owner。
- 批准 SDD Story Spec、Technical Spec、Test Spec、ADR、Prompt Card 和 MR 模板。
- 配置分支保护、MR 审批规则和基础 CI/CD。
- 明确 AI Context Policy、Security Policy、Allowed Tools 和人工确认点。
- 使用 `ai-harness` 作为轻量执行控制层。

## 开发人员日常流程

1. 做 Story Intake。
2. 判断 Tier A、Tier B 或 Tier C。
3. 确认 Definition of Ready 和实现计划。
4. 按测试纪律开发。
5. 更新必要的契约和交付物。
6. 提交带证据的 MR。
7. 验证后才声明完成。

## 角色阅读路径

- Delivery Owner：阅读 00、01、05、06、12。
- 架构师或 Tech Lead：阅读 02、03、04、10、12。
- 开发人员：阅读 08、09、`ai/engineering-constitution.md`、`ai/context-policy.md`。
- QA：阅读 04、11、`ai/testing-policy.md`、`templates/test-spec.md`。
- 安全负责人：阅读 03、04、`ai/security-policy.md`、`ai/context-policy.md`。
- 供应商负责人：阅读 00、01、04、07、`templates/supplier-scorecard.md`。

## 最小可执行清单

- [ ] 已明确治理角色、AI Champion 和 Module Owner。
- [ ] 已选择一个试点领域和一组试点 Story。
- [ ] 已采用 SDD Story Spec、Technical Spec、Test Spec 和 MR 模板。
- [ ] 已批准 Tier A/B/C 规则。
- [ ] 已定义基础 CI、测试、静态检查和安全扫描计划。
- [ ] 已批准 AI Context Policy 和 Security Policy。
- [ ] 一个内部团队已用 Superpowers 跑通完整 Story。
- [ ] 供应商交付按交付物和测试证据验收。
- [ ] 每周复盘质量门禁失败、AI 失败案例和模板改进点。

## 文档索引

- [00-executive-summary.md](./00-executive-summary.md)：项目目标和默认政策。
- [01-operating-model.md](./01-operating-model.md)：治理层级、角色、节奏和团队规则。
- [02-sdd-methodology.md](./02-sdd-methodology.md)：SDD 流程、DoR、DoD 和工件生命周期。
- [03-toolchain.md](./03-toolchain.md)：企业工具链和 AI 平台架构。
- [04-quality-gates.md](./04-quality-gates.md)：合入门禁、评审政策和供应商验收。
- [05-metrics.md](./05-metrics.md)：效率、质量和一致性指标。
- [06-rollout-and-acceptance.md](./06-rollout-and-acceptance.md)：12 周推广计划和验收场景。
- [07-implementation-playbook.md](./07-implementation-playbook.md)：Week 0、Kickoff、复盘节奏、供应商 review 和 RACI。
- [08-superpowers-adoption.md](./08-superpowers-adoption.md)：内部 Superpowers 采用策略。
- [09-sdd-and-superpowers-developer-guide.md](./09-sdd-and-superpowers-developer-guide.md)：开发者执行指南。
- [10-harness-engineering.md](./10-harness-engineering.md)：AI Harness 控制层、成熟度和推广路径。
- [11-testing-strategy-for-ai-sdd.md](./11-testing-strategy-for-ai-sdd.md)：AI-SDD 测试策略。
- [12-priorities-and-roadmap.md](./12-priorities-and-roadmap.md)：优先级、可直接落实项、基础设施工作和路线图。
- [13-agent-tools.md](./13-agent-tools.md)：Claude Code、Codex、Cursor、agent 能力和工具治理。
- [14-team-ai-sdlc.md](./14-team-ai-sdlc.md)：团队级 AI SDLC 架构和分层文档地图。
- [15-glossary.md](./15-glossary.md)：手册中使用的缩写和术语。
