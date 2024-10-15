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

namespace Dolibarr\Code\Don\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Don
 *
 * @property int $rowid
 * @property string|null $ref
 * @property int $entity
 * @property Carbon|null $tms
 * @property int $fk_statut
 * @property Carbon|null $datedon
 * @property float|null $amount
 * @property int|null $fk_payment
 * @property int $paid
 * @property int|null $fk_soc
 * @property string|null $firstname
 * @property string|null $lastname
 * @property string|null $societe
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property string|null $country
 * @property int $fk_country
 * @property string|null $email
 * @property string|null $phone
 * @property string|null $phone_mobile
 * @property int $public
 * @property int|null $fk_projet
 * @property Carbon|null $datec
 * @property int $fk_user_author
 * @property int|null $fk_user_modif
 * @property Carbon|null $date_valid
 * @property int|null $fk_user_valid
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property string|null $import_key
 * @property string|null $extraparams
 */
class Don extends Model
{
    public $timestamps = false;
    protected $table = 'don';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'fk_statut' => 'int',
        'datedon' => 'datetime',
        'amount' => 'float',
        'fk_payment' => 'int',
        'paid' => 'int',
        'fk_soc' => 'int',
        'fk_country' => 'int',
        'public' => 'int',
        'fk_projet' => 'int',
        'datec' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'date_valid' => 'datetime',
        'fk_user_valid' => 'int'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'tms',
        'fk_statut',
        'datedon',
        'amount',
        'fk_payment',
        'paid',
        'fk_soc',
        'firstname',
        'lastname',
        'societe',
        'address',
        'zip',
        'town',
        'country',
        'fk_country',
        'email',
        'phone',
        'phone_mobile',
        'public',
        'fk_projet',
        'datec',
        'fk_user_author',
        'fk_user_modif',
        'date_valid',
        'fk_user_valid',
        'note_private',
        'note_public',
        'model_pdf',
        'import_key',
        'extraparams'
    ];
}
