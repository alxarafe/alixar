<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class WorkstationLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'label' => $domainEntity->label,
            'thm' => $domainEntity->hourlyRate, // Taux Horaire Moyen
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'label' => $legacyData['label'] ?? '',
            'hourly_rate' => (float) ($legacyData['thm'] ?? 0.0),
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
        ];
    }
}
