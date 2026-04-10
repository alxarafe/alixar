<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Mailing
 * Represents table mailing (Campañas de email)
 * Dolibarr: htdocs/comm/mailing/class/mailing.class.php
 */
class Mailing extends Model
{
    protected $table = 'mailing';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'datec',
        'tms',
        'titre',
        'sujet',
        'body',
        'bgcolor',
        'bgimage',
        'statut',
        'email_from',
        'email_replyto',
        'email_errorsto',
        'nbemail',
        'date_envoi',
        'fk_user_creat',
        'fk_user_valid',
        'extraparams',
    ];
}
