<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Salary;

class Salary
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly int $userId,
        public readonly \DateTimeImmutable $dateStart,
        public readonly \DateTimeImmutable $dateEnd,
        public readonly float $amount,
        public readonly string $type = 'monthly',
        public readonly string $status = 'draft',
        public readonly ?string $note = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        int $userId,
        \DateTimeImmutable $dateStart,
        \DateTimeImmutable $dateEnd,
        float $amount,
        string $type = 'monthly',
        string $status = 'draft',
        ?string $note = null
    ): self {
        return new self(
            null,
            $ref,
            $userId,
            $dateStart,
            $dateEnd,
            $amount,
            $type,
            $status,
            $note
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            (int) $data['user_id'],
            new \DateTimeImmutable($data['date_start']),
            new \DateTimeImmutable($data['date_end']),
            (float) $data['amount'],
            $data['type'] ?? 'monthly',
            $data['status'] ?? 'draft',
            $data['note'] ?? null,
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
            'date_start' => $this->dateStart->format('Y-m-d H:i:s'),
            'date_end' => $this->dateEnd->format('Y-m-d H:i:s'),
            'amount' => $this->amount,
            'type' => $this->type,
            'status' => $this->status,
            'note' => $this->note,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
