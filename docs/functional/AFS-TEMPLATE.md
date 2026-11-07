# AFS Template

> Copy this file to `docs/functional/<name>.md` and replace the placeholders.
> Keep the document compact. Link to existing evidence instead of copying it.

---

## Front matter

```yaml
---
spec_id: AFS-<SCOPE>-<NNN>
title: <human-readable title>
profile: operation | process | module
status: draft | reviewed | approved | superseded
version: 0.1.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: baseline-ES
evidence_cutoff: <YYYY-MM-DD>
related_characterizations:
  - dolibarr-reference: reference/characterization/<file>.md
related_decisions:
  - <Alixar decision document>
related_implementation:
  - <source path or coverage entry>
---
```

## 1. Purpose and scope

State what the document models and why it exists.

**In scope**

- ...

**Out of scope**

- ...

**Related capabilities**

- ...

## 2. Reference context

Record only what affects the modeled behavior:

| Item | Value |
|---|---|
| Dolibarr version and commit | ... |
| Profile and enabled modules | ... |
| Country, language, currency and timezone | ... |
| Relevant configuration constants | ... |
| Known limitations | ... |

## 3. Actors, permissions and restrictions

| ID | Actor or permission | Effect | Evidence |
|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-PERM-001` | ... | ... | ... |

Do not invent permissions. If enforcement was not observed at runtime, mark it
`INFERIDO` and state what remains to verify.

## 4. Conceptual model

### 4.1 Entities

| ID | Entity | Business meaning | Evidence |
|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-ENT-001` | ... | ... | ... |

### 4.2 Attributes

| Entity | Attribute | Type | Required | Business meaning | Evidence |
|---|---|---|---|---|---|
| ... | ... | ... | ... | ... | ... |

Include only business-relevant attributes. Link to the characterization for a
full observed payload.

### 4.3 Relationships

| ID | Relationship | Cardinality | Optional | Delete or lifecycle effect | Evidence |
|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-REL-001` | ... | ... | ... | ... | ... |

### 4.4 Structural invariants

| ID | Invariant | Evidence |
|---|---|---|
| `AFS-<SCOPE>-<NNN>-RULE-001` | ... | ... |

## 5. Lifecycle and states

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-ST-001` | ... | ... | ... | ... | ... |

If there is no formal state machine, say so. Do not invent workflow states.

## 6. Process flow

Required for `profile: process`; mark `N/A` for a single operation.

| ID | Step | Actor | Operation | Entities | Event or effect | Evidence |
|---|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-STEP-001` | ... | ... | ... | ... | ... | ... |

### 6.1 Alternate paths

| ID | Condition | Result | Evidence |
|---|---|---|---|
| ... | ... | ... | ... |

### 6.2 Transaction and compensation

State what is atomic, what cascades, what can fail and what must be compensated.
Mark unknown behavior `PENDIENTE`.

## 7. Operations and use cases

For each operation:

### `AFS-<SCOPE>-<NNN>-UC-001` — <operation name>

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` / `INFERIDO` / `PENDIENTE` / `FUERA DE ALCANCE` |
| Normative | `yes` / `no` |
| Decision | `PENDING` / `KEEP` / `ADAPT` / `REPLACE` / `DISCARD` |
| Implementation | `PENDING` / `PARTIAL` / `DONE` / `N/A` |

**Preconditions**

- ...

**Functional input**

- ...

**Effects**

- ...

**Postconditions**

- ...

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| ... | ... | ... |

**Events emitted**

- ...

## 8. Business rules and invariants

| ID | Rule | Applies to | Trigger | Exception | Evidence | Normative |
|---|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-RULE-001` | ... | ... | ... | ... | ... | ... |

A rule with `Evidence: INFERIDO` or `PENDIENTE` must have `Normative: no`.

## 9. Events, triggers and cross-module effects

| ID | Event or trigger | Producer | Consumers or affected modules | Condition | Active in baseline | Evidence |
|---|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-EVT-001` | ... | ... | ... | ... | ... | ... |

Include hooks, triggers, extrafields, notifications, webhooks and configuration
effects only when they were actually encountered.

## 10. Dependencies

| ID | Dependency | Direction | Why it matters | Evidence |
|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-DEP-001` | ... | upstream / downstream | ... | ... |

## 11. Test scenarios

| ID | Scenario | Given | When | Then | Evidence | Purpose |
|---|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-TEST-001` | ... | ... | ... | ... | ... | conformance / verification |

- Scenarios derived from `DEMOSTRADO` may be conformance tests.
- Scenarios derived from `INFERIDO` or `PENDIENTE` are verification tasks, not
  conformance tests.

## 12. Traceability

| Element | Evidence | Decision | Implementation | Test | Status |
|---|---|---|---|---|---|
| `AFS-<SCOPE>-<NNN>-RULE-001` | ... | ... | ... | ... | ... |

## 13. Open questions and pending verification

| Question | Why it matters | Required evidence | Owner or next step |
|---|---|---|---|
| ... | ... | ... | ... |

## 14. Review record

| Field | Value |
|---|---|
| Reviewer | ... |
| Review date | ... |
| Reference confirmed | `yes` / `no` |
| Quality gates passed | `yes` / `no` |
| Notes | ... |
