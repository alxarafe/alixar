# Current implementation status

## Overview

Alixar is the backend and business authority of the Solucar / Alixar ERP. It is under active development with a progressive migration strategy from legacy Dolibarr architecture.

## Implemented capabilities

### Contact

- **Canonical read**: `GET /api/contacts/{id}` — Returns contact in Alixar canonical format
- **Canonical creation**: `POST /api/contacts` — Creates contact through Alixar API
- **Domain/API boundary**: Contact domain model and use cases are owned by Alixar; no Dolibarr types leak into the canonical API
- **Dolibarr anti-corruption adapter**: Legacy Dolibarr fields (`lastname`, `firstname`, `fk_soc`, `socid`, `socname`, `statut`, `array_options`) are transformed to canonical Alixar fields (`lastName`, `firstName`, `thirdPartyId`, etc.) and legacy fields do not appear in responses
- **English/Spanish API error internationalization**: RFC 9457 `ProblemDetail` responses with stable error codes (`VALIDATION_REQUIRED`, `CONTACT_NOT_FOUND`, etc.) and localized human-readable text via module-owned translation bundles (`i18n/core/`, `i18n/contact/`)
- **Real compatibility validation**: Verified against `dolibarr-reference` 24.0.1 through `./bin/check-reference`

### ThirdParty

- **Native canonical creation**: `POST /api/thirdparties` persists a ThirdParty
  through Alixar-owned PostgreSQL/jOOQ infrastructure and returns
  `201 Created` with `Location: /api/thirdparties/{id}` and `{"id": ...}`.
  `name` is required, trimmed and non-blank; booleans default to
  `customer=false`, `prospect=false`, `supplier=false`, `active=true`; optional
  text is trimmed and blank values become `null`. Duplicate names are allowed
- **Native canonical read**: `GET /api/thirdparties/{id}` returns the full
  canonical representation, including `null` for absent optional fields.
  Positive unknown identifiers return `404 THIRD_PARTY_NOT_FOUND`; zero,
  negative and non-numeric identifiers return `400 VALIDATION_INVALID`
- **Strict JSON contract**: Unknown JSON members and invalid member types are
  rejected with `400 VALIDATION_INVALID`; missing, `null` or blank `name`
  returns `400 VALIDATION_REQUIRED`
- **Authorization**: `thirdparties.read` protects reads and
  `thirdparties.manage` protects creation; both are seeded and assigned to
  `system-admin`. They apply identically to session and Bearer authentication
- **CSRF**: Session-authenticated creation requires a valid CSRF token; Bearer
  authentication does not. ThirdParty is not added to any CSRF exclusion
- **Audit**: `THIRD_PARTY_CREATED` (`THIRD_PARTY` / `SUCCESS`) is appended
  atomically with creation under `BASIC` and `SELECTIVE`, recording only the
  canonical identifier. An append failure returns `503 AUDIT_UNAVAILABLE` and
  rolls back the creation. Reads are not audited
- **Pending**: list/filters/pagination, partial update, delete with
  linked-Contact conflict, Solucar UI and historical data migration

### Persistence Infrastructure

- **PostgreSQL 18.6**: Docker Compose service with a pinned image digest, internal
  connectivity, healthcheck, and a persistent development volume retained by `bin/down`
- **Flyway 12.4.0**: Managed by Spring Boot 4.1.1; applies the authentication
  user, password recovery, Personal Access Token, role-based authorization,
  role-administration authorization, audit integrity-core, recovery-token
  audit-authentication, audit-read authorization, persisted
  audit-configuration and native ThirdParty migrations
- **jOOQ runtime**: PostgreSQL dialect and Spring-provided `DSLContext` verified
  with a real `SELECT 1` against PostgreSQL through `PersistenceIT` in `bin/check`
- **Native ThirdParty table**: `third_party` is owned by Alixar, with an
  identity identifier, canonical defaults, storage limits and no legacy column
  names, Contact foreign key or speculative soft-delete
- **Validation isolation**: Each self-contained/reference check owns a fresh Compose
  project and cleans only its own containers, network, and database volume;
  the 452 deterministic tests and 75 PostgreSQL integration tests remain
  enabled

### Authentication

