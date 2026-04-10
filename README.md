# Alixar ERP/CRM

![PHP Version](https://img.shields.io/badge/PHP-8.2+-blueviolet?style=flat-square)
![CI](https://github.com/alxarafe/alixar/actions/workflows/ci.yml/badge.svg)
![Tests](https://github.com/alxarafe/alixar/actions/workflows/tests.yml/badge.svg)
[![Quality Report](https://img.shields.io/badge/quality-report-brightgreen?style=flat-square)](https://alxarafe.github.io/alixar/quality/)
![Static Analysis](https://img.shields.io/badge/static%20analysis-PHPStan%20%2B%20Psalm-blue?style=flat-square)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/alxarafe/alixar/issues?utf8=✓&q=is%3Aopen%20is%3Aissue)

*[Leer en español](README.es.md)*

**Alixar** is an open-source **ERP/CRM** currently under active development.
The project started as a clone of [Dolibarr](https://www.dolibarr.org/), progressively rewritten and modernized using the [Alxarafe](https://github.com/alxarafe/alxarafe) microframework.
Over time, Alixar will evolve independently, incorporating its own architecture, modules, and features while maintaining the functional richness inherited from Dolibarr.

## Goals

- Provide a modern, modular ERP/CRM built on top of the Alxarafe framework.
- Gradually replace legacy Dolibarr code with clean, well-structured PHP 8.2+ code.
- Offer a fully Docker-based development and deployment environment.
- Maintain an extensible module system for billing, CRM, HRM, inventory, accounting, and more.

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
5. Access the application at [http://localhost:8083](http://localhost:8083).

### Manual installation

1. Clone the repository.
2. Run `composer install`.
3. Configure your `.env` file.
4. Point your web server to the `public/` directory.

## Documentation

Documentation is being developed alongside the project. You can find initial docs in the `doc/` directory.

## Contributing

This project exists thanks to all the people who contribute.
Contributions, bug reports, and feature requests are welcome! Please open an issue or submit a pull request on [GitHub](https://github.com/alxarafe/alixar).

## Credits

Alixar is based on [Dolibarr](https://www.dolibarr.org/) and built with the [Alxarafe](https://github.com/alxarafe/alxarafe) microframework.

## Links

- [Alixar on GitHub](https://github.com/alxarafe/alixar)
- [Alxarafe Framework](https://github.com/alxarafe/alxarafe)
- [Dolibarr ERP/CRM](https://www.dolibarr.org/)
