---
spec_id: AFS-PROC-004
title: Customer invoicing from orders, shipments or explicit lines
profile: process
status: draft
version: 0.1.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: invoicing-ES
evidence_cutoff: 2026-11-08
related_characterizations:
  - dolibarr-reference: reference/characterization/INVOICE-ROUTES-REF-001-invoicing-routes.md
related_decisions: []
related_implementation: []
---

# AFS-PROC-004 — Customer invoicing

## 1. Purpose and scope

Describe the demonstrated Dolibarr AS-IS business boundary from a customer order,
a shipment or caller-supplied lines to a draft and then validated standard
customer invoice. This specification covers full, percentage and selected-line
order invoicing, shipment quantities, document relationships, repeated creation,
basic permission outcomes and independently configured stock effects.

All Alixar adoption decisions and implementation remain **Pending**. Normative
status below means **legacy conformance within the stated fixtures only**;
it does not approve an Alixar rule, canonical API or TO-BE process.

Upstream: [AFS-PROC-002](AFS-PROC-002-proposal-to-order.md) and
[AFS-PROC-003](AFS-PROC-003-order-to-shipment.md). A proposal is optional upstream
context, not a separately demonstrated proposal-to-invoice route. Collection,
payments, deposits, credit notes, replacement/situation invoices, accounting,
legal finality, advanced taxes/permissions, concurrent requests, batches, services
and multiple warehouses are `FUERA DE ALCANCE` of this slice; see section 13.

Three maps describe materially different business inputs, not five technical
entry points:

- [Order conversion](../processes/PROC-INV-001-ASIS-ORDER.bpmn): full conversion
  through three entry boundaries, with percentage/selection variants only on
  the exercised form route.
- [Shipment conversion](../processes/PROC-INV-001-ASIS-SHIPMENT.bpmn): shipment
  quantities and both shipment/order links, with earlier shipment stock effects.
- [Explicit lines](../processes/PROC-INV-001-ASIS-EXPLICIT.bpmn): caller chooses
  invoice content and supplies links; no automatic source-document conversion.

## 2. Reference context and inventory

Evidence keys used throughout this document:

- **REF**: [characterization](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-invoicing-routes.md).
- **OBS**: [structured capture](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-observed.json).
- **HASH**: [source manifest](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-source-hashes.json).
- **FIX**: [reproduction fixture](../../../dolibarr-reference/scripts/check-invoicing.php).

