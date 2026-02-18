<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DirectDebitRejet
 * Represents table prelevement_rejet
 */
class DirectDebitRejet extends Model
{
    protected $table = 'prelevement_rejet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_prelevement_lignes',
        'date_rejet',
        'motif',
        'date_creation',
        'fk_user_creation',
        'note',
        'afacturer',
        'fk_facture',
    ];
}
