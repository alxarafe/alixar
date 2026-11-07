---
spec_id: AFS-TP-001
title: ThirdParty - create operation
profile: operation
status: draft
version: 0.1.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: baseline-ES
evidence_cutoff: 2026-11-07
related_characterizations:
  - dolibarr-reference: reference/characterization/THIRDPARTY-REF-001-thirdparty-lifecycle.md
related_decisions:
  - docs/thirdparty.md
related_implementation:
  - src/main/java/es/alxarafe/alixar/thirdparty/
---

# AFS-TP-001 - ThirdParty create operation

## 1. Purpose and scope

Model the creation of a ThirdParty in the pinned Dolibarr baseline.

**In scope**

- minimal creation;
- required name behavior;
- observed defaults;
- observed duplicate-name behavior;
- observed handling of unknown input members;
- observed country-code resolution;
- observed creator and creation metadata.

**Out of scope**

- read, list, update and delete;
- advanced fiscal rules;
- structured addresses and geography;
- bank accounts, categories, representatives, discounts and notifications;
- merge, documents and outstanding sales documents;
- Alixar canonical API decisions.

## 2. Reference context

| Item | Value |
|---|---|
| Dolibarr | 24.0.1, commit `b7958385f00a92219f76a4dfea67dae93df97a25` |
| Profile | `baseline-ES` |
| Enabled modules | `API`, `SOCIETE`, `USER` |
| Country, language, currency | ES, `es_ES`, EUR |
| Relevant configuration | No `SOCIETE_EMAIL_*`, `SOCIETE_IDPROF*_*` or `SOCIETE_VAT_INTRA_*` mandatory/unique constants in the baseline |

## 3. Actors, permissions and restrictions

| ID | Actor or permission | Effect | Evidence |
|---|---|---|---|
| `AFS-TP-001-PERM-001` | `societe/creer` | Required to create a third party | `INFERIDO` from API source; non-admin runtime not observed |
| `AFS-TP-001-PERM-002` | Resource access check | The API checks access to the resulting resource | `INFERIDO` from API source |

## 4. Conceptual model

### 4.1 Entities

| ID | Entity | Business meaning | Evidence |
|---|---|---|---|
| `AFS-TP-001-ENT-001` | ThirdParty | Commercial third party | `DEMOSTRADO` |

### 4.2 Attributes relevant to creation

| Attribute | Type | Required | Business meaning | Evidence |
|---|---|---|---|---|
| name | text | yes | Business name | `DEMOSTRADO` |
| customer classification | enum | no | None, customer, prospect or customer and prospect | `DEMOSTRADO` through legacy `client` |
| prospect flag | boolean | no | Compatibility flag; not a persisted classification | `DEMOSTRADO` |
| supplier | boolean | no | Supplier condition | `DEMOSTRADO` through legacy `fournisseur` |
| active | boolean | no | Effective active state | `DEMOSTRADO` through legacy `status` |
| email | text | no | Contact email | `DEMOSTRADO` |
| country code | text | no | Country reference | `DEMOSTRADO` |
| tax identifier | text | no | Spanish CIF/NIF | `DEMOSTRADO` as accepted value |
| intra-community VAT | text | no | Intra-community VAT identifier | `DEMOSTRADO` as accepted value |

The characterization does not individually exercise every company field.
Unlisted fields remain `PENDIENTE` for this operation.

### 4.3 Relationships

None required for creation. The Contact relationship is modelled in
`AFS-PROC-001`.

### 4.4 Structural invariants

| ID | Invariant | Evidence |
|---|---|---|
| `AFS-TP-001-RULE-001` | A third party can exist with only a name | `DEMOSTRADO` |
| `AFS-TP-001-RULE-002` | The name is not a unique identity | `DEMOSTRADO` |

