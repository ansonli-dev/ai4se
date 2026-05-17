# Lightweight AI Harness

This directory contains lightweight Harness Engineering assets for internal AI-assisted development.

The goal is to make AI execution controlled, reviewable, and evidence-based without building a full platform first.

## Contents

- `prompts/`: reusable prompt templates for bounded task execution and review.
- `policies/`: machine-readable or semi-structured policies.
- `scripts/`: starter scripts for readiness checks, verification, and reports.
- `reports/`: execution reports generated per AI-assisted task.

## Intended Use

For Tier B and Tier C internal work:

1. Check Story readiness.
2. Provide bounded context and allowed scope.
3. Execute the task using Superpowers or another approved agent workflow.
4. Run verification.
5. Generate an execution report.
6. Attach the report or summary to the merge request.

