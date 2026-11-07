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
| `BM-04` | Customer order management | Business macroprocess | Order creation, lines, validation, status and cancellation | `INFERIDO` from `PROPAL-ORDER-REF-001` | Pending |
| `BM-05` | Order fulfillment and shipping | Business macroprocess | Shipment preparation, delivery and stock movement | `PENDIENTE` | Not characterized |
| `BM-06` | Customer invoicing and collection | Business macroprocess | Invoice generation, payments, credit notes and collection | `PENDIENTE` | Not characterized |
| `BM-07` | Pricing, taxes and discounts | Business macroprocess | Prices, VAT, discounts, payment terms and commercial conditions | `PENDIENTE` | Not characterized |
| `BM-08` | Product and stock management | Business macroprocess | Products, services, warehouses and stock movements | `PENDIENTE` | Not characterized |
| `BM-09` | Purchasing and supplier management | Business macroprocess | Supplier proposals, orders, invoices and procurement | `PENDIENTE` | Not characterized |
| `BM-10` | Reporting and commercial analytics | Business macroprocess | Operational reporting, dashboards and commercial indicators | `PENDIENTE` | Not characterized |

`BM-03` is the only macroprocess with a dedicated pilot map in this slice. The
other identifiers are reserved for decomposition and must not be read as an
approved roadmap.

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

## 5. Current slice

The approved slice covers:

- the preliminary inventory in this document;
- `AFS-PROC-002` for `BM-03`;
- two AS-IS maps for `PROC-SLS-001`.

It does not cover implementation, canonical API design, migration decisions,
Solucar, invoicing, shipping, stock or procurement.
