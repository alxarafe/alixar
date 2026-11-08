---
spec_id: AFS-PROC-003
title: Customer order to successive shipments
profile: process
status: reviewed
version: 0.2.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: shipping-ES
evidence_cutoff: 2026-11-08
related_characterizations:
  - dolibarr-reference: reference/characterization/ORDER-SHIPMENT-REF-001-order-to-shipment.md
related_decisions: []
related_implementation: []
---

# AFS-PROC-003 — Customer order to successive shipments

## 1. Purpose and boundary

Describe the Dolibarr AS-IS boundary from customer order to complete, partial and
subsequent shipments. This is a sequential stockable-product pilot, not a complete logistics
model. Evidence does not approve Alixar behavior, permissions or stock policy.
All Alixar adoption and implementation decisions remain **Pending**.

Upstream: `BM-04` order management, including orders originating from
[`PROC-SLS-001`](AFS-PROC-002-proposal-to-order.md). This pilot also permits a
standalone customer order; proposal conversion is not a shipping prerequisite.
The process spans `BM-05` fulfillment and `BM-08` stock. Invoicing (`BM-06`),
transport execution, proof of physical receipt, batches, kits, services, returns,
concurrent reservations and advanced permissions are outside the runtime pilot.

Map: [PROC-SHP-001 AS-IS](../processes/PROC-SHP-001-ASIS-ORDER-SHIPMENT.bpmn).
The source BPMN is authoritative for layout; AFS and reference evidence define
its behavioral scope. Neither artifact is executable or an Alixar API contract.

## 2. Reference context and evidence

`shipping-ES` reuses the reference commercial Compose file in an isolated,
disposable project. Modules: API, Societe, Commande, Expedition, Product, Stock;
USER is initialized by the image. ES / `es_ES` / EUR, entity 1, basic permissions.
Workflow and invoicing are not enabled in this pilot. Stock effects on order
validation and billing are disabled. Shipment stock timing is varied explicitly.

`DEMOSTRADO`: reproducible business-class/API assertions and persistence reads
in `ORDER-SHIPMENT-REF-001`. `INFERIDO`: exact-source UI guards and event dispatch;
these must not be promoted to browser-tested behavior. `PENDIENTE`: unexecuted
variants. The reference document and its observed JSON own technical details;
this AFS summarizes business meaning rather than copying the characterization.

## 3. Actors and permissions

| ID | Actor/restriction | Evidence |
|---|---|---|
| `AFS-PROC-003-PERM-001` | Restricted reader can read a shipment (HTTP 200), but creation, validation and close requests return HTTP 403 | `DEMOSTRADO` for negative API permission checks; positive API mutations `PENDIENTE`; TEST-007 |
| `AFS-PROC-003-PERM-002` | Internal validation rejects the restricted reader and leaves the shipment in draft | `DEMOSTRADO` through internal class invocation; TEST-007 |
| `AFS-PROC-003-PERM-003` | Order closure has its own permission; shipment close and order close are not equivalent | `INFERIDO` from order closure class; admin success `DEMOSTRADO` |
| `AFS-PROC-003-PERM-004` | UI entry requires an active shipment module/submodule, order status validated or shipping in progress, eligible product lines and creation permission | `INFERIDO` from pinned order card; browser run `PENDIENTE` |

Permission checks must be stated at their actual boundary. A class method is
not automatically protected by the same checks as its UI/API caller. In
particular, the close/cancel helper calls in the fixture use an administrator;
no general class-level close/cancel authorization guarantee is established.
Successful creation, validation, close and cancellation in this pilot use
internal business classes with an administrator. They do not demonstrate
successful API mutations by a non-administrator with shipment permissions.

## 4. Entities and relationships

