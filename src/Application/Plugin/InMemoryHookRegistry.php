<?php

declare(strict_types=1);

namespace Core\Application\Plugin;

/**
 * In-memory implementation of HookRegistryInterface.
 *
 * Stores all hook listeners in memory and executes them in priority order.
 * Suitable for single-request PHP lifecycle (no persistence needed).
 */
final class InMemoryHookRegistry implements HookRegistryInterface
{
    /**
     * @var array<string, array<int, callable[]>>
     * Structure: $listeners['hook_name'][priority][] = callable
     */
    private array $listeners = [];

    /**
     * {@inheritdoc}
     */
    #[\Override]
    public function on(string $hook, callable $handler, int $priority = 10): void
    {
        $this->listeners[$hook][$priority][] = $handler;
    }

    /**
     * {@inheritdoc}
     */
    #[\Override]
    public function filter(string $hook, array $data): array
    {
        foreach ($this->getListenersForHook($hook) as $handler) {
            $result = $handler($data);
            if (is_array($result)) {
                $data = $result;
            }
        }

        return $data;
    }

    /**
     * {@inheritdoc}
     */
    #[\Override]
    public function action(string $hook, array $data): void
    {
        foreach ($this->getListenersForHook($hook) as $handler) {
            $handler($data);
        }
    }

    /**
     * Get all listeners for a hook, sorted by priority (ascending).
     *
     * @return callable[]
     */
    private function getListenersForHook(string $hook): array
    {
        if (!isset($this->listeners[$hook])) {
            return [];
        }

        $byPriority = $this->listeners[$hook];
        ksort($byPriority, SORT_NUMERIC);

        $sorted = [];
        foreach ($byPriority as $handlers) {
            foreach ($handlers as $handler) {
                $sorted[] = $handler;
            }
        }

        return $sorted;
    }

    /**
     * Check if any listeners are registered for a hook.
     * Useful for debugging and testing.
     */
    public function hasListeners(string $hook): bool
    {
        return !empty($this->listeners[$hook]);
    }

    /**
     * Get the count of listeners for a hook.
     */
    public function getListenerCount(string $hook): int
    {
        if (!isset($this->listeners[$hook])) {
            return 0;
        }

        $count = 0;
        foreach ($this->listeners[$hook] as $handlers) {
            $count += count($handlers);
        }
        return $count;
    }
}
