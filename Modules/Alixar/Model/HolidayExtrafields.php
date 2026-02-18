<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class HolidayExtrafields
 * Represents table holiday_extrafields
 */
class HolidayExtrafields extends Model
{
    protected $table = 'holiday_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
