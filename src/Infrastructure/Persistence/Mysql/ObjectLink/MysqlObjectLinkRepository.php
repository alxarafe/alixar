<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\ObjectLink;

use Core\Domain\ObjectLink\ObjectLink;
use Core\Domain\ObjectLink\ObjectLinkRepository;
use PDO;

class MysqlObjectLinkRepository implements ObjectLinkRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(ObjectLink $link): int
    {
        if ($link->id) {
            $stmt = $this->pdo->prepare("
                UPDATE core_object_links 
                SET source_type = :source_type, source_id = :source_id, target_type = :target_type, target_id = :target_id
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO core_object_links (source_type, source_id, target_type, target_id)
                VALUES (:source_type, :source_id, :target_type, :target_id)
            ");
        }
        
        $data = $link->toArray();
        unset($data['created_at']);
        
        $stmt->execute($data);
        return $link->id ?? (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?ObjectLink
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_object_links WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? ObjectLink::fromArray($data) : null;
    }

    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM core_object_links ORDER BY id DESC LIMIT 500");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = ObjectLink::fromArray($data);
        }
        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM core_object_links WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
