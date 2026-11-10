# ALIXAR-COM-001 — Proposal to order technical design

Status: **Partially approved — COM-01 functional and technical contract closed**.
Updated: 2026-11-10. Sections 3.4/12.3 record explicit human approval. Other
operations remain Proposed/Pending. This documentary task does not authorize implementation.

## 1. Scope, acceptance and evidence vocabulary

The authorized outcome is one reviewable design for proposal → customer order:
aggregate boundaries, states, conversion, persistence, canonical HTTP contracts,
security, audit, transaction boundaries and small implementation slices. Acceptance
requires explicit treatment of D1–D8, evidence traceability,
valid links and a clean whitespace check. No application code, migration, endpoint,
Flowable process, AFS or BPMN modification belongs to this task. Collections,
shipping, invoicing, stock, online signature and further reference investigations
are excluded.

- **Demonstrated**: an observation recorded by the reference fixtures, or a fact
  directly inspected in Alixar source; not a newly executed verification here.
- **Inference**: an interpretation with its limits stated.
- **Proposed**: an Alixar design recommendation, not approved behavior.
- **Pending**: a decision or evidence gap requiring resolution.
- **Approved**: existing architecture decisions, the explicit COM-01 functional
  and technical decisions in sections 3.4/12.3, and the user's authorization of
  this documentary task.
- **Antecedent / Discarded**: historical context / rejected historical inference.

Future behavior is **Proposed** except for the scoped COM-01 approvals in section
3.4 and the explicit technical closure in section 12.3. Existing legacy behavior
is never adopted merely because demonstrated.

## 2. Sources and current architecture

