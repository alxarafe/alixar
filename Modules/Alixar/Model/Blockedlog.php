<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Blockedlog
 * Represents table blockedlog
 */
class Blockedlog extends Model
{
    protected $table = 'blockedlog';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'date_creation',
        'action',
        'amounts',
        'element',
        'fk_user',
        'user_fullname',
        'fk_object',
        'ref_object',
        'date_object',
        'signature',
        'signature_line',
        'object_data',
        'object_version',
        'certified',
    ];
}
