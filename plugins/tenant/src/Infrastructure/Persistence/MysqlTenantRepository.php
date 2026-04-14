<?php

declare(strict_types=1);

namespace Plugin\Tenant\Infrastructure\Persistence;

use Plugin\Tenant\Domain\Tenant;
use Plugin\Tenant\Domain\TenantGroup;
use Plugin\Tenant\Domain\TenantRepositoryInterface;
use Plugin\Tenant\Domain\TenantUser;

/**
 * MySQL implementation for TenantRepositoryInterface.
 * Connects to the Core central database.
 */
final class MysqlTenantRepository implements TenantRepositoryInterface
{
    public function __construct(
        private readonly \PDO $pdo,
    ) {
    }

    #[\Override]
    public function findById(int $id): ?Tenant
    {
        $stmt = $this->pdo->prepare('SELECT * FROM tenants WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        return $row ? static::hydrateTenant($row) : null;
    }

    #[\Override]
    public function findBySlug(string $slug): ?Tenant
    {
        $stmt = $this->pdo->prepare('SELECT * FROM tenants WHERE slug = :slug');
        $stmt->execute(['slug' => $slug]);
        $row = $stmt->fetch();

        return $row ? static::hydrateTenant($row) : null;
    }

    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query('SELECT * FROM tenants ORDER BY id ASC');
        $rows = $stmt->fetchAll();

        return array_map(fn($row) => static::hydrateTenant($row), $rows);
    }

