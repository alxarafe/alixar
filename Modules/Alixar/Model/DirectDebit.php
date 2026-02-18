<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DirectDebit
 * Represents table prelevement
 */
class DirectDebit extends Model
{
    protected $table = 'prelevement';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_facture',
        'fk_facture_fourn',
        'fk_salary',
        'fk_prelevement_lignes',
    ];
}
