# AI Security Policy

## Sensitive Data

Do not provide AI tools with:

- Customer personal data.
- Production logs containing personal or business-sensitive data.
- Credentials.
- Tokens.
- Private keys.
- Internal secrets.

Sensitive data must be masked before it can be used as AI context.

## Security Review Triggers

Security review is required when a change affects:

- Authentication.
- Authorization.
- Customer data.
- Payment, fee, settlement, or refund logic.
- Audit logging.
- Encryption.
- External integrations.
- Dependency versions.
- Infrastructure or deployment configuration.

## AI Output Review

Reviewers must check whether AI output:

- Adds insecure defaults.
- Logs sensitive information.
- Exposes internal identifiers.
- Bypasses permission checks.
- Weakens input validation.
- Introduces unsafe dependency usage.

