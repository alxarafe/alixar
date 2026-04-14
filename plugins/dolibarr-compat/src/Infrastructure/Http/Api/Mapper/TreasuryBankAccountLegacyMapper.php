<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class TreasuryBankAccountLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'id'             => 'id',
            'ref'            => 'ref',
            'label'          => 'label',
            'bank'           => 'bank',
            'bic'            => 'bic',
            'iban_prefix'    => 'ibanPrefix',
            'currency_code'  => 'currencyCode',
            'clos'           => 'status',         // in dolibarr: clos = status
            'courant'        => 'accountType',    // in dolibarr: courant = account type (1=courant)
            'datec'          => 'createdAt',
            'tms'            => 'updatedAt'
        ];
    }

    public function toLegacy(array $nativePayload): array
    {
        $legacy = parent::toLegacy($nativePayload);
        // Ensure some defaults for legacy clients
        if (!isset($legacy['clos'])) {
            $legacy['clos'] = 0;
        }
        return $legacy;
    }
}
