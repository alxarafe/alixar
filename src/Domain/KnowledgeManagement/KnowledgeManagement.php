<?php

declare(strict_types=1);

namespace Core\Domain\KnowledgeManagement;

class KnowledgeManagement
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $title,
        public readonly string $content,
        public readonly string $status = 'draft',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $ref, string $title, string $content, string $status = 'draft'): self
    {
        return new self(null, $ref, $title, $content, $status);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['title'],
            $data['content'],
            $data['status'] ?? 'draft',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'title' => $this->title,
            'content' => $this->content,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
