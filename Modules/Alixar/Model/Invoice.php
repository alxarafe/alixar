<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class Invoice
 * Represents table facture
 */
class Invoice extends Model
{
    use HasReference;
    protected $table = 'facture';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'ref_client',
        'type',
        'subtype',
        'fk_soc',
        'datec',
        'datef',
        'date_pointoftax',
        'date_valid',
        'date_closing',
        'paye',
        'remise_percent',
        'remise_absolue',
        'remise',
        'close_code',
        'close_missing_amount',
        'close_note',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
        'fk_statut',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_closing',
        'module_source',
        'pos_source',
        'fk_fac_rec_source',
        'fk_facture_source',
        'fk_projet',
        'increment',
        'fk_account',
        'fk_currency',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'date_lim_reglement',
        'payment_reference',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'fk_incoterms',
        'location_incoterms',
        'fk_transport_mode',
        'prorata_discount',
        'situation_cycle_ref',
        'situation_counter',
        'situation_final',
        'retained_warranty',
        'retained_warranty_date_limit',
        'retained_warranty_fk_cond_reglement',
        'import_key',
        'extraparams',
        'is_also_delivery_note',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];

    /**
     * Get the third party associated with the invoice.
     */
    public function thirdParty()
    {
        return $this->belongsTo(ThirdParty::class, 'fk_soc', 'rowid');
    }

    /**
     * Get the lines of the invoice.
     */
    public function lines()
    {
        return $this->hasMany(InvoiceDetail::class, 'fk_facid', 'rowid');
    }
}
