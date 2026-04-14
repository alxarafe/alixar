# Alixar: Strangler Fig Playbook (Guía Lógica API-Gateway)

Este documento reemplaza a la antigua guía de persistencia y sirve como el actual manifiesto de la arquitectura **API-Level Anti-Corruption Layer (ACL)** de Alixar.

Ante la directriz de: *"Migrar el Módulo X"*, el agente o desarrollador debe ejecutar exactamente este flujo.

---

## 🌊 Flujo Paralelo: Regla de Oro
**NUNCA debes emular ni conectar con la base de datos de Dolibarr, ni usar el prefijo `llx_`.**
La base de datos de Alixar es independiente, normalizada, y los dominios de Alixar (`plugins/hr`, `plugins/crm`) poseen sus migraciones limpias y su infraestructura autónoma.

La integración / retrocompatibilidad con el legado de Dolibarr vive puramente como una **traductor HTTP** dentro del plugin `dolibarr-compat`. `dolibarr-compat` intercepta APIs de Dolibarr, mapea el JSON con el formato antiguo, y se lo pasa a Alixar Nativo.

---

## 👣 Pasos para cada Plugin / Módulo a Migrar

### Paso 1. Dominio Nativo, Persistencia, y API Limpia (Ej. `plugins/crm`)

1. **Entidades (Domain):** Crear entidad de negocio pura (e.g. `ThirdParty.php`) y sus DTOs/Value Objects.
2. **Migración SQL (DB):** Crear scripts de migración normalizados en `plugins/crm/migrations/` (Ej: `001_create_third_parties.php`) donde la tabla se llame `third_parties` sin usar prefijo forzado `llx_`.
3. **Repositorio SQL (Infrastructure):** Crear el `MysqlThirdPartyRepository.php` que usa `$pdo` para dialogar con tu nueva y reluciente tabla `third_parties`.
4. **Casos de Uso (Application):** Crear servicios `CreateThirdParty`, `GetThirdParty` etc.
5. **Controlador Nativo (API):** Componente que expone `GET /api/v1/thirdparties` en formato ideal moderno para el Frontend.

### Paso 2. Adaptador de Retrocompatibilidad (En `dolibarr-compat`)

Para mantener el 100% de la suite de tests de Dolibarr funcionando:

1. **Definir el Mapper:**
   Creas un array declarativo dentro del transformador `ThirdPartyLegacyMapper` que relacione los nombres engorrosos legacy con los limpios:
   ```php
   protected array $mapping = [
       'rowid'       => 'id',
       'nom'         => 'name',
       'date_crea'   => ['target' => 'createdAt', 'cast' => 'timestamp_to_date'],
   ];
   ```

2. **Crear el Controlador Legacy:**
   En `plugins/dolibarr-compat/src/Infrastructure/Http/Api/Controller/` publicas tu controlador (ej. `LegacyThirdPartyApiController.php`). Este hereda las mecánicas base. Se traga el request dirigido a `/api/index.php/thirdparties` (el que hace postman/bruno o un software de terceros creyendo que eres Dolibarr), lo mapea, lanza el Caso de Uso puro de Alixar, recoge la entidad, y responde el JSON mapeado al reverso.

### Paso 3. Verificación Estricta (Integración)

- Correr `bin/api_compare.sh` asegurándote de que la vieja API responde lo mismo.
- Ejecutar PHPStan `vendor/bin/phpstan analyse` asegurando que toda la tipificación está limpia.

## 🏁 Destino Final
El día que se decida apagar Dolibarr para siempre, simplemente se elimina por completo la carpeta `dolibarr-compat`. Alixar y todo su ecosistema seguirán funcionando a la perfección de forma moderna y sin un solo rastro de dependencias heredadas.