| ID | Concept | Relationship/invariant | Evidence |
|---|---|---|---|
| `AFS-PROC-003-ENT-001` | Customer order | Requested product quantities per order line | `DEMOSTRADO` |
| `AFS-PROC-003-ENT-002` | Shipment | Several shipments can originate from one order | `DEMOSTRADO` for two successive shipments |
| `AFS-PROC-003-ENT-003` | Shipment line | References one source order line and its picked quantity/warehouse | `DEMOSTRADO` for stockable products |
| `AFS-PROC-003-ENT-004` | Warehouse and stock | Physical quantity is scoped to product and warehouse | `DEMOSTRADO` for the selected warehouse; multiple warehouses per line `PENDIENTE` |
| `AFS-PROC-003-REL-001` | Order line → shipment lines | A line can be split across successive shipments; order-line identity is preserved | `DEMOSTRADO` |
| `AFS-PROC-003-REL-002` | Order → shipment | Origin relationship is persisted; deletion/cancellation has separate effects | `DEMOSTRADO` for fixture links; general lifecycle matrix `PENDIENTE` |

## 5. States and quantity meanings

| ID | Object | AS-IS states | Evidence |
|---|---|---|---|
| `AFS-PROC-003-ST-001` | Order | Draft `0` → validated `1` → shipping in progress `2` → closed `3` in successful fixtures | `DEMOSTRADO` |
| `AFS-PROC-003-ST-002` | Shipment | Draft `0` → validated `1` → closed `2` | `DEMOSTRADO` |
| `AFS-PROC-003-ST-003` | Shipment | Canceled `-1`; cancel helper removes lines, caller then sets canceled status | `DEMOSTRADO` by class composition matching source UI action; browser execution `PENDIENTE` |
| `AFS-PROC-003-ST-004` | Shipment | In-progress constant `3` exists | `INFERIDO`; transition to it not exercised and not inserted into the main map |

Three quantity measures must stay distinct:

- All linked shipment-line quantities include drafts in the unfiltered helper.
- Validated-or-later quantities exclude drafts; remaining quantity in the fixture
  is ordered minus this accumulated quantity.
- Closed-shipment quantities determine the built-in order-close comparison in
  the tested normal states. Full validated quantities alone do not close order.

None of these accumulated quantities proves a stock movement or a physical
customer receipt. A draft can reduce a UI quantity default without moving stock
(`INFERIDO` UI default, `DEMOSTRADO` underlying unfiltered count).

## 6. Process and alternatives

| ID | Step/condition | Outcome | Evidence |
|---|---|---|---|
| `AFS-PROC-003-STEP-001` | Check UI entry conditions and choose eligible order | Start preparation or remain unavailable | `INFERIDO` UI guards |
| `AFS-PROC-003-STEP-002` | Select quantities and warehouse; create linked draft | Partial or full shipment lines, no physical stock movement | `DEMOSTRADO` by class operations |
| `AFS-PROC-003-STEP-003` | Validate shipment | Shipment validated, order shipping in progress; stock effect is conditional | `DEMOSTRADO` |
| `AFS-PROC-003-STEP-004` | Close partial shipment | Shipment closed; order remains open | `DEMOSTRADO` |
| `AFS-PROC-003-STEP-005` | Prepare/validate subsequent shipment | Quantities accumulate against original order lines | `DEMOSTRADO` |
| `AFS-PROC-003-STEP-006` | Close shipment completing closed quantities | Order closes for authorized actor | `DEMOSTRADO` for admin; failed order-close permission `PENDIENTE` |
| `AFS-PROC-003-STEP-007` | Cancel validated/closed partial shipment | Lines removed; when none remain order returns from shipping in progress to validated; restock is conditional | `DEMOSTRADO` for three controlled compositions |
| `AFS-PROC-003-STEP-008` | Pause or retry | Draft/open order may remain for later action | `INFERIDO` process interpretation; no automatic scheduler implied |

## 7. Stock rules and configuration

