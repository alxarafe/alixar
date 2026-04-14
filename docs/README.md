# Alixar ERP

Alixar es una modernización profunda del ecosistema ERP heredado de Dolibarr, transformado en una solución completamente Headless que fomenta una alta modularidad, escalabilidad y una experiencia de usuario (UX) rica e inmersiva.

## Arquitectura

El ecosistema Alixar se divide en dos componentes principales:

1. **Frontend Headless (Vue 3 + TailwindCSS)** (`frontend/`): Proveé la experiencia del cliente final bajo una Single Page Application, basándose en la especificación Server-Driven UI y adaptando dinámicamente formularios mediante la inyección de Schemas desde el backend.
2. **Core API (PHP Hexagonal)** (`src/`, `plugins/`): Expone los endpoints REST para abastecer de datos y configuraciones al frontend. Ha sido refactorizado radicalmente hacia una Arquitectura Hexagonal y modular.

La compatibilidad con la base de datos de Dolibarr se garantiza a través de una sólida batería de pruebas de regresión API, pero con un código limpio y Desacoplado usando el patrón *Strangler Fig*.

## Requisitos del Entorno

- Docker / Docker Compose.
- Node.js 20+ (Si se ejecuta el frontend fuera del contenedor).
- PHP 8.3+ (Garantizado por el contenedor).

## Levantamiento Rápido del Proyecto

La forma recomendada de arrancar Alixar es empleando los contenedores oficiales definidos en `docker-compose.yml`. Para detalles minuciosos del flujo de Docker y la validación de integraciones con Dolibarr, por favor consulta la [Guía de Docker Completa](DOCKER_GUIDE.md).

```bash
# 1. Copiar y configurar las variables de entorno si es la primera vez
cp .env.example .env

# 2. Levantar los contenedores de desarrollo en modo extendido (Frontend + Backend + DB + Proxies)
./bin/docker_start.sh

# 3. Inicializar el esquema de base de datos desde el contenedor PHP si es necesario
./bin/run_migrations.sh
```

El Frontend ahora será accesible desde `http://localhost:5173/`, mientras que el servidor Web (Backend/API y Admin PHPMyAdmin) se publican en los puertos indicados en tu fichero `.env`.

Para compilar activos y construir el *bundle* de producción si trabajas sin Docker:
```bash
cd frontend/
npm install
npm run build
```

## Índice de Documentación Central

Dentro de la subcarpeta `docs/` encontrarás detalladas guías de implementación para expandir, conectar o testear Alixar:

- [**Guía y Topología Docker**](DOCKER_GUIDE.md) - Despliegues y pruebas de integración.
- [**Topología General del Proyecto**](ARCHITECTURE.md) - Resumen arquitectónico con Hexagonal Ports and Adapters explicados sobre el ecosistema SDUI e Inyección Backend.
- [**Referencia de API Rest**](API_REFERENCE.md) - Construcción, consumo y ciclo de vida de los Endpoints expuestos por Alixar.
- [**Arquitectura de Plugins Modulares**](PLUGINS_ARCHITECTURE.md) - Separando el core de módulos de dominio (Trading, Finance, CRM) y el puente `dolibarr-compat`.
- [**Glosario Dolibarr-Alixar**](dolibarr-naming-glossary.md) - Un repositorio mnemotécnico vital para ayudar al desarrollo refirienciando esquemas legados hacia nuevas convenciones.

---
© 2026 Alixar Team - Advanced Agentic Coding Project.
