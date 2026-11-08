# ALIXAR-REF-005 — Invoicing model validation

Date: 2026-11-08. Scope: draft AFS-PROC-004 and the three descriptive
`PROC-INV-001-ASIS-{ORDER,SHIPMENT,EXPLICIT}.bpmn` maps. Human acceptance and all
Alixar adoption decisions remain **Pending**. This report is technical modeling
evidence, not a new Dolibarr characterization or a claim of production readiness.

## Inputs and boundaries

- Alixar started on clean `main`, equal to fetched `origin/main`; work is on
  `feature/alixar-ref-005-invoicing-bpmn`.
- Runtime evidence is the merged
  [INVOICE-ROUTES-REF-001 capture](../../../dolibarr-reference/reference/characterization/INVOICE-ROUTES-REF-001-observed.json),
  from reference commit `ae4507b02ac1b04a96e597d2745b2f3ea44cd9b0`.
- Existing 27 observations, 35 HTTP records and ten installed-source SHA-256
  comparisons are reused. No functional Docker test of Dolibarr is repeated.
- No product code, API contract, database schema, runtime dependency or file in
  `dolibarr-reference` is changed. No process engine is introduced.

## Temporary review tools

The existing process-documentation versions are reused: `bpmn-moddle@9.0.1`
for import and its BPMN 2.0 XSD set (BPMN20, Semantic, BPMNDI, DI and DC),
and `bpmn-js@18.9.1` for browser import and SVG/PNG rendering. Moddle uses MIT;
bpmn-js uses the bpmn.io license, including its visible watermark requirement;
installed package metadata and license files were inspected.
`playwright@1.56.1` (Apache-2.0) drives the existing Chromium image. These are
temporary review dependencies, not Maven/application dependencies.

| Tool container | Pinned image |
|---|---|
| XML generation, moddle and reference checks | `node:24.19.0-bookworm-slim@sha256:a9f5f7c91a432850b2a8a7797adf5eadb6c733ceed61167806cee7ea7fbc29df` |
| Visual rendering | `mcr.microsoft.com/playwright@sha256:f1e7e01021efd65dd1a2c56064be399f3e4de00fd021ac561325f2bfbb2b837a` (Chromium build 1194) |

All containers use `--rm`; document/evidence mounts are read-only during checks.
No application service is started. Temporary dependencies, validation scripts
and preview exports remain under `/tmp/alixar-ref005-review`, outside Git.

