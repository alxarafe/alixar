# Audit

## Purpose

The audit trail answers security and administration questions such as who
disabled a user, who changed a role's permissions or who accessed a sensitive
resource. It is not a replacement for technical application logs: logs support
diagnosis, while the audit trail is a persistent, append-only history of
relevant actions.

ALIXAR-DEV-003H is being implemented in vertical slices. The current slice,
T1.1, provides the persistent integrity core only. Audit modes, RBAC
permissions, instrumentation, query APIs, retention, archive and checkpoints
are not implemented yet.

## Current scope (T1.1)

Implemented:

- append-only `audit_event` persistence;
- one initial chain, identified by `chain_id`;
- monotonic per-chain `sequence`;
- SHA-256 hash chain;
- canonical, versioned event representation;
- transactional chain-head locking with `SELECT ... FOR UPDATE`;
- independent chain verifier;
- PostgreSQL integration and tamper tests.

Not implemented yet:

- `OFF` / `BASIC` / `SELECTIVE` / `FULL` audit modes;
- `audit.read` and `audit.configure` permissions;
- instrumentation of authentication, PAT, user or role operations;
- `SUCCESS`, `FAILURE` and `DENIED` transaction strategy;
- administrative query API;
- retention, purge and archive;
- signed checkpoints or external anchoring;
- payloads with explicit `before` / `after` changes.

## Conceptual evolution

The audit mode is expected to evolve through:

```text
OFF
BASIC
SELECTIVE
FULL
```

Only the integrity core exists today. `OFF` and `BASIC` will be implemented in a
later slice. `SELECTIVE` and `FULL` will eventually allow policy by resource
type, action and read depth. Deep read auditing is expected to support:

```text
NONE
QUERY_ONLY
OBJECT
EACH_RETURNED_OBJECT
```

A search returning many objects must not generate one event per object unless an
explicit policy requires it.

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
CLI without changing verification rules.

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
verification fail.

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

- `OFF` and `BASIC` modes, decided before building expensive payloads;
- `SELECTIVE` and `FULL` modes by resource type, action and read depth;
- `audit.read` and `audit.configure` permissions supplied by migration;
- instrumentation of login, logout, password changes, password resets, PAT
  creation/revocation, user administration and role administration;
- atomic `SUCCESS` events in the same transaction as the business change;
- an explicit strategy for `FAILURE` and `DENIED` events, separate from the
  business transaction;
- `GET /api/admin/audit-events` and `GET /api/admin/audit-events/{id}`;
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
