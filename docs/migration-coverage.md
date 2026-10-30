# ERP Migration Coverage Master

## 1. Purpose

This document is the control register for the progressive migration of legacy
Dolibarr ERP capabilities to Alixar and Solucar.

It answers one question at any point in time:

> Which Dolibarr functionality have we identified, what do we know about it,
> what migration decision have we taken, and how much is actually migrated in
> Alixar and Solucar?

It is a **coverage control**, not a commercial roadmap, changelog, commit list,
endpoint catalogue, replacement for Dolibarr characterizations, or complete
future ERP specification.

Current snapshot: **2026-10-29**.

---

## 2. Authority and source of truth

```text
dolibarr-reference
    ↓
legacy evidence and functional characterization

Alixar
    ↓
functional decision + domain + persistence + API + security + audit

Solucar
    ↓
web experience over Alixar capabilities
```

| Repository | Authority | Not authority for |
|------------|-----------|-------------------|
| `dolibarr-reference` | Reproducible observation of legacy Dolibarr behavior under a pinned profile | Alixar domain, canonical API, future requirements |
| Alixar | Business rules, canonical decisions, persistence, API, authorization and audit | UI implementation details |
| Solucar | Presentation and user experience over the canonical API | Domain rules or business authority |

`dolibarr-reference` demonstrates **what Dolibarr does**. It does not
automatically determine **what Alixar must do**.

Swagger, API inventories, source inspection and database inspection are
discovery and evidence sources. They are not migration decisions. Observed
behavior takes precedence over assumptions and incomplete documentation.

### 2.1 Legacy evidence is not a decision

For every capability, keep these three concerns separate:

```text
Legacy evidence
    what Dolibarr actually does, as characterized

Migration decision
    what Alixar decides to keep, adapt, replace, discard or not apply

Implementation state
    what actually exists today in Alixar and Solucar
```

Examples already known from `THIRDPARTY-REF-001` remain **legacy evidence**, and
their canonical destination is now explicitly recorded by `THIRDPARTY-001`:

| Legacy observation | Is it an Alixar requirement? |
|--------------------|------------------------------|
| `GET /thirdparties/0` returns a specimen object | No. `DISCARD`; zero is an invalid identifier |
| An empty third-party list returns HTTP 404 | No. `REPLACE`; an empty list is `200` with an empty collection |
| A blank third-party name can produce HTTP 500 | No. `REPLACE`; it is a `400` validation error |
| Unknown create JSON body fields are ignored | No. `REPLACE`; unknown JSON body fields are rejected |

The master must never convert an observed Dolibarr quirk into an Alixar
contract by implication. The decisions above are recorded in
[ThirdParty](thirdparty.md).

---

## 3. Non-loss rule

> **No identified legacy business capability may disappear from this master.**

Every known capability must end in one of these closure outcomes:

```text
MIGRATED
REPLACED
DISCARDED
NOT_APPLICABLE
```

If no decision exists yet:

```text
PENDING
```

If it is only partially covered:

```text
PARTIAL
```

A capability consciously discarded remains in the master with its decision and
reason. Rows are not deleted to simplify the document.

"Identified" includes capabilities discovered through:

- a Dolibarr characterization;
- the current API inventory or Swagger descriptor;
- enabled reference modules;
- Alixar or Solucar implementation evidence;
- a future expanded reference profile.

When evidence is incomplete, record the capability as `PENDING`; do not omit it.

---

## 4. Controlled vocabulary

### 4.1 Legacy evidence state

| State | Meaning |
|-------|---------|
| `PENDING` | Known from inventory or a source but not functionally characterized |
| `PARTIAL` | Some evidence exists; material behavior or configuration dimensions remain unobserved |
| `CHARACTERIZED` | Sufficient evidence exists in `dolibarr-reference` for migration decisions |
| `N/A` | The capability has no legacy-evidence dimension |

### 4.2 Migration decision

| State | Meaning |
|-------|---------|
| `PENDING` | No explicit Alixar decision exists |
| `KEEP` | Alixar will preserve the relevant legacy behavior |
| `ADAPT` | Alixar will preserve the business intent with a canonical model or contract |
| `REPLACE` | Alixar will provide a different capability that supersedes the legacy one |
| `DISCARD` | The capability is consciously not migrated; reason remains recorded |
| `N/A` | The migration-decision dimension does not apply |

### 4.3 Implementation state

| State | Meaning |
|-------|---------|
| `PENDING` | No implementation, or only discovery |
| `PARTIAL` | Some dimensions exist, but the capability is not complete |
| `DONE` | The applicable dimension is implemented and validated |
| `N/A` | The dimension genuinely does not apply |

### 4.4 Overall state

