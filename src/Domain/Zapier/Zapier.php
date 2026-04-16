<?php

declare(strict_types=1);

namespace Core\Domain\Zapier;

class Zapier
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $hookUrl,
        public readonly string $entityType,
        public readonly string $triggerEvent,
        public readonly bool $active = true,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $hookUrl, string $entityType, string $triggerEvent): self
    {
        return new self(null, $hookUrl, $entityType, $triggerEvent, true);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['hook_url'],
            $data['entity_type'],
            $data['trigger_event'],
            (bool) ($data['active'] ?? true),
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'hook_url' => $this->hookUrl,
            'entity_type' => $this->entityType,
            'trigger_event' => $this->triggerEvent,
            'active' => $this->active ? 1 : 0,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
