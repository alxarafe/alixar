<?php

declare(strict_types=1);

namespace Core\Domain\Attachment;

interface AttachmentRepository
{
    public function save(Attachment $attachment): int;
    public function findById(int $id): ?Attachment;
    public function findByModuleAndObject(string $module, string $objectId): array;
    public function delete(int $id): bool;
}
