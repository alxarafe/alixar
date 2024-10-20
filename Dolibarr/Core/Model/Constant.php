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

namespace Dolibarr\Core\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Const
 *
 * @property int $rowid
 * @property string $name
 * @property int $entity
 * @property string $value
 * @property string|null $type
 * @property int $visible
 * @property string|null $note
 * @property Carbon|null $tms
 */
class Constant extends Model
{
    public $timestamps = false;
    protected $table = 'const';
    protected $primaryKey = 'rowid';
    protected $casts = [
        'entity' => 'int',
        'visible' => 'int',
        'tms' => 'datetime'
    ];
    protected $fillable = [
        'name',
        'entity',
        'value',
        'type',
        'visible',
        'note',
        'tms'
    ];

    public static function getConstants()
    {
        global $conf, $user; // Suponiendo que estás usando variables globales

        // Construir la consulta
        $query = Constant::select('rowid')
            ->selectRaw(static::decrypt('name') . ' AS name')
            ->selectRaw(static::decrypt('value') . ' AS value')
            ->addSelect('type', 'note', 'entity');

        // Condiciones basadas en el modo multicompany
        if (!isModEnabled('multicompany')) {
            // Si no está habilitado el modo multicompany
            $query->whereIn('entity', [0, $conf->entity]);
        } else {
            // Si está habilitado el modo multicompany
            if ($user->entity) {
                // Si el usuario tiene una entidad, restringir la consulta
                $query->whereIn('entity', explode(',', $user->entity . ',' . $conf->entity));
            }
        }

        // Ordenar los resultados
        $query->orderBy('entity')
            ->orderBy('name', 'ASC');

        // Obtener los resultados
        return $query->get();
    }
}
