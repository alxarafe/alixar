<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceRec
 * Represents table facture_rec
 */
class InvoiceRec extends Model
{
    protected $table = 'facture_rec';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'titre',
        'entity',
        'subtype',
        'fk_soc',
        'datec',
        'suspended',
        'amount',
        'remise',
        'remise_percent',
        'remise_absolue',
        'vat_src_code',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
        'fk_user_author',
        'fk_user_modif',
        'fk_projet',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'date_lim_reglement',
        'fk_account',
        'fk_societe_rib',
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
