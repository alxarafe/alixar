<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class KnowledgeManagementLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'title' => $domainEntity->title,
            'content' => $domainEntity->content,
            'status' => $domainEntity->status === 'published' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'title' => $legacyData['title'] ?? '',
            'content' => $legacyData['content'] ?? '',
            'status' => ($legacyData['status'] ?? 0) ? 'published' : 'draft',
        ];
    }
}
