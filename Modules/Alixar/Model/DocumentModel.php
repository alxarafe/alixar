<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DocumentModel
 * Represents table document_model
 */
class DocumentModel extends Model
{
    protected $table = 'document_model';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'nom',
        'entity',
        'type',
        'libelle',
        'description',
    ];
}
