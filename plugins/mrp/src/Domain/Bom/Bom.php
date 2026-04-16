<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\Bom;

class Bom
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $label,
        public readonly int $productId,
        public readonly float $qty = 1.0,
        public readonly string $status = 'draft',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $ref, string $label, int $productId, float $qty = 1.0, string $status = 'draft'): self
    {
        return new self(null, $ref, $label, $productId, $qty, $status);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['label'],
            (int) $data['product_id'],
            (float) ($data['qty'] ?? 1.0),
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
            'label' => $this->label,
            'product_id' => $this->productId,
            'qty' => $this->qty,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
