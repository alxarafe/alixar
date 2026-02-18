<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Intervention
 * Represents table fichinter
 */
class Intervention extends Model
{
    protected $table = 'fichinter';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_soc',
        'fk_projet',
        'fk_contrat',
        'ref',
        'ref_ext',
        'ref_client',
        'entity',
        'datec',
        'date_valid',
        'datei',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_statut',
        'dateo',
        'datee',
        'datet',
        'duree',
        'description',
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
