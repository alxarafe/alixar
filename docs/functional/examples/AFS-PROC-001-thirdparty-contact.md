---
spec_id: AFS-PROC-001
title: Contact creation linked to a ThirdParty
profile: process
status: draft
version: 0.1.0
reference_system: Dolibarr
reference_version: 24.0.1
reference_commit: b7958385f00a92219f76a4dfea67dae93df97a25
reference_profile: baseline-ES
evidence_cutoff: 2026-11-07
related_characterizations:
  - dolibarr-reference: reference/characterization/THIRDPARTY-REF-001-thirdparty-lifecycle.md
  - dolibarr-reference: reference/characterization/CONTACT-REF-001-contact-lifecycle.md
related_decisions:
  - docs/thirdparty.md
related_implementation:
  - src/main/java/es/alxarafe/alixar/contact/
  - src/main/java/es/alxarafe/alixar/thirdparty/
---

# AFS-PROC-001 - Contact creation linked to a ThirdParty

## 1. Purpose and scope

Model the cross-module process that creates a Contact and optionally links it to
an existing ThirdParty in the pinned Dolibarr baseline.

**In scope**

- contact creation with a mandatory last name;
- optional ThirdParty reference;
- reference validation and authorization;
- persisted link and read-side `socname`;
- standalone contact;
- effect of deleting the linked ThirdParty;
- observed defaults and audit metadata.

**Out of scope**

- contact email lookup, categories, roles and user creation;
- contact update and delete except where needed to explain the lifecycle;
- third-party creation itself; see `AFS-TP-001`;
- structured addresses, geography, bank data and advanced fiscal behavior;
- Alixar canonical API design.

## 2. Reference context

| Item | Value |
|---|---|
| Dolibarr | 24.0.1, commit `b7958385f00a92219f76a4dfea67dae93df97a25` |
| Profile | `baseline-ES` |
| Enabled modules | `API`, `SOCIETE`, `USER` |
| Country, language, currency | ES, `es_ES`, EUR |
| Timezone | `Europe/Madrid` |
| Relevant configuration | `MAIN_LANG_DEFAULT=es_ES`, `MAIN_MONNAIE=EUR`; no LDAP, Agenda or Zapier trigger modules enabled |

## 3. Actors, permissions and restrictions

| ID | Actor or permission | Effect | Evidence |
|---|---|---|---|
| `AFS-PROC-001-PERM-001` | Contact creation permission (`societe/contact/creer`) | Required to create a contact | `DEMOSTRADO` for the admin user; `INFERIDO` for non-admin enforcement |
| `AFS-PROC-001-PERM-002` | Resource access to the referenced ThirdParty | A supplied reference must exist and be accessible | `DEMOSTRADO` through API behavior |

## 4. Conceptual model

### 4.1 Entities

| ID | Entity | Business meaning | Evidence |
|---|---|---|---|
| `AFS-PROC-001-ENT-001` | Contact | Person associated with a third party or standalone | `DEMOSTRADO` |
| `AFS-PROC-001-ENT-002` | ThirdParty | Commercial third party that may own contacts | `DEMOSTRADO` |

### 4.2 Attributes relevant to the process

| Entity | Attribute | Type | Required | Business meaning | Evidence |
|---|---|---|---|---|---|
| Contact | last name | text | yes | Contact family name | `DEMOSTRADO` |
| Contact | first name | text | no | Contact given name | `DEMOSTRADO` |
| Contact | email | text | no | Contact email | `DEMOSTRADO` |
| Contact | third-party reference | identifier | no | Owning third party | `DEMOSTRADO` |
| Contact | active state | boolean | implicit | Effective state; defaults to active | `DEMOSTRADO` |
| Contact | commercial status | identifier | implicit | Prospect status; defaults to "never contacted" | `DEMOSTRADO` |

### 4.3 Relationships

