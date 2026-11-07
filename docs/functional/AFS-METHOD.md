# AFS Extraction Method

## 1. Purpose

This document defines a reproducible procedure for extracting the Dolibarr
business model into an Alixar Functional Specification (AFS), with explicit
evidence, stable identifiers and traceability.

The method applies to:

- an individual operation;
- a capability composed of several operations;
- a complete business process spanning several entities and modules.

The method does not implement a process engine, generate production code or
replace the existing characterization, decision and coverage documents.

## 2. Principles

| Principle | Consequence |
|---|---|
| Evidence before interpretation | A behavior must be observed or traced before it is described |
| No inference promotion | `INFERIDO` never becomes normative automatically |
| Compact and practical | Link to existing evidence instead of copying it |
| One source of truth per layer | Evidence in `dolibarr-reference`; model in Alixar `docs/functional/`; decisions in decision documents; state in coverage/status |
| Business language first | Normative sections use business terms, not PHP, Java, Spring or Flowable terms |
| Stable identity | Documents and elements have immutable identifiers |
| Reproducibility | Every `DEMOSTRADO` claim can be reproduced against the pinned reference |
| Progressive coverage | New capabilities are added without renaming or renumbering existing ones |

## 3. Pinned reference

Every AFS document records the reference in its front matter.

The authority is the Dolibarr 24.0.1 baseline registered in
`dolibarr-reference: reference/baseline/technical-reference.json`:

```text
version: 24.0.1
source commit: b7958385f00a92219f76a4dfea67dae93df97a25
profile: baseline-ES
modules: API, SOCIETE, USER
```

Rules:

1. Do not use the sibling `../dolibarr` development checkout as functional
   authority. A local checkout may be `25.0.0-alpha` or newer.
2. Source references must identify the pinned version or commit.
3. A source reference taken from a non-pinned checkout is `INFERIDO` and must be
   revalidated before supporting a normative claim.
4. If the reference profile or baseline changes, review every affected AFS.
5. Do not silently update the reference. A baseline change is a separate,
   human-reviewed decision.

## 4. Artifacts and responsibilities

| Artifact | Location | Responsibility |
|---|---|---|
| Raw characterization and evidence | `dolibarr-reference/reference/characterization/` | Observation, commands, responses, SQL, source trace |
| Technical baseline | `dolibarr-reference/reference/baseline/` | Version, profile, Swagger and API inventory |
| AFS document | Alixar `docs/functional/` | Normalized, technology-neutral business model |
| Migration decision | Alixar decision documents | KEEP, ADAPT, REPLACE, DISCARD, PENDING |
| Implementation state | `docs/migration-coverage.md` and `docs/status.md` | Real development state |

The AFS must not become a second characterization. It references evidence and
summarizes only the business-relevant model.

## 5. Evidence vocabulary

| Label | Meaning | Permitted use |
|---|---|---|
| `DEMOSTRADO` | Observed at runtime in the pinned reference and reproducible | May support a normative legacy-conformance statement |
| `INFERIDO` | Derived from source code, configuration or schema, not executed | Descriptive only; must be verified before normative use |
| `PENDIENTE` | Not characterized, unknown or a known gap | No normative claim |
| `FUERA DE ALCANCE` | Explicitly excluded from this AFS | No implementation or conformance claim |

Additional rules:

- `DEMOSTRADO` requires an evidence reference: characterization section, command,
  response, SQL query or equivalent.
- `INFERIDO` requires a source reference and an explicit verification question.
- `PENDIENTE` must state what is missing and what evidence would close it.
- `FUERA DE ALCANCE` must state why it is excluded and where it is tracked.
- A conclusion derived from several demonstrated facts may be labelled
  `DEMOSTRADO` only when the derivation is itself reproducible. Otherwise it is
  `INFERIDO`.

## 6. Stable identifiers

### 6.1 Document identifiers

```text
AFS-<SCOPE>-<NNN>
```

Examples:

```text
AFS-TP-001          ThirdParty operation or capability
AFS-CT-001          Contact operation or capability
AFS-PROC-001        Cross-module business process
```

`SCOPE` is a short uppercase code. `NNN` is a three-digit sequence.

### 6.2 Element identifiers

```text
<DOCUMENT-ID>-<KIND>-<NNN>
```

Examples:

```text
AFS-TP-001-ENT-001
AFS-TP-001-UC-001
AFS-TP-001-RULE-001
AFS-PROC-001-STEP-001
```

Allowed kinds:

| Kind | Meaning |
|---|---|
| `ENT` | Entity or aggregate |
| `REL` | Relationship |
| `UC` | Operation or use case |
| `ST` | State or transition |
| `STEP` | Step in a process flow |
| `RULE` | Business rule or invariant |
| `EVT` | Event, trigger or cross-module effect |
| `PERM` | Permission or business restriction |
| `DEP` | Functional dependency |
| `TEST` | Observable test scenario |

Rules:

- Identifiers are immutable.
- A superseded document keeps its identifier and is marked `superseded`.
- A new document gets a new number; do not reuse identifiers.
- Elements are scoped to their document, so the document number is part of the
  element identifier.
- Referencing an element from another document uses the full identifier.

## 7. Extraction procedure

### Step 1 — Pin the reference

Record version, commit, profile, enabled modules, country, language, currency and
relevant configuration. Confirm that the evidence source matches the pinned
reference.

Output: front matter and reference section.

### Step 2 — Define the scope

State what the document covers and what it excludes. Choose the profile:
`operation`, `process` or `module`.

Output: purpose, scope, exclusions and related documents.

### Step 3 — Inventory

Collect only the sources needed for the scope:

