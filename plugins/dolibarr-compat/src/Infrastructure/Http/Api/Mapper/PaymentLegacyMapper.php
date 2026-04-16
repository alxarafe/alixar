<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class PaymentLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'ref' => 'ref',
            'amount' => 'amount',
            'fk_paiement' => 'paymentType', // payment code/type in dolibarr
            'num_paiement' => 'num',
            'note' => 'note',
            'fk_facture' => 'invoiceId',
            'fk_bank' => 'bankAccountId',
            'datep' => 'date', // datep is typically payment date in dolibarr
            'datec' => 'createdAt',
            'tms' => 'updatedAt'
        ];
    }
}
