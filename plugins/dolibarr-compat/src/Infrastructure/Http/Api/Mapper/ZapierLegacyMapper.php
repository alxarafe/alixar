<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ZapierLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'url' => $domainEntity->hookUrl,
            'entity' => $domainEntity->entityType,
            'event' => $domainEntity->triggerEvent,
            'active' => $domainEntity->active ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'hook_url' => $legacyData['url'] ?? '',
            'entity_type' => $legacyData['entity'] ?? '',
            'trigger_event' => $legacyData['event'] ?? '',
            'active' => (bool) ($legacyData['active'] ?? 1),
        ];
    }
}
