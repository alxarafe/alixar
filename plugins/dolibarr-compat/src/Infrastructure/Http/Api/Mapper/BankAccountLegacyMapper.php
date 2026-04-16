<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class BankAccountLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'fk_soc' => 'thirdPartyId',
            'bank' => 'bank',
            'code_banque' => 'bankCode',
            'code_guichet' => 'deskCode',
            'number' => 'number',
            'cle_rib' => 'ribKey',
            'bic' => 'bic',
            'iban' => 'iban',
            'proprio' => 'ownerName',
            'owner_address' => 'ownerAddress',
            'label' => 'label',
            'default_rib' => 'isDefault',
        ];
    }
}
