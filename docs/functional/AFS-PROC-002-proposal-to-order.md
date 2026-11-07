---
spec_id: AFS-PROC-002
title: Accepted proposal to customer order
profile: process
status: draft
version: 0.1.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: commercial-ES
evidence_cutoff: 2026-11-07
related_characterizations:
  - dolibarr-reference: reference/characterization/PROPAL-ORDER-REF-001-proposal-to-order.md
related_decisions: []
related_implementation: []
---

# AFS-PROC-002 - Accepted proposal to customer order

## 1. Purpose and scope

Model the business process that converts an accepted commercial proposal into a
customer order in the pinned Dolibarr reference.

The process has two AS-IS paths:

- a **manual** path from the proposal card;
- an **automatic** path triggered when the proposal is closed as accepted.

**In scope**

- proposal validation and close-as-accepted;
- the `PROPAL_CLOSE_SIGNED` business event;
- the automatic workflow option;
- duplicate-order prevention;
- the immediate-validation option;
- the proposal-order link;
- the manual UI path at source level.

**Out of scope**

- proposal pricing, taxes and discount calculation;
- online-signature mechanics beyond their effect on permissions;
- non-admin permission matrices;
- order fulfillment, shipping, stock and invoicing;
- deletion and cancellation of orders;
- multi-entity and multi-currency behavior;
- Alixar canonical API design.

**Related capabilities**

- `BM-02` commercial proposal management;
- `BM-03` proposal-to-order conversion;
- `BM-04` customer order management;
- `PROC-SLS-001` process maps.

**Process maps**

- [Manual AS-IS map](../processes/PROC-SLS-001-ASIS-MANUAL.bpmn);
- [Automatic AS-IS map](../processes/PROC-SLS-001-ASIS-AUTOMATIC.bpmn).

## 2. Reference context

| Item | Value |
|---|---|
| Dolibarr | 24.0.1, commit `b7958385f00a92219f76a4dfea67dae93df97a25` |
| Profile | `commercial-ES` |
| Enabled modules | `API`, `SOCIETE`, `PROPALE`, `COMMANDE`, `WORKFLOW`; `USER` enabled by the image |
| Country, language, currency | ES, `es_ES`, EUR |
| Timezone | `Europe/Madrid` |
| Relevant configuration | `WORKFLOW_PROPAL_AUTOCREATE_ORDER` enables automatic conversion; `ORDER_VALID_AFTER_CLOSE_PROPAL` validates the new order immediately |
| Reference limitation | The baseline profile does not enable commercial modules; this AFS uses the isolated `commercial-ES` profile |

## 3. Actors, permissions and restrictions

| ID | Actor or permission | Effect | Evidence |
|---|---|---|---|
| `AFS-PROC-002-PERM-001` | Authenticated commercial user | Can validate and close proposals according to permissions | `DEMOSTRADO` for admin; `INFERIDO` for other roles |
| `AFS-PROC-002-PERM-002` | Order creation permission (`commande/creer`) | Required for the manual “Add order” action | `INFERIDO` from `comm/propal/card.php:144,3671-3677` |
| `AFS-PROC-002-PERM-003` | Online-signature context | Forces order creation permission for the technical signature user | `INFERIDO` from `interface_20_modWorkflow_WorkflowManager.class.php:82-92` |
| `AFS-PROC-002-PERM-004` | Workflow module active | Required for the automatic path | `INFERIDO`; the trigger returns when the module is inactive |

## 4. Conceptual model

### 4.1 Entities

| ID | Entity | Business meaning | Evidence |
|---|---|---|---|
| `AFS-PROC-002-ENT-001` | Commercial proposal | Offer sent to a customer, with lines and a lifecycle status | `DEMOSTRADO` |
| `AFS-PROC-002-ENT-002` | Proposal line | Product, service or free-text line offered in the proposal | `DEMOSTRADO` |
| `AFS-PROC-002-ENT-003` | Customer order | Commitment to sell, created from an accepted proposal or independently | `DEMOSTRADO` |
| `AFS-PROC-002-ENT-004` | Order line | Line copied or selected during conversion | `DEMOSTRADO` |
| `AFS-PROC-002-ENT-005` | Proposal-order link | Relationship that records the origin of the order | `DEMOSTRADO` |

### 4.2 Attributes relevant to the process

