<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class SalaryLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'fk_user' => $domainEntity->userId,
            'datep' => strtotime($domainEntity->dateStart->format('Y-m-d')),
            'dateep' => strtotime($domainEntity->dateEnd->format('Y-m-d')),
            'amount' => $domainEntity->amount,
            'type' => $domainEntity->type,
            'note' => $domainEntity->note,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'user_id' => (int) ($legacyData['fk_user'] ?? 0),
            'date_start' => isset($legacyData['datep']) ? date('Y-m-d H:i:s', $legacyData['datep']) : date('Y-m-d H:i:s'),
            'date_end' => isset($legacyData['dateep']) ? date('Y-m-d H:i:s', $legacyData['dateep']) : date('Y-m-d H:i:s'),
            'amount' => (float) ($legacyData['amount'] ?? 0.0),
            'type' => $legacyData['type'] ?? 'monthly',
            'status' => 'paid', // simplistic assumption
            'note' => $legacyData['note'] ?? null,
        ];
    }
}
