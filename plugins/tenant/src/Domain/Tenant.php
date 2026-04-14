<?php

declare(strict_types=1);

namespace Plugin\Tenant\Domain;

/**
 * Entidad Tenant (Instalación Lógica).
 * Define una instancia de negocio. El Core interactúa con el Tenant para
 * determinar la base de datos a la que conectarse.
 */
final class Tenant
{
    public const STRATEGY_DEDICATED = 'dedicated';
    public const STRATEGY_SHARED = 'shared';

    public function __construct(
        private ?int $id,
        private string $name,
        private string $slug,
        private string $databaseStrategy,
        private ?string $databaseName,
        private ?string $databaseHost,
        private ?int $databasePort,
        private ?int $groupId,
        private bool $isActive,
        private string $createdAt,
    ) {
        if (!in_array($databaseStrategy, [self::STRATEGY_DEDICATED, self::STRATEGY_SHARED], true)) {
            throw new \InvalidArgumentException("Invalid database strategy: {$databaseStrategy}");
        }
    }

    public static function createNew(
        string $name,
        string $slug,
        string $databaseStrategy = self::STRATEGY_DEDICATED,
        ?string $databaseName = null,
        ?string $databaseHost = null,
        ?int $databasePort = null,
        ?int $groupId = null,
    ): self {
        return new self(
            id: null,
            name: $name,
            slug: $slug,
            databaseStrategy: $databaseStrategy,
            databaseName: $databaseName,
            databaseHost: $databaseHost,
            databasePort: $databasePort,
            groupId: $groupId,
            isActive: true,
            createdAt: date('Y-m-d H:i:s'),
        );
    }

    public function getId(): ?int
    {
 return $this->id; 
}
    public function getName(): string
    {
 return $this->name; 
}
    public function getSlug(): string
    {
 return $this->slug; 
}
    public function getDatabaseStrategy(): string
    {
 return $this->databaseStrategy; 
}
    public function getDatabaseName(): ?string
    {
 return $this->databaseName; 
}
    public function getDatabaseHost(): ?string
    {
 return $this->databaseHost; 
}
    public function getDatabasePort(): ?int
    {
 return $this->databasePort; 
}
    public function getGroupId(): ?int
    {
 return $this->groupId; 
}
    public function isActive(): bool
    {
 return $this->isActive; 
}
    public function getCreatedAt(): string
    {
 return $this->createdAt; 
}

    public function isDedicated(): bool
    {
        return $this->databaseStrategy === self::STRATEGY_DEDICATED;
    }

    public function activate(): void
    {
        $this->isActive = true;
    }

    public function deactivate(): void
    {
        $this->isActive = false;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'database_strategy' => $this->databaseStrategy,
            'database_name' => $this->databaseName,
            'database_host' => $this->databaseHost,
            'database_port' => $this->databasePort,
            'group_id' => $this->groupId,
            'is_active' => $this->isActive,
            'created_at' => $this->createdAt,
        ];
    }
}
