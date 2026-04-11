# Alixar ERP/CRM

![PHP Version](https://img.shields.io/badge/PHP-8.2+-blueviolet?style=flat-square)
![CI](https://github.com/alxarafe/alixar/actions/workflows/ci.yml/badge.svg)
![Tests](https://github.com/alxarafe/alixar/actions/workflows/tests.yml/badge.svg)
[![Quality Report](https://img.shields.io/badge/quality-report-brightgreen?style=flat-square)](https://alxarafe.github.io/alixar/quality/)
![Static Analysis](https://img.shields.io/badge/static%20analysis-PHPStan%20%2B%20Psalm-blue?style=flat-square)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/alxarafe/alixar/issues?utf8=✓&q=is%3Aopen%20is%3Aissue)

*[Leer en español](README.es.md)*

**Alixar** is an open-source **ERP/CRM** undergoing an ambitious architectural modernization.
The project started as a fork of [Dolibarr](https://www.dolibarr.org/), but is now being progressively rewritten as a pure **Hexagonal Architecture (Ports and Adapters)** application in PHP 8.2+ alongside a **Headless Vue 3 + TypeScript** modern frontend.

Alixar's core strategy is to *initially* maintain **100% database schema and business logic compatibility** with Dolibarr, allowing users to run both the legacy monolith and the Hexagonal API side-by-side. The long-term vision is to evolve to a more modern, efficient database structure once the decoupling is complete.

## Goals

- Provide a modern, modular ERP/CRM with strict separation of concerns (Domain, Application, Infrastructure).
- Encapsulate legacy Dolibarr logic (e.g. `societe.class.php`) into clean Domain Services and Value Objects.
- Provide a robust REST API ecosystem capable of passing exact parity tests against Dolibarr (`bin/api_compare.sh`).
- Deliver a state-of-the-art **Headless Frontend** built on Vue.js and TypeScript, completely decoupled from the backend.
- Offer a fully Docker-based development environment to run both systems side-by-side.

## LICENSE

Alixar is released under the terms of the **GNU General Public License** as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version (GPL-3+).

See the [LICENSE](https://github.com/alxarafe/alixar/blob/main/LICENSE) file for a full copy of the license.

## Requirements

- PHP 8.2+
- Composer
- Docker & Docker Compose (recommended)

## Installation

### Local development with Docker (Recommended)

Alixar includes a complete Docker environment (PHP-FPM, Nginx, MariaDB, phpMyAdmin).

1. Clone the repository:
   ```bash
   git clone https://github.com/alxarafe/alixar.git
   cd alixar
   ```
2. Copy the example environment file and adjust it if needed:
   ```bash
   cp .env.example .env
   ```
3. Start the containers:
   ```bash
   docker compose up -d
   ```
4. Install PHP dependencies:
   ```bash
   docker exec alixar_php composer install
   ```
5. Install and serve the Headless Frontend (Node 20+ required):
   ```bash
   cd frontend
   npm install
   npm run dev
   ```
6. Access the REST API at [http://localhost:8083](http://localhost:8083) and the Frontend at [http://localhost:5173](http://localhost:5173).

### Manual installation

1. Clone the repository.
2. Run `composer install`.
3. Configure your `.env` file.
4. Point your web server to the `public/` directory.

## Documentation

Documentation is being developed alongside the project. You can find initial docs in the `docs/` directory.

## Contributing

This project exists thanks to all the people who contribute.
Contributions, bug reports, and feature requests are welcome! Please open an issue or submit a pull request on [GitHub](https://github.com/alxarafe/alixar).

## Credits

Alixar is based on [Dolibarr](https://www.dolibarr.org/) and built with the [Alxarafe](https://github.com/alxarafe/alxarafe) microframework.

## Links

- [Alixar on GitHub](https://github.com/alxarafe/alixar)
- [Dolibarr ERP/CRM](https://www.dolibarr.org/)
