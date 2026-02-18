<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EmailcollectorEmailcollector
 * Represents table emailcollector_emailcollector
 */
class EmailcollectorEmailcollector extends Model
{
    protected $table = 'emailcollector_emailcollector';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'description',
        'host',
        'port',
        'hostcharset',
        'imap_encryption',
        'norsh',
        'login',
        'acces_type',
        'oauth_service',
        'password',
        'source_directory',
        'target_directory',
        'maxemailpercollect',
        'datelastresult',
        'codelastresult',
        'lastresult',
        'datelastok',
        'note_public',
        'note_private',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'position',
        'import_key',
        'status',
    ];
}
