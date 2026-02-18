<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Comment
 * Represents table comment
 */
class Comment extends Model
{
    protected $table = 'comment';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'description',
        'fk_user_author',
        'fk_user_modif',
        'fk_element',
        'element_type',
        'entity',
        'import_key',
    ];
}
