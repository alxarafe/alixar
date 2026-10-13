# Alixar

> The backend and business authority of the Solucar / Alixar ERP.

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](LICENSE)
[![Java CI](https://github.com/alxarafe/alixar/actions/workflows/ci.yml/badge.svg)](https://github.com/alxarafe/alixar/actions/workflows/ci.yml)
[![Java 25](https://img.shields.io/badge/Java-25-orange)](https://openjdk.org/projects/jdk/25/)
[![Spring Boot 4.1.1](https://img.shields.io/badge/Spring%20Boot-4.1.1-brightgreen)](https://spring.io/projects/spring-boot)
[![Docker](https://img.shields.io/badge/Docker-%E2%9C%93-blue)](https://www.docker.com/)

Alixar is the Java backend of the Solucar / Alixar ERP.

It is being built as a modular, API-driven and pragmatically hexagonal
reimplementation intended to preserve mature ERP behaviour while allowing
progressive migration away from legacy architecture.

**Solucar → frontend**  
**Alixar  → backend and business authority**

## Status

Canonical **Contact read** capability exists (`GET /api/contacts/{id}`).
Alixar currently uses a **Dolibarr adapter** for that capability.
Real integration against `dolibarr-reference` has been demonstrated.
Persistence, authentication, and broad ERP functionality are **not implemented**.

## Development

```bash
./bin/up            # Start development server (http://127.0.0.1:48081/health)
./bin/down          # Stop development server
./bin/test          # Run deterministic tests in Docker
./bin/check         # Complete local validation (build, test, image, runtime, health)
./bin/check-reference  # Real Dolibarr compatibility verification
```

Requires Docker and Docker Compose. No host Java or Maven installation needed.

## Documentation

- [Architecture](docs/architecture.md)
- [Development](docs/development.md)
- [Agent working agreement](AGENTS.md)

## License

Copyright (c) 2025 Alxarafe. Licensed under [Apache-2.0](LICENSE).