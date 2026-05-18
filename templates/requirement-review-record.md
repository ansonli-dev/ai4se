# Requirement Review Record

> **Purpose:** Single combined evidence record for the three gating reviews of one Requirement (Feature-sized business unit): **Requirements Review**, **Technical Review**, **Test Review**. A Requirement cannot be broken into Stories and placed on the backlog until this record exists and the overall outcome is *Approved* or *Conditionally Approved*.
>
> See [BA Guide](../docs/ai-sdd-governance/practice/09-ba-guide.md) for the BA's full workflow around this record. See [Feature Spec](feature-spec.md) for the upstream Requirement artifact itself.

## Metadata

- Requirement ID:
- Requirement Name:
- Linked Feature Spec / Requirement Spec:
- Record Version:
- BA Owner:
- Status: Draft | Reviews In Progress | Approved | Conditionally Approved | Rejected | Sent Back For Rework

## Overall Gate Decision

- Outcome: ☐ Approved   ☐ Conditionally Approved   ☐ Rejected   ☐ Sent Back
- Decision date:
- Decision rationale:
- Conditions (if Conditionally Approved):
- Approved by (names + roles):

A Requirement may proceed to Story Breakdown only if outcome is *Approved* or *Conditionally Approved* with the conditions explicitly listed.

---

## 1. Requirements Review (需求评审)

**Purpose:** Confirm *what* the business actually wants — scope, value, success criteria, stakeholders, non-scope.

### Participants

| Role | Name | Required / Consulted |
| --- | --- | --- |
| Product Owner | | Required |
| BA (chair) | | Required |
| Stakeholder / Business representative | | Required |
| Delivery Owner | | Consulted |

### Inputs

- Linked Feature Spec / Requirement Spec (latest version):
- Originating business request or ticket:
- Related strategic objectives or roadmap items:

### Discussion Log

| Question / Concern | Raised By | Resolution / Decision | Owner Of Follow-up |
| --- | --- | --- | --- |
| | | | |

### Confirmed Scope And Non-Scope

In scope:

-

Out of scope:

-

### Confirmed Success Criteria

-

### Constraints And Assumptions

-

### Action Items

| # | Action | Owner | Due |
| --- | --- | --- | --- |
| | | | |

### Outcome

- ☐ Pass   ☐ Pass with conditions   ☐ Fail (return to BA)
- Conditions:

---

## 2. Technical Review (技术评审)

**Purpose:** Confirm *how* it will be built — feasibility, architecture impact, dependencies, cost, risks, technical alternatives.

### Participants

| Role | Name | Required / Consulted |
| --- | --- | --- |
| Architect / Tech Lead (chair) | | Required |
| Module Owner(s) of affected modules | | Required |
| BA | | Required |
| Security Lead | | Required if security-sensitive |
| Developer representative | | Consulted |

### Inputs

- Approved Requirements Review outcome (Section 1):
- Existing Architecture Overview / Architecture Constraints:
- Affected modules, services, APIs, events, data:
- Existing ADRs that this Requirement may interact with:

### Discussion Log

| Question / Concern | Raised By | Resolution / Decision | Owner Of Follow-up |
| --- | --- | --- | --- |
| | | | |

### Confirmed Technical Impact

- Affected modules:
- Affected APIs (linked OpenAPI):
- Affected events (linked schema):
- Affected data models:
- Affected permissions or audit behavior:
- External integrations affected:

### Architecture Decisions Needed

- ADR required: Yes | No
- ADR ID / link (if created):

### Estimated Complexity And Risks

- Complexity (T-shirt or story points):
- Top 3 technical risks:
  1.
  2.
  3.
- Mitigation strategy per risk:

### Dependencies

- Internal dependencies (other teams / modules / suppliers):
- External dependencies:
- Blocking risks:

### Action Items

| # | Action | Owner | Due |
| --- | --- | --- | --- |
| | | | |

### Outcome

- ☐ Pass   ☐ Pass with conditions   ☐ Fail (return for redesign)
- Conditions:

---

## 3. Test Review (测试评审)

**Purpose:** Confirm the Requirement is *testable* — acceptance approach, required test types, test environment needs, automation feasibility, UAT scope.

### Participants

| Role | Name | Required / Consulted |
| --- | --- | --- |
| QA Lead (chair) | | Required |
| BA | | Required |
| Tech Lead | | Required |
| Security Lead | | Required if security-sensitive |

### Inputs

- Approved Requirements Review outcome (Section 1):
- Approved Technical Review outcome (Section 2):
- Existing Test Spec patterns for affected modules:
- Existing Acceptance Strategy template:

### Discussion Log

| Question / Concern | Raised By | Resolution / Decision | Owner Of Follow-up |
| --- | --- | --- | --- |
| | | | |

### Confirmed Test Approach

- Required test layers (unit / component / contract / integration / E2E):
- Required regression coverage:
- Required permission tests:
- Required audit-log tests:
- Test environment needs:
- Required test data and how it will be obtained or masked:
- UAT scope and acceptance approach:

### Acceptance Criteria Pattern

- Are AC's in Given/When/Then form on the Feature Spec? Yes | No
- Are AC's testable as written? Yes | No | Need rewrite
- Identified gaps in acceptance criteria:

### Action Items

| # | Action | Owner | Due |
| --- | --- | --- | --- |
| | | | |

### Outcome

- ☐ Pass   ☐ Pass with conditions   ☐ Fail (return for AC rewrite)
- Conditions:

---

## Traceability To Stories

Once the overall gate is Approved or Conditionally Approved, the BA breaks the Requirement into Stories. List each resulting Story here with rationale.

| Story ID | Story Name | Parent Requirement Section / AC | Tier | Module Owner | Notes |
| --- | --- | --- | --- | --- | --- |
| | | | | | |

## AI-Readiness Of This Record

This record is part of the [AI Context Boundary](../docs/ai-sdd-governance/knowledge/02-sdd-methodology.md) for every Story produced from this Requirement. Before handing Stories to the backlog the BA must verify:

- [ ] All three reviews are *Pass* or *Pass with conditions* with conditions named.
- [ ] All "Sent Back" or "Fail" outcomes have been resolved and re-reviewed.
- [ ] Confirmed scope, non-scope, and success criteria are written down — not left as meeting memory.
- [ ] Technical impact list names actual files / contracts / modules an agent can locate.
- [ ] Acceptance criteria are testable; "Need rewrite" gaps are closed.
- [ ] Traceability table links every Story back to this Requirement.
