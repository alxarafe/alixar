<?php

declare(strict_types=1);

namespace Plugin\Tenant\Domain;

/**
 * Entidad: Grupo de Tenants.
 * Sirve para agrupar instalaciones lógicas bajo una misma entidad fiscal o holding (ej: Gestoría).
 */
final class TenantGroup
{
    public function __construct(
        private ?int $id,
        private string $name,
        private ?string $description,
        private string $createdAt,
    ) {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function getCreatedAt(): string
    {
        return $this->createdAt;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'created_at' => $this->createdAt,
        ];
    }
}
