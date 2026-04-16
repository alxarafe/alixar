<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Donation;

class Donation
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly float $amount,
        public readonly ?int $thirdPartyId = null,
        public readonly ?int $projectId = null,
        public readonly string $status = 'validated',
        public readonly ?\DateTimeImmutable $date = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $ref, float $amount, ?int $thirdPartyId = null, ?int $projectId = null, string $status = 'validated', ?\DateTimeImmutable $date = null): self
    {
        return new self(null, $ref, $amount, $thirdPartyId, $projectId, $status, $date);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            (float) $data['amount'],
            isset($data['third_party_id']) ? (int) $data['third_party_id'] : null,
            isset($data['project_id']) ? (int) $data['project_id'] : null,
            $data['status'] ?? 'validated',
            isset($data['date']) ? new \DateTimeImmutable($data['date']) : null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'amount' => $this->amount,
            'third_party_id' => $this->thirdPartyId,
            'project_id' => $this->projectId,
            'status' => $this->status,
            'date' => $this->date?->format('Y-m-d H:i:s'),
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
