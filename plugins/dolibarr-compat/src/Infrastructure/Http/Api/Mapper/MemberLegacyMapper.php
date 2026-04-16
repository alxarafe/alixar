<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class MemberLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'typeid' => $domainEntity->typeId,
            'socid' => $domainEntity->thirdPartyId,
            'firstname' => $domainEntity->firstName,
            'lastname' => $domainEntity->lastName,
            'company' => $domainEntity->company,
            'email' => $domainEntity->email,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
            'datevalid' => $domainEntity->dateStart ? strtotime($domainEntity->dateStart->format('Y-m-d')) : null,
            'datefin' => $domainEntity->dateEnd ? strtotime($domainEntity->dateEnd->format('Y-m-d')) : null,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'type_id' => (int) ($legacyData['typeid'] ?? 0),
            'third_party_id' => isset($legacyData['socid']) ? (int) $legacyData['socid'] : null,
            'first_name' => $legacyData['firstname'] ?? '',
            'last_name' => $legacyData['lastname'] ?? '',
            'company' => $legacyData['company'] ?? null,
            'email' => $legacyData['email'] ?? null,
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
            'date_start' => isset($legacyData['datevalid']) ? date('Y-m-d', $legacyData['datevalid']) : null,
            'date_end' => isset($legacyData['datefin']) ? date('Y-m-d', $legacyData['datefin']) : null,
        ];
    }
}