| Entity | Attribute | Type | Required | Business meaning | Evidence |
|---|---|---|---|---|---|
| Proposal | status | state | yes | Draft, validated, signed/accepted, not signed/refused or billed | `INFERIDO` from class constants |
| Proposal | third party | reference | yes | Customer receiving the proposal | `DEMOSTRADO` |
| Proposal | lines | collection | yes | Offered items | `DEMOSTRADO` |
| Order | status | state | yes | Draft, validated, shipment-in-process/accepted or closed | `INFERIDO` from class constants |
| Order | reference | identifier | yes | Commercial order reference | `DEMOSTRADO` |
| Order | third party | reference | yes | Customer receiving the order | `DEMOSTRADO` |
| Order | origin | reference | no | Source proposal, when converted | `DEMOSTRADO` |
| Link | source/target | identifier pair | yes | Proposal → order relationship | `DEMOSTRADO` |

### 4.3 Relationships

| ID | Relationship | Cardinality | Optional | Delete or lifecycle effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-002-REL-001` | Proposal → Order | one-to-zero-or-one in the automatic path | yes | The automatic path does not create a second linked order | `DEMOSTRADO` |
| `AFS-PROC-002-REL-002` | Order → Order lines | one-to-many | no | Lines are copied from the proposal or selected manually | `DEMOSTRADO` for automatic conversion |
| `AFS-PROC-002-REL-003` | Proposal → Proposal lines | one-to-many | no | Source lines for conversion | `DEMOSTRADO` |
| `AFS-PROC-002-REL-004` | Proposal-order link → both objects | associative | no | Persisted in the generic element-link table | `DEMOSTRADO` |

### 4.4 Structural invariants

| ID | Invariant | Evidence |
|---|---|---|
| `AFS-PROC-002-RULE-001` | Only an accepted/signed proposal starts the automatic conversion path | `DEMOSTRADO`; the trigger runs on `PROPAL_CLOSE_SIGNED` |
| `AFS-PROC-002-RULE-002` | The automatic path does not create a duplicate when a linked order already exists | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-003` | The order copies description, quantity, unit price, VAT rate and totals from the proposal line | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-004` | The proposal-order relationship is persisted | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-005` | The order is created as a draft unless immediate validation is configured | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-006` | The manual path requires the order module and order creation permission | `INFERIDO` |
| `AFS-PROC-002-RULE-007` | The manual path copies only the lines selected by the user | `INFERIDO`; not runtime-verified |

## 5. Lifecycle and states

### 5.1 Proposal

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-002-ST-001` | Draft | `0` | Creation | Proposal can be edited | `INFERIDO` |
| `AFS-PROC-002-ST-002` | Validated | `1` | Validation | Proposal can be sent and closed | `INFERIDO` |
| `AFS-PROC-002-ST-003` | Signed/accepted | `2` | Close as signed | Emits `PROPAL_CLOSE_SIGNED`; customer becomes a customer | `DEMOSTRADO` |
| `AFS-PROC-002-ST-004` | Not signed/refused | `3` | Close as not signed | Emits `PROPAL_CLOSE_REFUSED` | `INFERIDO` |
| `AFS-PROC-002-ST-005` | Billed | `4` | Billing | Proposal is closed as billed | `INFERIDO` |

### 5.2 Customer order

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-002-ST-006` | Draft | `0` | Order creation | Order can be edited | `DEMOSTRADO` |
| `AFS-PROC-002-ST-007` | Validated | `1` | Order validation | Order becomes executable | `DEMOSTRADO` |
| `AFS-PROC-002-ST-008` | Shipment in process / accepted | `2` | Fulfillment actions | Legacy shares value `2` for two labels | `INFERIDO` |
| `AFS-PROC-002-ST-009` | Closed | `3` | Close | Order is closed | `INFERIDO` |

## 6. Process flow

### 6.1 Automatic path

| ID | Step | Actor | Operation | Entities | Event or effect | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-STEP-001` | Close the validated proposal as accepted | Commercial user | Close proposal | Proposal | Status becomes `2` | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-002` | Emit the close event | System | Trigger dispatch | Proposal | `PROPAL_CLOSE_SIGNED` | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-003` | Check the workflow module and automatic option | System | Configuration check | Workflow | Continue or stop | `DEMOSTRADO` for option; module check `INFERIDO` |
| `AFS-PROC-002-STEP-004` | Detect online-signature context | System | Context check | Proposal | Bypass order permission when present | `INFERIDO` |
| `AFS-PROC-002-STEP-005` | Check order creation permission | System | Permission check | User | Continue or stop | `INFERIDO` |
| `AFS-PROC-002-STEP-006` | Check for an existing linked order | System | Relationship check | Proposal, order | Stop when a linked order exists | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-007` | Create the order from the proposal | System | Create order | Order, lines | Draft order | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-008` | Copy the proposal lines | System | Copy lines | Order lines | Same line count and values | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-009` | Link proposal and order | System | Persist relationship | Link | `propal → commande` | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-010` | Validate immediately when configured | System | Validate order | Order | Status becomes `1` | `DEMOSTRADO` |

