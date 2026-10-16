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
- **Flyway 12.4.0**: Managed by Spring Boot 4.1.1; verified startup with zero
  migrations and an empty schema history table, without a fictitious initial migration
- **jOOQ runtime**: PostgreSQL dialect and Spring-provided `DSLContext` verified
  with a real `SELECT 1` against PostgreSQL through `PersistenceIT` in `bin/check`
- **Validation isolation**: Each self-contained/reference check owns a fresh Compose
  project and cleans only its own containers, network, and database volume;
  the 45 existing deterministic tests remain enabled

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
- Authentication
- Authorization
- Broad ERP functionality beyond the currently implemented slices
