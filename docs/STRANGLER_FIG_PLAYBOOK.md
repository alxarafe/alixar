# Alixar: Strangler Fig Playbook (Guía Lógica de Migración por Plugin)

Este documento sirve como un **recordatorio del protocolo a seguir ciegamente** al migrar cualquier módulo heredado (legacy) de Dolibarr hacia el ecosistema modular de Alixar.

Ante la directriz de: *"Migrar el Módulo X"*, el agente o desarrollador debe ejecutar exactamente este flujo de forma paralela.

---

## 🌊 Flujo Paralelo: Regla de Oro
**NUNCA debes crear lógica de conexión a la base de datos de Dolibarr dentro del plugin de destino (`crm`, `trading`, `finance`).**
Toda integración física con la base de datos legacy vive y muere dentro de `dolibarr-compat`.

---

## 👣 Pasos para cada Plugin / Módulo a Migrar

### Paso 1. Definición Funcional y Pura (En el Plugin de Dominio)
**(Ejemplo de destino: `plugins/crm`)**

1. **Entidades (Domain):** Crear la entidad de negocio pura (e.g. `Domain/ThirdParty/ThirdParty.php`) con sus DTOs y validadores agnósticos. No puede extender de nada que diga "Dolibarr" ni "PDO".
2. **Interfaces de Repositorio (Domain):** Definir **solo** el contrato de cómo se cargan, guardan y se buscan estos datos (`ThirdPartyRepositoryInterface`).
3. **Casos de Uso (Application):** Crear las Clases (Ej: `CreateThirdParty`, `GetThirdPartyById`) que utilicen la interfaz del repositorio, no la implementación.
4. **Controladores Web/API (Infrastructure):** Exponer los endpoints REST (e.g., `GET /api/crm/thirdparties`).

### Paso 2. Adaptación Heredada e Insalubre (En `dolibarr-compat`)
**(Ejemplo de destino: `plugins/dolibarr-compat`)**

1. **Implementación Física:** Ir a `src/Infrastructure/Persistence/Mysql/...` correspondiente (e.g., `Mysql/Crm/DolibarrMysqlThirdPartyRepository.php`).
2. **Implementar Interfaces:** Indicar explícitamente que se implementa la Interfaz creada en el paso 1.1 (`implements ThirdPartyRepositoryInterface`).
3. **Mapeo Sucio (El Estrangulamiento):** Manejar las tablas físicas legacy (ej. `SELECT * FROM llx_societe`). Formatear los resultados para devolver la entidad pura de Dominio que el plugin original demanda.

### Paso 3. Inyección de Dependencias (El Superpegamento)

1. En el contenedor de Dependencias Global / Bootstrapper, vincular (bind) la interfaz del Dominio a la implementación Legacy:
   ```php
   $container->bind(
       \Plugin\Crm\Domain\ThirdParty\ThirdPartyRepositoryInterface::class, 
       \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm\DolibarrMysqlThirdPartyRepository::class
   );
   ```

### Paso 4. Verificación Estricta (PHPStan)

Correr invariablemente `vendor/bin/phpstan analyse`.
- Si `plugins/crm` lanza un error porque desconoce algo de la BBDD -> **FRACASO**. Hay fuga de dependencia legacy.
- Si todo pasa y se devuelve una Entidad pura -> **ÉXITO**. El módulo ha sido estrangulado correctamente.

## 🏁 En el Futuro...
El día que las tablas de Dolibarr de ese módulo (`llx_societe`, etc.) puedan ser eliminadas porque tenemos nuestro propio schema limpio, el **Paso 1** permanecerá absolutamente idéntico, y el **Paso 2** será simplemente escrito en un nuevo adaptador `TenantMysql...` modificando solo el **Paso 3**.
