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

## Planned (Not Implemented)

- Alixar-owned Contact persistence (PostgreSQL + jOOQ)
- Authorization and protected business capabilities
- Email change with new-address verification
- Administration of other users (creation, listing, edition, enable/disable, administrative reset)
- Granular authorization (roles, permissions, scopes)
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
Authorization Server/grant flows, OpenID Connect, scopes, roles and
machine-to-machine credentials are not implemented. See
[Authentication](authentication.md) for the contract and pending decisions.

## Internationalization (i18n) Architecture

### Module-owned translations

Each functional module owns translations for its own concepts:

- **Core module** (`i18n/core/messages*.properties`): Genuinely cross-module messages and templates (e.g., `validation.required`, `validation.required.title`)
- **Contact module** (`i18n/contact/messages*.properties`): Contact-specific messages (e.g., `contact.notFound`, `contact.invalidThirdPartyReference`, `field.contact.lastName`)
- **Authentication module** (`i18n/authentication/messages*.properties`): Authentication errors and authentication field labels

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