### 6.2 Manual path

| ID | Step | Actor | Operation | Entities | Event or effect | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-STEP-011` | Open the accepted proposal | Commercial user | Read proposal | Proposal | Proposal card | `INFERIDO` |
| `AFS-PROC-002-STEP-012` | Press “Add order” | Commercial user | Start conversion | Proposal | Order creation screen | `INFERIDO` |
| `AFS-PROC-002-STEP-013` | Select the proposal lines to copy | Commercial user | Select lines | Proposal lines | Selected subset | `INFERIDO` |
| `AFS-PROC-002-STEP-014` | Create the order | Commercial user | Create order | Order, lines | Draft order | `INFERIDO` |
| `AFS-PROC-002-STEP-015` | Validate the order when required | Commercial user | Validate order | Order | Status becomes `1` | `INFERIDO` |

### 6.3 Alternate paths

| ID | Condition | Result | Evidence |
|---|---|---|---|
| `AFS-PROC-002-STEP-016` | Workflow module inactive or option disabled | No automatic order | `DEMOSTRADO` for option disabled; module check `INFERIDO` |
| `AFS-PROC-002-STEP-017` | User lacks order creation permission and no online-signature context | No automatic order | `INFERIDO` |
| `AFS-PROC-002-STEP-018` | A linked order already exists | No duplicate order; warning outside online signature | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-019` | Immediate validation option disabled | Order remains draft | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-020` | Manual conversion cancelled or no lines selected | No order, or order without selected lines | `PENDIENTE` |

### 6.4 Transaction and compensation

The proposal close, trigger execution, order creation and link are observed as a
single successful path. Whether a failure in line copy, order insert or link
insert rolls back the proposal close was not exercised. This remains
`PENDIENTE`. The automatic trigger returns an error code and records object
errors, but runtime rollback behavior is unverified.

## 7. Operations and use cases

### `AFS-PROC-002-UC-001` - close a proposal as accepted

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for demonstrated legacy behavior |
| Decision | `PENDING` |
| Implementation | `N/A` |

**Preconditions**

- The proposal exists and is validated.
- The caller is authenticated and authorized.

**Functional input**

- proposal identity;
- target status “accepted/signed”;
- optional notes.

**Effects**

- proposal status becomes `2` (`DEMOSTRADO`);
- `PROPAL_CLOSE_SIGNED` is emitted (`DEMOSTRADO`);
- signature metadata is recorded (`INFERIDO` from source);
- the customer is marked as a customer (`INFERIDO` from source).

**Postconditions**

- the proposal is readable as accepted;
- the automatic path may create an order.

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| Unknown proposal | Not found | `INFERIDO` |
| Invalid transition | Rejected or no-op | `PENDIENTE` |
| Trigger failure | Error returned; rollback unknown | `PENDIENTE` |

**Events emitted**

- `PROPAL_CLOSE_SIGNED`.

### `AFS-PROC-002-UC-002` - create an order automatically

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for demonstrated legacy behavior |
| Decision | `PENDING` |
| Implementation | `PENDING` |

**Preconditions**

- `WORKFLOW_PROPAL_AUTOCREATE_ORDER` is enabled;
- the workflow module and order module are active;
- the proposal is closed as accepted;
- no linked order exists, or the path stops.

**Effects**

- a customer order is created;
- proposal lines are copied;
- the proposal-order link is persisted;
- the order is validated when `ORDER_VALID_AFTER_CLOSE_PROPAL` is enabled.

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| Existing linked order | No new order | `DEMOSTRADO` |
| Workflow option disabled | No order | `DEMOSTRADO` |
| Missing order permission | No order | `INFERIDO` |
| Line copy failure | Error; rollback unknown | `PENDIENTE` |

**Events emitted**

- order creation and proposal-order link.

### `AFS-PROC-002-UC-003` - create an order manually

| Field | Value |
|---|---|
| Evidence | `INFERIDO` |
| Normative | `no` |
| Decision | `PENDING` |
| Implementation | `PENDING` |

**Preconditions**

- the proposal is accepted/signed;
- the order module is active;
- the user has order creation permission.

**Effects**

- the order creation screen opens with the proposal as origin;
- the user selects lines;
- a draft order is created;
- the order can be validated.

This use case requires runtime verification before any normative claim.

### `AFS-PROC-002-UC-004` - validate a new order immediately

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for demonstrated legacy behavior |
| Decision | `PENDING` |
| Implementation | `PENDING` |

**Preconditions**

- an order was created from a proposal;
- `ORDER_VALID_AFTER_CLOSE_PROPAL` is enabled.

**Effects**

- the order is validated;
- status becomes `1`;
- a normal order reference is assigned.

## 8. Business rules and invariants

| ID | Rule | Applies to | Trigger | Exception | Evidence | Normative |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-RULE-008` | The automatic path runs only for `PROPAL_CLOSE_SIGNED` | Proposal close | Accepted close | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-009` | The automatic path requires the workflow module and option | Automatic conversion | Close accepted | None observed | `DEMOSTRADO` for option; module `INFERIDO` | yes |
| `AFS-PROC-002-RULE-010` | An existing linked order stops duplicate creation | Automatic conversion | Close accepted | Online-signature warning suppression | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-011` | The automatic order is draft by default | Automatic conversion | Close accepted | `ORDER_VALID_AFTER_CLOSE_PROPAL` enabled | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-012` | Immediate validation changes the order status to validated | Automatic conversion | Close accepted | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-013` | Proposal lines are copied into the order with their description, quantity, unit price, VAT rate and totals | Automatic conversion | Close accepted | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-014` | The proposal-order link is persisted | Automatic conversion | Order created | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-015` | Online-signature context bypasses the order permission | Automatic conversion | Online signature | Only in that context | `INFERIDO` | no |
| `AFS-PROC-002-RULE-016` | Manual conversion requires order permission and module | Manual path | “Add order” | None observed | `INFERIDO` | no |
| `AFS-PROC-002-RULE-017` | Manual conversion copies only selected lines | Manual path | Order creation | None observed | `INFERIDO` | no |
| `AFS-PROC-002-RULE-018` | The automatic conversion is atomic with the proposal close | Transaction | Trigger execution | Not exercised | `PENDIENTE` | no |

