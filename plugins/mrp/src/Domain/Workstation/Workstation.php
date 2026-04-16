<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\Workstation;

class Workstation
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $label,
        public readonly float $hourlyRate = 0.0,
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $ref, string $label, float $hourlyRate = 0.0, string $status = 'active'): self
    {
        return new self(null, $ref, $label, $hourlyRate, $status);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['label'],
            (float) ($data['hourly_rate'] ?? 0.0),
            $data['status'] ?? 'active',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'label' => $this->label,
            'hourly_rate' => $this->hourlyRate,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
