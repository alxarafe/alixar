<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ObjectLinkLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'fk_source' => $domainEntity->sourceId,
            'sourcetype' => $domainEntity->sourceType,
            'fk_target' => $domainEntity->targetId,
            'targettype' => $domainEntity->targetType,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'source_type' => $legacyData['sourcetype'] ?? '',
            'source_id' => (int) ($legacyData['fk_source'] ?? 0),
            'target_type' => $legacyData['targettype'] ?? '',
            'target_id' => (int) ($legacyData['fk_target'] ?? 0),
        ];
    }
}
