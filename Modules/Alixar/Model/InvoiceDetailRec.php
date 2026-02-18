<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceDetailRec
 * Represents table facturedet_rec
 */
class InvoiceDetailRec extends Model
{
    protected $table = 'facturedet_rec';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_facture',
        'fk_parent_line',
        'fk_product',
        'product_type',
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
        'price',
        'total_ht',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'date_start_fill',
        'date_end_fill',
        'info_bits',
        'buy_price_ht',
        'fk_product_fournisseur_price',
        'special_code',
        'rang',
        'fk_contract_line',
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
