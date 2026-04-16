<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class WarehouseLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'ref' => 'ref',
            'label' => 'label',
            'lieu' => 'label', // sometimes Dolibarr uses lieu instead of label
            'description' => 'description',
            'address' => 'address',
            'zip' => 'zipCode',
            'town' => 'city',
            'fk_parent' => 'parentId',
            'statut' => 'status',
            'datec' => 'createdAt',
            'tms' => 'updatedAt'
        ];
    }
}
