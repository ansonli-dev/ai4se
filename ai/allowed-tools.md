# AI Allowed Tools Policy

## Default Tool Rules

AI agents may use tools only for the current task.

Allowed by default:

- Read project files.
- Search project files.
- Edit files inside declared task scope.
- Run local tests.
- Run local static checks.
- Generate execution summaries.

Requires human confirmation:

- Running database migrations.
- Changing dependency versions.
- Changing CI/CD configuration.
- Changing security policies.
- Changing quality gate thresholds.
- Modifying files outside declared scope.
- Deleting files.
- Running commands that affect external systems.

Forbidden:

- Accessing production systems.
- Using production credentials.
- Uploading source code or data to unapproved external services.
- Disabling tests or quality gates to pass CI.
- Committing secrets.
- Rewriting git history unless explicitly approved.

## Editable Scope

Each task should declare:

- Allowed files or directories.
- Forbidden files or directories.
- Expected test files.
- Expected documentation or contract files.

If the implementation needs to modify unexpected areas, stop and explain why before continuing.

