<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournDet
 * Represents table facture_fourn_det
 */
class InvoiceFournDet extends Model
{
    protected $table = 'facture_fourn_det';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_facture_fourn',
        'fk_parent_line',
        'fk_product',
        'ref',
        'label',
        'description',
        'pu_ht',
        'pu_ttc',
        'qty',
        'remise_percent',
        'fk_remise_except',
        'vat_src_code',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'total_ht',
        'tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'product_type',
        'date_start',
        'date_end',
        'info_bits',
        'fk_code_ventilation',
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
