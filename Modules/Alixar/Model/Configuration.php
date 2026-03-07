<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Configuration
 * Represents table const
 */
class Configuration extends Model
{
    protected $table = 'const';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'name',
        'entity',
        'value',
        'type',
        'visible',
        'note',
    ];

    /**
     * Get a configuration value by name.
     * 
     * @param string $name
     * @param mixed $default
     * @return mixed
     */
    public static function getValue(string $name, $default = null)
    {
        $row = self::where('name', $name)->first();
        return $row ? $row->value : $default;
    }

    /**
     * Set a configuration value.
     * 
     * @param string $name
     * @param mixed $value
     * @param int $entity
     * @return static
     */
    public static function setValue(string $name, $value, $entity = 1)
    {
        /** @var static $result */
        $result = self::updateOrCreate(
            ['name' => $name, 'entity' => $entity],
            ['value' => (string)$value]
        );
        return $result;
    }
}
