<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\StockMovement;

use DateTimeImmutable;
use RuntimeException;

class StockMovement
{
    private ?int $id;
    private int $productId;
    private int $warehouseId;
    
    private float $qty;
    private int $type; // 0=decrease (out), 1=increase (in), 2=transfer
    
    private ?string $label;
    private ?string $inventoryCode;
    private float $price;
    
    private DateTimeImmutable $date;

    public function __construct(
        int $productId,
        int $warehouseId,
        float $qty,
        int $type,
        ?int $id = null
    ) {
        $this->productId = $productId;
        $this->warehouseId = $warehouseId;
        $this->qty = $qty;
        $this->type = $type;
        $this->id = $id;
        
        $this->label = null;
        $this->inventoryCode = null;
        $this->price = 0.0;
        
        $this->date = new DateTimeImmutable();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): self
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['productId'])) $this->productId = (int)$data['productId'];
        if (isset($data['warehouseId'])) $this->warehouseId = (int)$data['warehouseId'];
        if (isset($data['qty'])) $this->qty = (float)$data['qty'];
        if (isset($data['type'])) $this->type = (int)$data['type'];
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['inventoryCode'])) $this->inventoryCode = $data['inventoryCode'];
        if (isset($data['price'])) $this->price = (float)$data['price'];
        
        if (isset($data['date'])) {
            $this->date = is_numeric($data['date']) ? (new DateTimeImmutable())->setTimestamp((int)$data['date']) : new DateTimeImmutable($data['date']);
        }
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['productId']) || !isset($data['warehouseId']) || !isset($data['qty']) || !isset($data['type'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar StockMovement (productId, warehouseId, qty, type).");
        }

        $movement = new self(
            productId: (int)$data['productId'],
            warehouseId: (int)$data['warehouseId'],
            qty: (float)$data['qty'],
            type: (int)$data['type'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $movement->updateFrom($data);

        return $movement;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'productId' => $this->productId,
            'warehouseId' => $this->warehouseId,
            'qty' => $this->qty,
            'type' => $this->type,
            'label' => $this->label,
            'inventoryCode' => $this->inventoryCode,
            'price' => $this->price,
            'date' => $this->date->format('Y-m-d H:i:s'),
        ];
    }
}
