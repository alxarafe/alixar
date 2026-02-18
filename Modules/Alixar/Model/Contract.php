<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Contract
 * Represents table contrat
 */
class Contract extends Model
{
    protected $table = 'contrat';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_customer',
        'ref_supplier',
        'ref_ext',
        'entity',
        'datec',
        'date_contrat',
        'statut',
        'fin_validite',
        'date_cloture',
        'fk_soc',
        'fk_projet',
        'fk_commercial_signature',
        'fk_commercial_suivi',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_cloture',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
        'denormalized_lower_planned_end_date',
        'signed_status',
        'online_sign_ip',
        'online_sign_name',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'import_key',
        'extraparams',
    ];
}
