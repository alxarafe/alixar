<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\ManufacturingOrder;

class ManufacturingOrder
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $label,
        public readonly int $bomId,
        public readonly float $qtyToProduce = 1.0,
        public readonly string $status = 'draft',
        public readonly ?\DateTimeImmutable $dateStart = null,
        public readonly ?\DateTimeImmutable $dateEnd = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $ref, string $label, int $bomId, float $qtyToProduce = 1.0, string $status = 'draft', ?\DateTimeImmutable $dateStart = null, ?\DateTimeImmutable $dateEnd = null): self
    {
        return new self(null, $ref, $label, $bomId, $qtyToProduce, $status, $dateStart, $dateEnd);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['label'],
            (int) $data['bom_id'],
            (float) ($data['qty_to_produce'] ?? 1.0),
            $data['status'] ?? 'draft',
            isset($data['date_start']) ? new \DateTimeImmutable($data['date_start']) : null,
            isset($data['date_end']) ? new \DateTimeImmutable($data['date_end']) : null,
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
            'bom_id' => $this->bomId,
            'qty_to_produce' => $this->qtyToProduce,
            'status' => $this->status,
            'date_start' => $this->dateStart?->format('Y-m-d H:i:s'),
            'date_end' => $this->dateEnd?->format('Y-m-d H:i:s'),
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
