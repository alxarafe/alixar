<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ElementElement
 * Represents table element_element
 */
class ElementElement extends Model
{
    protected $table = 'element_element';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_source',
        'sourcetype',
        'fk_target',
        'targettype',
        'relationtype',
    ];
}
