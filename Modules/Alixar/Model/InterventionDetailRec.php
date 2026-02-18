<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InterventionDetailRec
 * Represents table fichinterdet_rec
 */
class InterventionDetailRec extends Model
{
    protected $table = 'fichinterdet_rec';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_fichinter',
        'date',
        'description',
        'duree',
        'rang',
        'total_ht',
        'subprice',
        'subprice_ttc',
        'fk_parent_line',
        'fk_product',
        'label',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'qty',
        'remise_percent',
        'fk_remise_except',
        'price',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'product_type',
        'date_start',
        'date_end',
        'info_bits',
        'buy_price_ht',
        'fk_product_fournisseur_price',
        'fk_code_ventilation',
        'special_code',
        'fk_unit',
        'import_key',
    ];
}
