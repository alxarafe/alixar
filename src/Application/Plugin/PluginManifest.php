<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

/**
 * Represents the parsed contents of a plugin's plugin.json manifest file.
 *
 * This is a pure value object — no side effects, no I/O.
 * The PluginLoader creates instances by reading plugin.json files from disk.
 */
final class PluginManifest
{
    public readonly string $name;
    public readonly string $version;
    public readonly string $displayName;
    public readonly string $description;
    public readonly string $icon;
    public readonly string $author;

    /** @var string[] Required plugins — activation blocked if missing */
    public readonly array $requires;

    /** @var string[] Optional integrations — hooks are registered if present */
    public readonly array $optionalDeps;

    /** @var string[] Incompatible plugins — cannot coexist */
    public readonly array $conflicts;

    /** @var array{entities?: string[], apiRoutes?: string, migrations?: string, schemas?: string} */
    public readonly array $provides;

    /** Absolute path to the plugin's root directory */
    public readonly string $path;

    /** @var array{submodules?: array<string, array{label: string, default: bool}>} */
    public readonly array $submodules;

    /**
     * @param array<string, mixed> $data   Decoded plugin.json contents
     * @param string               $path   Absolute path to the plugin directory
     */
    public function __construct(array $data, string $path)
    {
        $this->name        = $data['name'] ?? throw new \InvalidArgumentException(
            "Plugin manifest in {$path} is missing required field 'name'."
        );
        $this->version     = $data['version'] ?? '0.0.0';
        $this->displayName = $data['displayName'] ?? $this->name;
        $this->description = $data['description'] ?? '';
        $this->icon        = $data['icon'] ?? '';
        $this->author      = $data['author'] ?? '';

        $this->requires    = $data['requires'] ?? [];
        $this->optionalDeps = $data['optionalDeps'] ?? [];
        $this->conflicts   = $data['conflicts'] ?? [];

        $this->provides    = $data['provides'] ?? [];
        $this->submodules  = $data['submodules'] ?? [];

        $this->path = rtrim($path, '/');
    }

    /**
     * Absolute path to the plugin's routes file.
     */
    public function getRoutesPath(): string
    {
        $custom = $this->provides['apiRoutes'] ?? null;
        return $custom
            ? $this->path . '/' . ltrim($custom, '/')
            : $this->path . '/src/Infrastructure/Http/routes.php';
    }

    /**
     * Absolute path to the plugin's hooks file.
     */
    public function getHooksPath(): string
    {
        return $this->path . '/src/Infrastructure/Http/hooks.php';
    }

    /**
     * Absolute path to the plugin's migrations directory.
     */
    public function getMigrationsPath(): string
    {
        $custom = $this->provides['migrations'] ?? null;
        return $custom
            ? $this->path . '/' . ltrim($custom, '/')
            : $this->path . '/migrations';
    }

    /**
     * Absolute path to the plugin's frontend schemas directory.
     */
    public function getSchemasPath(): string
    {
        $custom = $this->provides['schemas'] ?? null;
        return $custom
            ? $this->path . '/' . ltrim($custom, '/')
            : $this->path . '/frontend/schemas';
    }

    /**
     * PSR-4 namespace root for this plugin.
     * Convention: Plugin\{StudlyCase name}\
     */
    public function getNamespace(): string
    {
        return 'Plugin\\' . str_replace(' ', '', ucwords(str_replace(['-', '_'], ' ', $this->name))) . '\\';
    }

    /**
     * PSR-4 source directory.
     */
    public function getSourcePath(): string
    {
        return $this->path . '/src';
    }
}
