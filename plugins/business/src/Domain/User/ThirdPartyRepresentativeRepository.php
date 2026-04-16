<?php

declare(strict_types=1);

namespace Plugin\Business\Domain\User;

interface ThirdPartyRepresentativeRepository
{
    /** @return Representative[] */
    public function findByThirdPartyId(int $thirdPartyId): array;

    public function linkRepresentative(int $thirdPartyId, int $userId): void;
    
    public function unlinkRepresentative(int $thirdPartyId, int $userId): void;
}
