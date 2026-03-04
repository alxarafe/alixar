# Módulos y Dependencias en Alxarafe

> **Fecha**: 2026-03-04  
> **Autor**: Desarrollo Alixar  
> **Estado**: Implementado v1.0

## Introducción

Alxarafe implementa un sistema de **activación/desactivación de módulos** con **resolución automática de dependencias**. Las dependencias no se declaran manualmente, sino que se detectan analizando las sentencias `use` del código PHP.

## Arquitectura

### Componentes Clave

| Componente | Ubicación | Responsabilidad |
|---|---|---|
| `ModuleManager` | `Alxarafe\Tools\ModuleManager` | Descubrimiento de módulos, iteración y generación de menús |
| `DependencyResolver` | `Alxarafe\Tools\DependencyResolver` | Grafo de dependencias auto-detectado |
| `ModuleController` | `CoreModules\Admin\Controller\ModuleController` | UI de activación/desactivación |
| `ModuleInfo` | `Alxarafe\Attribute\ModuleInfo` | Atributo PHP 8 para metadatos cosméticos |
| `Setting` | `CoreModules\Admin\Model\Setting` | Persistencia del estado on/off |

### Detección Automática de Dependencias

`DependencyResolver` recorre todos los archivos `.php` de cada módulo y extrae las sentencias `use` que referencian otros módulos:

```php
// Archivo: Modules/Sales/Controller/OrderController.php
use Modules\CRM\Controller\ThirdPartyController;  // ← Sales depende de CRM
use Modules\Products\Controller\ProductController; // ← Sales depende de Products
```

Con esto construye un **grafo dirigido**:

```
Sales → CRM
Sales → Products
Purchase → CRM
Purchase → Products
```

### Caché

El grafo se cachea en `var/cache/dependency_graph.php` para no re-escanear en cada petición. Se invalida automáticamente cuando:
- Se activa/desactiva un módulo (`ModuleManager::regenerate()`)
- Se llama a `DependencyResolver::invalidate()` explícitamente

### Desactivación en Cascada

Cuando el usuario desactiva un módulo, el sistema:

1. Calcula `getCascadeDisable($modulo)` — todos los módulos que dependen de él, transitivamente.
2. Si hay dependientes activos, devuelve `status: 'confirm_cascade'` con la lista.
3. El frontend muestra un diálogo de confirmación con todos los módulos afectados.
4. Si el usuario confirma (enviando `force=1`), todos se desactivan a la vez.

**Nota**: La activación solo activa el módulo solicitado. Si ese módulo depende de otros que están desactivados, simplemente no funcionará y se verá en la UI (la columna "Depende de" lo indica).

## Módulo Core vs Módulo Aplicación

Los módulos se clasifican según su ubicación:
- **`CoreModules`** (`vendor/alxarafe/alxarafe/src/Modules/`): Siempre activos, no desactivables. Ej: `Admin`.
- **`Modules`** (`Modules/`): Opcionales, activables/desactivables. Ej: `CRM`, `Sales`.

## Atributo ModuleInfo

Un módulo puede declarar metadatos visuales creando un archivo `Module.php` en su raíz:

```php
<?php
namespace Modules\CRM;

use Alxarafe\Attribute\ModuleInfo;

#[ModuleInfo(
    name: 'CRM',
    description: 'Gestión de terceros, contactos y relaciones comerciales',
    icon: 'fas fa-id-card',
)]
class Module {}
```

Esto es **opcional**. Si no existe, el módulo sigue funcionando con valores por defecto (nombre = nombre del directorio, icono genérico).

## Almacenamiento de Estado

El estado se guarda en la tabla `settings` con claves:

```
module_enabled_crm = '1'
module_enabled_sales = '0'
```

Los módulos `CoreModules` siempre devuelven `true` independientemente de la tabla.

## API del DependencyResolver

```php
// ¿De qué depende Sales?
DependencyResolver::getRequirements('Sales');
// → ['CRM', 'Products', 'Alixar']

// ¿Quién depende de CRM?
DependencyResolver::getDependents('CRM');
// → ['Sales', 'Purchase']

// Si desactivo CRM, ¿qué más se desactiva?
DependencyResolver::getCascadeDisable('CRM');
// → ['Sales', 'Purchase'] (transitivo)

// Forzar re-escaneo
DependencyResolver::invalidate();
```

## Diagrama de Flujo

```
Usuario: "Desactivar CRM"
    ↓
ModuleController::doToggle()
    ↓
DependencyResolver::getCascadeDisable('CRM')
    ↓
Resultado: ['Sales', 'Purchase']
    ↓
¿force=1?
    NO → JSON {status: 'confirm_cascade', dependents: [...]}
         → Frontend muestra diálogo de confirmación
    SÍ → Desactiva CRM, Sales, Purchase en Settings
         → ModuleManager::regenerate()
         → JSON {status: 'success'}
```

## Extensibilidad Futura

- **Granularidad a nivel de controlador**: El `DependencyResolver` ya detecta dependencias a nivel de controlador individual. Para activar esta funcionalidad, se necesitaría añadir claves `controller_enabled_{modulo}_{controlador}` a Settings y filtrar en `ModuleManager::iterate()`.
- **Permisos**: Son una capa independiente. Un controlador puede estar activo (disponible) pero un usuario puede no tener permiso para acceder a él. Esto se gestiona vía `Auth::$user->can()`.
