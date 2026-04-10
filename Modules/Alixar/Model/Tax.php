<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Tax
 * Represents table chargesociales (Impuestos y cargas sociales)
 * Dolibarr: htdocs/compta/sociales/class/chargesociales.class.php
 */
class Tax extends Model
{
    protected $table = 'chargesociales';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'tms',
        'date_ech',
        'libelle',
        'label',
        'fk_type',
        'amount',
        'paye',
        'periode',
        'fk_account',
        'fk_mode_reglement',
        'fk_user_author',
        'fk_user_modif',
        'fk_projet',
        'note_private',
        'note_public',
        'import_key',
    ];
}
