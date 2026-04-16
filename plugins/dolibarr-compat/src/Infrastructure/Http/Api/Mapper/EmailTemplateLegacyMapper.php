<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class EmailTemplateLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'label' => $domainEntity->label,
            'topic' => $domainEntity->topic,
            'subject' => $domainEntity->subject,
            'content' => $domainEntity->content,
            'active' => $domainEntity->active ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'label' => $legacyData['label'] ?? '',
            'topic' => $legacyData['topic'] ?? 'generic',
            'subject' => $legacyData['subject'] ?? '',
            'content' => $legacyData['content'] ?? '',
            'active' => (bool) ($legacyData['active'] ?? 1),
        ];
    }
}
