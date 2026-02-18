<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyRemiseExcept
 * Represents table societe_remise_except
 */
class ThirdPartyRemiseExcept extends Model
{
    protected $table = 'societe_remise_except';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_soc',
        'discount_type',
        'datec',
        'amount_ht',
        'amount_tva',
        'amount_ttc',
        'tva_tx',
        'vat_src_code',
        'fk_user',
        'fk_facture_line',
        'fk_facture',
        'fk_facture_source',
        'fk_invoice_supplier_line',
        'fk_invoice_supplier',
        'fk_invoice_supplier_source',
        'description',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount_ht',
        'multicurrency_amount_tva',
        'multicurrency_amount_ttc',
    ];
}
