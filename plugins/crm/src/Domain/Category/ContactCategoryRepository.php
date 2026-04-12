<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\Category;

use Core\Domain\Category\Category;

interface ContactCategoryRepository
{
    /** @return Category[] */
    public function findByContactId(int $contactId): array;

    public function linkCategory(int $contactId, int $categoryId): void;

    public function unlinkCategory(int $contactId, int $categoryId): void;
}
