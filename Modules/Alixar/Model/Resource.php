<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Resource
 * Represents table resource
 */
class Resource extends Model
{
    protected $table = 'resource';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref',
        'asset_number',
        'description',
        'fk_code_type_resource',
        'address',
        'zip',
        'town',
        'photo_filename',
        'max_users',
        'phone',
        'email',
        'url',
        'datec',
        'date_valid',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_statut',
        'note_public',
        'note_private',
        'import_key',
        'extraparams',
        'fk_country',
        'fk_state',
    ];
}
