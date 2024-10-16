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

namespace Dolibarr\Code\Ticket\Model;

use Carbon\Carbon;
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CBarcodeType;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Ticket
 *
 * @property int $rowid
 * @property int|null $entity
 * @property string $ref
 * @property string $track_id
 * @property int|null $fk_soc
 * @property int|null $fk_project
 * @property int|null $fk_contract
 * @property string|null $origin_email
 * @property string|null $origin_replyto
 * @property string|null $origin_references
 * @property int|null $fk_user_create
 * @property int|null $fk_user_assign
 * @property string|null $subject
 * @property string|null $message
 * @property int|null $fk_statut
 * @property int|null $resolution
 * @property int|null $progress
 * @property string|null $timing
 * @property string|null $type_code
 * @property string|null $category_code
 * @property string|null $severity_code
 * @property Carbon|null $datec
 * @property Carbon|null $date_read
 * @property Carbon|null $date_last_msg_sent
 * @property Carbon|null $date_close
 * @property int|null $notify_tiers_at_create
 * @property string|null $email_msgid
 * @property Carbon|null $email_date
 * @property string|null $ip
 * @property Carbon|null $tms
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property string|null $extraparams
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property string|null $import_key
 *
 * @property CBarcodeType|null $c_barcode_type
 * @property Collection|Categorie[] $categories
 */
class Ticket extends Model
{
    public $timestamps = false;
    protected $table = 'ticket';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'fk_project' => 'int',
        'fk_contract' => 'int',
        'fk_user_create' => 'int',
        'fk_user_assign' => 'int',
        'fk_statut' => 'int',
        'resolution' => 'int',
        'progress' => 'int',
        'datec' => 'datetime',
        'date_read' => 'datetime',
        'date_last_msg_sent' => 'datetime',
        'date_close' => 'datetime',
        'notify_tiers_at_create' => 'int',
        'email_date' => 'datetime',
        'tms' => 'datetime',
        'fk_barcode_type' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'track_id',
        'fk_soc',
        'fk_project',
        'fk_contract',
        'origin_email',
        'origin_replyto',
        'origin_references',
        'fk_user_create',
        'fk_user_assign',
        'subject',
        'message',
        'fk_statut',
        'resolution',
        'progress',
        'timing',
        'type_code',
        'category_code',
        'severity_code',
        'datec',
        'date_read',
        'date_last_msg_sent',
        'date_close',
        'notify_tiers_at_create',
        'email_msgid',
        'email_date',
        'ip',
        'tms',
        'model_pdf',
        'last_main_doc',
        'extraparams',
        'barcode',
        'fk_barcode_type',
        'import_key'
    ];

    public function c_barcode_type()
    {
        return $this->belongsTo(CBarcodeType::class, 'fk_barcode_type');
    }

    public function categories()
    {
        return $this->belongsToMany(Categorie::class, 'alx_categorie_ticket', 'fk_ticket', 'fk_categorie')
            ->withPivot('import_key');
    }
}
