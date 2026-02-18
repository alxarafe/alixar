<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CChargesociales
 * Represents table c_chargesociales
 */
class CChargesociales extends Model
{
    protected $table = 'c_chargesociales';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'libelle',
        'deductible',
        'active',
        'code',
        'accountancy_code',
        'fk_pays',
        'module',
    ];
}
