# Glossary

Chinese version: [../zh/knowledge/10-术语表.md](../zh/knowledge/10-术语表.md)

## Purpose

This glossary explains abbreviations and short terms used across the handbook. Readers should not need to guess what an acronym means before they can understand the AI-SDD workflow.

## Core Terms

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| AI | Artificial Intelligence | AI tools, models, agents, and assistants used to support software delivery. |
| AI-SDD | AI-assisted Spec-Driven Development | The governance model in this handbook: AI-assisted work starts from approved specifications and ends with evidence-based delivery. |
| SDLC | Software Development Life Cycle | The full lifecycle of software work, from idea and requirements through design, implementation, testing, release, operation, and improvement. In this handbook, Team AI SDLC means the team-level lifecycle for AI-assisted software delivery. |
| SDD | Spec-Driven Development | A development approach where specifications, acceptance criteria, constraints, and context boundaries drive implementation. |
| Story | User Story | A backlog item describing user value, acceptance criteria, and implementation scope. |
| AC | Acceptance Criteria | Testable conditions that determine whether a Story is accepted. |
| DoR | Definition of Ready | The minimum conditions that must be true before a Story can enter development. |
| DoD | Definition of Done | The minimum conditions that must be true before a Story can be considered complete. |
| MR | Merge Request | A GitLab-style request to merge code changes into a target branch. The handbook uses MR as the default term. |
| PR | Pull Request | A GitHub-style request to merge code changes into a target branch. Equivalent to MR in many workflows. |

## Architecture And Planning

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| ADR | Architecture Decision Record | A short document recording an important architecture decision, its context, options, and consequences. |
| API | Application Programming Interface | A contract exposed by a service, component, or platform. |
| OpenAPI | OpenAPI Specification | A standard format for describing HTTP APIs. |
| JSON | JavaScript Object Notation | A structured data format used for APIs, configuration, and event payloads. |
| YAML | YAML Ain't Markup Language | A human-readable structured data format often used for configuration and policy files. |
| DDD | Domain-Driven Design | A design approach that models software around domain concepts, boundaries, and business language. |
| POC | Proof of Concept | A small implementation used to validate feasibility before larger investment. |
| BMAD | Breakthrough Method of Agile AI-driven Development | An AI-assisted agile framework referenced as a possible upstream discovery or escalation method. |
| GSD | Get Shit Done | A context engineering and spec-driven long-task execution system referenced as an optional pattern for long-running AI work. |

## Engineering Workflow

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| TDD | Test-Driven Development | A development practice where tests are written before implementation. |
| E2E | End-to-End | Tests or checks that validate a complete user or system journey. |
| CLI | Command-Line Interface | A terminal-based interface for tools such as Claude Code, Codex, Git, or build systems. |
| IDE | Integrated Development Environment | An editor or development environment such as Cursor, VS Code, or JetBrains IDEs. |
| UI | User Interface | The screens and controls a user interacts with. |
| UX | User Experience | The overall experience and usability of a product or workflow. |
| QA | Quality Assurance | The discipline of validating product quality, test evidence, and acceptance readiness. |
| CI/CD | Continuous Integration / Continuous Delivery or Deployment | Automated build, test, scan, packaging, and release pipelines. |
| CODEOWNERS | Code Owners File | A repository file that maps paths to responsible owners or reviewers. |

## Security And Supply Chain

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| SAST | Static Application Security Testing | Security analysis performed on source code or build artifacts without running the application. |
| SCA | Software Composition Analysis | Dependency and open-source component risk analysis. |
| SBOM | Software Bill of Materials | An inventory of software components, dependencies, and versions. |
| OWASP | Open Worldwide Application Security Project | A security community and source of application security guidance. |
| SAMM | Software Assurance Maturity Model | An OWASP maturity model for improving software security practices. |

## AI Agent Tooling

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| MCP | Model Context Protocol | A protocol for connecting AI tools to external systems and data sources. |
| Skill | Skill | A reusable AI workflow or capability package, such as planning, review, testing, or debugging. |
| Plugin | Plugin | An installable package that may bundle skills, MCP servers, hooks, subagents, or tool integrations. |
| Hook | Hook | A deterministic command or check that runs at a defined point in a workflow. |
| Memory | Memory | Persisted agent context or preferences that can influence future sessions. |
| Subagent | Subagent | A separate agent or session used for a bounded investigation, implementation, or review task. |
| Agent | Agent | An AI system that can reason over context, call tools, edit files, and pursue a task. |

## Governance And Roles

| Term | Full Form | Meaning In This Handbook |
| --- | --- | --- |
| RACI | Responsible, Accountable, Consulted, Informed | A responsibility matrix used to clarify roles in governance and delivery activities. |
| BA | Business Analyst | A role that helps clarify requirements, business rules, and acceptance criteria. |
| Owner Review | Owner Review | Approval by the accountable module or domain owner for a change. |
| AI Champion | AI Champion | A team member who coaches AI-SDD usage, maintains examples, and collects failure cases. |

## Priority Labels

| Term | Meaning |
| --- | --- |
| P0 | Must-have for a controlled pilot. |
| P1 | Should-have for team expansion. |
| P2 | Nice-to-have or scale capability after the baseline is stable. |
| Tier A | Lightweight, low-risk change. |
| Tier B | Standard Story or meaningful business change. |
| Tier C | High-risk, core, production-impacting, architecture, permission, data, or security-sensitive change. |

