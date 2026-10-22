# Architecture

## Overview

**Solucar → frontend**  
**Alixar  → backend and business authority**

Alixar is the Java/Spring Boot backend for the Alixar ERP. It owns business rules, provides the canonical API, manages persistence, and handles authentication and authorization.

## Approved Decisions

| Decision | Status |
|----------|--------|
| Java 25 LTS | Approved |
| Spring Boot 4.1.1 (stable, compatible with Java 25) | Approved |
| Maven + Maven Wrapper | Approved |
| Docker + Docker Compose as only supported environment | Approved |
| Modular monolith | Approved |
| Pragmatic hexagonal architecture | Approved |
| API-first | Approved |
| Domain isolated from infrastructure (Spring, HTTP, JSON, jOOQ, Flyway, Docker, Dolibarr, llx_*) | Approved |
| Legacy boundary: no code copied from alixar-legacy or Dolibarr | Approved |
| Apache-2.0 license | Approved |
| PostgreSQL 18.6 for persistence | Approved |
| Flyway for database migrations | Approved |
| jOOQ for type-safe SQL | Approved |
| Spring Security 7.1.1 for the initial web-session authentication foundation | Approved |
| Opaque Personal Access Tokens presented as Bearer tokens for independent API consumers | Approved |
| RBAC with permissions assigned exclusively to roles and no per-user overrides | Approved |
| Append-only audit trail with a versioned canonical SHA-256 hash chain | Approved |

## Implemented

- Canonical Contact read (`GET /api/contacts/{id}`)
- Canonical Contact creation (`POST /api/contacts`)
- Dolibarr adapter for Contact read (anti-corruption layer)
- Real integration verification against `dolibarr-reference` 24.0.1
- PostgreSQL 18.6 persistence infrastructure
- Flyway migration infrastructure
- jOOQ runtime infrastructure (PostgreSQL dialect)
- Alixar-owned authentication users persisted through Flyway and jOOQ
- Username/email credential validation with adaptive password hashing
- Initial Spring Security HTTP-session authentication for web clients
- Self-service management of the authenticated identity (own username and own
  password; password change invalidates pending reset tokens and other sessions)
- Opaque Bearer Personal Access Tokens for independent API consumers, with
  SHA-256-hash-only persistence, mandatory expiry, explicit revocation,
  `credentials_version` binding and coexistence with session+CSRF
- Role-based authorization with permissions assigned exclusively to roles,
  effective permissions resolved from persistence on every authenticated
  request, deny-by-default policy, and identical authorization for session and
  Bearer authentication. Built-in `system-admin` role with `users.manage`,
  `roles.manage`, `audit.read` and `audit.configure`; read-only permission
  catalogue; role detail,
  creation, rename, permission replacement and deletion of unassigned custom
  roles; administrative reads, creation of disabled users, username changes,
  enablement changes, password resets and full role replacement
- Append-only audit event persistence with per-chain sequence, chain-head
  locking, canonical format v1, SHA-256 hash chain and an independent verifier.
  `OFF` / `BASIC` policy and atomic events for administrative user enablement,
  creation, username changes, password resets and role replacement, self-service
  username/password changes, completed password recovery, Personal Access Token
  creation/revocation, and role creation/rename/permission-replacement/deletion
  are implemented. Recovery-token events use `RECOVERY_TOKEN` and explicitly
  identify the recovered user as actor. T1.4a adds the `audit.read` permission
  and a read-only `GET /api/admin/audit-events` API with chain-scoped keyset
  pagination and combinable filters. T1.4b adds chain verification at
  `/api/admin/audit-events/verification`, which verifies the chain under one
  read-only repeatable-read snapshot. T1.5a adds the singleton persisted
  `audit_configuration` table, with `alixar.audit.mode` used only to bootstrap
  the first row, and seeds the `audit.configure` permission. Event detail, the
  configuration API, policy-change events, read auditing, the PAT identifier as
  actor, retention, archive and checkpoints are not implemented yet. See
  [Audit](audit.md)

