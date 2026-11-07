---
spec_id: AFS-PROC-002
title: Accepted proposal to customer order
profile: process
status: draft
version: 0.2.0
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

This document describes Dolibarr AS-IS behavior. Here, `Normative: yes` applies
only to conformance with the scoped legacy observations. Automatic creation
without order-creation permission, empty draft orders and drafts left after
failed validation are not approved Alixar functional or security policies.
Their adoption, adaptation or rejection requires separate explicit Alixar
decisions; the decision and implementation fields remain `PENDING`.

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
- manual UI creation, empty selection, cancellation and later validation;
- basic non-admin permissions for the selected conversion boundary.

**Out of scope**

- proposal pricing, taxes and discount calculation;
- online-signature mechanics beyond their effect on permissions;
- exhaustive or advanced non-admin permission matrices;
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
| Relevant configuration | `WORKFLOW_PROPAL_AUTOCREATE_ORDER` enables automatic conversion; `ORDER_VALID_AFTER_CLOSE_PROPAL` requests immediate validation in `createFromProposal`, subject to validation success; it does not apply to UI draft creation |
| Reference limitation | The baseline profile does not enable commercial modules; this AFS uses the isolated `commercial-ES` profile |

## 3. Actors, permissions and restrictions

| ID | Actor or permission | Effect | Evidence |
|---|---|---|---|
| `AFS-PROC-002-PERM-001` | Authenticated commercial user | Can validate and close proposals according to permissions | `DEMOSTRADO` for admin and the restricted basic-permission fixture; other roles `PENDIENTE` |
| `AFS-PROC-002-PERM-002` | Order creation permission (`commande/creer`) | Required for the manual “Add order” action | `DEMOSTRADO` for the restricted HTTP UI fixture; source at `comm/propal/card.php:144,3671-3677` |
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
| `AFS-PROC-002-REL-001` | Proposal → Order | General maximum not established | yes | A pre-existing link prevents another automatic order in the sequential fixture; this is not a uniqueness or concurrency guarantee | `DEMOSTRADO` for the guard; general cardinality `PENDIENTE` |
| `AFS-PROC-002-REL-002` | Order → Order lines | zero-to-many | yes | UI submission with no selected lines can create an empty draft | `DEMOSTRADO` in the isolated HTTP UI fixture |
| `AFS-PROC-002-REL-003` | Proposal → Proposal lines | Multiple lines observed; general minimum not established | not established | Source lines for conversion | `DEMOSTRADO` for fixtures; general invariant `PENDIENTE` |
| `AFS-PROC-002-REL-004` | Proposal-order link → both objects | associative | no | Persisted in the generic element-link table | `DEMOSTRADO` |

### 4.4 Structural invariants

| ID | Invariant | Evidence |
|---|---|---|
| `AFS-PROC-002-RULE-001` | Only an accepted/signed proposal starts the automatic conversion path | `DEMOSTRADO`; the trigger runs on `PROPAL_CLOSE_SIGNED` |
| `AFS-PROC-002-RULE-002` | The automatic path does not create a duplicate when a linked order already exists | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-003` | The priced fixture preserves description, quantity, unit price, VAT rate and totals; this does not establish fidelity for all line types | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-004` | The proposal-order relationship is persisted | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-005` | Automatic creation starts as draft; configured immediate validation must succeed to change that state | `DEMOSTRADO` |
| `AFS-PROC-002-RULE-006` | The manual path requires the order module and order creation permission | `DEMOSTRADO` for permission denial; module requirement `INFERIDO` |
| `AFS-PROC-002-RULE-007` | The manual path copies only the lines selected by the user | `DEMOSTRADO` for the priced HTTP UI subset and empty selection |

## 5. Lifecycle and states

### 5.1 Proposal

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-002-ST-001` | Draft | `0` | Creation | Proposal can be edited | `INFERIDO` |
| `AFS-PROC-002-ST-002` | Validated | `1` | Validation | Proposal can be sent and closed | `INFERIDO` |
| `AFS-PROC-002-ST-003` | Signed/accepted | `2` | Close as signed | Emits `PROPAL_CLOSE_SIGNED`; third party changes from non-customer to customer in the controlled fixture | `DEMOSTRADO` |
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
| `AFS-PROC-002-STEP-004` | Detect online-signature context | System | Context check | Proposal | Set the technical user order-creation permission flag; not a creation gate | `INFERIDO`; full signature flow not exercised |
| `AFS-PROC-002-STEP-005` | Historical permission-gate inference discarded | System | Source correction | User | The workflow trigger has no order-creation permission gate before `createFromProposal` | `DEMOSTRADO` for restricted API close and workflow creation; corroborated by exact source |
| `AFS-PROC-002-STEP-006` | Check for an existing linked order | System | Relationship check | Proposal, order | Stop when a linked order exists | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-007` | Create the order from the proposal | System | Create order | Order, lines | Draft order | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-008` | Copy the proposal lines | System | Copy lines | Order lines | Same line count and values | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-009` | Link proposal and order | System | Persist relationship | Link | `propal → commande` | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-010` | Attempt validation immediately when configured | System | Validate order | Order | Status becomes `1` on success; denial leaves the created order in draft in the basic-permission fixture | `DEMOSTRADO` for both controlled outcomes |

