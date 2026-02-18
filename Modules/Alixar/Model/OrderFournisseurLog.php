<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderFournisseurLog
 * Represents table commande_fournisseur_log
 */
class OrderFournisseurLog extends Model
{
    protected $table = 'commande_fournisseur_log';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datelog',
        'fk_commande',
        'fk_statut',
        'fk_user',
        'comment',
    ];
}
