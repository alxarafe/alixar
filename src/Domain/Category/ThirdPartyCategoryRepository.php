<?php

declare(strict_types=1);

namespace App\Domain\Category;

interface ThirdPartyCategoryRepository
{
    /** @return Category[] */
    public function findByThirdPartyId(int $thirdPartyId, int $type): array;
    
    public function linkCategory(int $thirdPartyId, int $categoryId): void;
    
    public function unlinkCategory(int $thirdPartyId, int $categoryId): void;
}
