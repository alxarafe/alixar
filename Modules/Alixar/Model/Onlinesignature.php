<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Onlinesignature
 * Represents table onlinesignature
 */
class Onlinesignature extends Model
{
    protected $table = 'onlinesignature';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'object_type',
        'object_id',
        'datec',
        'name',
        'ip',
        'pathoffile',
    ];
}
