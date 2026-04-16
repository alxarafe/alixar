<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

use Core\Application\Plugin\Exception\ConflictException;
use Core\Application\Plugin\Exception\DependencyBlockException;
use Core\Application\Plugin\Exception\DependencyNotMetException;

/**
 * Central registry that manages plugin discovery, activation, and load ordering.
 *
 * Responsibilities:
 * - Knows which plugins are discovered (on disk) vs active (enabled)
 * - Enforces dependency and conflict constraints
 * - Provides the correct load order (topological sort)
 */
final class PluginRegistry
{
    /** @var array<string, PluginManifest> All discovered plugins, indexed by name */
    private array $discovered = [];

    /** @var array<string, PluginManifest> Active plugins, indexed by name */
    private array $active = [];

    /** @var PluginManifest[]|null Cached load order (invalidated on changes) */
    private ?array $loadOrderCache = null;

    /**
     * Register a discovered plugin manifest.
     * This does NOT activate the plugin — it just makes it available.
     */
    public function register(PluginManifest $manifest): void
    {
        $this->discovered[$manifest->name] = $manifest;
    }

    /**
     * Register multiple discovered plugin manifests.
     *
     * @param PluginManifest[] $manifests
     */
    public function registerAll(array $manifests): void
    {
        foreach ($manifests as $manifest) {
            $this->register($manifest);
        }
    }

    /**
     * Activate a plugin by name.
     *
     * Verifies:
     * 1. The plugin is discovered
     * 2. All required dependencies are active
     * 3. No conflicting plugins are active
     *
     * @throws \InvalidArgumentException if plugin is not discovered
     * @throws DependencyNotMetException if a required dependency is not active
     * @throws ConflictException if a conflicting plugin is active
     */
    public function activate(string $name): void
    {
        if (!isset($this->discovered[$name])) {
            throw new \InvalidArgumentException("Plugin '{$name}' is not discovered. Is its folder present in plugins/?");
        }

        if ($this->isActive($name)) {
            return; // Already active, no-op
        }

        $plugin = $this->discovered[$name];

        // Check required dependencies
        foreach ($plugin->requires as $dep) {
            if (!$this->isActive($dep)) {
                throw new DependencyNotMetException($name, $dep);
            }
        }

        // Check conflicts
        foreach ($plugin->conflicts as $conflict) {
            if ($this->isActive($conflict)) {
                throw new ConflictException($name, $conflict);
            }
        }

        $this->active[$name] = $plugin;
        $this->loadOrderCache = null; // Invalidate cache
    }

    /**
     * Deactivate a plugin by name.
     *
     * Blocks deactivation if other active plugins depend on this one.
     *
     * @throws DependencyBlockException if an active plugin depends on this one
     */
    public function deactivate(string $name): void
    {
        if (!$this->isActive($name)) {
            return; // Not active, no-op
        }

        // Check if any other active plugin depends on this one
        foreach ($this->active as $otherName => $other) {
            if ($otherName === $name) {
                continue;
            }
            if (in_array($name, $other->requires, true)) {
                throw new DependencyBlockException($name, $otherName);
            }
        }

        unset($this->active[$name]);
        $this->loadOrderCache = null;
    }

    /**
     * Activate multiple plugins, resolving dependencies automatically.
     *
     * Plugins are sorted topologically before activation, so dependencies
     * are activated before the plugins that require them.
     *
     * @param string[] $names Plugin names to activate
     */
    public function activateAll(array $names): void
    {
        // First, build a subset of discovered plugins to sort
        $toActivate = [];
        foreach ($names as $name) {
            if (isset($this->discovered[$name])) {
                $toActivate[$name] = $this->discovered[$name];
            }
        }

        // Sort topologically so dependencies come first
        $sorted = TopologicalSort::sort($toActivate);

        // Activate in order
        foreach ($sorted as $plugin) {
            $this->activate($plugin->name);
        }
    }

    /**
     * Check if a plugin is active.
     */
    public function isActive(string $name): bool
    {
        return isset($this->active[$name]);
    }

    /**
     * Check if a plugin is discovered (folder exists with valid manifest).
     */
    public function isDiscovered(string $name): bool
    {
        return isset($this->discovered[$name]);
    }

    /**
     * Get all active plugins in topological load order (dependencies first).
     *
     * @return PluginManifest[]
     */
    public function getLoadOrder(): array
    {
        if ($this->loadOrderCache === null) {
            $this->loadOrderCache = TopologicalSort::sort($this->active);
        }

        return $this->loadOrderCache;
    }

    /**
     * Get all discovered plugin manifests.
     *
     * @return array<string, PluginManifest>
     */
    public function getDiscovered(): array
    {
        return $this->discovered;
    }

    /**
     * Get all active plugin manifests.
     *
     * @return array<string, PluginManifest>
     */
    public function getActive(): array
    {
        return $this->active;
    }

    /**
     * Get names of active plugins that a given plugin optionally integrates with.
     *
     * @return string[] Names of active optional dependencies
     */
    public function getActiveOptionalDeps(string $name): array
    {
        if (!isset($this->discovered[$name])) {
            return [];
        }

        return array_filter(
            $this->discovered[$name]->optionalDeps,
            fn(string $dep) => $this->isActive($dep)
        );
    }
}