## Planned (Not Implemented)

- `SELECTIVE` / `FULL` audit modes, the audit configuration API and mandatory
  policy-change events, the PAT identifier as actor, audit event detail, read
  auditing, retention, purge, archive and signed checkpoints

- Alixar-owned Contact persistence (PostgreSQL + jOOQ)
- Email change with new-address verification
- Role groups
- PAT scopes and authorization for business capabilities beyond `users.manage`,
  `roles.manage`, `audit.read` and `audit.configure`
- OAuth 2.x Authorization Server / Authorization Code + PKCE, OpenID Connect
- JWT, refresh tokens, client credentials, machine-to-machine authentication
- OpenAPI specification
- ERP modules (thirdparties, catalog, sales, billing, inventory, accounting)
- Module system
- Testcontainers for integration tests
- Bruno for API conformance tests
- Event-driven architecture
- Advanced observability
- Embedded AI

## Not Implemented

Everything not listed as "Approved" or "Implemented" above.

## Domain Boundary

The domain layer must not depend directly on:
- Spring
- HTTP
- JSON
- jOOQ
- Flyway
- Docker
- Dolibarr
- llx_* naming conventions

This rule applies when domain code is introduced in future tasks.

## Legacy Boundary

`alixar-legacy` and Dolibarr are references for behavior and knowledge only.
- No code copying from either
- No package/file imports from `alixar-legacy`

## Authentication Boundary

Credential validation depends on application ports for user persistence and
password hashing. It does not depend on HTTP sessions or Spring Security.
Spring Security adapts a validated Alixar user into an authenticated principal
and persists that principal in the servlet session.

Independent API consumers authenticate with opaque Personal Access Tokens. The
application layer resolves a token hash, validates expiry, revocation, the
user's enabled state and `credentials_version`, and returns the same user
identity; the Spring Security adapter turns it into the same
`AuthenticatedUserPrincipal` without creating an HTTP session. PAT management
is self-service and limited to the authenticated user's own tokens. JWT, OAuth
Authorization Server/grant flows, OpenID Connect, PAT scopes and
machine-to-machine credentials are not implemented. See
[Authentication](authentication.md) for the contract and pending decisions.

## Authorization Boundary

Authentication and authorization are independent. An enabled user can
authenticate with zero roles. Permissions belong exclusively to roles and
effective permissions are the union of the permissions of the user's current
roles; there are no per-user permission overrides, no explicit `DENY` and no
hierarchy of roles.

The application layer exposes role assignment and effective-permission
resolution through ports and use cases. The Spring Security adapter resolves
the current permissions on every authenticated request, after credential
validation and before authorization, and converts them into `GrantedAuthority`
values. It works identically for session and Bearer authentication. Role changes
therefore take effect on the next request without changing
`credentials_version`, invalidating the session or revoking PATs.

Business code authorizes by permission (`hasAuthority("users.manage")`,
`hasAuthority("roles.manage")` or `hasAuthority("audit.read")`), not by role
name. `system-admin` is an administrative grouping of permissions and has no
authorization special case.
Administrative reads resolve user summaries, user detail, the role catalogue,
role detail, the permission catalogue and the chain-scoped audit event list
through application use cases behind dedicated ports. Role creation validates
the complete permission set before writing and uses an infrastructure-owned
transaction for the role and its permissions. Role rename, permission replacement and deletion reuse the same
transactional facade; built-in role protection and assignment checks run in the
application use cases, while a restrictive foreign key remains the final guard
against deleting an assigned role. User creation and username changes also run
through application use cases; the infrastructure facade owns the transaction
that keeps a new user and its role assignments atomic. A restrictive foreign key
protects assigned roles from deletion independently of application checks. See
[Authentication](authentication.md) for the RBAC model and the administrative
namespace.

## Audit Boundary

