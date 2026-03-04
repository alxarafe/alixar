# Sistema de Plantillas Alxarafe: Análisis y Estrategia de Override Mínimo para Alixar

## 1. Análisis del Sistema de Plantillas de Alxarafe

### 1.1 Resolución de Vistas (View Path Priority)

`ViewController.__construct()` registra rutas en este orden:

| Prioridad | Ruta | Descripción |
|-----------|------|-------------|
| 1ª (gana) | `APP_PATH/templates` | Templates de la app (Alixar) |
| 2ª | `APP_PATH/themes/{theme}/templates` | Override del tema activo en la app |
| 3ª (fallback) | `ALX_PATH/templates` | Templates del framework |

> [!IMPORTANT]
> `Jenssegers\Blade` usa `Illuminate\View\FileViewFinder` que busca la vista en el **primer path que la contenga**. Esto significa que un archivo en `APP_PATH/templates` **siempre gana** sobre el mismo archivo en `ALX_PATH/templates`, independientemente del tema activo.

### 1.2 Estructura de Plantillas del Framework

```
vendor/alxarafe/alxarafe/templates/
├── partial/
│   ├── layout/main.blade.php     ← Layout base (HTML, head, body, footer)
│   ├── body_standard.blade.php   ← Sidebar + Content (con $main_menu)
│   ├── body_empty.blade.php      ← Sin sidebar
│   ├── user_menu.blade.php       ← TopBar completa: reloj, notificaciones, user, lang, theme switcher
│   ├── main_menu.blade.php       ← Sidebar con $main_menu dinámico
│   ├── head.blade.php            ← Meta, CSS, theme CSS dinámico
│   ├── footer.blade.php          ← jQuery, Bootstrap JS, Select2, scripts
│   ├── alerts.blade.php          ← Alertas del sistema
│   ├── theme_switcher.blade.php  ← Selector de temas (ya funcional)
│   └── lang_switcher.blade.php   ← Selector de idiomas (ya funcional)
├── core/
│   ├── resource_list.blade.php   ← Listado AJAX genérico
│   └── resource_edit.blade.php   ← Formulario edición AJAX genérico
├── component/                    ← ~50 componentes Blade (cards, forms, badges...)
├── container/                    ← Panels, tabs, grids
├── form/                         ← Inputs especializados
├── page/                         ← migration.blade.php
└── themes/
    ├── default/                  ← (vacío — usa estilos CDN)
    ├── cyberpunk/                ← 7 overrides (ejemplo ideal de tema minimal)
    ├── alternative/              ← 5 overrides (solo formularios)
    ├── vintage/                  
    └── high-contrast/            
```

### 1.3 Funcionalidades Nativas que Alxarafe YA Ofrece

| Funcionalidad | Archivo | Estado en Alixar |
|---|---|---|
| **Sidebar** con `$main_menu` dinámico | `partial/main_menu.blade.php` | ❌ Duplicado — Alixar reescribe innecesariamente |
| **TopBar** con reloj, notificaciones, avatar | `partial/user_menu.blade.php` | ❌ Reemplazado por `user_menu_simple.blade.php` (pierde reloj, notificaciones, lang/theme) |
| **Selector de temas** | `partial/theme_switcher.blade.php` | ❌ No incluido — Alixar pierde esta feature nativa |
| **Selector de idiomas** | `partial/lang_switcher.blade.php` | ❌ No incluido |
| **Layout base** HTML | `partial/layout/main.blade.php` | ✅ Reutilizado |
| **Alertas** | `partial/alerts.blade.php` | ✅ Reutilizado |
| **Footer** (JS, Select2) | `partial/footer.blade.php` | ✅ Reutilizado |
| **Resource List/Edit** | `core/resource_*.blade.php` | ⚠️ Parcialmente sobreescrito |
| **CSS dinámico por tema** | `partial/head.blade.php` (l.18) | ❌ Sobreescrito — pierde carga dinámica de `default.css` |

### 1.4 Patrón de Override de Temas (Ejemplo: Cyberpunk)

El tema **cyberpunk** es el ejemplo ideal de override minimal:
- **7 archivos** Blade que sobreescriben solo lo visual
- **1 archivo CSS** (`css/default.css`) para estilos
- **Reutiliza** `partial/alerts.blade.php`, `partial/footer.blade.php`, `partial/head.blade.php`, `partial/theme_switcher.blade.php`, `partial/lang_switcher.blade.php` y todos los `component/` del framework

---

## 2. Necesidades de Alixar (Clon de Dolibarr)

Dolibarr tiene una estructura de menú más compleja que Alxarafe:

| Elemento | Alxarafe | Dolibarr/Alixar |
|---|---|---|
| Menú superior | No tiene (usa sidebar) | Sí — con iconos de módulos |
| Sidebar | Sí, plano | Sí — con submenús jerárquicos |
| Menú de usuario | TopBar horizontal | Dropdown con avatar |
| Breadcrumbs | No | Deseable |
| Pestañas de registro | Sí (TabGroup) | Sí (similar) |

### Elementos Extra que Alixar Necesita (sin tocar Alxarafe)

1. **TopBar horizontal** con iconos de módulos principales → Override de `partial/body_standard.blade.php`
2. **Sidebar con submenús** → Override de `partial/main_menu.blade.php`
3. **CSS premium** → `public/themes/alixar/css/default.css`
4. **Dashboard personalizado** → `page/home.blade.php` (ya existe)

