<?php
/* Copyright (C) 2019       Alxarafe                    <info@alxarafe.com>
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
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
namespace Alixar\Controllers;

use Alxarafe\Helpers\Skin;
use Alxarafe\Helpers\Schema;
use Alixar\Base\AlixarController;
use Alixar\Views\IndexView;

/**
 * This class contains the methods and attributes specific to the index
 * controller (before home)
 *
 * @author Alxarafe
 */
class Index extends AlixarController
{

    public function __construct()
    {
        Skin::$view = new IndexView($this);
        parent::__construct();
    }

    public function main()
    {
        echo "Nothing to do!";
    }

    public function dashboard()
    {

    }

    public function database()
    {
        Schema::saveStructure();
    }
}
