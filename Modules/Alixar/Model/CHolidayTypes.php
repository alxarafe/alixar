<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CHolidayTypes
 * Represents table c_holiday_types
 */
class CHolidayTypes extends Model
{
    protected $table = 'c_holiday_types';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'label',
        'affect',
        'delay',
        'newbymonth',
        'fk_country',
        'block_if_negative',
        'sortorder',
        'active',
    ];
}