---

## 3. Propuesta: Archivos que Alixar DEBE Sobreescribir

> [!TIP]
> El objetivo es mantener **≤ 6 archivos de override** en el tema Alixar, siguiendo el patrón del cyberpunk.

### Archivos NECESARIOS (6)

| Archivo | Razón |
|---|---|
| `partial/body_standard.blade.php` | Añadir TopBar horizontal + Sidebar con submenús. Es el cambio estructural principal. |
| `partial/main_menu.blade.php` | Sidebar con submenús jerárquicos (Dolibarr necesita varios niveles). |
| `css/default.css` | Estilos premium del tema (gradientes, glassmorphism, tipografía). |
| `page/home.blade.php` | Dashboard con KPIs. Ya no necesita `@extends` propio; usará el del framework. |
| `core/resource_list.blade.php` | Tabla con diseño premium (opcional, solo si se quiere styling diferente). |
| `core/resource_edit.blade.php` | Formularios con diseño premium (opcional). |

### Archivos que Alixar DEBE ELIMINAR (redundantes)

| Archivo Actual | Razón de Eliminación |
|---|---|
| `partial/head.blade.php` | El del framework ya carga CSS dinámico por tema. No es necesario duplicar. |
| `partial/user_menu_simple.blade.php` | Pierde reloj, notificaciones, lang/theme switcher. Debe heredar del framework. |
| `partial/top_bar.blade.php` | Se integra dentro de `body_standard.blade.php` como sección interna. |

### Archivos que se MUEVEN al Tema Correcto

Los archivos actualmente en `templates/themes/alixar/` deben quedarse ahí (es la ubicación correcta para overrides de tema), pero los que están en `templates/` raíz (nivel app) se mueven al tema para que no bloqueen otros temas.

---

## 4. Integración del Selector de Temas

El framework **ya tiene** `partial/theme_switcher.blade.php` funcional. Para que funcione:

1. El `body_standard.blade.php` de Alixar debe incluir `@include('partial.user_menu')` del framework (que ya incluye el theme switcher), **o** incluir `@include('partial.theme_switcher')` en su propia TopBar.
2. El endpoint `AuthController::doSetTheme()` ya existe y funciona vía cookie `alx_theme`.
3. Los temas de Alxarafe (cyberpunk, alternative, vintage, etc.) y de Alixar (alixar, eldy) serán todos seleccionables.

---

## 5. Sugerencias de Mejora para Alxarafe (Solo Documentación)

> [!NOTE]
> Estas son sugerencias para mejorar el framework sin tocar el código. Se documentan para futura referencia.

### 5.1 Resolución de Temas en ViewController

**Problema actual**: `ViewController` busca temas de la app en `APP_PATH/themes/{theme}/templates`, pero los temas del framework están en `ALX_PATH/templates/themes/{theme}/`. Si un usuario selecciona el tema "cyberpunk" (del framework), el `ViewController` buscará en `APP_PATH/themes/cyberpunk/templates` que no existe, y las plantillas del cyberpunk que están en `ALX_PATH/templates/themes/cyberpunk/` nunca serán añadidas al path de Blade.

**Sugerencia**: Añadir un paso adicional en `ViewController.__construct()` que también busque en `ALX_PATH/templates/themes/{theme}/`:
```php
// Después de línea 89, añadir:
$alxThemePath = $alxPath . '/templates/themes/' . $theme;
if (is_dir($alxThemePath)) {
    $this->addTemplatesPath($alxThemePath);
}
```

### 5.2 Priority Inversion en addPath

**Problema**: `addPath()` añade rutas al final del array `$this->paths`. Cuando `Blade` se inicializa con esas paths, `FileViewFinder` busca **en orden**: la primera path que tenga la vista gana. Esto significa que `APP/templates` (añadida primero) siempre gana sobre `ALX/templates` (añadida al final), lo cual es correcto. Pero los temas de app se añaden **después** de los templates base de app, por lo que un override de tema en la app tiene **menor** prioridad que un archivo en `APP/templates`.

**Sugerencia**: Reordenar la construcción de paths para que `themes/{active}/templates` sea el primer path (mayor prioridad):
```
1. APP/templates/themes/{theme}/   ← Override de tema de la app (máxima prioridad)
2. ALX/templates/themes/{theme}/   ← Override de tema del framework
3. APP/templates/                   ← Templates de la app
4. ALX/templates/                   ← Framework (fallback)
```

### 5.3 CSS del Tema

**Problema**: `partial/head.blade.php` carga `themes/{activeTheme}/css/default.css`. Esto es correcto, pero si un tema de la app (en `APP_PATH`) no tiene CSS, debería fallback al CSS del framework si existe.

---

## 6. Plan de Verificación

### Verificación Automática
1. Cambiar entre todos los temas disponibles usando el selector.
2. Verificar que cada tema renderiza: sidebar, topbar, user menu, footer.
3. Confirmar que el Dashboard muestra KPIs en todos los temas.

### Verificación Manual
1. Probar que el cambio de tema se persiste (cookie `alx_theme`).
2. Verificar responsive en mobile.
3. Confirmar que el selector de idiomas funciona en todos los temas.
