<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderFournisseurExtrafields
 * Represents table commande_fournisseur_extrafields
 */
class OrderFournisseurExtrafields extends Model
{
    protected $table = 'commande_fournisseur_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
