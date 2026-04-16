# Referencia de API Hexagonal REST de Alixar

La comunicación primordial entre el Frontend SDUI (Vue 3) y el Core (PHP) ocurre explícitamente mediante una API Rest estandarizada implementada usando controladores adheridos a la **Arquitectura Hexagonal**.

## Puntos de Entrada Base (Endpoints)

Todas las URL dirigidas al ecosistema exponen el formato estandar de prefijo `/api/v1/...`, manejadas a través de `ApiResourceController`.

### Flujo Estándar de Recurso

Para entender la estructura, asuma un recurso genérico registrado como un Modelo (ej., Entidad de Plugin `CRM`):

- **`GET /api/v1/{module}/{resource}`**
  - Devuelve colecciones paginadas. Soporta paginación por Query Params (`?page=1&limit=50`).
- **`GET /api/v1/{module}/{resource}/{id}`**
  - Solicita un registro individual específico encapsulado.
- **`POST /api/v1/{module}/{resource}`**
  - Crea la entidad invocando el UseCase asociado (Validaciones Centralizadas devuelven `422 Unprocessable Entity` si hay fallo de reglas de negocio).
- **`PUT /api/v1/{module}/{resource}/{id}`**
  - Modifica el estado/propiedad de un agregado.
- **`DELETE /api/v1/{module}/{resource}/{id}`**
  - Ejecuta bajado/borrado lógico asegurando invariantes y comprobaciones de dependencias (ej. Fallará si intentas borrar una categoría con subelementos adjuntos).

## Server-Driven UI (SDUI)

Uno de los mecanismos clave de la API no es sólo servir Data cruda sino inyectar Formato visual para Vue.

### Endpoints Metadatos SDUI

Adicionalmente, bajo ciertos prefijos, la API es capaz de inyectar a Vue 3 un Documento de Esquemas:

- **`GET /api/v1/schemas/{resource}`**
  - Expone el JSON Blueprint: Define si los campos son cadenas de texto numéricas (`type: string/number`), reglas de renderizado y el comportamiento en front (ej. Inputs para lectura de modo `GenericFichaTab`).

### Estructura de Respuesta

Para aislar errores de red de errores de lógica, la respuesta general para `200 OK` en Payload es tipada:

```json
{
  "success": true,
  "data": {
    "collection": [...],
    "pagination": { "current": 1, "total": 120 }
  },
  "message": "Operación completada"
}
```

Respecto a un Payload con errores de Validaciones (`422 Unprocessable Entity`):

```json
{
  "success": false,
  "error_code": "VALIDATION_FAILED",
  "errors": {
      "cif_vat": ["Formato NIF intracomunitario incorrecto."]
  }
}
```

## Control de Autenticación / Authorization

Se implementa un flujo dual vía **Bearer Tokens (JWT)**:

- Authorization Headers: `Authorization: Bearer eyJhb...`
- El middleware de Seguridad inyectado desde `AuthorizationService` verificará que el Token JWT sea válido e inferirá los Roles (`llx_user_rights`) a nivel Port. Cualquier salto invalido rechazará la conexión con `403 Forbidden` / `401 Unauthorized` de inmediato antes de contactar con la capa de `Domain/Application`.