| ID | Source | Authority and limits |
|---|---|---|
| S1 | [AFS-PROC-002](../functional/AFS-PROC-002-proposal-to-order.md) v0.2.0 | Draft AS-IS specification; UC-001–004, ENT-001–005, RULE-001–018 and TEST-001–015; normative only for scoped legacy conformance |
| S2 | [Manual BPMN](../processes/PROC-SLS-001-ASIS-MANUAL.bpmn) | AS-IS selection, empty submission, cancel, draft creation and separate validation; creation errors omitted |
| S3 | [Automatic BPMN](../processes/PROC-SLS-001-ASIS-AUTOMATIC.bpmn) | AS-IS acceptance, option, existing-link guard, creation and validation outcome; rollback/concurrency omitted |
| S4 | [Initial characterization](https://github.com/alxarafe/dolibarr-reference/blob/cfebe9380398204fd5839894ad11c2de6ec6c946/reference/characterization/PROPAL-ORDER-REF-001-proposal-to-order.md) | Historical runtime record; initial permission/manual-path interpretations corrected by S5 |
| S5 | [Independent audit follow-up](https://github.com/alxarafe/dolibarr-reference/blob/cfebe9380398204fd5839894ad11c2de6ec6c946/reference/characterization/PROPAL-ORDER-REF-001-audit-follow-up.md) | Newer controlled HTTP UI/basic non-admin results; Dolibarr 24.0.1 source b7958385f00a92219f76a4dfea67dae93df97a25; commercial-ES |
| S6 | [Architecture](../architecture.md), [authentication](../authentication.md), [audit](../audit.md) | Existing decisions and runtime boundaries |
| S7 | [Contact transactional service](../../src/main/java/es/alxarafe/alixar/contact/infrastructure/TransactionalContactService.java), [contact schema](../../src/main/resources/db/migration/V12__create_contact.sql), [AuditTrail](../../src/main/java/es/alxarafe/alixar/audit/application/AuditTrail.java) | Inspected implementation patterns |
| S8 | [Workflow spike](../workflow-spike.md) | Test-only Flowable evaluation; no approved production engine |
| S9 | [Authentication V1](../../src/main/resources/db/migration/V1__create_authentication_user.sql), [ThirdParty V11](../../src/main/resources/db/migration/V11__create_third_party_and_authorization.sql), [ThirdParty domain](../../src/main/java/es/alxarafe/alixar/thirdparty/domain/ThirdParty.java) | `authentication_user.id` is UUID; ThirdParty has independent `customer`, `prospect`, `supplier` and `active` booleans |

Alixar source baseline: `730a7fc398610502f85040325cbfbf5b1e85d2a0`.
S4/S5 were read from the sibling checkout at the pinned link revision; their
reported runtime results were not rerun for this design.

**Demonstrated, legacy:** S5 observes manual selected-line drafts, zero-line drafts,
cancel without writes, automatic full-line drafts, successful later/immediate
validation and restricted immediate validation leaving a draft despite successful
acceptance. Automatic creation succeeds without order-creation permission in that
basic fixture. An existing link prevents another automatic order sequentially.
Neither maximum cardinality nor concurrent safety nor injected-failure rollback
is established. Fidelity covers the described service lines without discounts,
local taxes, products or foreign currency. Acceptance also changes the customer
flag in the fixture; this is not an Alixar requirement.

**Discarded antecedent:** automatic conversion has an order-creation permission
gate in Dolibarr. S5 supersedes that inference. Full online signature and advanced
permissions remain unverified.

**Demonstrated, Alixar:** native ThirdParty/Contact persistence, session+CSRF and
opaque Bearer authentication, role-only RBAC, policy-controlled atomic mutation
audit and localized ProblemDetail errors exist. No native sales aggregate exists.
S6 records PostgreSQL 18.6, Flyway, jOOQ, modular monolith and isolated domain as
approved. S7 places transactions in infrastructure. The audit API records action,
resource and canonical identifier, without arbitrary business payload detail.

**Inference:** these mechanisms support a native sales slice without a workflow
engine or legacy runtime dependency. Concrete application use cases and persistence
ports should emerge per slice; no generic workflow/event bus or package symmetry
is needed. Domain owns transitions and eligibility; application orchestrates;
HTTP, authorization integration, transactions and jOOQ remain adapters. Solucar
consumes the canonical API and owns no commercial rule.

## 3. Decision register and authorization boundary

**Antecedent — initial documentary preparation authorization:** prepare the branch
from updated main, update this design and validate documentation; commit and
publication were not authorized at that stage.

**Approved — subsequent commit and publication authorization:** after review and
final documentary corrections, create the documentary commit, push the branch,
open a PR against main and inspect CI. These operations were executed in commit
`99b33b5` and [PR #36](https://github.com/alxarafe/alixar/pull/36).

**Not authorized:** COM-01 implementation, application code, migrations, local
Docker or functional tests, PR merge, tags or deployment.

COM-01 functional and technical approval is recorded
in sections 3.4/12.3; D1/D5/D6/D8 are partially approved only to that extent.
D2/D3/D4/D7 and all other-operation decisions remain Pending. Existing architecture
approvals in S6 are separate from this approval.

| Decision | Proposed recommendation | Actual authorization / remaining gate |
|---|---|---|
| D1 — empty drafts | Permit zero-line independently created proposal/order drafts. Reject empty conversion and validation. Standalone order creation API is outside these slices. | Approved only for independent COM-01 proposal drafts; order creation, conversion and validation remain Pending. |
| D2 — authority | Every automated operation requires the initiating authenticated user's explicit operation permission: acceptance `proposals.accept`, creation `orders.create`, validation `orders.validate`; automated source access also requires `proposals.read`. Policy configuration grants no execution authority. | Pending; approve permission catalogue, role assignments and minimal result disclosure. No implicit SYSTEM actor or delegated privilege. |
| D3 — acceptance | Commercial acceptance commits independently of automatic creation/validation. Creation failure retains acceptance; validation failure retains acceptance and draft order. | Pending; approve durable intent/outcome, recovery and API semantics below before COM-08. Atomic all-or-nothing acceptance is an unselected alternative. |
| D4 — cardinality | Proposal → zero to many orders; each order has zero or one source. Initial conversion selects complete lines at full quantity; a source line may appear in at most one order globally. | Pending; approve whole-line consumption, version/retry semantics and remaining-line automation. Single-order and split-quantity alternatives are unselected, not current defaults. |
| D5 — lifecycle | Proposal DRAFT → VALIDATED → ACCEPTED or REFUSED; order DRAFT → VALIDATED. Freeze commercial contents at validation. | Approved only for COM-01 creation in DRAFT. Every transition and other operation remains Pending. |
| D6 — money | Free-description service lines, deterministic BigDecimal arithmetic, EUR only; exact precision, rounding and limits in section 6. | COM-01 EUR, deterministic BigDecimal, required description, positive quantity and nonnegative price Approved. Exact numeric policy, centralized immutable monetary policy and limits in section 6.1 are Approved for COM-01; numbering and other operations remain Pending. |
| D7 — automation | Server-owned versioned policy; creation and immediate validation initially false. Immediate validation implies automatic creation. | Pending; enabling requires a separately authorized configuration operation and implemented capability. No caller-supplied automation flags. |
| D8 — ThirdParty/audit | Reuse native ThirdParty, RBAC and AuditTrail; never reclassify/activate automatically. Retain OFF/BASIC/SELECTIVE semantics. | COM-01 active existing customer or prospect and existing security/audit reuse Approved; COM-01 grants and create audit in sections 8/12.3 Approved; later-operation grants, events and eligibility remain Pending. |

### 3.1 Acceptance and automation are separate commitments

Proposed acceptance transaction records ACCEPTED and its required success audit.
When policy requests automation, it also records durable intent with attempt ID,
proposal ID, initiating user UUID, policy version/flags and acceptance source
version. Missing creation/validation authority does not erase acceptance: record
a blocked stage without performing it. Acceptance itself still requires its own
permission and D8 eligibility. Policy is read coherently under a shared lock.

After commit, creation runs in a separate transaction, atomically writing order,
lines, provenance, attempt's order ID/outcome and required success audit. Validation
uses another transaction and its own permission/eligibility check. A validation
failure leaves the committed draft. No success event survives its transaction's
rollback. Business failure outcomes belong to durable attempt data, not invented
AuditTrail success events or best-effort logs.

Proposed stages: CREATION, VALIDATION; outcomes: PENDING, SUCCEEDED, BLOCKED,
FAILED. Persist a unique `(proposal_id, acceptance_version)` intent and at most one
order per attempt (nullable unique `attempt_id` on origin). This uniqueness is
about an attempt, never about the proposal. Commit successful creation and its
attempt pointer together so recovery cannot create a second order after a crash.
An unfinished intent remains discoverable if outcome recording fails.

COM-08 must obtain approval for attempt read/recovery API, failure codes, ownership,
permission rechecks, interrupted-attempt claiming and transaction boundaries before
implementation. Recovery must never impersonate a user or use a stored actor UUID
as authority; proposed initial recovery is an explicit authenticated command with
current permissions, preserving initiator and recovery actor separately. No daemon,
automatic retry, service delegation, process engine or asynchronous delivery is
approved. This is a concrete design gate, not exception-catching inside acceptance.

### 3.2 Whole-line allocation and replay

Manual conversion selects nonempty unique `sourceLineIds`, at full original
quantities. Unselected lines remain available for later orders. Committed draft
orders consume their lines immediately; validation is not the consumption point.
There is no release/reuse operation, even for an unvalidated draft. Failed creation
consumes nothing. Quantity splitting and allocation ledgers are deferred.

Automatic creation proposes all currently unconsumed lines, in source order. It
uses the same operation and integrity guard as manual conversion. If none remain,
record a blocked/no-eligible-lines outcome without an empty order. An automatic
attempt checks the acceptance source version; intervening manual conversion yields
a version conflict and requires explicit recovery using a fresh version. Recovery
may select the remaining complete lines only after renewed authorization; it does
not silently repeat acceptance or create another automatic intent.

Every committed conversion advances proposal version, even though commercial
contents are frozen. A retry with the original expectedVersion gets 409, including
after a lost response. GET reveals `orderIds` and each line's `convertedOrderId`.
There is no successful replay-response guarantee or durable Idempotency-Key store.
Two disjoint commands with the same version cannot both succeed: reread and submit
a new explicit command. No global already-converted-proposal guard remains.

### 3.3 ThirdParty eligibility still requires a human choice

S9 has independent customer, prospect, supplier and active flags. Approved COM-01
creation rule: existing AND active AND (customer OR prospect). Supplier status is
independent and neither qualifies alone nor disqualifies a customer/prospect.
Inactive records are not eligible for creation. Later-operation alternatives:
existence only at later boundaries, or active customer at conversion and validation.
Decide separately whether acceptance requires active customer and whether later
deactivation blocks validation. FK existence does not decide eligibility. No path
changes any classification flag. Stronger eligibility uses a ThirdParty shared
lock and recheck at the approved boundary, including concurrent deactivation tests.

### 3.4 Explicitly approved decisions — COM-01 only

Approval source: the human instruction to register partial COM-01 approval in this
document, dated 2026-11-09, followed by explicit technical closure on 2026-11-10
(sections 6.1/12.3). Neither approval permits implementation on this documentary
branch or approves the rest of D1–D8.

| ID | Approved COM-01 decision | Scope boundary |
|---|---|---|
| COM-01-A1 | Independently created proposal drafts may have zero lines. | No approval for empty conversion, validation or standalone orders. |
| COM-01-A2 | ThirdParty must exist, be active, and be customer or prospect: `active && (customer || prospect)`. | Check at creation; no automatic classification changes. Recommended read semantics: later flag changes do not rewrite the proposal or prevent authorized GET. Other-operation eligibility remains Pending. |
| COM-01-A3 | Currency EUR; deterministic BigDecimal calculation with explicit precision and rounding. | Section 6.1 records the approved exact scales, HALF_UP line rounding, sum of rounded amounts and centralized immutable monetary policy; no per-ThirdParty configuration. |
| COM-01-A4 | Each supplied line requires a description, positive quantity and nonnegative unit price. | Zero-line drafts remain valid. Required VAT, limits, normalization and centralized limit constants in section 6.1 are Approved for COM-01. |
| COM-01-A5 | POST `/api/proposals` and GET `/api/proposals/{id}`. | Existing POST/GET representations and ProblemDetail contract in sections 7/12.1 are Approved for COM-01. No list, modification, state transition, acceptance, conversion or order API approved. |
| COM-01-A6 | Permissions `proposals.manage` for creation and `proposals.read` for consultation. | Reuse RBAC, authentication and CSRF. Initial assignment to system-admin only is Approved; internal eligibility lookup requires no thirdparties.read permission. |
| COM-01-A7 | Reuse existing audit infrastructure and policies. | PROPOSAL_CREATED / PROPOSAL via AuditTrail, OFF/BASIC/SELECTIVE and atomicity are Approved; no baseline GET success audit or new audit subsystem. |
| COM-01-A8 | Creation only in DRAFT. | No other state can be supplied by callers; no transition approved. |

The prior existence-only draft recommendation is superseded for COM-01 by A2.
Section 12.3 records technical closure; only separate implementation authorization
remains for COM-01. Do not request approval again for the closed contract. Approval
does not extend to conversion cardinality or automation.

## 4. Aggregates, lifecycle and invariants

Proposal owns identity, ThirdParty ID, EUR currency, state, positive version,
ordered lines and timestamps. Lines own stable ID, position, description, quantity,
unit net price, VAT and net/tax/gross snapshots. CustomerOrder owns equivalent
commercial snapshots, optional reference and its own state/version. Provenance
is immutable origin metadata: proposal, order, source version, mode, actor UUID
and time. It is not a generic link aggregate or live pricing reference.

| Operation | Preconditions / effect |
|---|---|
| Independent proposal creation | Existing active customer or prospect (COM-01 approved); well-formed zero or more lines; DRAFT; approved initial version 1 |
| Draft replacement | DRAFT, matching version; replace whole contents and allocate new line IDs |
| Proposal validation | DRAFT, matching version, nonempty consistent lines; VALIDATED and freeze commercial contents |
| Acceptance / refusal | VALIDATED, matching version and permission; ACCEPTED / REFUSED; no direct order-state transition |
| Conversion | ACCEPTED, matching version, permitted nonempty unused full lines; new DRAFT order and source version increment |
| Order validation | DRAFT, matching version, nonempty consistent contents and eligibility; VALIDATED and unique reference |

I1: each line belongs to exactly one root; mutations advance root version.
I2: validated commercial contents are immutable; terminal proposal state does not
prevent version changes for allocations. I3: converted customer/currency match
source; snapshots copy full original quantities and amounts. I4: unknown, foreign,
duplicate or consumed line IDs reject the entire conversion. I5: no empty conversion
or validation. I6: creation, lines, provenance, attempt pointer if any, version and
required audit are one transaction. I7: multiple orders per proposal are allowed,
but each source line is consumed at most once. I8: client cannot set totals, IDs,
state, actor, reference, provenance or automation mode. No standalone order endpoint,
order editing, physical deletion, cancellation or line release is included.

## 5. Transactions and concurrency

Proposed READ COMMITTED adapter locks proposal `FOR UPDATE`, then compares
expectedVersion, accepted state and selected-line availability. It creates target
and provenance and increments source version atomically. Root locking serializes
manual/manual and manual/automatic conversion; a global source-line unique
constraint is the independent database guard against concurrent duplicate use.
Handle constraint violations only after rollback; never continue an aborted
transaction. Lock/deadlock timeouts roll back that stage and return retryable
unavailability; they cannot undo already committed acceptance.

Lock order: policy → ThirdParty → proposal → attempt → order → lines (ascending
IDs) → audit chain. Skip unused ranks, acquire same-rank roots by ID, never acquire
an earlier rank later or upgrade a lock after lower ranks. Policy reads use FOR
SHARE, updates FOR UPDATE; optional eligibility checks use ThirdParty FOR SHARE.
Resolve immutable identifiers before locking and recheck after locks. Standalone
order validation locks ThirdParty then order and never locks source. Attempt
creation/recovery locks source before attempt; successful order-stage updates keep
this order. Audit is last; deferred checks acquire no business locks. Exact recovery
claim behavior remains a COM-08 approval gate.

Acceptance with automation off writes acceptance/audit only. With automation on it
adds durable intent, commits, then invokes separately authorized stages. Manual
conversion never reads policy or invokes immediate validation. Policy update locks
only policy then audit. No external HTTP call participates in these transactions.
These are proposed protocols, not executed concurrency evidence. Technical basis:
[PostgreSQL row locking](https://www.postgresql.org/docs/18/explicit-locking.html).

## 6. Proposed schema, constraints and indexes — no migrations

Existing Flyway-owned public schema and jOOQ adapters are reused. No migration
number is reserved; each slice introduces only its needed persistence. COM-01
proposal persistence must also retain the applied immutable monetary policy
identification alongside historical line amounts (section 6.1); its concrete
storage representation is not prescribed by this documentary closure.

| Table | Proposed columns / constraints |
|---|---|
| `sales_proposal` | bigint identity PK; nonnull bigint ThirdParty restrictive FK; currency restricted to EUR; allowed proposal state; positive bigint version; nonnull created/updated timestamptz; nullable validation/acceptance/refusal timestamps consistent with state |
| `sales_proposal_line` | bigint identity PK; nonnull restrictive proposal FK; positive integer position; nonblank description; nonnull numeric snapshots below; UNIQUE `(proposal_id, position)` and `(proposal_id, id)` |
| `customer_order` | bigint identity PK; nonnull restrictive ThirdParty FK, EUR, order state, positive version and timestamps; nullable unique nonblank reference, required with validation timestamp in VALIDATED; no mandatory source FK |
| `proposal_order_origin` | `order_id` PK restrictive order FK; nonnull `proposal_id` restrictive proposal FK; positive source_version; mode MANUAL/AUTOMATIC; initiating_user_id UUID restrictive FK to authentication_user(id); created_at; UNIQUE `(order_id, proposal_id)`; **nonunique** index `(proposal_id, order_id)`; later nullable UNIQUE attempt_id restrictive FK |
| `customer_order_line` | bigint identity PK; nonnull restrictive order FK independent of origin; nullable source_proposal_id/source_line_id, both null or both nonnull; snapshots, positive position; UNIQUE `(order_id, position)`; **global UNIQUE `(source_proposal_id, source_line_id)`**; composite restrictive FK `(order_id, source_proposal_id)` to origin MATCH SIMPLE; composite restrictive FK `(source_proposal_id, source_line_id)` to proposal line MATCH FULL |
| `sales_conversion_policy` | singleton fixed key; nonnull booleans automatic_creation/immediate_validation default false; positive version; CHECK immediate implies automatic |
| `sales_conversion_attempt` (COM-08 only) | identity PK; restrictive proposal FK; initiating user UUID FK; positive acceptance/source/policy versions; policy flags; stage/outcome checks and timestamps; UNIQUE `(proposal_id, acceptance_version)`; detailed recovery fields require approval before migration |

There must be **no UNIQUE on origin.proposal_id alone**, no unique source-proposal
index elsewhere, and no repository/API singular-order assumption. Origin PK limits
one source per order, not one order per proposal. `(order_id, proposal_id)` unique
exists to support the composite FK and permits repeated proposal IDs.

The global source pair unique prevents the same line in different orders, including
two concurrent transactions that both previously observed it unused. A per-order
unique `(order_id, source_line_id)` would not provide this guarantee and is omitted.
Default NULL-distinct uniqueness permits multiple independent unsourced lines.
Composite FKs prevent foreign proposal lines and mismatched order origins; their
referenced keys exist explicitly. See [PostgreSQL constraints](https://www.postgresql.org/docs/18/ddl-constraints.html).

Proposed deferred constraint triggers on origin and order-line INSERT/UPDATE/DELETE
inspect affected old/new orders at commit: sourced orders must have nonempty lines,
all with matching nonnull source IDs; independent orders have only unsourced lines
and may be empty while draft. This closes the null-source bypass allowed by MATCH
SIMPLE. Writers already hold order root locks. The trigger does not replace global
uniqueness and must not acquire business locks after audit. Origin and consumed
source associations cannot be changed/deleted by supported operations; validated
snapshot immutability, full-quantity copying and cross-table customer/currency
equality are application invariants verified under locks, not falsely claimed as
row CHECK guarantees. No release API exists. Direct privileged SQL mutation is
outside the application contract. Trigger feasibility requires real integration
tests; see [constraint triggers](https://www.postgresql.org/docs/18/sql-createtrigger.html).

PK/unique indexes are reused. Proposal/order `(third_party_id, id)` support customer
FK lookup; line position uniques cover parent lookup; global source pair unique
also covers source-line reverse FK checks. Origin `(proposal_id, order_id)` covers
multi-order navigation and proposal FK; add origin `(initiating_user_id)` for actor
FK checks. Attempt unique covers proposal lookup; add actor FK index when introduced.
No duplicate source-line index, status-only or speculative search index is proposed.

### 6.1 Deterministic money and limits (D6)

Use [Java 25 BigDecimal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/math/BigDecimal.html)
from exact decimal input, never binary floating point. Approved for COM-01: quantity
numeric(19,6) > 0; unit price numeric(19,6) >= 0; VAT numeric(7,4) in [0,100];
amounts numeric(19,2) >= 0, gross = net + tax. Net = quantity × price rounded
to 2 decimals HALF_UP; tax = rounded net × VAT / 100 rounded to 2 decimals HALF_UP;
gross = net + tax. Totals are exact sums of rounded line snapshots, not independent
editable header columns. Check line and aggregate totals fit numeric(19,2).
Reject excess input scale, overflow and out-of-range values before persistence,
without implicit database rounding. Currency is required and exactly EUR.

Approved COM-01 maximum: 1,000 lines; description required, trimmed/nonblank and at
most 2,000 Unicode code points after trimming; no silent truncation. Empty draft totals are
0.00. Free descriptions only; no catalogue, discounts, negative lines or local
taxes. Proposed order reference: SO- plus dedicated sequence value at validation,
unique, never reused, gaps allowed. Proposal ID is its initial identity; no public
proposal numbering scheme. Order numbering and monetary rules for other operations
remain Proposed/Pending; COM-01 approval does not extend to them.

Approved COM-01 source of truth: centralize the line-count and description-length
limits as narrowly scoped named constants, reused by input validation and
validations of the COM-01 contract. Centralize precision, scale, currency and rounding in one immutable
monetary policy; do not scatter these values or make the policy mutable runtime
configuration. Persist calculated historical amounts and the identification of the
policy applied to each proposal so later policy changes cannot recalculate history.
The applied policy identifier must be stable, versioned and unambiguous about its
calculation rules. A generic identifier whose meaning can change is not valid;
changed calculation rules require a distinct versioned identifier while historical
identifiers retain their original meaning. This introduces no new configuration
tables and does not extend the API.
The design must allow future policy selection according to ThirdParty, but COM-01
creates no per-ThirdParty configuration, selector infrastructure or configuration
API. Its concrete future selection rules remain Pending. Monetary policy is
separate from the Proposed sales-conversion automation policy (D7).

## 7. Canonical HTTP contract — COM-01 approved, later operations Proposed

Only COM-01 POST/GET and their existing representations/errors below are Approved;
all other operations and their errors remain Proposed/Pending.

JSON application/json; errors application/problem+json with existing ProblemDetail
shape and module-owned sales.* MessageSource/Jakarta Validation text. Stable codes,
paths, permissions and field names remain untranslated and need scoped sources of
truth. Authorization precedes lookup/disclosure; session CSRF and Bearer parity reuse
existing security. Unknown/protected fields and malformed values reject.

| Operation | Input | Success / permission |
|---|---|---|
| POST `/api/proposals` | `{thirdPartyId,currency,lines:[{description,quantity,unitNetPrice,vatRate}]}` | 201 `{id}`, Location `/api/proposals/{id}`; proposals.manage |
| GET `/api/proposals/{id}` | positive bigint ID | 200 proposal; proposals.read |
| PUT `/api/proposals/{id}/draft` | expectedVersion plus complete creation fields | 200 proposal; proposals.manage |
| POST `/api/proposals/{id}/validation` | `{expectedVersion}` | 200 proposal; proposals.validate |
| POST `/api/proposals/{id}/acceptance` | `{expectedVersion}` | 200 acceptance representation; proposals.accept |
| POST `/api/proposals/{id}/refusal` | `{expectedVersion}` | 200 proposal; proposals.accept |
| POST `/api/proposals/{id}/order-conversions` | `{expectedVersion,sourceLineIds:[...]}` | 201 `{orderId,state:"DRAFT",sourceProposalId}`, order Location; proposals.read + orders.create |
| GET `/api/orders/{id}` | positive bigint ID | 200 order; orders.read |
| POST `/api/orders/{id}/validation` | `{expectedVersion}` | 200 order; orders.validate |
| GET/PUT `/api/admin/sales-conversion-policy` | PUT expectedVersion and two booleans | 200 policy; sales.configure |

Proposal: `{id,thirdPartyId,currency,state,version,lines,totals,orderIds,createdAt,updatedAt}`.
Each line: `{id,position,description,quantity,unitNetPrice,vatRate,netAmount,taxAmount,
grossAmount,convertedOrderId}`. Order IDs are sorted ascending; no singular proposal
orderId. Unconsumed line convertedOrderId is null. COM-01 returns empty orderIds
and null line links without introducing order tables. Totals: netAmount, taxAmount,
grossAmount. Decimal JSON numbers remain exact; timestamps are UTC ISO-8601 instants.
Order adds nullable draft reference and optional sourceProposalId/sourceVersion/
conversionMode; sourced lines include sourceLineId. Independent orders have null
source metadata. Proposal read discloses linked IDs only; detail needs orders.read.

Acceptance with automation off returns `{proposal,automation:null}`. With automation
on, proposed automation representation includes attemptId, stage, outcome, optional
orderId and stable failureCode; GET must expose discoverable incomplete outcomes.
The exact read/recovery endpoint is a COM-08 gate. Once acceptance commits, later
automation failure must never be reported as acceptance rollback. Distinguish stage
outcome from HTTP transport failure; lost responses require reading durable state.

| HTTP | Proposed stable code / situation |
|---|---|
| 400 | Existing VALIDATION_REQUIRED / VALIDATION_INVALID; required fields, bad IDs/types/scale/limits/duplicate selection |
| 401/403 | Existing authentication/permission/CSRF behavior |
| 404 | PROPOSAL_NOT_FOUND / ORDER_NOT_FOUND |
| 409 | SALES_VERSION_CONFLICT, PROPOSAL_INVALID_STATE, ORDER_INVALID_STATE, PROPOSAL_LINE_ALREADY_CONVERTED |
| 422 | SALES_INVALID_THIRD_PARTY, SALES_UNSUPPORTED_CURRENCY, SALES_EMPTY_DOCUMENT, PROPOSAL_EMPTY_SELECTION, PROPOSAL_LINE_NOT_ELIGIBLE, ORDER_VALIDATION_FAILED |
| 503 | Existing AUDIT_UNAVAILABLE; proposed SALES_TEMPORARILY_UNAVAILABLE for transient database/locking failure |

No PROPOSAL_ALREADY_CONVERTED error: an accepted proposal may legitimately create
another order from different lines. Standalone conversion errors leave no new order;
post-acceptance failures belong to the relevant attempt stage. Do not expose SQL or
constraint names. Collections/search and generic state mutation APIs remain deferred.

## 8. Security and audit reuse

Approved COM-01 permissions: proposals.read/manage. Proposed later permissions:
proposals.validate/accept, orders.read/create/validate and sales.configure.
They are permission codes, never role-name branches.
Approved COM-01 seeds: proposals.read/manage assigned initially to system-admin
only, with no other role changes. Internal ThirdParty eligibility lookup requires
only proposals.manage, without thirdparties.read or thirdparties.manage, and
discloses no ThirdParty details. Later catalogue seeds and role assignments remain
Pending and require explicit approval per slice.

Reuse AuditTrail, SESSION/API_TOKEN actor attribution and UUID authentication IDs.
Approved COM-01 event/resource: PROPOSAL_CREATED / PROPOSAL, result SUCCESS, via
AuditTrail.recordSuccess in the creation transaction, preserving OFF.
Proposed later events: PROPOSAL_UPDATED/VALIDATED/ACCEPTED/REFUSED, ORDER_CREATED,
PROPOSAL_ORDER_LINKED, ORDER_VALIDATED, SALES_CONVERSION_POLICY_UPDATED, with
PROPOSAL/ORDER/SALES_CONVERSION_POLICY resources. Linking uses order resource ID.
Required events share their mutation transaction and fail closed under BASIC and
SELECTIVE; OFF stays OFF. No commercial object payload or new synthetic SYSTEM
actor. Reads have no baseline sales audit; authorization denials reuse ACCESS_DENIED.
No-op/rejected writes produce no success event. Stronger failure history and recovery
actor tracking are attempt data and require COM-08 approval.

## 9. Future verification plan — no checks executed here

| Cases | Traceability | Required future evidence |
|---|---|---|
| T1 lifecycle | S1 UC-001; D1/D5 | Empty independent draft allowed; nonempty validation; legal transitions, frozen snapshots, versions |
| T2 selected lines | S1 TEST-005/010/011; D1/D4 | Full exact subset, no quantity splitting; empty/foreign/duplicate selection rejects; cancel sends no command |
| T3 repeated conversion | D4 | One proposal creates two orders from disjoint lines; unused lines remain available; consumed line rejects even for draft orders |
| T4 validation | S1 UC-004; D5/D6 | Explicit authorized order validation, reference uniqueness, failure retains draft |
| T5 automation authority | S1 TEST-012 as intentional difference; D2/D3 | Acceptance survives blocked create; no creation without create permission; no validation without validate permission |
| T6 stage failure/recovery | S1 TEST-014; D3 | Creation failure retains acceptance; validation failure retains draft; crashes at each stage retain discoverable intent and never duplicate target |
| T7 concurrency/replay | D4 | Real synchronized DB transactions: overlapping/manual-automatic selections consume each line once; disjoint same-version loser conflicts, fresh-version retry succeeds; lost-response retry creates none |
| T8 atomic writes/audit | D3/D8 | Inject line/origin/audit/attempt-pointer failures; creation fully rolls back without undoing prior acceptance; no success audit survives rollback |
| T9 schema | Section 6 | Two origins share proposal ID; same source pair in different orders rejects, including concurrent inserts bypassing precheck; UUID actor FK; foreign/half-null/mixed source rejects; standalone unsourced lines allowed; restrictive deletes; numeric bounds |
| T10 HTTP/security/i18n | S6/S7; D2/D8 | Session/Bearer parity, CSRF, protected fields, stable codes, module-owned translations, no unauthorized disclosure |
| T11 policy/locking | D7 | false/false defaults, coherent snapshot, unavailable capabilities cannot be enabled, policy audit rollback and common lock ordering |

Pure tests cover calculations/state; component tests cover adapters; real PostgreSQL
tests establish constraints, transactional rollback and concurrency. Sequential doubles
cannot prove global uniqueness. Native tests do not claim legacy compatibility.
Future implementation follows ./bin/test, ./bin/check and only applicable approved
./bin/check-reference, with expensive required checks normally run by developer/CI
and actual successful results required before closure. No Docker or functional
tests are authorized for this documentation task.

## 10. Nine vertical tasks and dependencies

Each task needs separate explicit implementation approval. The nine tasks are
retained; D3 recovery expands COM-08 sizing and must be reviewed before approval.

| Task | Dependencies / decision gate | Verifiable outcome |
|---|---|---|
| COM-01 creation and read | Functional and technical contract approved in 3.4/12.3; separate implementation authorization required | Native create/GET with money, FK, security and atomic create audit |
| COM-02 draft replacement | COM-01 | Full replacement with version check, limits and real-change audit |
| COM-03 proposal validation | COM-02; D1/D5/D6 | Nonempty validated proposal, frozen commercial fields and rollback on audit failure |
| COM-04 acceptance/refusal without automation | COM-03; D2/D3/D5 and acceptance eligibility D8 | Terminal business transition, no order or ThirdParty side effect |
| COM-05 manual conversion and order read | COM-04; D1/D2/D4 and conversion D8 | Multiple orders from disjoint full lines, global no-reuse integrity, atomic creation and concurrency proof; no standalone create API |
| COM-06 order validation | COM-05; D5/D6 and validation D8 | Independent authorized validation, immutable result and unique reference |
| COM-07 automation configuration | COM-06; D7/D8 | Privileged versioned audited policy, false/false defaults; unavailable feature guards |
| COM-08 automatic draft after acceptance | COM-07; D2/D3/D4/D8, attempt/recovery contract approved | Durable intent, independent acceptance, authorized remaining-line creation, stage failures and crash recovery without duplicates |
| COM-09 immediate validation | COM-08; D2/D3/D5/D8 | Separate authorized validation stage; failure retains acceptance/draft and discoverable outcome |

Until COM-08, automaticCreation must remain false. Until COM-09, immediateValidation
must remain false. No upfront schema dump: each task adds only its own required
migrations. No task includes shipping, billing, Solucar, Flowable or legacy copying.
If COM-08 cannot remain independently reviewable at the proposed size, stop and
obtain approval for a revised breakdown rather than silently adding a tenth task.

## 11. Review evidence and documentation impact

This revision records only the approved COM-01 technical closure and aligns its
specification and future acceptance criteria. No implemented capability changes.
README, AS-IS AFS/BPMN and sibling repositories need no update: this closure does
not change their current runtime claims. COM-01 implementation must update relevant
API and capability documentation, including restrictive ThirdParty deletion.

Documentary acceptance: the approved scales, rounding, immutable monetary policy,
historical amounts/policy identification, centralized limits, representation,
grants and audit are consistent across sections 3.4, 6.1, 7, 8 and 12. Later-operation
decisions and all nine separately authorized tasks remain explicit. Evidence is
source inspection, local link checks, whitespace and diff/scope review; no Docker,
local functional test or runtime/concurrency verification is claimed. Initial
preparation left the document uncommitted pending review. Subsequent explicit
authorization permitted the documentary commit and publication, completed in
`99b33b5` and PR #36; both corresponding Java CI runs passed remotely. This
status correction is separately authorized for a corrective commit and PR update.
COM-01 implementation, PR merge, tags and deployment remain unauthorized.

## 12. COM-01 precise specification and final authorization gates

**Status: functional and technical contract Approved in sections 3.4/12.3; implementation not started.**
One outcome: an authorized caller can persist an independent proposal draft and read it back.
No update, validation, acceptance, conversion, order, automation policy or
per-ThirdParty monetary configuration implementation.

### 12.1 Create/read behavior and closed technical contract

Section 3.4 is the approval authority. The implementation details below refine it;
section 12.3 records the approved technical contract and separate implementation gate.

POST and GET use section 7's exact fields. Require thirdPartyId, currency and lines;
lines must be an array, may be empty, and must not be omitted/null. Each line
requires description, quantity, unitNetPrice and vatRate with section 6.1's exact
normalization, limits and calculation. Numeric IDs are positive signed 64-bit
integers; server-generated proposal/line IDs are immutable. Input order determines
positions starting at 1. No caller-supplied ID/version/state/total/link/timestamp.

Create returns 201 `{id}` and relative Location `/api/proposals/{id}`. Persist DRAFT,
version 1, timestamps from a single server clock instant and calculated line amounts.
GET returns the full proposal shape in section 7, lines ascending position, empty
orderIds and null convertedOrderId; no ThirdParty details. Creation and read have
independent permissions; manage does not grant read. A successful create does not
need read permission and exposes only generated ID. No list/search endpoint.

Approved ThirdParty rule: existing AND active AND (customer OR prospect). Approved
internal lookup under proposals.manage without extra ThirdParty permission. Read the
ThirdParty with FOR SHARE in the creation transaction, verify flags and hold the
lock until commit before appending audit. A row CHECK/FK cannot enforce eligibility
flags in another table. Concurrent deactivation/reclassification waits or is observed
before creation; tests must prove both orderings. GET does not reapply creation
eligibility after later flag changes. Restrictive FK handles concurrent deletion:
either creation commits and deletion is blocked, or creation rejects cleanly with
422 SALES_INVALID_THIRD_PARTY; use the same code for existing ineligible records.
Do not mutate ThirdParty. Later ThirdParty delete conflict mapping must incorporate
proposal references without exposing SQL; this integration belongs to COM-01.

Create only sales_proposal/sales_proposal_line persistence needed by this slice;
do not seed future sales states/permissions/actions as implemented capabilities.
Use existing RBAC and AuditTrail. Approved COM-01 seeds: proposals.manage/read assigned
to system-admin only; PROPOSAL_CREATED / PROPOSAL / SUCCESS in the create transaction.
OFF emits none; BASIC/SELECTIVE required append failure rolls back and returns
503 AUDIT_UNAVAILABLE. GET has no baseline success audit. User-facing messages
belong to sales.* bundles; existing generic validation keys are reused where apt.

### 12.2 Implementation acceptance criteria

These verify the approved COM-01 functional and technical contract in sections
3.4/6.1/12.3; they authorize no implementation or test execution in this task.

1. Empty lines creates DRAFT/version 1; GET returns no lines and all totals 0.00.
2. Nonempty create/read preserves order, stable generated line IDs and normalized
   descriptions; quantity 2 × price 10.005 at VAT 21 gives net 20.01, tax 4.20,
   gross 24.21. Totals sum individually rounded lines, deterministically with
   BigDecimal and the centralized immutable policy; two lines of quantity 1,
   price 0.005 and VAT 0 total net 0.02. Quantity/price (19,6), VAT (7,4) and
   amounts/totals (19,2) roundtrip exactly. Historical amounts and the applied
   policy identification remain unchanged by future policy selection changes.
3. Missing/null required fields → 400 VALIDATION_REQUIRED; unknown/protected fields,
   malformed IDs/types, excessive scale, bounds, description/line limits or overflow
   → 400 VALIDATION_INVALID. Non-EUR → 422 SALES_UNSUPPORTED_CURRENCY. Invalid
   ThirdParty → 422 SALES_INVALID_THIRD_PARTY. At most 1,000 lines are allowed;
   descriptions are required, nonblank and at most 2,000 Unicode code points after
   trimming, with no exterior whitespace persisted. Both limits use centralized
   named constants. No partial header/lines/audit remains.
4. Valid positive missing proposal ID → 404 PROPOSAL_NOT_FOUND after authorization;
   invalid ID → 400. POST/GET unauthorized access follows existing 401/403 rules.
   Session writes require CSRF; Bearer permissions match session behavior.
   proposals.manage/read are initially assigned to system-admin only; internal
   eligibility lookup succeeds without thirdparties.read. Manage does not grant read.
5. Restrictive FK rejects unknown ThirdParty and blocks deleting a referenced one;
   concurrent delete/create and reclassification/create have consistent outcomes.
   Active customer-only, prospect-only and customer+prospect records qualify;
   inactive, supplier-only and unclassified records reject with 422. Supplier=true
   does not disqualify an otherwise eligible record; flags never change. A later
   flag change does not block authorized GET or rewrite the proposal.
6. Required audit failure rolls back header and lines; OFF creates without event;
   successful BASIC/SELECTIVE creates exactly one event with canonical proposal ID,
   authenticated actor, action PROPOSAL_CREATED, resource PROPOSAL, result SUCCESS
   via AuditTrail and no commercial payload. GET creates no baseline event.
7. Real PostgreSQL roundtrip proves decimals, constraints and FK behavior; focused
   domain/component tests cover rounding, validation, HTTP/security and localization.
   Applicable ./bin/test and mandatory ./bin/check results must be obtained before
   later task closure/commit, normally from developer/CI for expensive checks.
8. Final diff includes only this vertical capability and necessary documentation,
   including ThirdParty delete-conflict documentation if its public behavior changes.
   No order/attempt/policy tables or future automation are introduced.

### 12.3 Approved technical closure and implementation gate

Approval source: explicit human COM-01 technical closure instruction and subsequent
branch/documentary preparation authorization, dated 2026-11-10. Functional A1–A8
and the following technical decisions are Approved; do not request approval again
for these decisions. This authorization is exclusively documentary.

| Technical contract | Approved COM-01 decision |
|---|---|
| Numeric policy | Section 6.1: quantity/price (19,6), VAT (7,4), amounts/totals (19,2), line-net then tax HALF_UP to two decimals, exact sum of rounded lines, reject excess scale/overflow |
| Monetary policy | Centralized and immutable; retain historical amounts and identification of the applied policy; allow future selection according to ThirdParty, without implementing per-ThirdParty configuration |
| Payload/representation | Required VAT; 1,000 lines; required trimmed/nonblank description up to 2,000 Unicode code points; centralized named limit constants; exact decimal JSON; EUR; generated positive BIGINT IDs; initial version 1 |
| HTTP contract | Existing POST/GET fields, responses, Location and ProblemDetail in sections 7/12.1; no additional endpoint or response field approved |
| Security integration | Seed proposals.read/manage for system-admin only; no extra thirdparties.read permission for internal reference eligibility lookup |
| Audit integration | PROPOSAL_CREATED/PROPOSAL/SUCCESS via AuditTrail; existing OFF/BASIC/SELECTIVE policy and atomic mutation; no baseline sales read audit |

**Pending: separate COM-01 implementation authorization**, including necessary
schema, locking, tests and documentation. No application code, migrations or tests
are authorized by this closure. Policy identification must be retained internally;
this does not add a public field to the existing POST/GET contract.

There is no remaining ThirdParty eligibility discrepancy: existence-only is
superseded by active customer-or-prospect for COM-01. D2/D3/D4/D7 and all
later-operation parts of D1/D5/D6/D8 remain Pending. Future ThirdParty policy
selection behavior is Pending; COM-01 neither implements it nor configures it.

### 12.4 First vertical implementation boundary — COM-01

The next separately authorized task must deliver the complete create/read capability:

- Flyway: only proposal header/line persistence, restrictive ThirdParty relation,
  numeric/state constraints and the two approved permission codes with approved initial grants.
- Domain: draft creation, centralized limit constants, EUR and deterministic
  BigDecimal calculations under the centralized immutable monetary policy;
  no Spring/HTTP/JSON/jOOQ dependencies and no future transitions.
- Application: create/read use cases and only the concrete persistence boundaries
  required by these use cases; no speculative generic sales framework.
- jOOQ/infrastructure: exact decimal roundtrip, generated IDs, ordered lines,
  historical monetary snapshots and applied policy identification, transactional
  eligibility locking, atomic creation/audit and FK conflict mapping.
- API/security: the two approved endpoints and permissions, existing authentication,
  session CSRF/Bearer parity, ProblemDetail and module-owned i18n.
- Audit: reuse existing AuditTrail and policy; implement only the confirmed create
  action/resource integration, with authenticated actor and no commercial payload.
- Tests: focused monetary/domain tests, create/read/security/i18n component tests and
  real PostgreSQL FK/eligibility/concurrency/audit rollback tests; obtain required
  ./bin/test and ./bin/check results before closing the implementation task.

No proposal editing, validation, acceptance, conversion, order tables, automation,
reference investigation, Solucar changes or deployment belongs to COM-01. Keep all
nine tasks; approve subsequent work separately after COM-01 is validated and closed.