| ID | Relationship | Cardinality | Optional | Delete or lifecycle effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-001-REL-001` | Contact → ThirdParty | many-to-one | yes | Legacy application cascade on ThirdParty delete; physical foreign key is `RESTRICT` | `DEMOSTRADO` |

### 4.4 Structural invariants

| ID | Invariant | Evidence |
|---|---|---|
| `AFS-PROC-001-RULE-001` | A contact can exist without a third party | `DEMOSTRADO` |
| `AFS-PROC-001-RULE-002` | A contact references at most one third party | `DEMOSTRADO` |
| `AFS-PROC-001-RULE-003` | Many contacts can reference the same third party | `DEMOSTRADO` |

## 5. Lifecycle and states

| ID | State or transition | Values | Trigger | Effect | Evidence |
|---|---|---|---|---|---|
| `AFS-PROC-001-ST-001` | Initial contact state | active / inactive | Creation | Defaults to active | `DEMOSTRADO` |
| `AFS-PROC-001-ST-002` | Initial commercial status | never contacted / other | Creation | Defaults to never contacted | `DEMOSTRADO` |
| `AFS-PROC-001-ST-003` | Link transition | standalone / linked | Create or update | Association can be set or cleared | `DEMOSTRADO` |
| `AFS-PROC-001-ST-004` | Parent deletion effect | linked / deleted | ThirdParty delete | Legacy deletes linked contacts | `DEMOSTRADO` |

## 6. Process flow

| ID | Step | Actor | Operation | Entities | Event or effect | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-001-STEP-001` | Identify or create the owning third party | Caller | Create or read third party | ThirdParty | Valid owning reference | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-002` | Submit the contact with last name and optional reference | Caller | Create contact | Contact | Candidate contact | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-003` | Validate the mandatory last name | System | Create contact | Contact | Reject missing last name | `INFERIDO` |
| `AFS-PROC-001-STEP-004` | Resolve and authorize the reference | System | Create contact | ThirdParty | Accept or reject reference | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-005` | Persist the contact with defaults and audit metadata | System | Create contact | Contact | Contact row with optional link | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-006` | Emit the creation event | System | Trigger dispatch | Contact | `CONTACT_CREATE` | `INFERIDO` |
| `AFS-PROC-001-STEP-007` | Read the contact | Caller | Read contact | Contact, ThirdParty | Link and `socname` are visible | `DEMOSTRADO` |

### 6.1 Alternate paths

| ID | Condition | Result | Evidence |
|---|---|---|---|
| `AFS-PROC-001-STEP-008` | No third-party reference supplied | Standalone contact is created | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-009` | Reference is non-existent, zero or inaccessible | Rejected; no contact is persisted | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-010` | Last name missing | Validation rejection | `INFERIDO`; exact HTTP status not observed |
| `AFS-PROC-001-STEP-011` | Third party is deleted later while linked | Legacy deletes linked contacts | `DEMOSTRADO` |
| `AFS-PROC-001-STEP-012` | Contact association is changed later | Link can be set or cleared through update | `DEMOSTRADO` |

### 6.2 Transaction and compensation

The contact insert and the optional link are persisted together. Whether a
trigger failure rolls back the insert was not exercised and remains `PENDIENTE`.
The legacy parent-delete cascade is an application-level behavior, not a database
cascade; the physical foreign key is `RESTRICT`.

## 7. Operations and use cases

### `AFS-PROC-001-UC-001` - create a linked contact

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for the demonstrated behavior |
| Decision | `ADAPT`; canonical name is `thirdPartyId` |
| Implementation | `DONE` for native Contact creation and the optional relationship |

**Preconditions**

- The caller is authenticated.
- The caller has the contact creation permission.
- When a reference is supplied, the third party exists and is accessible.

**Functional input**

- last name, required;
- first name, email and other optional contact fields;
- third-party reference, optional.

**Effects**

- a contact is created;
- the active state defaults to active;
- the commercial status defaults to never contacted;
- the creator and entity are recorded;
- when a reference is supplied, the link is persisted and the third-party name is
  returned on reads.

**Postconditions**

- the contact is readable by its identity;
- the link is visible through the contact read and the third-party contact list
  filter.