| ID | Configuration | On shipment validation | On shipment close | Evidence |
|---|---|---|---|---|
| `AFS-PROC-003-RULE-001` | Stock enabled, validation timing enabled only | Decrease physical quantities | No second decrease | `DEMOSTRADO` |
| `AFS-PROC-003-RULE-002` | Stock enabled, close timing enabled only | No movement | Decrease physical quantities | `DEMOSTRADO` |
| `AFS-PROC-003-RULE-003` | Stock enabled, both shipment timings disabled | No movement | No movement despite shipment/order closure | `DEMOSTRADO` |
| `AFS-PROC-003-RULE-004` | Stock module disabled | No stock processing in these branches | No stock processing in these branches | `INFERIDO`; module-disabled runtime `PENDIENTE` |
| `AFS-PROC-003-RULE-005` | Warehouse required and sufficient-stock option active | Preparation rejects absent warehouse or quantity beyond selected warehouse stock | Not a reservation or concurrent-availability guarantee | `DEMOSTRADO` for `addline` guard; other entry paths `PENDIENTE` |
| `AFS-PROC-003-RULE-006` | Cancellation after validation-timed decrease | Cancel helper restores stock | No explicit restore flag needed in this timing | `DEMOSTRADO` |
| `AFS-PROC-003-RULE-007` | Cancellation after close-timed decrease | Default cancel does not restore stock | Explicit restore flag compensates stock | `DEMOSTRADO` |
| `AFS-PROC-003-RULE-008` | Repeat close on an already closed shipment | Return zero; balances, exact movement rows/counts, states, quantities and document relations stay unchanged | Tested after the completing shipment in the three timing modes and after the single complete shipment with validation-timed stock | `DEMOSTRADO`; TEST-011, sequential class calls only |

The exact-source numeric shipment filter uses a lower bound: an unexercised
shipment state `3` also satisfies the filter used for closed quantities. The
closed-quantity statements here are scoped to the tested states `0`, `1`, `2`
and `-1`, not a universal equality filter.

The concrete option names and source locations belong to the reference document.
Both stock-timing flags simultaneously enabled are not tested or recommended.
The UI over-shipment guard does not establish an invariant across class/API
creation paths. Stock insufficiency at validation after another actor consumes
stock is not characterized. An empty or insufficient selection must not be
assumed to trigger an automatic replenishment process.

## 8. Events and cross-module effects

`INFERIDO` from exact dispatch sites: shipment creation, validation, close and
cancellation emit `SHIPPING_CREATE`, `SHIPPING_VALIDATE`, `SHIPPING_CLOSED` and
`SHIPPING_CANCEL`; validation also dispatches
`SHIPPING_ORDER_SHIPMENTONPROCESS`. Successful order closure dispatches
`ORDER_CLOSE`. State changes are observed; a trigger spy was not installed, so
individual emissions are not independently runtime-attested.

Workflow options may close orders on shipment validation/close and may create
an invoice on order close. Those modules/options are inactive here: effects
remain `INFERIDO` and outside this pilot. Shipment closure therefore must not be
presented as universally requiring this pilot's sequence or generating invoices.

## 9. Verification and pending decisions

`ORDER-SHIPMENT-REF-001` owns the reproducible scenarios: three stock timings,
partial and subsequent quantities, a single complete shipment with validation-timed
stock, four repeated closures, three cancellation compensation cases,
warehouse/availability guards and restricted basic API/service permissions.
The BPMN uses one map with conditional stock notes, avoiding duplicate diagrams
for identical business sequences. Its cancellation path is bounded by the
absence of linked delivery receipts.

`PENDIENTE`: positive API mutations, complete UI/browser verification, advanced permission matrix,
closure of the order by a shipment operator lacking order-close permission,
module-disabled stock runtime, reopening/deletion, cancellation after full order
closure, linked delivery receipts, batch/serial/kit/service variants, combined
stock flags, concurrency and transaction-failure injection. These do not become
Alixar requirements and do not expand this pilot automatically.

Alixar decision: **Pending**. Alixar implementation: **Pending**. Any future
TO-BE process must be a separate, explicitly approved artifact.

## 10. Scenarios and traceability

Evidence keys (paths refer to the sibling reference repository):

- **REF**: [characterization](../../../dolibarr-reference/reference/characterization/ORDER-SHIPMENT-REF-001-order-to-shipment.md).
- **OBS**: [current capture](../../../dolibarr-reference/reference/characterization/ORDER-SHIPMENT-REF-001-observed-2026-11-08.json), selected by `observations[].scenario` and `stage` below; `http` and `assertions` retain API statuses and fixture results.
- **HIST**: [historical capture](../../../dolibarr-reference/reference/characterization/ORDER-SHIPMENT-REF-001-observed.json), 21 unchanged observations; retained for provenance, not the current coverage limit.
- **FIX**: [reproduction fixture](../../../dolibarr-reference/scripts/check-shipping.php), selected by function and assertion label below; invoked by `./bin/check-shipping` there.
- **VAL**: [reference validation report](../../../dolibarr-reference/reference/characterization/ORDER-SHIPMENT-REF-001-validation-2026-11-08.md), successful shipping/baseline commands, exact fixture/runner/source hashes and cleanup evidence.

