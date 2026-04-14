<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ThirdPartyLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'nom' => 'name',
            'name_alias' => 'nameAlias',
            'client' => 'type',
            'fournisseur' => 'isSupplier',
            'status' => 'status',
            'address' => 'address',
            'zip' => 'zip',
            'town' => 'town',
            'fk_pays' => 'countryId',
            'phone' => 'phone',
            'email' => 'email',
            'url' => 'url',
            'tva_intra' => 'vatNumber',
            'siren' => 'nif',
            'capital' => 'capital',
            'code_client' => 'customerCode',
            'code_fournisseur' => 'supplierCode',
            'note_private' => 'notePrivate',
            'note_public' => 'notePublic',
            'entity' => 'entity',
            'datec' => 'createdAt',
        ];
    }
}
