<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DefaultValues
 * Represents table default_values
 */
class DefaultValues extends Model
{
    protected $table = 'default_values';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'type',
        'user_id',
        'page',
        'param',
        'value',
    ];
}