The current capture contains 28 runtime observations: seven stages each for
`validation`, `close` and `none`; four for `full`; and three final cancellation
snapshots. The 21 matching historical scenario/stage pairs agree on states,
quantities, stock and movement counts. Actual IDs and database strings remain
unchanged in each capture. The new full-shipment allocation changes later IDs;
captures must not be compared by assuming those IDs are universal.
OBS retains all four HTTP results, fixture assertion labels, effective runtime
context and ten installed-source SHA-256 comparisons. VAL attests exit 0 for
`./bin/check-shipping` and `./bin/check` against the recorded fixture/runner hashes.

All TEST identifiers below have the prefix `AFS-PROC-003-`. Quantities are
ordered per product as 5 / 3, starting stock 10 / 10 in one warehouse.

| Scenario ID | Given / When | Observable Then | Evidence and BPMN IDs |
|---|---|---|---|
| `AFS-PROC-003-TEST-001` | Given validation-timed stock, when administrator creates 2 / 1 and later 3 / 2 shipments through classes, validates and closes each | First draft: stock 10 / 10; first validation: 8 / 9, remaining 3 / 2; first close leaves order in progress; subsequent validation: 5 / 7, remaining zero; final close: order closed, six movements including opening stock | `DEMOSTRADO`: OBS `validation`, seven stages including repeat covered by TEST-011; FIX normal loop. `Task_Create`, `Task_Validate`, `Task_Close`, `F17`, `F15`, stock notes |
| `AFS-PROC-003-TEST-002` | Given close-timed stock, when administrator performs the same sequence | Validation leaves first stock 10 / 10; first close: 8 / 9; subsequent validation stays 8 / 9; final close: 5 / 7 and order closed, six movements | `DEMOSTRADO`: OBS `close`, seven stages including TEST-011 repeat; FIX normal loop. Same BPMN IDs as TEST-001 |
| `AFS-PROC-003-TEST-003` | Given both shipment stock timings disabled, when administrator performs the same sequence | Stock stays 10 / 10 with two opening movements, while shipment/order states and quantities follow TEST-001 | `DEMOSTRADO`: OBS `none`, seven stages including TEST-011 repeat; FIX normal loop. Same BPMN IDs as TEST-001 |
| `AFS-PROC-003-TEST-004` | Given a partial validated shipment with validation-timed stock and no delivery receipt, when administrator calls cancellation then sets canceled status | Stock returns to 10 / 10; lines and accumulated quantities disappear; shipment canceled and order validated | `DEMOSTRADO`: OBS `cancel-validation-default` / `canceled`; FIX cancellation loop. `F12`, `Task_Cancel`, `End_Canceled`, `Note_Cancel` |
| `AFS-PROC-003-TEST-005` | Given a closed partial shipment with close-timed stock and no delivery receipt, when administrator cancels without / with explicit stock restore and sets canceled status | Without restore: 8 / 9; with restore: 10 / 10. Both remove lines, cancel shipment and return order to validated | `DEMOSTRADO`: OBS `cancel-close-default` and `cancel-close-restore` / `canceled`; FIX cancellation loop. `F19`, `Task_Cancel`, `Note_Cancel` |
| `AFS-PROC-003-TEST-006` | Given warehouse-required and sufficient-stock options, when preparing a line without warehouse or eleven units against ten | Preparation helper returns -1 / -3 respectively | `DEMOSTRADO` by FIX normal-loop assertions `warehouse required by addline` and `configured stock sufficiency rejects excess`, retained in OBS `assertions`. `Task_Prepare`, `Note_Prepare`; UI interaction `PENDIENTE` |
| `AFS-PROC-003-TEST-007` | Given restricted reader with customer visibility but no creation right, when requesting API read/create/validate/close and class validation | API returns 200 / 403 / 403 / 403; class validation fails and shipment remains draft | `DEMOSTRADO` by FIX restricted-user checks and OBS `http`/`assertions`. `F10`, `End_Draft`; positive API mutation `PENDIENTE` |
| `AFS-PROC-003-TEST-008` | Given UI entry conditions or pause choices, when operator starts or postpones preparation | Entry availability and later continuation require browser verification; no scheduler is implied | `INFERIDO`: REF source-only entry conditions; `Task_Check`, `Gateway_Allowed`, `F03`, `F04`, `F13`, `F18`. Browser verification `PENDIENTE` |
| `AFS-PROC-003-TEST-009` | Given an operator who may close a shipment but not its order, when closing the completing shipment | Resulting order state and quantities must be observed; no expected outcome asserted | `PENDIENTE`: REF permissions section. Excluded from demonstrated `F16`; `Note_Close` records gap |
| `AFS-PROC-003-TEST-010` | Given validation-timed stock and an order for 5 / 3, when administrator creates one shipment for 5 / 3, validates and closes it through classes | Draft: stock 10 / 10, order/shipment 1 / 0; validated: stock 5 / 7, remaining zero, states 2 / 1; closed: states 3 / 2, stock 5 / 7 and four movements including opening stock | `DEMOSTRADO`: OBS `full` / `full_draft`, `full_validated`, `full_closed`; FIX full fixture. `Task_Prepare`, `Task_Create`, `Task_Validate`, `Task_Close`, `F15`, `End_Complete`; this path does not take `F17` |
| `AFS-PROC-003-TEST-011` | Given the completing shipment already closed in TEST-001–003 or TEST-010, when administrator repeats its class close sequentially | Return zero; balances, exact movement rows/counts, states, quantities, lines and origin links unchanged | `DEMOSTRADO`: OBS `repeated_close` for `validation`, `close`, `none`, `full` versus `all_closed` or `full_closed`; FIX `repeatClose`. `Task_Close`, `Note_Close`; method replay, not a new business-loop path or concurrency guarantee |

