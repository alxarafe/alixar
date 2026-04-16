<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class HolidayLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'fk_user' => $domainEntity->userId,
            'type_leave' => $domainEntity->type,
            'date_debut' => strtotime($domainEntity->dateStart->format('Y-m-d H:i:s')),
            'date_fin' => strtotime($domainEntity->dateEnd->format('Y-m-d H:i:s')),
            'halfday' => $domainEntity->isHalfDay ? 1 : 0,
            'statut' => $domainEntity->status === 'approved' ? 3 : 1, // 1: draft, 3: approved in dolibarr
            'description' => $domainEntity->description,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        $status = 'draft';
        if (isset($legacyData['statut']) && $legacyData['statut'] == 3) {
            $status = 'approved';
        }

        return [
            'ref' => $legacyData['ref'] ?? '',
            'user_id' => (int) ($legacyData['fk_user'] ?? 0),
            'type' => $legacyData['type_leave'] ?? 'casual',
            'date_start' => isset($legacyData['date_debut']) ? date('Y-m-d H:i:s', $legacyData['date_debut']) : date('Y-m-d H:i:s'),
            'date_end' => isset($legacyData['date_fin']) ? date('Y-m-d H:i:s', $legacyData['date_fin']) : date('Y-m-d H:i:s'),
            'is_half_day' => (bool) ($legacyData['halfday'] ?? false),
            'status' => $status,
            'description' => $legacyData['description'] ?? null,
        ];
    }
}
