<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CEcotaxe
 * Represents table c_ecotaxe
 */
class CEcotaxe extends Model
{
    protected $table = 'c_ecotaxe';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'price',
        'organization',
        'fk_pays',
        'active',
    ];
}
