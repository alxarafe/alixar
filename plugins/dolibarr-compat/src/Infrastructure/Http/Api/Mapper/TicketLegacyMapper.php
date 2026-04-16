<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class TicketLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'track_id' => $domainEntity->trackId,
            'socid' => $domainEntity->thirdPartyId,
            'fk_contact' => $domainEntity->contactId,
            'subject' => $domainEntity->subject,
            'message' => $domainEntity->description,
            'type_code' => $domainEntity->type,
            'severity_code' => $domainEntity->severity,
            'status' => $domainEntity->status,
            'datec' => strtotime($domainEntity->dateOpened?->format('Y-m-d H:i:s') ?? ''),
            'date_read' => null,
            'date_close' => $domainEntity->dateClosed ? strtotime($domainEntity->dateClosed->format('Y-m-d H:i:s')) : null,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'track_id' => $legacyData['track_id'] ?? '',
            'third_party_id' => isset($legacyData['socid']) ? (int) $legacyData['socid'] : null,
            'contact_id' => isset($legacyData['fk_contact']) ? (int) $legacyData['fk_contact'] : null,
            'subject' => $legacyData['subject'] ?? '',
            'description' => $legacyData['message'] ?? '',
            'type' => $legacyData['type_code'] ?? 'question',
            'severity' => $legacyData['severity_code'] ?? 'medium',
            'status' => $legacyData['status'] ?? 'open',
        ];
    }
}
