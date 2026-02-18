<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MemberType
 * Represents table adherent_type
 */
class MemberType extends Model
{
    protected $table = 'adherent_type';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'statut',
        'libelle',
        'morphy',
        'duration',
        'subscription',
        'amount',
        'caneditamount',
        'vote',
        'note',
        'mail_valid',
    ];
}
