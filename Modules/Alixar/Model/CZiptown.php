<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CZiptown
 * Represents table c_ziptown
 */
class CZiptown extends Model
{
    protected $table = 'c_ziptown';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'fk_county',
        'fk_pays',
        'zip',
        'town',
        'town_up',
        'active',
    ];
}
