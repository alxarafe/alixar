# Arquitectura de Alixar

Alixar es una modernización del ERP Dolibarr construida sobre el microframework **Alxarafe**.

## Componentes Principales

1. **Núcleo (Alxarafe Framework)**: Proporciona la estructura MVC, el motor de plantillas Blade y el sistema de despacho web/API.
2. **Motor de Datos (Dolibarr DB)**: Utiliza el esquema de tablas de Dolibarr (v14+) pero interactúa a través de **Eloquent ORM** para una manipulación de datos moderna y segura.
3. **Módulos (Alixar Modules)**: Ubicados en `Modules/Alixar/`, contienen la lógica de negocio específica.

## Capas de Integración

### Modelos (Eloquent)
Los modelos en `Modules/Alixar/Model/` heredan de `Alxarafe\Base\Model\Model`. 
- **HasReference Trait**: Implementado para replicar la lógica de máscaras de Dolibarr (ej. `{yyyy}{mm}-{0000}`).
- **Relaciones**: Se han definido relaciones Eloquent (`belongsTo`, `hasMany`) para permitir la navegación fluida (ej. `$order->thirdParty->nom`).

### Controladores (Resource)
La mayoría de los controladores heredan de `ResourceController`, lo que automatiza:
- Listados con paginación y filtros.
- Formularios de edición/creación con componentes Blade dinámicos.
- Respuestas AJAX automáticas.

### Sistema de Permisos
Alixar utiliza el trait `HasDolibarrPermissions` para consultar directamente las tablas `llx_user_rights` y `llx_usergroup_rights`, asegurando que el acceso sea idéntico al que el usuario tendría en Dolibarr original.

## Flujo de Solicitudes
1. `public/index.php` inicializa el entorno y define el tema.
2. `WebDispatcher` detecta el módulo, controlador y acción.
3. El controlador opcionalmente aplica filtros mediante `beforeList()` o `beforeConfig()`.
4. La vista se renderiza usando el tema premium `alixar`.
