<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserExtrafields
 * Represents table user_extrafields
 */
class UserExtrafields extends Model
{
    protected $table = 'user_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
