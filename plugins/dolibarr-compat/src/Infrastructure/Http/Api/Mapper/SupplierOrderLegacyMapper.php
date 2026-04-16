<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class SupplierOrderLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'id' => 'id', 'socid' => 'thirdPartyId', 'ref' => 'ref',
            'ref_supplier' => 'refSupplier', 'ref_ext' => 'refExt',
            'note_private' => 'notePrivate', 'note_public' => 'notePublic',
            'total_ht' => 'totalHt', 'total_tva' => 'totalTva', 'total_ttc' => 'totalTtc',
            'statut' => 'status', 'datec' => 'createdAt', 'tms' => 'updatedAt'
        ];
    }
}
