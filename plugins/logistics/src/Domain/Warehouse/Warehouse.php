<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\Warehouse;

use DateTimeImmutable;
use RuntimeException;

class Warehouse
{
    private ?int $id;
    private string $ref;
    private string $label;
    private ?string $description;
    
    private ?string $address;
    private ?string $zipCode;
    private ?string $city;
    
    private ?int $parentId;
    private int $status;
    
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        string $ref,
        string $label,
        ?int $id = null
    ) {
        $this->ref = $ref;
        $this->label = $label;
        $this->id = $id;
        
        $this->description = null;
        $this->address = null;
        $this->zipCode = null;
        $this->city = null;
        $this->parentId = null;
        $this->status = 1; // 1 = active
        
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

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['description'])) $this->description = $data['description'];
        if (isset($data['address'])) $this->address = $data['address'];
        if (isset($data['zipCode'])) $this->zipCode = $data['zipCode'];
        if (isset($data['city'])) $this->city = $data['city'];
        if (isset($data['parentId'])) $this->parentId = (int)$data['parentId'];
        if (isset($data['status'])) $this->status = (int)$data['status'];
        
        if (isset($data['createdAt'])) {
            $this->createdAt = is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']);
        }
        if (isset($data['updatedAt'])) {
            $this->updatedAt = is_numeric($data['updatedAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['updatedAt']) : new DateTimeImmutable($data['updatedAt']);
        }
        
        if ($this->id !== null) {
            $this->updatedAt = new DateTimeImmutable();
        }
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['ref']) || !isset($data['label'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar Warehouse (ref, label).");
        }

        $warehouse = new self(
            ref: $data['ref'],
            label: $data['label'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $warehouse->updateFrom($data);

        return $warehouse;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'label' => $this->label,
            'description' => $this->description,
            'address' => $this->address,
            'zipCode' => $this->zipCode,
            'city' => $this->city,
            'parentId' => $this->parentId,
            'status' => $this->status,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