| State | Meaning |
|-------|---------|
| `PENDING` | Identified but not sufficiently characterized or decided |
| `CHARACTERIZED` | Legacy evidence is sufficient; no completed migration decision yet |
| `DECIDED` | Explicit Alixar decision exists, implementation not started |
| `IN_PROGRESS` | Decision made and some implementation exists, but not fully migrated |
| `MIGRATED` | Meets every applicable condition in section 5 |
| `REPLACED` | Superseded by an explicit Alixar capability; legacy retirement recorded |
| `DISCARDED` | Consciously not migrated, with reason |
| `NOT_APPLICABLE` | The capability does not apply to Alixar |

`N/A` in an implementation dimension never blocks completion. It means the
dimension genuinely does not apply, not that it is still pending.

---

## 5. Definition of `MIGRATED`

A capability is **not** `MIGRATED` merely because a class, table or endpoint
exists.

When applicable, `MIGRATED` requires all of the following:

```text
legacy behavior sufficiently characterized
+ explicit migration decision
+ canonical Alixar behavior defined
+ Alixar persistence implemented
+ canonical API implemented
+ authorization implemented
+ audit behavior decided/implemented when required
+ Solucar implemented when it is a user-facing capability
+ data migration addressed when legacy data exists
+ required validation green
```

Dimensions explicitly marked `N/A` do not block `MIGRATED`.

At this snapshot, **no legacy business capability is `MIGRATED`**. The platform
foundation is largely implemented, but platform capabilities are tracked
separately in section 11 and are not counted as migrated Dolibarr business.

---

## 6. Hierarchy and dimensions

The master admits three levels:

```text
Domain
  → Capability
      → Sub-capability
```

Capability IDs in this document use `<domain>-<capability>` or
`<domain>-<sub-capability>` (for example `TP-CLASS`, `CT-CREATE`,
`TP-CONTACT-LINK`).

The two tables in section 8 form the master matrix. Both use the same IDs; a
capability must not exist in one table without the other.

| Dimension | Control question |
|-----------|------------------|
| **Capability** | What business capability are we tracking? |
| **Legacy reference / characterization** | Where is the evidence? |
| **Legacy evidence state** | How well is it characterized? |
| **Migration decision** | What did Alixar decide? |
| **Alixar domain/application** | Is the business model and use-case layer implemented? |
| **Alixar persistence** | Is there canonical Alixar persistence, independent of Dolibarr? |
| **Alixar canonical API** | Is the capability exposed through the canonical API? |
| **Authorization** | Is a real canonical authorization rule implemented? |
| **Audit** | Is the capability actually instrumented where required? |
| **Solucar** | Is the user-facing capability implemented in Solucar? |
| **Data migration** | Has historical legacy data been addressed? |
| **Validation** | Are the required checks green for the implemented slice? |
| **Dependencies** | What genuinely conditions migration order? |
| **Overall state** | Controlled roll-up |
| **Notes / gaps** | Evidence, caveats and next decision |

---

## 7. Functional inventory seed

### 7.1 Basis

This seed uses:

- `dolibarr-reference` API inventory and technical reference for Dolibarr 24.0.1
  (`baseline-ES`): **106 paths / 146 operations**, enabled modules `API`,
  `SOCIETE` and `USER`;
- `CONTACT-REF-001` and `THIRDPARTY-REF-001`;
- current Alixar code and documentation;
- current Solucar code and documentation.

A row with legacy evidence `PENDING` is **discovered but not functionally
characterized**. It is not an implementation claim.

### 7.2 Domain inventory

| Domain | Evidence source | Legacy evidence | Seed status |
|--------|-----------------|-----------------|-------------|
| Third Parties | API inventory `thirdparties`; `THIRDPARTY-REF-001` | Basic lifecycle, classification, supplier flag, status and Contact link characterized; fiscal identity partially observed; broad sub-resources only discovered | Seeded; native create/read/list implemented; update/delete pending |
| Contacts | API inventory `contacts`; `CONTACT-REF-001` | `CHARACTERIZED` for basic lifecycle; other sub-resources discovered | Seeded; canonical create/read implemented |
| Users and groups (Dolibarr) | API inventory `users` | `PENDING` | Discovered only; **not** equivalent to Alixar authentication users/roles |
| Documents | API inventory `documents` | `PENDING` | Discovered only |
| Email templates | API inventory `emailtemplates` | `PENDING` | Discovered only |
| Object links | API inventory `objectlinks` | `PENDING` | Discovered only |
| Setup and dictionaries | API inventory `setup` | `PENDING` | Discovered only |
| Categories / classifications | Category sub-endpoints on contacts and third parties | `PENDING` | Discovered only; Category module is not enabled in the baseline |
| Supplier-side business | `fournisseur` flag and `supplier_categories` endpoints | `PENDING` | Partial discovery only; supplier modules are not enabled |
| Sales and billing context | Third-party outstanding invoices/orders/proposals endpoints | `PENDING` | Indirect discovery only; modules are not enabled |
| Products / Services | Not present in the current inventory | `PENDING` | Not evidenced in the current baseline |
| Stock / Warehouses | Not present in the current inventory | `PENDING` | Not evidenced in the current baseline |
| Projects / Tasks | Not present in the current inventory | `PENDING` | Not evidenced in the current baseline |
| Bank / Cash | Not present as a ledger domain | `PENDING` | Third-party bank accounts are not Bank/Cash |
| Accounting | Not present in the current inventory | `PENDING` | Not evidenced in the current baseline |
| Agenda/Events, Tickets, HR/Expenses, Contracts, Interventions, Shipments, Members, Multicurrency | Not present in the current inventory | `PENDING` | Watchlist; do not infer absence from Dolibarr |

