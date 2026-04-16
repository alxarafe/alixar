<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\Webhook;

use Core\Domain\Webhook\Webhook;
use Core\Domain\Webhook\WebhookRepository;
use PDO;

class MysqlWebhookRepository implements WebhookRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(Webhook $webhook): int
    {
        if ($webhook->id) {
            $stmt = $this->pdo->prepare("
                UPDATE core_webhooks 
                SET entity = :entity, label = :label, url = :url, events = :events, status = :status, secret_token = :secret_token
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO core_webhooks (entity, label, url, events, status, secret_token)
                VALUES (:entity, :label, :url, :events, :status, :secret_token)
            ");
        }
        
        $data = $webhook->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $webhook->id ?? (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?Webhook
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_webhooks WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Webhook::fromArray($data) : null;
    }

    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM core_webhooks ORDER BY id DESC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Webhook::fromArray($data);
        }
        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM core_webhooks WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
