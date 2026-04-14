<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

abstract class AbstractLegacyMapper
{
    /**
     * Define the mapping from legacy keys to native keys.
     * Example:
     * [
     *     'rowid'          => 'id',
     *     'fk_user_author' => 'userId',
     *     'date_debut'     => ['target' => 'dateStart', 'cast' => 'timestamp_to_date']
     * ]
     *
     * @var array<string, string|array{target: string, cast: string}>
     */
    protected array $mapping = [];

    /**
     * Translates a legacy JSON payload from Dolibarr format to the native Alixar domain format.
     */
    public function toNative(array $legacyPayload): array
    {
        $nativePayload = [];

        foreach ($legacyPayload as $legacyKey => $legacyValue) {
            if (isset($this->mapping[$legacyKey])) {
                $mappingDef = $this->mapping[$legacyKey];
                
                if (is_string($mappingDef)) {
                    $nativePayload[$mappingDef] = $legacyValue;
                } elseif (is_array($mappingDef)) {
                    $nativePayload[$mappingDef['target']] = $this->castToNative($legacyValue, $mappingDef['cast']);
                }
            } else {
                // By default keep the key but ideally standard mappings handle everything necessary.
                $nativePayload[$legacyKey] = $legacyValue;
            }
        }

        return $nativePayload;
    }

    /**
     * Translates a native Alixar entity array to the legacy Dolibarr schema format.
     */
    public function toLegacy(array $nativePayload): array
    {
        $legacyPayload = [];
        
        // Build reverse map
        $reverseMapping = [];
        foreach ($this->mapping as $legacyK => $def) {
            if (is_string($def)) {
                $reverseMapping[$def] = $legacyK;
            } elseif (is_array($def)) {
                $reverseMapping[$def['target']] = ['target' => $legacyK, 'cast' => $def['cast']];
            }
        }

        foreach ($nativePayload as $nativeKey => $nativeValue) {
            if (isset($reverseMapping[$nativeKey])) {
                $mappingDef = $reverseMapping[$nativeKey];

                if (is_string($mappingDef)) {
                    $legacyPayload[$mappingDef] = $nativeValue;
                } elseif (is_array($mappingDef)) {
                    $legacyPayload[$mappingDef['target']] = $this->castToLegacy($nativeValue, $mappingDef['cast']);
                }
            } else {
                $legacyPayload[$nativeKey] = $nativeValue;
            }
        }

        return $legacyPayload;
    }

    protected function castToNative(mixed $value, string $cast): mixed
    {
        if ($value === null) return null;
        
        switch ($cast) {
            case 'timestamp_to_date':
                return date('Y-m-d H:i:s', (int)$value);
            case 'int':
                return (int)$value;
            case 'float':
                return (float)$value;
            default:
                return $value;
        }
    }

    protected function castToLegacy(mixed $value, string $cast): mixed
    {
        if ($value === null) return null;
        
        switch ($cast) {
            case 'timestamp_to_date':
                return strtotime((string)$value);
            case 'int':
                return (string)$value; // legacy often returns ids as strings
            case 'float':
                return (string)$value; // legacy often returns floats as strings
            default:
                return $value;
        }
    }
}