**Observable errors**

| Condition | Result | Evidence |
|---|---|---|
| Last name missing | Validation rejection | `INFERIDO`; exact status not observed |
| Third-party reference `999999` | HTTP 404, `Thirdparty with id=999999 not found or not allowed`; no row persisted | `DEMOSTRADO` |
| Third-party reference `0` | HTTP 404, `Thirdparty with id=0 not found or not allowed`; no row persisted | `DEMOSTRADO` |

**Events emitted**

| ID | Event | Evidence |
|---|---|---|
| `AFS-PROC-001-EVT-001` | `CONTACT_CREATE` | `INFERIDO` from source; no trigger consumer active in baseline |

### `AFS-PROC-001-UC-002` - create a standalone contact

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` |
| Decision | `KEEP` |
| Implementation | `DONE`; `thirdPartyId` is nullable |

Same as `UC-001` without a third-party reference. Reads expose an empty link and
no third-party name.

### `AFS-PROC-001-UC-003` - delete a third party with linked contacts

| Field | Value |
|---|---|
| Evidence | `DEMOSTRADO` |
| Normative | `yes` for legacy behavior |
| Decision | `DISCARD`; Alixar rejects with `409` until contacts are unlinked or reassigned |
| Implementation | `DONE`; `THIRD_PARTY_DELETE_CONFLICT` |

**Legacy behavior**

- Deleting a third party with linked contacts succeeds and deletes the linked
  contacts.
- Standalone contacts remain.
- The behavior is an application-level cascade; the database foreign key is
  `RESTRICT`.

**Alixar decision**

- Reject the deletion with `409 THIRD_PARTY_DELETE_CONFLICT`.
- Do not delete contacts automatically.
- Require the client to unlink or reassign contacts first.

## 8. Business rules and invariants

| ID | Rule | Applies to | Trigger | Exception | Evidence | Normative |
|---|---|---|---|---|---|---|
| `AFS-PROC-001-RULE-004` | The last name is mandatory | Contact creation | Request validation | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-005` | The third-party reference is optional | Contact creation | Request validation | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-006` | A supplied reference must exist and be accessible | Contact creation | Reference resolution | Rejected with 404 in legacy | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-007` | The active state defaults to active | Contact creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-008` | The commercial status defaults to never contacted | Contact creation | Creation | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-009` | Reads expose the linked third-party name | Contact read | Link present | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-010` | The contact list can be filtered by third party | Contact list | Link present | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-011` | Legacy deletes linked contacts when the parent is deleted | ThirdParty delete | Link present | None observed | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-012` | The physical foreign key is restrictive | Persistence | Schema | None | `DEMOSTRADO` | yes |
| `AFS-PROC-001-RULE-013` | A trigger failure rolls back the contact creation | Contact creation | Trigger dispatch | Not exercised | `INFERIDO` | no |

## 9. Events, triggers and cross-module effects

| ID | Event or trigger | Producer | Consumers or affected modules | Condition | Active in baseline | Evidence |
|---|---|---|---|---|---|---|
| `AFS-PROC-001-EVT-001` | `CONTACT_CREATE` | Contact creation | LDAP, Agenda, Zapier, webhooks | After creation | No | `INFERIDO` |
| `AFS-PROC-001-EVT-002` | `CONTACT_MODIFY` | Contact update | LDAP, Agenda, Zapier | After update | No | `INFERIDO` |
| `AFS-PROC-001-EVT-003` | `CONTACT_DELETE` | Contact delete | LDAP, Zapier | After delete | No | `INFERIDO` |
| `AFS-PROC-001-EVT-004` | Contact cascade | ThirdParty delete | Contact | Linked contact present | Yes, legacy | `DEMOSTRADO` |

## 10. Dependencies

| ID | Dependency | Direction | Why it matters | Evidence |
|---|---|---|---|---|
| `AFS-PROC-001-DEP-001` | ThirdParty existence and access | upstream | A supplied reference must resolve | `DEMOSTRADO` |
| `AFS-PROC-001-DEP-002` | Authenticated user and permissions | upstream | Creation and reference access | `DEMOSTRADO` for admin; `INFERIDO` otherwise |
| `AFS-PROC-001-DEP-003` | Entity scope | upstream | Contact entity defaults to the active entity | `DEMOSTRADO` |
| `AFS-PROC-001-DEP-004` | Trigger consumers | downstream | Post-creation effects | `INFERIDO` |

## 11. Test scenarios

| ID | Scenario | Given | When | Then | Evidence | Purpose |
|---|---|---|---|---|---|---|
| `AFS-PROC-001-TEST-001` | Linked creation | An existing third party | Create a contact with last name and reference | Contact is created and linked; reads expose the name | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-002` | Standalone creation | No third party | Create a contact with only a last name | Contact is created without a link | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-003` | Non-existent reference | No matching third party | Create a contact with reference `999999` | HTTP 404; no contact persisted | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-004` | Zero reference | No third party `0` | Create a contact with reference `0` | HTTP 404; no contact persisted | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-005` | List filter | A linked contact | List contacts by third party | The linked contact is returned | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-006` | Legacy parent delete | A linked contact | Delete the third party | Contact is deleted in legacy | `DEMOSTRADO` | conformance |
| `AFS-PROC-001-TEST-007` | Alixar parent delete | A linked contact | Delete the third party | HTTP 409; contact is preserved | Decision | contract |
| `AFS-PROC-001-TEST-008` | Missing last name | No fixture | Create a contact without a last name | Validation rejection | `INFERIDO` | verification |
| `AFS-PROC-001-TEST-009` | Trigger effect | A trigger consumer enabled | Create a contact | Consumer behavior is observed | `PENDIENTE` | verification |

