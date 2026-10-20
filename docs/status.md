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

### Persistence Infrastructure

- **PostgreSQL 18.6**: Docker Compose service with a pinned image digest, internal
  connectivity, healthcheck, and a persistent development volume retained by `bin/down`
- **Flyway 12.4.0**: Managed by Spring Boot 4.1.1; applies the authentication
  user, password recovery, Personal Access Token and role-based authorization
  migrations
- **jOOQ runtime**: PostgreSQL dialect and Spring-provided `DSLContext` verified
  with a real `SELECT 1` against PostgreSQL through `PersistenceIT` in `bin/check`
- **Validation isolation**: Each self-contained/reference check owns a fresh Compose
  project and cleans only its own containers, network, and database volume;
  the 183 deterministic tests and 29 PostgreSQL integration tests remain
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
  `users.manage`; there are no per-user overrides, explicit `DENY`, role
  hierarchy or role groups
- **Administrative user management**: `GET /api/admin/users` (pagination,
  enablement filter and case-insensitive username/email search),
  `GET /api/admin/users/{id}`, `GET /api/admin/roles`,
  `POST /api/admin/users`,   `PATCH /api/admin/users/{id}`,
  `PATCH /api/admin/users/{id}/enabled`,
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
  protection. All endpoints require `users.manage` for session and Bearer
  authentication and responses exclude secrets
- **API bearer authentication**: Self-service opaque Personal Access Tokens
  (`alx_pat_` prefix, 256-bit random value) presented as
  `Authorization: Bearer <token>`. Only `SHA-256(token)` is stored; the clear
  token is returned once at creation. PATs have mandatory expiry, explicit
  `revoked_at` revocation and `last_used_at` traceability. They are bound to the
  user's `credentials_version`, so password reset/change invalidates them, and
  they coexist with session+CSRF authentication without disabling CSRF globally
- **Scope boundary**: No PAT scopes, per-user permissions, role groups, role
  hierarchy, Contact relationship, Dolibarr authentication integration,
  registration, JWT, OAuth server, refresh tokens or machine-to-machine
  credentials

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
- Role groups, PAT scopes and authorization for business capabilities beyond `users.manage`
- OAuth 2.x Authorization Server / Authorization Code + PKCE, OpenID Connect
- JWT, refresh tokens, client credentials, machine-to-machine authentication
- Administration of other users' API tokens
- Email change (requires new-address verification)
- Broad ERP functionality beyond the currently implemented slices
