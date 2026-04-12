<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\Category;

use Core\Domain\Category\Category;

interface ThirdPartyCategoryRepository
{
    /** @return Category[] */
    public function findByThirdPartyId(int $thirdPartyId, int $type): array;
    
    public function linkCategory(int $thirdPartyId, int $categoryId): void;
    
    public function unlinkCategory(int $thirdPartyId, int $categoryId): void;
}
