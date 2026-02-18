<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Menu
 * Represents table menu
 */
class Menu extends Model
{
    protected $table = 'menu';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'menu_handler',
        'entity',
        'module',
        'type',
        'mainmenu',
        'leftmenu',
        'fk_menu',
        'fk_mainmenu',
        'fk_leftmenu',
        'position',
        'url',
        'target',
        'titre',
        'prefix',
        'langs',
        'level',
        'perms',
        'enabled',
        'usertype',
    ];
}
