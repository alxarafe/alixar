<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class MemberTypeLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'label' => $domainEntity->label,
            'amount' => $domainEntity->amount,
            'duracion' => $domainEntity->duration,
            'status' => $domainEntity->active ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'label' => $legacyData['label'] ?? '',
            'amount' => (float) ($legacyData['amount'] ?? 0.0),
            'duration' => $legacyData['duracion'] ?? '1y',
            'active' => (bool) ($legacyData['status'] ?? 1),
        ];
    }
}
