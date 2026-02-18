<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Holiday
 * Represents table holiday
 */
class Holiday extends Model
{
    protected $table = 'holiday';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_ext',
        'entity',
        'fk_user',
        'fk_user_create',
        'fk_user_modif',
        'fk_type',
        'date_create',
        'description',
        'date_debut',
        'date_fin',
        'halfday',
        'nb_open_day',
        'statut',
        'fk_validator',
        'date_valid',
        'fk_user_valid',
        'date_approval',
        'fk_user_approve',
        'date_refuse',
        'fk_user_refuse',
        'date_cancel',
        'fk_user_cancel',
        'detail_refuse',
        'note_private',
        'note_public',
        'import_key',
        'extraparams',
    ];
}
