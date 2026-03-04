<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class InvoiceFourn
 * Represents table facture_fourn
 */
class InvoiceFourn extends Model
{
    use HasReference;

    protected $table = 'facture_fourn';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_supplier',
        'entity',
        'ref_ext',
        'type',
        'subtype',
        'fk_soc',
        'datec',
        'datef',
        'date_pointoftax',
        'date_valid',
        'date_closing',
        'libelle',
        'paye',
        'amount',
        'remise',
        'close_code',
        'close_missing_amount',
        'close_note',
        'vat_reverse_charge',
        'tva',
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
        'fk_fac_rec_source',
        'fk_facture_source',
        'fk_projet',
        'fk_account',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'date_lim_reglement',
        'note_private',
        'note_public',
        'fk_incoterms',
        'location_incoterms',
        'fk_transport_mode',
        'model_pdf',
        'last_main_doc',
        'import_key',
        'extraparams',
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
        return $this->hasMany(InvoiceFournDet::class, 'fk_facture_fourn', 'rowid');
    }
}
