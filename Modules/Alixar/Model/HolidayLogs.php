<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class HolidayLogs
 * Represents table holiday_logs
 */
class HolidayLogs extends Model
{
    protected $table = 'holiday_logs';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'date_action',
        'fk_user_action',
        'fk_user_update',
        'fk_type',
        'type_action',
        'prev_solde',
        'new_solde',
    ];
}
