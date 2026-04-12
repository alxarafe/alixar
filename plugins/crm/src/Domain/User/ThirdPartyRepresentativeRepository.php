<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\User;

use Core\Domain\User\User;

interface ThirdPartyRepresentativeRepository
{
    /** @return User[] */
    public function findByThirdPartyId(int $thirdPartyId): array;

    public function linkRepresentative(int $thirdPartyId, int $userId): void;
    
    public function unlinkRepresentative(int $thirdPartyId, int $userId): void;
}