- **Alixar-owned identity**: Stable UUID with unique case-insensitive username
  and email identifiers, adaptive password hash, enabled state, credentials
  version, and timestamps
- **Credential validation**: Login by username or email through an application
  use case that is independent of HTTP session mechanics
- **Initial web authentication**: Spring Security 7.1.1 process-local HTTP
  session with fixation protection, cookie-only tracking, CSRF protection, and
  explicit login, logout and current-user endpoints
- **Password recovery**: Constant-time `forgot`/`reset` endpoints, single-use
  SHA-256-hashed tokens with 30-minute expiry, configurable frontend URL, and an
  SMTP/no-op `PasswordResetNotifier` port. `reset` changes the password, bumps
  `credentials_version`, marks the token used and invalidates other pending
  tokens atomically; `forgot` invalidates and recreates tokens atomically
- **Session revocation**: Sessions created before a credential change, or whose
  user was deleted or disabled, are rejected and invalidated on their next
  request, including on public endpoints
- **Self-service profile management**: The authenticated user can change its own
  username (`PATCH /api/users/me`) and password (`POST /api/users/me/password`).
  A password change bumps `credentials_version`, invalidates pending password
  reset tokens and revokes other sessions while keeping the current session
  authenticated. Changing the email is not implemented
- **Safe bootstrap**: Optional environment-provided initial user with immediate
  adaptive hashing and no fixed credential in source or migration data. The
  bootstrap user is not an administrator unless
  `ALIXAR_BOOTSTRAP_SYSTEM_ADMIN=true` is set explicitly
- **Role-based authorization**: Permissions belong exclusively to roles and
  effective permissions are the union of the permissions of the user's current
  roles. Role changes take effect on the next authenticated request for both
  session and Bearer authentication, without changing `credentials_version`,
  invalidating sessions or revoking PATs. Built-in `system-admin` role contains
  `users.manage`, `roles.manage`, `audit.read`, `audit.configure`,
  `thirdparties.read` and `thirdparties.manage`; there are
  no per-user overrides, explicit `DENY`, role hierarchy or role groups.
  `GET /api/auth/me` exposes the user's current role codes and effective
  permission codes for the current request; these are informational for the
  frontend and never replace backend authorization
- **Administrative authorization management**: `GET /api/admin/roles` is
  available with `users.manage` or `roles.manage`; role detail, creation, rename,
  permission replacement and deletion, together with the read-only
  `GET /api/admin/permissions` catalogue, require `roles.manage`. The
  `roles.manage` permission and `built_in` role metadata are seeded by Flyway,
  and a restrictive foreign key prevents deleting assigned roles. Role creation
  validates every permission before writing, persists the role and its permissions
  transactionally and never assigns it to users. Renaming changes only the name;
  permission replacement is a validated full replacement that leaves users,
  credentials and sessions untouched; deletion is limited to unassigned custom
  roles and returns `ADMIN_ROLE_IN_USE` otherwise. Built-in roles are immutable
  and return `ADMIN_BUILT_IN_ROLE_IMMUTABLE`
- **Administrative user management**: `GET /api/admin/users` (pagination,
  enablement filter and case-insensitive username/email search),
  `GET /api/admin/users/{id}`, `POST /api/admin/users`,
  `PATCH /api/admin/users/{id}`, `PATCH /api/admin/users/{id}/enabled`,
  `POST /api/admin/users/{id}/password-reset` and
  `PUT /api/admin/users/{id}/roles`. New users are created disabled, with only
  explicitly supplied roles and no automatic `system-admin`; user creation and
  role assignment are atomic. Username changes do not alter credentials,
  enablement, roles, sessions or PATs. Disable and administrative reset bump
  `credentials_version` and invalidate pending reset tokens; disable is
  idempotent, enable does not bump the version, and credentials invalidated by
  a disable remain invalid after re-enabling. Role replacement is atomic, full
  replacement, normalizes duplicates, does not change credentials or revoke
  sessions/PATs, and takes effect on the next request. Self-disable and
  self-role replacement are allowed without bypasses or last-administrator
  protection. User endpoints require `users.manage`; role and permission reads
  use the separated authorities described above. Responses exclude secrets