The reference repository includes these artifacts in merged commit
`ae4507b02ac1b04a96e597d2745b2f3ea44cd9b0` (PR #5). Dolibarr itself is pinned
to the distinct source commit in the front matter. OBS retains **27 observations,
35 HTTP results and ten matching installed-source SHA-256 comparisons**. Evidence
was reused, not regenerated for this modeling task. REF's validation history
records successful `./bin/check-invoicing` and separate `./bin/check`, cleanup,
fixture/runner hashes and the corrected first-run observation-query failure.

| Context | Value / evidence |
|---|---|
| Profile | Disposable invoicing-ES; API, Societe, Propale, Commande, Expedition, Product, Stock, Facture; Workflow disabled; REF reference/isolation and OBS context/assertions |
| Locale | Entity 1, ES, es_ES, EUR, Europe/Madrid |
| Fixtures | Standard invoices; two distinct stockable products, order quantities 5 / 3, opening stock 10 / 10; partial shipment 2 / 1; one warehouse per independent scenario |
| Basic rights | Advanced permissions disabled; administrator successes and scoped non-admin checks in INV-PERM-001 |
| Stock configuration | Order validation, shipment validation and invoice timing varied independently; shipment-close timing disabled here; invoice warehouse argument positive or zero as recorded |
| Evidence boundary | Controlled real HTTP forms, API requests, internal business calls and persistence reads; no full browser interaction or universal interchangeability |

The existing characterization owns the UI, API, schema, configuration and source
inventory. REF sections [Route matrix](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-invoicing-routes.md#route-matrix),
[Source trace and configuration](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-invoicing-routes.md#source-trace-and-configuration)
and HASH are the technical authority; this AFS does not duplicate their payloads.

## 3. Actors, permissions and restrictions

| ID | Actor / restriction | Evidence | Normative |
|---|---|---|---|
| `AFS-PROC-004-PERM-001` | Reader with customer visibility and order/invoice read rights can read an invoice, but cannot create by explicit lines, convert an order or validate through the API without invoice creation permission | `DEMOSTRADO`: INV-PERM-001, OBS HTTP 200 / 403 / 403 / 403; TEST-010 | yes |
| `AFS-PROC-004-PERM-002` | Validation through an internal business call rejects the restricted reader, leaving the draft | `DEMOSTRADO`: INV-PERM-001 / reader_denied; FIX assertion; TEST-010 | yes |
| `AFS-PROC-004-PERM-003` | Granting basic invoice creation permission to that same actor allows order conversion and validation through API | `DEMOSTRADO`: INV-PERM-001 / creator_validated, HTTP 200; TEST-010 | yes |
| `AFS-PROC-004-PERM-004` | UI order/shipment entry availability depends on modules, source status, rights and configuration; source-order API draft/canceled guards exist | `INFERIDO`: REF source trace; unexecuted combinations and forged requests need verification, TEST-011 | no |

Successful form creations and direct order conversion use the administrator.
Do not apply the API denial matrix automatically to direct creation calls or
claim a universal validation-role split: advanced rights are `PENDIENTE`.

## 4. Conceptual model

### 4.1 Entities and business attributes

| ID | Entity | Business attributes / meaning | Evidence | Normative |
|---|---|---|---|---|
| `AFS-PROC-004-ENT-001` | Customer order | Customer, original product quantities and status; billed classification is separate from invoiced totals | `DEMOSTRADO`: TEST-001–004, OBS order fields | yes |
| `AFS-PROC-004-ENT-002` | Shipment | Shipped product quantities, originating order and status | `DEMOSTRADO`: TEST-005, OBS shipment fields | yes |
| `AFS-PROC-004-ENT-003` | Customer invoice and lines | Customer, standard type, draft/validated state, unpaid flag, product, quantity and amount; quantity and monetary amount are distinct | `DEMOSTRADO`: TEST-001–006, OBS invoice/linked_invoices; FIX standard type | yes |
| `AFS-PROC-004-ENT-004` | Warehouse stock movement | Signed quantity, product, warehouse and originating business document | `DEMOSTRADO`: TEST-007–009, OBS stock_movements | yes |

These are observed business attributes, not a proposed Alixar schema. Required
fields and general data-type/validation contracts beyond the fixtures are
`PENDIENTE`; no canonical input contract is defined here.

### 4.2 Relationships and structural limits

| ID | Relationship | Observed cardinality / lifecycle boundary | Evidence | Normative |
|---|---|---|---|---|
| `AFS-PROC-004-REL-001` | Order → invoices | One order has multiple invoices in repeated sequential fixtures; no universal maximum or deletion rule established | `DEMOSTRADO`: TEST-001, TEST-003, OBS links | yes |
| `AFS-PROC-004-REL-002` | Shipment → invoices and order → invoices | Both links persist; order → shipment remains; several invoices can refer to the same shipment | `DEMOSTRADO`: TEST-005, OBS links | yes |
| `AFS-PROC-004-REL-003` | Explicit invoice → source order relationship | Caller supplies the link; source identifier alone was not tested | `DEMOSTRADO`: TEST-006, FIX generic payload and OBS links | yes |
| `AFS-PROC-004-REL-004` | Source lines → invoice lines | No persistent source-order-line foreign key demonstrated; matching by unique product is a fixture calculation, not universal line identity | `PENDIENTE`: REF persisted relationships; duplicate-product/structured-line verification needed | no |

TEST-001 retains proposal → order, with no direct proposal → invoice in the
queried relationships (`DEMOSTRADO`, OBS INV-ROUTE-001). It establishes neither
universal transitive linking nor its universal absence. Deletion, unvalidation
and compensation effects on all relationships remain `PENDIENTE` (section 13).

## 5. Lifecycle and states

| ID | State / transition | Observed effect | Evidence | Normative |
|---|---|---|---|---|
| `AFS-PROC-004-ST-001` | Creation → draft | Invoice state 0, unpaid; separate validation follows | `DEMOSTRADO`: TEST-001–006, draft observations | yes |
| `AFS-PROC-004-ST-002` | Draft → validated | Invoice state 1, unpaid; stock effect conditional | `DEMOSTRADO`: TEST-001–010 | yes |
| `AFS-PROC-004-ST-003` | Repeat validation | Already validated API request reports nothing done (304), distinct from creating a second invoice | `DEMOSTRADO`: TEST-010, OBS final HTTP record; no concurrent idempotence claim | yes |
| `AFS-PROC-004-ST-004` | Source order remains validated/not billed; separate billed classification | Two validated full invoices do not automatically classify the order billed in the disabled-workflow fixture; explicit classification then prevents tested API order conversion | `DEMOSTRADO`: TEST-001, TEST-003 | yes |
| `AFS-PROC-004-ST-005` | Paid/closed, abandoned, reversal | Source states/transitions exist, but runtime transitions were not exercised | `INFERIDO`: REF quantities/states and source trace; execution `PENDIENTE`, TEST-011 | no |

Validation does not establish payment, accounting posting, physical receipt or
legal finality. No transition to those outcomes appears in the maps.

## 6. Process flow and alternatives

All rows below are `DEMOSTRADO` at their stated execution boundary, with
`Normative: yes` for that legacy boundary only. Graphical arrangement of operator
choices is descriptive (`INFERIDO`), not evidence of a separately observed UI.

| ID | Actor / step | Entities and outcome | Evidence |
|---|---|---|---|
| `AFS-PROC-004-STEP-001` | Operator: supply order-based invoice content | Full order copy, percentage quantities or selected original lines; UI offers all three, tested API/class conversion copies full order | TEST-001–004; UC-001 |
| `AFS-PROC-004-STEP-002` | Operator / system: convert selected shipment | Copy shipped quantities and retain shipment plus order relationships | TEST-005; UC-002 |
| `AFS-PROC-004-STEP-003` | Caller: supply explicit invoice lines and links | Content chosen by caller, not copied from linked order | TEST-006; UC-003 |
| `AFS-PROC-004-STEP-004` | System: create linked draft | Draft invoice exists independently of later validation | TEST-001–006; ST-001 |
| `AFS-PROC-004-STEP-005` | Actor / system: request and perform validation | Validated invoice with conditional stock movement; restricted actor can be denied and draft remains | TEST-007–010; UC-004 |

### 6.1 Alternate paths

Creation without basic permission is denied on the tested API entries; no
successful invoice ID is returned (PERM-001). After explicit billed classification,
order conversion through the tested API is refused (TEST-003). A failed internal
validation leaves the draft (PERM-002). These are bounded outcomes, not a generic
error/rollback guarantee for every channel. No empty-selection, cancel-form,
stock-shortage or injected failure route is asserted here.

Repeated creation is another execution of the same business route, not a new
process or a prerequisite on positive remaining quantity (RULE-002). BPMN notes
describe its evidence without inventing a scheduler or mandatory retry loop.

### 6.2 Transaction and compensation

Creation and validation were separate actions. A denied validation does not
remove the existing draft. Atomicity across linked documents, rollback after
partial failures and compensation after invoice cancellation are `PENDIENTE`;
no distributed transaction or automatic stock compensation is modeled.

## 7. Operations and use cases

Every operation is `DEMOSTRADO`, `Normative: yes` **only within its stated
boundary**; Decision: **Pending**; Implementation: **Pending**.

| ID | Preconditions / functional input | Effects and postconditions | Observable errors / evidence |
|---|---|---|---|
| `AFS-PROC-004-UC-001` | Tested validated order; actor/channel as TEST-001–004; full copy, percentage or selected lines within the exercised channel | Linked draft; original quantities, scaled quantities or selected original quantities; no automatic net remainder | API permission denial and billed-order refusal only as TEST-003/010; source-only guards PERM-004 |
| `AFS-PROC-004-UC-002` | Tested validated partial shipment; administrator form creation | Linked draft uses shipped quantities and retains order relationship | TEST-005; shipment-specific denied/invalid input variants `PENDIENTE` |
| `AFS-PROC-004-UC-003` | Caller supplies customer, standard invoice, explicit product line and order link through API | Draft contains supplied quantity 1; no copying of the other order line | TEST-006; basic API creation denial TEST-010 |
| `AFS-PROC-004-UC-004` | Draft exists; actor requests validation; selected stock configuration and warehouse | Validated/unpaid invoice or denied draft; no movement inferred from status alone | TEST-007–010; repeat validation ST-003; other failures `PENDIENTE` |

Emitted lifecycle events are source-derived only (EVT-002), not part of the
demonstrated postconditions. This table is a business summary, not an API schema.

## 8. Business rules and quantity meanings

| ID | Rule / scope and exception | Evidence | Normative |
|---|---|---|---|
| `AFS-PROC-004-RULE-001` | Full conversion uses original 5 / 3; percentage 50% uses 2.5 / 1.5; later first-line selection uses original 5, not remaining 2.5. Percentage/selection are demonstrated only for the form route | `DEMOSTRADO`: TEST-001–004 | yes |
| `AFS-PROC-004-RULE-002` | Sequential repeated order/shipment creation can invoice original quantities again: order totals 10 / 6; shipment totals 4 / 2 against shipped 2 / 1. No universal duplicate-prevention or net-quantity lock is established | `DEMOSTRADO`: TEST-001, TEST-003, TEST-005; concurrent behavior `PENDIENTE` | yes |
| `AFS-PROC-004-RULE-003` | Fixture arithmetic remaining = original order quantities minus linked standard-invoice quantities in validated state, matched by unique product. Draft totals are separate. Negative results remain negative; this is not a reference-system remainder service or a quantity guard | `DEMOSTRADO`: OBS calculated fields, FIX snapshot; TEST-001–006 | yes |
| `AFS-PROC-004-RULE-004` | Order billed classification, invoice count, quantity totals, invoice state and monetary amounts are distinct facts | `DEMOSTRADO`: TEST-001/003; ST-004 | yes |
| `AFS-PROC-004-RULE-005` | Invoice stock timing plus positive validation warehouse decrements stock; zero warehouse validates without invoice movement. Other timing configurations do not gain an invoice movement merely from validation | `DEMOSTRADO`: TEST-007/008; no module-disabled/shortage generalization | yes |
| `AFS-PROC-004-RULE-006` | Shipment and invoice decrements can both apply to the same shipped quantities when both timings are enabled; no automatic deduplication of those movements demonstrated | `DEMOSTRADO`: TEST-009 only; not a recommended configuration | yes |

## 9. Events, effects and dependencies

| ID | Producer / condition | Consumer or affected concept / ordering | Evidence | Normative |
|---|---|---|---|---|
| `AFS-PROC-004-EVT-001` | Order validation, shipment validation or invoice validation under its own timing | Physical stock; order decrease can precede invoice draft; shipment decrease precedes shipment invoice; invoice decrease occurs on validation with positive warehouse | `DEMOSTRADO`: TEST-007–009 and OBS movement origins; cross-module atomicity unknown | yes |
| `AFS-PROC-004-EVT-002` | Invoice lifecycle dispatch sites | Optional module/extension consumers; no event spy, runtime delivery/order unverified | `INFERIDO`: REF source trace, creation/validation/reversal/cancellation dispatch; TEST-011 | no |
| `AFS-PROC-004-DEP-001` | Selected invoice, source-document and stock modules/configuration | Functional upstream dependencies observed only in the enabled composition; disabled variants not executed | `DEMOSTRADO`: REF context, OBS assertions/configurations; TEST-007–009; general module matrix `PENDIENTE` | no |
| `AFS-PROC-004-DEP-002` | Optional workflow automatic or grouped invoice creation | Inactive candidates, not a step after shipment/order completion in these maps | `INFERIDO`: REF INV-CAND-001/002; runtime contract `PENDIENTE`, TEST-011 | no |

The stable technical event/configuration identifiers and exact source locations
remain in REF. No runtime dependency on a process engine is introduced.

## 10. Observable scenarios

All selectors below address OBS `evidence.observations[]` by `scenario` / `stage`;
HTTP assertions are in `evidence.http` / `evidence.assertions`. The 27 observations
partition as 3 + 3 + 4 + 2 + 4 + 2 route observations, 2 + 2 + 1 + 2 stock
observations, and 2 permission observations. No new functional execution occurred.

| ID | Given / When | Observable Then | Evidence / purpose |
|---|---|---|---|
| `AFS-PROC-004-TEST-001` | Given validated 5 / 3 order and all stock timings off, when administrator creates full invoices through forms and validates each through API | First draft/validated 5 / 3; second validated total 10 / 6; remaining -5 / -3; stock 10 / 10; order validated/not billed | `DEMOSTRADO`: INV-ROUTE-001 / full_draft, full_validated, repeat_validated (3); conformance |
| `AFS-PROC-004-TEST-002` | Given another 5 / 3 order, when 50% form conversion is validated then first original line is selected and validated | 2.5 / 1.5 then aggregate 7.5 / 1.5; arithmetic remaining -2.5 / 1.5 | `DEMOSTRADO`: INV-ROUTE-001-P / partial_draft, partial_validated, selected_line_validated (3); conformance |
| `AFS-PROC-004-TEST-003` | Given tested order, when API conversion is repeated and both invoices validated, then order explicitly classified billed and conversion retried | Draft then validated quantities 5 / 3; repeat total 10 / 6; explicit billed flag followed by 405 refusal | `DEMOSTRADO`: INV-ROUTE-002 / draft, validated, repeat_validated, explicitly_billed (4), HTTP 405; conformance |
| `AFS-PROC-004-TEST-004` | Given tested order and administrator, when direct internal order conversion and validation are invoked | Draft then validated invoice 5 / 3 with order link | `DEMOSTRADO`: INV-ROUTE-003 / draft, validated (2); conformance |
| `AFS-PROC-004-TEST-005` | Given partial shipment 2 / 1 with shipment-only stock timing, when shipment form conversion and API validation are repeated | Stock already 8 / 9; invoice totals 2 / 1 then 4 / 2 without new movement; both shipment/order links persist | `DEMOSTRADO`: INV-ROUTE-004 / shipment_validated, draft, validated, repeat_validated (4); conformance |
| `AFS-PROC-004-TEST-006` | Given order 5 / 3, when generic creation supplies one product quantity 1 and an explicit order link, then validation follows | Draft then validated invoice contains only supplied line; aggregate 1 / 0, remaining 4 / 3; order link retained | `DEMOSTRADO`: INV-ROUTE-005 / draft, validated (2); conformance |
| `AFS-PROC-004-TEST-007` | Given order-only or invoice-only timing, when order conversion creates draft then invoice validates with warehouse | Order timing: stock already 5 / 7 at draft and stays so; invoice timing: 10 / 10 at draft then 5 / 7, with corresponding distinct origins | `DEMOSTRADO`: INV-STOCK-order and INV-STOCK-invoice / draft, validated (4); conformance |
| `AFS-PROC-004-TEST-008` | Given invoice stock timing, when invoice validates with warehouse argument zero | Validated invoice but stock 10 / 10; opening movements only | `DEMOSTRADO`: INV-STOCK-warehouse / validated (1); conformance |
| `AFS-PROC-004-TEST-009` | Given both shipment-validation and invoice timings, when shipment 2 / 1 is validated then its invoice validates with positive warehouse | Invoice draft stock 8 / 9; validated stock 6 / 8; both shipment and invoice movements | `DEMOSTRADO`: INV-STOCK-combined / draft, validated (2); conformance |
| `AFS-PROC-004-TEST-010` | Given restricted reader, when API read/mutations and internal validation are attempted; then basic creation permission is granted for API conversion/validation and validation replay | Read 200; mutations 403; internal validation rejected, draft remains. After grant, conversion/validation 200, replay 304 | `DEMOSTRADO`: INV-PERM-001 / reader_denied, creator_validated (2), HTTP/assertions; conformance |
| `AFS-PROC-004-TEST-011` | Given unexecuted guards, advanced roles, lifecycle/automatic/grouped variants or failure/concurrency cases, when separately characterized | Required result must be observed before asserting conformance; no expected business result imposed | `INFERIDO` / `PENDIENTE`: REF source trace and candidates/limits; verification only |

## 11. BPMN → AFS → evidence traceability

Element IDs are prefixed `O_` (order), `S_` (shipment) or `E_` (explicit lines).
The XML documentation repeats the supporting AFS elements and TEST selectors.
Technical entry mapping below is traceability, not a canonical Alixar API.

| Reference route / boundary | Map and principal elements | AFS / scenario |
|---|---|---|
| INV-ROUTE-001: order-card HTTP forms, API validation | ORDER: O_Mode, O_Full, O_Percent, O_Select, O_Create, O_Validate | UC-001/004, RULE-001/002; TEST-001/002 |
| INV-ROUTE-002: POST /invoices/createfromorder/{orderid}, API validation | ORDER: O_Full, O_Create, O_Created, O_Refused, O_Validate | UC-001/004, ST-004; TEST-003 |
| INV-ROUTE-003: Facture::createFromOrder and class validation, administrator | ORDER: O_Full, O_Create, O_Validate | UC-001/004; TEST-004; no class creation-denial matrix |
| INV-ROUTE-004: shipment-card HTTP forms, API validation | SHIPMENT: S_Copy, S_Create, S_Validate; S_ContextNote records upstream context only | UC-002/004, REL-002; TEST-005 |
| INV-ROUTE-005: generic POST /invoices with explicit lines and links | EXPLICIT: E_Supply, E_Create, E_Created, E_Validate | UC-003/004, REL-003; TEST-006 |
| INV-STOCK-order/invoice/warehouse/combined | O_ContextNote / S_ContextNote at source boundaries; O_StockNote / S_StockNote associated with O_Validate / S_Validate | EVT-001, RULE-005/006; TEST-007–009; observed effects/context, not activities or additional creation routes |
| INV-PERM-001 | O_Created/O_Refused, E_Created/E_Refused; O_Validated/O_Draft, E_Validated/E_Draft | PERM-001–003; TEST-010; only exercised boundaries apply |

### Complete element coverage

All short AFS IDs below use the `AFS-PROC-004-` prefix. TEST-001–010 and their
demonstrated legacy facts are normative only as scoped in the tables above.
TEST-011 and all source-only or unknown items are non-normative. Decision and
implementation for every element: **Pending** (no approved adoption link).

| BPMN elements | AFS support / evidence label |
|---|---|
| O_Start, O_Mode, O_F1–O_F4, O_Full, O_Percent, O_Select, O_F5–O_F7, O_Join, O_F8 | STEP-001, RULE-001, TEST-001–004; `DEMOSTRADO` content, `INFERIDO` choice arrangement; percentage/selection conditioned on form route |
| O_Create, O_F9, O_Created, O_F10/O_F11, O_Refused | STEP-004, UC-001, ST-001, PERM-001, TEST-001–004/010; `DEMOSTRADO`; refusal restricted to tested API permission/billed outcomes, not direct class creation |
| O_Validate, O_F12, O_Validated, O_F13/O_F14, O_Draft | STEP-005, UC-004, ST-002, PERM-002/003, TEST-001–004/010; `DEMOSTRADO` successes and scoped validation denial |
| O_End | ST-002/004, TEST-001/003; `DEMOSTRADO` invoice state after successful validation; reached directly by O_F13 |
| S_Start, S_F1, S_Copy, S_F3, S_Create, S_F4 | STEP-002/004, UC-002, REL-002, TEST-005/009; `DEMOSTRADO` activities: copy shipment quantities and create linked draft; validated source is an upstream boundary, not an inspection task |
| S_Validate, S_F5, S_End | STEP-005, UC-004, ST-002, TEST-005/009; `DEMOSTRADO` validation and resulting state at administrator/API boundary; no shipment-path denial branch is asserted |
| E_Start, E_Supply, E_F1/E_F2, E_Create, E_F3, E_Created, E_F4/E_F5, E_Refused | STEP-003/004, UC-003, REL-003, ST-001, PERM-001, TEST-006/010; `DEMOSTRADO`; explicit input is not automatic conversion |
| E_Validate, E_F6, E_Validated, E_F7, E_End | STEP-005, UC-004, ST-002, TEST-006; `DEMOSTRADO` generic-origin API success; no generic-path stock variant asserted |
| E_F8, E_Draft | PERM-001, TEST-010: denial demonstrated on an order-origin draft; extension to a generic-origin draft is `INFERIDO`, `Normative: no`, that runtime variant `PENDIENTE` |
| O_ContextNote, S_ContextNote | Context captured by harness: opening stock 10 / 10, shipped quantities 2 / 1, and pre-invoice balances 5 / 7 after order validation or 8 / 9 after shipment validation. TEST-005/007/009, OBS stock/stock_movements. Facts `DEMOSTRADO`, but no stock-inspection activity demonstrated |
| O_StockNote, S_StockNote associated with O_Validate, S_Validate | Observed functional effects: RULE-005/006, EVT-001, TEST-005/007–009. `DEMOSTRADO` conditioned invoice-validation movement or absence of movement, including double decrease when both timings apply. Not tasks or subsequent mutations |
| O_RouteNote, O_RepeatNote, S_RouteNote, S_RepeatNote, E_RouteNote, E_LimitNote | Scope summaries of corresponding rows; `INFERIDO` guards / `PENDIENTE` variants visibly separated; not additional execution paths |
| All *_Assoc* and BPMN-DI shapes/edges | Presentation/trace links only; structural/import/render checks, no additional behavior |

### Representation categories

| Category | Meaning / examples | Evidence status |
|---|---|---|
| Demonstrated business activity | Create a draft or validate it: O_Create/O_Validate, S_Copy/S_Create/S_Validate, E_Create/E_Validate | `DEMOSTRADO` only at the form/API/class boundaries and scenarios listed above |
| Observed functional effect | Validation changes invoice state and may move stock; annotations O_StockNote/S_StockNote attach the effect to the operation that causes it | `DEMOSTRADO` for recorded timing/warehouse cases; not a separate observation activity |
| Contextual data captured by harness | Opening balances, source quantities and prior balances in O_ContextNote/S_ContextNote; prior decreases are attributed to upstream order/shipment validation | Captured facts `DEMOSTRADO`; capture/inspection is not an ERP business step or prerequisite |
| Inferred or pending behavior | Choice arrangement, unexecuted guards, generic-origin denial E_F8/E_Draft and untested variants | `INFERIDO` / `PENDIENTE`, non-normative; neither context nor observed effects promote these to demonstrated activities |

Removed observation-task IDs O_Stock, S_Source and S_Stock are retired, not
reassigned. Their obsolete connector IDs O_F15, S_F2 and S_F6 are also retired;
O_F13, S_F1 and S_F5 now connect the remaining business nodes directly. All
unaffected business element IDs are retained.

## 12. Modeling and validation record

The BPMN models are descriptive, standard BPMN 2.0 with BPMN-DI and
`isExecutable="false"`. Conditions describe the selected legacy fixture; they
are not executable expressions. Stock effects are annotations on validation;
upstream balances/quantities are context, without observation tasks. Repeated creation is documented at
the relevant creation task; replaying validation is a distinct observation.

Technical validation results and tooling are recorded in
[the modeling validation report](../processes/ALIXAR-REF-005-validation.md).
XSD/import/render correctness does not prove functional fidelity. OBS remains
the runtime authority; no Dolibarr functional suite is rerun for these models.

## 13. Open questions and exclusions

| Status / question | Evidence needed / next step |
|---|---|
| `INFERIDO`: disabled UI switches, draft/canceled API guard and trigger dispatch | Separate approved runtime entry/event observations against REF pinned source; TEST-011 |
| `PENDIENTE`: full browser interaction, forged requests, direct helper authorization matrix and advanced create/validate roles | Controlled actors/permissions at each boundary; no propagation of API guards to helpers |
| `PENDIENTE`: duplicate-product source lines, structured lines and universal line relationships | Retained source/target line identities and quantity observations for those fixtures |
| `PENDIENTE`: concurrency, transaction failures, rollback and compensation | Independent requests, injected failures and before/after movements/links; no universal prevention or atomicity assertion |
| `INFERIDO` candidates, execution `PENDIENTE`: automatic/grouped routes | Separate scope and observed selection/grouping contracts; not mapped as demonstrated alternatives |
| `FUERA DE ALCANCE`: payment/collection, paid/abandoned transitions, reversals, deposits, credit notes, replacement/situation invoices and accounting/legal finality | Tracked here and in BM-06 remainder; separately approved characterization needed |
| `FUERA DE ALCANCE`: advanced taxes, batches, services and multiple warehouses | Tracked here, BM-07/BM-08; separately approved variant evidence needed |

Owner/next step for every row: human prioritization of a separate task; none is
an approved Alixar adoption or automatic extension of this slice.

## 14. Review record

| Field | Value |
|---|---|
| Human reviewer | Pending |
| Human review date | Pending |
| Reference confirmed | Yes: merged INVOICE-ROUTES-REF-001, 27 observations reused |
| Technical quality gates | See validation report; human evidence/normative/scope review remains pending |
| Decision / implementation | Pending / Pending |
| Status | Draft for review; task authorization is not acceptance of the modeled claims |
