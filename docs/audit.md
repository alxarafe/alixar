# Audit

## Purpose

The audit trail answers security and administration questions such as who
disabled a user, who changed a role's permissions or who accessed a sensitive
resource. It is not a replacement for technical application logs: logs support
diagnosis, while the audit trail is a persistent, append-only history of
relevant actions.

ALIXAR-DEV-003H is being implemented in vertical slices. T1.1 provided the
persistent integrity core. T1.2 added the configurable `OFF` / `BASIC` policy
and the first instrumented administrative operation. T1.3a extends `BASIC` to
administrative user lifecycle operations, self-service credential changes,
completed password recovery, Personal Access Token lifecycle and role
administration. T1.4a adds a read-only query API protected by `audit.read`.
T1.4b adds formal chain verification through HTTP. T1.5a adds the persisted
audit configuration foundation and the `audit.configure` permission. Event
detail, the configuration API, policy-change events, retention, archive and
checkpoints remain out of scope.

## Current scope (T1.1, T1.2, T1.3a, T1.3b, T1.4a, T1.4b and T1.5a)

Implemented:

- append-only `audit_event` persistence;
- one initial chain, identified by `chain_id`;
- monotonic per-chain `sequence`;
- SHA-256 hash chain;
- canonical, versioned event representation;
- transactional chain-head locking with `SELECT ... FOR UPDATE`;
- independent chain verifier;
- PostgreSQL integration and tamper tests;
- `OFF` / `BASIC` audit policy persisted in the singleton
  `audit_configuration` table, with `alixar.audit.mode` used only as the
  first-start bootstrap value;
- `audit.configure` permission seeded and assigned to `system-admin`;
- atomic `SUCCESS` events for administrative user enable/disable;
- atomic `SUCCESS` events for administrative user creation, username changes,
  password resets and role replacement;
- atomic `SUCCESS` events for self-service username and password changes;
- atomic `SUCCESS` event for a password reset completed with a recovery token;
- atomic `SUCCESS` events for Personal Access Token creation and real
  revocation transitions;
- atomic `SUCCESS` events for role creation, rename, permission replacement and
  deletion;
- `RECOVERY_TOKEN` as an audit authentication type;
- `audit.read` permission and a read-only, chain-scoped event query API with
  keyset pagination and combinable filters;
- formal chain verification through `GET /api/admin/audit-events/verification`,
  using one repeatable-read snapshot and a chain-consistent response.

Not implemented yet:

- `SELECTIVE` / `FULL` audit modes;
- the audit configuration API and mandatory policy-change events;
- the PAT identifier as part of the actor;
- bootstrap, login, logout and password-reset request events;
- `FAILURE` and `DENIED` event strategy;
- audit event detail through HTTP;
- auditing read operations;
- retention, purge and archive;
- signed checkpoints or external anchoring;
- payloads with explicit `before` / `after` changes.

## Audit modes

T1.2 defines two modes:

```text
OFF
→ no persistent audit trail

BASIC
→ only events explicitly instrumented as BASIC events
```

`BASIC` does **not** mean full coverage of all administrative or system events.
It currently covers only the events listed below. Additional capabilities must
be instrumented explicitly in later slices.

The effective mode is stored in the singleton `audit_configuration` table. On
the first start, before that row exists, the bootstrap value is read from:

```text
alixar.audit.mode
ALIXAR_AUDIT_MODE
```

The default is `OFF`, so existing deployments do not start writing audit events
until the mode is enabled. Once `audit_configuration` contains a row, the
database is authoritative: `alixar.audit.mode` is ignored, including an invalid
value. An invalid bootstrap value fails startup only when no persisted row
exists. In `OFF`, the operation does not resolve an actor, build an
`AuditEvent`, encode the canonical representation or enter the appender.

### Persisted configuration (T1.5a)

`audit_configuration` holds at most one row. It stores the mode and an
`updated_at` timestamp. The row is created by the application bootstrap using a
race-safe insert that never overwrites an existing row.

Runtime readers use a local in-memory cache refreshed every 15 seconds, so the
normal `OFF` path performs no SQL per audited operation. The cache is local to
each process: another node can take up to 15 seconds to observe a persisted
change. This is a documented temporary multi-node limitation, not a distributed
cache or a definitive consistency mechanism. If a scheduled refresh fails, the
provider keeps the last successfully loaded mode and logs a warning rather than
guessing a different policy.

