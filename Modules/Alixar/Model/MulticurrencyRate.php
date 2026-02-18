<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MulticurrencyRate
 * Represents table multicurrency_rate
 */
class MulticurrencyRate extends Model
{
    protected $table = 'multicurrency_rate';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'date_sync',
        'rate',
        'rate_indirect',
        'fk_multicurrency',
        'entity',
    ];
}
