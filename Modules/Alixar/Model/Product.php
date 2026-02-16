<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Product
 * Represents a Product or Service in Alixar/Dolibarr.
 *
 * @package Modules\Alixar\Model
 */
class Product extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'product';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'rowid';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ref',
        'label',
        'description',
        'note_public',
        'note',
        'price',
        'price_ttc',
        'price_min',
        'price_base_type',
        'tva_tx',
        'tosell',
        'tobuy',
        'fk_product_type',
        'barcode',
        'seuil_stock_alerte',
    ];

    /**
     * Boot function to handle common defaults.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->datec)) {
                $model->datec = date('Y-m-d H:i:s');
            }
            if (!isset($model->entity)) {
                $model->entity = 1;
            }
        });
    }

    /**
     * Scopes for common queries.
     */

    public function scopeToSell($query)
    {
        return $query->where('tosell', 1);
    }

    public function scopeToBuy($query)
    {
        return $query->where('tobuy', 1);
    }

    public function scopeIsService($query)
    {
        return $query->where('fk_product_type', 1);
    }

    public function scopeIsProduct($query)
    {
        return $query->where('fk_product_type', 0);
    }
}
