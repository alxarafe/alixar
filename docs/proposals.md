# Proposal creation and read (COM-01)

Alixar owns independent proposal drafts and their persisted monetary snapshots.
The HTTP API exposes creation and single-object consultation. The approved contract
is recorded in [COM-001 design](design/ALIXAR-COM-001-proposal-order-design.md).
No editing, validation, business acceptance/refusal, orders, conversion or automation
is available.

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
bean and is not exposed through `TransactionalProposalService` or HTTP. It requires
an enclosing, explicitly configured writable `READ COMMITTED` transaction; its
mandatory transaction participation cannot commit separately. A failure marks the
enclosing transaction for rollback even if its caller catches that failure.
This keeps the step available for later audit orchestration without exposing an
unaudited public replacement operation.

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
between GET's two queries to check the COM-02.1 snapshot guarantee. These tests do
not establish replacement HTTP or modification-audit behavior: both integrations
remain pending, and no `PROPOSAL_UPDATED` event is implemented here.

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

POST requires `proposals.manage`; GET requires `proposals.read`. Both permissions
are initially assigned only to `system-admin`; manage does not imply read. Internal
eligibility lookup needs no `thirdparties.read` permission. Existing session and
Bearer authentication apply; session creation requires CSRF, Bearer creation does
not. Authorization runs before lookup/disclosure.

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

`ProposalCalculationTest` and `ProposalControllerTest` cover deterministic money,
validation, HTTP, security and localization. `ProposalPersistenceIT`, selected by
`./bin/check` alongside `PersistenceIT`, uses real PostgreSQL for snapshots, schema,
FKs, transaction rollback and synchronized competing transactions. Focused results
do not replace the mandatory `./bin/test` and `./bin/check` before task closure.
COM-01 introduces no Dolibarr integration or new claim of legacy conformance.
