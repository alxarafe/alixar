<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PosCashFence
 * Represents table pos_cash_fence
 */
class PosCashFence extends Model
{
    protected $table = 'pos_cash_fence';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'opening',
        'cash',
        'card',
        'cheque',
        'status',
        'date_creation',
        'date_valid',
        'day_close',
        'month_close',
        'year_close',
        'posmodule',
        'posnumber',
        'fk_user_creat',
        'fk_user_valid',
        'import_key',
    ];
}
