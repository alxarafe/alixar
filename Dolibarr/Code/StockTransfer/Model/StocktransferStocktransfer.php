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

namespace Dolibarr\Code\StockTransfer\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class StocktransferStocktransfer
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property string|null $label
 * @property int|null $fk_soc
 * @property int|null $fk_project
 * @property int|null $fk_warehouse_source
 * @property int|null $fk_warehouse_destination
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon|null $tms
 * @property Carbon $date_creation
 * @property Carbon|null $date_prevue_depart
 * @property Carbon|null $date_reelle_depart
 * @property Carbon|null $date_prevue_arrivee
 * @property Carbon|null $date_reelle_arrivee
 * @property int|null $lead_time_for_warning
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property int $status
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 *
 * @property User $user
 */
class StocktransferStocktransfer extends Model
{
    public $timestamps = false;
    protected $table = 'stocktransfer_stocktransfer';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'fk_project' => 'int',
        'fk_warehouse_source' => 'int',
        'fk_warehouse_destination' => 'int',
        'tms' => 'datetime',
        'date_creation' => 'datetime',
        'date_prevue_depart' => 'datetime',
        'date_reelle_depart' => 'datetime',
        'date_prevue_arrivee' => 'datetime',
        'date_reelle_arrivee' => 'datetime',
        'lead_time_for_warning' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int',
        'fk_incoterms' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'fk_soc',
        'fk_project',
        'fk_warehouse_source',
        'fk_warehouse_destination',
        'description',
        'note_public',
        'note_private',
        'tms',
        'date_creation',
        'date_prevue_depart',
        'date_reelle_depart',
        'date_prevue_arrivee',
        'date_reelle_arrivee',
        'lead_time_for_warning',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'model_pdf',
        'last_main_doc',
        'status',
        'fk_incoterms',
        'location_incoterms'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}
