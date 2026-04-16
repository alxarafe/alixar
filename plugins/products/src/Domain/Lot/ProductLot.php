<?php

declare(strict_types=1);

namespace Plugin\Products\Domain\Lot;

class ProductLot
{
    private function __construct(
        public readonly ?int $id,
        public readonly int $productId,
        public readonly string $batchNumber,
        public readonly ?\DateTimeImmutable $eatByDate = null,
        public readonly ?\DateTimeImmutable $sellByDate = null,
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        int $productId,
        string $batchNumber,
        ?\DateTimeImmutable $eatByDate = null,
        ?\DateTimeImmutable $sellByDate = null
    ): self {
        return new self(
            null,
            $productId,
            $batchNumber,
            $eatByDate,
            $sellByDate,
            'active'
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            (int) $data['product_id'],
            $data['batch_number'],
            isset($data['eatby_date']) ? new \DateTimeImmutable($data['eatby_date']) : null,
            isset($data['sellby_date']) ? new \DateTimeImmutable($data['sellby_date']) : null,
            $data['status'] ?? 'active',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'product_id' => $this->productId,
            'batch_number' => $this->batchNumber,
            'eatby_date' => $this->eatByDate?->format('Y-m-d H:i:s'),
            'sellby_date' => $this->sellByDate?->format('Y-m-d H:i:s'),
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
