<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserClicktodial
 * Represents table user_clicktodial
 */
class UserClicktodial extends Model
{
    protected $table = 'user_clicktodial';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_user',
        'url',
        'login',
        'pass',
        'poste',
    ];
}
