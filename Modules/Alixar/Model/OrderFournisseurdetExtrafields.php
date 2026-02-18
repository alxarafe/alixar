<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderFournisseurdetExtrafields
 * Represents table commande_fournisseurdet_extrafields
 */
class OrderFournisseurdetExtrafields extends Model
{
    protected $table = 'commande_fournisseurdet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
