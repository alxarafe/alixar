<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DirectDebitLignes
 * Represents table prelevement_lignes
 */
class DirectDebitLignes extends Model
{
    protected $table = 'prelevement_lignes';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_prelevement_bons',
        'fk_soc',
        'fk_user',
        'statut',
        'client_nom',
        'amount',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'note',
    ];
}
