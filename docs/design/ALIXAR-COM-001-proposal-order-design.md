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

**Status: functional and technical contract Approved in sections 3.4/12.3.**
Separate COM-01 implementation authorization was granted on 2026-11-10; see
[implementation contract and verification](../proposals.md). Earlier documentary
authorization statements above describe that historical task, not the subsequent
implementation authorization. All later operations still require separate approval.
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

## 13. COM-02 — complete replacement of a DRAFT proposal

**Status: Proposed; functional and technical decisions Pending human approval.**
This section is a documentary deliverable, not authorization to implement COM-02.
Earlier COM-02 recommendations in sections 4–10 are Antecedent proposals; they are
not promoted to Approved by this investigation. COM-03 and later operations remain
outside this task. Sections 3.4, 6.1 and 12 retain their COM-01 approval scope.

### 13.1 Evidence, outcome and boundaries

Inspected baseline: main `e2b03a6`, integrating PR #37 and implementation commit
`019026de3508f5c5aa6771485d6472d5d17583e2`. Relevant implementation evidence:

| Source | Demonstrated COM-01 mechanism / COM-02 implication |
|---|---|
| [Proposal](../../src/main/java/es/alxarafe/alixar/sales/domain/Proposal.java), [ProposalLine](../../src/main/java/es/alxarafe/alixar/sales/domain/ProposalLine.java) | Immutable records with stored amounts, policy identification, ordered lines, version and timestamps; no update behavior yet |
| [MonetaryPolicy](../../src/main/java/es/alxarafe/alixar/sales/domain/MonetaryPolicy.java), [ProposalLimits](../../src/main/java/es/alxarafe/alixar/sales/domain/ProposalLimits.java), [create use case](../../src/main/java/es/alxarafe/alixar/sales/application/CreateProposalUseCase.java) | Centralized EUR v1 calculations and limits; creation normalizes descriptions and verifies eligibility; create cannot simply be called to replace an existing root |
| [V14](../../src/main/resources/db/migration/V14__create_proposal_and_authorization.sql), [jOOQ repository](../../src/main/java/es/alxarafe/alixar/sales/infrastructure/persistence/JooqProposalRepository.java) | Restrictive FKs, identity IDs, unique positions, only DRAFT storage, two-query read; no root-lock/update method or revision archive |
| [Eligibility adapter](../../src/main/java/es/alxarafe/alixar/sales/infrastructure/persistence/JooqEligibleThirdParty.java), [transactional facade](../../src/main/java/es/alxarafe/alixar/sales/infrastructure/TransactionalProposalService.java) | ThirdParty FOR SHARE and business/audit transaction boundary; GET is read-only with default isolation |
| [Security](../../src/main/java/es/alxarafe/alixar/authentication/infrastructure/security/SecurityConfiguration.java), [controller](../../src/main/java/es/alxarafe/alixar/sales/api/ProposalController.java), [errors](../../src/main/java/es/alxarafe/alixar/sales/api/ProposalExceptionHandler.java) | Separate manage/read authorities; exact decimal JSON parsing, protected-field rejection, existing ProblemDetail and sales-owned i18n; PUT is not authorized or implemented |
| [AuditTrail implementation](../../src/main/java/es/alxarafe/alixar/audit/infrastructure/ConfiguredAuditTrail.java), [PostgreSQL tests](../../src/test/java/es/alxarafe/alixar/persistence/ProposalPersistenceIT.java), [HTTP tests](../../src/test/java/es/alxarafe/alixar/sales/ProposalControllerTest.java) | OFF/BASIC/SELECTIVE mutation audit, real rollback and synchronized lock evidence; no concurrent replacement or mixed-read proof exists yet |

One proposed outcome: an authorized caller replaces all editable contents of one
existing DRAFT using its expected version, with coherent monetary snapshots and an
atomic real-change audit. No PATCH, line mutation API, partial quantity allocation,
new state, new role, order, automation, workflow engine or ThirdParty configuration.
COM-01 POST/GET JSON, permissions and creation semantics remain unchanged.

### 13.2 Decision register — recommendations requiring approval

The existing COM-01 behavior and architecture are **Approved** only within their
recorded scope. Every COM-02 recommendation below is **Proposed**, with its decision
**Pending**. The human request approves preparing this proposal, not these choices.

