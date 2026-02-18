<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceDetail
 * Represents table facturedet
 */
class InvoiceDetail extends Model
{
    protected $table = 'facturedet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_facture',
        'fk_parent_line',
        'fk_product',
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
        'fk_remise_except',
        'subprice',
        'subprice_ttc',
        'price',
        'total_ht',
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
        'batch',
        'fk_warehouse',
        'special_code',
        'rang',
        'fk_contract_line',
        'fk_unit',
        'import_key',
        'fk_code_ventilation',
        'situation_percent',
        'fk_prev_id',
        'fk_user_author',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_subprice_ttc',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'ref_ext',
    ];
}
