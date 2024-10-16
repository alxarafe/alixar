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

namespace Dolibarr\Code\Societe\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class SocieteRib
 *
 * @property int $rowid
 * @property string $type
 * @property string|null $label
 * @property int $fk_soc
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string|null $bank
 * @property string|null $code_banque
 * @property string|null $code_guichet
 * @property string|null $number
 * @property string|null $cle_rib
 * @property string|null $bic
 * @property string|null $bic_intermediate
 * @property string|null $iban_prefix
 * @property string|null $domiciliation
 * @property string|null $proprio
 * @property string|null $owner_address
 * @property int $default_rib
 * @property int|null $state_id
 * @property int|null $fk_country
 * @property string|null $currency_code
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property string|null $rum
 * @property Carbon|null $date_rum
 * @property string|null $frstrecur
 * @property string|null $last_four
 * @property string|null $card_type
 * @property string|null $cvn
 * @property int|null $exp_date_month
 * @property int|null $exp_date_year
 * @property string|null $country_code
 * @property int|null $approved
 * @property string|null $email
 * @property Carbon|null $ending_date
 * @property float|null $max_total_amount_of_all_payments
 * @property string|null $preapproval_key
 * @property Carbon|null $starting_date
 * @property float|null $total_amount_of_all_payments
 * @property string|null $stripe_card_ref
 * @property string|null $stripe_account
 * @property string|null $ext_payment_site
 * @property string|null $extraparams
 * @property Carbon|null $date_signature
 * @property string|null $online_sign_ip
 * @property string|null $online_sign_name
 * @property string|null $comment
 * @property string|null $ipaddress
 * @property int $status
 * @property string|null $import_key
 *
 * @property Societe $societe
 */
class SocieteRib extends Model
{
    public $timestamps = false;
    protected $table = 'societe_rib';
    protected $casts = [
        'fk_soc' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'default_rib' => 'int',
        'state_id' => 'int',
        'fk_country' => 'int',
        'date_rum' => 'datetime',
        'exp_date_month' => 'int',
        'exp_date_year' => 'int',
        'approved' => 'int',
        'ending_date' => 'datetime',
        'max_total_amount_of_all_payments' => 'float',
        'starting_date' => 'datetime',
        'total_amount_of_all_payments' => 'float',
        'date_signature' => 'datetime',
        'status' => 'int'
    ];

    protected $fillable = [
        'type',
        'label',
        'fk_soc',
        'datec',
        'tms',
        'bank',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'bic',
        'bic_intermediate',
        'iban_prefix',
        'domiciliation',
        'proprio',
        'owner_address',
        'default_rib',
        'state_id',
        'fk_country',
        'currency_code',
        'model_pdf',
        'last_main_doc',
        'rum',
        'date_rum',
        'frstrecur',
        'last_four',
        'card_type',
        'cvn',
        'exp_date_month',
        'exp_date_year',
        'country_code',
        'approved',
        'email',
        'ending_date',
        'max_total_amount_of_all_payments',
        'preapproval_key',
        'starting_date',
        'total_amount_of_all_payments',
        'stripe_card_ref',
        'stripe_account',
        'ext_payment_site',
        'extraparams',
        'date_signature',
        'online_sign_ip',
        'online_sign_name',
        'comment',
        'ipaddress',
        'status',
        'import_key'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }
}
