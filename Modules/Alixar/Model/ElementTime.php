<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ElementTime
 * Represents table element_time
 */
class ElementTime extends Model
{
    protected $table = 'element_time';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref_ext',
        'fk_element',
        'elementtype',
        'element_date',
        'element_datehour',
        'element_date_withhour',
        'element_duration',
        'fk_product',
        'fk_user',
        'thm',
        'invoice_id',
        'invoice_line_id',
        'intervention_id',
        'intervention_line_id',
        'import_key',
        'datec',
        'note',
    ];
}