The audit trail is separate from technical application logs. The current
implementation owns an append-only `audit_event` history and a per-chain head.
Events are linked by a SHA-256 hash over an explicit, versioned canonical
representation; integrity does not depend on an arbitrary JSON serialization.

Application code has no operation to update or delete an individual event. The
verifier depends on a read-only `AuditChainSource` port rather than PostgreSQL or
jOOQ, so the same verification core can later consume exported archives.

The effective audit mode is persisted in the singleton `audit_configuration`
table. `alixar.audit.mode` is a bootstrap-only value used when the table is
empty; once a row exists the database is authoritative and an invalid bootstrap
value is ignored rather than preventing startup. A local cache refreshed every
15 seconds keeps the `OFF` path free of SQL per audited operation and introduces
a temporary multi-node visibility delay. In `BASIC`, explicitly instrumented
successful operations record their event in the same transaction as the business
change. The instrumented set includes administrative user lifecycle operations,
self-service username and password changes, completed password recovery,
Personal Access Token creation and revocation, and role creation, rename,
permission replacement and deletion. The application layer depends on an
`AuditTrail` port and an `AuditPolicyProvider` port, not on environment variables,
Spring Security or jOOQ. Authenticated operations resolve their actor
implicitly; password recovery supplies an explicit `RECOVERY_TOKEN` actor. Every
mandatory event is fail-closed. The `audit.read` permission, the read-only event
query API and HTTP chain verification are implemented. Verification runs inside
one read-only `REPEATABLE READ` transaction so its head and event reads share a
consistent snapshot. The `audit.configure` permission is seeded, but the
configuration API and mandatory policy-change events are not implemented yet.
Database-level append-only privileges, event detail, read auditing, the PAT
identifier as actor, retention and signing are also not implemented. See
[Audit](audit.md) for the canonical format and deferred capabilities.

## Internationalization (i18n) Architecture

### Module-owned translations

Each functional module owns translations for its own concepts:

- **Core module** (`i18n/core/messages*.properties`): Genuinely cross-module messages and templates (e.g., `validation.required`, `validation.required.title`)
- **Contact module** (`i18n/contact/messages*.properties`): Contact-specific messages (e.g., `contact.notFound`, `contact.invalidThirdPartyReference`, `field.contact.lastName`)
- **Authentication module** (`i18n/authentication/messages*.properties`): Authentication errors and authentication field labels
- **Audit module** (`i18n/audit/messages*.properties`): Audit query errors and audit field labels

### Localization boundary

- Application/domain layers carry stable machine-readable identifiers: error codes, field names, message arguments
- Presentation/infrastructure boundary (`ControllerAdvice`, `MessageSource`) resolves localized human-readable text
- Application code does not depend on `MessageSource`, `Locale`, `Accept-Language`, `ProblemDetail`, or HTTP

### Canonical error representation

Errors use RFC 9457 `ProblemDetail` with stable identifiers:

```json
{
  "type": "urn:alixar:error:validation-required",
  "title": "Validation Error",
  "status": 400,
  "detail": "The field Last name is required.",
  "code": "VALIDATION_REQUIRED",
  "field": "lastName"
}
```

- `type`: Stable URN identifier (non-localized, machine-readable)
- `title`: Localized short summary via `MessageSource`
- `detail`: Localized descriptive message via parameterized template resolution
- `code`: Stable error code (non-localized)
- `field`: Canonical API field name when applicable (non-localized)

### Nested message resolution

Reusable validation templates receive localized field labels:

```properties
validation.required=The field {0} is required.
validation.required.title=Validation Error
field.contact.lastName=Last name
```

Resolution: `validation.required` receives `field.contact.lastName` (localized) as `{0}` argument.

### Supported locales

- Default/fallback: English (`en`)
- Supported: `en`, `es` (including regional variants like `es-ES`)
- Resolution: HTTP `Accept-Language` header via Spring `AcceptHeaderLocaleResolver`
