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

namespace Dolibarr\Code\Reception\Model;

use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CShipmentMode;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Reception
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property string $ref
 * @property int $entity
 * @property int $fk_soc
 * @property int|null $fk_projet
 * @property string|null $ref_ext
 * @property string|null $ref_supplier
 * @property Carbon|null $date_creation
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property Carbon|null $date_valid
 * @property int|null $fk_user_valid
 * @property Carbon|null $date_delivery
 * @property Carbon|null $date_reception
 * @property int|null $fk_shipping_method
 * @property string|null $tracking_number
 * @property int|null $fk_statut
 * @property int|null $billed
 * @property float|null $height
 * @property float|null $width
 * @property int|null $size_units
 * @property float|null $size
 * @property int|null $weight_units
 * @property float|null $weight
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property CShipmentMode|null $c_shipment_mode
 * @property Societe $societe
 * @property User|null $user
 * @property Collection|ReceptiondetBatch[] $receptiondet_batches
 */
class Reception extends Model
{
    public $timestamps = false;
    protected $table = 'reception';
    protected $casts = [
        'tms' => 'datetime',
        'entity' => 'int',
        'fk_soc' => 'int',
        'fk_projet' => 'int',
        'date_creation' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'date_valid' => 'datetime',
        'fk_user_valid' => 'int',
        'date_delivery' => 'datetime',
        'date_reception' => 'datetime',
        'fk_shipping_method' => 'int',
        'fk_statut' => 'int',
        'billed' => 'int',
        'height' => 'float',
        'width' => 'float',
        'size_units' => 'int',
        'size' => 'float',
        'weight_units' => 'int',
        'weight' => 'float',
        'fk_incoterms' => 'int'
    ];

    protected $fillable = [
        'tms',
        'ref',
        'entity',
        'fk_soc',
        'fk_projet',
        'ref_ext',
        'ref_supplier',
        'date_creation',
        'fk_user_author',
        'fk_user_modif',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'date_reception',
        'fk_shipping_method',
        'tracking_number',
        'fk_statut',
        'billed',
        'height',
        'width',
        'size_units',
        'size',
        'weight_units',
        'weight',
        'note_private',
        'note_public',
        'model_pdf',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams'
    ];

    public function c_shipment_mode()
    {
        return $this->belongsTo(CShipmentMode::class, 'fk_shipping_method');
    }

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_valid');
    }

    public function receptiondet_batches()
    {
        return $this->hasMany(ReceptiondetBatch::class, 'fk_reception');
    }
}
