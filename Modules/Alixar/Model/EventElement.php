<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EventElement
 * Represents table event_element
 */
class EventElement extends Model
{
    protected $table = 'event_element';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_source',
        'fk_target',
        'targettype',
    ];
}
