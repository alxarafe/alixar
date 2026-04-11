# Alixar ERP/CRM

![PHP Version](https://img.shields.io/badge/PHP-8.2+-blueviolet?style=flat-square)
![CI](https://github.com/alxarafe/alixar/actions/workflows/ci.yml/badge.svg)
[![Quality Report](https://img.shields.io/badge/quality-report-brightgreen?style=flat-square)](https://alxarafe.github.io/alixar/quality/)
![Static Analysis](https://img.shields.io/badge/static%20analysis-PHPStan%20%2B%20Psalm-blue?style=flat-square)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/alxarafe/alixar/issues?utf8=✓&q=is%3Aopen%20is%3Aissue)

*[Read in English](README.md)*

**Alixar** es un **ERP/CRM** de código abierto inmerso en una ambiciosa modernización arquitectónica.
El proyecto nació a partir de [Dolibarr](https://www.dolibarr.org/), pero se está reescribiendo progresivamente implementando una **Arquitectura Hexagonal (Puertos y Adaptadores)** en PHP 8.2+ acompañada de un moderno frontend **Headless en Vue 3 + TypeScript**.

La estrategia principal de Alixar es mantener *inicialmente* una **compatibilidad del 100% con el esquema de base de datos y reglas de negocio** de Dolibarr, lo que permite ejecutar el monolito heredado y la nueva API de transiciòn en paralelo. La visión a futuro es evolucionar a hacia una estructura de datos nativa más moderna y robusta.

## Objetivos

- Proporcionar un ERP/CRM moderno estructurado limpiamente en capas (Dominio, Aplicación, Infraestructura).
- Extraer y aislar la lógica monolítica heredada (ej. `societe.class.php`) en Servicios de Dominio puros y Value Objects.
- Ofrecer una robusta API REST capaz de superar tests de paridad de comportamiento exactos frente a Dolibarr (`bin/api_compare.sh`).
- Ofrecer un **Frontend Headless** de última generación construido con Vue.js y TypeScript, completamente desacoplado del backend.
- Ofrecer un entorno Docker completo para ejecutar ambos sistemas cara a cara de forma local.

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
5. Instala y expone el Frontend Headless (requiere Node 20+):
   ```bash
   cd frontend
   npm install
   npm run dev
   ```
6. Accede a la API REST en [http://localhost:8083](http://localhost:8083) y al Frontend web en [http://localhost:5173](http://localhost:5173).

### Instalación manual

1. Clona el repositorio.
2. Ejecuta `composer install`.
3. Configura tu archivo `.env`.
4. Apunta tu servidor web al directorio `public/`.

## Documentación

La documentación se está desarrollando junto con el proyecto. Puedes encontrar los documentos iniciales en el directorio `docs/`.

## Contribuir

Este proyecto existe gracias a todas las personas que contribuyen.
¡Las contribuciones, reportes de errores y solicitudes de funcionalidades son bienvenidas! Por favor, abre un issue o envía un pull request en [GitHub](https://github.com/alxarafe/alixar).

## Créditos

Alixar está basado en [Dolibarr](https://www.dolibarr.org/) y construido con el microframework [Alxarafe](https://github.com/alxarafe/alxarafe).

## Enlaces

- [Alixar en GitHub](https://github.com/alxarafe/alixar)
- [Dolibarr ERP/CRM](https://www.dolibarr.org/)
