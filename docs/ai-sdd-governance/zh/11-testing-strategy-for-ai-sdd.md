# AI-SDD 测试策略

English version: [../11-testing-strategy-for-ai-sdd.md](../11-testing-strategy-for-ai-sdd.md)

## 目的

本文总结 Martin Fowler 测试材料中的关键思想，并将其适配到 AI-assisted development、SDD、Superpowers 和轻量 Harness Engineering。

核心观点：

> AI 生成代码的速度可能快于团队安全理解代码的速度。测试必须成为团队对系统的可执行理解，而不仅是编码后的安全网。

## 1. Self-Testing Code 是基础

Self-testing code 表示代码库能通过自动化测试检查自身行为。

对 AI 辅助团队，这很重要，因为 AI 生成代码可能看起来合理但实际错误。Self-testing code 提供快速反馈：

- 新行为是否可用。
- 既有行为是否破坏。
- 团队是否能安全改设计。
- Reviewer 是否能相信证据而不是文字摘要。

测试不只是 QA 活动，也是工程设计、评审和交付的一部分。

## 2. Test Pyramid 是启发，不是法律

Test pyramid 表示团队通常需要大量聚焦快速测试，以及少量宽泛、慢、脆弱的测试。

本项目的实际解释：

- 多数业务规则检查放在 unit 或 component tests。
- 服务协作放在 contract 和 integration tests。
- 关键用户旅程用少量 end-to-end tests。
- 避免在每一层重复相同断言。

金字塔是成本和反馈模型，不是固定形状。

## 3. Acceptance Tests 证明功能，但不能替代底层测试

Acceptance tests 从用户或业务视角确认功能是否工作。

它们应与 SDD acceptance criteria 绑定，但不应是唯一自动化测试。如果 acceptance test 暴露缺陷，应在修复前增加更聚焦的 regression test，让缺陷在正确层级被固定。

## 4. Contract Tests 对服务边界很重要

大型企业系统中，许多失败发生在边界：

- API shape mismatch。
- Response field meaning mismatch。
- Event schema drift。
- Consumer expectation 未被 provider tests 捕获。
- Backward compatibility break。

Contract tests 通过让 provider 和 consumer expectations 可执行来降低风险。

典型适用：

- 核心业务服务。
- 工作流和审批服务。
- 库存或资源服务。
- 计费、费用或结算服务。
- 通知服务。
- 外部企业集成。

## 5. Test Doubles 有用，但过度使用危险

Mocks、stubs、fakes 等 test doubles 能隔离行为并加快测试。

但过度使用会让测试只证明 mock 被调用，而不是系统真正工作。AI 生成测试尤其容易 mock 过多。

原则：

- 当 test doubles 能减少外部噪声时使用。
- 当它们隐藏重要行为时避免使用。

## 6. Non-Deterministic Tests 必须当缺陷处理

Flaky test 不是小问题，它会训练团队忽略红色构建。

常见原因：

- 共享状态。
- 时间依赖逻辑。
- 异步行为。
- 外部服务。
- 资源泄漏。
- 竞态条件。

政策：

- 隔离 flaky tests，避免掩盖真实回归。
- 立即创建修复 ticket。
- 不让隔离测试永久存在。
- 在 weekly quality review 中记录原因。

## 7. Coverage 是信号，不是目标

Coverage 帮助识别未测试区域，但高覆盖率不证明好测试。

AI 可以生成高覆盖但浅层的测试，只断言实现细节或错过真实业务规则。

用 coverage 提问：

- 哪些重要分支未测试。
- 哪些业务规则缺少 regression tests。
- 哪些错误路径和权限场景未覆盖。

不要把 coverage 当作唯一质量指标。

## AI-SDD 下的测试要求

- SDD acceptance criteria 应转化为可执行测试或明确验收证据。
- 行为变更应优先补 unit/component tests。
- API 或事件变更应补 contract tests。
- 跨服务行为应补 integration tests。
- 核心用户旅程保留少量稳定 E2E tests。
- AI 生成测试必须由开发者审查，删除浅层、脆弱或只验证 mock 的测试。

## 与 Superpowers 和 Harness 的关系

- Superpowers 的 `test-driven-development` 将行为先转为测试。
- `verification-before-completion` 要求完成前运行新鲜验证。
- Harness policy 定义必需测试命令、报告和失败归因。
- CI/CD 将测试策略转为不可绕过的合入门禁。

