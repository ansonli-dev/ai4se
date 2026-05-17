# Agent Tooling

Chinese version: [../zh/knowledge/07-agent工具.md](../zh/knowledge/07-agent工具.md)

## Purpose

AI-SDD governance needs a practical view of agent tools. The process should not depend on a single vendor, but teams do need clear guidance on where tools fit, what they are good at, and which capabilities should be managed by policy.

This article covers three representative tools:

- Claude Code.
- OpenAI Codex.
- Cursor.

Claude Code is covered in more depth because its CLI, app, IDE integrations, skills, MCP, plugins, memory, hooks, and subagent model make it a useful reference architecture for agentic software delivery.

## Tool Positioning

| Tool | Best Fit | Typical Surface | Governance Focus |
| --- | --- | --- | --- |
| Claude Code | Agentic coding workflow across terminal, app, IDE, web, CI, and integrations | CLI, desktop app, web, VS Code, JetBrains, Slack, CI/CD | Context, permissions, memory, skills, MCP, plugins, hooks, verification |
| OpenAI Codex | Local terminal coding agent and OpenAI coding workflow | CLI, IDE, web or cloud coding workflows where available | Sandbox, approvals, AGENTS.md/project instructions, code review, tests |
| Cursor | AI-native editor experience for daily development | Cursor IDE, agent mode, inline edits, project rules | Editor rules, codebase context, multi-file edits, review discipline |

Recommended policy:

- Treat tools as execution environments, not as governance models.
- Keep SDD specs, MR evidence, quality gates, and Owner Review tool-neutral.
- Allow teams to use different tools when they produce the same required artifacts and evidence.
- Standardize context boundaries, verification, and review expectations across tools.

## Claude Code

Claude Code is an agentic coding tool that can read a codebase, edit files, run commands, and integrate with development tools. It is available across terminal, IDE, desktop app, and browser surfaces.

### CLI

The CLI is the primary surface for local agentic engineering work.

Good uses:

- Explore a codebase.
- Plan a feature or fix.
- Edit files across modules.
- Run tests, linters, build commands, and scripts.
- Stage changes, commit, create branches, and prepare pull requests.
- Pipe logs or command output into an agent task.
- Run non-interactive prompts in automation.

Governance guidance:

- Use CLI work inside a bounded task.
- Provide the Story, SDD Spec, acceptance criteria, and verification command.
- Prefer explore -> plan -> implement -> verify for Tier B and Tier C work.
- Require evidence in the MR, not only the CLI transcript.
- Use allowlists, permission modes, or sandboxing for risky commands.

### App, Web, And Remote Work

Claude Code can also run through desktop and browser experiences. These surfaces are useful when the user wants visual diff review, multiple sessions side by side, cloud sessions, long-running tasks, or work from another device.

Good uses:

- Review diffs visually.
- Run multiple sessions in parallel.
- Start long-running tasks from web or mobile.
- Continue or inspect sessions away from the local terminal.
- Schedule repeated work where supported.

Governance guidance:

- Treat remote or app sessions as equivalent to local agent sessions for evidence requirements.
- Record which repository, branch, Story, and context were used.
- Avoid giving remote sessions broader repository access than the task requires.
- Ensure generated changes still pass local or CI verification before merge.

### IDE Plugins

Claude Code integrates with VS Code, Cursor-compatible extension surfaces, and JetBrains IDEs. IDE integrations are useful when developers want inline diffs, selected-code context, editor-native review, or faster feedback while staying inside the editor.

Good uses:

- Focused file edits.
- Selection-aware refactors.
- Reviewing proposed diffs before accepting.
- Asking codebase questions while navigating code.

Governance guidance:

- IDE convenience must not bypass SDD, tests, or review.
- Developers still own accepted edits.
- Large multi-file changes should still have a plan and verification evidence.

## Claude Code Capabilities

### Instructions And Memory

Claude Code uses project instructions such as `CLAUDE.md` and can also accumulate memory across sessions.

Use `CLAUDE.md` for:

- Build commands.
- Test commands.
- Coding conventions.
- Repository etiquette.
- Architecture constraints.
- Review rules that apply broadly.

Use memory for:

- Build or debugging learnings discovered during work.
- Stable preferences learned from corrections.
- Repeated project patterns that should persist.

Governance guidance:

- Keep `CLAUDE.md` short and reviewable.
- Store shared project instructions in Git.
- Keep personal or local instructions out of shared repositories.
- Do not put secrets or sensitive data in memory or instruction files.
- Review memory if the agent starts repeating a wrong behavior.

### Skills

Skills package repeatable workflows or domain knowledge. They are useful when a workflow is too specific for general instructions but reusable enough to standardize.

Good skill candidates:

- SDD Story readiness review.
- API contract review.
- Security review.
- Test strategy review.
- Release note generation.
- Supplier deliverable review.

Governance guidance:

- Use skills for repeatable workflows.
- Keep skills narrow and explicit.
- Version shared skills.
- Review skill content like code because it influences agent behavior.

### MCP

MCP, the Model Context Protocol, connects AI tools to external systems and data sources such as issue trackers, documents, databases, monitoring systems, design tools, and internal services.

Good uses:

