<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Links
 * Represents table links
 */
class Links extends Model
{
    protected $table = 'links';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'datea',
        'url',
        'label',
        'objecttype',
        'objectid',
    ];
}
