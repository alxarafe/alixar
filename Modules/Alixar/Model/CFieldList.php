<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CFieldList
 * Represents table c_field_list
 */
class CFieldList extends Model
{
    protected $table = 'c_field_list';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'element',
        'entity',
        'name',
        'alias',
        'title',
        'align',
        'sort',
        'search',
        'visible',
        'enabled',
        'rang',
    ];
}