### 6.2 Manual path

| ID | Step | Actor | Operation | Entities | Event or effect | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-STEP-011` | Open the accepted proposal | Commercial user | Read proposal | Proposal | Proposal card | `DEMOSTRADO` for the controlled HTTP UI fixture |
| `AFS-PROC-002-STEP-012` | Press “Add order” | Commercial user | Start conversion | Proposal | Order creation screen | `DEMOSTRADO` for the controlled HTTP UI fixture |
| `AFS-PROC-002-STEP-013` | Select the proposal lines to copy | Commercial user | Select lines | Proposal lines | Selected subset | `DEMOSTRADO` for the controlled HTTP UI fixture |
| `AFS-PROC-002-STEP-014` | Create the order | Commercial user | Create order | Order, lines | Draft order | `DEMOSTRADO` for the controlled HTTP UI fixture |
| `AFS-PROC-002-STEP-015` | Validate the order when required | Commercial user | Validate order | Order | Status becomes `1` | `DEMOSTRADO` for the controlled HTTP UI fixture |

### 6.3 Alternate paths

| ID | Condition | Result | Evidence |
|---|---|---|---|
| `AFS-PROC-002-STEP-016` | Workflow module inactive or option disabled | No automatic order | `DEMOSTRADO` for option disabled; module check `INFERIDO` |
| `AFS-PROC-002-STEP-017` | User lacks order creation permission | Automatic creation succeeds; later validation is denied in the restricted basic-permission fixture | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-018` | A linked order already exists | No additional automatic order in sequential fixture; warning outside online signature is source-derived | `DEMOSTRADO` for no additional order; warning `INFERIDO` |
| `AFS-PROC-002-STEP-019` | Immediate validation option disabled | Order remains draft | `DEMOSTRADO` |
| `AFS-PROC-002-STEP-020` | Manual empty selection versus explicit cancel | Empty submission creates a zero-line draft; explicit cancel creates no order | `DEMOSTRADO` in isolated HTTP UI fixtures |

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
- the initially non-customer third party is marked as customer (`DEMOSTRADO` in the follow-up fixture).

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
- immediate validation is attempted when `ORDER_VALID_AFTER_CLOSE_PROPAL` is enabled;
- successful creation/close does not by itself prove validation succeeded.

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| Existing linked order | No new order | `DEMOSTRADO` |
| Workflow option disabled | No order | `DEMOSTRADO` |
| Missing order creation permission | Automatic draft creation succeeds; subsequent validation is denied in the restricted fixture | `DEMOSTRADO` |
| Line copy failure | Error; rollback unknown | `PENDIENTE` |

**Events emitted**

- order creation and proposal-order link.

