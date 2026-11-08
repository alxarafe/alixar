# Preliminary Business Map Inventory

## Status

**Preliminary and non-normative.** This inventory identifies candidate business
macroprocesses, operations and technical capabilities for decomposition. It does
not approve scope, priority, migration order or implementation.

Evidence labels:

- `DEMOSTRADO`: observed at runtime in the pinned reference;
- `INFERIDO`: derived from source, configuration, schema or documentation;
- `PENDIENTE`: known but not characterized;
- `FUERA DE ALCANCE`: explicitly excluded from the current slice.

## 1. Business macroprocesses

| ID | Macroprocess | Type | Preliminary scope | Evidence | State |
|---|---|---|---|---|---|
| `BM-01` | Customer and contact management | Business macroprocess | Third parties, contacts, commercial classification and relationship lifecycle | `INFERIDO` from `THIRDPARTY-REF-001`, `CONTACT-REF-001` | Partially characterized |
| `BM-02` | Commercial proposal management | Business macroprocess | Proposal creation, lines, validation, acceptance, refusal and closing | `INFERIDO` from `PROPAL-ORDER-REF-001` | Partially characterized |
| `BM-03` | Proposal-to-order conversion | Business macroprocess | Manual and automatic conversion of an accepted proposal into a customer order | `DEMOSTRADO` for controlled automatic and manual HTTP UI fixtures | Pilot `PROC-SLS-001` |
| `BM-04` | Customer order management | Business macroprocess | Order creation, lines, validation, status and cancellation | `DEMOSTRADO` for selected validation/shipping/closure states in `ORDER-SHIPMENT-REF-001`; other operations partial | Partially characterized |
| `BM-05` | Order fulfillment and shipping | Business macroprocess | Shipment preparation, delivery and stock movement | `DEMOSTRADO` for the sequential stockable-product pilot; physical receipt `PENDIENTE` | Pilot `PROC-SHP-001` |
| `BM-06` | Customer invoicing and collection | Business macroprocess | Invoice generation, payments, credit notes and collection | `DEMOSTRADO` for standard invoice creation/validation in INVOICE-ROUTES-REF-001; collection/payments/credit notes `PENDIENTE` | Partial pilot `PROC-INV-001`, draft `AFS-PROC-004` |
| `BM-07` | Pricing, taxes and discounts | Business macroprocess | Prices, VAT, discounts, payment terms and commercial conditions | `PENDIENTE` | Not characterized |
| `BM-08` | Product and stock management | Business macroprocess | Products, services, warehouses and stock movements | `DEMOSTRADO` for selected shipment and invoice stock effects in `ORDER-SHIPMENT-REF-001` / `INVOICE-ROUTES-REF-001`, including one combined decrement case; broader management `PENDIENTE` | Partially characterized |
| `BM-09` | Purchasing and supplier management | Business macroprocess | Supplier proposals, orders, invoices and procurement | `PENDIENTE` | Not characterized |
| `BM-10` | Reporting and commercial analytics | Business macroprocess | Operational reporting, dashboards and commercial indicators | `PENDIENTE` | Not characterized |

`PROC-SLS-001` covers the `BM-03` proposal-to-order boundary. `PROC-SHP-001`
continues from a customer order across `BM-04`, `BM-05` and the relevant `BM-08`
stock capability. An order may also be created independently of a proposal.
Downstream `BM-06` invoicing remains outside those two runtime pilots;
`PROC-INV-001` models the separately characterized invoice boundary with `BM-08`
effects. These relationships are not an approved implementation roadmap.

## 2. Business operations

Operations are concrete business actions inside a macroprocess. They are not
technical endpoints.

| ID | Operation | Parent | Evidence | State |
|---|---|---|---|---|
| `OP-SLS-001` | Create a commercial proposal | `BM-02` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed |
| `OP-SLS-002` | Add a line to a commercial proposal | `BM-02` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed, including description, quantity, price, VAT and totals |
| `OP-SLS-003` | Validate a commercial proposal | `BM-02` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed |
| `OP-SLS-004` | Close a proposal as accepted | `BM-02`, `BM-03` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed |
| `OP-SLS-005` | Create an order from a proposal manually | `BM-03` | `DEMOSTRADO` in the audit follow-up | Partial selection, empty selection and cancellation observed |
| `OP-SLS-006` | Create an order from a proposal automatically | `BM-03` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed |
| `OP-SLS-007` | Validate a customer order | `BM-04` | `DEMOSTRADO` through the immediate-validation option | Observed |
| `OP-SLS-008` | Link a proposal to its customer order | `BM-03` | `DEMOSTRADO` in `PROPAL-ORDER-REF-001` | Observed |
| `OP-SLS-009` | Refuse or close a proposal without an order | `BM-02` | `INFERIDO` from proposal statuses | Pending |
| `OP-SLS-010` | Cancel or delete a customer order | `BM-04` | `PENDIENTE` | Not characterized |

Shipping operations belong to the end-to-end fulfillment process, rather than
forming a separate business process for each endpoint or record mutation.

