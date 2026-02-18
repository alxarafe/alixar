<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EcmFiles
 * Represents table ecm_files
 */
class EcmFiles extends Model
{
    protected $table = 'ecm_files';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'label',
        'share',
        'share_pass',
        'entity',
        'filepath',
        'filename',
        'src_object_type',
        'src_object_id',
        'agenda_id',
        'fullpath_orig',
        'description',
        'keywords',
        'content',
        'cover',
        'position',
        'gen_or_uploaded',
        'extraparams',
        'date_c',
        'fk_user_c',
        'fk_user_m',
        'note_private',
        'note_public',
        'acl',
    ];
}
