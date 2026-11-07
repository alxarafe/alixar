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

Minimum check:

```bash
xmllint --noout docs/processes/*.bpmn
```

Semantic validation was performed during review with `bpmn-moddle@9.0.1` over a
temporary Node container. It verifies:

- BPMN XML parsing without moddle warnings;
- exactly one process per file;
- `isExecutable="false"`;
- no engine-specific namespaces;
- existing sequence-flow source and target references;
- a BPMN-DI shape for every flow node and a BPMN-DI edge for every sequence flow.

The repository does not add a production dependency for diagram validation.
Visual rendering with `bpmn-js` remains a manual review aid.

## Current maps

| Map | Process | AFS | Evidence |
|---|---|---|---|
| [PROC-SLS-001-ASIS-MANUAL.bpmn](PROC-SLS-001-ASIS-MANUAL.bpmn) | Manual accepted-proposal to order | `AFS-PROC-002` | `INFERIDO` |
| [PROC-SLS-001-ASIS-AUTOMATIC.bpmn](PROC-SLS-001-ASIS-AUTOMATIC.bpmn) | Automatic accepted-proposal to order | `AFS-PROC-002` | `DEMOSTRADO` for main path; `INFERIDO` for online signature |

## Related documents

- [AFS-PROC-002](../functional/AFS-PROC-002-proposal-to-order.md)
- [Preliminary inventory](INVENTORY.md)
- [Functional specifications](../functional/README.md)
- Dolibarr proposal-order characterization:
  `dolibarr-reference: reference/characterization/PROPAL-ORDER-REF-001-proposal-to-order.md`
