<?php

declare(strict_types=1);

namespace Core\Domain\EmailTemplate;

interface EmailTemplateRepository
{
    public function save(EmailTemplate $template): int;
    public function findById(int $id): ?EmailTemplate;
    public function findAll(): array;
    public function delete(int $id): bool;
}
