# Alixar Process Maps

## Purpose

This directory holds implementation-independent process maps for the business
capabilities that Alixar must understand before designing its canonical model.

The maps are descriptive, not executable:

- `AS-IS` maps describe observed or source-derived Dolibarr behavior;
- `TO-BE` maps describe a future approved Alixar process;
- BPMN is used for shared understanding, not for process execution;
- the corresponding AFS remains the authority for rules, states, events and
  evidence labels.

## Scope and boundaries

A process map is not:

- an Alixar canonical API contract;
- a workflow engine deployment artifact;
- a replacement for a characterization or an AFS;
- proof that a legacy behavior is desirable.

The evidence layers remain separate:

| Layer | Location |
|---|---|
| Legacy evidence | `dolibarr-reference/reference/characterization/` |
| Functional model | `docs/functional/` |
| Process map | `docs/processes/` |
| Migration decision | Alixar decision documents |
| Implementation state | `docs/status.md` and `docs/migration-coverage.md` |

## Inventory

The preliminary business-map inventory is in [INVENTORY.md](INVENTORY.md).
It distinguishes:

- **business macroprocesses** (`BM-*`);
- **business operations** (`OP-*`);
- **technical capabilities** (`TC-*`).

The inventory is not an approved roadmap. Most entries are `PENDIENTE` or
`INFERIDO` until a real use case and evidence exist.

