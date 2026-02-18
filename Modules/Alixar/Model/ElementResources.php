<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ElementResources
 * Represents table element_resources
 */
class ElementResources extends Model
{
    protected $table = 'element_resources';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'element_id',
        'element_type',
        'resource_id',
        'resource_type',
        'busy',
        'mandatory',
        'duree',
        'fk_user_create',
    ];
}
