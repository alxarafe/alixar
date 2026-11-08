# Alixar Functional Specifications (AFS)

## Purpose

The AFS layer is the implementation-independent business model that Alixar uses
to understand Dolibarr and to plan its own implementation. It normalizes
observed business behavior into entities, operations, states, rules, events,
permissions, dependencies and testable scenarios.

It is deliberately not:

- a copy of Dolibarr source code;
- a Swagger/OpenAPI transcription;
- a replacement for the characterizations stored in `dolibarr-reference`;
- the Alixar canonical API contract;
- the migration decision register;
- a workflow engine, BPMN model or process-execution specification.

## Separation of concerns

| Layer | Owner | Question answered |
|---|---|---|
| Legacy evidence | `dolibarr-reference` | What does Dolibarr actually do? |
| Functional model | Alixar `docs/functional/` | What business concepts and behavior does the evidence describe? |
| Migration decision | Alixar decision documents such as `docs/thirdparty.md` | What will Alixar keep, adapt, replace or discard? |
| Implementation state | `docs/migration-coverage.md` and `docs/status.md` | What exists today in Alixar and Solucar? |

An AFS document does not promote an inferred behavior into a requirement. It
records what is demonstrated, what is inferred and what remains pending. Any
inferred behavior is descriptive only until it is verified against the pinned
reference.

## Pinned reference

The functional authority is Dolibarr 24.0.1 as registered in:

```text
dolibarr-reference: reference/baseline/technical-reference.json
```

The effective reference is:

```text
Dolibarr version: 24.0.1
Source commit:    b7958385f00a92219f76a4dfea67dae93df97a25
Profile:          baseline-ES
Modules:          API, SOCIETE, USER
```

A local Dolibarr checkout may be newer than the pinned version. For example, the
sibling `../dolibarr` checkout may report a development version such as
`25.0.0-alpha`. It must not be used as functional authority. Source references
from a non-pinned checkout are `INFERIDO` and must be revalidated against the
pinned 24.0.1 reference before they can support a normative claim.

## Document map

| Document | Purpose |
|---|---|
| [AFS-METHOD.md](AFS-METHOD.md) | Reproducible extraction, evidence and review procedure |
| [AFS-TEMPLATE.md](AFS-TEMPLATE.md) | Canonical AFS document and element template |
| [examples/AFS-TP-001-thirdparty-create.md](examples/AFS-TP-001-thirdparty-create.md) | Short operation example on ThirdParty |
| [examples/AFS-PROC-001-thirdparty-contact.md](examples/AFS-PROC-001-thirdparty-contact.md) | Short cross-module process example |
| [AFS-PROC-002-proposal-to-order.md](AFS-PROC-002-proposal-to-order.md) | Accepted proposal to customer order process |
| [AFS-PROC-003-order-to-shipment.md](AFS-PROC-003-order-to-shipment.md) | Customer order to complete/successive shipments, conditional stock effects and four scoped repeated closures |

## Current status

`ALIXAR-REF-002` establishes the method, the template and two compact examples.
`ALIXAR-REF-003` adds a preliminary process inventory and `AFS-PROC-002` for
proposal-to-order conversion, linked to AS-IS BPMN maps. It does not implement
the process or approve migration decisions.

## Core rules

1. Evidence, decision and implementation are separate layers.
2. Every behavioral claim is labelled `DEMOSTRADO`, `INFERIDO`, `PENDIENTE` or
   `FUERA DE ALCANCE`.
3. Only demonstrated behavior can be normative for legacy conformance.
4. Inferred behavior cannot automatically become a requirement or a conformance
   test.
5. The AFS links to characterizations and decision documents instead of copying
   them.
6. The AFS is written in technology-neutral business language. Implementation
   references belong in the traceability section.
7. Identifiers are stable and immutable.
8. No generator, execution engine or unnecessary infrastructure is introduced.
