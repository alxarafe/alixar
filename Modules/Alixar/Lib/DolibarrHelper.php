<?php

namespace Modules\Alixar\Lib;

use Alxarafe\Tools\Debug;

/**
 * Class DolibarrHelper
 * Helper to interact with Dolibarr installation and analyze its modules.
 */
class DolibarrHelper
{
    /**
     * Path to the Dolibarr installation (parent of htdocs).
     */
    public static function getDolibarrPath(): string
    {
        return realpath(constant('APP_PATH') . '/../dolibarr/') ?: '';
    }

    /**
     * Scans Dolibarr htdocs/core/modules/ for all module classes.
     * 
     * @return array
     */
    public static function listModules(): array
    {
        $modulesPath = self::getDolibarrPath() . '/htdocs/core/modules/';
        $files = glob($modulesPath . 'mod*.class.php');
        $modules = [];

        foreach ($files as $file) {
            $content = file_get_contents($file);

            // Extract core properties from class code using regex
            // This is efficient and avoids including 6000 PHP files
            $name = '';
            if (preg_match("/class\s+(mod[a-zA-Z0-9_]+)/i", $content, $matches)) {
                $name = str_replace('mod', '', $matches[1]);
            }

            $description = '';
            if (preg_match('/this->description\s*=\s*[\'"]([^\'"]+)[\'"]/i', $content, $matches)) {
                $description = $matches[1];
            }

            $family = 'other';
            if (preg_match('/this->family\s*=\s*[\'"]([^\'"]+)[\'"]/i', $content, $matches)) {
                $family = $matches[1];
            }

            $order = 999;
            if (preg_match('/this->numero\s*=\s*(\d+)/i', $content, $matches)) {
                $order = (int)$matches[1];
            }

            if ($name) {
                $modules[$name] = [
                    'name' => $name,
                    'const_name' => 'MAIN_MODULE_' . strtoupper($name),
                    'description' => $description,
                    'family' => $family,
                    'order' => $order,
                    'file' => $file
                ];
            }
        }

        // Sort by order
        uasort($modules, fn($a, $b) => $a['order'] <=> $b['order']);

        return $modules;
    }

    /**
     * Extracts permissions from a module file.
     * 
     * @param string $filePath
     * @return array
     */
    public static function extractPermissions(string $filePath): array
    {
        $content = file_get_contents($filePath);
        $permissions = [];

        // Match $this->rights[] assignments
        // Example: $this->rights[$r][2] = 'read contact';
        // This is complex for regex, better do a simplified scan for now or skip until needed.
        return $permissions;
    }
}
