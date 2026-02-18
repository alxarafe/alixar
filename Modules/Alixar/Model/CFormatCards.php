<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CFormatCards
 * Represents table c_format_cards
 */
class CFormatCards extends Model
{
    protected $table = 'c_format_cards';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'name',
        'paper_size',
        'orientation',
        'metric',
        'leftmargin',
        'topmargin',
        'nx',
        'ny',
        'spacex',
        'spacey',
        'width',
        'height',
        'font_size',
        'custom_x',
        'custom_y',
        'active',
    ];
}