## 9. Events, triggers and cross-module effects

| ID | Event or trigger | Producer | Consumers or affected modules | Condition | Active in commercial profile | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-EVT-001` | `PROPAL_CLOSE_SIGNED` | Proposal close | Workflow, other triggers | Accepted close | Yes | `DEMOSTRADO` |
| `AFS-PROC-002-EVT-002` | Automatic order creation | Workflow trigger | Order module | Workflow option enabled | Yes during test | `DEMOSTRADO` |
| `AFS-PROC-002-EVT-003` | Proposal-order link | Order creation | Generic element links | Order created from proposal | Yes | `DEMOSTRADO` |
| `AFS-PROC-002-EVT-004` | Immediate order validation | Order creation | Order module | `ORDER_VALID_AFTER_CLOSE_PROPAL` enabled | Yes during test | `DEMOSTRADO` |
| `AFS-PROC-002-EVT-005` | Online-signature context | Online-signature flow | Workflow trigger | `closedfromonlinesignature` present | Not exercised | `INFERIDO` |

## 10. Dependencies

| ID | Dependency | Direction | Why it matters | Evidence |
|---|---|---|---|---|
| `AFS-PROC-002-DEP-001` | Proposal module | upstream | Provides the accepted proposal and event | `DEMOSTRADO` |
| `AFS-PROC-002-DEP-002` | Order module | upstream | Required for automatic and manual conversion | `DEMOSTRADO` for automatic; `INFERIDO` for manual |
| `AFS-PROC-002-DEP-003` | Workflow module | upstream | Dispatches the automatic conversion | `DEMOSTRADO` |
| `AFS-PROC-002-DEP-004` | Third party | upstream | Customer for both proposal and order | `DEMOSTRADO` |
| `AFS-PROC-002-DEP-005` | User permissions | upstream | Manual and automatic authorization | `INFERIDO` except admin |
| `AFS-PROC-002-DEP-006` | Generic element-link persistence | downstream | Stores the proposal-order relationship | `DEMOSTRADO` |

## 11. Test scenarios

| ID | Scenario | Given | When | Then | Evidence | Purpose |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-TEST-001` | Automatic draft order | Accepted proposal, workflow option enabled, no linked order | Close as accepted | Draft order created and linked | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-002` | Automatic validated order | Same, `ORDER_VALID_AFTER_CLOSE_PROPAL=1` | Close as accepted | Validated order created | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-003` | Duplicate guard | Proposal already linked to an order | Close as accepted | No additional order | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-004` | Workflow option disabled | Accepted proposal, option disabled | Close as accepted | No order | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-005` | Manual conversion | Accepted proposal, authorized user | Press “Add order” and select lines | Draft order with selected lines | `INFERIDO` | verification |
| `AFS-PROC-002-TEST-006` | Manual permission denied | Accepted proposal, user without order permission | Open proposal card | “Add order” unavailable | `INFERIDO` | verification |
| `AFS-PROC-002-TEST-007` | Line value fidelity | Proposal with described lines and amounts | Convert automatically | Order lines preserve description, quantity, price, VAT and totals | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-008` | Online signature | Proposal closed from signature page | Complete signature | Order created without explicit order permission | `INFERIDO` | verification |
| `AFS-PROC-002-TEST-009` | Transaction rollback | Failure during line copy or link | Close as accepted | Proposal and order state follow a defined atomic outcome | `PENDIENTE` | verification |

## 12. Traceability

| Element | Evidence | Decision | Implementation | Test | Status |
|---|---|---|---|---|---|
| `AFS-PROC-002-UC-001` | `PROPAL-ORDER-REF-001` automatic conversion | `PENDING` | `N/A` | `TEST-001` | Characterized |
| `AFS-PROC-002-UC-002` | `PROPAL-ORDER-REF-001` automatic conversion | `PENDING` | `PENDING` | `TEST-001`, `TEST-002`, `TEST-007` | Characterized |
| `AFS-PROC-002-UC-003` | `PROPAL-ORDER-REF-001` source trace | `PENDING` | `PENDING` | `TEST-005`, `TEST-006` | Inferred |
| `AFS-PROC-002-UC-004` | `PROPAL-ORDER-REF-001` immediate validation | `PENDING` | `PENDING` | `TEST-002` | Characterized |
| `AFS-PROC-002-RULE-010` | `interface_20_modWorkflow_WorkflowManager.class.php` | `PENDING` | `PENDING` | `TEST-003` | Demonstrated |
| `AFS-PROC-002-RULE-013` | `commande.class.php` line copy | `PENDING` | `PENDING` | `TEST-007` | Demonstrated |

## 13. Open questions and pending verification

| Question | Why it matters | Required evidence | Owner or next step |
|---|---|---|---|
| Does the manual UI copy line values exactly, or only selected lines? | Defines the manual conversion contract | Controlled UI run with priced lines | Future characterization |
| What is the exact permission matrix for non-admin users? | Defines authorization behavior | Role-based runtime matrix | Future characterization |
| Does a trigger or line-copy failure roll back the proposal close? | Defines atomicity and compensation | Failure injection | Future characterization |
| What happens with discounts, local taxes or multi-currency lines? | Defines total fidelity | Controlled discount and multi-currency fixture | Future characterization |
| Does the online-signature path create exactly one order? | Completes the signature variant | Full signature flow | Future characterization |
| Are order references deterministic in all profiles? | Defines externally visible identity | Numbering configuration matrix | Future characterization |

## 14. Review record

| Field | Value |
|---|---|
| Reviewer | Pending |
| Review date | Pending |
| Reference confirmed | yes |
| Quality gates passed | Pending |
| Notes | Automatic path, duplicate guard, workflow disablement and line-value fidelity are demonstrated in the isolated commercial profile; manual UI and online signature remain inferred |
