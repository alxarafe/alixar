<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class SubscriptionLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'fk_adherent' => $domainEntity->memberId,
            'dateh' => strtotime($domainEntity->dateStart->format('Y-m-d')),
            'datef' => strtotime($domainEntity->dateEnd->format('Y-m-d')),
            'amount' => $domainEntity->amount,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'member_id' => (int) ($legacyData['fk_adherent'] ?? 0),
            'date_start' => isset($legacyData['dateh']) ? date('Y-m-d', $legacyData['dateh']) : date('Y-m-d'),
            'date_end' => isset($legacyData['datef']) ? date('Y-m-d', $legacyData['datef']) : date('Y-m-d', strtotime('+1 year')),
            'amount' => (float) ($legacyData['amount'] ?? 0.0),
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
        ];
    }
}
