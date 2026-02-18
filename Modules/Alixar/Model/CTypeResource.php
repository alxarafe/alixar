<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTypeResource
 * Represents table c_type_resource
 */
class CTypeResource extends Model
{
    protected $table = 'c_type_resource';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'active',
    ];
}
