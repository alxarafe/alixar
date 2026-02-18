<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CPaiement
 * Represents table c_paiement
 */
class CPaiement extends Model
{
    protected $table = 'c_paiement';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'entity',
        'code',
        'libelle',
        'type',
        'active',
        'accountancy_code',
        'module',
        'position',
    ];
}
