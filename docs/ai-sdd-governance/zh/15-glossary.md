# 术语表

English version: [../15-glossary.md](../15-glossary.md)

## 目的

本术语表解释手册中使用的缩写和短术语。读者不应该因为不理解缩写而无法理解 AI-SDD 工作流。

## 核心术语

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| AI | Artificial Intelligence | 用于支持软件交付的 AI 工具、模型、agent 和 assistant。 |
| AI-SDD | AI-assisted Spec-Driven Development | 本手册中的治理模型：AI 辅助工作从批准规格开始，以基于证据的交付结束。 |
| SDLC | Software Development Life Cycle | 软件开发生命周期，覆盖从想法、需求、设计、实现、测试、发布、运行到持续改进的全过程。本手册中的 Team AI SDLC 指团队级 AI 辅助软件交付生命周期。 |
| SDD | Spec-Driven Development | 规格驱动开发，用规格、验收标准、约束和上下文边界驱动实现。 |
| Story | User Story | 描述用户价值、验收标准和实现范围的 backlog item。 |
| AC | Acceptance Criteria | 验收标准，即判断 Story 是否可接受的可测试条件。 |
| DoR | Definition of Ready | Story 进入开发前必须满足的最低条件。 |
| DoD | Definition of Done | Story 被认为完成前必须满足的最低条件。 |
| MR | Merge Request | GitLab 风格的代码合入请求。本手册默认使用 MR。 |
| PR | Pull Request | GitHub 风格的代码合入请求，许多流程中与 MR 等价。 |

## 架构与计划

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| ADR | Architecture Decision Record | 记录重要架构决策、背景、选项和后果的简短文档。 |
| API | Application Programming Interface | 服务、组件或平台暴露的接口契约。 |
| OpenAPI | OpenAPI Specification | 描述 HTTP API 的标准格式。 |
| JSON | JavaScript Object Notation | 用于 API、配置和事件载荷的结构化数据格式。 |
| YAML | YAML Ain't Markup Language | 常用于配置和政策文件的可读结构化数据格式。 |
| DDD | Domain-Driven Design | 围绕领域概念、边界和业务语言建模的软件设计方法。 |
| POC | Proof of Concept | 用于在大规模投入前验证可行性的小型实现。 |
| BMAD | Breakthrough Method of Agile AI-driven Development | 一个 AI 辅助敏捷框架，在本手册中作为上游发现或复杂工作升级路径参考。 |
| GSD | Get Shit Done | 一个 context engineering 和 spec-driven long-task execution system，在本手册中作为长任务 AI 执行模式参考。 |

## 工程工作流

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| TDD | Test-Driven Development | 先写测试再实现的开发实践。 |
| E2E | End-to-End | 验证完整用户或系统路径的测试或检查。 |
| CLI | Command-Line Interface | 终端命令行入口，例如 Claude Code、Codex、Git 或构建工具。 |
| IDE | Integrated Development Environment | 集成开发环境，例如 Cursor、VS Code 或 JetBrains IDE。 |
| UI | User Interface | 用户交互的界面和控件。 |
| UX | User Experience | 产品或工作流的整体体验和可用性。 |
| QA | Quality Assurance | 验证产品质量、测试证据和验收准备度的职责或活动。 |
| CI/CD | Continuous Integration / Continuous Delivery or Deployment | 自动化构建、测试、扫描、打包和发布流水线。 |
| CODEOWNERS | Code Owners File | 将仓库路径映射到责任 owner 或 reviewer 的文件。 |

## 安全与供应链

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| SAST | Static Application Security Testing | 在不运行应用的情况下对源码或构建产物进行安全分析。 |
| SCA | Software Composition Analysis | 依赖和开源组件风险分析。 |
| SBOM | Software Bill of Materials | 软件组件、依赖和版本清单。 |
| OWASP | Open Worldwide Application Security Project | 应用安全社区和安全实践来源。 |
| SAMM | Software Assurance Maturity Model | OWASP 的软件安全实践成熟度模型。 |

## AI Agent 工具

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| MCP | Model Context Protocol | 将 AI 工具连接到外部系统和数据源的协议。 |
| Skill | Skill | 可复用 AI workflow 或能力包，例如 planning、review、testing、debugging。 |
| Plugin | Plugin | 可安装包，可能包含 skills、MCP servers、hooks、subagents 或工具集成。 |
| Hook | Hook | 在 workflow 指定点运行的确定性命令或检查。 |
| Memory | Memory | 可影响后续 session 的持久化 agent context 或偏好。 |
| Subagent | Subagent | 用于有边界调查、实现或 review 任务的独立 agent 或 session。 |
| Agent | Agent | 能基于上下文推理、调用工具、编辑文件并完成任务的 AI 系统。 |

## 治理与角色

| 术语 | 全称 | 本手册中的含义 |
| --- | --- | --- |
| RACI | Responsible, Accountable, Consulted, Informed | 用于明确治理和交付活动角色的责任矩阵。 |
| BA | Business Analyst | 帮助澄清需求、业务规则和验收标准的角色。 |
| Owner Review | Owner Review | 由负责模块或领域的 accountable owner 对变更进行审批。 |
| AI Champion | AI Champion | 辅导 AI-SDD 使用、维护示例并收集失败案例的团队成员。 |

## 优先级标签

| 术语 | 含义 |
| --- | --- |
| P0 | 受控试点的 must-have。 |
| P1 | 团队扩展的 should-have。 |
| P2 | baseline 稳定后的 nice-to-have 或规模化能力。 |
| Tier A | 轻量、低风险变更。 |
| Tier B | 标准 Story 或有意义的业务变更。 |
| Tier C | 高风险、核心、生产影响、架构、权限、数据或安全敏感变更。 |

