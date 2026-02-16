<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Societe
 * Represents a Third Party (Customer, Vendor, etc.) in Alixar/Dolibarr.
 *
 * @package Modules\Alixar\Model
 */
class Societe extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'societe';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'rowid';

    /**
     * Indicates if the model should be timestamped.
     * Dolibarr uses 'tms' for updates and 'datec' for creation.
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
        'nom',
        'name_alias',
        'entity',
        'ref_ext',
        'statut',
        'parent',
        'status',
        'code_client',
        'code_fournisseur',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'phone',
        'phone_mobile',
        'fax',
        'url',
        'email',
        'client',
        'fournisseur',
        'tva_intra',
        'note_private',
        'note_public',
        'datec',
        'fk_user_creat',
        'fk_user_modif',
    ];

    /**
     * Boot function to handle creation dates if needed.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->datec)) {
                $model->datec = date('Y-m-d H:i:s');
            }
            if (empty($model->entity)) {
                $model->entity = 1;
            }
        });
    }

    /**
     * Scopes for common queries.
     */

    public function scopeIsClient($query)
    {
        return $query->where('client', '>', 0);
    }

    public function scopeIsSupplier($query)
    {
        return $query->where('fournisseur', '>', 0);
    }
}