| ID | Proposed recommendation | Rationale / alternative requiring a different decision |
|---|---|---|
| COM-02-P1 | Replace thirdPartyId, currency and all line inputs; permit changing the ThirdParty and emptying lines; currency remains EUR | Makes full replacement explicit and permits correcting a draft's customer. Alternative: freeze ThirdParty after creation. No other fields become editable. |
| COM-02-P2 | On any effective change, replace every line with newly generated IDs in input order; on a no-op retain every ID | Avoids implicit line matching and partial-update semantics. Even a ThirdParty-only change renews line IDs; retaining matching IDs would need a separate identity rule. |
| COM-02-P3 | Compare normalized editable values in order, numerically for decimals; a no-op returns 200 without writes, version/timestamp changes or success audit | Avoids false changes from decimal scale or exterior whitespace. Stale versions still conflict before no-op detection. Alternative: every valid PUT creates a new revision. |
| COM-02-P4 | Every PUT, including no-op and unchanged ThirdParty, requires the submitted ThirdParty to be currently active customer-or-prospect | Keeps mutation eligibility explicit; prevents editing an ineligible relationship silently. A client can repair it by choosing an eligible ThirdParty. Alternative: recheck only when ThirdParty changes, or exempt no-ops. GET remains independent of later eligibility changes. |
| COM-02-P5 | Keep the draft's stored policy identification; calculate a changed replacement with those exact rules, including ThirdParty-only changes; never silently switch to today's default | Avoids unrequested repricing after software updates. COM-01's current EUR v1 is supported; an unavailable historical policy blocks real edits. Alternative: explicitly adopt the current default on each edit. Neither alternative authorizes per-ThirdParty configuration. |
| COM-02-P6 | Replace current draft snapshots without introducing an archive of previous draft revisions | V14 has no revision store and AuditTrail has no commercial payload. This permits intentional draft editing while preserving untouched documents and reads. If every superseded amount must remain queryable, stop and separately design retention before implementation. |
| COM-02-P7 | One effective change increments version exactly once and assigns updatedAt from one server instant, clamped to at least the previous stored timestamp; createdAt/id/state remain unchanged | Prevents timestamp regression if the clock moves backwards. PostgreSQL timestamp precision may yield equal updatedAt values; version is the concurrency/ordering authority. Strictly increasing timestamps are an alternative, not assumed. |
| COM-02-P8 | Reuse proposals.manage alone for PUT and its full 200 proposal response, including no-op; no proposals.read or thirdparties.read prerequisite | Matches the earlier proposed command/result contract and lets a writer receive generated line IDs/version. This explicitly authorizes command-result disclosure, not independent GET access. Alternative: require read too or return a smaller result. |
| COM-02-P9 | PROPOSAL_UPDATED / PROPOSAL / SUCCESS only for effective changes, via existing AuditTrail in the same transaction; OFF remains OFF | Reuses the mutation policy and proves fail-closed rollback under BASIC/SELECTIVE. No-op/rejected writes have no success event. No before/after payload or synthetic actor. |
| COM-02-P10 | Use the contract, conflict precedence, transaction protocol, coherent-read requirement and errors in 13.3–13.6 | Prevents lost updates, inconsistent reads and ambiguous retry behavior. New conflict/error identifiers and PUT authority need explicit approval; no implemented capability is inferred from this proposal. |

### 13.3 Proposed HTTP contract and field rules

`PUT /api/proposals/{id}/draft`, consuming and producing `application/json`:

```json
{
  "expectedVersion": 1,
  "thirdPartyId": 42,
  "currency": "EUR",
  "lines": [
    {"description": "Consulting", "quantity": 2, "unitNetPrice": 10.005, "vatRate": 21}
  ]
}
```

All four root members are required/non-null. `expectedVersion` and the path ID are
positive signed BIGINT-range integers; no string/fractional/overflow coercion.
The remaining input rules reuse the COM-01 definitions in sections 6.1/12.1 and
[the implemented contract](../proposals.md): exact decimals, validated input scales,
EUR, mandatory VAT, normalized descriptions, centralized limits and allowed empty
arrays. This reuse is Proposed for PUT and does not change POST validation.

The client supplies no root ID, state, current version, policy ID, total, timestamp,
order link, line ID or position. Unknown/protected members reject, including within
lines. `lines: []` removes all lines; omitted/null lines do not mean "keep lines".
Every submitted line is a complete description/quantity/unitNetPrice/vatRate tuple.
No client-selected policy or lifecycle transition is possible.

Success is `200` with exactly the existing GET proposal representation (section 7),
not a new response schema: root identity, ThirdParty, EUR, DRAFT, version, ordered
lines with IDs and amounts, totals, timestamps, empty orderIds and null line links.
No internal policy field, change flag or ETag is added. No Location is required.
A real change returns the new version/IDs; a no-op returns the unchanged snapshot.
An unsuccessful command returns no successful replacement representation.

