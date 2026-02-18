<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EcmDirectories
 * Represents table ecm_directories
 */
class EcmDirectories extends Model
{
    protected $table = 'ecm_directories';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'label',
        'entity',
        'fk_parent',
        'description',
        'cachenbofdoc',
        'fullpath',
        'extraparams',
        'date_c',
        'fk_user_c',
        'fk_user_m',
        'note_private',
        'note_public',
        'acl',
    ];
}
