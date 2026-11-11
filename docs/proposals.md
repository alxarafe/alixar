# Proposals (COM-01 and COM-02)

Alixar owns independent proposal drafts and their persisted monetary snapshots.
The HTTP API exposes creation, single-object consultation and complete draft
replacement. The approved contract is recorded in
[COM-001 design](design/ALIXAR-COM-001-proposal-order-design.md).
No business validation, acceptance/refusal, orders, conversion or automation is available.

## Internal draft replacement preparation (COM-02.2)

`ReplaceProposalDraftCommand` validates and freezes normalized editable inputs,
reusing COM-01 line inputs, description normalization and decimal bounds. This
phase does not calculate amounts. `PrepareProposalDraftReplacement.assess` accepts
an existing snapshot and checks expected version, then DRAFT, then ordered editable
equality. Decimal equality uses `BigDecimal.compareTo`; stored line identities,
amounts and dates do not participate. A no-op returns the exact unchanged snapshot,
without eligibility checks, policy resolution or recalculation.

An effective change checks version capacity and yields `Change`. The
transactional caller must check target eligibility before invoking
`Change.prepare()`. Preparation explicitly resolves only the stored policy ID,
rejects an unavailable policy without fallback, and calculates every replacement
line and the aggregate totals using COM-01 rules. The resulting immutable content
retains root ID, DRAFT, creation time and policy ID, and advances the version once.
Lines have no IDs or assigned positions; their list order determines later
persistence positions. `previousUpdatedAt` is retained solely as input to later
timestamp selection. Preparation does not choose a new timestamp.

The pure preparation logic does not perform I/O. Its deterministic unit tests
establish preparation rules only. The historical design document records the
approved complete contract; it does not describe current delivery status.

## Internal transactional replacement persistence (COM-02.3)

The package-private `InternalProposalDraftReplacement` composes the existing
application preparation and persistence ports. It is not registered as a Spring
bean and has no public entry point of its own. It requires
an enclosing, explicitly configured writable `READ COMMITTED` transaction; its
mandatory transaction participation cannot commit separately. A failure marks the
enclosing transaction for rollback even if its caller catches that failure.
The audited facade described below is its production caller.

After structural validation, the step locks only the submitted ThirdParty ID
`FOR SHARE`, remembers whether it exists, then locks the proposal header
`FOR UPDATE`. Missing root, expected version and DRAFT are checked before loading
lines. COM-02.2 determines no-op or effective change. No-op executes only these
reads/locks; it does not query commercial flags, resolve a policy or issue DML.

An effective change checks version capacity before checking the already locked
target's eligibility and preparing amounts under the stored policy. An initially
absent target rejects even if inserted while the operation waits for the root;
no later lock is acquired out of order. All amounts are validated before deleting
old lines. PostgreSQL generates every replacement line ID, including on a
ThirdParty-only change, and positions start at 1 in input order. The guarded header
update matches ID, expected version and DRAFT; it changes only ThirdParty, version
and update time. An unexpected zero-row update aborts the transaction. Update time
is the maximum of the stored value and one clock sample truncated to microseconds.

`ProposalDraftPersistenceIT`, selected by `./bin/check`, verifies real PostgreSQL
roundtrips, exact no-op preservation, observed blocking between distinct backend
connections, same-version conflicts, target mutation/deletion ordering and full
rollback after injected write failures. It also commits the actual internal step
between GET's two queries to check the COM-02.1 snapshot guarantee. Its tests cover
the internal persistence step; audited orchestration is tested separately.

## Transactional modification audit (COM-02.4)

`TransactionalProposalService.replaceDraft` runs the internal replacement step and
its success audit in one writable `READ COMMITTED` transaction. It returns the
resulting version for the supplied proposal ID. The HTTP adapter calls only this
audited facade. The facade calls
`AuditTrail.recordSuccess(PROPOSAL_UPDATED, PROPOSAL, id)` exactly once after an
effective change. No-op returns the unchanged version without invoking audit.
Rejected operations never reach that append.

The existing configured trail emits no event under `OFF`. Under `BASIC` and
`SELECTIVE`, the event is required and uses the authenticated SESSION/PAT actor.
`SELECTIVE` read rules do not filter these baseline mutation events. No additional
audit configuration, commercial payload or alternative actor is introduced.
The lock order remains target ThirdParty, proposal root, lines, then audit chain.
The ordinary audit append joins the business transaction; no isolated append is used.