Proposed equality: compare thirdPartyId/currency and ordered normalized line tuples;
ignore generated IDs, stored amounts, policy ID and timestamps as input fields.
Compare valid decimals using BigDecimal numerical comparison, not scale-sensitive
equals: `2` and `2.000000` are equivalent, but excessive input scale still rejects.
Removing exterior whitespace only is a no-op. Reordering distinct lines is a change;
swapping indistinguishable tuples is not observable. Equal rounded totals do not
make different quantities/prices/VAT a no-op. Eligibility and version/state checks
precede this comparison. No-op preserves stored amounts byte-for-byte and never
recalculates them, even when the historical policy implementation is unavailable.

### 13.4 Monetary snapshots, version and history

For a real change, resolve only the policy identified on the locked proposal. For
the current baseline this is MonetaryPolicy.EUR_V1 with its existing stable ID.
Do not reinterpret an unknown ID as EUR v1. Reuse calculation and normalization
rules through a concrete shared sales operation where needed; do not invoke the
creation use case, duplicate arithmetic or add a configurable policy framework.
A small explicit supported-ID check suffices until a second policy is approved.

Calculate all replacement line snapshots and totals under the stored policy and
verify bounds before deleting anything. On commit, replace the draft's current
snapshots and retain the policy ID. A policy change elsewhere never rewrites an
untouched draft, a no-op, or a GET response. Under P6 the superseded revision is
not archived: audit records the update's identity/actor, not the previous prices.
This limitation requires explicit functional approval and must be documented.

An effective change retains root id/createdAt/DRAFT, increments the locked version
by one, and sets updatedAt once using P7 at database timestamp precision. Return
the persisted timestamp precision. A BIGINT version at its maximum cannot be
incremented: reject a real change as 409 SALES_VERSION_CONFLICT without overflow;
a matching no-op can still succeed. Do not reset versions, wrap values, create a
new root or advertise timestamp-based optimistic concurrency.

### 13.5 Proposed transaction, concurrency and coherent reads

Use the existing infrastructure facade and Spring-managed transaction; domain and
application remain independent of Spring, jOOQ and HTTP. No new tables or change to
V14 is expected: current FK/index/position/amount constraints support replacement.
If implementation demonstrates a migration is necessary, explain it before adding
one; do not preallocate V15, relax DRAFT storage or seed future states/actions.
Register only PROPOSAL_UPDATED in the existing action catalogue when approved.

Proposed READ COMMITTED write protocol, respecting section 5's lock order:

1. Authorize before lookup; parse and validate complete input/IDs/scales/limits.
2. Lock/check the **submitted target ThirdParty** with existing FOR SHARE first.
   Retain the eligibility result until after the proposal existence/state/version
   checks. No current-ThirdParty pre-read or root-then-ThirdParty lock is needed.
3. Read/lock the proposal header FOR UPDATE by path ID, then load its lines while
   holding the root lock. Reject missing root, non-DRAFT, then stale expectedVersion
   in that order. Check eligibility of the already locked target next. These
   checks apply even if the submitted values would otherwise be a no-op.
4. Compare normalized input to the locked current contents. A no-op returns the
   stored snapshot without SQL mutations or success audit; locks end with the
   transaction. A rejected no-op remains a rejection, not an eligibility bypass.
5. For a real change, resolve the stored policy, calculate/bounds-check the complete
   replacement and ensure version capacity. Delete existing lines of this root,
   insert all new lines with fresh generated IDs/positions, then update the header's
   ThirdParty/version/updatedAt. Keep policy/id/createdAt/state unchanged. Root lock
   is primary protection; an update predicate on id/version/DRAFT is a defensive
   guard, and an unexpected zero-row update aborts everything.
6. Append required PROPOSAL_UPDATED last through AuditTrail.recordSuccess, build
   the command result from the same transaction, and commit. Line/constraint/header/
   audit failure restores the entire old header, lines, IDs, version, amounts and
   policy. Sequence gaps after rollback are allowed, not proof of a partial write.

Only the target ThirdParty is eligibility-checked: changing away from an inactive
old party is allowed. The old party remains protected by its FK until the reference
change commits; afterward it is deletable only if no other reference blocks it.
Do not acquire an old-party lock after taking the proposal lock or upgrade target
FOR SHARE to FOR UPDATE. Concurrent edits of the same proposal serialize at the
root: two effective commands with the same expectedVersion yield one success and
one 409, even with disjoint target parties/lines. Two no-ops may both succeed since
neither changes version. A real edit racing a no-op either follows the no-op or
makes it stale. Tests must demonstrate these orderings with separate connections.

