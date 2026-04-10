<?php

namespace App\Application\Configuration;

/**
 * Interface ConfigurationPort
 * Provides access to Dolibarr global constants (llx_const).
 */
interface ConfigurationPort
{
    /**
     * Get a string value for a given key.
     */
    public function get(string $key, ?string $default = null): ?string;

    /**
     * Get a boolean value for a given key.
     */
    public function getBool(string $key, bool $default = false): bool;
}
