<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

/**
 * Contract for the inter-plugin communication bus.
 *
 * Two types of hooks:
 * - **Filter**: Modify data as it passes through (each listener receives and returns data).
 * - **Action**: React to an event (listeners receive data but don't return anything).
 *
 * Listeners are ordered by priority (lower = earlier). Default priority is 10.
 */
interface HookRegistryInterface
{
    /**
     * Register a listener for a hook.
     *
     * @param string   $hook     Hook name (e.g., 'thirdparty.tabs', 'invoice.validated')
     * @param callable $handler  For filters: fn(array $data): array. For actions: fn(array $data): void.
     * @param int      $priority Lower values execute first. Default: 10.
     */
    public function on(string $hook, callable $handler, int $priority = 10): void;

    /**
     * Emit a filter hook — each listener modifies and returns the data.
     *
     * @param string $hook  Hook name
     * @param array  $data  Initial data to pass through the filter chain
     * @return array        Modified data after all listeners have processed it
     */
    public function filter(string $hook, array $data): array;

    /**
     * Emit an action hook — listeners react but don't modify data.
     *
     * @param string $hook  Hook name
     * @param array  $data  Data to pass to all listeners
     */
    public function action(string $hook, array $data): void;
}
