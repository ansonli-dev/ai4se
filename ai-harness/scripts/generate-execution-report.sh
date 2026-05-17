#!/usr/bin/env sh
set -eu

run_id="${1:-$(date +%Y%m%d-%H%M%S)}"
report_dir="ai-harness/reports"
report_file="$report_dir/$run_id.md"

mkdir -p "$report_dir"

cat > "$report_file" <<EOF
# AI Agent Execution Report

## Metadata

- Run ID: $run_id
- Date:
- Developer:
- Story ID:
- Task ID:
- Workflow Tier:
- Agent/Tool:

## Approved Context

- Story card:
- SDD Story Spec:
- Technical Spec:
- API/Event/Data artifacts:
- Code entry points:
- Tests:

## Scope

- Editable scope:
- Forbidden scope:
- Human approvals required:

## Execution Summary

- Change summary:
- Files changed:
- Tests added or updated:
- Artifacts updated:

## Verification

- Commands run:
- Results:
- CI link:
- Manual checks:

## Failures And Fixes

| Failure | Cause | Fix | Verified By |
| --- | --- | --- | --- |
| | | | |

## Failure Attribution

- Spec ambiguity:
- Missing or wrong context:
- Tool or permission issue:
- Environment issue:
- Test failure:
- Agent implementation issue:
- Review or acceptance gap:

## Risks And Human Review

- Remaining risks:
- Required reviewer focus:
- Owner approval:
- Rollback or recovery notes:

EOF

echo "Generated report: $report_file"

