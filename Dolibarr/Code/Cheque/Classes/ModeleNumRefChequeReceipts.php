<?php

/* Copyright (C) 2003-2005  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2009  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Eric Seigne                 <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2009  Regis Houssin               <regis.houssin@inodbox.com>
 * Copyright (C) 2016       Juanjo Menent		        <jmenent@2byte.es>
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

namespace Dolibarr\Code\Cheque\Classes;

use Dolibarr\Code\Core\Classes\CommonNumRefGenerator;

/**
 *  \file       htdocs/core/modules/cheque/modules_chequereceipts.php
 *  \ingroup    invoice
 *  \brief      File with parent class of check receipt document generators
 */

/**
 *  Class parent for cheque Receipts numbering references mother class
 */
abstract class ModeleNumRefChequeReceipts extends CommonNumRefGenerator
{
    // No overload code
}

/**
 *  Cree un bordereau remise de cheque
 *
 * @param DoliDB $db Database handler
 * @param int $id Object invoice (or id of invoice)
 * @param string $message Message
 * @param string $modele Force le modele a utiliser ('' to not force)
 * @param Translate $outputlangs Object lang a utiliser pour traduction
 * @return int                         Return integer <0 if KO, >0 if OK
 *  TODO Use commonDocGenerator
 */
function chequereceipt_pdf_create($db, $id, $message, $modele, $outputlangs)
{
    global $conf, $langs;
    $langs->load("bills");

    $dir = DOL_DOCUMENT_ROOT . "/core/modules/cheque/doc/";

    // Positionne modele sur le nom du modele a utiliser
    if (!dol_strlen($modele)) {
        if (getDolGlobalString('CHEQUERECEIPT_ADDON_PDF')) {
            $modele = getDolGlobalString('CHEQUERECEIPT_ADDON_PDF');
        } else {
            //print $langs->trans("Error")." ".$langs->trans("Error_FACTURE_ADDON_PDF_NotDefined");
            //return 0;
            $modele = 'blochet';
        }
    }

    // Charge le modele
    $file = "pdf_" . $modele . ".modules.php";
    if (file_exists($dir . $file)) {
        $classname = "pdf_" . $modele;
        require_once $dir . $file;

        $obj = new $classname($db);

        // We save charset_output to restore it because write_file can change it if needed for
        // output format that does not support UTF8.
        $sav_charset_output = $outputlangs->charset_output;
        if ($obj->write_file($id, $outputlangs) > 0) {
            $outputlangs->charset_output = $sav_charset_output;
            return 1;
        } else {
            $outputlangs->charset_output = $sav_charset_output;
            dol_print_error($db, "chequereceipt_pdf_create Error: " . $obj->error);
            return -1;
        }
    } else {
        dol_print_error(null, $langs->trans("Error") . " " . $langs->trans("ErrorFileDoesNotExists", $dir . $file));
        return -1;
    }
}