The `F17` loop describes the observed second shipment with remaining validated
quantity 3 / 2. Its positive-remaining condition bounds this map; it is not a
demonstrated universal UI/API guard against over-shipment.

### Element coverage and normative status

`Normative: yes` below means legacy conformance only, bounded by the stated
fixture. No row approves an Alixar contract. Mixed or source-only elements are
`Normative: no`. IDs in each range use the `AFS-PROC-003-` prefix.
TEST-001–007 and TEST-010–011 are `Normative: yes` only for their stated class/API boundaries
and observations; TEST-008–009 are `Normative: no` verification questions.

| Elements | Scenario / source evidence | Normative |
|---|---|---|
| PERM-001, PERM-002 | TEST-007; negative API and class validation only | yes |
| PERM-003 | TEST-001–003 admin closure; REF order class; TEST-009 unexecuted permission variant | no |
| PERM-004 | TEST-008; REF order-card source trace | no |
| ENT-001–004, REL-001 | TEST-001–003, OBS source-line/warehouse IDs and quantities | yes |
| REL-002 | FIX `shipment` origin-link assertion; TEST-004–005 cancellation; deletion unexecuted | no |
| ST-001, ST-002 | FIX `context` draft creation/validation; TEST-001–003, OBS states | yes |
| ST-003 | TEST-004–005 class composition only | yes |
| ST-004 | REF shipment-class state constant; transition unexecuted | no |
| STEP-001, STEP-008 | TEST-008, source-derived UI / process interpretation | no |
| STEP-002–005 | TEST-001–003; operator UI interaction excluded | yes |
| STEP-006 | TEST-001–003 for administrator; TEST-009 pending | no |
| STEP-007 | TEST-004–005 for the specified compositions only | yes |
| RULE-001–003 | TEST-001–003 | yes |
| RULE-004 | REF shipment-class source trace; stock-disabled execution pending | no |
| RULE-005 | TEST-006 preparation helper only; other entry paths pending | no |
| RULE-006–007 | TEST-004–005 | yes |
| RULE-008 | TEST-011; four sequential class-call replays only | yes |

TEST-010 additionally supports ENT-001–004, REL-001, ST-001–002,
STEP-002–003/006 and RULE-001 for one complete shipment with validation-timed
stock. It does not demonstrate all complete-shipment/configuration combinations.

### Complete BPMN coverage