## 12. Traceability

| Element | Evidence | Decision | Implementation | Test | Status |
|---|---|---|---|---|---|
| `AFS-PROC-001-UC-001` | `THIRDPARTY-REF-001` contact association | `ADAPT` in `docs/thirdparty.md` | Contact create with `thirdPartyId` | `AFS-PROC-001-TEST-001` | `DONE` |
| `AFS-PROC-001-UC-002` | `CONTACT-REF-001` standalone create | `KEEP` | Nullable `thirdPartyId` | `AFS-PROC-001-TEST-002` | `DONE` |
| `AFS-PROC-001-UC-003` | `THIRDPARTY-REF-001` cascade evidence | `DISCARD`; reject with 409 | `THIRD_PARTY_DELETE_CONFLICT` | `AFS-PROC-001-TEST-006` and `AFS-PROC-001-TEST-007` | `DONE` |
| `AFS-PROC-001-RULE-006` | `api_contacts.class.php:371-380` at pinned commit | `ADAPT`; canonical 422 | `CONTACT_INVALID_THIRD_PARTY_REFERENCE` | `AFS-PROC-001-TEST-003` | `DONE` |
| `AFS-PROC-001-EVT-001` | `contact.class.php` triggers at pinned commit | `PENDING` | Canonical audit `CONTACT_CREATED` is separate | `AFS-PROC-001-TEST-009` | `PENDING` |

## 13. Open questions and pending verification

| Question | Why it matters | Required evidence | Owner or next step |
|---|---|---|---|
| What is the exact HTTP result for a missing last name? | Completes the create contract | Runtime request without `lastname` | Future characterization |
| Are triggers transactional with the contact insert? | Defines atomicity | Trigger failure injection | Future characterization |
| Which trigger consumers are active in a production profile? | Determines real cross-module effects | Runtime observation with modules enabled | Future characterization |
| Can a contact be reassigned between third parties without restrictions? | Completes the relationship lifecycle | Controlled update matrix | Future characterization |

## 14. Review record

| Field | Value |
|---|---|
| Reviewer | Pending |
| Review date | Pending |
| Reference confirmed | yes |
| Quality gates passed | Pending |
| Notes | Legacy cascade is documented but explicitly rejected in Alixar; evidence and decision remain separate |
