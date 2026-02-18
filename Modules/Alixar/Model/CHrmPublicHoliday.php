<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CHrmPublicHoliday
 * Represents table c_hrm_public_holiday
 */
class CHrmPublicHoliday extends Model
{
    protected $table = 'c_hrm_public_holiday';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'entity',
        'fk_country',
        'fk_departement',
        'code',
        'dayrule',
        'day',
        'month',
        'year',
        'active',
        'import_key',
    ];
}
