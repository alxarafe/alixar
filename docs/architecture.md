# Architecture

## Overview

**Solucar → frontend**  
**Alixar  → backend and business authority**

Alixar is the Java/Spring Boot backend for the Alixar ERP. It owns business rules, provides the canonical API, manages persistence, and handles authentication and authorization.

## Approved Decisions

| Decision | Status |
|----------|--------|
| Java 25 LTS | Approved |
| Spring Boot 3.4.x (stable, compatible with Java 25) | Approved |
| Maven + Maven Wrapper | Approved |
| Docker + Docker Compose as only supported environment | Approved |
| Modular monolith | Approved |
| Pragmatic hexagonal architecture | Approved |
| API-first | Approved |
| Domain isolated from infrastructure (Spring, HTTP, JSON, jOOQ, Flyway, Docker, Dolibarr, llx_*) | Approved |
| Legacy boundary: no code copied from alixar-legacy or Dolibarr | Approved |
| Apache-2.0 license | Approved |

## Planned (Not Implemented)

- PostgreSQL persistence
- Flyway migrations
- jOOQ for type-safe SQL
- Spring Security authentication/authorization
- OpenAPI specification
- ERP modules (thirdparties, catalog, sales, billing, inventory, accounting)
- Module system
- Dolibarr adapters
- Testcontainers for integration tests
- Bruno for API conformance tests
- Event-driven architecture
- Advanced observability
- Embedded AI

## Not Implemented

Everything not listed as "Approved" above.

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