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
./bin/up        # Start development server (http://127.0.0.1:48081/health)
./bin/down      # Stop development server
./bin/test      # Run tests in Docker
./bin/check     # Complete local validation (build, test, image, runtime, health)
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

## Validation

`./bin/check` is the complete validation authority. It runs entirely in Docker and performs:

1. Build and test (`mvnw clean verify`)
2. Runtime image build
3. Container startup with health check wait
4. HTTP `GET /health` verification (exact `{"status":"ok"}` response)
5. Cleanup

## CI

GitHub Actions workflow (`.github/workflows/ci.yml`) runs `./bin/check` on ubuntu-24.04.