Official sources: [OMG BPMN 2.0.2 and normative XSD set](https://www.omg.org/spec/BPMN/2.0.2/),
[bpmn-js import/render walkthrough](https://bpmn.io/toolkit/bpmn-js/walkthrough/).

## Checks and results

After the fidelity correction, XML/XSD and visual checks were repeated only for
ORDER and SHIPMENT; their final results are recorded below. EXPLICIT is unchanged
(SHA-256 below), so its prior XSD/render results remain valid. Moddle/reference
checks cover all three models. Human review remains pending.

| Check | Result |
|---|---|
| XSD | Corrected ORDER and SHIPMENT validate against BPMN20.xsd and its imported Semantic/BPMNDI/DI/DC schemas; unchanged EXPLICIT retains its previous pass. `xmllint --nonet --noout --schema`, libxml2-utils `2.9.14+dfsg-1.3~deb12u6` in the temporary Node container |
| Moddle import | `bpmn-moddle@9.0.1`: three imports, zero warnings |
| Structure | One non-executable process/diagram per file; standard namespaces; unique IDs; existing source/target and incoming/outgoing references; labeled conditions on splitting gateways; all flow nodes reachable from start and able to reach an end. Retired observation nodes/connectors have no XML references; stock notes attach to validation, context notes to source start events |
| BPMN-DI | A shape for each node/annotation and edge for each sequence flow/association; positive bounds and at least two waypoints per edge |
| Evidence consistency | 27 observation scenario/stage selectors present in AFS; 35 HTTP records; ten manifest/expected/installed source hashes equal; current reference fixture and runner hashes equal OBS metadata |
| Documentation | 45 local targets/anchors checked across the AFS, validation report, functional/process indexes and business inventory |
| Browser | Corrected ORDER and SHIPMENT imported with `bpmn-js@18.9.1` in Chromium build 1194, zero warnings; SVG and 1800×760 PNG exports produced. Prior unchanged EXPLICIT result reused |
| Visual inspection | Corrected ORDER and SHIPMENT PNGs inspected: direct business sequences, separate context notes, stock notes associated with validation, repetition and evidence limits retained. Unchanged EXPLICIT retains its previous visual review |
| Scope / hygiene | Eight documentation/model files only; no secrets, raw functional logs or temporary review dependencies added; sibling reference tree remains clean |
| Whitespace | `git diff --check` plus `git diff --no-index --check /dev/null <new-file>` for each of the five new files passed |

Initial local-link checks exposed mount-layout and self-anchor handling errors
in the temporary checker, corrected without changing the evidence. The final
45-target check passed. Moddle/renderer imports had no model warnings. Tool
installation emitted a newer-npm notice and the absence-of-apt-utils debconf
notice; neither affected validation. No production build or full Alixar runtime
validation was executed for this documentation-only change.

| Final diagram | Flow nodes | Sequence flows | DI elements | SHA-256 |
|---|---|---|---|---|
| ORDER | 13 | 14 | 35 | `ff12bba8aa8cbbf873c5785e9d58fe552a17964d1b3a59e8abde20cec8d8470e` |
| SHIPMENT | 5 | 4 | 17 | `8ef6983807e774bda89f577b9f74afb844702a3926393e85b5dea1e95e0f8a3a` |
| EXPLICIT | 9 | 8 | 21 | `74f85fcfe744493f82c45d9dde71c18cf2df5eb61ab93bc294550ab7aca294e9` |

### Commands and local review artifacts

The temporary review directory contains `validate.cjs`, `render.cjs`, the exact
installed package lock, `validation-result.json` and `<diagram>.bpmn.svg/.png`.
These local artifacts are not part of the repository. The structural checker
compares XML graph references, DI coverage, gateway conditions, local anchors
and retained reference metadata; the browser helper uses `importXML`,
`zoom('fit-viewport')`, `saveSVG` and a screenshot. They do not execute a business
process or query a running ERP. The following commands were executed from the
Alixar root (the temporary tools must exist to repeat them in this session):

```bash
docker run --rm --network none \
  -v /tmp/alixar-ref005-review:/work \
  -v "$PWD:/repo:ro" \
  -v "$PWD/../dolibarr-reference:/reference:ro" \
  -v "$PWD/../dolibarr-reference:/dolibarr-reference:ro" -w /work \
  node:24.19.0-bookworm-slim@sha256:a9f5f7c91a432850b2a8a7797adf5eadb6c733ceed61167806cee7ea7fbc29df \
  node validate.cjs

docker run --rm --network none \
  -v /tmp/alixar-ref005-review:/work -v "$PWD:/repo:ro" -w /work \
  mcr.microsoft.com/playwright@sha256:f1e7e01021efd65dd1a2c56064be399f3e4de00fd021ac561325f2bfbb2b837a \
  node render.cjs

docker run --rm \
  -v /tmp/alixar-ref005-review:/work -v "$PWD:/repo:ro" \
  node:24.19.0-bookworm-slim@sha256:a9f5f7c91a432850b2a8a7797adf5eadb6c733ceed61167806cee7ea7fbc29df \
  sh -c 'set -e
    apt-get update -qq
    apt-get install -y -qq --no-install-recommends libxml2-utils=2.9.14+dfsg-1.3~deb12u6 >/dev/null
    for variant in ORDER SHIPMENT; do
      file=/repo/docs/processes/PROC-INV-001-ASIS-$variant.bpmn
      xmllint --nonet --noout --schema /work/node_modules/bpmn-moddle/resources/bpmn/xsd/BPMN20.xsd "$file"
    done'

git diff --check
```

Package installation used `npm install --no-audit --no-fund --save-exact
bpmn-moddle@9.0.1 bpmn-js@18.9.1 playwright@1.56.1` inside the pinned Node
container, with `/tmp/alixar-ref005-review` as its working directory. No host
Node/XML dependency is required. The separate Chromium container uses only
local files with `--network none`. All validation containers exited successfully
and used automatic removal; no Docker volumes or application deployment were
created by these checks.

## Interpretation limits

The three variants follow business input and source relationships, not one map
per endpoint. Branch conditions are descriptive and bounded by executed entry
paths. Generic-origin validation denial is explicitly `INFERIDO` from the shared
validation boundary exercised with an order-origin draft, with its own runtime
variant `PENDIENTE`. Unexecuted source guards and event dispatch are not promoted.

Repeated creation is shown in annotations as another execution, not a new
business loop or automatic retry. No positive-remaining-quantity condition is
invented. Validation replay is separate from creating another invoice.

Observation tasks O_Stock, S_Source and S_Stock were removed after the functional
audit: harness inspection is not a demonstrated business activity. O_F13 now
reaches O_End; S_F1 reaches S_Copy; S_F5 reaches S_End. O_F15, S_F2 and S_F6 are
retired. Unaffected element IDs remain stable. O_ContextNote/S_ContextNote capture
opening/source/prior balances and attribute prior decreases to upstream
order/shipment validation. O_StockNote/S_StockNote attach conditioned invoice
effects to O_Validate/S_Validate. The AFS traceability now distinguishes business
activity, observed effect, harness context and inferred/pending behavior. The
inventory operation wording was aligned without adding an operation.

Both shipment and invoice decrement can occur under the demonstrated
combined configuration. This is not a recommended configuration or an Alixar
decision. Structural and visual validity do not establish business fidelity;
human review of the AFS, evidence boundaries and exclusions remains necessary.
