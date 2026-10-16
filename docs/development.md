# Development

## Prerequisites

The host must provide only:
- Git
- Docker
- Docker Compose
- Programming agent

**No host Java, Maven, PostgreSQL, or Node.js installation required.**

## Commands

```bash
./bin/up             # Start development server (http://127.0.0.1:48081/health)
./bin/down           # Stop development server
./bin/test           # Run tests in Docker
./bin/check          # Complete local validation (build, test, image, runtime, health)
./bin/check-reference # Real Dolibarr integration validation (requires sibling dolibarr-reference)
```

## Port Configuration

- Internal container port: `8080`
- Default host port: `48081` (bound to 127.0.0.1 only)
- Configurable via `ALIXAR_JAVA_PORT` environment variable

The port 48081 was chosen to avoid collisions with:
- ERBAS (48080)
- Solucar (44200)

## Database Configuration

PostgreSQL is included as normal Alixar infrastructure in `compose.yaml`:

- Image: `postgres:18.6-alpine@sha256:77f585114c32fbca283dc835b0596f4e52b51b4c6662d7810b2f4084f60a1873`
- Internal port: `5432`
- No host port exposure (internal Docker network only)
- Health check: `pg_isready`
- Named volume: `alixar-db-data` for persistence

Environment variables (with development-safe defaults):

| Variable | Default | Description |
|----------|---------|-------------|
| `ALIXAR_DB_NAME` | `alixar` | Database name |
| `ALIXAR_DB_USER` | `alixar` | Database username |
| `ALIXAR_DB_PASSWORD` | `alixar` | Database password |

**Do not commit production credentials.** Use `.env` files or environment overrides for non-development values.

Compose derives the application's `SPRING_DATASOURCE_URL`,
`SPRING_DATASOURCE_USERNAME`, and `SPRING_DATASOURCE_PASSWORD` from the
`ALIXAR_DB_*` variables above and fixes `SPRING_JOOQ_SQL_DIALECT=POSTGRES`.
Exporting different `SPRING_DATASOURCE_*` values on the host does not override
these explicit service settings. PostgreSQL initialization variables apply when
the volume is first initialized; changing them does not update existing users.

The PostgreSQL digest is the multi-platform image index verified with
`docker buildx imagetools inspect postgres:18.6-alpine` on 2026-10-16. It pins
the approved 18.6 Alpine image rather than following changes to the tag.

`./bin/down` stops development containers and removes their network while
retaining the database volume. Starting again reuses its data. Destruction of
development data is a separate, explicit operation; no reset command is provided.

Spring Boot 4.1.1 manages Flyway 12.4.0, jOOQ 3.21.7, and PostgreSQL JDBC
42.7.13. There is no Flyway override, jOOQ code generation, or business migration.
Boot calls Flyway on startup using its default `classpath:db/migration` location.
With no migrations, the verified result is an empty `flyway_schema_history`
table and no business tables. Flyway's warning that no migrations were found
is expected at this foundation stage; no fictitious migration suppresses it.

## Docker Compose

The `compose.yaml` defines:
- `database` — PostgreSQL 18.6 service (normal Alixar infrastructure)
- `app` — Alixar application (depends on healthy database)

### Reference Check Override

`compose.reference.yaml` extends `compose.yaml` for the Dolibarr reference integration check:
- Attaches Alixar to the external `dolibarr-reference` network
- Configures `ALIXAR_DOLIBARR_BASE_URL=http://dolibarr/api/index.php` (service DNS)
- Requires `ALIXAR_DOLIBARR_API_KEY` from environment
- Uses a fresh `alixar-reference-check-<pid>-<random>` project for each invocation

This override is used **only** by `./bin/check-reference`.

## Validation

### `./bin/check` — Alixar Self-Contained Validation

`./bin/check` is the complete validation authority for Alixar itself. It runs entirely in Docker and performs:

1. Build and run the 45 deterministic tests (`mvnw clean verify`)
2. Runtime image build
3. Container startup with health check wait (database + app)
4. PostgreSQL health verification (`pg_isready`)
5. Run `PersistenceIT` against the real isolated PostgreSQL service: verify the
   Boot datasource, Flyway bean and empty history, a jOOQ `DSLContext` executing
   `SELECT 1`, PostgreSQL 18.6, and absence of business tables
6. HTTP `GET /health` verification (exact `{"status":"ok"}` response)
7. Cleanup of this invocation's containers, network, and volume; verify none remain

**No external dependencies.** Does not require `dolibarr-reference`.

Each invocation chooses an `alixar-check-<pid>-<random>` Compose project and
refuses to proceed if resources already exist under that project label. It uses
a Docker-assigned loopback port by default and discovers it through
`docker compose port app 8080`. `ALIXAR_JAVA_PORT` can explicitly select a port;
the caller must ensure it is free. Development still defaults to port 48081.
Cleanup runs on success, failure, and handled interruption, and only targets
the invocation's project. Cleanup errors are reported and fail an otherwise
successful check; an earlier failure retains its exit code. Images/build cache
are retained. No fixed development or previous check project is cleaned.

`./bin/test` runs the original 45 component/unit tests without PostgreSQL.
Their persistence exclusions are centralized in `src/test/resources/application.properties`.
The additional `PersistenceIT` uses Surefire's separate `*IT` naming convention
and is explicitly selected by `bin/check` through `compose.check.yaml`, with
real persistence auto-configuration restored. There are no Surefire exclusions.
The verification service uses the Docker build stage and is absent from normal
development startup. The runtime image still contains only the runtime artifact.
`.dockerignore` keeps private notes, Git metadata, local configuration, and build
artifacts outside the build context.

### `./bin/check-reference` — Real Dolibarr Compatibility Check

`./bin/check-reference` validates Alixar's contact adapter against a **real Dolibarr 24.0.1 instance**.

**Prerequisites:**
- Sibling repository `../dolibarr-reference` (not part of normal Alixar development)
- Dolibarr is a **compatibility/reference system**, not normal Alixar infrastructure

**What it does:**
1. Starts `dolibarr-reference` via its own `./bin/up` (provisions API key if needed)
2. Discovers the running Dolibarr container and its Docker network
3. Builds the current Alixar code and starts that same project's image with
   `--no-build`, using `compose.yaml + compose.reference.yaml` and a fresh project
4. Alixar reaches Dolibarr via service DNS (`http://dolibarr/api/index.php`), not `127.0.0.1`
5. Runs contact creation/read, mapping, 404, and legacy-field verification
6. Cleans up only this invocation's Alixar containers, network, and PostgreSQL
   volume, verifies removal, and leaves `dolibarr-reference` running

The external reference network is retained. Existing Alixar reference projects,
including `alixar-reference_alixar-db-data`, are neither reused nor removed.
The existing compatibility workflow creates test contacts in Dolibarr; it does
not change reference code or schema. Its Alixar port discovery and cleanup error
handling follow the same rules as the self-contained check.

**Environment variables:**
- `ALIXAR_JAVA_PORT` (default dynamically assigned) — optional host port for Alixar health/API
- `DOLIBARR_REFERENCE_PORT` (default 48240) — host port for Dolibarr

## CI

GitHub Actions workflow (`.github/workflows/ci.yml`) runs `./bin/check` on ubuntu-24.04.

**Note:** `./bin/check-reference` is not run in CI because it requires the external `dolibarr-reference` repository. It is a local-only verification step.