## 5. Lifecycle and states

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-TP-001-ST-001` | Initial active state | active / inactive | Creation | Defaults to active | `DEMOSTRADO` |
| `AFS-TP-001-ST-002` | Initial classification | none / customer / prospect / both | Creation | Defaults to none; the compatibility prospect flag is false | `DEMOSTRADO` |
| `AFS-TP-001-ST-003` | Initial supplier condition | supplier boolean | Creation | Defaults to false | `DEMOSTRADO` |

## 6. Process flow

`N/A` for this operation profile.

## 7. Operation `AFS-TP-001-UC-001` - create third party

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for the demonstrated behavior |
| Decision | `ADAPT`; see `docs/thirdparty.md` |
| Implementation | `DONE` for native Alixar creation; see `docs/migration-coverage.md` |

**Preconditions**

- The caller is authenticated.
- The caller has the creation permission.

**Functional input**

- `name` is required.
- The optional fields exercised in the characterization may be supplied.

**Effects**

- A third party is created.
- An internal identity is generated.
- Defaults are applied.
- The creator and creation timestamp are recorded.
- A country code, when supplied, is resolved to a country reference.

**Postconditions**

- The created third party is readable by its internal identity.

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| `name` absent | HTTP 400, `name field missing` | `DEMOSTRADO` |
| `name` empty or whitespace-only | HTTP 500, `ErrorBadThirdPartyName` | `DEMOSTRADO` |
| `nom` or `ref` supplied instead of `name` | HTTP 400, `name field missing` | `DEMOSTRADO` |
| Unknown input member supplied | Accepted and ignored | `DEMOSTRADO` |
| Successful creation | HTTP 200 with the new integer identifier | `DEMOSTRADO` |

**Events emitted**

| ID | Event | Evidence |
|---|---|---|
| `AFS-TP-001-EVT-001` | `COMPANY_CREATE` | `INFERIDO` from source; no trigger consumer active in baseline |

## 8. Business rules and invariants

| ID | Rule | Applies to | Trigger | Exception | Evidence | Normative |
|---|---|---|---|---|---|---|
| `AFS-TP-001-RULE-003` | The name is required in the input | Creation | Request validation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-004` | The name is trimmed before persistence | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-005` | An empty or whitespace-only name is rejected by the business layer | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-006` | Duplicate names are allowed | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-007` | Unknown input members are ignored | Creation | Request handling | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-008` | Classification defaults to none; the prospect compatibility flag is false | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-009` | Supplier condition defaults to false | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-010` | Active state defaults to true | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-011` | Email is optional and is not format-validated by default | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-012` | Fiscal identifiers are accepted without format or uniqueness validation by default | Creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-013` | A supplied country code is resolved to a country reference | Creation | Creation | Unknown code returns an error | `DEMOSTRADO` | yes |
| `AFS-TP-001-RULE-014` | Customer and supplier codes are not auto-generated without the corresponding numbering configuration | Creation | Creation | Numbering configuration not characterized | `INFERIDO` | no |
| `AFS-TP-001-RULE-015` | A trigger failure can roll back creation | Creation | Trigger dispatch | Not exercised | `INFERIDO` | no |

## 9. Events, triggers and cross-module effects

| ID | Event or trigger | Producer | Consumers or affected modules | Condition | Active in baseline | Evidence |
|---|---|---|---|---|---|---|
| `AFS-TP-001-EVT-001` | `COMPANY_CREATE` | ThirdParty creation | Agenda, Stripe, Zapier, webhooks, notifications | After creation | No | `INFERIDO` |
| `AFS-TP-001-EVT-002` | Mailing `no_email` handling | Creation | Mailing | Email present and mailing module enabled | No | `INFERIDO` |

## 10. Dependencies

| ID | Dependency | Direction | Why it matters | Evidence |
|---|---|---|---|---|
| `AFS-TP-001-DEP-001` | Country dictionary | upstream | Country-code resolution | `DEMOSTRADO` |
| `AFS-TP-001-DEP-002` | User identity | upstream | Creator metadata | `DEMOSTRADO` |
| `AFS-TP-001-DEP-003` | Numbering configuration | upstream | Customer and supplier code generation | `INFERIDO` |
| `AFS-TP-001-DEP-004` | Trigger consumers | downstream | Post-creation effects | `INFERIDO` |

## 11. Test scenarios

| ID | Scenario | Given | When | Then | Evidence | Purpose |
|---|---|---|---|---|---|---|
| `AFS-TP-001-TEST-001` | Minimal creation | No fixture | Create with only a name | Creation succeeds and defaults apply | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-002` | Missing name | No fixture | Create without `name` | HTTP 400, name missing | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-003` | Blank name | No fixture | Create with an empty or whitespace name | Business rejection; HTTP 500 in baseline | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-004` | Duplicate name | Existing third party with name N | Create another third party with name N | Both records exist | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-005` | Unknown member | No fixture | Create with an unknown member | Creation succeeds; member ignored | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-006` | Trimmed name | No fixture | Create with surrounding spaces | Persisted name is trimmed | `DEMOSTRADO` | conformance |
| `AFS-TP-001-TEST-007` | Trigger effect | A trigger consumer is enabled | Create a third party | Consumer behavior is observed | `PENDIENTE` | verification |

## 12. Traceability

| Element | Evidence | Decision | Implementation | Test | Status |
|---|---|---|---|---|---|
| `AFS-TP-001-UC-001` | `THIRDPARTY-REF-001` create matrix | `ADAPT` in `docs/thirdparty.md` | `CreateThirdPartyUseCase` | `AFS-TP-001-TEST-001` | `DONE` |
| `AFS-TP-001-RULE-004` | `societe.class.php` `Societe::create()` (line 1003); observed in `THIRDPARTY-REF-001` | `ADAPT` | `ThirdPartyNormalizer` | `AFS-TP-001-TEST-006` | `DONE` |
| `AFS-TP-001-RULE-006` | `THIRDPARTY-REF-001` duplicate-name evidence | `KEEP` | No uniqueness constraint | `AFS-TP-001-TEST-004` | `DONE` |
| `AFS-TP-001-EVT-001` | `societe.class.php:1137` at pinned commit | `PENDING` | Not implemented | `AFS-TP-001-TEST-007` | `INFERIDO` |

## 13. Open questions and pending verification

| Question | Why it matters | Required evidence | Owner or next step |
|---|---|---|---|
| Are permissions enforced identically for non-admin users? | Confirms the authorization model | Runtime observation with a restricted user | Future characterization |
| Which trigger consumers are active in a production profile? | Determines real cross-module effects | Runtime observation with modules enabled | Future characterization |
| Which optional company fields are accepted and normalized on creation? | Completes the create contract | Controlled creation matrix | Future characterization |
| When are customer and supplier codes generated? | Affects numbering and identity | Numbering configuration matrix | Future characterization |

## 14. Review record

| Field | Value |
|---|---|
| Reviewer | Pending |
| Review date | Pending |
| Reference confirmed | yes |
| Quality gates passed | Pending |
| Notes | Documentation-only example; no implementation claim for inferred behavior |
