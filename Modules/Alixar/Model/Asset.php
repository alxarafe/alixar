<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Asset
 * Represents table asset (Activos fijos / inmovilizado)
 * Dolibarr: htdocs/asset/class/asset.class.php
 */
class Asset extends Model
{
    protected $table = 'asset';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'label',
        'fk_asset_type',
        'amount_ht',
        'amount_vat',
        'fk_soc',
        'acquisition_type',
        'asset_type',
        'date_acquisition',
        'date_start',
        'qty',
        'acquisition_value_ht',
        'recovered_vat',
        'reversal_date',
        'reversal_amount_ht',
        'disposal_date',
        'disposal_amount_ht',
        'disposal_type',
        'disposal_deposited',
        'disposal_subject_to_vat',
        'fk_user_author',
        'fk_user_modif',
        'datec',
        'tms',
        'status',
        'note_public',
        'note_private',
        'import_key',
    ];
}
