<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InterventionRec
 * Represents table fichinter_rec
 */
class InterventionRec extends Model
{
    protected $table = 'fichinter_rec';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'title',
        'entity',
        'fk_soc',
        'datec',
        'fk_contrat',
        'fk_user_author',
        'fk_projet',
        'duree',
        'description',
        'modelpdf',
        'note_private',
        'note_public',
        'frequency',
        'unit_frequency',
        'date_when',
        'date_last_gen',
        'nb_gen_done',
        'nb_gen_max',
        'auto_validate',
        'status',
    ];
}