| BPMN elements | Documentary support and evidence boundary |
|---|---|
| `Start_Order`, `F01`, `Task_Check`, `F02`, `Gateway_Allowed`, `F03`, `F04`, `End_Unavailable` | TEST-008, PERM-004, REF order-card source trace; UI entry is `INFERIDO`, browser verification `PENDIENTE` |
| `Task_Prepare`, `F05`, `Task_Create`, `F06`, `Task_RequestValidation`, `F07` | STEP-002, TEST-001–003/006/010; class preparation/creation `DEMOSTRADO`, human UI selection/request activities `INFERIDO`; full UI `PENDIENTE` |
| `Task_Validate`, `F08`, `Gateway_Validated`, `F09`, `F10`, `End_Draft` | STEP-003, TEST-001–003/007/010; admin class success and restricted-user API/class denial `DEMOSTRADO`; no failure-atomicity claim |
| `Gateway_Disposition`, `F11`, `Task_Close`, `F14`, `Gateway_OrderClosed`, `F15`, `End_Complete` | STEP-004/006, TEST-001–003/010; class closures and state effects `DEMOSTRADO`; operator-choice arrangement `INFERIDO`; TEST-011 replay described by close annotation |
| `F16`, `Gateway_FollowUp`, `F17` | STEP-005, TEST-001–003; partial order stays open and second shipment with positive pending quantity `DEMOSTRADO`; operator-choice arrangement `INFERIDO`; TEST-009 excluded |
| `F12`, `F19`, `Task_Cancel`, `F20`, `End_Canceled` | STEP-007, TEST-004–005; partial class cancellation compositions `DEMOSTRADO`; UI execution and other cancellation variants `PENDIENTE` |
| `F13`, `End_Validated`, `F18`, `End_Partial` | STEP-008, TEST-008; pause/continuation interpretation `INFERIDO` |
| `Note_Prepare`, `Note_Validate`, `Note_Close`, `Note_Cancel` | Summaries of the scenarios/rules above, including TEST-010/011; labels distinguish source-only, demonstrated and unexecuted scope |
| `Assoc_Prepare`, `Assoc_Validate`, `Assoc_Close`, `Assoc_Cancel` and all BPMN-DI shapes/edges | Presentation links/layout for the documented elements, not additional business assertions; XML/XSD/import/render validation applies |

Source-derived events in section 8 remain `INFERIDO`, `Normative: no`:
REF exact-source/extension section identifies producer methods and optional
workflow consumers. Delivery order, transaction behavior and trigger emissions
are not independently runtime-attested.

| ID | Event/dependency and condition | Evidence / BPMN | Normative |
|---|---|---|---|
| `AFS-PROC-003-EVT-001` | Shipment create/validate/close/cancel dispatch their lifecycle events; validation also notifies order shipping | `INFERIDO`: REF exact-source section, shipment-class producer methods; `Task_Create`, `Task_Validate`, `Task_Close`, `Task_Cancel`; runtime trigger observation pending | no |
| `AFS-PROC-003-EVT-002` | Successful order closure dispatches its closure event | `INFERIDO`: REF order-class source trace; `F15`; state changes in TEST-001–003 do not prove event emission | no |
| `AFS-PROC-003-DEP-001` | Shipment/stock behavior requires the selected modules and timing configuration | `DEMOSTRADO` for the enabled-module composition and exclusive timings in TEST-001–003; `Note_Validate`, `Note_Close`; module-disabled variants pending | no |
| `AFS-PROC-003-DEP-002` | Optional workflow can change order closure and create an invoice when configured | `INFERIDO`: REF workflow source trace; inactive and outside this map; enabled-workflow verification pending | no |

These event IDs refer to the stable technical identifiers listed in section 8.
Optional workflow consumers and their execution order remain source-derived;
no transaction or compensation guarantee beyond TEST-004–005 is adopted.

### Review status

Human acceptance of the corrected AFS, diagram and reference evidence:
**Approved**, by the human collaborator's explicit ALIXAR-REF-004 closure
instruction, 2026-11-08, conditional on final coherence checks. Final reconciliation
adds the demonstrated full-shipment and repeated-close evidence only. Technical
validation and scope review accompany the local commits; no Alixar adoption or
implementation decision is approved.
