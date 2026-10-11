# Alixar

> The backend and business authority of the Solucar / Alixar ERP.

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](LICENSE)

Alixar is the Java backend of the Solucar / Alixar ERP.

It is being built as a modular, API-driven and pragmatically hexagonal
reimplementation intended to preserve mature ERP behaviour while allowing
progressive migration away from legacy architecture.

**Solucar → frontend**  
**Alixar  → backend and business authority**

## Status

Minimal bootstrap implemented. No ERP modules, persistence, authentication,
or Dolibarr compatibility implemented yet.

## Development

```bash
./bin/up        # Start development server (http://127.0.0.1:48081/health)
./bin/down      # Stop development server
./bin/test      # Run tests in Docker
./bin/check     # Complete local validation (build, test, image, runtime, health)
```

Requires Docker and Docker Compose. No host Java or Maven installation needed.

## Documentation

- [Architecture](docs/architecture.md)
- [Development](docs/development.md)
- [Agent working agreement](AGENTS.md)

## License

Copyright (c) 2025 Alxarafe. Licensed under [Apache-2.0](LICENSE).