<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

class Subscription
{
    private function __construct(
        public readonly ?int $id,
        public readonly int $memberId,
        public readonly \DateTimeImmutable $dateStart,
        public readonly \DateTimeImmutable $dateEnd,
        public readonly float $amount,
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        int $memberId,
        \DateTimeImmutable $dateStart,
        \DateTimeImmutable $dateEnd,
        float $amount,
        string $status = 'active'
    ): self {
        return new self(
            null,
            $memberId,
            $dateStart,
            $dateEnd,
            $amount,
            $status,
            new \DateTimeImmutable()
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            (int) $data['member_id'],
            new \DateTimeImmutable($data['date_start']),
            new \DateTimeImmutable($data['date_end']),
            (float) $data['amount'],
            $data['status'] ?? 'active',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'member_id' => $this->memberId,
            'date_start' => $this->dateStart->format('Y-m-d H:i:s'),
            'date_end' => $this->dateEnd->format('Y-m-d H:i:s'),
            'amount' => $this->amount,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
