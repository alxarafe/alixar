<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Donation
 * Represents table don (Donaciones)
 * Dolibarr: htdocs/don/class/don.class.php
 */
class Donation extends Model
{
    protected $table = 'don';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'tms',
        'datedon',
        'amount',
        'fk_payment',
        'paid',
        'firstname',
        'lastname',
        'societe',
        'address',
        'zip',
        'town',
        'country',
        'email',
        'phone',
        'phone_mobile',
        'public',
        'fk_statut',
        'fk_projet',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'note_private',
        'note_public',
        'model_pdf',
        'import_key',
    ];
}
