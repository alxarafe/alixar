<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class DocumentLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'name' => $domainEntity->filename,
            'modulepart' => $domainEntity->module,
            'relativename' => $domainEntity->filename,
            'fullname' => $domainEntity->filename,
            'date' => strtotime($domainEntity->createdAt->format('Y-m-d H:i:s')),
            'size' => $domainEntity->fileSize,
            'type' => 'file',
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'filename' => $legacyData['name'] ?? $legacyData['filename'],
            'module' => $legacyData['modulepart'],
            'object_id' => $legacyData['object_id'] ?? '',
            'file_size' => $legacyData['size'] ?? 0,
            'mime_type' => $legacyData['content_type'] ?? 'application/octet-stream',
            'path' => $legacyData['path'] ?? '',
            'notes' => $legacyData['notes'] ?? null,
        ];
    }
}
