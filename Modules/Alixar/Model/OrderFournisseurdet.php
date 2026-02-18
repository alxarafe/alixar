<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderFournisseurdet
 * Represents table commande_fournisseurdet
 */
class OrderFournisseurdet extends Model
{
    protected $table = 'commande_fournisseurdet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_commande',
        'fk_parent_line',
        'fk_product',
        'ref',
        'label',
        'description',
        'vat_src_code',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'qty',
        'remise_percent',
        'remise',
        'subprice',
        'subprice_ttc',
        'total_ht',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'product_type',
        'date_start',
        'date_end',
        'info_bits',
        'special_code',
        'rang',
        'import_key',
        'fk_unit',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_subprice_ttc',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];
}