| ID | Operation | Parent | Evidence | State |
|---|---|---|---|---|
| `OP-SHP-001` | Prepare a complete, partial or subsequent shipment from order lines | `BM-05` | `DEMOSTRADO` in `ORDER-SHIPMENT-REF-001` | Administrator class fixtures; UI guards source-derived; positive API mutations pending |
| `OP-SHP-002` | Validate a shipment with its configured stock effect | `BM-05`, `BM-08` | `DEMOSTRADO` | Three timing configurations |
| `OP-SHP-003` | Close a shipment and evaluate order fulfillment | `BM-05`, `BM-04`, `BM-08` | `DEMOSTRADO` for administrator class calls | Partial/complete quantities; four sequential repeated closures preserve stock/movements and state |
| `OP-SHP-004` | Cancel a partial shipment with conditional stock compensation | `BM-05`, `BM-08` | `DEMOSTRADO` by class composition | UI/browser and delivery-linked cases pending |

Invoicing operations share business flows across form, API and internal entry
boundaries; the five technical routes are not five business macroprocesses.

| ID | Operation | Parent | Evidence | State |
|---|---|---|---|---|
| `OP-INV-001` | Create an invoice from an order, fully, by percentage or selected original lines | `BM-06`, `BM-04` | `DEMOSTRADO`: INV-ROUTE-001/002/003; percentage/selection only on form route | Draft AFS-PROC-004, ORDER map |
| `OP-INV-002` | Create an invoice from shipped quantities with source-document links | `BM-06`, `BM-05` | `DEMOSTRADO`: INV-ROUTE-004 | Draft AFS-PROC-004, SHIPMENT map |
| `OP-INV-003` | Create an invoice with caller-supplied lines and explicit links | `BM-06` | `DEMOSTRADO`: INV-ROUTE-005; not automatic conversion | Draft AFS-PROC-004, EXPLICIT map |
| `OP-INV-004` | Validate an invoice with its independently configured stock effect | `BM-06`, `BM-08` | `DEMOSTRADO`: basic permission outcomes and scoped stock cases, including combined shipment/invoice decrements | Partial; advanced roles and other variants pending |

## 3. Technical capabilities

Technical capabilities enable business operations. They are not business
processes and must not be presented as migration scope by themselves.

| ID | Capability | Purpose | Evidence | State |
|---|---|---|---|---|
| `TC-DOC-001` | Document reference numbering | Generate proposal and order references | `DEMOSTRADO` for drafts and validated orders | Partial |
| `TC-WF-001` | Business event and trigger dispatch | Notify modules after business events | `DEMOSTRADO` for `PROPAL_CLOSE_SIGNED` | Partial |
| `TC-WF-002` | Configurable workflow options | Enable or disable automatic conversion | `DEMOSTRADO` for `WORKFLOW_PROPAL_AUTOCREATE_ORDER` | Partial |
| `TC-PERM-001` | Permission enforcement | Control UI creation and later validation; automatic workflow creation has no order-creation gate | `DEMOSTRADO` for basic non-admin cases; advanced roles `PENDIENTE` | Partial |
| `TC-AUDIT-001` | Audit and modification metadata | Record creation and modification actors and timestamps | `INFERIDO` from persistence | Pending |
| `TC-I18N-001` | Localization | Render labels and business messages | `INFERIDO` from `es_ES` profile | Pending |
| `TC-PERSIST-001` | Relational persistence and links | Store objects, lines and relationships | `DEMOSTRADO` in the commercial profile | Partial |
| `TC-ID-001` | Stable business identity | Identify proposals, orders and lines | `DEMOSTRADO` for created fixtures | Partial |

## 4. Decomposition rules

| Rule | Meaning |
|---|---|
| One macroprocess is not one endpoint | A business macroprocess may span several entities and modules |
| One operation is not one controller | A business operation may require several technical steps |
| One technical capability is not a business process | Technical capabilities enable processes but do not define them |
| Evidence is not scope approval | An observed legacy behavior may later be kept, adapted, replaced or discarded |
| Prefer real use cases | Do not create speculative ports, adapters or modules for inventory entries |

## 5. Current pilot coverage

- `ALIXAR-REF-003`: preliminary inventory, `AFS-PROC-002` and two AS-IS
  `PROC-SLS-001` variants.
- `ALIXAR-REF-004`: `AFS-PROC-003` and one AS-IS `PROC-SHP-001` map, covering
  complete/partial/subsequent shipments and conditional stock effects.
- `ALIXAR-REF-005`: draft [AFS-PROC-004](../functional/AFS-PROC-004-customer-invoicing.md)
  and three AS-IS `PROC-INV-001` maps, reusing 27 observations and 35 HTTP
  results from INVOICE-ROUTES-REF-001. Order/shipment conversion and explicit
  lines are distinct business inputs; UI/API/class entry variants share maps.
  [Traceability](../functional/AFS-PROC-004-customer-invoicing.md#11-bpmn--afs--evidence-traceability)
  and [technical validation](ALIXAR-REF-005-validation.md) accompany the draft.

Shipping evidence and scenario-to-BPMN links are maintained in
[AFS-PROC-003](../functional/AFS-PROC-003-order-to-shipment.md#10-scenarios-and-traceability).
The current 28-observation capture covers three timing modes for successive
partial shipments, one single complete shipment with validation-timed stock,
three cancellation compositions and four sequential repeated closures.
The 21-observation capture is preserved as historical evidence. Repeated-close
idempotence is scoped to the four tested administrator class calls; positive API
mutations, full UI, advanced permissions and concurrency remain `PENDIENTE`.

None of these pilots approves canonical API design, implementation, Solucar
behavior or migration/security policy. Invoice repetition does not establish
universal duplicate prevention; independently configured shipment and invoice
stock effects may both decrement stock. Collection, payments, credit notes,
procurement and full logistics remain outside the current slices.