- **API bearer authentication**: Self-service opaque Personal Access Tokens
  (`alx_pat_` prefix, 256-bit random value) presented as
  `Authorization: Bearer <token>`. Only `SHA-256(token)` is stored; the clear
  token is returned once at creation. PATs have mandatory expiry, explicit
  `revoked_at` revocation and `last_used_at` traceability. They are bound to the
  user's `credentials_version`, so password reset/change invalidates them, and
  they coexist with session+CSRF authentication without disabling CSRF globally
- **Scope boundary**: No PAT scopes, per-user permissions, role groups, role
  hierarchy, Contact
  relationship, Dolibarr authentication integration, registration, JWT, OAuth
  server, refresh tokens or machine-to-machine credentials

### Audit

- **Integrity core (T1.1)**: Append-only `audit_event` history with one initial
  `chain_id`, monotonic per-chain sequence, SHA-256 hash chain, canonical format
  v1, transactional `SELECT ... FOR UPDATE` chain-head locking, and an
  independent verifier. PostgreSQL tests append concurrently and tamper directly
  with rows to prove that verification fails.
- **Audit policy and instrumentation
  (T1.2, T1.3a, T1.3b, T1.5a, T1.5b, T1.6a, T1.6b, T1.7a and T1.7b)**: `OFF`
  (default), `BASIC` and `SELECTIVE` modes persisted in the singleton
  `audit_configuration` table. `SELECTIVE` includes the `BASIC` baseline and
  stores read rules for `USER` and `ROLE` in `audit_read_policy`. T1.7b appends
  mandatory `READ_QUERY` / `READ_OBJECT` events for the administrative user and
  role read endpoints and fails closed with `503` when a required append fails.
  `alixar.audit.mode` / `ALIXAR_AUDIT_MODE`
  is a first-start bootstrap value only; once the row exists the database is
  authoritative and an invalid bootstrap value is ignored. A local 15-second
  cache keeps `OFF` free of SQL per audited operation, with a documented
  temporary multi-node visibility delay. Administrative enable/disable records `USER_DISABLED` /
  `USER_ENABLED` only on real transitions. T1.3a adds atomic `SUCCESS` events for
  administrative user creation, username changes, password resets and role
  replacement, self-service username/password changes, and completed password
  recovery. The password recovery event uses the `RECOVERY_TOKEN` authentication
  type; its actor is the user identified by the valid recovery capability, not
  an authenticated session. T1.3b adds `API_TOKEN_CREATED` /
  `API_TOKEN_REVOKED` and `ROLE_CREATED` / `ROLE_RENAMED` /
  `ROLE_PERMISSIONS_REPLACED` / `ROLE_DELETED`. PAT events use the token UUID as
  resource id and never record the clear token or hash. Role events use the
  internal role UUID, not the role code. Revoking an already revoked PAT and
  no-op role rename/permission replacement record no event. Self-revocation is
  audited during the current request with `PAT` as the actor authentication type.
  THIRDPARTY-002A adds `THIRD_PARTY_CREATED` with `THIRD_PARTY` as resource type
  and only the canonical identifier as resource id. The `SUCCESS` event is
  atomic with the business transaction and fail-closed; `SESSION` and `PAT`
  actors are distinguished for authenticated operations. `BASIC` and
  `SELECTIVE` still cover only explicitly instrumented operations.
  T1.5b exposes `GET` / `PUT /api/admin/audit-configuration`. Reads require
  `audit.read` or `audit.configure`; writes require `audit.configure`. A mode
  transition locks the configuration row, updates it, appends
  `AUDIT_MODE_CHANGED_TO_BASIC`, `AUDIT_MODE_CHANGED_TO_SELECTIVE` or
  `AUDIT_MODE_CHANGED_TO_OFF` with `AUDIT_CONFIGURATION` as resource type and
  commits atomically. T1.7a exposes `GET` / `PUT`
  `/api/admin/audit-configuration/read-policy`; replacement is atomic and
  appends one mandatory `AUDIT_READ_POLICY` event per changed rule. No-op
  updates record no event. The local cache is reloaded best-effort after commit,
  with the 15-second TTL as the fallback. T1.6a records `LOGIN_SUCCEEDED` when
  the mode is `BASIC` or `SELECTIVE`, after session creation, as a mandatory
  fail-closed event; if it cannot be persisted, the
  context is cleared, the session is invalidated and login returns `503`
  `AUDIT_UNAVAILABLE`. `LOGIN_FAILED` records no attempted identifier and
  `LOGOUT` records the original user; both use isolated best-effort appends and
  never change the `401` or `204` outcome. These authentication events run under
  both `BASIC` and `SELECTIVE`. T1.6b records `ACCESS_DENIED` when an
  authenticated caller is rejected by an authorization rule.
  The resource is `HTTP_REQUEST` with a static family such as
  `PATCH /api/admin/users`, never the raw path; unknown routes, anonymous
  requests and CSRF rejections are not audited, and an append failure never
  changes the `403`. T1.7b instruments the administrative user and role read
  endpoints under `SELECTIVE`: one `READ_QUERY` per list request at
  `QUERY_ONLY` or `QUERY_AND_OBJECT`, and one `READ_OBJECT` per detail read at
  `QUERY_AND_OBJECT`. `BASIC` never emits read events, and reading the audit
  event API itself is not instrumented. A required read event is appended
  before the response; if it cannot be persisted, the request returns `503`
  `AUDIT_UNAVAILABLE` without resource data. `OFF` records none of these
  events.
