<?php

declare(strict_types=1);

namespace Core\Domain\ObjectLink;

class ObjectLink
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $sourceType,
        public readonly int $sourceId,
        public readonly string $targetType,
        public readonly int $targetId,
        public readonly ?\DateTimeImmutable $createdAt = null
    ) {
}

    public static function create(string $sourceType, int $sourceId, string $targetType, int $targetId): self
    {
        return new self(null, $sourceType, $sourceId, $targetType, $targetId);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['source_type'],
            (int) $data['source_id'],
            $data['target_type'],
            (int) $data['target_id'],
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'source_type' => $this->sourceType,
            'source_id' => $this->sourceId,
            'target_type' => $this->targetType,
            'target_id' => $this->targetId,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
        ];
    }
}
