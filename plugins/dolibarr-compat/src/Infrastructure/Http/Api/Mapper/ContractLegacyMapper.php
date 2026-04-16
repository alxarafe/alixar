<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ContractLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'ref' => 'ref',
            'socid' => 'thirdPartyId',
            'note_private' => 'notePrivate',
            'note_public' => 'notePublic',
            'statut' => 'status',
            'date_contrat' => 'dateContract',
            'date_creation' => 'createdAt',
            'tms' => 'updatedAt'
        ];
    }
}
