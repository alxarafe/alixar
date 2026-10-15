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

## Docker Compose

The `compose.yaml` defines only the `app` service. No infrastructure services (PostgreSQL, Redis, Kafka, etc.) are included in this bootstrap.

### Reference Check Override

`compose.reference.yaml` extends `compose.yaml` for the Dolibarr reference integration check:
- Attaches Alixar to the external `dolibarr-reference` network
- Configures `ALIXAR_DOLIBARR_BASE_URL=http://dolibarr/api/index.php` (service DNS)
- Requires `ALIXAR_DOLIBARR_API_KEY` from environment
- Uses distinct container name `alixar-reference` and project name `alixar-reference`

This override is used **only** by `./bin/check-reference`.

## Validation

### `./bin/check` — Alixar Self-Contained Validation

`./bin/check` is the complete validation authority for Alixar itself. It runs entirely in Docker and performs:

1. Build and test (`mvnw clean verify`)
2. Runtime image build
3. Container startup with health check wait
4. HTTP `GET /health` verification (exact `{"status":"ok"}` response)
5. Cleanup

**No external dependencies.** Does not require `dolibarr-reference`.

### `./bin/check-reference` — Real Dolibarr Compatibility Check

`./bin/check-reference` validates Alixar's contact adapter against a **real Dolibarr 24.0.1 instance**.

**Prerequisites:**
- Sibling repository `../dolibarr-reference` (not part of normal Alixar development)
- Dolibarr is a **compatibility/reference system**, not normal Alixar infrastructure

**What it does:**
1. Starts `dolibarr-reference` via its own `./bin/up` (provisions API key if needed)
2. Discovers the running Dolibarr container and its Docker network
3. Starts Alixar with `compose.yaml + compose.reference.yaml` on a dedicated Compose project
4. Alixar reaches Dolibarr via service DNS (`http://dolibarr/api/index.php`), not `127.0.0.1`
5. Runs full contact CRUD + mapping + 404 + legacy-field verification
6. Cleans up Alixar (Compose down), leaves `dolibarr-reference` running

**Environment variables:**
- `ALIXAR_JAVA_PORT` (default 48081) — host port for Alixar health/API
- `DOLIBARR_REFERENCE_PORT` (default 48240) — host port for Dolibarr

## CI

GitHub Actions workflow (`.github/workflows/ci.yml`) runs `./bin/check` on ubuntu-24.04.

**Note:** `./bin/check-reference` is not run in CI because it requires the external `dolibarr-reference` repository. It is a local-only verification step.