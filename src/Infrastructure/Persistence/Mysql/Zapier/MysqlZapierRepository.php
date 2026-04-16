<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\Zapier;

use Core\Domain\Zapier\Zapier;
use Core\Domain\Zapier\ZapierRepository;
use PDO;

class MysqlZapierRepository implements ZapierRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(Zapier $zapier): int
    {
        if ($zapier->id) {
            $stmt = $this->pdo->prepare("
                UPDATE core_zapier_hooks 
                SET entity = :entity, fk_user = :fk_user, event = :event, webhook_url = :webhook_url, active = :active
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO core_zapier_hooks (entity, fk_user, event, webhook_url, active)
                VALUES (:entity, :fk_user, :event, :webhook_url, :active)
            ");
        }
        
        $data = $zapier->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $zapier->id ?? (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?Zapier
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_zapier_hooks WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Zapier::fromArray($data) : null;
    }

    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM core_zapier_hooks ORDER BY id DESC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Zapier::fromArray($data);
        }
        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM core_zapier_hooks WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
