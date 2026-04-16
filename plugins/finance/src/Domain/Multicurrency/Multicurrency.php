<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Multicurrency;

class Multicurrency
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $code,
        public readonly string $name,
        public readonly float $rate = 1.0,
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $code, string $name, float $rate = 1.0, string $status = 'active'): self
    {
        return new self(null, $code, $name, $rate, $status);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['code'],
            $data['name'],
            (float) ($data['rate'] ?? 1.0),
            $data['status'] ?? 'active',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'name' => $this->name,
            'rate' => $this->rate,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
