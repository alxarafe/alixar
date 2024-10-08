<?php

/* Copyright (C) 2020       Laurent Destailleur         <eldy@users.sourceforge.net>
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

use Dolibarr\Code\Core\Classes\ExtraFields;
use Dolibarr\Code\Core\Classes\Form;

/**
 *      \file       htdocs/recruitment/admin/candidature_extrafields.php
 *      \ingroup    recruitment
 *      \brief      Page to setup extra fields of Candidature
 */

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';
require_once constant('DOL_DOCUMENT_ROOT') . '/recruitment/lib/recruitment.lib.php';

// Load translation files required by the page
$langs->loadLangs(array('recruitment', 'admin'));

$extrafields = new ExtraFields($db);
$form = new Form($db);

// List of supported format
$type2label = ExtraFields::getListOfTypesLabels();

$action = GETPOST('action', 'aZ09');
$attrname = GETPOST('attrname', 'alpha');
$elementtype = 'recruitment_recruitmentcandidature';

if (!$user->admin) {
    accessforbidden();
}

/*
 * Actions
 */

require DOL_DOCUMENT_ROOT . '/core/actions_extrafields.inc.php';

/*
 * View
 */

$textobject = $langs->transnoentitiesnoconv("Candidature");

$help_url = '';
llxHeader('', $langs->trans("RecruitmentSetup"), $help_url);


$linkback = '<a href="' . constant('BASE_URL') . '/admin/modules.php?restore_lastsearch_values=1">' . $langs->trans("BackToModuleList") . '</a>';
print load_fiche_titre($langs->trans("RecruitmentSetup"), $linkback, 'title_setup');


$head = recruitmentAdminPrepareHead();

print dol_get_fiche_head($head, 'candidature_extrafields', '', -1, '');

require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_view.tpl.php';

print dol_get_fiche_end();


/*
 * Creation of an optional field
 */
if ($action == 'create') {
    print '<br><div id="newattrib"></div>';
    print load_fiche_titre($langs->trans('NewAttribute'));

    require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_add.tpl.php';
}

/*
 * Edition of an optional field
 */
if ($action == 'edit' && !empty($attrname)) {
    print "<br>";
    print load_fiche_titre($langs->trans("FieldEdition", $attrname));

    require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_edit.tpl.php';
}

// End of page
llxFooter();
$db->close();
