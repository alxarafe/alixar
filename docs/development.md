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

Spring Boot 4.1.1 manages Flyway 12.4.0, jOOQ 3.21.7, PostgreSQL JDBC
42.7.13, and Spring Security 7.1.1. There is no Flyway override or jOOQ code
generation. `V1__create_authentication_user.sql` creates the authentication
user table, `V2__add_credentials_version_and_password_reset.sql` adds
`credentials_version` and the password reset token table, and
`V3__create_authentication_api_token.sql` adds the Personal Access Token table,
`V4__create_role_based_authorization.sql` adds roles, permissions,
role-permission assignments, user-role assignments and the initial
`users.manage`/`system-admin` seed, and
`V5__add_role_administration_authorization.sql` adds the `roles.manage`
permission, built-in role metadata and the restrictive role-assignment foreign
key, `V6__create_audit_event_chain.sql` adds the audit chain head and
append-only audit event tables with the genesis chain,
`V7__add_recovery_token_audit_authentication_type.sql` extends the allowed audit
authentication types with `RECOVERY_TOKEN`, and
`V8__add_audit_read_authorization.sql` seeds the `audit.read` permission and
grants it to `system-admin`. Boot calls Flyway on
startup using its default `classpath:db/migration`
location. `PersistenceIT` verifies the migrations, their constraints, RBAC
resolution and authentication transaction behaviour against PostgreSQL.

## Authentication Configuration

The optional initial development user is configured with
`ALIXAR_BOOTSTRAP_USERNAME`, `ALIXAR_BOOTSTRAP_EMAIL`, and
`ALIXAR_BOOTSTRAP_PASSWORD`. Set all three before the first `./bin/up`; do not
commit or reuse real credentials. The initializer hashes the password and never
resets an existing matching user's password.

Creating the bootstrap user does **not** make it an administrator. Set
`ALIXAR_BOOTSTRAP_SYSTEM_ADMIN=true` to grant the built-in `system-admin` role
to that user. The flag defaults to `false`, is idempotent, and does not create a
user by itself. See [Authentication](authentication.md).

These environment variables are a **development/testing convenience only**.
Passing `ALIXAR_BOOTSTRAP_PASSWORD` through the environment exposes the
plaintext secret to process/container inspection, so it is not a production
secret-management mechanism; production credential provisioning is a separate
pending decision. No Docker Secrets, Vault, or other secret manager is
implemented.

Session configuration:

| Variable | Default | Description |
|----------|---------|-------------|
| `ALIXAR_SESSION_TIMEOUT` | `30m` | Inactivity timeout for the process-local HTTP session |
| `ALIXAR_SESSION_COOKIE_SECURE` | `false` | Set to `true` whenever HTTPS is used |

The session cookie is always `HttpOnly` and `SameSite=Lax`. CSRF uses the
Angular-compatible `XSRF-TOKEN` cookie and `X-XSRF-TOKEN` header.

Password reset configuration:

| Variable | Default | Description |
|----------|---------|-------------|
| `ALIXAR_PASSWORD_RESET_FRONTEND_URL` | empty | Base URL of the frontend page that receives `?token=<raw-token>` |
| `ALIXAR_PASSWORD_RESET_MAIL_FROM` | `spring.mail.username` | Sender address of reset emails |
| `SPRING_MAIL_HOST` | unset | Enables the SMTP reset notifier when set |
| `SPRING_MAIL_PORT` | Spring default (`25`) | SMTP port |
| `SPRING_MAIL_USERNAME` | unset | SMTP username |
| `SPRING_MAIL_PASSWORD` | unset | SMTP password (never commit a real value) |
| `SPRING_MAIL_AUTH` | Spring default | Enable SMTP authentication |
| `SPRING_MAIL_STARTTLS_ENABLE` | Spring default | Enable STARTTLS |

When no `spring.mail.host` is configured, reset emails are not sent and a no-op
notifier logs a warning. `compose.yaml` passes the mail variables through from
the host environment only when they are defined, so no mail sender is created by
default.

Audit configuration:

| Variable | Default | Description |
|----------|---------|-------------|
| `ALIXAR_AUDIT_MODE` | `OFF` | Audit policy: `OFF` disables the persistent audit trail; `BASIC` records explicitly instrumented events |

`BASIC` records the explicitly instrumented administrative user lifecycle,
self-service credential changes and completed password-recovery operations. It is
not full audit coverage. See [Audit](audit.md) for the exact coverage, actor
semantics and fail-closed transaction guarantee.

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

1. Build and run the 280 deterministic tests (`mvnw clean verify`)
2. Runtime image build
3. Container startup with health check wait (database + app)
4. PostgreSQL health verification (`pg_isready`)
5. Run `PersistenceIT` against the real isolated PostgreSQL service: verify the
   Boot datasource, Flyway `V1`/`V2`/`V3`/`V4`/`V5`/`V6`/`V7`/`V8`, a jOOQ `DSLContext`
   executing `SELECT 1`, PostgreSQL 18.6, the authentication, API token and RBAC
   tables and constraints, permission-catalogue ordering, effective-permission
   resolution, restrictive role deletion, administrative user
   uniqueness/rollback, administrative credential changes, password reset
   transaction rollback, administrative role creation with conflict handling,
   administrative role rename/permission replacement preserving assignments and
   `credentials_version`, atomic permission replacement, built-in role
   immutability, deletion restricted for assigned roles with permission
   cascade for free roles, and audit append-only integrity including concurrent
   appends, hash-chain verification, direct tampering detection, restrictive
   chain-head deletion, fail-closed rollback of administrative user creation,
   password reset and role replacement, self-service password change, completed
   password recovery, Personal Access Token creation, role permission
   replacement and role deletion when a mandatory audit append fails, plus one
   mixed administrative/self-service/recovery audit chain and one mixed
   API-token/role audit chain with exact event counts and no duplicates, plus
   chain-scoped audit pagination and sparse-filter queries without duplicates
   or omissions, plus repeatable-read verification consistency while an append
   commits concurrently
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

`./bin/test` runs the 280 component/unit tests without PostgreSQL.
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
