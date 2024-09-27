<?php

/* Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
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

namespace Module\Test\Controller;

use Dolibarr\Core\Base\DolibarrGenericController;

/**
 * Example controller for a module. Examples of calls:
 *
 *  - index.php?module=Test&controller=Test
 *  - index.php?module=Test&controller=Test&action=testing
 *
 * Explanation of GET variables:
 *
 *  - The module name is assigned in the GET variable 'module'
 *  - The controller name is assigned to the GET variable 'controller'.
 *    The file will have the assigned name followed by 'Controller'.
 *    For example, for controller=Test, the file TestController.php will
 *    be searched in the Test/Controller (module=Test) folder.
 *  - The GET variable 'action' allows to specify the name of an action
 *    to be executed. In that case, the do<ActionName>() method will be
 *    executed.
 */
class TestController extends DolibarrGenericController
{
    /**
     * If no action is specified, the doIndex() method is executed.
     *
     * @return bool
     */
    public function doIndex(): bool
    {
        echo "No action defined";
        return true;
    }

    /**
     * Executes 'testing' action.
     *
     * @return bool
     */
    public function doTesting(): bool
    {
        echo "Action is testing!";
        return true;
    }
}
