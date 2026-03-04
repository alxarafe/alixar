# Documentación de Alixar ERP

Bienvenido a la carpeta de documentación del proyecto Alixar. Aquí encontrarás la información técnica necesaria para operar y extender el sistema.

## Contenido

1. [**Arquitectura del Sistema**](ARCHITECTURE.md): Explicación del stack Alxarafe + Dolibarr y el flujo de datos.
2. [**Referencia de API REST**](API_REFERENCE.md): Guía de endpoints, autenticación y parámetros para integraciones externas.
3. [**Mejoras Sugeridas para el Framework**](FRAMEWORK_IMPROVEMENTS.md): Notas técnicas sobre hallazgos en el core de Alxarafe para futuras actualizaciones.
4. [**Plan de Migración (Histórico)**](migration_plan.old.md): Registro de las fases ejecutadas durante la transición desde Dolibarr.

## Guía de Inicio Rápido para Desarrolladores

### Requisitos
- Docker / Docker Compose.
- PHP 8.1+.
- Base de datos Dolibarr v14+ accesible.

### Comandos Útiles
- `npm run dev` (Si se usa compilación de activos).
- `php run_migrations.php`: Ejecuta las migraciones estructurales necesarias.
- `php debug_theme.php`: Verifica la carga del tema y la conexión a DB.

---
© 2026 Alixar Team - Advanced Agentic Coding Project.
