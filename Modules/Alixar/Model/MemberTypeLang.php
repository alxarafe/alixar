<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MemberTypeLang
 * Represents table adherent_type_lang
 */
class MemberTypeLang extends Model
{
    protected $table = 'adherent_type_lang';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_type',
        'lang',
        'label',
        'description',
        'email',
        'import_key',
    ];
}