Required audit failure becomes `AuditUnavailableException` and restores all
original header values, line IDs, amounts, ThirdParty, version and dates. The error
conversion is confined to the audit call, so validation, business and persistence
errors retain their meaning. An exception after append but before commit also
rolls back the event and chain head. COM-01 creation and `PROPOSAL_CREATED` are unchanged.

`ProposalDraftAuditIT` uses the real facade, configured trail, authenticated-context
actor resolver and PostgreSQL repositories. It verifies modes, event cardinality,
SESSION/PAT attribution, rejection/no-op behavior and rollback. SQL observation
checks the same PostgreSQL backend and transaction ID for mutation and append,
with chain locks taken after header writes. Session/PAT fixtures supply an already
authenticated context; these tests do not establish a replacement HTTP endpoint
or its authentication/authorization flow. The non-DRAFT guard uses a constructed
snapshot because V14 intentionally stores only DRAFT. HTTP integration is covered
separately by the tests below.

## HTTP contract

`POST /api/proposals` consumes `application/json`:

```json
{
  "thirdPartyId": 42,
  "currency": "EUR",
  "lines": [
    {"description": "Consulting", "quantity": 2, "unitNetPrice": 10.005, "vatRate": 21}
  ]
}
```

All fields are required, including each line's VAT rate. `lines` may be empty.
Creation returns `201`, `{"id": ...}` and relative `Location: /api/proposals/{id}`.
The server generates positive BIGINT proposal/line identifiers, `DRAFT`, version 1
and equal creation/update timestamps from one UTC clock instant. Caller-supplied
IDs, versions, states, totals, links and timestamps are rejected.

`GET /api/proposals/{id}` returns:

```json
{
  "id": 7,
  "thirdPartyId": 42,
  "currency": "EUR",
  "state": "DRAFT",
  "version": 1,
  "lines": [
    {
      "id": 9, "position": 1, "description": "Consulting",
      "quantity": 2, "unitNetPrice": 10.005, "vatRate": 21,
      "netAmount": 20.01, "taxAmount": 4.20, "grossAmount": 24.21,
      "convertedOrderId": null
    }
  ],
  "totals": {"netAmount": 20.01, "taxAmount": 4.20, "grossAmount": 24.21},
  "orderIds": [],
  "createdAt": "2026-11-10T12:00:00Z",
  "updatedAt": "2026-11-10T12:00:00Z"
}
```

Lines follow input order, with positions starting at 1 and stable generated IDs.
Empty drafts return empty lines and totals of 0.00. No ThirdParty details or
internal policy identification are exposed. There is no list/search endpoint.

The transactional service reads header and lines in one read-only PostgreSQL
`REPEATABLE READ` transaction. A concurrent committed replacement cannot mix
header/version from one snapshot with line identifiers or totals from another.

### Complete draft replacement

`PUT /api/proposals/{id}/draft` consumes and produces `application/json`:

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

Every member is required and non-null. IDs and expected version must be positive
signed BIGINT-range integers, without string or fractional coercion. Descriptions,
decimal inputs and line limits follow the rules below. The parser rejects duplicate
keys, trailing JSON and unknown/protected members, including line IDs/positions,
state, policy, totals, dates and links. `lines: []` clears all lines; omitted/null
lines never mean "retain the old lines". Non-EUR input returns 400 for this PUT;
COM-01 POST retains its existing unsupported-currency error.

Successful effective changes and no-ops return exactly `200 OK` with:

```json
{"id": 125, "version": 2}
```

There is no Location or ETag header and no document payload. The resulting version
comes from the write transaction, without a later GET. Manage permission permits
PUT without read permission; full consultation still requires `proposals.read`.

Precedence is authorization/CSRF, structural validation, root existence, expected
version, DRAFT and normalized equality. A stale identical request conflicts.
Valid no-op retains every value and emits no modification audit, even with later
ThirdParty ineligibility, unavailable policy or maximum version. Effective changes
check version capacity, then target eligibility, stored policy and calculated
amounts before writing. Input validation never performs policy-dependent arithmetic.

## Validation and money