### `AFS-PROC-002-UC-003` - create an order manually

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` for controlled HTTP UI fixtures |
| Normative | `yes` only for the scoped observed legacy behavior |
| Decision | `PENDING` |
| Implementation | `PENDING` |

**Preconditions**

- the proposal is accepted/signed;
- the order module is active;
- the user has order creation permission.

**Effects**

- the order creation screen opens with the proposal as origin;
- the user selects zero or more lines and submits creation, or explicitly cancels;
- a draft order is created;
- later validation requires an eligible draft, an explicit user action and validation permission;
- `ORDER_VALID_AFTER_CLOSE_PROPAL` does not validate orders created by this UI action.

HTTP UI runtime observations are scoped to the isolated fixture in the reference
follow-up. They do not characterize JavaScript/browser interactions or all roles.

### `AFS-PROC-002-UC-004` - validate a new order immediately

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for demonstrated legacy behavior |
| Decision | `PENDING` |
| Implementation | `PENDING` |

**Preconditions**

- an order was created through `Commande::createFromProposal` (automatic/API);
- `ORDER_VALID_AFTER_CLOSE_PROPAL` is enabled;
- the actor has validation permission and validation succeeds.

**Effects**

- the order is validated;
- status becomes `1`;
- a normal order reference is assigned.

## 8. Business rules and invariants

| ID | Rule | Applies to | Trigger | Exception | Evidence | Normative |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-RULE-008` | The automatic path runs only for `PROPAL_CLOSE_SIGNED` | Proposal close | Accepted close | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-009` | The automatic path requires the workflow module and option | Automatic conversion | Close accepted | None observed | `DEMOSTRADO` for option; module `INFERIDO` | yes |
| `AFS-PROC-002-RULE-010` | An existing linked order stops additional creation in the sequential fixture | Automatic conversion | Close accepted | No concurrency or global uniqueness claim; signature warning suppression is source-only | `DEMOSTRADO` for sequential guard | yes |
| `AFS-PROC-002-RULE-011` | The automatic order is draft by default | Automatic conversion | Close accepted | `ORDER_VALID_AFTER_CLOSE_PROPAL` enabled | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-012` | Successful immediate validation changes the order status to validated | Automatic conversion | Close accepted | Permission denial can leave a created draft | `DEMOSTRADO` for admin success and restricted-user denial | yes |
| `AFS-PROC-002-RULE-013` | The controlled priced lines preserve description, quantity, unit price, VAT rate and totals; other line variants remain unverified | Automatic conversion | Close accepted | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-014` | The proposal-order link is persisted | Automatic conversion | Order created | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-002-RULE-015` | Online-signature context assigns the order-creation permission flag; it is not evidence of a creation gate | Automatic conversion | Online signature | Only in that context | `INFERIDO` | no |
| `AFS-PROC-002-RULE-016` | Manual conversion requires order permission and module | Manual path | “Add order” | None observed | `DEMOSTRADO` for permission denial; module requirement `INFERIDO` | no |
| `AFS-PROC-002-RULE-017` | Manual conversion copies only selected lines | Manual path | Order creation | None observed | `DEMOSTRADO` for the controlled HTTP UI fixture | no |
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
| `AFS-PROC-002-DEP-005` | User permissions | upstream | UI creation and later validation differ from automatic service creation | `DEMOSTRADO` for the scoped basic non-admin fixture; advanced roles `PENDIENTE` |
| `AFS-PROC-002-DEP-006` | Generic element-link persistence | downstream | Stores the proposal-order relationship | `DEMOSTRADO` |

## 11. Test scenarios

