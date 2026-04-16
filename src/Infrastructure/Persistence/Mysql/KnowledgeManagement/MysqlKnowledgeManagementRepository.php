<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\KnowledgeManagement;

use Core\Domain\KnowledgeManagement\KnowledgeManagement;
use Core\Domain\KnowledgeManagement\KnowledgeManagementRepository;
use PDO;

class MysqlKnowledgeManagementRepository implements KnowledgeManagementRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(KnowledgeManagement $km): int
    {
        if ($km->id) {
            $stmt = $this->pdo->prepare("
                UPDATE core_knowledge_management 
                SET ref = :ref, title = :title, content = :content, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO core_knowledge_management (ref, title, content, status)
                VALUES (:ref, :title, :content, :status)
            ");
        }
        
        $data = $km->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $km->id ?? (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?KnowledgeManagement
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_knowledge_management WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? KnowledgeManagement::fromArray($data) : null;
    }

    #[\Override]
    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_knowledge_management ORDER BY title ASC LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = KnowledgeManagement::fromArray($data);
        }
        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM core_knowledge_management WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
