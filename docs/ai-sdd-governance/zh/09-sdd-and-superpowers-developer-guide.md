# SDD 与 Superpowers 开发者指南

English version: [../09-sdd-and-superpowers-developer-guide.md](../09-sdd-and-superpowers-developer-guide.md)

## 目的

本指南说明本项目中 Spec-Driven Development 的含义、相关 SDD 方法、Superpowers 的定位，以及开发人员收到 Story card 后应如何使用它。

本指南适用于内部开发团队。除非供应商合同明确约定，供应商团队不要求使用 Superpowers；供应商工作按交付物、测试证据、质量门禁和验收结果接受。

## 什么是 SDD

SDD 表示 Spec-Driven Development。

在 AI 辅助开发中，SDD 意味着团队不从“实现这个功能”这类自由 prompt 开始，而是先用结构化规格描述预期行为、约束、接口、验收标准和风险，再让 AI Agent 基于规格工作。

SDD 将开发中心从 code-first 转为 spec-first：

- Story card 定义业务结果。
- Spec 定义必须存在的行为和验收方式。
- Technical design 定义实现如何融入系统。
- Tasks 定义实现步骤。
- Tests 和 quality gates 证明实现匹配规格。

目的不是为了写文档，而是让人与 AI Agent 有足够共享上下文，减少误解、失控扩展、不一致输出和不可评审代码。

## 相关方法

GitHub Spec Kit：

- 将 specification 放在 AI 辅助软件开发中心。
- 核心流程是 Spec -> Plan -> Tasks -> Implement。
- 适合希望获得完整默认 SDD 结构和 agent-neutral commands 的团队。

Kiro Specs：

- 在 Kiro 中将想法转为 requirements、design 和 tasks。
- 适合使用 Kiro 作为开发环境的团队。

BMAD：

- AI 辅助敏捷框架，具备更强 product、architecture 和 review 角色。
- 适合作为复杂、模糊、跨域或高风险工作的升级路径。
- 本项目中 BMAD 不是默认开发者工作流。

Superpowers：

- 面向 coding agents 的 composable skills framework 和软件开发方法。
- 关注执行纪律：brainstorming、planning、TDD、debugging、review、subagent-driven development 和 verification。
- 本项目中，Superpowers 是 Story ready 后内部开发者的默认执行工作流。

本项目模板：

- 本治理包定义 SDD Story Spec、Technical Spec、Test Spec、Prompt Card、ADR、data dictionary、API contract、event schema 和 quality gates。
- 这些模板是项目级契约，工具和框架必须支持它们，而不是未经批准替代它们。

## 为什么推荐 Superpowers

Story 分配后，大多数开发问题是执行问题：

- 开发者未澄清需求就开始编码。
- AI Agent 发明字段、API、边界场景或业务规则。
- 实现计划是隐性的，难以评审。
- 测试在代码后补，错过真实行为。
- Review 太晚发生。
- 未验证就声明完成。

Superpowers 针对这些失败模式：

- `brainstorming` 检查 Story 是否真的 ready。
- `writing-plans` 将 Story 转为实现步骤。
- `test-driven-development` 鼓励行为优先测试。
- `subagent-driven-development` 适合可拆分任务和 fresh context。
- `requesting-code-review` 在问题扩大前进行聚焦评审。
- `receiving-code-review` 避免盲目接受 review feedback。
- `systematic-debugging` 强制根因分析。
- `verification-before-completion` 防止未验证完成声明。

## 收到 Story 后如何使用

### Step 1：Story Intake

检查：

- 业务目标是否清楚。
- 验收标准是否可测试。
- 权限、审计、数据和异常流是否清楚。
- 受影响 API、事件、数据库字段或集成是否识别。
- Module Owner 是否已知。
- 这是 Tier A、Tier B 还是 Tier C。

如果 Story 不清楚，不开始实现；返回澄清或用 `brainstorming` 产出具体问题。

### Step 2：用 Brainstorming 做 DoR 检查

在开发团队中，`brainstorming` 不是完整产品发现过程，而是 Definition of Ready 检查。

确认：

- 要构建什么行为。
- 什么不在范围内。
- 哪些验收标准重要。
- 涉及哪些接口、数据、权限和错误场景。
- 是否需要 Technical Spec 或 ADR。

### Step 3：写实现计划

Tier B 和 Tier C 使用 `writing-plans`。

计划应识别：

- 可能修改的文件或模块。
- 需要新增或更新的测试。
- 需要更新的 API、事件、数据或错误码工件。
- 实现步骤。
- 验证命令。
- 评审检查点。

### Step 4：按测试纪律开发

行为变更在可行时使用 TDD：

1. 为一个行为写失败测试。
2. 运行测试并确认失败原因符合预期。
3. 写最小实现让测试通过。
4. 运行测试确认通过。
5. 测试通过后再 refactor。
6. 对下一个行为重复。

如果 TDD 不现实，需要说明原因，并提供等价测试证据。

### Step 5：更新必要工件

适用时更新：

- SDD Story Spec。
- Technical Spec。
- Test Spec。
- OpenAPI contract。
- Event schema。
- Data dictionary。
- Error code registry。
- ADR。
- Deployment notes。
- Rollback notes。

代码变了但相关契约或文档没更新，不能视为完成。

### Step 6：请求 Review

普通变更：

- 人工 Reviewer 检查业务行为、代码质量和测试。

Tier C 或可拆分多任务：

- 先做 spec compliance review。
- 再做 code quality review。

Spec compliance review 关注是否构建了请求内容、是否遗漏、是否超范围、是否误解 spec。

Code quality review 关注可维护性、边界、职责、边界场景、测试、安全、性能和生产风险。

### Step 7：完成前验证

使用 `verification-before-completion`。

运行相关命令：

- Build 或 compilation。
- Unit tests。
- Contract tests。
- Integration tests。
- Static analysis。
- Security scans。
- 必要的 manual acceptance checks。

不能基于信心声明完成，只能基于新鲜证据声明完成。

### Step 8：完成 MR

MR 必须包含：

- Requirement ID 和 Story ID。
- 链接的 SDD Story Spec。
- 需要时链接 Technical Spec。
- 链接 Test Spec。
- 内部 AI 辅助工作中的 AI usage declaration。
- Test evidence。
- Risk assessment。
- Rollback plan。
- 核心模块的 Owner approval。

## 按 Tier 的必需工件

- Tier A：Story card、轻量 SDD note、必要测试证据、AI usage declaration、普通 review。
- Tier B：Story card、SDD Story Spec、必要 Technical Spec、Implementation Plan、Test Spec、相关契约、验证证据。
- Tier C：完整 SDD Story Spec、Technical Spec、必要 ADR、完整测试和契约、Owner approval、完整质量门禁和验证证据。

## Story 何时完成

只有所有适用条件满足时才完成：

- 验收标准已实现。
- 没有未经批准的范围扩展。
- 必需测试通过。
- 必需质量门禁通过。
- 必需工件已更新。
- API、事件、数据和错误码变更已记录。
- AI 使用已声明。
- Review comments 已解决。
- 需要时有 Module Owner approval。
- 生产影响变更有 rollback 或 recovery plan。
- 验证证据已链接。
- 需要时有产品、QA 或业务验收记录。

一句话：Story 完成意味着行为可用、证据证明、工件一致、责任评审人已接受。