- **Audit read and verification API (T1.4a and T1.4b)**: The event query at
  `/api/admin/audit-events` requires `audit.read` and returns chain-scoped
  events with ascending keyset pagination and combinable `action`,
  `resourceType`, `resourceId`, `actorUserId` and `result` filters.
  `afterSequence` defaults to `0`; `limit` defaults to `50` with a maximum of
  `200`. Responses include event identity, actor, action, resource, result,
  `chainId` and hash-chain fields. The verification request at
  `/api/admin/audit-events/verification` also requires `audit.read` and
  verifies the current chain under one read-only `REPEATABLE READ` snapshot.
  Invalid chains return `200` with a stable `failure` identifier, verified-event
  count and optional failed sequence; verification never repairs the chain.
  Reads and verification work when the audit mode is `OFF` and do not append
  events. T1.5a seeds the `audit.configure` permission for `system-admin`.
  Event detail, read event capture beyond the administrative user and role
  reads, retention, archive and checkpoints are not implemented yet. See [Audit](audit.md)

## Transitional integrations

Dolibarr is a **temporary compatibility/reference backend** for capabilities still being migrated. It is:

- **Not** Alixar's domain model
- **Not** Alixar's canonical API
- **Not** normal Alixar infrastructure

The target Alixar architecture does not treat Dolibarr as normal infrastructure or as part of the canonical domain/API model. The `dolibarr-reference` repository exists solely to reproduce and verify observed legacy behaviour during progressive migration.

## Validation

| Script | Purpose | Dependencies |
|--------|---------|--------------|
| `./bin/test` | Deterministic application/component tests | None (Docker only) |
| `./bin/check` | Complete self-contained validation of Alixar | None (Docker only) |
| `./bin/check-reference` | Real Dolibarr compatibility/integration check | Requires sibling `dolibarr-reference` |

See [Development](development.md) for full validation workflow details.

## Not yet implemented

- Alixar-owned persistence for migrated ERP capabilities (Contact still backed by Dolibarr adapter)
- ThirdParty list, partial update and delete: create and read are implemented
  in [ThirdParty](thirdparty.md); list, filters, pagination, update and delete
  with the linked-Contact conflict remain pending (`THIRDPARTY-002B`/`002C`/`002D`)
- ThirdParty Solucar UI and historical data migration
- Role groups, PAT scopes and additional business authorization beyond
  `users.manage`, `roles.manage`, `audit.read`, `audit.configure`,
  `thirdparties.read` and `thirdparties.manage`
- the `FULL` audit mode, read event capture beyond the administrative user and
  role reads, bootstrap and password-reset request events, CSRF-specific audit
  events, audit event detail, retention, purging, archive and signed
  checkpoints
- OAuth 2.x Authorization Server / Authorization Code + PKCE, OpenID Connect
- JWT, refresh tokens, client credentials, machine-to-machine authentication
- Administration of other users' API tokens
- Email change (requires new-address verification)
- Broad ERP functionality beyond the currently implemented slices
