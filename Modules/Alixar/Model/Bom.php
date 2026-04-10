<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Bom
 * Represents table bom_bom (Listas de materiales)
 * Dolibarr: htdocs/bom/class/bom.class.php
 */
class Bom extends Model
{
    protected $table = 'bom_bom';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'label',
        'fk_product',
        'description',
        'qty',
        'duration',
        'fk_warehouse',
        'bomtype',
        'status',
        'fk_user_creat',
        'fk_user_modif',
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

    public function lines()
    {
        return $this->hasMany(BomLine::class, 'fk_bom', 'rowid');
    }
}
