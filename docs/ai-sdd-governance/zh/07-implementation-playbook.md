# 实施 Playbook

English version: [../07-implementation-playbook.md](../07-implementation-playbook.md)

## Week 0 准备

试点开始前完成：

- 任命 AI-SDD Governance Committee。
- 每个参与内部团队任命一名 AI Champion。
- 识别试点领域和试点 Story。
- 确认试点模块 Owner。
- 批准初始 SDD、Technical Spec、Test Spec、Prompt Card 和 MR 模板。
- 批准轻量、标准和高风险变更的 Superpowers workflow tiers。
- 配置仓库分支保护和 MR approval rules。
- 配置必需 CI/CD quality gates。
- 确认批准的 AI 工具和上下文来源。

## Kickoff Agenda

90 分钟试点 kickoff：

1. Delivery Owner 说明目标和边界。
2. Architect 说明 SDD 和技术治理。
3. QA Lead 说明测试证据和质量门禁。
4. Security Lead 说明 AI 数据边界和审计规则。
5. AI Champion 演示一个从 spec 到 MR 的完整内部 Story。
6. Team Lead 确认试点 Story 和 Owner。

## Pilot Story Package

每个试点 Story package 包含：

- SDD Story Spec。
- 当架构、API、数据、权限或集成受影响时提供 Technical Spec。
- Test Spec。
- 适用时提供 API contract 或 event schema。
- Prompt Card。
- MR template。
- Acceptance checklist。

供应商交付包包含批准的 SDD Spec、接口契约、测试证据、部署说明、回滚说明和验收清单；不要求 Prompt Card 或 Superpowers 记录。

## 每周 AI-SDD Review Agenda

1. 复盘交付流指标。
2. 复盘质量门禁失败。
3. 复盘 AI 生成缺陷或 near miss。
4. 适用时复盘供应商交付质量。
5. 复盘模板问题和改进请求。
6. 确认行动、Owner 和 due date。

## Supplier Review Agenda

每月供应商 review：

- 工件完整性。
- 验收通过率。
- 交付评审后的缺陷率和返工率。
- Owner review findings。
- 质量门禁通过率。
- 部署说明、回滚说明和变更说明完整性。
- 下月改进行动。

## 最小仓库设置

每个应用仓库建议包含：

- `README.md`
- `docs/specs/`
- `docs/adrs/`
- `docs/api/`
- `docs/data-dictionary.md`
- `docs/error-code-registry.md`
- `.gitlab/merge_request_templates/ai-sdd.md`
- `CODEOWNERS`
- CI/CD pipeline definition

## RACI Matrix

原英文文档中的 RACI 表定义了 Delivery Owner、Architect、QA Lead、Security Lead、Team Lead、AI Champion、Module Owner 和 Supplier Lead 在治理政策、模板、Story Spec、架构决策、测试策略、安全例外、核心模块变更和周度指标复盘中的 R/A/C 关系。

说明：

- R：Responsible。
- A：Accountable。
- C：Consulted。

