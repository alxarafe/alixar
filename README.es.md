# Alixar ERP/CRM

![PHP Version](https://img.shields.io/badge/PHP-8.2+-blueviolet?style=flat-square)
![CI](https://github.com/alxarafe/alixar/actions/workflows/ci.yml/badge.svg)
![Tests](https://github.com/alxarafe/alixar/actions/workflows/tests.yml/badge.svg)
[![Quality Report](https://img.shields.io/badge/quality-report-brightgreen?style=flat-square)](https://alxarafe.github.io/alixar/quality/)
![Static Analysis](https://img.shields.io/badge/static%20analysis-PHPStan%20%2B%20Psalm-blue?style=flat-square)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/alxarafe/alixar/issues?utf8=✓&q=is%3Aopen%20is%3Aissue)

*[Read in English](README.md)*

**Alixar** es un **ERP/CRM** de código abierto actualmente en desarrollo activo.
El proyecto nació como un clon de [Dolibarr](https://www.dolibarr.org/), que se va reescribiendo y modernizando progresivamente utilizando el microframework [Alxarafe](https://github.com/alxarafe/alxarafe).
Con el tiempo, Alixar evolucionará de forma independiente, incorporando su propia arquitectura, módulos y funcionalidades, manteniendo al mismo tiempo la riqueza funcional heredada de Dolibarr.

## Objetivos

- Proporcionar un ERP/CRM moderno y modular construido sobre el framework Alxarafe.
- Reemplazar gradualmente el código heredado de Dolibarr con código PHP 8.2+ limpio y bien estructurado.
- Ofrecer un entorno de desarrollo y despliegue completamente basado en Docker.
- Mantener un sistema de módulos extensible para facturación, CRM, RRHH, inventario, contabilidad y más.

## LICENCIA

Alixar se distribuye bajo los términos de la **Licencia Pública General de GNU** tal como la publica la Free Software Foundation; ya sea la versión 3 de la Licencia, o (a su elección) cualquier versión posterior (GPL-3+).

Consulta el archivo [LICENSE](https://github.com/alxarafe/alixar/blob/main/LICENSE) para una copia completa de la licencia.

## Requisitos

- PHP 8.2+
- Composer
- Docker y Docker Compose (recomendado)

## Instalación

### Desarrollo local con Docker (Recomendado)

Alixar incluye un entorno Docker completo (PHP-FPM, Nginx, MariaDB, phpMyAdmin).

1. Clona el repositorio:
   ```bash
   git clone https://github.com/alxarafe/alixar.git
   cd alixar
   ```
2. Copia el archivo de entorno de ejemplo y ajústalo si es necesario:
   ```bash
   cp .env.example .env
   ```
3. Inicia los contenedores:
   ```bash
   docker compose up -d
   ```
4. Instala las dependencias PHP:
   ```bash
   docker exec alixar_php composer install
   ```
5. Accede a la aplicación en [http://localhost:8083](http://localhost:8083).

### Instalación manual

1. Clona el repositorio.
2. Ejecuta `composer install`.
3. Configura tu archivo `.env`.
4. Apunta tu servidor web al directorio `public/`.

## Documentación

La documentación se está desarrollando junto con el proyecto. Puedes encontrar los documentos iniciales en el directorio `doc/`.

## Contribuir

Este proyecto existe gracias a todas las personas que contribuyen.
¡Las contribuciones, reportes de errores y solicitudes de funcionalidades son bienvenidas! Por favor, abre un issue o envía un pull request en [GitHub](https://github.com/alxarafe/alixar).

## Créditos

Alixar está basado en [Dolibarr](https://www.dolibarr.org/) y construido con el microframework [Alxarafe](https://github.com/alxarafe/alxarafe).

## Enlaces

- [Alixar en GitHub](https://github.com/alxarafe/alixar)
- [Alxarafe Framework](https://github.com/alxarafe/alxarafe)
- [Dolibarr ERP/CRM](https://www.dolibarr.org/)
