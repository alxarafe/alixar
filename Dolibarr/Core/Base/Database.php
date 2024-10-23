<?php

/* Copyright (C) 2024      Rafael San José      <rsanjose@alxarafe.com>
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

namespace Dolibarr\Core\Base;

use DebugBar\DebugBarException;
use Illuminate\Database\Capsule\Manager as CapsuleManager;

/**
 * Create a PDO database connection
 *
 * @package Alxarafe\Base
 */
class Database extends CapsuleManager
{
    /**
     * Construct the database access
     */
    public function __construct()
    {
        global $conf, $dolibarr_main_db_pass;

        $db = $conf->db;
        if ($db->type === 'mysqli') {
            $db->type = 'mysql';
        }

        parent::__construct();

        $this->addConnection([
            'driver' => $db->type,
            'host' => $db->host,
            'database' => $db->name,
            'username' => $db->user,
            'password' => $dolibarr_main_db_pass,
            'charset' => $db->charset ?? 'utf8',
            'collation' => $db->collation ?? 'utf8_unicode_ci',
            'prefix' => $db->prefix,
        ]);

        $this->setAsGlobal();
        $this->bootEloquent();
    }

    public static function getPdo()
    {
        $static = new static();
        return $static->getConnection()->getPdo();
    }
}
