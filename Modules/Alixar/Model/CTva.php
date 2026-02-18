<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTva
 * Represents table c_tva
 */
class CTva extends Model
{
    protected $table = 'c_tva';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_pays',
        'fk_department_buyer',
        'code',
        'type_vat',
        'taux',
        'localtax1',
        'localtax1_type',
        'localtax2',
        'localtax2_type',
        'use_default',
        'recuperableonly',
        'note',
        'active',
        'accountancy_code_sell',
        'accountancy_code_buy',
    ];
}
