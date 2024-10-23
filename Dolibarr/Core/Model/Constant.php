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
        global $conf, $user;

        $query = Constant::select('rowid')
            ->selectRaw(static::decrypt('name') . ' AS name')
            ->selectRaw(static::decrypt('value') . ' AS value')
            ->addSelect('type', 'note', 'entity');

        if (isModEnabled('multicompany')) {
            if ($user->entity) {
                $query->whereIn('entity', explode(',', $user->entity . ',' . $conf->entity));
            }
        } else {
            $query->whereIn('entity', [0, $conf->entity]);
        }

        $query->orderBy('entity')
            ->orderBy('name', 'ASC');

        return $query->get();
    }

    public static function selectByName($name, $entity = null)
    {
        $query = Constant::where('name', static::decrypt($name));
        if ($query === null) {
            return null;
        }
        if (isset($entity)) {
            $query->whereIn('entity', [0, $entity]);
        }
        return $query->get();
    }

    public static function getByName($name, $entity = null)
    {
        $query = Constant::where('name', static::decrypt($name));
        if ($query === null) {
            return null;
        }
        if (isset($entity)) {
            $query->whereIn('entity', [0, $entity]);
        }
        return $query->first();
    }

    /**
     * Returns the highest name starting with $value
     *
     * TODO: I suspect that Dolibarr does not work properly with field encryption enabled.
     *
     * @param $value
     * @return null
     */
    public static function getMaxNameLike(string $value)
    {
        $query = Constant::where('name', 'like', $value . '%')
            ->max('name');

        if (!isset($query)) {
            return null;
        }

        return $query;
    }

    public static function insert(string $name, string $value, string $type, string $note, int $visible = 0, int $entity = 0): bool
    {
        return Constant::create([
            'name' => static::encrypt($name),
            'value' => static::encrypt($value),
            'type' => static::encrypt($type),
            'visible' => $visible,
            'note' => $note,
            'entity' => $entity
        ]);
    }

    public static function deleteByName(string $name, ?int $entity = null): ?bool
    {
        $query = Constant::where('name', static::decrypt($name));
        if ($query === null) {
            return null;
        }
        if (isset($entity)) {
            $query->whereIn('entity', [0, $entity]);
        }
        return $query
            ->delete();
    }

    public static function selectByNameAndSuffix(string $name_like, string $suffix, ?int $entity = null)
    {
        $query = Constant::where('name', 'like', $name_like . '_%_' . strtoupper($suffix));
        if ($query === null) {
            return null;
        }
        if (isset($entity)) {
            $query->where('entity', $entity);
        }
        return $query
            ->get(['name', 'entity', 'value']);  // Return only the columns 'name', 'entity' y 'value'.
    }

    public static function deleteByNameLike(string $name_like, ?int $entity = null): ?bool
    {
        $query = Constant::where('name', 'like', $name_like . '%');
        if ($query === null) {
            return null;
        }
        if (isset($entity)) {
            $query->where('entity', $entity);
        }
        return $query
            ->delete();
    }

    public static function updateByName(string $name, array $values): bool
    {
        $encrypted_fields = ['name', 'value', 'type'];
        foreach ($encrypted_fields as $field) {
            if (isset($values[$field])) {
                $values[$field] = static::encrypt($values[$field]);
            }
        }

        return Constant::where('name', static::encrypt($name))
            ->update($values);
    }

    public static function updateValueByName(string $name, string $value): bool
    {
        return Constant::where('name', static::encrypt($name))
            ->update(['value', static::encrypt($value)]);
    }

    public static function isActivated(string $name, int $entity = 0): ?bool
    {
        $result = Constant::selectRaw(static::decrypt('name') . ' AS value')
            ->where('name', static::encrypt($name))
            ->whereIn('entity', [0, $entity]);
        if ($result === null) {
            return null;
        }
        return !empty($result->first());
    }

    public static function getAllModulesConstants()
    {
        return Constant::where('name', 'LIKE', 'MAIN_MODULE_%_TPL')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_CSS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_JS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_HOOKS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_TRIGGERS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_THEME')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_SUBSTITUTIONS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_MODELS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_MENUS')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_LOGIN')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_BARCODE')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_TABS_%')
            ->orWhere('name', 'LIKE', 'MAIN_MODULE_%_MODULEFOREXTERNAL')
            ->orderBy('name')
            ->orderBy('entity')
            ->get(['name', 'entity', 'value']);  // Return only the columns 'name', 'entity' y 'value'.
    }
}
