<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CSocialnetworks
 * Represents table c_socialnetworks
 */
class CSocialnetworks extends Model
{
    protected $table = 'c_socialnetworks';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'label',
        'url',
        'icon',
        'active',
    ];
}
