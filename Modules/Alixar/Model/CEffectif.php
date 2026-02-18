<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CEffectif
 * Represents table c_effectif
 */
class CEffectif extends Model
{
    protected $table = 'c_effectif';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'libelle',
        'active',
        'module',
    ];
}