The T1.5a foundation does not expose a configuration API or write policy-change
audit events. The `audit.configure` permission is seeded and assigned to
`system-admin` so the later configuration API can use it without a migration
change. The existing `audit.read` permission remains separate, and reads,
verification and the future configuration capability work independently of
`OFF`.

## Instrumented events (T1.3a and T1.3b)

The following operations are instrumented atomically under `BASIC`:

| Operation | Action | Resource | Result |
|---|---|---|---|
| Administrative enable/disable transition | `USER_ENABLED` / `USER_DISABLED` | target user id | `SUCCESS` |
| Administrative user creation | `ADMIN_USER_CREATED` | created user id | `SUCCESS` |
| Administrative username change | `ADMIN_USER_USERNAME_CHANGED` | target user id | `SUCCESS` |
| Administrative password reset | `ADMIN_USER_PASSWORD_RESET` | target user id | `SUCCESS` |
| Administrative role replacement | `ADMIN_USER_ROLES_REPLACED` | target user id | `SUCCESS` |
| Self-service username change | `USER_USERNAME_CHANGED` | authenticated user id | `SUCCESS` |
| Self-service password change | `USER_PASSWORD_CHANGED` | authenticated user id | `SUCCESS` |
| Password reset completed with a recovery token | `PASSWORD_RESET_COMPLETED` | recovered user id | `SUCCESS` |
| Personal Access Token creation | `API_TOKEN_CREATED` | `API_TOKEN` / created token id | `SUCCESS` |
| Personal Access Token revocation | `API_TOKEN_REVOKED` | `API_TOKEN` / revoked token id | `SUCCESS` |
| Role creation | `ROLE_CREATED` | `ROLE` / internal role id | `SUCCESS` |
| Role rename | `ROLE_RENAMED` | `ROLE` / internal role id | `SUCCESS` |
| Role permission replacement | `ROLE_PERMISSIONS_REPLACED` | `ROLE` / internal role id | `SUCCESS` |
| Role deletion | `ROLE_DELETED` | `ROLE` / internal role id | `SUCCESS` |

Successful administrative user creation records exactly one event, including
empty role assignments. Role assignment is not recorded as separate events.
Personal Access Token creation and revocation each record at most one event.
Revocation records an event only when the token actually transitions from
active to revoked; revoking an already revoked token is a no-op without an
event. Deleting the token used by the current request is audited during the
request before that token loses validity, with `PAT` as the authentication type.

Role events use the internal `authentication_role.id` UUID, never the role
`code`, as `resource_id`. The role name, permission codes and role code are not
stored as audit payloads. A role rename or permission replacement whose
normalized value does not change records no event. The existing write may still
be executed; only the audit append is suppressed. The use case computes the
change while it already has the normalized current state, and the transactional
facade remains the single owner of the audit append.

Username and role replacement are no-ops when the normalized value or role set
does not change. A no-op does not record an event. The use case computes the
change while it already has the normalized current state; the transactional
facade remains the single owner of the audit append.

The event uses:

```text
action       action from the table above
resource     USER / target or authenticated user id
             API_TOKEN / token id
             ROLE / internal role id
result       SUCCESS
actor        authenticated administrator, self-service user or token owner
auth type    SESSION | PAT
request id   null (deferred)
```

A completed password reset uses:

```text
actor user id     user identified by the valid recovery capability
actor username    username of that user at reset time
auth type         RECOVERY_TOKEN
resource          USER / same user id
```

`RECOVERY_TOKEN` does not mean that an HTTP session authenticated the actor. The
actor is the user who proved control of a valid, single-use recovery token. The
token value, token hash and new password are never stored in the event.

For a self-service username change, `actor_username` is the previous username
snapshot. It intentionally differs from the new username stored on the user
record.

The event is recorded in the same transaction as the business change. When
`BASIC` requires the event, a failure while inserting the event, calculating the
hash chain or updating the chain head rolls back the business change. A
successful `BASIC` operation must never leave the user changed without its audit
event. This includes user creation, password reset token consumption, credential
version increments, role replacement and pending-token invalidation.

The actor is resolved from the Spring Security context by infrastructure code
for session and PAT operations. The PAT filter marks the request so the resolver
can distinguish `PAT` from `SESSION` without changing the serialized principal.
If an authenticated operation under `BASIC` cannot resolve its actor, the
operation fails; it does not write a null actor or fall back to `SYSTEM`.
Password recovery supplies its actor explicitly through the `AuditTrail` port;
`SYSTEM` remains reserved for future internal processes.

