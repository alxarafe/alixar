<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class AccountancyLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        // Accountancy is complex in Dolibarr, this is for basic CRUD of Accounts
        return [
            'id' => $domainEntity->id,
            'account_number' => $domainEntity->code,
            'label' => $domainEntity->label,
            'fk_parent' => $domainEntity->parentId,
            'account_category' => $domainEntity->type,
            'active' => $domainEntity->active ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'code' => $legacyData['account_number'] ?? '',
            'label' => $legacyData['label'] ?? '',
            'parent_id' => isset($legacyData['fk_parent']) ? (int) $legacyData['fk_parent'] : null,
            'type' => $legacyData['account_category'] ?? 'asset',
            'active' => (bool) ($legacyData['active'] ?? true),
        ];
    }
}
