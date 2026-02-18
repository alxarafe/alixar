<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CStcomm
 * Represents table c_stcomm
 */
class CStcomm extends Model
{
    protected $table = 'c_stcomm';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'libelle',
        'picto',
        'sortorder',
        'active',
    ];
}