| ID | Scenario | Given | When | Then | Evidence | Purpose |
|---|---|---|---|---|---|---|
| `AFS-PROC-002-TEST-001` | Automatic draft order | Validated proposal, workflow option enabled, no linked order | Close as accepted | Draft order created and linked | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-002` | Automatic validated order | Same, `ORDER_VALID_AFTER_CLOSE_PROPAL=1` | Close as accepted | Validated order created | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-003` | Duplicate guard | Proposal already linked to an order | Close as accepted | No additional order | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-004` | Workflow option disabled | Validated proposal, option disabled | Close as accepted | No order | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-005` | Manual conversion | Accepted proposal, authorized user | Press “Add order” and select lines | Draft order with selected lines | `DEMOSTRADO` for the controlled HTTP UI fixture | verification |
| `AFS-PROC-002-TEST-006` | Manual permission denied | Accepted proposal, user without order permission | Open proposal card | “Add order” unavailable | `DEMOSTRADO` for the controlled HTTP UI fixture | verification |
| `AFS-PROC-002-TEST-007` | Line value fidelity | Proposal with described lines and amounts | Convert automatically | Order lines preserve description, quantity, price, VAT and totals | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-008` | Online signature | Proposal closed from signature page | Complete signature | Full signature outcome not exercised; only permission assignment traced | `PENDIENTE` runtime, `INFERIDO` source | verification |
| `AFS-PROC-002-TEST-009` | Transaction rollback | Failure during line copy or link | Close as accepted | Proposal and order state follow a defined atomic outcome | `PENDIENTE` | verification |
| `AFS-PROC-002-TEST-010` | Empty selection | Accepted proposal, authorized UI user | Submit creation with no selected lines | Linked zero-line draft | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-011` | Explicit cancel | Accepted proposal, authorized UI user | Cancel creation | No new order or link | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-012` | Restricted automatic creation | Proposal permission, no order creation permission | Close through proposal API with workflow enabled | Linked draft order is created | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-013` | Later validation permissions | Created draft | Restricted service/API validation; authorized UI confirmation | Restricted validation denied; authorized UI validates | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-014` | Immediate validation denied | Restricted user and immediate option enabled | Close proposal through API | Close succeeds; linked order remains draft | `DEMOSTRADO` | conformance |
| `AFS-PROC-002-TEST-015` | Third-party reclassification | Non-customer third party | Accept proposal | Third party becomes customer | `DEMOSTRADO` for this fixture | conformance |

## 12. Traceability

| Element | Evidence | Decision | Implementation | Test | Status |
|---|---|---|---|---|---|
| `AFS-PROC-002-UC-001` | `PROPAL-ORDER-REF-001` automatic conversion | `PENDING` | `N/A` | `TEST-001` | Characterized |
| `AFS-PROC-002-UC-002` | `PROPAL-ORDER-REF-001` automatic conversion | `PENDING` | `PENDING` | `TEST-001`, `TEST-002`, `TEST-007` | Characterized |
| `AFS-PROC-002-UC-003` | `PROPAL-ORDER-REF-001` audit follow-up | `PENDING` | `PENDING` | `TEST-005`, `TEST-006`, `TEST-010`, `TEST-011` | Demonstrated in scoped HTTP UI fixtures |
| `AFS-PROC-002-UC-004` | `PROPAL-ORDER-REF-001` immediate validation | `PENDING` | `PENDING` | `TEST-002` | Characterized |
| `AFS-PROC-002-RULE-010` | `interface_20_modWorkflow_WorkflowManager.class.php` | `PENDING` | `PENDING` | `TEST-003` | Demonstrated |
| `AFS-PROC-002-RULE-013` | `commande.class.php` line copy | `PENDING` | `PENDING` | `TEST-007` | Demonstrated |

## 13. Open questions and pending verification

| Question | Why it matters | Required evidence | Owner or next step |
|---|---|---|---|
| Do other line types preserve their values during manual conversion? | Priced subset and empty selection are covered; broader fidelity is not | Additional fixtures outside this pilot | Future characterization |
| What is the advanced/exhaustive permission matrix? | Basic creation and validation permissions are covered by the follow-up only | Advanced roles outside this pilot | Future characterization |
| Does a trigger or line-copy failure roll back the proposal close? | Defines atomicity and compensation | Failure injection | Future characterization |
| What happens with discounts, local taxes or multi-currency lines? | Defines total fidelity | Controlled discount and multi-currency fixture | Future characterization |
| Does the online-signature path create exactly one order? | Completes the signature variant | Full signature flow | Future characterization |
| Are order references deterministic in all profiles? | Defines externally visible identity | Numbering configuration matrix | Future characterization |

## 14. Review record

| Field | Value |
|---|---|
| Reviewer | Codex, independent audit and correction review |
| Review date | 2026-11-07 |
| Reference confirmed | yes |
| Quality gates passed | Scoped commercial runtime assertions; BPMN XSD, structure and visual review; reference `./bin/check` passed at closure |
| Notes | Independent correction: manual HTTP UI and basic restricted permissions reproduced; full browser interactions, advanced permissions and online signature remain unverified |

## 15. Independent audit correction

The earlier inference that missing order-creation permission prevents workflow
creation is **Discarded**: the exact trigger contains no such gate. The manual
creation action does not use `ORDER_VALID_AFTER_CLOSE_PROPAL`. Empty selection
is not cancellation. BPMN maps reflect these corrections and distinguish later
user-requested validation from automatic validation.

Historical observations remain in `PROPAL-ORDER-REF-001`. New runtime results,
fixture scope, failed attempts and remaining gaps are recorded separately in
`dolibarr-reference: reference/characterization/PROPAL-ORDER-REF-001-audit-follow-up.md`.
No Alixar contract or implementation decision is approved by this evidence.
