<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CEmailSenderprofile
 * Represents table c_email_senderprofile
 */
class CEmailSenderprofile extends Model
{
    protected $table = 'c_email_senderprofile';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'private',
        'date_creation',
        'label',
        'email',
        'signature',
        'position',
        'active',
    ];
}
