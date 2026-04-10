<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MrpMo
 * Represents table mrp_mo (Órdenes de fabricación)
 * Dolibarr: htdocs/mrp/class/mo.class.php
 */
class MrpMo extends Model
{
    protected $table = 'mrp_mo';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'label',
        'fk_project',
        'fk_bom',
        'fk_product',
        'qty',
        'date_start_planned',
        'date_end_planned',
        'date_start_real',
        'date_end_real',
        'fk_warehouse',
        'fk_soc',
        'status',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'datec',
        'tms',
        'note_public',
        'note_private',
        'model_pdf',
        'import_key',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'fk_product', 'rowid');
    }

    public function bom()
    {
        return $this->belongsTo(Bom::class, 'fk_bom', 'rowid');
    }

    public function lines()
    {
        return $this->hasMany(MrpProduction::class, 'fk_mo', 'rowid');
    }
}
