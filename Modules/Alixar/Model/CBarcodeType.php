<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CBarcodeType
 * Represents table c_barcode_type
 */
class CBarcodeType extends Model
{
    protected $table = 'c_barcode_type';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'entity',
        'libelle',
        'coder',
        'example',
    ];
}
