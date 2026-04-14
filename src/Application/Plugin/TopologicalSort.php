<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

use Core\Application\Plugin\Exception\CyclicDependencyException;

/**
 * Topological sort for plugin load ordering.
 *
 * Ensures that dependencies are loaded before the plugins that require them.
 * Uses Kahn's algorithm (BFS-based) for deterministic, stable ordering.
 */
final class TopologicalSort
{
    /**
     * Sort plugins in dependency order (dependencies first).
     *
     * @param PluginManifest[] $plugins  Indexed by plugin name
     * @return PluginManifest[]          Sorted list
     *
     * @throws CyclicDependencyException if a dependency cycle is detected
     */
    public static function sort(array $plugins): array
    {
        // Build adjacency list and in-degree count
        $inDegree = [];
        $dependents = []; // $dependents[$dep][] = $plugin (plugins that depend on $dep)

        foreach ($plugins as $name => $plugin) {
            if (!isset($inDegree[$name])) {
                $inDegree[$name] = 0;
            }

            foreach ($plugin->requires as $dep) {
                // Only count dependencies that are in our active set
                if (isset($plugins[$dep])) {
                    $dependents[$dep][] = $name;
                    $inDegree[$name]++;
                }
            }
        }

        // Start with plugins that have no dependencies
        $queue = [];
        foreach ($inDegree as $name => $degree) {
            if ($degree === 0) {
                $queue[] = $name;
            }
        }

        $sorted = [];

        while (!empty($queue)) {
            // Sort queue for deterministic output
            sort($queue);
            $current = array_shift($queue);
            $sorted[] = $plugins[$current];

            foreach ($dependents[$current] ?? [] as $dependent) {
                $inDegree[$dependent]--;
                if ($inDegree[$dependent] === 0) {
                    $queue[] = $dependent;
                }
            }
        }

        // If we didn't process all plugins, there's a cycle
        if (count($sorted) !== count($plugins)) {
            $remaining = array_diff(
                array_keys($plugins),
                array_map(fn(PluginManifest $p) => $p->name, $sorted)
            );
            throw new CyclicDependencyException(array_values($remaining));
        }

        return $sorted;
    }
}
