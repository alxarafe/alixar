<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql;

use Core\Domain\Auth\Permission;
use Core\Domain\Auth\Role;
use Core\Domain\Auth\RoleRepositoryInterface;

/**
 * MySQL adapter for role persistence.
 *
 * Uses raw PDO — no ORM dependency.
 */
final class MysqlRoleRepository implements RoleRepositoryInterface
{
    public function __construct(
        private readonly \PDO $pdo,
    ) {
    }

    #[\Override]
    public function findById(int $id): ?Role
    {
        $stmt = $this->pdo->prepare('SELECT * FROM roles WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        return $row ? $this->hydrate($row) : null;
    }

    #[\Override]
    public function findByName(string $name): ?Role
    {
        $stmt = $this->pdo->prepare('SELECT * FROM roles WHERE name = :name');
        $stmt->execute(['name' => $name]);
        $row = $stmt->fetch();

        return $row ? $this->hydrate($row) : null;
    }

    /**
     * @return Role[]
     */
    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query('SELECT * FROM roles ORDER BY id ASC');
        $rows = $stmt->fetchAll();

        return array_map(fn(array $row) => $this->hydrate($row), $rows);
    }

    #[\Override]
    public function save(Role $role): Role
    {
        $stmt = $this->pdo->prepare('
            INSERT INTO roles (name, description, is_system)
            VALUES (:name, :description, :is_system)
        ');
        $stmt->execute([
            'name'        => $role->getName(),
            'description' => $role->getDescription(),
            'is_system'   => $role->isSystem() ? 1 : 0,
        ]);

        $id = (int) $this->pdo->lastInsertId();

        // Sync permissions if any
        if (!empty($role->getPermissions())) {
            $permIds = array_map(fn(Permission $p) => $p->getId(), $role->getPermissions());
            $this->syncPermissions($id, array_filter($permIds));
        }

        $saved = $this->findById($id);
        if (!$saved) {
            throw new \RuntimeException('Failed to retrieve saved role.');
        }

        return $saved;
    }

    #[\Override]
    public function update(Role $role): void
    {
        $stmt = $this->pdo->prepare('
            UPDATE roles SET
                name        = :name,
                description = :description,
                is_system   = :is_system
            WHERE id = :id
        ');
        $stmt->execute([
            'id'          => $role->getId(),
            'name'        => $role->getName(),
            'description' => $role->getDescription(),
            'is_system'   => $role->isSystem() ? 1 : 0,
        ]);
    }

    #[\Override]
    public function delete(int $id): void
    {
        // Guard: cannot delete system roles
        $role = $this->findById($id);
        if ($role !== null && $role->isSystem()) {
            throw new \DomainException("Cannot delete system role '{$role->getName()}'.");
        }

        $stmt = $this->pdo->prepare('DELETE FROM roles WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    #[\Override]
    public function syncPermissions(int $roleId, array $permissionIds): void
    {
        // Remove all existing permissions
        $stmt = $this->pdo->prepare('DELETE FROM role_permissions WHERE role_id = :role_id');
        $stmt->execute(['role_id' => $roleId]);

        // Insert new permissions
        if (!empty($permissionIds)) {
            $stmt = $this->pdo->prepare(
                'INSERT INTO role_permissions (role_id, permission_id) VALUES (:role_id, :permission_id)'
            );
            foreach ($permissionIds as $permId) {
                $stmt->execute(['role_id' => $roleId, 'permission_id' => (int) $permId]);
            }
        }
    }

    /**
     * @return Permission[]
     */
    #[\Override]
    public function getAllPermissions(): array
    {
        $stmt = $this->pdo->query('SELECT * FROM permissions ORDER BY plugin, resource, action');
        $rows = $stmt->fetchAll();

        return array_map(fn(array $row) => Permission::fromArray($row), $rows);
    }

    /**
     * @return Permission[]
     */
    #[\Override]
    public function getPermissionsByPlugin(string $plugin): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM permissions WHERE plugin = :plugin ORDER BY resource, action'
        );
        $stmt->execute(['plugin' => $plugin]);

        return array_map(fn(array $row) => Permission::fromArray($row), $stmt->fetchAll());
    }

    // ── Private Helpers ──────────────────────────────────────

    /**
     * Hydrate a Role entity from a database row, loading its permissions.
     *
     * @param array<string, mixed> $row
     */
    private function hydrate(array $row): Role
    {
        $roleId = (int) $row['id'];

        // Load permissions for this role
        $stmt = $this->pdo->prepare("
            SELECT p.* FROM permissions p
            JOIN role_permissions rp ON rp.permission_id = p.id
            WHERE rp.role_id = :role_id
            ORDER BY p.plugin, p.resource, p.action
        ");
        $stmt->execute(['role_id' => $roleId]);
        $permissions = array_map(
            fn(array $pRow) => Permission::fromArray($pRow),
            $stmt->fetchAll()
        );

        return Role::fromArray($row, $permissions);
    }
}
