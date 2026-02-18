<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CEmailTemplates
 * Represents table c_email_templates
 */
class CEmailTemplates extends Model
{
    protected $table = 'c_email_templates';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'module',
        'type_template',
        'lang',
        'private',
        'fk_user',
        'datec',
        'label',
        'position',
        'defaultfortype',
        'enabled',
        'active',
        'email_from',
        'email_to',
        'email_tocc',
        'email_tobcc',
        'topic',
        'joinfiles',
        'content',
        'content_lines',
    ];
}