Concurrent target deactivation/reclassification/deletion either commits before the
eligibility read (422) or waits for its FOR SHARE lock. Successful replacement
protects the new target FK and releases the old relationship atomically. A stale
command or later failure never leaves a partially reassigned proposal. A repeated
request with the old expectedVersion after a lost success response receives 409;
there is no replay cache or automatic retry. The caller uses separately authorized
GET to obtain the current version, or arranges a reader if it has manage only.

**Read consistency gate:** current jOOQ GET fetches header and lines in separate
statements. Once replacement exists, default READ COMMITTED can combine an old
header/version with newly committed lines. Proposed internal requirement: use one
REPEATABLE READ read-only snapshot for aggregate GET, including its two queries,
without changing the approved public GET fields, permission or eligibility rules.
This is required support for COM-02, not a new COM-01 public contract. No-op/write
responses instead use their already locked transaction. Prove via a synchronized
commit between read queries that a response is wholly before or wholly after the
edit. If internal GET adjustments are excluded from implementation approval, this
coherence gate must be resolved before enabling PUT.

Technical basis: [PostgreSQL row locks](https://www.postgresql.org/docs/18/explicit-locking.html)
explain the shared/exclusive conflicts; [transaction isolation](https://www.postgresql.org/docs/18/transaction-iso.html)
distinguishes statement and transaction snapshots. [Spring transaction annotations](https://docs.spring.io/spring-framework/reference/data-access/transaction/declarative/annotations.html)
provide infrastructure transaction/isolation control. Numerical equality follows
[BigDecimal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/math/BigDecimal.html).
The protocol above is an Alixar proposal inferred from those mechanisms, not newly
executed runtime evidence. No new library, engine or isolation claim is introduced.

### 13.6 Proposed authorization, errors and audit

Add only the exact PUT draft route under proposals.manage, reusing existing
session/Bearer permission resolution and CSRF. No role-name branches, extra grants
or new permission are proposed. proposals.read alone cannot mutate. P8's command
response disclosure needs explicit approval; it does not grant GET permission.
Reuse the existing static proposal family for ACCESS_DENIED. No separate baseline
read audit is added as part of the command.

Proposed errors use the existing application/problem+json shape, code and optional
field property. Reuse core validation messages and sales-owned English/Spanish
MessageSource bundles; codes/paths/fields are not translated. Register new stable
codes only after approval. Error precedence for a structurally valid authorized
command is missing proposal → state → version → target eligibility → policy for
real change → persistence/audit. Request validation may reject before lookup;
authentication/CSRF/authorization retain their existing filter behavior.

| HTTP | Proposed code / scenario | Required effect |
|---|---|---|
| 400 | Existing VALIDATION_REQUIRED / VALIDATION_INVALID, including invalid expectedVersion, excess scale/limits and protected line IDs | No change; no success event |
| 401/403 | Existing authentication/CSRF/permission results | No proposal or ThirdParty disclosure |
| 404 | Existing PROPOSAL_NOT_FOUND for valid positive path ID | No change |
| 409 | Proposed PROPOSAL_INVALID_STATE for any future non-DRAFT; no COM-03 state is introduced now | No change |
| 409 | Proposed SALES_VERSION_CONFLICT for stale expectedVersion or exhausted version on real change | No change; reread for stale version, no blind retry on exhaustion |
| 409 | Proposed SALES_MONETARY_POLICY_UNAVAILABLE for a real edit whose stored policy cannot be resolved | Preserve historical snapshot; no fallback or implicit migration |
| 422 | Existing SALES_INVALID_THIRD_PARTY, SALES_UNSUPPORTED_CURRENCY | No replacement, including invalid target on otherwise unchanged input |
| 503 | Existing AUDIT_UNAVAILABLE; Proposed SALES_TEMPORARILY_UNAVAILABLE for identified transient locking/database failure | Entire transaction rolls back; no internal SQL details |

Do not expose currentVersion or other proposal fields in conflict errors; retain
the existing ProblemDetail shape. Do not translate arbitrary integrity failures
into eligibility errors: map only the relevant known FK if a race requires it.
Deadlock/lock-timeout failures are classified after rollback, not by continuing an
aborted transaction. Use existing configured timeouts; any new timeout needs an
explicit named/configured source of truth, not an invented value in this design.

An effective successful update emits exactly one PROPOSAL_UPDATED / PROPOSAL /
SUCCESS under BASIC and SELECTIVE with the existing authenticated SESSION/PAT
actor and canonical root ID; OFF emits none. No-op emits none and does not call
an unconditional mandatory audit method. Inject audit failure after line writes
to prove full rollback, and a failure after a successful append to prove no success
event survives rollback. No previous commercial values, new actor type or stronger
revision-history promise is added to AuditTrail.

### 13.7 Proposed acceptance criteria and future evidence

These criteria describe the recommended design **if approved**, not delivered
functionality. No tests or Docker commands are executed for this documentary task.

| ID | Scenario / expected outcome | Future evidence |
|---|---|---|
| COM-02-T1 | Replace nonempty draft, clear it, then refill it; optionally change eligible ThirdParty; retain root/state/createdAt, advance version once per real edit, totals match policy | Domain/component plus real PostgreSQL roundtrip |
| COM-02-T2 | Every real change replaces all line IDs, including ThirdParty-only edits and reordering; positions follow input; previous line IDs are gone | Real PostgreSQL identity/unique-position checks; no assumption of gap-free sequences |
| COM-02-T3 | Equivalent decimal scales, trimmed descriptions and equal empty input are no-ops; IDs/version/updatedAt/policy/amounts unchanged; stale no-op conflicts | Domain comparison tests and SQL observation proving no UPDATE/DELETE/INSERT/success append on no-op |
| COM-02-T4 | Missing/null/wrong types, protected fields, invalid versions, 1,001 lines, 2,001 code points, bounds/scale/overflow reject; exact maxima and supplementary Unicode pass | Focused input/domain/HTTP tests reusing constants; no weakening of COM-01 tests |
| COM-02-T5 | Two effective same-version writes on separate connections produce one commit and one conflict, with one coherent set of lines and audit | Latches and observed PostgreSQL blocking, not sequential doubles or sleep-only inference |
| COM-02-T6 | Exercise no-op/real-write race, target mutation/deletion in both lock orders, change away from an ineligible old party and two different target parties | Real PostgreSQL transactions; preserved flags; restrictive FK and delete-conflict checks before/after commit |
| COM-02-T7 | Fail after old-line delete, midway through new inserts, header update, required audit and after successful append | Original header/IDs/lines/version/timestamps/policy intact; no success event; aborted transaction is not reused |
| COM-02-T8 | BASIC/SELECTIVE real edits emit exactly one event with actor; OFF/no-op/rejection emit no success event | Real PostgreSQL audit/rollback plus component actor/security tests |
| COM-02-T9 | POST and GET remain unchanged; PUT session CSRF/Bearer parity; manage-only result and read-only rejection; unauthorized/missing/malformed precedence; localized errors | HTTP/security/i18n tests including exact response fields and no policy disclosure |
| COM-02-T10 | Stored policy survives edits, software default changes do not reprice it; unknown policy permits coherent GET and eligible matching no-op but rejects real edit | Historical-policy fixtures; exact decimals/amounts/identifier roundtrip; no new configuration |
| COM-02-T11 | Commit replacement between GET header and line reads; read returns wholly old or wholly new aggregate | Real PostgreSQL snapshot test of the actual facade; all concurrent callers use coherent reads |
| COM-02-T12 | BIGINT max version, equal stored timestamp resolution and clock regression follow P7 and 13.4 | Focused deterministic clock/version tests; no overflow or timestamp-based lost-update protection |

A non-DRAFT guard can be unit-tested on an in-memory aggregate. Do not relax V14's
DRAFT CHECK merely to create a COM-03 integration fixture. Once another state is
separately approved, its future task must also verify this guard against real data.

Future implementation must reuse the existing domain/application/infrastructure
boundaries and only add concrete replacement operations. A minimal changed/no-op
result can carry the proposal and audit decision, following existing real-change
mutation conventions; no generic event bus or sales framework is justified.
Required focused tests precede ./bin/test and ./bin/check, with expensive complete
checks normally executed by developer/CI and their actual successful results
required before implementation closure/commit. No new legacy compatibility claim
or ./bin/check-reference dependency is proposed.

### 13.8 Review gates and documentation impact

Before implementation: obtain explicit decisions for P1–P10, including command
result disclosure, no-op eligibility, stored-policy behavior and absence of a draft
revision archive; approve the new error codes and the internal coherent-read work.
Then separately authorize the single COM-02 vertical implementation. This design
does not authorize COM-03 or any later operation, publication, PR or deployment.

The only current change is this independent section. Existing COM-01 code, approved
contracts and acceptance criteria remain untouched. README, runtime capability
docs and sibling repositories need no change while COM-02 is only Proposed.
Future COM-02 implementation must update proposals/security/audit/status docs and
explain line-ID renewal, stale retries, no-op eligibility and snapshot-history limits.
Documentary validation is local links, whitespace, status consistency and a diff
review; no functional validation, migration or concurrency result is claimed here.
