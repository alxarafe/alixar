<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class StockMovement
 * Represents table stock_mouvement
 */
class StockMovement extends Model
{
    protected $table = 'stock_mouvement';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datem',
        'fk_product',
        'batch',
        'eatby',
        'sellby',
        'fk_entrepot',
        'value',
        'price',
        'type_mouvement',
        'fk_user_author',
        'label',
        'inventorycode',
        'fk_project',
        'fk_origin',
        'origintype',
        'model_pdf',
        'fk_projet',
    ];
}
