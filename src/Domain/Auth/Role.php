<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Core Role entity — groups permissions for assignment to users.
 *
 * A role can be:
 * - System role (is_system = true): Created by the Core, cannot be deleted.
 * - Custom role: Created by administrators for their specific needs.
 *
 * Permission model is additive: permissions from all user roles are unioned.
 * There is no "deny" — if a user doesn't have a permission, they simply lack it.
 */
final class Role
{
    /**
     * @param Permission[] $permissions
     */
    public function __construct(
        private ?int $id,
        private string $name,
        private ?string $description = null,
        private bool $isSystem = false,
        private ?\DateTimeImmutable $createdAt = null,
        private ?\DateTimeImmutable $updatedAt = null,
        private array $permissions = [],
    ) {
    }

    /**
     * Reconstitute from persistence.
     *
     * @param array<string, mixed> $data
     * @param Permission[]         $permissions
     */
    public static function fromArray(array $data, array $permissions = []): self
    {
        return new self(
            id: (int) $data['id'],
            name: $data['name'],
            description: $data['description'] ?? null,
            isSystem: (bool) ($data['is_system'] ?? false),
            createdAt: isset($data['created_at'])
                ? new \DateTimeImmutable($data['created_at'])
                : null,
            updatedAt: isset($data['updated_at'])
                ? new \DateTimeImmutable($data['updated_at'])
                : null,
            permissions: $permissions,
        );
    }

    // ── Domain Logic ─────────────────────────────────────────

    /**
     * Check if this role grants a specific permission.
     */
    public function hasPermission(Permission $permission): bool
    {
        foreach ($this->permissions as $p) {
            if ($p->equals($permission)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Check if this role grants a permission by key string.
     */
    public function hasPermissionKey(string $key): bool
    {
        foreach ($this->permissions as $p) {
            if ($p->getKey() === $key) {
                return true;
            }
        }
        return false;
    }

    /**
     * Add a permission to this role.
     */
    public function addPermission(Permission $permission): void
    {
        if (!$this->hasPermission($permission)) {
            $this->permissions[] = $permission;
        }
    }

    /**
     * Remove a permission from this role.
     */
    public function removePermission(Permission $permission): void
    {
        $this->permissions = array_values(
            array_filter($this->permissions, fn(Permission $p) => !$p->equals($permission))
        );
    }

    // ── Accessors ────────────────────────────────────────────

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function isSystem(): bool
    {
        return $this->isSystem;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    /**
     * @return Permission[]
     */
    public function getPermissions(): array
    {
        return $this->permissions;
    }

    /**
     * Get all permission keys as flat array.
     *
     * @return string[]
     */
    public function getPermissionKeys(): array
    {
        return array_map(fn(Permission $p) => $p->getKey(), $this->permissions);
    }

    // ── Serialization ────────────────────────────────────────

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id'          => $this->id,
            'name'        => $this->name,
            'description' => $this->description,
            'is_system'   => $this->isSystem,
            'permissions' => array_map(fn(Permission $p) => $p->toArray(), $this->permissions),
            'created_at'  => $this->createdAt?->format('Y-m-d\TH:i:s\Z'),
        ];
    }
}