    #[\Override]
    public function findByUserId(int $userId): array
    {
        $stmt = $this->pdo->prepare('
            SELECT t.* FROM tenants t
            JOIN tenant_users tu ON tu.tenant_id = t.id
            WHERE tu.user_id = :user_id
            ORDER BY t.name ASC
        ');
        $stmt->execute(['user_id' => $userId]);
        $rows = $stmt->fetchAll();

        return array_map(fn($row) => static::hydrateTenant($row), $rows);
    }

    #[\Override]
    public function save(Tenant $tenant): Tenant
    {
        $stmt = $this->pdo->prepare('
            INSERT INTO tenants (
                name, slug, database_strategy, database_name, database_host, database_port, group_id, is_active
            ) VALUES (
                :name, :slug, :database_strategy, :database_name, :database_host, :database_port, :group_id, :is_active
            )
        ');

        $stmt->execute([
            'name'              => $tenant->getName(),
            'slug'              => $tenant->getSlug(),
            'database_strategy' => $tenant->getDatabaseStrategy(),
            'database_name'     => $tenant->getDatabaseName(),
            'database_host'     => $tenant->getDatabaseHost(),
            'database_port'     => $tenant->getDatabasePort(),
            'group_id'          => $tenant->getGroupId(),
            'is_active'         => $tenant->isActive() ? 1 : 0,
        ]);

        $id = (int) $this->pdo->lastInsertId();

        $saved = $this->findById($id);
        if (!$saved) {
            throw new \RuntimeException('Failed to retrieve saved tenant.');
        }

        return $saved;
    }

    #[\Override]
    public function update(Tenant $tenant): void
    {
        $stmt = $this->pdo->prepare('
            UPDATE tenants SET
                name = :name,
                slug = :slug,
                database_strategy = :database_strategy,
                database_name = :database_name,
                database_host = :database_host,
                database_port = :database_port,
                group_id = :group_id,
                is_active = :is_active
            WHERE id = :id
        ');

        $stmt->execute([
            'id'                => $tenant->getId(),
            'name'              => $tenant->getName(),
            'slug'              => $tenant->getSlug(),
            'database_strategy' => $tenant->getDatabaseStrategy(),
            'database_name'     => $tenant->getDatabaseName(),
            'database_host'     => $tenant->getDatabaseHost(),
            'database_port'     => $tenant->getDatabasePort(),
            'group_id'          => $tenant->getGroupId(),
            'is_active'         => $tenant->isActive() ? 1 : 0,
        ]);
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM tenants WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    #[\Override]
    public function findGroupById(int $id): ?TenantGroup
    {
        $stmt = $this->pdo->prepare('SELECT * FROM tenant_groups WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        return $row ? static::hydrateGroup($row) : null;
    }

    #[\Override]
    public function findAllGroups(): array
    {
        $stmt = $this->pdo->query('SELECT * FROM tenant_groups ORDER BY id ASC');
        $rows = $stmt->fetchAll();

        return array_map(fn($row) => static::hydrateGroup($row), $rows);
    }

    #[\Override]
    public function saveGroup(TenantGroup $group): TenantGroup
    {
        // Simple insert for now
        $stmt = $this->pdo->prepare('
            INSERT INTO tenant_groups (name, description)
            VALUES (:name, :description)
        ');

        $stmt->execute([
            'name'        => $group->getName(),
            'description' => $group->getDescription(),
        ]);

        $id = (int) $this->pdo->lastInsertId();

        $saved = $this->findGroupById($id);
        if (!$saved) {
            throw new \RuntimeException('Failed to retrieve saved tenant group.');
        }

        return $saved;
    }

    #[\Override]
    public function addUserToTenant(int $tenantId, int $userId, ?int $roleId = null, bool $isAdmin = false): void
    {
        $stmt = $this->pdo->prepare('
            INSERT INTO tenant_users (tenant_id, user_id, role_id, is_admin)
            VALUES (:tenant_id, :user_id, :role_id, :is_admin)
            ON DUPLICATE KEY UPDATE role_id = :role_id2, is_admin = :is_admin2
        ');

        $stmt->execute([
            'tenant_id' => $tenantId,
            'user_id'   => $userId,
            'role_id'   => $roleId,
            'is_admin'  => $isAdmin ? 1 : 0,
            'role_id2'  => $roleId,
            'is_admin2' => $isAdmin ? 1 : 0,
        ]);
    }

    #[\Override]
    public function removeUserFromTenant(int $tenantId, int $userId): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM tenant_users WHERE tenant_id = :tenant_id AND user_id = :user_id');
        $stmt->execute(['tenant_id' => $tenantId, 'user_id' => $userId]);
    }

    #[\Override]
    public function isUserInTenant(int $tenantId, int $userId): bool
    {
        $stmt = $this->pdo->prepare('SELECT COUNT(*) FROM tenant_users WHERE tenant_id = :tenant_id AND user_id = :user_id');
        $stmt->execute(['tenant_id' => $tenantId, 'user_id' => $userId]);

        return (int) $stmt->fetchColumn() > 0;
    }

    #[\Override]
    public function getTenantAccessForUser(int $userId): array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM tenant_users WHERE user_id = :user_id');
        $stmt->execute(['user_id' => $userId]);
        $rows = $stmt->fetchAll();

        return array_map(fn($row) => new TenantUser(
            id: (int) $row['id'],
            tenantId: (int) $row['tenant_id'],
            userId: (int) $row['user_id'],
            roleId: $row['role_id'] ? (int) $row['role_id'] : null,
            isAdmin: (bool) $row['is_admin'],
        ), $rows);
    }

    // ── Hydration Helpers ────────────────────────────────────

    private static function hydrateTenant(array $row): Tenant
    {
        return new Tenant(
            id: (int) $row['id'],
            name: $row['name'],
            slug: $row['slug'],
            databaseStrategy: $row['database_strategy'],
            databaseName: $row['database_name'] ?? null,
            databaseHost: $row['database_host'] ?? null,
            databasePort: $row['database_port'] ? (int) $row['database_port'] : null,
            groupId: $row['group_id'] ? (int) $row['group_id'] : null,
            isActive: (bool) $row['is_active'],
            createdAt: $row['created_at'],
        );
    }

    private static function hydrateGroup(array $row): TenantGroup
    {
        return new TenantGroup(
            id: (int) $row['id'],
            name: $row['name'],
            description: $row['description'] ?? null,
            createdAt: $row['created_at'],
        );
    }
}
