<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class WebhookLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'url' => $domainEntity->url,
            'events' => $domainEntity->events,
            'method' => $domainEntity->method,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'url' => $legacyData['url'] ?? '',
            'events' => $legacyData['events'] ?? '',
            'method' => $legacyData['method'] ?? 'POST',
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
        ];
    }
}
