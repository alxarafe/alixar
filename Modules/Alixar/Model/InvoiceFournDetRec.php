<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournDetRec
 * Represents table facture_fourn_det_rec
 */
class InvoiceFournDetRec extends Model
{
    protected $table = 'facture_fourn_det_rec';
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
        'fk_unit',
        'import_key',
        'fk_user_author',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_subprice_ttc',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];
}
