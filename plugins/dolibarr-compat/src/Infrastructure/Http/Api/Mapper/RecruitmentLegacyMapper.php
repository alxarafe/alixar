<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class RecruitmentLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'fk_recruitmentjobposition' => $domainEntity->positionId,
            'firstname' => $domainEntity->candidateFirstName,
            'lastname' => $domainEntity->candidateLastName,
            'email' => $domainEntity->candidateEmail,
            'status' => $domainEntity->status === 'hired' ? 2 : 0, // Simplified
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'position_id' => (string) ($legacyData['fk_recruitmentjobposition'] ?? ''),
            'candidate_first_name' => $legacyData['firstname'] ?? '',
            'candidate_last_name' => $legacyData['lastname'] ?? '',
            'candidate_email' => $legacyData['email'] ?? '',
            'status' => ($legacyData['status'] ?? 0) == 2 ? 'hired' : 'new',
        ];
    }
}
