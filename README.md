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

## Related repository

Alixar is the backend and business authority of the Solucar / Alixar ERP.

Frontend:
- [Solucar](https://github.com/alxarafe/solucar-web)

## Project status

Alixar is under active development.

See [Current implementation status](docs/status.md) for implemented capabilities,
integration boundaries and known pending areas.

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

- [Current implementation status](docs/status.md)
- [Architecture](docs/architecture.md)
- [Development](docs/development.md)
- [Agent working agreement](AGENTS.md)

## License

Copyright (c) 2025 Alxarafe. Licensed under [Apache-2.0](LICENSE).