### 7.3 Baseline coverage warning

The current inventory depends on the enabled modules and configuration of the
reference profile.

```text
absence from the current API inventory
!=
proof that Dolibarr lacks the capability
```

The master must incorporate new capabilities when the reference profile or
characterization coverage expands. Do not present section 7 as an exhaustive
inventory of all Dolibarr.

---

## 8. Master coverage matrix

### 8.1 Decision control

| ID | Domain / capability | Legacy reference | Evidence | Decision | Overall | Dependencies |
|----|---------------------|------------------|----------|----------|---------|--------------|
| `TP-BASIC` | Third Parties — basic lifecycle aggregate (create, read, list, update, delete) | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-CREATE`; `TP-READ`; `TP-LIST`; `TP-UPDATE`; `TP-DELETE`; `TP-CONTACT-LINK` for deletion |
| `TP-CREATE` | Third Parties — create | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-BASIC` |
| `TP-READ` | Third Parties — read by canonical identifier | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-BASIC` |
| `TP-LIST` | Third Parties — list, filters and pagination | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-BASIC` |
| `TP-UPDATE` | Third Parties — partial update | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC` |
| `TP-DELETE` | Third Parties — delete and linked-Contact conflict | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC`; `TP-CONTACT-LINK` |
| `TP-CLASS` | Third Parties — customer/prospect classification (`client` 0/1/2/3) | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC` |
| `TP-SUPPLIER` | Third Parties — supplier classification (`fournisseur`) | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC`; supplier-domain decision |
| `TP-STATUS` | Third Parties — active/inactive status | `THIRDPARTY-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC` |
| `TP-FISCAL` | Third Parties — ES fiscal identity (basic subset) | `THIRDPARTY-REF-001` | `PARTIAL` | `ADAPT` | `DECIDED` | Tax/legal validation decisions for advanced rules |
| `TP-FISCAL-ADVANCED` | Third Parties — advanced ES fiscal/tax rules | `THIRDPARTY-REF-001` (partial) | `PARTIAL` | `PENDING` | `PENDING` | Tax/legal validation decisions |
| `TP-CONTACT-LINK` | Third Parties ↔ Contacts — association and deletion semantics | `THIRDPARTY-REF-001`; `CONTACT-REF-001` | `CHARACTERIZED` | `ADAPT` | `DECIDED` | `TP-BASIC`; Contact persistence; `CONTACT-002` |
| `TP-ALIAS` | Third Parties — commercial alias / alternative name | `THIRDPARTY-REF-001` (`name_alias`) | `PARTIAL` | `PENDING` | `PENDING` | `TP-BASIC` |
| `TP-ADDRESS` | Third Parties — structured addresses and geography | `THIRDPARTY-REF-001` (fields only) | `PENDING` | `PENDING` | `PENDING` | Dictionaries/geography |
| `TP-BANK` | Third Parties — bank accounts | API inventory | `PENDING` | `PENDING` | `PENDING` | Bank/Cash domain |
| `TP-ACCOUNTS` | Third Parties — external accounts | API inventory | `PENDING` | `PENDING` | `PENDING` | `TP-BASIC` |
| `TP-REPRESENTATIVES` | Third Parties — sales representatives | API inventory | `PENDING` | `PENDING` | `PENDING` | Users/sales domain |
| `TP-COMMERCIAL` | Third Parties — price levels, discounts and commercial conditions | API inventory | `PENDING` | `PENDING` | `PENDING` | Products/pricing domain |
| `TP-FINANCIAL` | Third Parties — outstanding sales documents and credit-note context | API inventory | `PENDING` | `PENDING` | `PENDING` | Sales/billing domain |
| `TP-NOTIFICATIONS` | Third Parties — notifications | API inventory | `PENDING` | `PENDING` | `PENDING` | Notification channels |
| `TP-MERGE` | Third Parties — merge/duplicate handling | API inventory; duplicate-name evidence | `PENDING` | `PENDING` | `PENDING` | Identity/deduplication; `TP-BASIC` |
| `CT-CREATE` | Contacts — create | `CONTACT-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-CONTACT-LINK`; native Contact persistence |
| `CT-READ` | Contacts — read by ID | `CONTACT-REF-001` | `CHARACTERIZED` | `ADAPT` | `IN_PROGRESS` | `TP-CONTACT-LINK`; native Contact persistence |
| `CT-LIST` | Contacts — list/search/filter | `CONTACT-REF-001` | `CHARACTERIZED` | `PENDING` | `CHARACTERIZED` | Contact persistence |
| `CT-UPDATE` | Contacts — update | `CONTACT-REF-001` | `CHARACTERIZED` | `PENDING` | `CHARACTERIZED` | Contact persistence |
| `CT-DELETE` | Contacts — delete | `CONTACT-REF-001` | `CHARACTERIZED` | `PENDING` | `CHARACTERIZED` | Contact persistence; `TP-CONTACT-LINK` deletion decision |
| `CT-EMAIL-LOOKUP` | Contacts — lookup by email | API inventory | `PENDING` | `PENDING` | `PENDING` | Privacy/authorization decisions |
| `CT-CREATE-USER` | Contacts — create user from contact | API inventory | `PENDING` | `PENDING` | `PENDING` | Dolibarr Users/Groups; identity mapping |
| `USR-ADMIN` | Dolibarr users — administration | API inventory | `PENDING` | `PENDING` | `PENDING` | Identity mapping; **not** Alixar auth users |
| `USR-GROUPS` | Dolibarr users — groups | API inventory | `PENDING` | `PENDING` | `PENDING` | **Not** Alixar roles |
| `USR-NOTIFICATIONS` | Dolibarr users — notifications | API inventory | `PENDING` | `PENDING` | `PENDING` | Notification channels |
| `DOC-LIFECYCLE` | Documents — list, upload, build, download, delete | API inventory | `PENDING` | `PENDING` | `PENDING` | Storage model; canonical object identity |
| `EMAIL-TEMPLATES` | Email templates — lifecycle | API inventory | `PENDING` | `PENDING` | `PENDING` | Template/i18n model |
| `OBJECT-LINKS` | Generic object links | API inventory | `PENDING` | `PENDING` | `PENDING` | Canonical object identity |
| `SETUP-DICTIONARIES` | Setup — dictionaries/reference data | API inventory | `PENDING` | `PENDING` | `PENDING` | Reference-data governance |
| `SETUP-EXTRAFIELDS` | Setup — extrafields | API inventory | `PENDING` | `PENDING` | `PENDING` | Canonical extension model |
| `SETUP-MODULES` | Setup — module management | API inventory | `PENDING` | `PENDING` | `PENDING` | Module system |
| `SETUP-COMPANY` | Setup — company/configuration/integrity | API inventory | `PENDING` | `PENDING` | `PENDING` | Configuration governance |
| `CATEGORIES` | Categories/classifications (contact, third party, supplier) | API inventory | `PENDING` | `PENDING` | `PENDING` | Category domain |
| `SUPPLIER-SIDE` | Supplier-side business beyond the third-party flag | Partial API evidence | `PENDING` | `PENDING` | `PENDING` | Supplier modules/domain |
| `SALES-CONTEXT` | Sales proposals/orders/invoices context | Indirect API evidence | `PENDING` | `PENDING` | `PENDING` | Sales/billing domain |

