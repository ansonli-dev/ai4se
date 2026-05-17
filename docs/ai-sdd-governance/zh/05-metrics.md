# 指标

English version: [../05-metrics.md](../05-metrics.md)

## 指标原则

- 指标用于驱动改进，而不是个人追责。
- 指标关注趋势和团队级流程健康度。
- AI 指标必须和质量指标一起解释。

## 效率指标

Story Cycle Time：

- 定义：从 Story 开始开发到验收完成的时间。
- 用途：衡量交付流效率。

Spec Ready to MR Ready Time：

- 定义：从 SDD Spec 批准到 MR ready for review 的时间。
- 用途：衡量 AI 辅助开发速度。

AI Code Adoption Rate：

- 定义：被接受的 AI 生成或 AI 辅助代码，占 AI 提议代码总量的比例。
- 用途：识别内部团队中有效和低效的 AI 使用方式。

Stories Completed per Developer：

- 定义：每个迭代每名开发者完成并验收的 Story 数。
- 用途：观察 capacity trend，不用于个人排名。

Automation Reuse Rate：

- 定义：通过模板、脚本、生成测试或可复用 prompt 处理的重复工作比例。
- 用途：衡量平台杠杆。

## 质量指标

Defect Escape Rate：

- 定义：验收后发现的缺陷数 / 已验收 Story 总数。

Rework Rate：

- 定义：评审或验收后被 reopened 或实质性变更的 Story 比例。

MR First-Pass Rate：

- 定义：无需重大返工即可通过评审和质量门禁的 MR 比例。

New Code Coverage：

- 定义：新增或变更代码的测试覆盖率。

SonarQube Issue Density：

- 定义：每千行新代码或每个 Story 的新代码问题密度。

Production Issue Source：

- 分类：需求模糊、AI 错误生成、评审遗漏、测试遗漏、集成环境问题、发布操作问题。

## 一致性指标

Spec Template Compliance：

- 定义：必填 SDD 字段完整的 Story / Story 总数。

OpenAPI Coverage：

- 定义：具备 OpenAPI 契约的服务 API / 服务 API 总数。

MR Template Completion：

- 定义：MR 中必填模板部分完整的比例。

Outsourced Deliverable Quality Delta：

- 定义：供应商交付物与内部团队输出在缺陷率、返工率、验收通过率和验收后缺陷率上的差异。

Owner Review Coverage：

- 定义：核心模块变更中由正确 Owner 审批的比例。

## 复盘节奏

每周：

- 复盘交付流、MR 健康度、质量门禁失败和 AI 失败案例。

每两周：

- 复盘模板改进和 Prompt Card 变更。

每月：

- 复盘供应商交付质量、模块 ownership、安全态势和推广进展。

