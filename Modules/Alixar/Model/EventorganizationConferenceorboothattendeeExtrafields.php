<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EventorganizationConferenceorboothattendeeExtrafields
 * Represents table eventorganization_conferenceorboothattendee_extrafields
 */
class EventorganizationConferenceorboothattendeeExtrafields extends Model
{
    protected $table = 'eventorganization_conferenceorboothattendee_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