### 8.2 Implementation control

| ID | Alixar domain/app | Persistence | Canonical API | Authorization | Audit | Solucar | Data migration | Validation | Notes / gaps |
|----|-------------------|-------------|---------------|---------------|-------|---------|----------------|------------|--------------|
| `TP-BASIC` | `PARTIAL` | `DONE` | `PARTIAL` | `PARTIAL` | `PARTIAL` | `PENDING` | `PENDING` | `PARTIAL` | Aggregate: create/read implemented natively in `THIRDPARTY-002A`; list implemented in `THIRDPARTY-002B`; update/delete pending |
| `TP-CREATE` | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | `PENDING` | `PENDING` | `PARTIAL` | `POST /api/thirdparties`, `201` + `Location` + `{"id":...}`, `THIRD_PARTY_CREATED` audit; Solucar and data migration pending |
| `TP-READ` | `DONE` | `DONE` | `DONE` | `DONE` | `N/A` | `PENDING` | `PENDING` | `PARTIAL` | `GET /api/thirdparties/{id}` with full canonical representation; reads are not audited in the baseline |
| `TP-LIST` | `DONE` | `DONE` | `DONE` | `DONE` | `N/A` | `PENDING` | `PENDING` | `DONE` | `GET /api/thirdparties` with 0-based `page`/`size`, `id ASC`, exact boolean filters combined with `AND`, filtered `total`, and no read audit; Solucar and data migration pending |
| `TP-UPDATE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Contract decided: partial `PATCH`, unknown members rejected, no-op records no event; implementation pending (`THIRDPARTY-002C`) |
| `TP-DELETE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Contract decided: physical delete, `409 THIRD_PARTY_DELETE_CONFLICT` with linked Contacts; implementation pending (`THIRDPARTY-002D`) |
| `TP-CLASS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Decided as independent `customer` and `prospect` booleans; legacy `0/1/2/3` maps losslessly |
| `TP-SUPPLIER` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Decided as an independent `supplier` boolean, not a procurement module |
| `TP-STATUS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Decided as a single `active` boolean; legacy `status`/`statut` names are not exposed |
| `TP-FISCAL` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Basic `taxIdentifier` and `intraCommunityVatNumber` decided without format validation; advanced rules pending |
| `TP-FISCAL-ADVANCED` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | VIES, ES format/check digit, uniqueness, subjection and local taxes remain undecided |
| `TP-CONTACT-LINK` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Decided: optional `thirdPartyId`; linked Contacts block ThirdParty deletion with `409`; no cascade |
| `TP-ALIAS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `name_alias` observed but deferred from the first canonical contract |
| `TP-ADDRESS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Basic flat address/contact fields are part of `TP-BASIC`; structured addresses and geography pending |
| `TP-BANK` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered from legacy endpoints only |
| `TP-ACCOUNTS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered from legacy endpoints only |
| `TP-REPRESENTATIVES` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered from legacy endpoints only |
| `TP-COMMERCIAL` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Price levels/discounts discovered; product modules not enabled |
| `TP-FINANCIAL` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Outstanding sales endpoints discovered; no functional characterization |
| `TP-NOTIFICATIONS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered from legacy endpoints only |
| `TP-MERGE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Merge endpoint discovered; merge rules not characterized |
| `CT-CREATE` | `DONE` | `PENDING` | `DONE` | `PENDING` | `PENDING` | `DONE` | `PENDING` | `PARTIAL` | Canonical model/use case/adapter; 201 + ID; persistence remains Dolibarr-backed |
| `CT-READ` | `DONE` | `PENDING` | `DONE` | `PENDING` | `PENDING` | `DONE` | `PENDING` | `PARTIAL` | Canonical GET by ID via Dolibarr adapter; no native Flyway Contact table |
| `CT-LIST` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Legacy filters include `thirdparty_ids`, `category`, `sqlfilters`, pagination; canonical contract not defined |
| `CT-UPDATE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Legacy partial `PUT`; canonical update not defined |
| `CT-DELETE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Legacy physical delete; relationship deletion semantics pending |
| `CT-EMAIL-LOOKUP` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered endpoint; privacy/authorization not decided |
| `CT-CREATE-USER` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Legacy endpoint creates a Dolibarr user; identity mapping not decided |
| `USR-ADMIN` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Alixar authentication users are platform security, **not** migration coverage |
| `USR-GROUPS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Dolibarr groups are not Alixar roles; equivalence must not be assumed |
| `USR-NOTIFICATIONS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Discovered only |
| `DOC-LIFECYCLE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Inventory exposes list, upload, builddoc, download and delete |
| `EMAIL-TEMPLATES` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Inventory exposes CRUD by id and label |
| `OBJECT-LINKS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Generic relation; may be replaced by explicit domain relations |
| `SETUP-DICTIONARIES` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Countries, currencies, VAT, payment terms/types, shipping, legal forms and more |
| `SETUP-EXTRAFIELDS` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Canonical extension model not decided |
| `SETUP-MODULES` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Alixar is a modular monolith with no module-management parity |
| `SETUP-COMPANY` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Company, configuration, establishments and integrity endpoints discovered |
| `CATEGORIES` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Contact/third-party/supplier category endpoints; category module not enabled |
| `SUPPLIER-SIDE` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Only flag/supplier-category evidence; full supplier modules absent |
| `SALES-CONTEXT` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Only outstanding-document sub-endpoints; not a sales implementation |

---

## 9. ThirdParty coverage snapshot

`THIRDPARTY-REF-001` characterizes the basic Third Party lifecycle in the
Dolibarr 24.0.1 `baseline-ES` profile. The master registers that evidence, not a
copy of the 651-line characterization.

Registered as characterized:

- basic CRUD lifecycle;
- mandatory name and blank-name behavior;
- duplicate-name behavior;
- email behavior;
- ES fiscal identifiers as observed;
- `client` 0/1/2/3 semantics;
- supplier flag independent from `client`;
- active/inactive status;
- partial `PUT`;
- physical `DELETE`;
- Contact association;
- invalid Contact → ThirdParty reference;
- ThirdParty deletion behavior with a linked Contact;
- list pagination and defaults.

`THIRDPARTY-001` now records explicit canonical decisions for the basic
lifecycle in [ThirdParty](thirdparty.md). The decisions cover:

- Alixar-generated numeric identity, independent of the legacy identifier;
- required, trimmed, non-blank, non-unique name;
- independent `customer` and `prospect` booleans;
- independent `supplier` boolean;
- single `active` boolean;
- basic fiscal fields without format validation;
- flat basic address and contact fields;
- `201` create with `Location`, canonical read and list, `PATCH` partial update,
  and physical delete with a linked-Contact conflict;
- optional Contact → ThirdParty reference;
- strict rejection of unknown JSON body fields; standard Spring query-parameter
  binding without a global unknown-parameter rejection requirement;
- `thirdparties.read` and `thirdparties.manage` permissions;
- `THIRD_PARTY_CREATED` / `THIRD_PARTY_UPDATED` / `THIRD_PARTY_DELETED`
  audit events.

`THIRDPARTY-002A` implements native Alixar persistence, canonical create and
read, both permissions, and the atomic `THIRD_PARTY_CREATED` event.
`THIRDPARTY-002B` implements the canonical list with pagination, deterministic
`id ASC` ordering and exact boolean filters. Partial update and delete remain
pending. The aggregate state is therefore:

```text
ThirdParty = IN_PROGRESS
```

The `TP-BASIC` aggregate is `IN_PROGRESS` because `TP-CREATE`, `TP-READ` and
`TP-LIST` are implemented while `TP-UPDATE` and `TP-DELETE` remain pending, and
all implemented capabilities still lack the Solucar dimension and historical
data migration. `TP-FISCAL` evidence remains `PARTIAL` because
advanced fiscal/tax behavior was not characterized, and
`TP-FISCAL-ADVANCED`, `TP-ALIAS` and `TP-ADDRESS` remain pending.

Evidence: `dolibarr-reference: reference/characterization/THIRDPARTY-REF-001-thirdparty-lifecycle.md`.

---

## 10. Contact coverage snapshot

`CONTACT-REF-001` characterizes the basic legacy Contact lifecycle.

Alixar currently has:

- a canonical Contact domain model;
- `CreateContactUseCase` and `GetContactUseCase`;
- `GET /api/contacts/{id}`;
- `POST /api/contacts` (201 + ID);
- the canonical naming boundary (`lastName`, `firstName`, `thirdPartyId`);
- a Dolibarr anti-corruption adapter.

Solucar currently has a basic Contact UI that searches by ID and creates a
Contact.

However:

```text
Contact persistence is still Dolibarr-backed.
There is no Flyway migration for a native Contact table.
List, update and delete are not implemented.
Contact is public and has no canonical business permission.
Contact has no business audit instrumentation.
```

Therefore Contact is **not** `MIGRATED`. The aggregate state is:

```text
Contact = IN_PROGRESS
```

The Contact ↔ ThirdParty relationship is tracked separately as
`TP-CONTACT-LINK`; its migration decision is now `ADAPT`/`DECIDED`: the
reference is optional, linked Contacts block ThirdParty deletion with `409`, and
no cascade is reproduced. Native implementation remains pending and is the
input for `CONTACT-002`.

Evidence: `dolibarr-reference: reference/characterization/CONTACT-REF-001-contact-lifecycle.md`;
Alixar `docs/status.md` and `src/main/java/es/alxarafe/alixar/contact/`;
Solucar `src/app/features/contact/` and `src/app/core/api/contact-api.ts`.

---

## 11. Platform / Cross-cutting capabilities

These capabilities are part of Alixar but are not legacy Dolibarr business
inventory. They are **not** evidence that Dolibarr Users/Groups, authentication
or audit capabilities have been migrated. No Dolibarr equivalence is invented.

`State` summarizes the Alixar capability. Solucar is reported separately and does
not rewrite the Alixar state.

| Capability | Alixar | Solucar | Audit | Validation | State | Notes |
|------------|--------|---------|-------|------------|-------|-------|
| Session authentication | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | Login/logout, session fixation protection, CSRF, current-user bootstrap |
| Password recovery | `DONE` | `PENDING` | `DONE` | `DONE` | `DONE` | Forgot/reset, hashed single-use tokens, 30-minute expiry, SMTP/no-op notifier |
| Self-service credentials/profile | `PARTIAL` | `PENDING` | `DONE` | `DONE` | `PARTIAL` | Own username/password implemented; email change pending verification |
| PAT authentication | `DONE` | `N/A` | `DONE` | `DONE` | `DONE` | Opaque Bearer tokens, hash-only storage, expiry, revocation, credentials-version binding; no scopes |
| RBAC | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | Users → roles → permissions; no per-user overrides; next-request effect |
| User administration | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | List/detail/create disabled users, username, enabled state, password reset, role replacement; no delete, no email change |
| Role administration | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | Create/rename/permission replacement/delete; built-in immutable; role groups pending |
| Effective authorization context | `DONE` | `DONE` | `PARTIAL` | `DONE` | `DONE` | `/api/auth/me` roles/permissions; `ACCESS_DENIED` baseline; read auditing only USER/ROLE |
| Audit integrity | `DONE` | `N/A` | `DONE` | `DONE` | `DONE` | Append-only hash chain, verifier, concurrency tests; retention/archive/checkpoints pending |
| Audit configuration | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | `OFF`/`BASIC`/`SELECTIVE` persisted; `FULL` pending |
| Audit read policy | `DONE` | `DONE` | `DONE` | `DONE` | `DONE` | Persisted rules for `USER` and `ROLE`; `EACH_RETURNED_OBJECT` pending |
| Audit event viewer/API | `DONE` | `DONE` | `PARTIAL` | `DONE` | `DONE` | Keyset query, filters, verification; event detail/retention pending; audit reads not self-audited |

Exact exceptions are documented in [Authentication](authentication.md) and
[Audit](audit.md). This table does not extend their claims.

---

## 12. Data migration

Data migration is a separate dimension from implementation.

```text
Implementing a capability
!=
having migrated its historical Dolibarr data
```

States:

```text
PENDING
PARTIAL
DONE
N/A
```

Current position:

| Area | Data migration state |
|------|----------------------|
| ThirdParty historical data | `PENDING` |
| Contact historical data | `PENDING` |
| Contact ↔ ThirdParty historical relationships | `PENDING` |
| Discovered domains (documents, categories, dictionaries, etc.) | `PENDING` |
| Platform-native security data | `N/A` |

No ETL/import design is established here. Future data migration must address, at
minimum: legacy identity mapping, duplicate detection, third-party/contact
relationships, fiscal identifiers, document ownership, historical references and
the difference between active and inactive records.

---

## 13. Security and audit status

No business permission is invented in this document.

- `thirdparties.read` and `thirdparties.manage` are implemented, seeded and
  assigned to `system-admin`; `TP-CREATE` and `TP-READ` enforce them. Contact
  still has no canonical business permission.
- Contact is currently public and its POST is temporarily excluded from CSRF
  protection. That is **tracked debt**, not a target state. ThirdParty follows
  the normal CSRF rule: session mutations require a CSRF token, Bearer requests
  do not, and no exclusion is added for `/api/thirdparties/**`.
- The audit platform exists, but business instrumentation is only `DONE` when a
  concrete capability actually appends its events.
- ThirdParty creation audit is implemented: `THIRD_PARTY_CREATED` is appended
  atomically with the create transaction and records only the canonical
  identifier. `THIRD_PARTY_UPDATED` and `THIRD_PARTY_DELETED` remain decided but
  not implemented. ThirdParty reads are not part of the baseline and `SELECTIVE`
  read auditing for `THIRD_PARTY` is not implemented. Contact business audit
  instrumentation is `PENDING`.
- Do not mark a capability audited merely because the audit infrastructure
  exists.

See [Authentication](authentication.md) and [Audit](audit.md).

---

## 14. Solucar status

Only implemented UI is recorded.

| Capability | Solucar state |
|------------|---------------|
| Login, logout, forbidden view | `DONE` |
| Contact search by ID and create | `DONE` |
| Contact list, edit, delete | `PENDING` |
| ThirdParty UI | `PENDING` |
| User administration UI | `DONE` |
| Role administration UI | `DONE` |
| Audit event viewer and configuration UI | `DONE` |
| Password recovery and self-service profile UI | `PENDING` |

Solucar communicates only through the Alixar canonical API and is never the
domain authority.

---

## 15. Dependencies that affect migration order

Only dependencies that genuinely condition order are recorded.

| Capability | Depends on |
|------------|------------|
| Contact native persistence | Native ThirdParty relationship semantics (`TP-CONTACT-LINK`, decided) and the canonical Contact lifecycle decision (`CONTACT-002`) |
| ThirdParty canonical implementation | `THIRDPARTY-001` decisions (complete); create/read/list implemented, while the full lifecycle additionally needs native Contact persistence |
| Data migration for ThirdParty/Contact | Explicit legacy-to-canonical identity mapping and duplicate-resolution decisions |
| Categories/classifications | A canonical category domain |
| Documents | A storage model and canonical object identity |
| Object links | Canonical object identity; may be replaced by explicit domain relations |
| ThirdParty bank accounts | Bank/Cash domain |
| ThirdParty commercial conditions | Products/pricing domain |
| ThirdParty financial context and sales context | Sales/billing domain |
| Supplier-side business | Supplier modules/domain and supplier semantics |
| Dolibarr Users/Groups migration | An explicit identity-mapping decision between legacy users/groups and Alixar security users/roles |

---

## 16. Migration decisions

### 16.1 Closed by THIRDPARTY-001

These decisions are recorded in [ThirdParty](thirdparty.md):

| Decision | Canonical outcome |
|----------|-------------------|
| ThirdParty empty-list semantics | `200` with an empty collection |
| ThirdParty `id=0` specimen behavior | `DISCARD`; zero is an invalid identifier |
| Blank-name error semantics | `400 VALIDATION_REQUIRED` |
| Unknown JSON body-field handling | Rejected with `400 VALIDATION_INVALID` |
| Unknown query-parameter handling | Not a canonical rejection requirement; standard Spring binding; closed-list validation where natural |
| ThirdParty deletion with linked Contacts | `409 THIRD_PARTY_DELETE_CONFLICT`; unlink or reassign first |
| Customer/prospect representation | Independent `customer` and `prospect` booleans |
| Supplier semantics | Independent `supplier` boolean |
| Active state | Single `active` boolean |
| Contact → ThirdParty deletion semantics | No cascade; linked Contacts block deletion |
| ThirdParty authorization model | `thirdparties.read` and `thirdparties.manage` (implemented and seeded in `THIRDPARTY-002A`) |
| ThirdParty mutation audit | `THIRD_PARTY_CREATED` implemented in `THIRDPARTY-002A`; `THIRD_PARTY_UPDATED` / `THIRD_PARTY_DELETED` still pending |

### 16.2 Still open

| Decision | Why it matters |
|----------|----------------|
| Contact list/update/delete lifecycle | Only create and read are implemented canonically; `CONTACT-002` must close it |
| Contact authorization and audit | Contact is still public and has no canonical business permission or audit instrumentation |
| ThirdParty advanced fiscal/tax rules | VIES, ES format/check digit, uniqueness and subjection rules are not characterized |
| ThirdParty commercial alias | `name_alias` is observed but deferred |
| ThirdParty structured addresses and geography | Address semantics, states and country catalogue are pending |
| ThirdParty data migration | Canonical identity mapping, duplicate handling and fiscal-data preservation remain to be designed |
| ThirdParty merge/deduplication | Merge rules are not characterized |
| Remaining ThirdParty sub-resources | Bank accounts, categories, representatives, discounts, notifications, documents and financial context remain discovered only |

---

## 17. Maintenance rule

Every future task that:

```text
characterizes legacy behavior
decides migration semantics
implements Alixar behavior
implements Solucar behavior
implements data migration
```

must review its impact on this document and update it when a capability state
changes.

Do not require an update when coverage does not actually change. Do not modify
this document merely to record that a review happened.

When a new capability is discovered, add it with `PENDING` evidence unless it is
immediately characterized. When a capability is discarded, keep the row and
record the decision and reason. Never delete rows to simplify the master.

---

## 18. Traceability

Cross-repository references are repository-qualified paths because the documents
live in separate repositories.

| Area | Legacy evidence | Alixar source/documentation | Solucar source/documentation |
|------|-----------------|-----------------------------|------------------------------|
| ThirdParty | `dolibarr-reference: reference/characterization/THIRDPARTY-REF-001-thirdparty-lifecycle.md` | [ThirdParty](thirdparty.md); `docs/status.md` | None yet |
| Contact | `dolibarr-reference: reference/characterization/CONTACT-REF-001-contact-lifecycle.md` | `docs/status.md`; `src/main/java/es/alxarafe/alixar/contact/` | `src/app/features/contact/`; `src/app/core/api/contact-api.ts`; `docs/status.md` |
| Contact ↔ ThirdParty | `THIRDPARTY-REF-001`; `CONTACT-REF-001` | [ThirdParty](thirdparty.md); `DolibarrContactAdapter`; `InvalidThirdPartyReferenceException`; `Contact.thirdPartyId` | `CreateContactRequest.thirdPartyId`; Contact create form |
| Platform security | No Dolibarr business equivalence claimed | `docs/authentication.md`; `src/main/java/es/alxarafe/alixar/authentication/` | `docs/architecture.md`; `src/app/core/auth/`; admin features |
| Audit | No Dolibarr business equivalence claimed | `docs/audit.md`; `src/main/java/es/alxarafe/alixar/audit/` | `src/app/features/admin-audit/`; `src/app/core/api/admin-audit-api.ts` |
| Discovered domains | `dolibarr-reference: reference/baseline/api-inventory.tsv`; `reference/baseline/technical-reference.json` | None yet | None |

---

## 19. Initial state summary

```text
Contact      = IN_PROGRESS
ThirdParty   = IN_PROGRESS
Other discovered ERP business = PENDING
Platform foundation = largely DONE, with the exceptions in section 11
No legacy business capability = MIGRATED
```

The ThirdParty aggregate refers to the basic lifecycle. Create, read and list
are implemented natively, while partial update and delete remain pending;
`TP-FISCAL` evidence remains `PARTIAL`, and advanced fiscal, alias, structured
address/geography and data migration remain pending.

No arbitrary percentages are used. Progress is expressed only through the
controlled states and the dimensions in section 8.

The next ThirdParty implementation gates are `THIRDPARTY-002C` / `002D` for
update and delete. The next Contact decision gate is `CONTACT-002`,
which must close the Contact list/update/delete lifecycle, native persistence and
the restrictive ThirdParty relationship.

---

## 20. Related documentation

- [Current implementation status](status.md)
- [ThirdParty](thirdparty.md)
- [Architecture](architecture.md)
- [Authentication](authentication.md)
- [Audit](audit.md)
- [Development](development.md)
