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

namespace Dolibarr\Code\Delivery\Model;

use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\UserGroup\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Delivery
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property string $ref
 * @property int $entity
 * @property int $fk_soc
 * @property string|null $ref_ext
 * @property string|null $ref_customer
 * @property Carbon|null $date_creation
 * @property int|null $fk_user_author
 * @property Carbon|null $date_valid
 * @property int|null $fk_user_valid
 * @property Carbon|null $date_delivery
 * @property int|null $fk_address
 * @property int|null $fk_statut
 * @property float|null $total_ht
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property Societe $societe
 * @property User|null $user
 * @property Collection|Deliverydet[] $deliverydets
 */
class Delivery extends Model
{
    public $timestamps = false;
    protected $table = 'delivery';
    protected $casts = [
        'tms' => 'datetime',
        'entity' => 'int',
        'fk_soc' => 'int',
        'date_creation' => 'datetime',
        'fk_user_author' => 'int',
        'date_valid' => 'datetime',
        'fk_user_valid' => 'int',
        'date_delivery' => 'datetime',
        'fk_address' => 'int',
        'fk_statut' => 'int',
        'total_ht' => 'float',
        'fk_incoterms' => 'int'
    ];

    protected $fillable = [
        'tms',
        'ref',
        'entity',
        'fk_soc',
        'ref_ext',
        'ref_customer',
        'date_creation',
        'fk_user_author',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'fk_address',
        'fk_statut',
        'total_ht',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_valid');
    }

    public function deliverydets()
    {
        return $this->hasMany(Deliverydet::class, 'fk_delivery');
    }
}
