<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class HolidayUsers
 * Represents table holiday_users
 */
class HolidayUsers extends Model
{
    protected $table = 'holiday_users';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_user',
        'fk_type',
        'nb_holiday',
    ];
}
