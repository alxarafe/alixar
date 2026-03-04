# Alxarafe Core Request: Include `parent` and `class` in MenuManager output

## Priority: High
## Status: Pending
## Requested by: Alixar project
## Date: 2026-03-03

## Summary

`MenuManager::addToMenu()` currently drops the `parent` and `class` fields from the `#[Menu]` attribute
when building the menu item arrays. These fields are defined in `Alxarafe\Attribute\Menu` but are never
passed through to the consumer.

Including them enables any application built on Alxarafe to implement **hierarchical/contextual menus**
(e.g., a sidebar that changes based on the active top-level module) without workarounds.

## Current Code (MenuManager.php, line ~280)

```php
$menus[$attr->menu][] = [
    'label' => Trans::_($attr->label ?? $controller),
    'icon' => $attr->icon,
    'route' => $route,
    'url' => $url,
    'order' => $attr->order,
    'permission' => $attr->permission,
    'visibility' => $attr->visibility,
    'badge' => $badge,
    'badgeClass' => $attr->badgeClass,
];
```

## Proposed Change

```php
$menus[$attr->menu][] = [
    'label' => Trans::_($attr->label ?? $controller),
    'icon' => $attr->icon,
    'route' => $route,
    'url' => $url,
    'order' => $attr->order,
    'permission' => $attr->permission,
    'visibility' => $attr->visibility,
    'badge' => $badge,
    'badgeClass' => $attr->badgeClass,
    'parent' => $attr->parent,   // NEW: enables hierarchical menu building
    'class' => $attr->class,     // NEW: enables custom CSS classes per item
];
```

## Impact

- **Backward compatible**: Both fields default to `null` in the `Menu` attribute.
- **No breaking changes**: Existing templates that don't use `parent`/`class` are unaffected.
- **Benefit**: Any Alxarafe application can build multi-level contextual menus by filtering
  `main_menu` items based on their `parent` relationship to `top_menu` controllers.

## Use Case (Alixar)

Alixar controllers already declare `parent:` in their `#[Menu]` attributes:

```php
#[Menu(
    menu: 'main_menu',
    label: 'Pedidos Client.',
    icon: 'fas fa-shopping-basket',
    parent: ProposalController::class,  // <-- This is lost by MenuManager
    order: 10,
)]
class OrderController extends ResourceController { }
```

With this change, the template can filter the sidebar dynamically:

```php
// In body_standard.blade.php
$activeModule = /* detect from URL */;
$sidebarItems = array_filter($main_menu, fn($item) => $item['parent'] === $activeModule);
```
