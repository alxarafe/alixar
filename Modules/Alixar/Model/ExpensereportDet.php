<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ExpensereportDet
 * Represents table expensereport_det
 */
class ExpensereportDet extends Model
{
    protected $table = 'expensereport_det';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expensereport',
        'docnumber',
        'fk_c_type_fees',
        'fk_c_exp_tax_cat',
        'fk_projet',
        'comments',
        'product_type',
        'qty',
        'subprice',
        'subprice_ttc',
        'value_unit',
        'remise_percent',
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
        'date',
        'info_bits',
        'special_code',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_subprice_ttc',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'fk_facture',
        'fk_ecm_files',
        'fk_code_ventilation',
        'rang',
        'import_key',
        'rule_warning_message',
    ];
}
