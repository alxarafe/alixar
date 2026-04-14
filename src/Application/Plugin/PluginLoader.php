<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

/**
 * Discovers plugins by scanning a directory for plugin.json manifests.
 *
 * Responsible for:
 * - Finding all available plugins on disk
 * - Registering PSR-4 autoloaders for active plugins
 *
 * Does NOT decide which plugins are active — that's PluginRegistry's job.
 */
final class PluginLoader
{
    /**
     * Discover all plugins that have a valid plugin.json manifest.
     *
     * @param string $pluginsDir  Absolute path to the plugins/ directory
     * @return PluginManifest[]   Array of discovered plugin manifests
     */
    public function discover(string $pluginsDir): array
    {
        if (!is_dir($pluginsDir)) {
            return [];
        }

        $manifests = [];
        $manifestFiles = glob($pluginsDir . '/*/plugin.json');

        if ($manifestFiles === false) {
            return [];
        }

        foreach ($manifestFiles as $manifestFile) {
            $json = file_get_contents($manifestFile);
            if ($json === false) {
                continue;
            }

            $data = json_decode($json, true);
            if (!is_array($data)) {
                continue;
            }

            try {
                $manifests[] = new PluginManifest($data, dirname($manifestFile));
            } catch (\InvalidArgumentException) {
                // Skip plugins with invalid manifests — log in the future
                continue;
            }
        }

        return $manifests;
    }

    /**
     * Register a PSR-4 autoloader for a plugin's source directory.
     *
     * This allows the plugin's classes to be autoloaded without
     * being pre-declared in composer.json.
     *
     * @param PluginManifest $plugin The plugin to register
     */
    public function registerAutoloader(PluginManifest $plugin): void
    {
        $namespace = $plugin->getNamespace();
        $sourcePath = $plugin->getSourcePath();

        if (!is_dir($sourcePath)) {
            return;
        }

        spl_autoload_register(function (string $class) use ($namespace, $sourcePath): void {
            if (!str_starts_with($class, $namespace)) {
                return;
            }

            $relativeClass = substr($class, strlen($namespace));
            $file = $sourcePath . '/' . str_replace('\\', '/', $relativeClass) . '.php';

            if (file_exists($file)) {
                require $file;
            }
        });
    }
}