- At most 1,000 lines; descriptions are required, stripped of exterior whitespace,
  nonblank and at most 2,000 Unicode code points after normalization. Supplementary
  characters count as one code point. No truncation is performed.
- Quantity is positive and unit price nonnegative, both `NUMERIC(19,6)`.
  VAT is required, between 0 and 100 inclusive, `NUMERIC(7,4)`.
  Amounts and aggregate totals must fit `NUMERIC(19,2)`.
- Exact decimal JSON input is retained as `BigDecimal`. Excess input scale and
  overflow are rejected before SQL; database rounding is not used for validation.
- Net is quantity × price rounded to two decimals using `HALF_UP`. Tax is rounded
  net × VAT / 100, rounded to two decimals using `HALF_UP`. Gross is net + tax.
  Header totals sum stored rounded line amounts.
- `MonetaryPolicy.EUR_V1` owns the immutable calculation rules. Its stable identifier
  `EUR-LINE-NET-TAX-HALF-UP-v1` unambiguously identifies these rules. A rule change
  requires a new versioned identifier. Policy identification and calculated amounts
  are persisted; reads never recalculate historical lines under the current policy.
  `ProposalLimits` owns functional limits. SQL constraints mirror the contract as
  an independent persistence backstop.

Future ThirdParty-specific policy selection requires separate authorization. No
selector infrastructure, configuration table or per-ThirdParty configuration is
introduced by COM-01.

## ThirdParty integrity, security and audit

Creation requires an existing active customer or prospect:
`active && (customer || prospect)`. Supplier alone is insufficient; supplier status
does not disqualify an eligible customer/prospect. Creation holds a ThirdParty
`FOR SHARE` lock until transaction completion and does not modify any ThirdParty
flag. Concurrent reclassification/deactivation or deletion either precedes the
eligibility check or waits for the create transaction. Subsequent flag changes do
not block authorized GET or alter the saved proposal.

A restrictive foreign key protects the ThirdParty relationship. Deletion of a
referenced ThirdParty returns the existing `409 THIRD_PARTY_DELETE_CONFLICT`, with
no cascade, proposal removal or success audit. COM-01 has no unlink/delete API.

POST and PUT require `proposals.manage`; GET requires `proposals.read`. Both permissions
are initially assigned only to `system-admin`; manage does not imply read. Internal
eligibility lookup needs no `thirdparties.read` permission. Existing session and
Bearer authentication apply; session writes require CSRF, Bearer writes do not.
Authorization runs before validation and lookup/disclosure.

Creation and `AuditTrail.recordSuccess(PROPOSAL_CREATED, PROPOSAL, id)` share one
transaction. `OFF` emits no event; `BASIC` and `SELECTIVE` require the success event,
with the authenticated actor and canonical ID but no commercial payload. Required
append failure rolls back header and lines. GET adds no baseline success audit;
authorization denials use the existing static `/api/proposals` resource family.

## Errors and verification

Errors reuse `application/problem+json`, stable codes and English/Spanish
`MessageSource` bundles owned by sales, with generic validation keys from core.

| HTTP | Code / condition |
|---|---|
| 400 | `VALIDATION_REQUIRED`: missing/null required values or blank description |
| 400 | `VALIDATION_INVALID`: unknown/protected fields, invalid types/IDs, scale, bounds, limits or overflow |
| 401 / 403 | Existing authentication, authorization and CSRF rules |
| 404 | `PROPOSAL_NOT_FOUND`: authorized read of a missing positive ID |
| 422 | `SALES_INVALID_THIRD_PARTY` / `SALES_UNSUPPORTED_CURRENCY` |
| 503 | `AUDIT_UNAVAILABLE`: required audit append failed |

The table above retains the COM-01 POST/GET contract. PUT uses this complete catalog:

| HTTP | Code / condition |
|---|---|
| 400 | `VALIDATION_INVALID`: all invalid input, including missing/null members, non-EUR, limits/scales and computed overflow |
| 401 / 403 | Existing authentication, authorization and CSRF rules |
| 404 | `PROPOSAL_NOT_FOUND`: missing root after initial validation |
| 409 | `SALES_VERSION_CONFLICT`: stale expected version, before DRAFT/no-op |
| 409 | `PROPOSAL_INVALID_STATE`: non-DRAFT |
| 409 | `SALES_VERSION_EXHAUSTED`: effective change cannot increment version |
| 409 | `SALES_MONETARY_POLICY_UNAVAILABLE`: effective change requires unavailable stored policy |
| 422 | `SALES_INVALID_THIRD_PARTY`: effective change has an ineligible target |
| 503 | `AUDIT_UNAVAILABLE`: required audit failed; complete rollback |

