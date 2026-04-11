<?php

declare(strict_types=1);

namespace App\Domain\Category;

class Category
{
    public function __construct(
        private int $type,
        private ?string $label = null,
        private ?string $description = null,
        private ?string $color = null,
        private ?int $parentId = null,
        private ?int $id = null,
    ) {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getType(): int
    {
        return $this->type;
    }

    public function updateFrom(array $data): void
    {
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['description'])) $this->description = $data['description'];
        if (isset($data['color'])) $this->color = $data['color'];
        if (isset($data['parentId'])) $this->parentId = (int) $data['parentId'];
        if (isset($data['type'])) $this->type = (int) $data['type'];
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'label' => $this->label,
            'description' => $this->description,
            'color' => $this->color,
            'type' => $this->type,
            'parentId' => $this->parentId,
        ];
    }
}