- Read approved requirements from a ticket system.
- Fetch approved design documents.
- Query non-production databases.
- Inspect observability data.
- Update issue status or create follow-up tasks.

Governance guidance:

- Treat MCP servers as privileged tool access.
- Approve which systems each MCP server can access.
- Use least privilege.
- Avoid production customer data unless explicitly approved and masked.
- Log MCP use when it affects delivery decisions or artifacts.

### Plugins

Plugins bundle capabilities such as skills, hooks, subagents, and MCP servers into installable packages.

Good uses:

- Standardize team workflows.
- Distribute approved review skills.
- Package internal tool integrations.
- Share hooks and subagents.

Governance guidance:

- Approve plugins before team-wide use.
- Prefer internal or trusted plugins for enterprise delivery.
- Review plugin permissions and tool access.
- Track plugin version changes.

### Hooks

Hooks run deterministic commands at defined points in an agent workflow.

Good uses:

- Run formatting after file edits.
- Block writes to protected folders.
- Run lint before commit.
- Generate execution reports after verification.

Governance guidance:

- Use hooks for rules that must happen every time.
- Keep hooks fast and predictable.
- Put expensive verification in CI unless the local hook is intentionally required.
- Treat hook failures as engineering signals, not agent failures.

### Subagents And Parallel Sessions

Subagents or parallel sessions can isolate investigation, review, or separable implementation tasks.

Good uses:

- Independent codebase exploration.
- Security review separate from implementation.
- Spec compliance review before code quality review.
- Parallel work on disjoint modules.

Governance guidance:

- Use subagents only when tasks are separable.
- Give each subagent bounded context and ownership.
- Do not let parallel work bypass integration review.
- Verify the integrated result, not only individual agent outputs.

## Claude Code Best Practices For AI-SDD

Use these as the default operating pattern for Tier B and Tier C work:

1. Give the agent a way to verify its work.
2. Explore first, then plan, then code.
3. Provide specific context and point to exact files or specs.
4. Keep persistent instructions concise.
5. Configure permissions and tool access deliberately.
6. Use CLI tools for external systems when they are approved.
7. Connect MCP only to approved sources.
8. Use hooks for deterministic checks.
9. Use skills for repeatable team workflows.
10. Manage context aggressively.
11. Course-correct early.
12. Use subagents for investigation or separable work.

Official best practices:

- [Best practices for Claude Code](https://code.claude.com/docs/en/best-practices)

Learning video:

- [Claude Code learning video on Bilibili](https://www.bilibili.com/video/BV1NvRyBzEhq)

## OpenAI Codex

OpenAI Codex is a coding agent that can operate locally from the terminal and, depending on the product surface available to a team, can also be used through editor or cloud workflows.

Good uses:

- Local codebase exploration.
- Feature implementation.
- Bug fixing.
- Test generation.
- Code review before commit.
- Running local verification commands.

Governance guidance:

- Use project instructions such as `AGENTS.md` where supported.
- Keep sandbox and approval settings aligned with repository risk.
- Require the same SDD, MR evidence, and quality gates as other tools.
- Prefer narrow tasks with explicit verification commands.
- Do not treat model confidence as verification.

References:

- [OpenAI Codex CLI getting started](https://help.openai.com/en/articles/11096431-openai-codex-ligetting-started)
- [OpenAI Codex GitHub repository](https://github.com/openai/codex)

## Cursor

Cursor is an AI-native code editor. It is strongest when developers want AI assistance inside the editor, with codebase context, inline edits, agent mode, and project rules.

Good uses:

- Day-to-day feature work inside an IDE.
- Multi-file edits and refactors.
- Inline code generation.
- Codebase questions.
- Applying project-specific coding rules.

Governance guidance:

- Use Cursor rules to encode team conventions, but do not rely on rules as the only control.
- Keep SDD specs and acceptance criteria outside the editor as authoritative artifacts.
- Require MR evidence and CI verification for accepted changes.
- Use agent mode for bounded work, not open-ended architecture changes without review.

References:

- [Cursor concepts](https://docs.cursor.com/get-started/concepts)
- [Cursor Agent overview](https://docs.cursor.com/chat/overview)

## Recommended Tool Governance

### Must-Have

- Tool-neutral SDD templates.
- Tool-neutral MR evidence requirements.
- Clear AI context boundary.
- Approved tool list.
- Permission and data-use policy.
- Verification commands per repository.
- Human review for core modules.

### Should-Have

- Project instruction files for each supported tool.
- Shared examples for Claude Code, Codex, and Cursor workflows.
- Approved MCP server list.
- Approved plugin list.
- Hooks for deterministic local checks.
- Execution reports for Tier B and Tier C work.

### Nice-To-Have

- Tool usage dashboard.
- Central plugin registry.
- Shared skill library.
- MCP gateway with centralized access control.
- Agent run trace store.

## Practical Selection Guide

- Use Claude Code when the task benefits from agentic workflow across terminal, app, web, IDE, tools, and automation.
- Use Codex when the team wants a terminal-native coding agent aligned with OpenAI tooling and local verification.
- Use Cursor when the developer's primary workflow is editor-native and benefits from inline AI assistance and agentic IDE behavior.
- Use the same SDD, quality, review, and evidence rules regardless of tool.

