<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Permission Value Object — identifies a single capability in the system.
 *
 * A permission is a triple: plugin + resource + action.
 * Example: plugin='crm', resource='thirdparty', action='create'
 * Key: 'crm.thirdparty.create'
 *
 * Permissions are created by plugins when they register their capabilities.
 * The Core defines its own permissions (e.g., 'core.user.read', 'core.role.update').
 */
final class Permission
{
    public function __construct(
        private ?int $id,
        private string $plugin,
        private string $resource,
        private string $action,
        private ?string $description = null,
    ) {
    }

    /**
     * Reconstitute from persistence.
     *
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        return new self(
            id: isset($data['id']) ? (int) $data['id'] : null,
            plugin: $data['plugin'],
            resource: $data['resource'],
            action: $data['action'],
            description: $data['description'] ?? null,
        );
    }

    /**
     * Create from a key string (e.g., 'crm.thirdparty.create').
     */
    public static function fromKey(string $key): self
    {
        $parts = explode('.', $key);

        if (count($parts) !== 3) {
            throw new \InvalidArgumentException(
                "Permission key must have exactly 3 parts (plugin.resource.action), got: '{$key}'"
            );
        }

        return new self(
            id: null,
            plugin: $parts[0],
            resource: $parts[1],
            action: $parts[2],
        );
    }

    // ── Identity ─────────────────────────────────────────────

    /**
     * Get the canonical key: 'plugin.resource.action'.
     */
    public function getKey(): string
    {
        return "{$this->plugin}.{$this->resource}.{$this->action}";
    }

    /**
     * Value equality — two permissions are equal if they have the same key.
     */
    public function equals(self $other): bool
    {
        return $this->getKey() === $other->getKey();
    }

    // ── Accessors ────────────────────────────────────────────

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPlugin(): string
    {
        return $this->plugin;
    }

    public function getResource(): string
    {
        return $this->resource;
    }

    public function getAction(): string
    {
        return $this->action;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    // ── Serialization ────────────────────────────────────────

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id'          => $this->id,
            'key'         => $this->getKey(),
            'plugin'      => $this->plugin,
            'resource'    => $this->resource,
            'action'      => $this->action,
            'description' => $this->description,
        ];
    }
}
