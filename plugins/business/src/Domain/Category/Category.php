<?php

declare(strict_types=1);

namespace Plugin\Business\Domain\Category;

use DateTimeImmutable;
use RuntimeException;

/**
 * Category — Entidad de Dominio para Categorías transversales
 */
class Category
{
    private ?int $id;
    private string $label;
    private ?string $description;
    private ?string $color;
    private int $position;
    private int $type; // 0=product, 1=supplier, 2=customer, 3=member, 4=contact, 5=project
    private ?int $parentId;
    private int $visible;
    
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        string $label,
        int $type,
        ?int $id = null
    ) {
        $this->label = $label;
        $this->type = $type;
        $this->id = $id;
        
        $this->description = null;
        $this->color = null;
        $this->position = 0;
        $this->parentId = null;
        $this->visible = 1;
        
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

    public function getLabel(): string
    {
        return $this->label;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['type'])) $this->type = (int)$data['type'];
        if (isset($data['description'])) $this->description = $data['description'];
        if (isset($data['color'])) $this->color = $data['color'];
        if (isset($data['position'])) $this->position = (int)$data['position'];
        if (isset($data['parentId'])) $this->parentId = (int)$data['parentId'];
        if (isset($data['visible'])) $this->visible = (int)$data['visible'];
        
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
        if (!isset($data['label']) || !isset($data['type'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar Category (label, type).");
        }

        $category = new self(
            label: $data['label'],
            type: (int)$data['type'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $category->updateFrom($data);

        return $category;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'label' => $this->label,
            'type' => $this->type,
            'description' => $this->description,
            'color' => $this->color,
            'position' => $this->position,
            'parentId' => $this->parentId,
            'visible' => $this->visible,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
