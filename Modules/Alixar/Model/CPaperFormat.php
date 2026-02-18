<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CPaperFormat
 * Represents table c_paper_format
 */
class CPaperFormat extends Model
{
    protected $table = 'c_paper_format';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'width',
        'height',
        'unit',
        'active',
        'module',
    ];
}
