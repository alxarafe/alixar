<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ProductLegacyMapper extends AbstractLegacyMapper
{
    /**
     * Define the mapping from legacy keys to native keys.
     */
    public function __construct()
    {
        $this->mapping = [
            'id' => 'id',
            'entity' => 'entity',
            'ref' => 'ref',
            'ref_ext' => 'refExt',
            'barcode' => 'barcode',
            'label' => 'label',
            'description' => 'description',
            'price' => 'price',
            'price_ttc' => 'priceTtc',
            'tva_tx' => 'tvaTx',
            'fk_product_type' => 'type',
            'tosell' => 'status',
            'tobuy' => 'statusBuy',
            'datec' => 'createdAt',
            'tms' => 'updatedAt',
        ];
    }
}
