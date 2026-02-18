<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CRegions
 * Represents table c_regions
 */
class CRegions extends Model
{
    protected $table = 'c_regions';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code_region',
        'fk_pays',
        'cheflieu',
        'tncc',
        'nom',
        'active',
    ];
}
