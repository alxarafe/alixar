<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserGroup
 * Represents table usergroup
 */
class UserGroup extends Model
{
    protected $table = 'usergroup';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'nom',
        'entity',
        'datec',
        'note',
        'model_pdf',
    ];
}
