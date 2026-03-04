# Alxarafe Core Request: ModuleManager Stability & ModuleController Bugfixes

## Priority: High
## Status: Pending
## Requested by: Alixar project
## Date: 2026-03-04

## Summary

This request addresses three stability issues found during Alixar development:

1. **Fatal Error: Visibility Collision**: `ModuleController::$template` was defined as `protected`, colliding with the `public` property in `ViewController` (via `ViewTrait`).
2. **Warning: Missing Controller Folder**: `ModuleManager::getControllers` fails with a warning when a module directory exists but does not contain a `Controller` subfolder.
3. **Invalid Method Call**: `ModuleController` was using `addVar()` which is not defined in the framework (should be `addVariable()`).

## Proposed Changes

### 1. ModuleManager.php (Robustness)

In `ModuleManager::getControllers`, add a check for directory existence:

```php
private static function getControllers(string $namespace, string $path, string $directory): array
{
    $result = [];
    $controllerPath = $path . '/' . $directory . '/Controller';
    if (!is_dir($controllerPath)) {
        return [];
    }
    $files = scandir($controllerPath);
    // ... rest of the logic using $controllerPath
}
```

### 2. ModuleController.php (Syntax & Visibility)

- Remove `protected string $template = ...`.
- Call `$this->setDefaultTemplate('page/modules')` inside `doIndex()`.
- Replace `addVar()` with `addVariable()`.

```php
    public function doIndex(): bool
    {
        $this->setDefaultTemplate('page/modules');
        $modules = $this->getDiscoveredModules();
        $this->addVariable('modules', $modules);
        $this->addVariable('title', Trans::_('modules'));
        return true;
    }
```

## Impact

- **Stability**: Prevents Fatal Errors on systems with strict visibility checking.
- **Log Hygiene**: Removes recurrent PHP Warnings during menu generation.
- **Correctness**: Fixes broken functionality in the Admin module.

## Use Case (Alixar)

Alixar provides modules with templates but no controllers (e.g., `Modules/Admin` in Alixar root). The current `ModuleManager` throws warnings when it encounters these folders.
