<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Extrafields
 * Represents table extrafields
 */
class Extrafields extends Model
{
    protected $table = 'extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'name',
        'entity',
        'elementtype',
        'label',
        'type',
        'size',
        'fieldcomputed',
        'fielddefault',
        'fieldunique',
        'fieldrequired',
        'perms',
        'enabled',
        'module',
        'pos',
        'alwayseditable',
        'param',
        'list',
        'printable',
        'totalizable',
        'langs',
        'help',
        'css',
        'cssview',
        'csslist',
        'fk_user_author',
        'fk_user_modif',
        'datec',
    ];
}
