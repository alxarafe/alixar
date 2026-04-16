<?php

declare(strict_types=1);

namespace Core\Domain\Attachment;

class Attachment
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $filename,
        public readonly string $module,
        public readonly string $objectId,
        public readonly int $fileSize,
        public readonly string $mimeType,
        public readonly string $path,
        public readonly ?string $notes = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?int $createdBy = null
    ) {
}

    public static function create(
        string $filename,
        string $module,
        string $objectId,
        int $fileSize,
        string $mimeType,
        string $path,
        ?string $notes = null,
        ?int $createdBy = null
    ): self {
        return new self(
            null,
            $filename,
            $module,
            $objectId,
            $fileSize,
            $mimeType,
            $path,
            $notes,
            new \DateTimeImmutable(),
            $createdBy
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['filename'],
            $data['module'],
            (string) $data['object_id'],
            (int) $data['file_size'],
            $data['mime_type'],
            $data['path'],
            $data['notes'] ?? null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['created_by']) ? (int) $data['created_by'] : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'filename' => $this->filename,
            'module' => $this->module,
            'object_id' => $this->objectId,
            'file_size' => $this->fileSize,
            'mime_type' => $this->mimeType,
            'path' => $this->path,
            'notes' => $this->notes,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'created_by' => $this->createdBy,
        ];
    }
}
