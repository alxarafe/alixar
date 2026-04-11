<?php

declare(strict_types=1);

namespace App\Infrastructure;

trait DolibarrMappingTrait
{
    /**
     * Translates a clean domain array to a Dolibarr-compatible array using a map.
     *
     * @param array<string, mixed> $cleanData
     * @param array<string, string> $map Map: ['clean_key' => 'dolibarr_key'].
     * @return array<string, mixed>
     */
    protected function mapToDolibarr(array $cleanData, array $map): array
    {
        $dolibarrData = [];
        foreach ($cleanData as $cleanKey => $value) {
            $dolibarrKey = array_key_exists($cleanKey, $map) ? $map[$cleanKey] : $cleanKey;
            $dolibarrData[$dolibarrKey] = $value;
        }
        // Special case: if there are mapped fields that weren't in $cleanData,
        // we might not want to inject them, so the above simple loop is perfect.
        return $dolibarrData;
    }

    /**
     * Translates a Dolibarr-compatible array back to a clean domain array using a map.
     *
     * @param array<string, mixed> $dolibarrData
     * @param array<string, string> $map Map: ['clean_key' => 'dolibarr_key'].
     * @return array<string, mixed>
     */
    protected function mapToClean(array $dolibarrData, array $map): array
    {
        $cleanData = [];
        $reverseMap = array_flip($map);

        foreach ($dolibarrData as $dolibarrKey => $value) {
            $cleanKey = array_key_exists($dolibarrKey, $reverseMap) ? $reverseMap[$dolibarrKey] : $dolibarrKey;
            $cleanData[$cleanKey] = $value;
        }
        return $cleanData;
    }
}
