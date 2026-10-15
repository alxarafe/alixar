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

## Implemented

- Canonical Contact read (`GET /api/contacts/{id}`)
- Canonical Contact creation (`POST /api/contacts`)
- Dolibarr adapter for Contact read (anti-corruption layer)
- Real integration verification against `dolibarr-reference` 24.0.1
- PostgreSQL 18.6 persistence infrastructure
- Flyway migration infrastructure
- jOOQ runtime infrastructure (PostgreSQL dialect)

## Planned (Not Implemented)

- Alixar-owned Contact persistence (PostgreSQL + jOOQ)
- Spring Security authentication/authorization
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

## Internationalization (i18n) Architecture

### Module-owned translations

Each functional module owns translations for its own concepts:

- **Core module** (`i18n/core/messages*.properties`): Genuinely cross-module messages and templates (e.g., `validation.required`, `validation.required.title`)
- **Contact module** (`i18n/contact/messages*.properties`): Contact-specific messages (e.g., `contact.notFound`, `contact.invalidThirdPartyReference`, `field.contact.lastName`)

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