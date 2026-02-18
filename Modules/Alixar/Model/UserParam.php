<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserParam
 * Represents table user_param
 */
class UserParam extends Model
{
    protected $table = 'user_param';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_user',
        'entity',
        'param',
        'value',
    ];
}