The clear PAT is never recorded. The PAT UUID is recorded as the resource id for
`API_TOKEN_CREATED` and `API_TOKEN_REVOKED`, but the actor still does not include
the specific PAT used to authenticate; that actor detail remains deferred.

## Conceptual evolution

The audit mode is expected to evolve through:

```text
OFF
BASIC
SELECTIVE
FULL
```

`OFF` and `BASIC` exist today. `SELECTIVE` and `FULL` will eventually allow
policy by resource type, action and read depth. Deep read auditing is expected
to support:

```text
NONE
QUERY_ONLY
OBJECT
EACH_RETURNED_OBJECT
```

A search returning many objects must not generate one event per object unless an
explicit policy requires it.

## Read API (T1.4a)

`GET /api/admin/audit-events` returns audit events from the current default
chain. It requires the `audit.read` permission for both session and Bearer
authentication.

Accepted query parameters:

```text
afterSequence
limit
action
resourceType
resourceId
actorUserId
result
```

`afterSequence` defaults to `0` and must not be negative. `limit` defaults to
`50` and must be between `1` and `200`. Every filter is optional and filters are
combinable. `action`, `resourceType` and `result` use their canonical enum
identifiers; `actorUserId` must be a UUID.

Results are ordered by ascending `sequence`. Pagination is keyset-based: the
client sends the last sequence it received as the next `afterSequence`. The
sequence is scoped to the event chain, so the response includes `chainId` and
the query model is already chain-scoped. This slice reads the current default
chain; a future multi-chain API can add an explicit chain selector without
changing event identity.

Each returned event contains:

```text
id
chainId
sequence
occurredAt
actorUserId
actorUsername
authenticationType
action
resourceType
resourceId
result
requestId
integrityFormatVersion
previousHash
eventHash
```

`requestId` is currently `null` because request correlation identifiers are not
implemented yet. Negative values, limits outside the accepted range, malformed
UUIDs and unknown enum values return `400` with code `AUDIT_INVALID_QUERY` and a
`field` property. An anonymous request returns `401`; an authenticated caller
without `audit.read` returns `403`.

Reads work independently of `OFF` / `BASIC`, and a read does not append an audit
event. Auditing the read operation itself is deferred to `SELECTIVE` / `FULL`
read-depth policy. T1.4a adds no speculative database index and no total-count
metadata.

## Verification API (T1.4b)

`GET /api/admin/audit-events/verification` verifies the current default chain
and requires the same `audit.read` permission as the event query API. It returns
`200 OK` for both valid and invalid chains; an invalid chain is a verification
result, not a request error.

The response contains only:

```text
chainId
valid
checkedEvents
failure
failedSequence
```

`failure` is a stable `AuditVerificationFailure` identifier, such as
`EVENT_HASH_MISMATCH`, `EVENT_MISSING` or `HEAD_HASH_MISMATCH`. It is `null`
when `valid` is `true`. `failedSequence` is the sequence associated with the
first failure, or `null` when the failure is not attributable to a specific
event, such as a missing chain head or a final head-hash mismatch.

For a valid chain, `checkedEvents` is the number of events verified. For an
invalid chain, it is the number of events verified correctly before the first
failure. The response intentionally does not expose expected hashes, actual
hashes, stack traces, SQL or persistence details.

Verification runs in a read-only `REPEATABLE READ` transaction. The chain head,
every event batch and the final consistency checks therefore use one PostgreSQL
snapshot. A concurrent append may be visible before or after that snapshot, but
it cannot produce a mixed result or a false failure.

Verification never repairs, updates or deletes audit data. A tampered chain
continues to fail on subsequent requests. It works independently of `OFF` /
`BASIC`, does not append an audit event, and adds no migration, index or read
auditing. Event detail through HTTP remains deferred until a real consumer needs
it.

## Event model

An audit event represents at least:

```text
event id
chain id
sequence
occurred at
actor user id
actor username snapshot
authentication type
action
resource type
resource id
result
request or correlation id
integrity format version
previous hash
event hash
```

Actor authentication types are currently:

```text
SESSION
PAT
SYSTEM
RECOVERY_TOKEN
```

Results are currently:

```text
SUCCESS
FAILURE
DENIED
```

