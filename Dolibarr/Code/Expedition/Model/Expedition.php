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

namespace Dolibarr\Code\Expedition\Model;

use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CShipmentMode;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Expedition
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property string $ref
 * @property int $entity
 * @property int $fk_soc
 * @property int|null $fk_projet
 * @property string|null $ref_ext
 * @property string|null $ref_customer
 * @property Carbon|null $date_creation
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property Carbon|null $date_valid
 * @property int|null $fk_user_valid
 * @property Carbon|null $date_delivery
 * @property Carbon|null $date_expedition
 * @property int|null $fk_address
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
 * @property int|null $signed_status
 * @property string|null $online_sign_ip
 * @property string|null $online_sign_name
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property CShipmentMode|null $c_shipment_mode
 * @property Societe $societe
 * @property User|null $user
 * @property Collection|Expeditiondet[] $expeditiondets
 */
class Expedition extends Model
{
    public $timestamps = false;
    protected $table = 'expedition';
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
        'date_expedition' => 'datetime',
        'fk_address' => 'int',
        'fk_shipping_method' => 'int',
        'fk_statut' => 'int',
        'billed' => 'int',
        'height' => 'float',
        'width' => 'float',
        'size_units' => 'int',
        'size' => 'float',
        'weight_units' => 'int',
        'weight' => 'float',
        'signed_status' => 'int',
        'fk_incoterms' => 'int'
    ];

    protected $fillable = [
        'tms',
        'ref',
        'entity',
        'fk_soc',
        'fk_projet',
        'ref_ext',
        'ref_customer',
        'date_creation',
        'fk_user_author',
        'fk_user_modif',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'date_expedition',
        'fk_address',
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
        'signed_status',
        'online_sign_ip',
        'online_sign_name',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
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

    public function expeditiondets()
    {
        return $this->hasMany(Expeditiondet::class, 'fk_expedition');
    }
}
