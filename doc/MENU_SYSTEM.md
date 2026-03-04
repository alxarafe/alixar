# Sistema de Menús de Alixar

## Resumen (2026-03-03)

### Arquitectura de Menú: 2 niveles dinámicos

| Nivel | Atributo | Ubicación Visual | Comportamiento |
|---|---|---|---|
| **Módulos** | `menu: 'top_menu'` | Barra superior horizontal | Siempre visible |
| **Opciones** | `menu: 'main_menu'` + `parent: X::class` | Sidebar izquierdo | **Cambia según el módulo activo** |

### Cómo Funciona el Sidebar Dinámico

Al hacer clic en un módulo del topbar, la sidebar muestra **solo** las opciones que tengan `parent:` apuntando a ese módulo:

| Módulo (topbar) | Sidebar muestra |
|---|---|
| Dashboard | (vacío) |
| CRM | Proveedores |
| Ventas | Pedidos Client., Facturas Client., Cobros |
| Compras | Pedidos Prov., Facturas Prov., Pagos Prov. |
| Productos | (vacío — sin sub-items aún) |
| Bancos | Movimientos |
| Configuración | Config. Inicial, Roles, Usuarios, Migrations, Config |

### Cómo Añadir Nuevas Opciones de Menú

```php
// Módulo principal (topbar)
#[Menu(
    menu: 'top_menu',
    label: 'Mi Módulo',
    icon: 'fas fa-star',
    order: 50,
    permission: 'MiModulo.ver'
)]
class MiModuloController extends ResourceController { }

// Subopción (sidebar — aparece solo cuando Mi Módulo está activo)
#[Menu(
    menu: 'main_menu',
    label: 'Detalle',
    icon: 'fas fa-list',
    order: 51,
    parent: MiModuloController::class,  // ← CLAVE: vincula a Mi Módulo
    permission: 'MiModulo.Detalle.ver'
)]
class DetalleController extends ResourceController { }
```

> **Items sin `parent`** se agrupan automáticamente bajo "Configuración".

### Resolución de Plantillas (Temas)

| Prioridad | Ruta | Descripción |
|---|---|---|
| 1 | `APP/templates/themes/{theme}/` | Override del tema activo en Alixar |
| 2 | `ALX/templates/themes/{theme}/` | Plantillas del tema en el framework |
| 3-6 | Module-specific paths | Plantillas de módulo |
| 7 | `APP/templates/` | Plantillas generales de Alixar |
| 8 | `ALX/templates/` | Plantillas base del framework |

### Archivos Clave

| Archivo | Propósito |
|---|---|
| `templates/partial/body_standard.blade.php` | Layout unificado con lógica de sidebar dinámico |
| `templates/partial/layout/main.blade.php` | Layout HTML base |
| `templates/themes/*/partial/layout/main.blade.php` | Override por tema (asegura layout unificado) |
| `templates/partial/head.blade.php` | Incluye CSS base + CSS dinámico del tema |
| `public/css/alixar-layout.css` | Estilos estructurales topbar+sidebar |
| `Modules/Admin/templates/page/login.blade.php` | Login unificado (sin componentes MD5) |
| `templates/page/home.blade.php` | Dashboard unificado (sin componentes MD5) |

### Dependencias

- **Alxarafe v0.4.6+**: Necesario para que `MenuManager` incluya el campo `parent` en la salida.