For opening and editing instructions, see [Process visualization](#visualización-de-procesos).

## File naming

```text
PROC-<DOMAIN>-<NNN>-<ASIS|TOBE>-<VARIANT>.bpmn
```

Examples:

```text
PROC-SLS-001-ASIS-MANUAL.bpmn
PROC-SLS-001-ASIS-AUTOMATIC.bpmn
```

One file contains one process. AS-IS and TO-BE are never mixed in the same file.
Variants that materially change the flow get their own file.

## BPMN conventions

- BPMN 2.0 XML with BPMN-DI.
- `isExecutable="false"` on every process.
- Standard BPMN namespaces only.
- No Flowable, Camunda, Activiti, Zeebe or other engine-specific namespaces or
  attributes.
- Start and end events are explicit.
- Gateways have labeled outgoing conditions.
- Task names identify the actor when the process has no lanes.
- Sequence flows reference existing nodes.
- Every node and edge has a BPMN-DI shape or edge.
- Diagram identifiers remain stable after review.

## Evidence labels

Each map states its evidence level in its documentation:

| Label | Meaning |
|---|---|
| `DEMOSTRADO` | Observed at runtime in the pinned reference |
| `INFERIDO` | Derived from source or configuration, not executed |
| `PENDIENTE` | Known gap or not characterized |
| `FUERA DE ALCANCE` | Explicitly excluded |

A process map that contains `INFERIDO` paths is not a conformance authority.

## Validation

Validation is performed in temporary Docker containers; no host XML, Node or
Java installation is required. The independent correction review checked the
XML against the BPMN 2.0 XSD set (including BPMN-DI) distributed with
`bpmn-moddle@9.0.1`.

Structural validation was performed with `bpmn-moddle@9.0.1` in a temporary
Node container. It verifies:

- BPMN XML parsing without moddle warnings;
- exactly one process per file;
- `isExecutable="false"`;
- no engine-specific namespaces;
- existing sequence-flow source and target references;
- a BPMN-DI shape for every flow node and a BPMN-DI edge for every sequence flow.

The repository does not add a production dependency for diagram validation.
Visual opening and SVG/PNG export with `bpmn-js@18.9.1` in a temporary
Chromium container were reviewed separately. Rendering does not prove
functional fidelity. The viewer is temporary review tooling, not a project
dependency.

## Current maps

| Map | Process | AFS | Evidence |
|---|---|---|---|
| [PROC-SLS-001-ASIS-MANUAL.bpmn](PROC-SLS-001-ASIS-MANUAL.bpmn) | Manual accepted-proposal to order | `AFS-PROC-002` | `DEMOSTRADO` for controlled HTTP UI fixtures; full browser interaction unverified |
| [PROC-SLS-001-ASIS-AUTOMATIC.bpmn](PROC-SLS-001-ASIS-AUTOMATIC.bpmn) | Automatic accepted-proposal to order | `AFS-PROC-002` | `DEMOSTRADO` for controlled creation fixtures; validation failure is explicit; online signature is outside the map |
| [PROC-SHP-001-ASIS-ORDER-SHIPMENT.bpmn](PROC-SHP-001-ASIS-ORDER-SHIPMENT.bpmn) | Complete, partial and successive customer-order shipments | [AFS-PROC-003](../functional/AFS-PROC-003-order-to-shipment.md) | [Evidence and scenario traceability](../functional/AFS-PROC-003-order-to-shipment.md#10-scenarios-and-traceability): 28 observations, four repeated closes; administrator class fixtures; UI guards `INFERIDO`; unexecuted paths `PENDIENTE` |
| [PROC-INV-001-ASIS-ORDER.bpmn](PROC-INV-001-ASIS-ORDER.bpmn) | Order conversion: full, percentage or selected lines; form/API/class boundaries | [AFS-PROC-004](../functional/AFS-PROC-004-customer-invoicing.md) | INV-ROUTE-001/002/003; quantity, permission and stock observations scoped by TEST-001–004/007/008/010 |
| [PROC-INV-001-ASIS-SHIPMENT.bpmn](PROC-INV-001-ASIS-SHIPMENT.bpmn) | Shipment conversion, source relationships and independent stock timings | [AFS-PROC-004](../functional/AFS-PROC-004-customer-invoicing.md) | INV-ROUTE-004, TEST-005/009; repeated quantities and one demonstrated double stock decrease |
| [PROC-INV-001-ASIS-EXPLICIT.bpmn](PROC-INV-001-ASIS-EXPLICIT.bpmn) | Caller-supplied invoice lines and explicit source links | [AFS-PROC-004](../functional/AFS-PROC-004-customer-invoicing.md) | INV-ROUTE-005, TEST-006/010; not automatic document conversion; permission boundaries explicitly scoped |

## Visualización de procesos

Available `.bpmn` files are listed in **Current maps** above and stored in this
directory. Each row links the map to its AFS; the AFS links to the characterization
in `dolibarr-reference` and identifies the evidence behind individual steps.
Keep both repositories side by side when following those local evidence links.

To use [bpmn.io](https://demo.bpmn.io/), open the demo and drag a `.bpmn` file
onto the canvas, or use its open-file control. Fit the diagram to the viewport,
zoom with the canvas controls or mouse wheel, and pan to inspect details. Select
elements to edit labels, move shapes or adjust connections; download the edited
BPMN XML to save a local copy. The [official toolkit walkthrough](https://bpmn.io/toolkit/bpmn-js/walkthrough/)
describes import, rendering and modeling.

Alternatively, open the file using **File → Open File** in
[Camunda Modeler](https://docs.camunda.io/docs/components/modeler/desktop-modeler/).
Use canvas zoom/fit controls and pan to inspect the process; select elements to
edit and save the `.bpmn` file locally. Deployment lint messages are not this
repository's validation authority: these descriptive maps have
`isExecutable="false"` and use standard BPMN only. Preserve stable IDs and avoid
adding engine-specific extensions when saving with an editor.

After editing, compare the XML diff, check the corresponding AFS and rerun
structural and visual validation. A visual editor does not validate legacy
behavior. The AFS scenario table maps BPMN element IDs to evidence and explicitly
separates `DEMOSTRADO`, `INFERIDO` and `PENDIENTE` paths. No custom viewer or
runtime process engine is required.

## Related documents

- [AFS-PROC-002](../functional/AFS-PROC-002-proposal-to-order.md)
- [AFS-PROC-004 customer invoicing](../functional/AFS-PROC-004-customer-invoicing.md)
- [Invoice modeling validation](ALIXAR-REF-005-validation.md)
- [Preliminary inventory](INVENTORY.md)
- [Functional specifications](../functional/README.md)
- Dolibarr proposal-order characterization:
  `dolibarr-reference: reference/characterization/PROPAL-ORDER-REF-001-proposal-to-order.md`

## Pilot interpretation

The manual map distinguishes empty selection from an explicit cancel action.
Creation produces a draft; later validation is requested and confirmed by the
user, with validation permission and an eligible order. The automatic map has
no order-creation permission gateway. It checks the order module as well as the
workflow module and option. Configured immediate validation is attempted, not
guaranteed; denial can leave the created order in draft.

The maps do not establish global proposal/order cardinality, concurrency safety,
all-line-type total fidelity, full online signature behavior, or transaction
rollback on creation failure. The AFS and the reference follow-up record the
evidence scope and remaining gaps.

## Customer order to shipment pilot

[`PROC-SHP-001-ASIS-ORDER-SHIPMENT.bpmn`](PROC-SHP-001-ASIS-ORDER-SHIPMENT.bpmn)
continues from the order boundary of `PROC-SLS-001`, and also permits an order
created independently. One map covers complete/partial/subsequent shipments,
conditional stock effects and the tested cancellation variants. Single complete
shipment coverage uses validation-timed stock only; the three timing modes apply
to the successive partial scenarios. Four sequential repeated closures preserve
states, quantities, stock/movements and relations, as documented in TEST-011;
they do not add a business-loop path or prove concurrent idempotence. See
[`AFS-PROC-003`](../functional/AFS-PROC-003-order-to-shipment.md) for scoped
`DEMOSTRADO`, source-derived `INFERIDO` and `PENDIENTE` distinctions.

Runtime authority:
`dolibarr-reference: reference/characterization/ORDER-SHIPMENT-REF-001-order-to-shipment.md`.
The shipping pilot does not change the earlier maps or approve Alixar stock,
permission or cancellation policy. XML/DI validation and visual opening are
independent of functional conformance.

## Customer invoicing pilot

`PROC-INV-001` uses three business-input variants, not one process per endpoint:
order conversion, shipment conversion and creation with explicit lines. The
[AFS traceability matrix](../functional/AFS-PROC-004-customer-invoicing.md#11-bpmn--afs--evidence-traceability)
maps all five technical entry routes to those variants and the existing 27
observations. The AFS and maps remain drafts pending human review.

Repeated creation can copy original quantities again; there is no demonstrated
universal duplicate-prevention guarantee. Invoice validation and shipment
validation can independently decrease stock under the combined configuration.
Neither result approves Alixar behavior. Inferred guards/events and pending
variants remain explicit; automatic/grouped routes and paid/collection processes
are not added to the demonstrated maps. No runtime process engine is introduced.
