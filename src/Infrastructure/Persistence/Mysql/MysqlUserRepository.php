<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql;

use Core\Domain\Auth\User;
use Core\Domain\Auth\UserRepositoryInterface;

/**
 * MySQL adapter for user persistence.
 *
 * Uses raw PDO — no ORM dependency.
 */
final class MysqlUserRepository implements UserRepositoryInterface
{
    public function __construct(
        private readonly \PDO $pdo,
    ) {
    }

    #[\Override]
    public function findById(int $id): ?User
    {
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->hydrate($row);
    }

    #[\Override]
    public function findByUsername(string $username): ?User
    {
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE username = :username');
        $stmt->execute(['username' => $username]);
        $row = $stmt->fetch();

        return $row ? $this->hydrate($row) : null;
    }

    #[\Override]
    public function findByEmail(string $email): ?User
    {
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE email = :email');
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch();

        return $row ? $this->hydrate($row) : null;
    }

    #[\Override]
    public function findByUsernameOrEmail(string $identifier): ?User
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM users WHERE username = :username OR email = :email LIMIT 1'
        );
        $stmt->execute(['username' => $identifier, 'email' => $identifier]);
        $row = $stmt->fetch();

        return $row ? $this->hydrate($row) : null;
    }

    #[\Override]
    public function save(User $user): User
    {
        $data = $user->toPersistenceArray();

        $stmt = $this->pdo->prepare('
            INSERT INTO users (username, email, password_hash, first_name, last_name,
                               language, timezone, is_active, is_superadmin, last_login_at)
            VALUES (:username, :email, :password_hash, :first_name, :last_name,
                    :language, :timezone, :is_active, :is_superadmin, :last_login_at)
        ');
        $stmt->execute($data);

        $id = (int) $this->pdo->lastInsertId();

        $saved = $this->findById($id);
        if (!$saved) {
            throw new \RuntimeException('Failed to retrieve saved user.');
        }

        return $saved;
    }

    #[\Override]
    public function update(User $user): void
    {
        $data = $user->toPersistenceArray();
        $data['id'] = $user->getId();

        $stmt = $this->pdo->prepare('
            UPDATE users SET
                username      = :username,
                email         = :email,
                password_hash = :password_hash,
                first_name    = :first_name,
                last_name     = :last_name,
                language      = :language,
                timezone      = :timezone,
                is_active     = :is_active,
                is_superadmin = :is_superadmin,
                last_login_at = :last_login_at
            WHERE id = :id
        ');
        $stmt->execute($data);
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM users WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    #[\Override]
    public function findAll(int $page = 1, int $perPage = 50): array
    {
        $offset = ($page - 1) * $perPage;

        // Total count
        $total = (int) $this->pdo->query('SELECT COUNT(*) FROM users')->fetchColumn();

        // Paginated results
        $stmt = $this->pdo->prepare('SELECT * FROM users ORDER BY id ASC LIMIT :limit OFFSET :offset');
        $stmt->bindValue('limit', $perPage, \PDO::PARAM_INT);
        $stmt->bindValue('offset', $offset, \PDO::PARAM_INT);
        $stmt->execute();

        $items = [];
        while ($row = $stmt->fetch()) {
            $items[] = $this->hydrate($row);
        }

        return ['items' => $items, 'total' => $total];
    }

    #[\Override]
    public function syncRoles(int $userId, array $roleIds): void
    {
        // Remove all existing roles
        $stmt = $this->pdo->prepare('DELETE FROM user_roles WHERE user_id = :user_id');
        $stmt->execute(['user_id' => $userId]);

        // Insert new roles
        if (!empty($roleIds)) {
            $stmt = $this->pdo->prepare(
                'INSERT INTO user_roles (user_id, role_id) VALUES (:user_id, :role_id)'
            );
            foreach ($roleIds as $roleId) {
                $stmt->execute(['user_id' => $userId, 'role_id' => (int) $roleId]);
            }
        }
    }

    #[\Override]
    public function getPermissionKeys(int $userId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT DISTINCT CONCAT(p.plugin, '.', p.resource, '.', p.action) AS perm_key
            FROM permissions p
            JOIN role_permissions rp ON rp.permission_id = p.id
            JOIN user_roles ur ON ur.role_id = rp.role_id
            WHERE ur.user_id = :user_id
            ORDER BY perm_key
        ");
        $stmt->execute(['user_id' => $userId]);

        return $stmt->fetchAll(\PDO::FETCH_COLUMN) ?: [];
    }

    #[\Override]
    public function updateLastLogin(int $userId): void
    {
        $stmt = $this->pdo->prepare(
            'UPDATE users SET last_login_at = :now WHERE id = :id'
        );
        $stmt->execute([
            'now' => (new \DateTimeImmutable('now', new \DateTimeZone('UTC')))->format('Y-m-d H:i:s'),
            'id'  => $userId,
        ]);
    }

    // ── Private Helpers ──────────────────────────────────────

    /**
     * Hydrate a User entity from a database row, loading role IDs and permissions.
     *
     * @param array<string, mixed> $row
     */
    private function hydrate(array $row): User
    {
        $userId = (int) $row['id'];

        // Load role IDs
        $roleStmt = $this->pdo->prepare('SELECT role_id FROM user_roles WHERE user_id = :uid');
        $roleStmt->execute(['uid' => $userId]);
        $roleIds = array_map('intval', $roleStmt->fetchAll(\PDO::FETCH_COLUMN) ?: []);

        // Load computed permissions
        $permissions = $this->getPermissionKeys($userId);

        return User::fromArray($row, $roleIds, $permissions);
    }
}
