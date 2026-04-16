<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class StockMovementLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'fk_product' => 'productId',
            'fk_entrepot' => 'warehouseId',
            'qty' => 'qty',
            'type_mouvement' => 'type', // 0-out, 1-in, 2-transfer in Dolibarr too
            'label' => 'label',
            'inventorycode' => 'inventoryCode',
            'datem' => 'date',
            'price' => 'price'
        ];
    }
}
