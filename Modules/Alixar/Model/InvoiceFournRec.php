<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournRec
 * Represents table facture_fourn_rec
 */
class InvoiceFournRec extends Model
{
    protected $table = 'facture_fourn_rec';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'titre',
        'ref_supplier',
        'entity',
        'subtype',
        'fk_soc',
        'datec',
        'suspended',
        'libelle',
        'amount',
        'remise',
        'vat_src_code',
        'localtax1',
        'localtax2',
        'total_ht',
        'total_tva',
        'total_ttc',
        'fk_user_author',
        'fk_user_modif',
        'fk_projet',
        'fk_account',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'date_lim_reglement',
        'note_private',
        'note_public',
        'modelpdf',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'usenewprice',
        'frequency',
        'unit_frequency',
        'date_when',
        'date_last_gen',
        'nb_gen_done',
        'nb_gen_max',
        'auto_validate',
        'generate_pdf',
    ];
}
