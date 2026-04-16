<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class InvoiceLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'id' => 'id', 'socid' => 'thirdPartyId', 'ref' => 'ref',
            'ref_client' => 'refClient', 'ref_ext' => 'refExt',
            'note_private' => 'notePrivate', 'note_public' => 'notePublic',
            'total_ht' => 'totalHt', 'total_tva' => 'totalVat', 'total_ttc' => 'totalTtc',
            'fk_statut' => 'status', 'date_creation' => 'createdAt', 'tms' => 'updatedAt',
            'datef' => 'date', 'date_lim_reglement' => 'dateDue', 'paye' => 'isPaid',
            'fk_cond_reglement' => 'paymentTerms', 'fk_mode_reglement' => 'paymentMode'
        ];
    }
}
