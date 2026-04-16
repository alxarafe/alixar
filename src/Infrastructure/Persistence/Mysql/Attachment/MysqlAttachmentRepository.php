<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\Attachment;

use Core\Domain\Attachment\Attachment;
use Core\Domain\Attachment\AttachmentRepository;
use PDO;

class MysqlAttachmentRepository implements AttachmentRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(Attachment $attachment): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO attachments (filename, module, object_id, file_size, mime_type, path, notes, created_by)
            VALUES (:filename, :module, :object_id, :file_size, :mime_type, :path, :notes, :created_by)
        ");

        $data = $attachment->toArray();
        unset($data['id'], $data['created_at']);

        $stmt->execute($data);

        return (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?Attachment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM attachments WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();

        return $data ? Attachment::fromArray($data) : null;
    }

    #[\Override]
    public function findByModuleAndObject(string $module, string $objectId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM attachments WHERE module = :module AND object_id = :object_id");
        $stmt->execute(['module' => $module, 'object_id' => $objectId]);
        $results = [];

        foreach ($stmt->fetchAll() as $data) {
            $results[] = Attachment::fromArray($data);
        }

        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM attachments WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
