<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Expedition
 * Represents table expedition (Envíos / expediciones)
 * Dolibarr: htdocs/expedition/class/expedition.class.php
 */
class Expedition extends Model
{
    protected $table = 'expedition';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'ref_customer',
        'datec',
        'tms',
        'date_delivery',
        'date_expedition',
        'fk_soc',
        'fk_projet',
        'fk_address',
        'fk_shipping_method',
        'tracking_number',
        'tracking_url',
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
        'last_main_doc',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'import_key',
    ];

    public function thirdParty()
    {
        return $this->belongsTo(ThirdParty::class, 'fk_soc', 'rowid');
    }

    public function lines()
    {
        return $this->hasMany(ExpeditionDetail::class, 'fk_expedition', 'rowid');
    }
}
