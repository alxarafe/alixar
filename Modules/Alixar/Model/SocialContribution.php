<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class SocialContribution
 * Represents table chargesociales
 */
class SocialContribution extends Model
{
    protected $table = 'chargesociales';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'date_ech',
        'libelle',
        'entity',
        'date_creation',
        'date_valid',
        'fk_user',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_type',
        'fk_account',
        'fk_mode_reglement',
        'amount',
        'paye',
        'periode',
        'fk_projet',
        'note_private',
        'note_public',
        'import_key',
    ];
}
