<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Mysql\EmailTemplate;

use Core\Domain\EmailTemplate\EmailTemplate;
use Core\Domain\EmailTemplate\EmailTemplateRepository;
use PDO;

class MysqlEmailTemplateRepository implements EmailTemplateRepository
{
    public function __construct(private PDO $pdo)
    {
}

    #[\Override]
    public function save(EmailTemplate $tpl): int
    {
        if ($tpl->id) {
            $stmt = $this->pdo->prepare("
                UPDATE core_email_templates 
                SET label = :label, subject = :subject, content = :content, topic = :topic, active = :active
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO core_email_templates (label, subject, content, topic, active)
                VALUES (:label, :subject, :content, :topic, :active)
            ");
        }
        
        $data = $tpl->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $tpl->id ?? (int) $this->pdo->lastInsertId();
    }

    #[\Override]
    public function findById(int $id): ?EmailTemplate
    {
        $stmt = $this->pdo->prepare("SELECT * FROM core_email_templates WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? EmailTemplate::fromArray($data) : null;
    }

    #[\Override]
    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM core_email_templates ORDER BY label ASC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = EmailTemplate::fromArray($data);
        }
        return $results;
    }

    #[\Override]
    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM core_email_templates WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
