<?php

declare(strict_types=1);

namespace Core\Domain\EmailTemplate;

class EmailTemplate
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $label,
        public readonly string $subject,
        public readonly string $content,
        public readonly string $topic = 'generic',
        public readonly bool $active = true,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $label, string $subject, string $content, string $topic = 'generic'): self
    {
        return new self(null, $label, $subject, $content, $topic, true);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['label'],
            $data['subject'],
            $data['content'],
            $data['topic'] ?? 'generic',
            (bool) ($data['active'] ?? true),
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'label' => $this->label,
            'subject' => $this->subject,
            'content' => $this->content,
            'topic' => $this->topic,
            'active' => $this->active ? 1 : 0,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
