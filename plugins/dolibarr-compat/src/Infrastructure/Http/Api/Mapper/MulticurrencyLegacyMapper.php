<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class MulticurrencyLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'code' => $domainEntity->code,
            'name' => $domainEntity->name,
            'rate' => $domainEntity->rate,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'code' => $legacyData['code'] ?? '',
            'name' => $legacyData['name'] ?? '',
            'rate' => (float) ($legacyData['rate'] ?? 1.0),
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
        ];
    }
}
