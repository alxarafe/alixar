<?php

/* Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * Simple autoloader, so we don't need Composer just for this.
 *
 * @phan-file-suppress PhanTypeMismatchArgumentInternal
 */

spl_autoload_register(
/**
 * @param string $class Class to load
 * @return bool             If class could be loaded
 */
    static function ($class) {
        if (str_starts_with($class, 'DebugBar')) {
            $file = DOL_DOCUMENT_ROOT . '/includes/maximebf/debugbar/src/' . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';
            //var_dump($class.' - '.file_exists($file).' - '.$file);
            if (file_exists($file)) {
                require_once $file;
                return true;
            }
            return false;
        }
        if (preg_match('/^' . preg_quote('Psr\Log', '/') . '/', $class)) {
            $file = DOL_DOCUMENT_ROOT . '/includes/' . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';
            //var_dump($class.' - '.file_exists($file).' - '.$file);
            if (file_exists($file)) {
                require_once $file;
                return true;
            }
            return false;
        }
        if (preg_match('/^' . preg_quote('Symfony\Component\VarDumper', '/') . '/', $class)) {
            $class = preg_replace('/' . preg_quote('Symfony\Component\VarDumper', '/') . '/', '', $class);
            $file = DOL_DOCUMENT_ROOT . '/includes/symfony/var-dumper/' . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';
            if (file_exists($file)) {
                require_once $file;
                return true;
            }
            return false;
        }
        return true;
    }
);