Problem details use stable codes and sales-owned English/Spanish text. They do not
disclose the current version, document contents or SQL details. Unexpected non-audit
infrastructure errors retain generic server-error handling and are not mislabeled
as audit failures.

`ProposalCalculationTest` and `ProposalControllerTest` cover deterministic money,
validation, HTTP, security and localization. `ProposalPersistenceIT`, selected by
`./bin/check` alongside `PersistenceIT`, uses real PostgreSQL for snapshots, schema,
FKs, transaction rollback and synchronized competing transactions. Focused results
do not replace the mandatory `./bin/test` and `./bin/check` before task closure.
COM-01 introduces no Dolibarr integration or new claim of legacy conformance.

### COM-02 acceptance evidence

The approved scenarios are covered across complementary test layers:

- [ProposalDraftReplacementTest](../src/test/java/es/alxarafe/alixar/sales/ProposalDraftReplacementTest.java): deterministic preparation rules.
- [ProposalDraftControllerTest](../src/test/java/es/alxarafe/alixar/sales/ProposalDraftControllerTest.java): real HTTP/security/parsing boundary with a mocked service; no persistence claim.
- [ProposalDraftPersistenceIT](../src/test/java/es/alxarafe/alixar/sales/infrastructure/ProposalDraftPersistenceIT.java): real PostgreSQL persistence, controlled concurrent connections and rollback of the internal step.
- [ProposalDraftAuditIT](../src/test/java/es/alxarafe/alixar/sales/infrastructure/ProposalDraftAuditIT.java): real shared mutation/audit transactions and authenticated-context actor resolution.
- [ProposalDraftHttpIT](../src/test/java/es/alxarafe/alixar/sales/infrastructure/ProposalDraftHttpIT.java): MockMvc with real PostgreSQL, login/PAT validation, permissions, controller, audited facade and repositories.

| Scenario | Evidence |
|---|---|
| T1 — replace, clear, refill and change ThirdParty | Replacement unit tests, persistence roundtrips and session HTTP replacement flow |
| T2 — renew every line identity; retain root and no-op identities | Persistence ThirdParty-only change and HTTP replacement/no-op assertions |
| T3 — ordered normalized numeric equality; stale no-op conflict | Unit comparison, no-DML persistence observations and HTTP normalization/conflict flow |
| T4 — strict input, inclusive limits and deferred arithmetic | Controller tests, unit boundary tests and HTTP combined-error precedence |
| T5 — same-version writers and no-op races | Persistence tests with distinct backend connections, latches and observed `pg_blocking_pids` |
| T6 — target eligibility, mutation/deletion ordering and initial absence | Persistence locking tests and HTTP inactive-party/no-op behavior |
| T7 — rollback at write and audit failure points | Persistence injection tests, audit insertion/post-append rollback and HTTP 503 aggregate restoration |
| T8 — OFF/BASIC/SELECTIVE, one event, actor and audit failure | Real audit transactions and HTTP session/PAT actor/mode assertions |
| T9 — permissions, CSRF/Bearer, exact response, EN/ES errors and precedence | Controller tests and PostgreSQL HTTP tests; existing POST/GET regression tests |
| T10 — historical snapshots/policy, no-op and unknown-policy rejection | Unit policy tests, persistence historical snapshots and HTTP combined-error/no-op tests |
| T11 — coherent GET during committed replacement | COM-02.1 `ProposalPersistenceIT` plus the actual replacement interleaved with GET in `ProposalDraftPersistenceIT` |
| T12 — version capacity and nonregressing microsecond timestamps | Unit max-version tests, persistence clock/version tests and HTTP max-version no-op/exhaustion |

The non-DRAFT guard uses constructed snapshots; V14 is not relaxed to store future
states. Concurrent PostgreSQL evidence concerns the shared internal persistence
step, not competing network HTTP clients. MockMvc does not establish a deployed
server or Solucar-to-Alixar verification. `./bin/check` explicitly selects all
PostgreSQL suites; focused results still require the complete checks before closure.