- API paths and operations from `api-inventory.tsv` and `swagger.json`;
- UI entry points;
- tables, columns, keys and delete rules;
- permissions;
- triggers, hooks, extrafields and configuration constants;
- cross-module references.

Output: a short inventory table. Do not paste the entire Swagger or schema.

### Step 4 — Observe or collect evidence

For each in-scope behavior:

- use controlled fixtures;
- record request, response, relevant SQL and state transitions;
- preserve unexpected results;
- do not correct or normalize observed behavior in the characterization.

Output: evidence references in `dolibarr-reference`. The AFS links to them.

### Step 5 — Trace to source

Follow the minimal path from the observed behavior to the code that explains it.
Stop when the behavior is explained. Record file, symbol and line at the pinned
commit.

Output: source trace. Mark source-only conclusions as `INFERIDO`.

### Step 6 — Normalize the model

Write the business model without implementation names:

- entities and relationships;
- states and transitions;
- operations and their contracts;
- rules and invariants;
- events and effects;
- permissions and restrictions;
- dependencies;
- observable scenarios.

Output: the AFS body.

### Step 7 — Label and set normative status

For every element:

- assign an evidence label;
- assign a decision link if one exists;
- assign an implementation link if one exists;
- set `Normative` to `yes` only for `DEMOSTRADO` legacy-conformance items.

Output: element tables and traceability matrix.

### Step 8 — Model cross-module effects

For each event or side effect, record:

- producer;
- consumers;
- condition;
- ordering or transaction effect if known;
- whether it is active in the baseline;
- evidence label.

Output: event and dependency sections.

### Step 9 — Derive scenarios

Derive scenarios only from demonstrated behavior, or mark them explicitly as
verification tasks for inferred behavior.

Each scenario uses:

```text
Given <state>
When <action>
Then <observable result>
```

Output: test scenario catalogue.

### Step 10 — Review and close

Run the quality gates in section 10. Record the human review. Link decisions and
implementation without changing their content.

Output: reviewed AFS.

## 8. Cross-module process extraction

A process document adds these elements to the operation model:

| Element | Description |
|---|---|
| Participants | Entities or modules that take part |
| Trigger | Business event that starts the process |
| Steps | Ordered activities with actor, operation and affected entities |
| Alternate paths | Rejections, invalid references, conflicts |
| Events | Emitted events and their consumers |
| State changes | Before and after states per participant |
| Transaction or compensation | What is atomic, what cascades and what must be compensated |
| Cross-module dependencies | Upstream and downstream conditions |

A process step should reference an operation AFS when one exists instead of
repeating its contract. If the operation is not yet specified, the process
records it as `PENDIENTE`.

Process documents describe business flow. They do not define BPMN, workflow
engine constructs, task assignment engines or executable process models.

## 9. AI-assisted extraction

AI agents may assist with:

- inventory extraction and summarization;
- drafting candidate entities, operations and rules;
- source tracing suggestions;
- cross-link and identifier checks;
- scenario drafts;
- consistency and completeness review.

AI agents must:

- cite a characterization section or source reference for every claim;
- label every claim;
- state uncertainty explicitly;
- keep inferred behavior out of normative statements;
- avoid copying code, DTOs, Swagger payloads or legacy naming into the
  normative body;
- avoid using a non-pinned Dolibarr checkout as authority.

Human verification is mandatory for:

- every `DEMOSTRADO` claim;
- every `Normative: yes` element;
- every decision link;
- every scope exclusion;
- every final review.

An agent must not promote `INFERIDO` to `DEMOSTRADO` without new reproducible
evidence.

## 10. Quality gates

An AFS is reviewable only when all applicable gates pass:

| Gate | Check |
|---|---|
| Reference | Front matter pins 24.0.1 and the registered commit |
| Scope | Includes and exclusions are explicit |
| Evidence | Every element has an evidence label |
| Normative | No `INFERIDO` or `PENDIENTE` element is `Normative: yes` |
| Traceability | Every demonstrated claim links to evidence |
| Decisions | Decision links point to existing decision documents |
| Implementation | Implementation links point to existing code or coverage entries |
| No duplication | The AFS links to characterization and decisions instead of copying them |
| Language | Normative sections are free of PHP, Java, Spring and Flowable concepts |
| Identifiers | Document and element identifiers are unique and stable |
| Processes | Every process has trigger, steps, alternate paths and effects |
| Scenarios | Every scenario has observable expected results |
| Review | A human reviewer and review date are recorded |

## 11. Partial automation and non-goals

Lightweight checks may be performed with existing tools:

- search for duplicate identifiers;
- verify that referenced files exist;
- verify front-matter fields;
- compare the AFS inventory with `api-inventory.tsv`;
- search for forbidden implementation terms in normative sections;
- verify that `INFERIDO` elements do not have `Normative: yes`.

Non-goals:

- generating normative content automatically;
- generating code or API contracts;
- executing business processes;
- maintaining a schema registry or custom validation framework;
- replacing human review;
- treating an AI summary as evidence.

## 12. Reference drift

If the baseline changes:

1. record the new version and commit;
2. re-run the affected evidence;
3. mark affected elements for review;
4. update or supersede the AFS explicitly;
5. never silently rewrite historical evidence.

If a local source checkout differs from the pinned reference, the AFS must say so
and treat source-only conclusions as `INFERIDO`.

## 13. Definition of done for an AFS

An AFS is done when:

- its scope is explicit;
- its model covers entities, operations, states, rules, events, permissions,
  dependencies and scenarios as applicable;
- every element has evidence and normative status;
- demonstrated behavior is traceable and reproducible;
- inferred and pending behavior is clearly separated;
- cross-module effects and dependencies are identified;
- decisions and implementation are linked, not duplicated;
- the quality gates pass;
- a human review is recorded.
