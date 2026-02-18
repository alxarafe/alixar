<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderFournisseur
 * Represents table commande_fournisseur
 */
class OrderFournisseur extends Model
{
    protected $table = 'commande_fournisseur';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'ref_supplier',
        'fk_soc',
        'fk_projet',
        'date_creation',
        'date_valid',
        'date_approve',
        'date_approve2',
        'date_commande',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_approve',
        'fk_user_approve2',
        'source',
        'fk_statut',
        'billed',
        'amount_ht',
        'remise_percent',
        'remise',
        'total_tva',
        'localtax1',
        'localtax2',
        'total_ht',
        'total_ttc',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'date_livraison',
        'fk_account',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'fk_input_method',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];
}
