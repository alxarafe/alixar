<?php

declare(strict_types=1);

namespace App\Domain\Product;

use DateTimeImmutable;
use RuntimeException;

/**
 * Product — Entidad de Dominio para Productos/Servicios.
 */
class Product
{
    private ?int $id;
    private int $entity;
    private string $ref;
    private ?string $refExt;
    private ?string $barcode;
    private string $label;
    private ?string $description;
    
    private float $price;
    private float $priceTtc;
    private float $tvaTx;
    
    private ProductType $type;
    private bool $status; // tosell
    private bool $statusBuy; // tobuy
    
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        string $ref,
        string $label,
        ProductType $type = ProductType::Product,
        ?int $id = null,
        int $entity = 1
    ) {
        $this->ref = $ref;
        $this->label = $label;
        $this->type = $type;
        $this->id = $id;
        $this->entity = $entity;
        
        $this->refExt = null;
        $this->barcode = null;
        $this->description = null;
        $this->price = 0.0;
        $this->priceTtc = 0.0;
        $this->tvaTx = 0.0;
        $this->status = true;
        $this->statusBuy = true;
        
        $this->createdAt = new DateTimeImmutable();
        $this->updatedAt = null;
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

    public function getRef(): string
    {
        return $this->ref;
    }

    public function getLabel(): string
    {
        return $this->label;
    }

    public function getType(): ProductType
    {
        return $this->type;
    }

    public function getCreatedAt(): DateTimeImmutable
    {
        return $this->createdAt;
    }
    
    public function getUpdatedAt(): ?DateTimeImmutable
    {
        return $this->updatedAt;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['ref'])) {
            $this->ref = $data['ref'];
        }
        if (isset($data['refExt'])) {
            $this->refExt = $data['refExt'];
        }
        if (isset($data['barcode'])) {
            $this->barcode = $data['barcode'];
        }
        if (isset($data['label'])) {
            $this->label = $data['label'];
        }
        if (isset($data['description'])) {
            $this->description = $data['description'];
        }
        if (isset($data['price'])) {
            $this->price = (float) $data['price'];
        }
        if (isset($data['priceTtc'])) {
            $this->priceTtc = (float) $data['priceTtc'];
        }
        if (isset($data['tvaTx'])) {
            $this->tvaTx = (float) $data['tvaTx'];
        }
        if (isset($data['type'])) {
            $this->type = ProductType::from((int) $data['type']);
        }
        if (isset($data['status'])) {
            $this->status = (bool) $data['status'];
        }
        if (isset($data['statusBuy'])) {
            $this->statusBuy = (bool) $data['statusBuy'];
        }
        if (isset($data['createdAt'])) {
            $this->createdAt = is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']);
        }
        if (isset($data['updatedAt'])) {
            $this->updatedAt = is_numeric($data['updatedAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['updatedAt']) : new DateTimeImmutable($data['updatedAt']);
        }
        
        // Always set updated date on modifications
        $this->updatedAt = new DateTimeImmutable();
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['ref'])) {
            throw new RuntimeException("Falta campo obligatorio 'ref' al hidratar Product.");
        }
        if (!isset($data['label'])) {
            throw new RuntimeException("Falta campo obligatorio 'label' al hidratar Product.");
        }

        $type = ProductType::from((int) ($data['type'] ?? 0));
        
        $product = new self(
            ref: $data['ref'],
            label: $data['label'],
            type: $type,
            id: isset($data['id']) ? (int) $data['id'] : null,
            entity: isset($data['entity']) ? (int) $data['entity'] : 1
        );

        $product->updateFrom($data);

        return $product;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'entity' => $this->entity,
            'ref' => $this->ref,
            'refExt' => $this->refExt,
            'barcode' => $this->barcode,
            'label' => $this->label,
            'description' => $this->description,
            'price' => $this->price,
            'priceTtc' => $this->priceTtc,
            'tvaTx' => $this->tvaTx,
            'type' => $this->type->value,
            'status' => $this->status ? 1 : 0,
            'statusBuy' => $this->statusBuy ? 1 : 0,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