Audit events must never contain passwords, password hashes, clear PATs, reset
tokens, authorization headers, session cookies, SMTP secrets or equivalent
secrets. If a PAT participates, only its opaque token identifier may be stored,
never the token itself.

`actor_user_id` intentionally has no foreign key to `authentication_user`. The
audit history must survive user deletion, and `actor_username` is a snapshot
that is not updated when the user later changes its username.

## Persistence model

### `audit_chain_head`

```text
chain_id UUID PRIMARY KEY
last_sequence BIGINT NOT NULL
last_hash VARCHAR(64) NOT NULL
updated_at TIMESTAMPTZ NOT NULL
```

The initial row is created by migration with `last_sequence = 0` and the
genesis hash (64 zeroes). The default chain identifier is:

```text
00000000-0000-0000-0000-000000000001
```

The schema supports multiple chains, but T1.1 uses only the default chain.

### `audit_event`

```text
id UUID PRIMARY KEY
chain_id UUID NOT NULL
sequence BIGINT NOT NULL
occurred_at TIMESTAMPTZ NOT NULL
actor_user_id UUID NULL
actor_username VARCHAR(100) NULL
authentication_type VARCHAR(16) NULL
action VARCHAR(100) NOT NULL
resource_type VARCHAR(100) NULL
resource_id VARCHAR(255) NULL
result VARCHAR(16) NOT NULL
request_id VARCHAR(128) NULL
integrity_format_version SMALLINT NOT NULL
previous_hash VARCHAR(64) NOT NULL
event_hash VARCHAR(64) NOT NULL
```

Constraints:

- `(chain_id, sequence)` is unique;
- `(chain_id, event_hash)` is unique;
- `chain_id` references `audit_chain_head(chain_id) ON DELETE RESTRICT`;
- authentication type and result are restricted to the known values;
- hashes are constrained to 64 lowercase hexadecimal characters.

The chain-head foreign key is deliberately non-destructive. Deleting a chain
head cannot delete audit history.

Retention metadata (`expires_at`, `legal_hold`) is deliberately not part of
`audit_event` yet. When retention is designed, immutable event history and
mutable retention state will be separated, for example:

```text
audit_event
  -> immutable, hashed history

audit_event_retention
  -> purge_after
  -> legal_hold
  -> operational retention metadata
```

This avoids authenticating mutable retention decisions today only to exclude
them later.

## Canonical representation v1

Integrity is not calculated from arbitrary JSON produced by a general-purpose
serializer. The canonical representation is explicit, deterministic and
versioned. Format version 1 is fully specified here.

### Rules

- Encoding is UTF-8.
- Lines are separated by a single LF (`0x0A`). CR is never used.
- The first line is the literal `ALXAR-AUDIT-EVENT`.
- Every following line has the form `name=<length>:<value>`.
- `<length>` is the number of UTF-8 bytes in `<value>`, written in base 10 with
  no leading zeroes.
- A null value is encoded as `name=-1:` with no bytes after the colon.
- The literal string `null` is encoded as `name=4:null`, so it is unambiguous
  with respect to a null value.
- Integers use base 10 with no leading zeroes.
- UUIDs use their canonical lowercase form.
- Timestamps are UTC, rendered as `uuuu-MM-dd'T'HH:mm:ss.SSSSSS'Z'` with
  exactly six fractional digits (microseconds).
- Hashes are SHA-256, rendered as 64 lowercase hexadecimal characters.
- The fields appear exactly in the order listed below.
- The final field line also ends with LF.
- `event_hash` is not part of its own input.

### Fields

```text
ALXAR-AUDIT-EVENT
integrity_format_version=<length>:<value>
event_id=<length>:<value>
chain_id=<length>:<value>
sequence=<length>:<value>
occurred_at=<length>:<value>
actor_user_id=<length>:<value> | -1:
actor_username=<length>:<value> | -1:
authentication_type=<length>:<value> | -1:
action=<length>:<value>
resource_type=<length>:<value> | -1:
resource_id=<length>:<value> | -1:
result=<length>:<value>
request_id=<length>:<value> | -1:
previous_hash=<length>:<value>
```

`integrity_format_version` is part of the authenticated bytes. It is not only a
selector for choosing an encoder.

### Hash definition

```text
canonical_v1(event)
  includes previous_hash exactly once

event_hash = SHA-256(canonical_v1(event))
```

`previous_hash` is not appended a second time. `event_hash` covers every field
listed above, including the event identifier, chain identifier, sequence,
timestamp, actor snapshot, action, resource, result, request identifier,
integrity format version and previous hash.

