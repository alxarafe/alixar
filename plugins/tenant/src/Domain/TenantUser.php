<?php

declare(strict_types=1);

namespace Plugin\Tenant\Domain;

/**
 * Entidad Pivot: Relación entre Usuario y Tenant.
 * Define qué usuario tiene acceso a qué tenant y con qué rol específico en ese tenant.
 */
final class TenantUser
{
    public function __construct(
        private ?int $id,
        private int $tenantId,
        private int $userId,
        private ?int $roleId,
        private bool $isAdmin,
    ) {
    }

    public function getId(): ?int
    {
 return $this->id; 
}
    public function getTenantId(): int
    {
 return $this->tenantId; 
}
    public function getUserId(): int
    {
 return $this->userId; 
}
    public function getRoleId(): ?int
    {
 return $this->roleId; 
}
    public function isAdmin(): bool
    {
 return $this->isAdmin; 
}

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'tenant_id' => $this->tenantId,
            'user_id' => $this->userId,
            'role_id' => $this->roleId,
            'is_admin' => $this->isAdmin,
        ];
    }
}
