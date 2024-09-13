<?php

/* Copyright (C) 2014       Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2024		Frédéric France			    <frederic.france@free.fr>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
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
 * or see https://www.gnu.org/
 */

namespace Dolibarr\Code\BarCode\Classes;

/**
 *   \file       htdocs/core/modules/barcode/modules_barcode.class.php
 *   \ingroup    barcode
 *   \brief      File with parent classes for barcode document modules and numbering modules
 */

require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions.lib.php';

/**
 *  Parent class for barcode document generators (image)
 */
abstract class ModeleBarCode
{
    /**
     * @var string Error code (or message)
     */
    public $error = '';


    /**
     * Return if a model can be used or not
     *
     * @return      boolean     true if model can be used
     */
    public function isEnabled()
    {
        return true;
    }

    /**
     *  Save an image file on disk (with no output)
     *
     * @param string $code Value to encode
     * @param string $encoding Mode of encoding ('QRCODE', 'EAN13', ...)
     * @param string $readable Code can be read
     * @param integer $scale Scale (not used with this engine)
     * @param integer $nooutputiferror No output if error (not used with this engine)
     * @return    int                            Return integer <0 if KO, >0 if OK
     */
    public function writeBarCode($code, $encoding, $readable = 'Y', $scale = 1, $nooutputiferror = 0)
    {
        return -1;  // Error by default, this method must be implemented by the driver
    }
}