### Example

```text
ALXAR-AUDIT-EVENT
integrity_format_version=1:1
event_id=36:123e4567-e89b-12d3-a456-426614174000
chain_id=36:00000000-0000-0000-0000-000000000001
sequence=1:1
occurred_at=27:2026-10-21T12:34:56.123456Z
actor_user_id=-1:
actor_username=5:Alice
authentication_type=7:SESSION
action=13:USER_DISABLED
resource_type=4:USER
resource_id=36:9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d
result=7:SUCCESS
request_id=-1:
previous_hash=64:0000000000000000000000000000000000000000000000000000000000000000
```

## Append transaction and concurrency

An append runs in a single transaction:

```text
BEGIN

SELECT last_sequence, last_hash
FROM audit_chain_head
WHERE chain_id = ?
FOR UPDATE

sequence = last_sequence + 1
previous_hash = last_hash
event_hash = SHA-256(canonical_v1(event))

INSERT INTO audit_event ...
UPDATE audit_chain_head
SET last_sequence = sequence, last_hash = event_hash

COMMIT
```

The row lock on the chain head serializes concurrent writers for the same
chain, so two transactions cannot use the same parent. A PostgreSQL sequence is
not used for `sequence`, because a rolled-back insert would create a gap.

## Verification

The verifier depends on the `AuditChainSource` port, not on PostgreSQL or jOOQ.
It can later read from the database, an exported JSONL archive or a standalone
CLI without changing verification rules. The HTTP verification API wraps the
entire verifier execution in a read-only `REPEATABLE READ` transaction so a
concurrent append cannot mix chain-head and event snapshots.

Verification checks:

1. the chain head exists;
2. events are contiguous from sequence 1 to `last_sequence`;
3. every event belongs to the expected chain;
4. every event uses a supported integrity format version;
5. every `previous_hash` matches the previous event hash, or the genesis hash
   for the first event;
6. every `event_hash` matches `SHA-256(canonical_v1(event))`;
7. there are no events beyond the declared chain head;
8. the final event hash matches `audit_chain_head.last_hash`.

Tests manipulate PostgreSQL directly, bypassing the application, to prove that
modifying a historical field, deleting an intermediate event, changing
`previous_hash`, changing `event_hash` or changing the sequence/order makes
verification fail. Additional tests prove that HTTP verification returns
`200` with `valid=false` without repairing the chain, that a repeated request
fails the same way, and that a concurrent append during verification either
falls entirely before or entirely after the snapshot.

A valid chain does not prove that a database administrator with complete control
could not rewrite both the events and the chain head. Signed checkpoints and
external anchoring are future capabilities.

## Append-only policy

There is no application operation to update or delete an individual audit event.
Event rows are append-only from the application's point of view.

Database-level append-only enforcement with a restricted runtime role is not
implemented yet. Such a role must be able to insert events and update chain
heads without gaining `UPDATE` or `DELETE` on `audit_event`.

## Deferred capabilities

The following capabilities are intentionally deferred and must not be blocked by
the current design:

- `SELECTIVE` and `FULL` modes by resource type, action and read depth;
- the audit configuration API and mandatory policy-change events (T1.5b);
- instrumentation of bootstrap, login, logout and password-reset requests;
- atomic `SUCCESS` events for further business operations as they are
  instrumented;
- an explicit strategy for `FAILURE` and `DENIED` events, separate from the
  business transaction;
- the PAT identifier in audit events;
- request/correlation identifiers;
- `GET /api/admin/audit-events/{id}`;
- auditing read operations under `SELECTIVE` / `FULL`;
- retention state, `purge_after`, `legal_hold`, batched internal purge and purge
  summary events;
- archive before purge, with a verifiable JSON Lines package:

  ```text
  manifest.json
  events.jsonl
  checksums.sha256
  ```

- archive continuity metadata such as first/last sequence, initial previous
  hash, final hash, event count, algorithm and format version;
- local-directory archive first, with future S3-compatible, Azure Blob, Google
  Cloud Storage or immutable/WORM destinations;
- periodic signed checkpoints, asymmetric signatures and external anchoring;
- purpose, reason and case/reference extensions for sensitive sectors;
- minimized, explicitly configured IP and User-Agent capture;
- before/after change payloads with `AUDITABLE`, `REDACTED`, `HASHED` and
  `NOT_AUDITABLE` field classification.
