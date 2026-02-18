<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class HolidayConfig
 * Represents table holiday_config
 */
class HolidayConfig extends Model
{
    protected $table = 'holiday_config';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'name',
        'value',
    ];
}
