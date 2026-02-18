<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Bookmark
 * Represents table bookmark
 */
class Bookmark extends Model
{
    protected $table = 'bookmark';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_user',
        'dateb',
        'url',
        'target',
        'title',
        'favicon',
        'position',
        'entity',
    ];
}
