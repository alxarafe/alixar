<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class DonationLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'amount' => $domainEntity->amount,
            'fk_soc' => $domainEntity->thirdPartyId,
            'fk_project' => $domainEntity->projectId,
            'status' => $domainEntity->status === 'validated' ? 1 : 0,
            'date_don' => $domainEntity->date ? strtotime($domainEntity->date->format('Y-m-d H:i:s')) : null,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'amount' => (float) ($legacyData['amount'] ?? 0.0),
            'third_party_id' => isset($legacyData['fk_soc']) ? (int) $legacyData['fk_soc'] : null,
            'project_id' => isset($legacyData['fk_project']) ? (int) $legacyData['fk_project'] : null,
            'status' => ($legacyData['status'] ?? 1) ? 'validated' : 'draft',
            'date' => isset($legacyData['date_don']) ? date('Y-m-d H:i:s', $legacyData['date_don']) : null,
        ];
    }
}
