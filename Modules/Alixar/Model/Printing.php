<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Printing
 * Represents table printing
 */
class Printing extends Model
{
    protected $table = 'printing';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'printer_name',
        'printer_location',
        'printer_id',
        'copy',
        'module',
        'driver',
        'userid',
    ];
}
