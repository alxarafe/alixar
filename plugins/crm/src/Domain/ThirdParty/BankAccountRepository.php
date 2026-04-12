<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\ThirdParty;

interface BankAccountRepository
{
    public function findById(int $id): ?BankAccount;
    
    /** @return BankAccount[] */
    public function findByThirdPartyId(int $thirdPartyId): array;
    
    public function save(BankAccount $account): void;
    
    public function delete(int $id): void;
}
