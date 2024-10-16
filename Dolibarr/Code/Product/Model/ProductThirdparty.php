<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\Product\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ProductThirdparty
 *
 * @property int $rowid
 * @property int $fk_product
 * @property int $fk_soc
 * @property int $fk_product_thirdparty_relation_type
 * @property Carbon|null $date_start
 * @property Carbon|null $date_end
 * @property int|null $fk_project
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 */
class ProductThirdparty extends Model
{
    public $timestamps = false;
    protected $table = 'product_thirdparty';
    protected $casts = [
        'fk_product' => 'int',
        'fk_soc' => 'int',
        'fk_product_thirdparty_relation_type' => 'int',
        'date_start' => 'datetime',
        'date_end' => 'datetime',
        'fk_project' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'fk_product',
        'fk_soc',
        'fk_product_thirdparty_relation_type',
        'date_start',
        'date_end',
        'fk_project',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'last_main_doc',
        'import_key',
        'model_pdf',
        'status'
    ];
}
