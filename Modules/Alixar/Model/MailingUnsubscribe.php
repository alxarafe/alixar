<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MailingUnsubscribe
 * Represents table mailing_unsubscribe
 */
class MailingUnsubscribe extends Model
{
    protected $table = 'mailing_unsubscribe';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'email',
        'unsubscribegroup',
        'ip',
        'date_creat',
    ];
}
