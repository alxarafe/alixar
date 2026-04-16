<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Leave;

class Leave
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly int $userId,
        public readonly string $type,
        public readonly \DateTimeImmutable $dateStart,
        public readonly \DateTimeImmutable $dateEnd,
        public readonly bool $isHalfDay = false,
        public readonly string $status = 'draft',
        public readonly ?string $description = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        int $userId,
        string $type,
        \DateTimeImmutable $dateStart,
        \DateTimeImmutable $dateEnd,
        bool $isHalfDay = false,
        string $status = 'draft',
        ?string $description = null
    ): self {
        return new self(
            null,
            $ref,
            $userId,
            $type,
            $dateStart,
            $dateEnd,
            $isHalfDay,
            $status,
            $description
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            (int) $data['user_id'],
            $data['type'],
            new \DateTimeImmutable($data['date_start']),
            new \DateTimeImmutable($data['date_end']),
            (bool) ($data['is_half_day'] ?? false),
            $data['status'] ?? 'draft',
            $data['description'] ?? null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'user_id' => $this->userId,
            'type' => $this->type,
            'date_start' => $this->dateStart->format('Y-m-d H:i:s'),
            'date_end' => $this->dateEnd->format('Y-m-d H:i:s'),
            'is_half_day' => $this->isHalfDay ? 1 : 0,
            'status' => $this->status,
            'description' => $this->description,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
