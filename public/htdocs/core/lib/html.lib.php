<?php

/* Copyright (C) 2000-2007  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2003		Jean-Louis Bergamo			<jlb@j1b.org>
 * Copyright (C) 2004-2022	Laurent Destailleur			<eldy@users.sourceforge.net>
 * Copyright (C) 2004		Sebastien Di Cintio			<sdicintio@ressource-toi.org>
 * Copyright (C) 2004		Benoit Mortier				<benoit.mortier@opensides.be>
 * Copyright (C) 2004		Christophe Combelles		<ccomb@free.fr>
 * Copyright (C) 2005-2019	Regis Houssin				<regis.houssin@inodbox.com>
 * Copyright (C) 2008		Raphael Bertrand (Resultic)	<raphael.bertrand@resultic.fr>
 * Copyright (C) 2010-2018	Juanjo Menent				<jmenent@2byte.es>
 * Copyright (C) 2013		Cédric Salvador				<csalvador@gpcsolutions.fr>
 * Copyright (C) 2013-2021	Alexandre Spangaro			<aspangaro@open-dsi.fr>
 * Copyright (C) 2014		Cédric GROSS				<c.gross@kreiz-it.fr>
 * Copyright (C) 2014-2015	Marcos García				<marcosgdf@gmail.com>
 * Copyright (C) 2015		Jean-François Ferry			<jfefe@aternatik.fr>
 * Copyright (C) 2018-2024  Frédéric France             <frederic.france@free.fr>
 * Copyright (C) 2019-2023  Thibault Foucart            <support@ptibogxiv.net>
 * Copyright (C) 2020       Open-Dsi         			<support@open-dsi.fr>
 * Copyright (C) 2021       Gauthier VERDOL         	<gauthier.verdol@atm-consulting.fr>
 * Copyright (C) 2022       Anthony Berton	         	<anthony.berton@bb2a.fr>
 * Copyright (C) 2022       Ferran Marcet           	<fmarcet@2byte.es>
 * Copyright (C) 2022       Charlene Benke           	<charlene@patas-monkey.com>
 * Copyright (C) 2023       Joachim Kueter              <git-jk@bloxera.com>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024		Lenin Rivas					<lenin.rivas777@gmail.com>
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

/**
 * TODO: Convert to abstract class with static methods
 */

use Dolibarr\Code\Bom\Classes\BOM;
use Dolibarr\Code\Categories\Classes\Categorie;
use Dolibarr\Code\Comm\Classes\ActionComm;
use Dolibarr\Code\Comm\Classes\CActionComm;
use Dolibarr\Code\Contact\Classes\Contact;
use Dolibarr\Code\Core\Classes\Conf;
use Dolibarr\Code\Core\Classes\Form;
use Dolibarr\Code\Core\Classes\FormActions;
use Dolibarr\Code\Core\Classes\HookManager;
use Dolibarr\Code\Core\Classes\Translate;
use Dolibarr\Code\Product\Classes\Product;
use Dolibarr\Code\Societe\Classes\Societe;
use Dolibarr\Code\Ticket\Classes\Ticket;
use Dolibarr\Code\User\Classes\User;
use Dolibarr\Code\Website\Classes\Website;
use Dolibarr\Core\Base\CommonObject;

/**
 * Create a dialog with two buttons for export and overwrite of a website
 *
 * @param string $name Unique identifier for the dialog
 * @param string $label Title of the dialog
 * @param string $buttonstring Text for the button that opens the dialog
 * @param string $exportSiteName Name of the "submit" input for site export
 * @param string $overwriteGitUrl URL for the link that triggers the overwrite action in GIT
 * @param Website $website Website object
 * @return  string                  HTML and JavaScript code for the button and the dialog
 */
function dolButtonToOpenExportDialog($name, $label, $buttonstring, $exportSiteName, $overwriteGitUrl, $website)
{
    global $langs, $db;

    $form = new Form($db);

    $templatenameforexport = $website->name_template;   // Example 'website_template-corporate'
    if (empty($templatenameforexport)) {
        $templatenameforexport = 'website_' . $website->ref;
    }

    $out = '';
    $out .= '<input type="button" class="cursorpointer button bordertransp" id="open-dialog-' . $name . '"  value="' . dol_escape_htmltag($buttonstring) . '"/>';

    // for generate popup
    $out .= '<script nonce="' . getNonce() . '" type="text/javascript">';
    $out .= 'jQuery(document).ready(function () {';
    $out .= '  jQuery("#open-dialog-' . $name . '").click(function () {';
    $out .= '    var dialogHtml = \'';

    $dialogcontent = '      <div id="custom-dialog-' . $name . '">';
    $dialogcontent .= '        <div style="margin-top: 20px;">';
    $dialogcontent .= '          <label for="export-site-' . $name . '"><strong>' . $langs->trans("ExportSiteLabel") . '...</label><br>';
    $dialogcontent .= '          <button class="button smallpaddingimp" id="export-site-' . $name . '">' . dol_escape_htmltag($langs->trans("DownloadZip")) . '</button>';
    $dialogcontent .= '        </div>';
    $dialogcontent .= '        <br>';
    $dialogcontent .= '        <div style="margin-top: 20px;">';
    $dialogcontent .= '          <strong>' . $langs->trans("ExportSiteGitLabel") . ' ' . $form->textwithpicto('', $langs->trans("SourceFiles"), 1, 'help', '', 0, 3, '') . '</strong><br>';
    $dialogcontent .= '     		<form action="' . dol_escape_htmltag($overwriteGitUrl) . '" method="POST">';
    $dialogcontent .= '        		<input type="hidden" name="action" value="overwritesite">';
    $dialogcontent .= '        		<input type="hidden" name="token" value="' . newToken() . '">';
    $dialogcontent .= '          		<input type="text" autofocus name="export_path" id="export-path-' . $name . '" placeholder="' . $langs->trans('ExportPath') . '" style="width:400px " value="' . dol_escape_htmltag($templatenameforexport) . '"/><br>';
    $dialogcontent .= '          		<button type="submit" class="button smallpaddingimp" id="overwrite-git-' . $name . '">' . dol_escape_htmltag($langs->trans("ExportIntoGIT")) . '</button>';
    $dialogcontent .= '      		</form>';
    $dialogcontent .= '        </div>';
    $dialogcontent .= '      </div>';

    $out .= dol_escape_js($dialogcontent);

    $out .= '\';';


    // Add the content of the dialog to the body of the page
    $out .= '    var $dialog = jQuery("#custom-dialog-' . $name . '");';
    $out .= ' if ($dialog.length > 0) {
        $dialog.remove();
    }
    jQuery("body").append(dialogHtml);';

    // Configuration of popup
    $out .= '    jQuery("#custom-dialog-' . $name . '").dialog({';
    $out .= '      autoOpen: false,';
    $out .= '      modal: true,';
    $out .= '      height: 290,';
    $out .= '      width: "40%",';
    $out .= '      title: "' . dol_escape_js($label) . '",';
    $out .= '    });';

    // Simulate a click on the original "submit" input to export the site.
    $out .= '    jQuery("#export-site-' . $name . '").click(function () {';
    $out .= '      console.log("Clic on exportsite.");';
    $out .= '      var target = jQuery("input[name=\'' . dol_escape_js($exportSiteName) . '\']");';
    $out .= '      console.log("element founded:", target.length > 0);';
    $out .= '      if (target.length > 0) { target.click(); }';
    $out .= '      jQuery("#custom-dialog-' . $name . '").dialog("close");';
    $out .= '    });';

    // open popup
    $out .= '    jQuery("#custom-dialog-' . $name . '").dialog("open");';
    $out .= '    return false;';
    $out .= '  });';
    $out .= '});';
    $out .= '</script>';

    return $out;
}

/**
 *  Return HTML code to output a button to open a dialog popup box.
 *  Such buttons must be included inside a HTML form.
 *
 * @param string $name A name for the html component
 * @param string $label Label shown in Popup title top bar
 * @param string $buttonstring button string (HTML text we can click on)
 * @param string $url Relative Url to open. For example '/project/card.php'
 * @param string $disabled Disabled text
 * @param string $morecss More CSS
 * @param string $jsonopen Some JS code to execute on click/open of popup
 * @param string $backtopagejsfields The back to page must be managed using javascript instead of a redirect.
 *                                      Value is 'keyforpopupid:Name_of_html_component_to_set_with id,Name_of_html_component_to_set_with_label'
 * @param string $accesskey A key to use shortcut
 * @return string                      HTML component with button
 */
function dolButtonToOpenUrlInDialogPopup($name, $label, $buttonstring, $url, $disabled = '', $morecss = 'classlink button bordertransp', $jsonopen = '', $backtopagejsfields = '', $accesskey = '')
{
    global $conf;

    if (strpos($url, '?') > 0) {
        $url .= '&dol_hide_topmenu=1&dol_hide_leftmenu=1&dol_openinpopup=' . urlencode($name);
    } else {
        $url .= '?dol_hide_topmenu=1&dol_hide_leftmenu=1&dol_openinpopup=' . urlencode($name);
    }

    $out = '';

    $backtopagejsfieldsid = '';
    $backtopagejsfieldslabel = '';
    if ($backtopagejsfields) {
        $tmpbacktopagejsfields = explode(':', $backtopagejsfields);
        if (empty($tmpbacktopagejsfields[1])) { // If the part 'keyforpopupid:' is missing, we add $name for it.
            $backtopagejsfields = $name . ":" . $backtopagejsfields;
            $tmp2backtopagejsfields = explode(',', $tmpbacktopagejsfields[0]);
        } else {
            $tmp2backtopagejsfields = explode(',', $tmpbacktopagejsfields[1]);
        }
        $backtopagejsfieldsid = empty($tmp2backtopagejsfields[0]) ? '' : $tmp2backtopagejsfields[0];
        $backtopagejsfieldslabel = empty($tmp2backtopagejsfields[1]) ? '' : $tmp2backtopagejsfields[1];
        $url .= '&backtopagejsfields=' . urlencode($backtopagejsfields);
    }

    //print '<input type="submit" class="button bordertransp"'.$disabled.' value="'.dol_escape_htmltag($langs->trans("MediaFiles")).'" name="file_manager">';
    $out .= '<!-- a link for button to open url into a dialog popup with backtopagejsfields = ' . $backtopagejsfields . ' -->';
    $out .= '<a ' . ($accesskey ? ' accesskey="' . $accesskey . '"' : '') . ' class="cursorpointer reposition button_' . $name . ($morecss ? ' ' . $morecss : '') . '"' . $disabled . ' title="' . dol_escape_htmltag($label) . '"';
    if (empty($conf->use_javascript_ajax)) {
        $out .= ' href="' . constant('DOL_URL_ROOT') . $url . '" target="_blank"';
    } elseif ($jsonopen) {
        $out .= ' href="#" onclick="' . $jsonopen . '"';
    } else {
        $out .= ' href="#"';
    }
    $out .= '>' . $buttonstring . '</a>';

    if (!empty($conf->use_javascript_ajax)) {
        // Add code to open url using the popup. Add also hidden field to retrieve the returned variables
        $out .= '<!-- code to open popup and variables to retrieve returned variables -->';
        $out .= '<div id="idfordialog' . $name . '" class="hidden">' . (getDolGlobalInt('MAIN_OPTIMIZEFORTEXTBROWSER') < 2 ? 'div for dialog' : '') . '</div>';
        $out .= '<div id="varforreturndialogid' . $name . '" class="hidden">' . (getDolGlobalInt('MAIN_OPTIMIZEFORTEXTBROWSER') < 2 ? 'div for returned id' : '') . '</div>';
        $out .= '<div id="varforreturndialoglabel' . $name . '" class="hidden">' . (getDolGlobalInt('MAIN_OPTIMIZEFORTEXTBROWSER') < 2 ? 'div for returned label' : '') . '</div>';

        $out .= '<!-- Add js code to open dialog popup on dialog -->';
        $out .= '<script nonce="' . getNonce() . '" type="text/javascript">
					jQuery(document).ready(function () {
						jQuery(".button_' . $name . '").click(function () {
							console.log(\'Open popup with jQuery(...).dialog() on URL ' . dol_escape_js(DOL_URL_ROOT . $url) . '\');
							var $tmpdialog = $(\'#idfordialog' . $name . '\');
							$tmpdialog.html(\'<iframe class="iframedialog" id="iframedialog' . $name . '" style="border: 0px;" src="' . constant('DOL_URL_ROOT') . $url . '" width="100%" height="98%"></iframe>\');
							$tmpdialog.dialog({
								autoOpen: false,
							 	modal: true,
							 	height: (window.innerHeight - 150),
							 	width: \'80%\',
							 	title: \'' . dol_escape_js($label) . '\',
								open: function (event, ui) {
									console.log("open popup name=' . $name . ', backtopagejsfields=' . $backtopagejsfields . '");
	       						},
								close: function (event, ui) {
									var returnedid = jQuery("#varforreturndialogid' . $name . '").text();
									var returnedlabel = jQuery("#varforreturndialoglabel' . $name . '").text();
									console.log("popup has been closed. returnedid (js var defined into parent page)="+returnedid+" returnedlabel="+returnedlabel);
									if (returnedid != "" && returnedid != "div for returned id") {
										jQuery("#' . (empty($backtopagejsfieldsid) ? "none" : $backtopagejsfieldsid) . '").val(returnedid);
									}
									if (returnedlabel != "" && returnedlabel != "div for returned label") {
										jQuery("#' . (empty($backtopagejsfieldslabel) ? "none" : $backtopagejsfieldslabel) . '").val(returnedlabel);
									}
								}
							});

							$tmpdialog.dialog(\'open\');
							return false;
						});
					});
				</script>';
    }
    return $out;
}

/**
 *  Show tabs of a record
 *
 * @param array<int,array<int<0,5>,string>> $links Array of tabs (0=>url, 1=>label, 2=>code, 3=>not used, 4=>text after link, 5=>morecssonlink). Currently initialized by calling a function xxx_admin_prepare_head. Note that label into $links[$i][1] must be already HTML escaped.
 * @param string $active Active tab name
 * @param string $title Title
 * @param int $notab -1 or 0=Add tab header, 1=no tab header (if you set this to 1, using print dol_get_fiche_end() to close tab is not required), -2=Add tab header with no separation under tab (to start a tab just after), -3=-2+'noborderbottom'
 * @param string $picto Add a picto on tab title
 * @param int $pictoisfullpath If 1, image path is a full path. If you set this to 1, you can use url returned by dol_buildpath('/mymodyle/img/myimg.png',1) for $picto.
 * @param string $morehtmlright Add more html content on right of tabs title
 * @param string $morecss More CSS on the link <a>
 * @param int $limittoshow Limit number of tabs to show. Use 0 to use automatic default value.
 * @param string $moretabssuffix A suffix to use when you have several dol_get_fiche_head() in same page
 * @param int $dragdropfile 0 (default) or 1. 1 enable a drop zone for file to be upload, 0 disable it
 * @return string
 */
function dol_get_fiche_head($links = array(), $active = '', $title = '', $notab = 0, $picto = '', $pictoisfullpath = 0, $morehtmlright = '', $morecss = '', $limittoshow = 0, $moretabssuffix = '', $dragdropfile = 0)
{
    global $conf, $langs, $hookmanager;

    // Show title
    $showtitle = 1;
    if (!empty($conf->dol_optimize_smallscreen)) {
        $showtitle = 0;
    }

    $out = "\n" . '<!-- dol_fiche_head - dol_get_fiche_head -->';

    if ((!empty($title) && $showtitle) || $morehtmlright || !empty($links)) {
        $out .= '<div class="tabs' . ($picto ? '' : ' nopaddingleft') . '" data-role="controlgroup" data-type="horizontal">' . "\n";
    }

    // Show right part
    if ($morehtmlright) {
        $out .= '<div class="inline-block floatright tabsElem">' . $morehtmlright . '</div>'; // Output right area first so when space is missing, text is in front of tabs and not under.
    }

    // Show title
    if (!empty($title) && $showtitle && !getDolGlobalString('MAIN_OPTIMIZEFORTEXTBROWSER')) {
        $limittitle = 30;
        $out .= '<a class="tabTitle">';
        if ($picto) {
            $noprefix = $pictoisfullpath;
            if (strpos($picto, 'fontawesome_') !== false) {
                $noprefix = 1;
            }
            $out .= img_picto($title, ($noprefix ? '' : 'object_') . $picto, '', $pictoisfullpath, 0, 0, '', 'imgTabTitle') . ' ';
        }
        $out .= '<span class="tabTitleText">' . dol_escape_htmltag(dol_trunc($title, $limittitle)) . '</span>';
        $out .= '</a>';
    }

    // Show tabs

    // Define max of key (max may be higher than sizeof because of hole due to module disabling some tabs).
    $maxkey = -1;
    if (is_array($links) && !empty($links)) {
        $keys = array_keys($links);
        if (count($keys)) {
            $maxkey = max($keys);
        }
    }

    // Show tabs
    // if =0 we don't use the feature
    if (empty($limittoshow)) {
        $limittoshow = (!getDolGlobalString('MAIN_MAXTABS_IN_CARD') ? 99 : $conf->global->MAIN_MAXTABS_IN_CARD);
    }
    if (!empty($conf->dol_optimize_smallscreen)) {
        $limittoshow = 2;
    }

    $displaytab = 0;
    $nbintab = 0;
    $popuptab = 0;
    $outmore = '';
    for ($i = 0; $i <= $maxkey; $i++) {
        if ((is_numeric($active) && $i == $active) || (!empty($links[$i][2]) && !is_numeric($active) && $active == $links[$i][2])) {
            // If active tab is already present
            if ($i >= $limittoshow) {
                $limittoshow--;
            }
        }
    }

    for ($i = 0; $i <= $maxkey; $i++) {
        if ((is_numeric($active) && $i == $active) || (!empty($links[$i][2]) && !is_numeric($active) && $active == $links[$i][2])) {
            $isactive = true;
        } else {
            $isactive = false;
        }

        if ($i < $limittoshow || $isactive) {
            // Output entry with a visible tab
            $out .= '<div class="inline-block tabsElem' . ($isactive ? ' tabsElemActive' : '') . ((!$isactive && getDolGlobalString('MAIN_HIDE_INACTIVETAB_ON_PRINT')) ? ' hideonprint' : '') . '"><!-- id tab = ' . (empty($links[$i][2]) ? '' : dol_escape_htmltag($links[$i][2])) . ' -->';

            if (isset($links[$i][2]) && $links[$i][2] == 'image') {
                if (!empty($links[$i][0])) {
                    $out .= '<a class="tabimage' . ($morecss ? ' ' . $morecss : '') . '" href="' . $links[$i][0] . '">' . $links[$i][1] . '</a>' . "\n";
                } else {
                    $out .= '<span class="tabspan">' . $links[$i][1] . '</span>' . "\n";
                }
            } elseif (!empty($links[$i][1])) {
                //print "x $i $active ".$links[$i][2]." z";
                $out .= '<div class="tab tab' . ($isactive ? 'active' : 'unactive') . '" style="margin: 0 !important">';
                if (!empty($links[$i][0])) {
                    $titletoshow = preg_replace('/<.*$/', '', $links[$i][1]);
                    $out .= '<a' . (!empty($links[$i][2]) ? ' id="' . $links[$i][2] . '"' : '') . ' class="tab inline-block valignmiddle' . ($morecss ? ' ' . $morecss : '') . (!empty($links[$i][5]) ? ' ' . $links[$i][5] : '') . '" href="' . $links[$i][0] . '" title="' . dol_escape_htmltag($titletoshow) . '">';
                }
                $out .= $links[$i][1];
                if (!empty($links[$i][0])) {
                    $out .= '</a>' . "\n";
                }
                $out .= empty($links[$i][4]) ? '' : $links[$i][4];
                $out .= '</div>';
            }

            $out .= '</div>';
        } else {
            // Add entry into the combo popup with the other tabs
            if (!$popuptab) {
                $popuptab = 1;
                $outmore .= '<div class="popuptabset wordwrap">'; // The css used to hide/show popup
            }
            $outmore .= '<div class="popuptab wordwrap" style="display:inherit;">';
            if (isset($links[$i][2]) && $links[$i][2] == 'image') {
                if (!empty($links[$i][0])) {
                    $outmore .= '<a class="tabimage' . ($morecss ? ' ' . $morecss : '') . '" href="' . $links[$i][0] . '">' . $links[$i][1] . '</a>' . "\n";
                } else {
                    $outmore .= '<span class="tabspan">' . $links[$i][1] . '</span>' . "\n";
                }
            } elseif (!empty($links[$i][1])) {
                $outmore .= '<a' . (!empty($links[$i][2]) ? ' id="' . $links[$i][2] . '"' : '') . ' class="wordwrap inline-block' . ($morecss ? ' ' . $morecss : '') . '" href="' . $links[$i][0] . '">';
                $outmore .= preg_replace('/([a-z])\|([a-z])/i', '\\1 | \\2', $links[$i][1]); // Replace x|y with x | y to allow wrap on long composed texts.
                $outmore .= '</a>' . "\n";
            }
            $outmore .= '</div>';

            $nbintab++;
        }
        $displaytab = $i;
    }
    if ($popuptab) {
        $outmore .= '</div>';
    }

    if ($popuptab) {    // If there is some tabs not shown
        $left = ($langs->trans("DIRECTION") == 'rtl' ? 'right' : 'left');
        $right = ($langs->trans("DIRECTION") == 'rtl' ? 'left' : 'right');
        $widthofpopup = 200;

        $tabsname = $moretabssuffix;
        if (empty($tabsname)) {
            $tabsname = str_replace("@", "", $picto);
        }
        $out .= '<div id="moretabs' . $tabsname . '" class="inline-block tabsElem valignmiddle">';
        if (getDolGlobalInt('MAIN_OPTIMIZEFORTEXTBROWSER') < 2) {
            $out .= '<div class="tab valignmiddle"><a href="#" class="tab moretab inline-block tabunactive valignmiddle"><span class="hideonsmartphone">' . $langs->trans("More") . '</span>... (' . $nbintab . ')</a></div>'; // Do not use "reposition" class in the "More".
        }
        $out .= '<div id="moretabsList' . $tabsname . '" style="width: ' . $widthofpopup . 'px; position: absolute; ' . $left . ': -999em; text-align: ' . $left . '; margin:0px; padding:2px; z-index:10;">';
        $out .= $outmore;
        $out .= '</div>';
        $out .= '<div></div>';
        $out .= "</div>\n";

        $out .= '<script nonce="' . getNonce() . '">';
        $out .= "$('#moretabs" . $tabsname . "').mouseenter( function() {
			var x = this.offsetLeft, y = this.offsetTop;
			console.log('mouseenter " . $left . " x='+x+' y='+y+' window.innerWidth='+window.innerWidth);
			if ((window.innerWidth - x) < " . ($widthofpopup + 10) . ") {
				$('#moretabsList" . $tabsname . "').css('" . $right . "','8px');
			}
			$('#moretabsList" . $tabsname . "').css('" . $left . "','auto');
			});
		";
        $out .= "$('#moretabs" . $tabsname . "').mouseleave( function() { console.log('mouseleave " . $left . "'); $('#moretabsList" . $tabsname . "').css('" . $left . "','-999em');});";
        $out .= "</script>";
    }

    if ((!empty($title) && $showtitle) || $morehtmlright || !empty($links)) {
        $out .= "</div>\n";
    }

    if (!$notab || $notab == -1 || $notab == -2 || $notab == -3) {
        $out .= "\n" . '<div id="dragDropAreaTabBar" class="tabBar' . ($notab == -1 ? '' : ($notab == -2 ? ' tabBarNoTop' : (($notab == -3 ? ' noborderbottom' : '') . ' tabBarWithBottom')));
        $out .= '">' . "\n";
    }
    if (!empty($dragdropfile)) {
        include_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
        $out .= dragAndDropFileUpload("dragDropAreaTabBar");
    }
    $parameters = array('tabname' => $active, 'out' => $out);
    $reshook = $hookmanager->executeHooks('printTabsHead', $parameters); // This hook usage is called just before output the head of tabs. Take also a look at "completeTabsHead"
    if ($reshook > 0) {
        $out = $hookmanager->resPrint;
    }

    return $out;
}

/**
 *  Show tab footer of a card.
 *  Note: $object->next_prev_filter can be set to restrict select to find next or previous record by $form->showrefnav.
 *
 * @param CommonObject $object Object to show
 * @param string $paramid Name of parameter to use to name the id into the URL next/previous link
 * @param string $morehtml More html content to output just before the nav bar
 * @param int $shownav Show Condition (navigation is shown if value is 1)
 * @param string $fieldid Name of the field in DB to use to select next et previous (we make the select max and min on this field). Use 'none' for no prev/next search.
 * @param string $fieldref Name of the field (object->ref) to use to select next et previous
 * @param string $morehtmlref More html to show after the ref (see $morehtmlleft for before)
 * @param string $moreparam More param to add in nav link url.
 * @param int $nodbprefix Do not include DB prefix to forge table name
 * @param string $morehtmlleft More html code to show before the ref (see $morehtmlref for after)
 * @param string $morehtmlstatus More html code to show under navigation arrows
 * @param int $onlybanner Put this to 1, if the card will contains only a banner (this add css 'arearefnobottom' on div)
 * @param string $morehtmlright More html code to show before navigation arrows
 * @return void
 */
function dol_banner_tab($object, $paramid, $morehtml = '', $shownav = 1, $fieldid = 'rowid', $fieldref = 'ref', $morehtmlref = '', $moreparam = '', $nodbprefix = 0, $morehtmlleft = '', $morehtmlstatus = '', $onlybanner = 0, $morehtmlright = '')
{
    global $conf, $form, $user, $langs, $hookmanager, $action;

    $error = 0;

    $maxvisiblephotos = 1;
    $showimage = 1;
    $entity = (empty($object->entity) ? $conf->entity : $object->entity);
    // @phan-suppress-next-line PhanUndeclaredMethod
    $showbarcode = !isModEnabled('barcode') ? 0 : (empty($object->barcode) ? 0 : 1);
    if (getDolGlobalString('MAIN_USE_ADVANCED_PERMS') && !$user->hasRight('barcode', 'lire_advance')) {
        $showbarcode = 0;
    }
    $modulepart = 'unknown';

    if (in_array($object->element, ['societe', 'contact', 'product', 'ticket', 'bom'])) {
        $modulepart = $object->element;
    } elseif ($object->element == 'member') {
        $modulepart = 'memberphoto';
    } elseif ($object->element == 'user') {
        $modulepart = 'userphoto';
    }

    if (class_exists("Imagick")) {
        if ($object->element == 'expensereport' || $object->element == 'propal' || $object->element == 'commande' || $object->element == 'facture' || $object->element == 'supplier_proposal') {
            $modulepart = $object->element;
        } elseif ($object->element == 'fichinter' || $object->element == 'intervention') {
            $modulepart = 'ficheinter';
        } elseif ($object->element == 'contrat' || $object->element == 'contract') {
            $modulepart = 'contract';
        } elseif ($object->element == 'order_supplier') {
            $modulepart = 'supplier_order';
        } elseif ($object->element == 'invoice_supplier') {
            $modulepart = 'supplier_invoice';
        }
    }

    if ($object->element == 'product') {
        /** @var Product $object */
        '@phan-var-force Product $object';
        $width = 80;
        $cssclass = 'photowithmargin photoref';
        $showimage = $object->is_photo_available($conf->product->multidir_output[$entity]);
        $maxvisiblephotos = getDolGlobalInt('PRODUCT_MAX_VISIBLE_PHOTO', 5);
        if ($conf->browser->layout == 'phone') {
            $maxvisiblephotos = 1;
        }
        if ($showimage) {
            $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">' . $object->show_photos('product', $conf->product->multidir_output[$entity], 1, $maxvisiblephotos, 0, 0, 0, 0, $width, 0, '') . '</div>';
        } else {
            if (getDolGlobalString('PRODUCT_NODISPLAYIFNOPHOTO')) {
                $nophoto = '';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"></div>';
            } else {    // Show no photo link
                $nophoto = '/public/theme/common/nophoto.png';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"><img class="photo' . $modulepart . ($cssclass ? ' ' . $cssclass : '') . '" title="' . dol_escape_htmltag($langs->trans("UploadAnImageToSeeAPhotoHere", $langs->transnoentitiesnoconv("Documents"))) . '" alt="No photo"' . ($width ? ' style="width: ' . $width . 'px"' : '') . ' src="' . constant('DOL_URL_ROOT') . $nophoto . '"></div>';
            }
        }
    } elseif ($object->element == 'category') {
        /** @var Categorie $object */
        '@phan-var-force Categorie $object';
        $width = 80;
        $cssclass = 'photowithmargin photoref';
        $showimage = $object->isAnyPhotoAvailable($conf->categorie->multidir_output[$entity]);
        $maxvisiblephotos = getDolGlobalInt('CATEGORY_MAX_VISIBLE_PHOTO', 5);
        if ($conf->browser->layout == 'phone') {
            $maxvisiblephotos = 1;
        }
        if ($showimage) {
            $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">' . $object->show_photos('category', $conf->categorie->multidir_output[$entity], 'small', $maxvisiblephotos, 0, 0, 0, 0, $width, 0, '') . '</div>';
        } else {
            if (getDolGlobalString('CATEGORY_NODISPLAYIFNOPHOTO')) {
                $nophoto = '';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"></div>';
            } else {    // Show no photo link
                $nophoto = '/public/theme/common/nophoto.png';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"><img class="photo' . $modulepart . ($cssclass ? ' ' . $cssclass : '') . '" title="' . dol_escape_htmltag($langs->trans("UploadAnImageToSeeAPhotoHere", $langs->transnoentitiesnoconv("Documents"))) . '" alt="No photo"' . ($width ? ' style="width: ' . $width . 'px"' : '') . ' src="' . constant('DOL_URL_ROOT') . $nophoto . '"></div>';
            }
        }
    } elseif ($object->element == 'bom') {
        /** @var BOM $object */
        '@phan-var-force Bom $object';
        $width = 80;
        $cssclass = 'photowithmargin photoref';
        $showimage = $object->is_photo_available($conf->bom->multidir_output[$entity]);
        $maxvisiblephotos = getDolGlobalInt('BOM_MAX_VISIBLE_PHOTO', 5);
        if ($conf->browser->layout == 'phone') {
            $maxvisiblephotos = 1;
        }
        if ($showimage) {
            $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">' . $object->show_photos('bom', $conf->bom->multidir_output[$entity], 'small', $maxvisiblephotos, 0, 0, 0, 0, $width, 0, '') . '</div>';
        } else {
            if (getDolGlobalString('BOM_NODISPLAYIFNOPHOTO')) {
                $nophoto = '';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"></div>';
            } else {    // Show no photo link
                $nophoto = '/public/theme/common/nophoto.png';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"><img class="photo' . $modulepart . ($cssclass ? ' ' . $cssclass : '') . '" title="' . dol_escape_htmltag($langs->trans("UploadAnImageToSeeAPhotoHere", $langs->transnoentitiesnoconv("Documents"))) . '" alt="No photo"' . ($width ? ' style="width: ' . $width . 'px"' : '') . ' src="' . constant('DOL_URL_ROOT') . $nophoto . '"></div>';
            }
        }
    } elseif ($object->element == 'ticket') {
        $width = 80;
        $cssclass = 'photoref';
        /** @var Ticket $object */
        '@phan-var-force Ticket $object';
        $showimage = $object->is_photo_available($conf->ticket->multidir_output[$entity] . '/' . $object->ref);
        $maxvisiblephotos = getDolGlobalInt('TICKET_MAX_VISIBLE_PHOTO', 2);
        if ($conf->browser->layout == 'phone') {
            $maxvisiblephotos = 1;
        }

        if ($showimage) {
            $showphoto = $object->show_photos('ticket', $conf->ticket->multidir_output[$entity], 'small', $maxvisiblephotos, 0, 0, 0, $width, 0);
            if ($object->nbphoto > 0) {
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">' . $showphoto . '</div>';
            } else {
                $showimage = 0;
            }
        }
        if (!$showimage) {
            if (getDolGlobalString('TICKET_NODISPLAYIFNOPHOTO')) {
                $nophoto = '';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"></div>';
            } else {    // Show no photo link
                $nophoto = img_picto('No photo', 'object_ticket');
                $morehtmlleft .= '<!-- No photo to show -->';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"><div class="photoref">';
                $morehtmlleft .= $nophoto;
                $morehtmlleft .= '</div></div>';
            }
        }
    } else {
        if ($showimage) {
            if ($modulepart != 'unknown' || method_exists($object, 'getDataToShowPhoto')) {
                $phototoshow = '';
                // Check if a preview file is available
                if (in_array($modulepart, array('propal', 'commande', 'facture', 'ficheinter', 'contract', 'supplier_order', 'supplier_proposal', 'supplier_invoice', 'expensereport')) && class_exists("Imagick")) {
                    $objectref = dol_sanitizeFileName($object->ref);
                    $dir_output = (empty($conf->$modulepart->multidir_output[$entity]) ? $conf->$modulepart->dir_output : $conf->$modulepart->multidir_output[$entity]) . "/";
                    if (in_array($modulepart, array('invoice_supplier', 'supplier_invoice'))) {
                        $subdir = get_exdir($object->id, 2, 0, 1, $object, $modulepart);
                        $subdir .= ((!empty($subdir) && !preg_match('/\/$/', $subdir)) ? '/' : '') . $objectref; // the objectref dir is not included into get_exdir when used with level=2, so we add it at end
                    } else {
                        $subdir = get_exdir($object->id, 0, 0, 1, $object, $modulepart);
                    }
                    if (empty($subdir)) {
                        $subdir = 'errorgettingsubdirofobject'; // Protection to avoid to return empty path
                    }

                    $filepath = $dir_output . $subdir . "/";

                    $filepdf = $filepath . $objectref . ".pdf";
                    $relativepath = $subdir . '/' . $objectref . '.pdf';

                    // Define path to preview pdf file (preview precompiled "file.ext" are "file.ext_preview.png")
                    $fileimage = $filepdf . '_preview.png';
                    $relativepathimage = $relativepath . '_preview.png';

                    $pdfexists = file_exists($filepdf);

                    // If PDF file exists
                    if ($pdfexists) {
                        // Conversion du PDF en image png si fichier png non existent
                        if (!file_exists($fileimage) || (filemtime($fileimage) < filemtime($filepdf))) {
                            if (!getDolGlobalString('MAIN_DISABLE_PDF_THUMBS')) {       // If you experience trouble with pdf thumb generation and imagick, you can disable here.
                                include_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
                                $ret = dol_convert_file($filepdf, 'png', $fileimage, '0'); // Convert first page of PDF into a file _preview.png
                                if ($ret < 0) {
                                    $error++;
                                }
                            }
                        }
                    }

                    if ($pdfexists && !$error) {
                        $heightforphotref = 80;
                        if (!empty($conf->dol_optimize_smallscreen)) {
                            $heightforphotref = 60;
                        }
                        // If the preview file is found
                        if (file_exists($fileimage)) {
                            $phototoshow = '<div class="photoref">';
                            $phototoshow .= '<img height="' . $heightforphotref . '" class="photo photowithborder" src="' . constant('BASE_URL') . '/viewimage.php?modulepart=apercu' . $modulepart . '&amp;file=' . urlencode($relativepathimage) . '">';
                            $phototoshow .= '</div>';
                        }
                    }
                } elseif (!$phototoshow) { // example if modulepart = 'societe' or 'photo' or 'memberphoto'
                    $phototoshow .= $form->showphoto($modulepart, $object, 0, 0, 0, 'photowithmargin photoref', 'small', 1, 0, $maxvisiblephotos);
                }

                if ($phototoshow) {
                    $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">';
                    $morehtmlleft .= $phototoshow;
                    $morehtmlleft .= '</div>';
                }
            }

            if (empty($phototoshow)) {      // Show No photo link (picto of object)
                if ($object->element == 'action') {
                    $width = 80;
                    $cssclass = 'photorefcenter';
                    $nophoto = img_picto('No photo', 'title_agenda');
                } else {
                    $width = 14;
                    $cssclass = 'photorefcenter';
                    $picto = $object->picto;  // @phan-suppress-current-line PhanUndeclaredProperty
                    $prefix = 'object_';
                    if ($object->element == 'project' && !$object->public) {  // @phan-suppress-current-line PhanUndeclaredProperty
                        $picto = 'project'; // instead of projectpub
                    }
                    if (strpos($picto, 'fontawesome_') !== false) {
                        $prefix = '';
                    }
                    $nophoto = img_picto('No photo', $prefix . $picto);
                }
                $morehtmlleft .= '<!-- No photo to show -->';
                $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref"><div class="photoref">';
                $morehtmlleft .= $nophoto;
                $morehtmlleft .= '</div></div>';
            }
        }
    }

    // Show barcode
    if ($showbarcode) {
        $morehtmlleft .= '<div class="floatleft inline-block valignmiddle divphotoref">' . $form->showbarcode($object, 100, 'photoref valignmiddle') . '</div>';
    }

    if ($object->element == 'societe') {
        if (!empty($conf->use_javascript_ajax) && $user->hasRight('societe', 'creer') && getDolGlobalString('MAIN_DIRECT_STATUS_UPDATE')) {
            $morehtmlstatus .= ajax_object_onoff($object, 'status', 'status', 'InActivity', 'ActivityCeased');
        } else {
            $morehtmlstatus .= $object->getLibStatut(6);
        }
    } elseif ($object->element == 'product') {
        //$morehtmlstatus.=$langs->trans("Status").' ('.$langs->trans("Sell").') ';
        if (!empty($conf->use_javascript_ajax) && $user->hasRight('produit', 'creer') && getDolGlobalString('MAIN_DIRECT_STATUS_UPDATE')) {
            $morehtmlstatus .= ajax_object_onoff($object, 'status', 'tosell', 'ProductStatusOnSell', 'ProductStatusNotOnSell');
        } else {
            $morehtmlstatus .= '<span class="statusrefsell">' . $object->getLibStatut(6, 0) . '</span>';
        }
        $morehtmlstatus .= ' &nbsp; ';
        //$morehtmlstatus.=$langs->trans("Status").' ('.$langs->trans("Buy").') ';
        if (!empty($conf->use_javascript_ajax) && $user->hasRight('produit', 'creer') && getDolGlobalString('MAIN_DIRECT_STATUS_UPDATE')) {
            $morehtmlstatus .= ajax_object_onoff($object, 'status_buy', 'tobuy', 'ProductStatusOnBuy', 'ProductStatusNotOnBuy');
        } else {
            $morehtmlstatus .= '<span class="statusrefbuy">' . $object->getLibStatut(6, 1) . '</span>';
        }
    } elseif (in_array($object->element, array('salary'))) {
        $tmptxt = $object->getLibStatut(6, $object->alreadypaid);
        if (empty($tmptxt) || $tmptxt == $object->getLibStatut(3)) {
            $tmptxt = $object->getLibStatut(5, $object->alreadypaid);
        }
        $morehtmlstatus .= $tmptxt;
    } elseif (in_array($object->element, array('facture', 'invoice', 'invoice_supplier', 'chargesociales', 'loan', 'tva'))) {   // TODO Move this to use ->alreadypaid
        $tmptxt = $object->getLibStatut(6, $object->totalpaid);
        if (empty($tmptxt) || $tmptxt == $object->getLibStatut(3)) {
            $tmptxt = $object->getLibStatut(5, $object->totalpaid);
        }
        $morehtmlstatus .= $tmptxt;
    } elseif ($object->element == 'contrat' || $object->element == 'contract') {
        if ($object->statut == 0) {
            $morehtmlstatus .= $object->getLibStatut(5);
        } else {
            $morehtmlstatus .= $object->getLibStatut(4);
        }
    } elseif ($object->element == 'facturerec') {
        '@phan-var-force FactureRec $object';
        if ($object->frequency == 0) {
            $morehtmlstatus .= $object->getLibStatut(2);
        } else {
            $morehtmlstatus .= $object->getLibStatut(5);
        }
    } elseif ($object->element == 'project_task') {
        $object->fk_statut = 1;
        if ($object->progress > 0) {
            $object->fk_statut = 2;
        }
        if ($object->progress >= 100) {
            $object->fk_statut = 3;
        }
        $tmptxt = $object->getLibStatut(5);
        $morehtmlstatus .= $tmptxt; // No status on task
    } elseif (method_exists($object, 'getLibStatut')) { // Generic case for status
        $tmptxt = $object->getLibStatut(6);
        if (empty($tmptxt) || $tmptxt == $object->getLibStatut(3)) {
            $tmptxt = $object->getLibStatut(5);
        }
        $morehtmlstatus .= $tmptxt;
    }

    // Add if object was dispatched "into accountancy"
    if (isModEnabled('accounting') && in_array($object->element, array('bank', 'paiementcharge', 'facture', 'invoice', 'invoice_supplier', 'expensereport', 'payment_various'))) {
        // Note: For 'chargesociales', 'salaries'... this is the payments that are dispatched (so element = 'bank')
        if (method_exists($object, 'getVentilExportCompta')) {
            $accounted = $object->getVentilExportCompta();
            $langs->load("accountancy");
            $morehtmlstatus .= '</div><div class="statusref statusrefbis"><span class="opacitymedium">' . ($accounted > 0 ? $langs->trans("Accounted") : $langs->trans("NotYetAccounted")) . '</span>';
        }
    }

    // Add alias for thirdparty
    if (!empty($object->name_alias)) {
        '@phan-var-force Societe $object';
        $morehtmlref .= '<div class="refidno opacitymedium">' . dol_escape_htmltag($object->name_alias) . '</div>';
    }

    // Add label
    if (in_array($object->element, array('product', 'bank_account', 'project_task'))) {
        if (!empty($object->label)) {
            $morehtmlref .= '<div class="refidno opacitymedium">' . $object->label . '</div>';
        }
    }
    // Show address and email
    if (method_exists($object, 'getBannerAddress') && !in_array($object->element, array('product', 'bookmark', 'ecm_directories', 'ecm_files'))) {
        $moreaddress = $object->getBannerAddress('refaddress', $object);    // address, email, url, social networks
        if ($moreaddress) {
            $morehtmlref .= '<div class="refidno refaddress">';
            $morehtmlref .= $moreaddress;
            $morehtmlref .= '</div>';
        }
    }
    if (getDolGlobalString('MAIN_SHOW_TECHNICAL_ID') && (getDolGlobalString('MAIN_SHOW_TECHNICAL_ID') == '1' || preg_match('/' . preg_quote($object->element, '/') . '/i', $conf->global->MAIN_SHOW_TECHNICAL_ID)) && !empty($object->id)) {
        $morehtmlref .= '<div style="clear: both;"></div>';
        $morehtmlref .= '<div class="refidno opacitymedium">';
        $morehtmlref .= $langs->trans("TechnicalID") . ': ' . ((int)$object->id);
        $morehtmlref .= '</div>';
    }

    $parameters = array('morehtmlref' => &$morehtmlref, 'moreparam' => &$moreparam, 'morehtmlleft' => &$morehtmlleft, 'morehtmlstatus' => &$morehtmlstatus, 'morehtmlright' => &$morehtmlright);
    $reshook = $hookmanager->executeHooks('formDolBanner', $parameters, $object, $action);
    if ($reshook < 0) {
        setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
    } elseif (empty($reshook)) {
        $morehtmlref .= $hookmanager->resPrint;
    } elseif ($reshook > 0) {
        $morehtmlref = $hookmanager->resPrint;
    }


    print '<div class="' . ($onlybanner ? 'arearefnobottom ' : 'arearef ') . 'heightref valignmiddle centpercent">';
    print $form->showrefnav($object, $paramid, $morehtml, $shownav, $fieldid, $fieldref, $morehtmlref, $moreparam, $nodbprefix, $morehtmlleft, $morehtmlstatus, $morehtmlright);
    print '</div>';
    print '<div class="underrefbanner clearboth"></div>';
}

/**
 * Show a string with the label tag dedicated to the HTML edit field.
 *
 * @param string $langkey Translation key
 * @param string $fieldkey Key of the html select field the text refers to
 * @param int $fieldrequired 1=Field is mandatory
 * @return string
 * @deprecated Form::editfieldkey
 */
function fieldLabel($langkey, $fieldkey, $fieldrequired = 0)
{
    global $langs;
    $ret = '';
    if ($fieldrequired) {
        $ret .= '<span class="fieldrequired">';
    }
    $ret .= '<label for="' . $fieldkey . '">';
    $ret .= $langs->trans($langkey);
    $ret .= '</label>';
    if ($fieldrequired) {
        $ret .= '</span>';
    }
    return $ret;
}

/**
 * Return string to add class property on html element with pair/impair.
 *
 * @param boolean $var false or true
 * @param string $moreclass More class to add
 * @return  string                  String to add class onto HTML element
 */
function dol_bc($var, $moreclass = '')
{
    global $bc;
    $ret = ' ' . $bc[$var];
    if ($moreclass) {
        $ret = preg_replace('/class=\"/', 'class="' . $moreclass . ' ', $ret);
    }
    return $ret;
}

/**
 * Show Url link
 *
 * @param string $url Url to show
 * @param string $target Target for link
 * @param int $max Max number of characters to show
 * @param int $withpicto With picto
 * @param string $morecss More CSS
 * @return  string                  HTML Link
 */
function dol_print_url($url, $target = '_blank', $max = 32, $withpicto = 0, $morecss = '')
{
    global $langs;

    if (empty($url)) {
        return '';
    }

    $linkstart = '<a href="';
    if (!preg_match('/^http/i', $url)) {
        $linkstart .= 'http://';
    }
    $linkstart .= $url;
    $linkstart .= '"';
    if ($target) {
        $linkstart .= ' target="' . $target . '"';
    }
    $linkstart .= ' title="' . $langs->trans("URL") . ': ' . $url . '"';
    $linkstart .= '>';

    $link = '';
    if (!preg_match('/^http/i', $url)) {
        $link .= 'http://';
    }
    $link .= dol_trunc($url, $max);

    $linkend = '</a>';

    if ($morecss == 'float') {  // deprecated
        return '<div class="nospan' . ($morecss ? ' ' . $morecss : '') . '" style="margin-right: 10px">' . ($withpicto ? img_picto($langs->trans("Url"), 'globe', 'class="paddingrightonly"') : '') . $link . '</div>';
    } else {
        return $linkstart . '<span class="nospan' . ($morecss ? ' ' . $morecss : '') . '" style="margin-right: 10px">' . ($withpicto ? img_picto('', 'globe', 'class="paddingrightonly"') : '') . $link . '</span>' . $linkend;
    }
}

/**
 * Show EMail link formatted for HTML output.
 *
 * @param string $email EMail to show (only email, without 'Name of recipient' before)
 * @param int $cid Id of contact if known
 * @param int $socid Id of third party if known
 * @param int $addlink 0=no link, 1=email has a html email link (+ link to create action if constant AGENDA_ADDACTIONFOREMAIL is on)
 * @param int $max Max number of characters to show
 * @param int $showinvalid 1=Show warning if syntax email is wrong
 * @param int|string $withpicto Show picto
 * @return  string                      HTML Link
 */
function dol_print_email($email, $cid = 0, $socid = 0, $addlink = 0, $max = 64, $showinvalid = 1, $withpicto = 0)
{
    global $user, $langs, $hookmanager;

    //global $conf; $conf->global->AGENDA_ADDACTIONFOREMAIL = 1;
    //$showinvalid = 1; $email = 'rrrrr';

    $newemail = dol_escape_htmltag($email);

    if (getDolGlobalString('MAIN_OPTIMIZEFORTEXTBROWSER') && $withpicto) {
        $withpicto = 0;
    }

    if (empty($email)) {
        return '&nbsp;';
    }

    if (!empty($addlink)) {
        $newemail = '<a class="paddingrightonly" style="text-overflow: ellipsis;" href="';
        if (!preg_match('/^mailto:/i', $email)) {
            $newemail .= 'mailto:';
        }
        $newemail .= $email;
        $newemail .= '">';

        $newemail .= ($withpicto ? img_picto($langs->trans("EMail") . ' : ' . $email, (is_numeric($withpicto) ? 'email' : $withpicto), 'class="paddingrightonly"') : '');

        $newemail .= dol_trunc($email, $max);
        $newemail .= '</a>';
        if ($showinvalid && !isValidEmail($email)) {
            $langs->load("errors");
            $newemail .= img_warning($langs->trans("ErrorBadEMail", $email), '', 'paddingrightonly');
        }

        if (($cid || $socid) && isModEnabled('agenda') && $user->hasRight("agenda", "myactions", "create")) {
            $type = 'AC_EMAIL';
            $linktoaddaction = '';
            if (getDolGlobalString('AGENDA_ADDACTIONFOREMAIL')) {
                $linktoaddaction = '<a href="' . constant('BASE_URL') . '/comm/action/card.php?action=create&amp;backtopage=1&amp;actioncode=' . urlencode($type) . '&amp;contactid=' . ((int)$cid) . '&amp;socid=' . ((int)$socid) . '">' . img_object($langs->trans("AddAction"), "calendar") . '</a>';
            }
            if ($linktoaddaction) {
                $newemail = '<div>' . $newemail . ' ' . $linktoaddaction . '</div>';
            }
        }
    } else {
        $newemail = ($withpicto ? img_picto($langs->trans("EMail") . ' : ' . $email, (is_numeric($withpicto) ? 'email' : $withpicto), 'class="paddingrightonly"') : '') . $newemail;

        if ($showinvalid && !isValidEmail($email)) {
            $langs->load("errors");
            $newemail .= img_warning($langs->trans("ErrorBadEMail", $email));
        }
    }

    //$rep = '<div class="nospan" style="margin-right: 10px">';
    //$rep = ($withpicto ? img_picto($langs->trans("EMail").' : '.$email, (is_numeric($withpicto) ? 'email' : $withpicto), 'class="paddingrightonly"') : '').$newemail;
    //$rep .= '</div>';
    $rep = $newemail;

    if ($hookmanager) {
        $parameters = array('cid' => $cid, 'socid' => $socid, 'addlink' => $addlink, 'picto' => $withpicto);

        $reshook = $hookmanager->executeHooks('printEmail', $parameters, $email);
        if ($reshook > 0) {
            $rep = '';
        }
        $rep .= $hookmanager->resPrint;
    }

    return $rep;
}

/**
 * Show social network link
 *
 * @param string $value Social network ID to show (only skype, without 'Name of recipient' before)
 * @param int $cid Id of contact if known
 * @param int $socid Id of third party if known
 * @param string $type 'skype','facebook',...
 * @param array<string,array{rowid:int,label:string,url:string,icon:string,active:int}> $dictsocialnetworks List of socialnetworks available
 * @return  string                          HTML Link
 */
function dol_print_socialnetworks($value, $cid, $socid, $type, $dictsocialnetworks = array())
{
    global $user, $langs;

    $htmllink = $value;

    if (empty($value)) {
        return '&nbsp;';
    }

    if (!empty($type)) {
        $htmllink = '<div class="divsocialnetwork inline-block valignmiddle">';
        // Use dictionary definition for picto $dictsocialnetworks[$type]['icon']
        $htmllink .= '<span class="fab pictofixedwidth ' . ($dictsocialnetworks[$type]['icon'] ? $dictsocialnetworks[$type]['icon'] : 'fa-link') . '"></span>';
        if ($type == 'skype') {
            $htmllink .= dol_escape_htmltag($value);
            $htmllink .= '&nbsp; <a href="skype:';
            $htmllink .= dol_string_nospecial($value, '_', '', array('@'));
            $htmllink .= '?call" alt="' . $langs->trans("Call") . '&nbsp;' . $value . '" title="' . dol_escape_htmltag($langs->trans("Call") . ' ' . $value) . '">';
            $htmllink .= '<img src="' . constant('DOL_URL_ROOT') . '/theme/common/skype_callbutton.png" border="0">';
            $htmllink .= '</a><a href="skype:';
            $htmllink .= dol_string_nospecial($value, '_', '', array('@'));
            $htmllink .= '?chat" alt="' . $langs->trans("Chat") . '&nbsp;' . $value . '" title="' . dol_escape_htmltag($langs->trans("Chat") . ' ' . $value) . '">';
            $htmllink .= '<img class="paddingleft" src="' . constant('DOL_URL_ROOT') . '/theme/common/skype_chatbutton.png" border="0">';
            $htmllink .= '</a>';
            if (($cid || $socid) && isModEnabled('agenda') && $user->hasRight('agenda', 'myactions', 'create')) {
                $addlink = 'AC_SKYPE';
                $link = '';
                if (getDolGlobalString('AGENDA_ADDACTIONFORSKYPE')) {
                    $link = '<a href="' . constant('BASE_URL') . '/comm/action/card.php?action=create&amp;backtopage=1&amp;actioncode=' . $addlink . '&amp;contactid=' . $cid . '&amp;socid=' . $socid . '">' . img_object($langs->trans("AddAction"), "calendar") . '</a>';
                }
                $htmllink .= ($link ? ' ' . $link : '');
            }
        } else {
            $networkconstname = 'MAIN_INFO_SOCIETE_' . strtoupper($type) . '_URL';
            if (getDolGlobalString($networkconstname)) {
                $link = str_replace('{socialid}', $value, getDolGlobalString($networkconstname));
                if (preg_match('/^https?:\/\//i', $link)) {
                    $htmllink .= '<a href="' . dol_sanitizeUrl($link, 0) . '" target="_blank" rel="noopener noreferrer">' . dol_escape_htmltag($value) . '</a>';
                } else {
                    $htmllink .= '<a href="' . dol_sanitizeUrl($link, 1) . '" target="_blank" rel="noopener noreferrer">' . dol_escape_htmltag($value) . '</a>';
                }
            } elseif (!empty($dictsocialnetworks[$type]['url'])) {
                $tmpvirginurl = preg_replace('/\/?{socialid}/', '', $dictsocialnetworks[$type]['url']);
                if ($tmpvirginurl) {
                    $value = preg_replace('/^www\.' . preg_quote($tmpvirginurl, '/') . '\/?/', '', $value);
                    $value = preg_replace('/^' . preg_quote($tmpvirginurl, '/') . '\/?/', '', $value);

                    $tmpvirginurl3 = preg_replace('/^https:\/\//i', 'https://www.', $tmpvirginurl);
                    if ($tmpvirginurl3) {
                        $value = preg_replace('/^www\.' . preg_quote($tmpvirginurl3, '/') . '\/?/', '', $value);
                        $value = preg_replace('/^' . preg_quote($tmpvirginurl3, '/') . '\/?/', '', $value);
                    }

                    $tmpvirginurl2 = preg_replace('/^https?:\/\//i', '', $tmpvirginurl);
                    if ($tmpvirginurl2) {
                        $value = preg_replace('/^www\.' . preg_quote($tmpvirginurl2, '/') . '\/?/', '', $value);
                        $value = preg_replace('/^' . preg_quote($tmpvirginurl2, '/') . '\/?/', '', $value);
                    }
                }
                $link = str_replace('{socialid}', $value, $dictsocialnetworks[$type]['url']);
                if (preg_match('/^https?:\/\//i', $link)) {
                    $htmllink .= '<a href="' . dol_sanitizeUrl($link, 0) . '" target="_blank" rel="noopener noreferrer">' . dol_escape_htmltag($value) . '</a>';
                } else {
                    $htmllink .= '<a href="' . dol_sanitizeUrl($link, 1) . '" target="_blank" rel="noopener noreferrer">' . dol_escape_htmltag($value) . '</a>';
                }
            } else {
                $htmllink .= dol_escape_htmltag($value);
            }
        }
        $htmllink .= '</div>';
    } else {
        $langs->load("errors");
        $htmllink .= img_warning($langs->trans("ErrorBadSocialNetworkValue", $value));
    }
    return $htmllink;
}

/**
 *  Format phone numbers according to country
 *
 * @param string $phone Phone number to format
 * @param string $countrycode Country code to use for formatting
 * @param int $cid Id of contact if known
 * @param int $socid Id of third party if known
 * @param string $addlink ''=no link to create action, 'AC_TEL'=add link to clicktodial (if module enabled) and add link to create event (if conf->global->AGENDA_ADDACTIONFORPHONE set), 'tel'=Force "tel:..." link
 * @param string $separ Separation between numbers for a better visibility example : xx.xx.xx.xx.xx. You can also use 'hidenum' to hide the number, keep only the picto.
 * @param string $withpicto Show picto ('fax', 'phone', 'mobile')
 * @param string $titlealt Text to show on alt
 * @param int $adddivfloat Add div float around phone.
 * @param string $morecss Add more css
 * @return string                  Formatted phone number
 */
function dol_print_phone($phone, $countrycode = '', $cid = 0, $socid = 0, $addlink = '', $separ = "&nbsp;", $withpicto = '', $titlealt = '', $adddivfloat = 0, $morecss = '')
{
    global $conf, $user, $langs, $mysoc, $hookmanager;

    // Clean phone parameter
    $phone = is_null($phone) ? '' : preg_replace("/[\s.-]/", "", trim($phone));
    if (empty($phone)) {
        return '';
    }
    if (getDolGlobalString('MAIN_PHONE_SEPAR')) {
        $separ = getDolGlobalString('MAIN_PHONE_SEPAR');
    }
    if (empty($countrycode) && is_object($mysoc)) {
        $countrycode = $mysoc->country_code;
    }

    // Short format for small screens
    if (!empty($conf->dol_optimize_smallscreen) && $separ != 'hidenum') {
        $separ = '';
    }

    $newphone = $phone;
    $newphonewa = $phone;
    if (strtoupper($countrycode) == "FR") {
        // France
        if (dol_strlen($phone) == 10) {
            $newphone = substr($newphone, 0, 2) . $separ . substr($newphone, 2, 2) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2);
        } elseif (dol_strlen($phone) == 7) {
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 2);
        } elseif (dol_strlen($phone) == 9) {
            $newphone = substr($newphone, 0, 2) . $separ . substr($newphone, 2, 3) . $separ . substr($newphone, 5, 2) . $separ . substr($newphone, 7, 2);
        } elseif (dol_strlen($phone) == 11) {
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 2) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2);
        } elseif (dol_strlen($phone) == 12) {
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 1) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 13) {
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 3) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "CA") {
        if (dol_strlen($phone) == 10) {
            $newphone = ($separ != '' ? '(' : '') . substr($newphone, 0, 3) . ($separ != '' ? ')' : '') . $separ . substr($newphone, 3, 3) . ($separ != '' ? '-' : '') . substr($newphone, 6, 4);
        }
    } elseif (strtoupper($countrycode) == "PT") {//Portugal
        if (dol_strlen($phone) == 13) {//ex: +351_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 3);
        }
    } elseif (strtoupper($countrycode) == "SR") {//Suriname
        if (dol_strlen($phone) == 10) {//ex: +597_ABC_DEF
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3);
        } elseif (dol_strlen($phone) == 11) {//ex: +597_ABC_DEFG
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 4);
        }
    } elseif (strtoupper($countrycode) == "DE") {//Allemagne
        if (dol_strlen($phone) == 14) {//ex:  +49_ABCD_EFGH_IJK
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 4) . $separ . substr($newphone, 7, 4) . $separ . substr($newphone, 11, 3);
        } elseif (dol_strlen($phone) == 13) {//ex: +49_ABC_DEFG_HIJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 4) . $separ . substr($newphone, 10, 3);
        }
    } elseif (strtoupper($countrycode) == "ES") {//Espagne
        if (dol_strlen($phone) == 12) {//ex:  +34_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 3);
        }
    } elseif (strtoupper($countrycode) == "BF") {// Burkina Faso
        if (dol_strlen($phone) == 12) {//ex :  +22 A BC_DE_FG_HI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 1) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "RO") {// Roumanie
        if (dol_strlen($phone) == 12) {//ex :  +40 AB_CDE_FG_HI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "TR") {//Turquie
        if (dol_strlen($phone) == 13) {//ex :  +90 ABC_DEF_GHIJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 4);
        }
    } elseif (strtoupper($countrycode) == "US") {//Etat-Unis
        if (dol_strlen($phone) == 12) {//ex: +1 ABC_DEF_GHIJ
            $newphone = substr($newphone, 0, 2) . $separ . substr($newphone, 2, 3) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 4);
        }
    } elseif (strtoupper($countrycode) == "MX") {//Mexique
        if (dol_strlen($phone) == 12) {//ex: +52 ABCD_EFG_HI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 4) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 11) {//ex: +52 AB_CD_EF_GH
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 2) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2);
        } elseif (dol_strlen($phone) == 13) {//ex: +52 ABC_DEF_GHIJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 4);
        }
    } elseif (strtoupper($countrycode) == "ML") {//Mali
        if (dol_strlen($phone) == 12) {//ex: +223 AB_CD_EF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "TH") {//Thaïlande
        if (dol_strlen($phone) == 11) {//ex: +66_ABC_DE_FGH
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 3);
        } elseif (dol_strlen($phone) == 12) {//ex: +66_A_BCD_EF_GHI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 1) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 3);
        }
    } elseif (strtoupper($countrycode) == "MU") {
        //Maurice
        if (dol_strlen($phone) == 11) {//ex: +230_ABC_DE_FG
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2);
        } elseif (dol_strlen($phone) == 12) {//ex: +230_ABCD_EF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 4) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "ZA") {//Afrique du sud
        if (dol_strlen($phone) == 12) {//ex: +27_AB_CDE_FG_HI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "SY") {//Syrie
        if (dol_strlen($phone) == 12) {//ex: +963_AB_CD_EF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 13) {//ex: +963_AB_CD_EF_GHI
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 3);
        }
    } elseif (strtoupper($countrycode) == "AE") {//Emirats Arabes Unis
        if (dol_strlen($phone) == 12) {//ex: +971_ABC_DEF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 13) {//ex: +971_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 3);
        } elseif (dol_strlen($phone) == 14) {//ex: +971_ABC_DEF_GHIK
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 4);
        }
    } elseif (strtoupper($countrycode) == "DZ") {//Algérie
        if (dol_strlen($phone) == 13) {//ex: +213_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 3);
        }
    } elseif (strtoupper($countrycode) == "BE") {//Belgique
        if (dol_strlen($phone) == 11) {//ex: +32_ABC_DE_FGH
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 3);
        } elseif (dol_strlen($phone) == 12) {//ex: +32_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 3);
        }
    } elseif (strtoupper($countrycode) == "PF") {//Polynésie française
        if (dol_strlen($phone) == 12) {//ex: +689_AB_CD_EF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        }
    } elseif (strtoupper($countrycode) == "CO") {//Colombie
        if (dol_strlen($phone) == 13) {//ex: +57_ABC_DEF_GH_IJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "JO") {//Jordanie
        if (dol_strlen($phone) == 12) {//ex: +962_A_BCD_EF_GH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 1) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2);
        }
    } elseif (strtoupper($countrycode) == "JM") {//Jamaïque
        if (dol_strlen($newphone) == 12) {//ex: +1867_ABC_DEFG
            $newphone = substr($newphone, 0, 5) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 4);
        }
    } elseif (strtoupper($countrycode) == "MG") {//Madagascar
        if (dol_strlen($phone) == 13) {//ex: +261_AB_CD_EFG_HI
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 3) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "GB") {//Royaume uni
        if (dol_strlen($phone) == 13) {//ex: +44_ABCD_EFG_HIJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 4) . $separ . substr($newphone, 7, 3) . $separ . substr($newphone, 10, 3);
        }
    } elseif (strtoupper($countrycode) == "CH") {//Suisse
        if (dol_strlen($phone) == 12) {//ex: +41_AB_CDE_FG_HI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 15) {// +41_AB_CDE_FGH_IJKL
            $newphone = $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 2) . $separ . substr($newphone, 5, 3) . $separ . substr($newphone, 8, 3) . $separ . substr($newphone, 11, 4);
        }
    } elseif (strtoupper($countrycode) == "TN") {//Tunisie
        if (dol_strlen($phone) == 12) {//ex: +216_AB_CDE_FGH
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 3);
        }
    } elseif (strtoupper($countrycode) == "GF") {//Guyane francaise
        if (dol_strlen($phone) == 13) {//ex: +594_ABC_DE_FG_HI  (ABC=594 de nouveau)
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "GP") {//Guadeloupe
        if (dol_strlen($phone) == 13) {//ex: +590_ABC_DE_FG_HI  (ABC=590 de nouveau)
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "MQ") {//Martinique
        if (dol_strlen($phone) == 13) {//ex: +596_ABC_DE_FG_HI  (ABC=596 de nouveau)
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "IT") {//Italie
        if (dol_strlen($phone) == 12) {//ex: +39_ABC_DEF_GHI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 3);
        } elseif (dol_strlen($phone) == 13) {//ex: +39_ABC_DEF_GH_IJ
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "AU") {
        //Australie
        if (dol_strlen($phone) == 12) {
            //ex: +61_A_BCDE_FGHI
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 1) . $separ . substr($newphone, 4, 4) . $separ . substr($newphone, 8, 4);
        }
    } elseif (strtoupper($countrycode) == "LU") {
        // Luxembourg
        if (dol_strlen($phone) == 10) {// fix 6 digits +352_AA_BB_CC
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2);
        } elseif (dol_strlen($phone) == 11) {// fix 7 digits +352_AA_BB_CC_D
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 1);
        } elseif (dol_strlen($phone) == 12) {// fix 8 digits +352_AA_BB_CC_DD
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 2) . $separ . substr($newphone, 6, 2) . $separ . substr($newphone, 8, 2) . $separ . substr($newphone, 10, 2);
        } elseif (dol_strlen($phone) == 13) {// mobile +352_AAA_BB_CC_DD
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 7, 2) . $separ . substr($newphone, 9, 2) . $separ . substr($newphone, 11, 2);
        }
    } elseif (strtoupper($countrycode) == "PE") {
        // Peru
        if (dol_strlen($phone) == 7) {// fix 7 chiffres without code AAA_BBBB
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 4);
        } elseif (dol_strlen($phone) == 9) {// mobile add code and fix 9 chiffres +51_AAA_BBB_CCC
            $newphonewa = '+51' . $newphone;
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 10, 3);
        } elseif (dol_strlen($phone) == 11) {// fix 11 chiffres +511_AAA_BBBB
            $newphone = substr($newphone, 0, 4) . $separ . substr($newphone, 4, 3) . $separ . substr($newphone, 8, 4);
        } elseif (dol_strlen($phone) == 12) {// mobile +51_AAA_BBB_CCC
            $newphonewa = $newphone;
            $newphone = substr($newphone, 0, 3) . $separ . substr($newphone, 3, 3) . $separ . substr($newphone, 6, 3) . $separ . substr($newphone, 10, 3) . $separ . substr($newphone, 14, 3);
        }
    }

    $newphoneastart = $newphoneaend = '';
    if (!empty($addlink)) { // Link on phone number (+ link to add action if conf->global->AGENDA_ADDACTIONFORPHONE set)
        if ($addlink == 'tel' || $conf->browser->layout == 'phone' || (isModEnabled('clicktodial') && getDolGlobalString('CLICKTODIAL_USE_TEL_LINK_ON_PHONE_NUMBERS'))) {   // If phone or option for, we use link of phone
            $newphoneastart = '<a href="tel:' . urlencode($phone) . '">';
            $newphoneaend .= '</a>';
        } elseif (isModEnabled('clicktodial') && $addlink == 'AC_TEL') {        // If click to dial, we use click to dial url
            if (empty($user->clicktodial_loaded)) {
                $user->fetch_clicktodial();
            }

            // Define urlmask
            $urlmask = getDolGlobalString('CLICKTODIAL_URL', 'ErrorClickToDialModuleNotConfigured');
            if (!empty($user->clicktodial_url)) {
                $urlmask = $user->clicktodial_url;
            }

            $clicktodial_poste = (!empty($user->clicktodial_poste) ? urlencode($user->clicktodial_poste) : '');
            $clicktodial_login = (!empty($user->clicktodial_login) ? urlencode($user->clicktodial_login) : '');
            $clicktodial_password = (!empty($user->clicktodial_password) ? urlencode($user->clicktodial_password) : '');
            // This line is for backward compatibility  @phan-suppress-next-line PhanPluginPrintfVariableFormatString
            $url = sprintf($urlmask, urlencode($phone), $clicktodial_poste, $clicktodial_login, $clicktodial_password);
            // Those lines are for substitution
            $substitarray = array('__PHONEFROM__' => $clicktodial_poste,
                '__PHONETO__' => urlencode($phone),
                '__LOGIN__' => $clicktodial_login,
                '__PASS__' => $clicktodial_password);
            $url = make_substitutions($url, $substitarray);
            if (!getDolGlobalString('CLICKTODIAL_DO_NOT_USE_AJAX_CALL')) {
                // Default and recommended: New method using ajax without submitting a page making a javascript history.go(-1) back
                $newphoneastart = '<a href="' . $url . '" class="cssforclicktodial">';  // Call of ajax is handled by the lib_foot.js.php on class 'cssforclicktodial'
                $newphoneaend = '</a>';
            } else {
                // Old method
                $newphoneastart = '<a href="' . $url . '"';
                if (getDolGlobalString('CLICKTODIAL_FORCENEWTARGET')) {
                    $newphoneastart .= ' target="_blank" rel="noopener noreferrer"';
                }
                $newphoneastart .= '>';
                $newphoneaend .= '</a>';
            }
        }

        //if (($cid || $socid) && isModEnabled('agenda') && $user->hasRight('agenda', 'myactions', 'create'))
        if (isModEnabled('agenda') && $user->hasRight("agenda", "myactions", "create")) {
            $type = 'AC_TEL';
            $addlinktoagenda = '';
            if ($addlink == 'AC_FAX') {
                $type = 'AC_FAX';
            }
            if (getDolGlobalString('AGENDA_ADDACTIONFORPHONE')) {
                $addlinktoagenda = '<a href="' . constant('BASE_URL') . '/comm/action/card.php?action=create&amp;backtopage=' . urlencode($_SERVER['REQUEST_URI']) . '&amp;actioncode=' . $type . ($cid ? '&amp;contactid=' . $cid : '') . ($socid ? '&amp;socid=' . $socid : '') . '">' . img_object($langs->trans("AddAction"), "calendar") . '</a>';
            }
            if ($addlinktoagenda) {
                $newphone = '<span>' . $newphone . ' ' . $addlinktoagenda . '</span>';
            }
        }
    }

    if (getDolGlobalString('CONTACT_PHONEMOBILE_SHOW_LINK_TO_WHATSAPP') && $withpicto == 'mobile') {
        // Link to Whatsapp
        $newphone .= ' <a href="https://wa.me/' . $newphonewa . '" target="_blank"';// Use api to whatasapp contacts
        $newphone .= '><span class="paddingright fab fa-whatsapp" style="color:#25D366;" title="WhatsApp"></span></a>';
    }

    if (empty($titlealt)) {
        $titlealt = ($withpicto == 'fax' ? $langs->trans("Fax") : $langs->trans("Phone"));
    }
    $rep = '';

    if ($hookmanager) {
        $parameters = array('countrycode' => $countrycode, 'cid' => $cid, 'socid' => $socid, 'titlealt' => $titlealt, 'picto' => $withpicto);
        $reshook = $hookmanager->executeHooks('printPhone', $parameters, $phone);
        $rep .= $hookmanager->resPrint;
    }
    if (empty($reshook)) {
        $picto = '';
        if ($withpicto) {
            if ($withpicto == 'fax') {
                $picto = 'phoning_fax';
            } elseif ($withpicto == 'phone') {
                $picto = 'phoning';
            } elseif ($withpicto == 'mobile') {
                $picto = 'phoning_mobile';
            } else {
                $picto = '';
            }
        }
        if ($adddivfloat == 1) {
            $rep .= '<div class="nospan float' . ($morecss ? ' ' . $morecss : '') . '" style="margin-right: 10px">';
        } elseif (empty($adddivfloat)) {
            $rep .= '<span' . ($morecss ? ' class="' . $morecss . '"' : '') . ' style="margin-right: 10px;">';
        }

        $rep .= $newphoneastart;
        $rep .= ($withpicto ? img_picto($titlealt, 'object_' . $picto . '.png') : '');
        if ($separ != 'hidenum') {
            $rep .= ($withpicto ? ' ' : '') . $newphone;
        }
        $rep .= $newphoneaend;

        if ($adddivfloat == 1) {
            $rep .= '</div>';
        } elseif (empty($adddivfloat)) {
            $rep .= '</span>';
        }
    }

    return $rep;
}

/**
 *  Show warning logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"'). If 1, add float: right. Can't be "class" attribute.
 * @param string $morecss Add more CSS
 * @return string              Return img tag
 */
function img_warning($titlealt = 'default', $moreatt = '', $morecss = 'pictowarning')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Warning');
    }

    //return '<div class="imglatecoin">'.img_picto($titlealt, 'warning_white.png', 'class="pictowarning valignmiddle"'.($moreatt ? ($moreatt == '1' ? ' style="float: right"' : ' '.$moreatt): '')).'</div>';
    return img_picto($titlealt, 'warning.png', 'class="' . $morecss . '"' . ($moreatt ? ($moreatt == '1' ? ' style="float: right"' : ' ' . $moreatt) : ''));
}

/**
 *  Show error logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @return string              Return img tag
 */
function img_error($titlealt = 'default')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Error');
    }

    return img_picto($titlealt, 'error.png');
}

/**
 *  Show next logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"')
 * @return string              Return img tag
 */
function img_next($titlealt = 'default', $moreatt = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Next');
    }

    //return img_picto($titlealt, 'next.png', $moreatt);
    return '<span class="fa fa-chevron-right paddingright paddingleft" title="' . dol_escape_htmltag($titlealt) . '"></span>';
}

/**
 *  Show previous logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"')
 * @return string              Return img tag
 */
function img_previous($titlealt = 'default', $moreatt = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Previous');
    }

    //return img_picto($titlealt, 'previous.png', $moreatt);
    return '<span class="fa fa-chevron-left paddingright paddingleft" title="' . dol_escape_htmltag($titlealt) . '"></span>';
}

/**
 *  Show down arrow logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param int $selected Selected
 * @param string $moreclass Add more CSS classes
 * @return string              Return img tag
 */
function img_down($titlealt = 'default', $selected = 0, $moreclass = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Down');
    }

    return img_picto($titlealt, ($selected ? '1downarrow_selected.png' : '1downarrow.png'), 'class="imgdown' . ($moreclass ? " " . $moreclass : "") . '"');
}

/**
 *  Show top arrow logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param int $selected Selected
 * @param string $moreclass Add more CSS classes
 * @return string              Return img tag
 */
function img_up($titlealt = 'default', $selected = 0, $moreclass = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Up');
    }

    return img_picto($titlealt, ($selected ? '1uparrow_selected.png' : '1uparrow.png'), 'class="imgup' . ($moreclass ? " " . $moreclass : "") . '"');
}

/**
 *  Show left arrow logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param int $selected Selected
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"')
 * @return string              Return img tag
 */
function img_left($titlealt = 'default', $selected = 0, $moreatt = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Left');
    }

    return img_picto($titlealt, ($selected ? '1leftarrow_selected.png' : '1leftarrow.png'), $moreatt);
}

/**
 *  Show right arrow logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param int $selected Selected
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"')
 * @return string              Return img tag
 */
function img_right($titlealt = 'default', $selected = 0, $moreatt = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Right');
    }

    return img_picto($titlealt, ($selected ? '1rightarrow_selected.png' : '1rightarrow.png'), $moreatt);
}

/**
 *  Show tick logo if allowed
 *
 * @param string $allow Allow
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @return string              Return img tag
 */
function img_allow($allow, $titlealt = 'default')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Active');
    }

    if ($allow == 1) {
        return img_picto($titlealt, 'tick.png');
    }

    return '-';
}

/**
 *  Return image of a credit card according to its brand name
 *
 * @param string $brand Brand name of credit card
 * @param string $morecss More CSS
 * @return string              Return img tag
 */
function img_credit_card($brand, $morecss = null)
{
    if (is_null($morecss)) {
        $morecss = 'fa-2x';
    }

    if ($brand == 'visa' || $brand == 'Visa') {
        $brand = 'cc-visa';
    } elseif ($brand == 'mastercard' || $brand == 'MasterCard') {
        $brand = 'cc-mastercard';
    } elseif ($brand == 'amex' || $brand == 'American Express') {
        $brand = 'cc-amex';
    } elseif ($brand == 'discover' || $brand == 'Discover') {
        $brand = 'cc-discover';
    } elseif ($brand == 'jcb' || $brand == 'JCB') {
        $brand = 'cc-jcb';
    } elseif ($brand == 'diners' || $brand == 'Diners club') {
        $brand = 'cc-diners-club';
    } elseif (!in_array($brand, array('cc-visa', 'cc-mastercard', 'cc-amex', 'cc-discover', 'cc-jcb', 'cc-diners-club'))) {
        $brand = 'credit-card';
    }

    return '<span class="fa fa-' . $brand . ' fa-fw' . ($morecss ? ' ' . $morecss : '') . '"></span>';
}

/**
 *  Show MIME img of a file
 *
 * @param string $file Filename
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $morecss More css
 * @return string              Return img tag
 */
function img_mime($file, $titlealt = '', $morecss = '')
{
    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/files.lib.php';

    $mimetype = dol_mimetype($file, '', 1);
    $mimeimg = dol_mimetype($file, '', 2);
    $mimefa = dol_mimetype($file, '', 4);

    if (empty($titlealt)) {
        $titlealt = 'Mime type: ' . $mimetype;
    }

    //return img_picto_common($titlealt, 'mime/'.$mimeimg, 'class="'.$morecss.'"');
    return '<i class="fa fa-' . $mimefa . ' paddingright' . ($morecss ? ' ' . $morecss : '') . '"' . ($titlealt ? ' title="' . $titlealt . '"' : '') . '></i>';
}


/**
 *  Show search logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Retourne tag img
 */
function img_search($titlealt = 'default', $other = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Search');
    }

    $img = img_picto($titlealt, 'search.png', $other, 0, 1);

    $input = '<input type="image" class="liste_titre" name="button_search" src="' . $img . '" ';
    $input .= 'value="' . dol_escape_htmltag($titlealt) . '" title="' . dol_escape_htmltag($titlealt) . '" >';

    return $input;
}

/**
 *  Show search logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Retourne tag img
 */
function img_searchclear($titlealt = 'default', $other = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Search');
    }

    $img = img_picto($titlealt, 'searchclear.png', $other, 0, 1);

    $input = '<input type="image" class="liste_titre" name="button_removefilter" src="' . $img . '" ';
    $input .= 'value="' . dol_escape_htmltag($titlealt) . '" title="' . dol_escape_htmltag($titlealt) . '" >';

    return $input;
}

/**
 *  Show information in HTML for admin users or standard users
 *
 * @param string $text Text info
 * @param integer $infoonimgalt Info is shown only on alt of star picto, otherwise it is show on output after the star picto
 * @param int $nodiv No div
 * @param string $admin '1'=Info for admin users. '0'=Info for standard users (change only the look), 'error', 'warning', 'xxx'=Other
 * @param string $morecss More CSS ('', 'warning', 'error')
 * @param string $textfordropdown Show a text to click to dropdown the info box.
 * @return string                      String with info text
 */
function info_admin($text, $infoonimgalt = 0, $nodiv = 0, $admin = '1', $morecss = 'hideonsmartphone', $textfordropdown = '')
{
    global $conf, $langs;

    if ($infoonimgalt) {
        $result = img_picto($text, 'info', 'class="' . ($morecss ? ' ' . $morecss : '') . '"');
    } else {
        if (empty($conf->use_javascript_ajax)) {
            $textfordropdown = '';
        }

        $class = (empty($admin) ? 'undefined' : ($admin == '1' ? 'info' : $admin));
        $result = ($nodiv ? '' : '<div class="wordbreak ' . $class . ($morecss ? ' ' . $morecss : '') . ($textfordropdown ? ' hidden' : '') . '">') . '<span class="fa fa-info-circle" title="' . dol_escape_htmltag($admin ? $langs->trans('InfoAdmin') : $langs->trans('Note')) . '"></span> ';
        $result .= dol_escape_htmltag($text, 1, 0, 'div,span,b,br,a');
        $result .= ($nodiv ? '' : '</div>');

        if ($textfordropdown) {
            $tmpresult = '<span class="' . $class . 'text opacitymedium cursorpointer">' . $langs->trans($textfordropdown) . ' ' . img_picto($langs->trans($textfordropdown), '1downarrow') . '</span>';
            $tmpresult .= '<script nonce="' . getNonce() . '" type="text/javascript">
				jQuery(document).ready(function() {
					jQuery(".' . $class . 'text").click(function() {
						console.log("toggle text");
						jQuery(".' . $class . '").toggle();
					});
				});
				</script>';

            $result = $tmpresult . $result;
        }
    }

    return $result;
}


/**
 *  Displays error message system with all the information to facilitate the diagnosis and the escalation of the bugs.
 *  This function must be called when a blocking technical error is encountered.
 *  However, one must try to call it only within php pages, classes must return their error through their property "error".
 *
 * @param DoliDB|null $db Database handler
 * @param string|string[] $error String or array of errors strings to show
 * @param string[]|null $errors Array of errors
 * @return     void
 * @see        dol_htmloutput_errors()
 */
function dol_print_error($db = null, $error = '', $errors = null)
{
    global $conf, $langs, $argv;
    global $dolibarr_main_prod;

    $out = '';
    $syslog = '';

    // If error occurs before the $lang object was loaded
    if (!$langs) {
        $langs = new Translate('', $conf);
        $langs->load("main");
    }

    // Load translation files required by the error messages
    $langs->loadLangs(array('main', 'errors'));

    if ($_SERVER['DOCUMENT_ROOT']) {    // Mode web
        $out .= $langs->trans("DolibarrHasDetectedError") . ".<br>\n";
        if (getDolGlobalInt('MAIN_FEATURES_LEVEL') > 0) {
            $out .= "You use an experimental or develop level of features, so please do NOT report any bugs or vulnerability, except if problem is confirmed after moving option MAIN_FEATURES_LEVEL back to 0.<br>\n";
        }
        $out .= $langs->trans("InformationToHelpDiagnose") . ":<br>\n";

        $out .= "<b>" . $langs->trans("Date") . ":</b> " . dol_print_date(time(), 'dayhourlog') . "<br>\n";
        $out .= "<b>" . $langs->trans("Dolibarr") . ":</b> " . DOL_VERSION . " - https://www.dolibarr.org<br>\n";
        if (isset($conf->global->MAIN_FEATURES_LEVEL)) {
            $out .= "<b>" . $langs->trans("LevelOfFeature") . ":</b> " . getDolGlobalInt('MAIN_FEATURES_LEVEL') . "<br>\n";
        }
        if (function_exists("phpversion")) {
            $out .= "<b>" . $langs->trans("PHP") . ":</b> " . phpversion() . "<br>\n";
        }
        $out .= "<b>" . $langs->trans("Server") . ":</b> " . (isset($_SERVER["SERVER_SOFTWARE"]) ? dol_htmlentities($_SERVER["SERVER_SOFTWARE"], ENT_COMPAT) : '') . "<br>\n";
        if (function_exists("php_uname")) {
            $out .= "<b>" . $langs->trans("OS") . ":</b> " . php_uname() . "<br>\n";
        }
        $out .= "<b>" . $langs->trans("UserAgent") . ":</b> " . (isset($_SERVER["HTTP_USER_AGENT"]) ? dol_htmlentities($_SERVER["HTTP_USER_AGENT"], ENT_COMPAT) : '') . "<br>\n";
        $out .= "<br>\n";
        $out .= "<b>" . $langs->trans("RequestedUrl") . ":</b> " . dol_htmlentities($_SERVER["REQUEST_URI"], ENT_COMPAT) . "<br>\n";
        $out .= "<b>" . $langs->trans("Referer") . ":</b> " . (isset($_SERVER["HTTP_REFERER"]) ? dol_htmlentities($_SERVER["HTTP_REFERER"], ENT_COMPAT) : '') . "<br>\n";
        $out .= "<b>" . $langs->trans("MenuManager") . ":</b> " . (isset($conf->standard_menu) ? dol_htmlentities($conf->standard_menu, ENT_COMPAT) : '') . "<br>\n";
        $out .= "<br>\n";
        $syslog .= "url=" . dol_escape_htmltag($_SERVER["REQUEST_URI"]);
        $syslog .= ", query_string=" . dol_escape_htmltag($_SERVER["QUERY_STRING"]);
    } else { // Mode CLI
        $out .= '> ' . $langs->transnoentities("ErrorInternalErrorDetected") . ":\n" . $argv[0] . "\n";
        $syslog .= "pid=" . dol_getmypid();
    }

    if (!empty($conf->modules)) {
        $out .= "<b>" . $langs->trans("Modules") . ":</b> " . implode(', ', $conf->modules) . "<br>\n";
    }

    if (is_object($db)) {
        if ($_SERVER['DOCUMENT_ROOT']) {  // Mode web
            $out .= "<b>" . $langs->trans("DatabaseTypeManager") . ":</b> " . $db->type . "<br>\n";
            $lastqueryerror = $db->lastqueryerror();
            if (!utf8_check($lastqueryerror)) {
                $lastqueryerror = "SQL error string is not a valid UTF8 string. We can't show it.";
            }
            $out .= "<b>" . $langs->trans("RequestLastAccessInError") . ":</b> " . ($lastqueryerror ? dol_escape_htmltag($lastqueryerror) : $langs->trans("ErrorNoRequestInError")) . "<br>\n";
            $out .= "<b>" . $langs->trans("ReturnCodeLastAccessInError") . ":</b> " . ($db->lasterrno() ? dol_escape_htmltag($db->lasterrno()) : $langs->trans("ErrorNoRequestInError")) . "<br>\n";
            $out .= "<b>" . $langs->trans("InformationLastAccessInError") . ":</b> " . ($db->lasterror() ? dol_escape_htmltag($db->lasterror()) : $langs->trans("ErrorNoRequestInError")) . "<br>\n";
            $out .= "<br>\n";
        } else { // Mode CLI
            // No dol_escape_htmltag for output, we are in CLI mode
            $out .= '> ' . $langs->transnoentities("DatabaseTypeManager") . ":\n" . $db->type . "\n";
            $out .= '> ' . $langs->transnoentities("RequestLastAccessInError") . ":\n" . ($db->lastqueryerror() ? $db->lastqueryerror() : $langs->transnoentities("ErrorNoRequestInError")) . "\n";
            $out .= '> ' . $langs->transnoentities("ReturnCodeLastAccessInError") . ":\n" . ($db->lasterrno() ? $db->lasterrno() : $langs->transnoentities("ErrorNoRequestInError")) . "\n";
            $out .= '> ' . $langs->transnoentities("InformationLastAccessInError") . ":\n" . ($db->lasterror() ? $db->lasterror() : $langs->transnoentities("ErrorNoRequestInError")) . "\n";
        }
        $syslog .= ", sql=" . $db->lastquery();
        $syslog .= ", db_error=" . $db->lasterror();
    }

    if ($error || $errors) {
        // Merge all into $errors array
        if (is_array($error) && is_array($errors)) {
            $errors = array_merge($error, $errors);
        } elseif (is_array($error)) {   // deprecated, use second parameters
            $errors = $error;
        } elseif (is_array($errors) && !empty($error)) {
            $errors = array_merge(array($error), $errors);
        } elseif (!empty($error)) {
            $errors = array_merge(array($error), array($errors));
        }

        $langs->load("errors");

        foreach ($errors as $msg) {
            if (empty($msg)) {
                continue;
            }
            if ($_SERVER['DOCUMENT_ROOT']) {  // Mode web
                $out .= "<b>" . $langs->trans("Message") . ":</b> " . dol_escape_htmltag($msg) . "<br>\n";
            } else { // Mode CLI
                $out .= '> ' . $langs->transnoentities("Message") . ":\n" . $msg . "\n";
            }
            $syslog .= ", msg=" . $msg;
        }
    }
    if (empty($dolibarr_main_prod) && $_SERVER['DOCUMENT_ROOT'] && function_exists('xdebug_print_function_stack') && function_exists('xdebug_call_file')) {
        xdebug_print_function_stack();
        $out .= '<b>XDebug information:</b>' . "<br>\n";
        $out .= 'File: ' . xdebug_call_file() . "<br>\n";
        $out .= 'Line: ' . xdebug_call_line() . "<br>\n";
        $out .= 'Function: ' . xdebug_call_function() . "<br>\n";
        $out .= "<br>\n";
    }

    // Return a http header with error code if possible
    if (!headers_sent()) {
        if (function_exists('top_httphead')) {  // In CLI context, the method does not exists
            top_httphead();
        }
        //http_response_code(500);      // If we use 500, message is not output with some command line tools
        http_response_code(202);        // If we use 202, this is not really an error message, but this allow to output message on command line tools
    }

    if (empty($dolibarr_main_prod)) {
        print $out;
    } else {
        if (empty($langs->defaultlang)) {
            $langs->setDefaultLang();
        }
        $langs->loadLangs(array("main", "errors")); // Reload main because language may have been set only on previous line so we have to reload files we need.
        // This should not happen, except if there is a bug somewhere. Enabled and check log in such case.
        print 'This website or feature is currently temporarily not available or failed after a technical error.<br><br>This may be due to a maintenance operation. Current status of operation (' . dol_print_date(dol_now(), 'dayhourrfc') . ') are on next line...<br><br>' . "\n";
        print $langs->trans("DolibarrHasDetectedError") . '. ';
        print $langs->trans("YouCanSetOptionDolibarrMainProdToZero");
        if (!defined("MAIN_CORE_ERROR")) {
            define("MAIN_CORE_ERROR", 1);
        }
    }

    dol_syslog("Error " . $syslog, LOG_ERR);
}

/**
 * Show a public email and error code to contact if technical error
 *
 * @param string $prefixcode Prefix of public error code
 * @param string $errormessage Complete error message
 * @param string[] $errormessages Array of error messages
 * @param string $morecss More css
 * @param string $email Email
 * @return  void
 */
function dol_print_error_email($prefixcode, $errormessage = '', $errormessages = array(), $morecss = 'error', $email = '')
{
    global $langs;

    if (empty($email)) {
        $email = getDolGlobalString('MAIN_INFO_SOCIETE_MAIL');
    }

    $langs->load("errors");
    $now = dol_now();

    print '<br><div class="center login_main_message"><div class="' . $morecss . '">';
    print $langs->trans("ErrorContactEMail", $email, $prefixcode . '-' . dol_print_date($now, '%Y%m%d%H%M%S'));
    if ($errormessage) {
        print '<br><br>' . $errormessage;
    }
    if (is_array($errormessages) && count($errormessages)) {
        foreach ($errormessages as $mesgtoshow) {
            print '<br><br>' . $mesgtoshow;
        }
    }
    print '</div></div>';
}

/**
 *  Show title line of an array
 *
 * @param string $name Label of field
 * @param string $file Url used when we click on sort picto
 * @param string $field Field to use for new sorting
 * @param string $begin ("" by default)
 * @param string $moreparam Add more parameters on sort url links ("" by default)
 * @param string $moreattrib Options of attribute td ("" by default)
 * @param string $sortfield Current field used to sort
 * @param string $sortorder Current sort order
 * @param string $prefix Prefix for css. Use space after prefix to add your own CSS tag, for example 'mycss '.
 * @param string $tooltip Tooltip
 * @param int $forcenowrapcolumntitle No need for use 'wrapcolumntitle' css style
 * @return void
 */
function print_liste_field_titre($name, $file = "", $field = "", $begin = "", $moreparam = "", $moreattrib = "", $sortfield = "", $sortorder = "", $prefix = "", $tooltip = "", $forcenowrapcolumntitle = 0)
{
    print getTitleFieldOfList($name, 0, $file, $field, $begin, $moreparam, $moreattrib, $sortfield, $sortorder, $prefix, 0, $tooltip, $forcenowrapcolumntitle);
}

/**
 *  Get title line of an array
 *
 * @param string $name Translation key of field to show or complete HTML string to show
 * @param int $thead 0=To use with standard table format, 1=To use inside <thead><tr>, 2=To use with <div>
 * @param string $file Url used when we click on sort picto
 * @param string $field Field to use for new sorting. Empty if this field is not sortable. Example "t.abc" or "t.abc,t.def"
 * @param string $begin ("" by default)
 * @param string $moreparam Add more parameters on sort url links ("" by default)
 * @param string $moreattrib Add more attributes on th ("" by default). To add more css class, use param $prefix.
 * @param string $sortfield Current field used to sort (Ex: 'd.datep,d.id')
 * @param string $sortorder Current sort order (Ex: 'asc,desc')
 * @param string $prefix Prefix for css. Use space after prefix to add your own CSS tag, for example 'mycss '.
 * @param int $disablesortlink 1=Disable sort link
 * @param string $tooltip Tooltip
 * @param int $forcenowrapcolumntitle No need for use 'wrapcolumntitle' css style
 * @return string
 */
function getTitleFieldOfList($name, $thead = 0, $file = "", $field = "", $begin = "", $moreparam = "", $moreattrib = "", $sortfield = "", $sortorder = "", $prefix = "", $disablesortlink = 0, $tooltip = '', $forcenowrapcolumntitle = 0)
{
    global $langs, $form;
    //print "$name, $file, $field, $begin, $options, $moreattrib, $sortfield, $sortorder<br>\n";

    if ($moreattrib == 'class="right"') {
        $prefix .= 'right '; // For backward compatibility
    }

    $sortorder = strtoupper($sortorder);
    $out = '';
    $sortimg = '';

    $tag = 'th';
    if ($thead == 2) {
        $tag = 'div';
    }

    $tmpsortfield = explode(',', $sortfield);
    $sortfield1 = trim($tmpsortfield[0]); // If $sortfield is 'd.datep,d.id', it becomes 'd.datep'
    $tmpfield = explode(',', $field);
    $field1 = trim($tmpfield[0]); // If $field is 'd.datep,d.id', it becomes 'd.datep'

    if (!getDolGlobalString('MAIN_DISABLE_WRAPPING_ON_COLUMN_TITLE') && empty($forcenowrapcolumntitle)) {
        $prefix = 'wrapcolumntitle ' . $prefix;
    }

    //var_dump('field='.$field.' field1='.$field1.' sortfield='.$sortfield.' sortfield1='.$sortfield1);
    // If field is used as sort criteria we use a specific css class liste_titre_sel
    // Example if (sortfield,field)=("nom","xxx.nom") or (sortfield,field)=("nom","nom")
    $liste_titre = 'liste_titre';
    if ($field1 && ($sortfield1 == $field1 || $sortfield1 == preg_replace("/^[^\.]+\./", "", $field1))) {
        $liste_titre = 'liste_titre_sel';
    }

    $tagstart = '<' . $tag . ' class="' . $prefix . $liste_titre . '" ' . $moreattrib;
    //$out .= (($field && empty($conf->global->MAIN_DISABLE_WRAPPING_ON_COLUMN_TITLE) && preg_match('/^[a-zA-Z_0-9\s\.\-:&;]*$/', $name)) ? ' title="'.dol_escape_htmltag($langs->trans($name)).'"' : '');
    $tagstart .= ($name && !getDolGlobalString('MAIN_DISABLE_WRAPPING_ON_COLUMN_TITLE') && empty($forcenowrapcolumntitle) && !dol_textishtml($name)) ? ' title="' . dol_escape_htmltag($langs->trans($name)) . '"' : '';
    $tagstart .= '>';

    if (empty($thead) && $field && empty($disablesortlink)) {    // If this is a sort field
        $options = preg_replace('/sortfield=([a-zA-Z0-9,\s\.]+)/i', '', (is_scalar($moreparam) ? $moreparam : ''));
        $options = preg_replace('/sortorder=([a-zA-Z0-9,\s\.]+)/i', '', $options);
        $options = preg_replace('/&+/i', '&', $options);
        if (!preg_match('/^&/', $options)) {
            $options = '&' . $options;
        }

        $sortordertouseinlink = '';
        if ($field1 != $sortfield1) { // We are on another field than current sorted field
            if (preg_match('/^DESC/i', $sortorder)) {
                $sortordertouseinlink .= str_repeat('desc,', count(explode(',', $field)));
            } else { // We reverse the var $sortordertouseinlink
                $sortordertouseinlink .= str_repeat('asc,', count(explode(',', $field)));
            }
        } else { // We are on field that is the first current sorting criteria
            if (preg_match('/^ASC/i', $sortorder)) {    // We reverse the var $sortordertouseinlink
                $sortordertouseinlink .= str_repeat('desc,', count(explode(',', $field)));
            } else {
                $sortordertouseinlink .= str_repeat('asc,', count(explode(',', $field)));
            }
        }
        $sortordertouseinlink = preg_replace('/,$/', '', $sortordertouseinlink);
        $out .= '<a class="reposition" href="' . $file . '?sortfield=' . $field . '&sortorder=' . $sortordertouseinlink . '&begin=' . $begin . $options . '"';
        //$out .= (empty($conf->global->MAIN_DISABLE_WRAPPING_ON_COLUMN_TITLE) ? ' title="'.dol_escape_htmltag($langs->trans($name)).'"' : '');
        $out .= '>';
    }
    if ($tooltip) {
        // You can also use 'TranslationString:keyfortooltiponclick' for a tooltip on click.
        if (preg_match('/:\w+$/', $tooltip)) {
            $tmptooltip = explode(':', $tooltip);
        } else {
            $tmptooltip = array($tooltip);
        }
        $out .= $form->textwithpicto($langs->trans($name), $langs->trans($tmptooltip[0]), 1, 'help', '', 0, 3, (empty($tmptooltip[1]) ? '' : 'extra_' . str_replace('.', '_', $field) . '_' . $tmptooltip[1]));
    } else {
        $out .= $langs->trans($name);
    }

    if (empty($thead) && $field && empty($disablesortlink)) {    // If this is a sort field
        $out .= '</a>';
    }

    if (empty($thead) && $field) {    // If this is a sort field
        $options = preg_replace('/sortfield=([a-zA-Z0-9,\s\.]+)/i', '', (is_scalar($moreparam) ? $moreparam : ''));
        $options = preg_replace('/sortorder=([a-zA-Z0-9,\s\.]+)/i', '', $options);
        $options = preg_replace('/&+/i', '&', $options);
        if (!preg_match('/^&/', $options)) {
            $options = '&' . $options;
        }

        if (!$sortorder || ($field1 != $sortfield1)) {
            //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=asc&begin='.$begin.$options.'">'.img_down("A-Z",0).'</a>';
            //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=desc&begin='.$begin.$options.'">'.img_up("Z-A",0).'</a>';
        } else {
            if (preg_match('/^DESC/', $sortorder)) {
                //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=asc&begin='.$begin.$options.'">'.img_down("A-Z",0).'</a>';
                //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=desc&begin='.$begin.$options.'">'.img_up("Z-A",1).'</a>';
                $sortimg .= '<span class="nowrap">' . img_up("Z-A", 0, 'paddingright') . '</span>';
            }
            if (preg_match('/^ASC/', $sortorder)) {
                //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=asc&begin='.$begin.$options.'">'.img_down("A-Z",1).'</a>';
                //$out.= '<a href="'.$file.'?sortfield='.$field.'&sortorder=desc&begin='.$begin.$options.'">'.img_up("Z-A",0).'</a>';
                $sortimg .= '<span class="nowrap">' . img_down("A-Z", 0, 'paddingright') . '</span>';
            }
        }
    }

    $tagend = '</' . $tag . '>';

    $out = $tagstart . $sortimg . $out . $tagend;

    return $out;
}

/**
 *  Show a title.
 *
 * @param string $title Title to show
 * @return void
 * @deprecated                     Use load_fiche_titre instead
 * @see load_fiche_titre()
 */
function print_titre($title)
{
    dol_syslog(__FUNCTION__ . " is deprecated", LOG_WARNING);

    print '<div class="titre">' . $title . '</div>';
}

/**
 *  Show a title with picto
 *
 * @param string $title Title to show
 * @param string $mesg Added message to show on right
 * @param string $picto Icon to use before title (should be a 32x32 transparent png file)
 * @param int $pictoisfullpath 1=Icon name is a full absolute url of image
 * @param string $id To force an id on html objects by example id="name" where name is id
 * @return void
 * @deprecated Use print load_fiche_titre instead
 */
function print_fiche_titre($title, $mesg = '', $picto = 'generic', $pictoisfullpath = 0, $id = '')
{
    print load_fiche_titre($title, $mesg, $picto, $pictoisfullpath, $id);
}

/**
 *  Load a title with picto
 *
 * @param string $title Title to show (HTML sanitized content)
 * @param string $morehtmlright Added message to show on right
 * @param string $picto Icon to use before title (should be a 32x32 transparent png file)
 * @param int $pictoisfullpath 1=Icon name is a full absolute url of image
 * @param string $id To force an id on html objects
 * @param string $morecssontable More css on table
 * @param string $morehtmlcenter Added message to show on center
 * @return string
 * @see print_barre_liste()
 */
function load_fiche_titre($title, $morehtmlright = '', $picto = 'generic', $pictoisfullpath = 0, $id = '', $morecssontable = '', $morehtmlcenter = '')
{
    $return = '';

    if ($picto == 'setup') {
        $picto = 'generic';
    }

    $return .= "\n";
    $return .= '<table ' . ($id ? 'id="' . $id . '" ' : '') . 'class="centpercent notopnoleftnoright table-fiche-title' . ($morecssontable ? ' ' . $morecssontable : '') . '">'; // maring bottom must be same than into print_barre_list
    $return .= '<tr class="titre">';
    if ($picto) {
        $return .= '<td class="nobordernopadding widthpictotitle valignmiddle col-picto">' . img_picto('', $picto, 'class="valignmiddle widthpictotitle pictotitle"', $pictoisfullpath) . '</td>';
    }
    $return .= '<td class="nobordernopadding valignmiddle col-title">';
    $return .= '<div class="titre inline-block">';
    $return .= $title;  // $title is already HTML sanitized content
    $return .= '</div>';
    $return .= '</td>';
    if (dol_strlen($morehtmlcenter)) {
        $return .= '<td class="nobordernopadding center valignmiddle col-center">' . $morehtmlcenter . '</td>';
    }
    if (dol_strlen($morehtmlright)) {
        $return .= '<td class="nobordernopadding titre_right wordbreakimp right valignmiddle col-right">' . $morehtmlright . '</td>';
    }
    $return .= '</tr></table>' . "\n";

    return $return;
}

/**
 *  Print a title with navigation controls for pagination
 *
 * @param string $title Title to show (required)
 * @param int|null $page Numero of page to show in navigation links (required)
 * @param string $file Url of page (required)
 * @param string $options More parameters for links ('' by default, does not include sortfield neither sortorder). Value must be 'urlencoded' before calling function.
 * @param string $sortfield Field to sort on ('' by default)
 * @param string $sortorder Order to sort ('' by default)
 * @param string $morehtmlcenter String in the middle ('' by default). We often find here string $massaction coming from $form->selectMassAction()
 * @param int $num Number of records found by select with limit+1
 * @param int|string $totalnboflines Total number of records/lines for all pages (if known). Use a negative value of number to not show number. Use '' if unknown.
 * @param string $picto Icon to use before title (should be a 32x32 transparent png file)
 * @param int $pictoisfullpath 1=Icon name is a full absolute url of image
 * @param string $morehtmlright More html to show (after arrows)
 * @param string $morecss More css to the table
 * @param int $limit Max number of lines (-1 = use default, 0 = no limit, > 0 = limit).
 * @param int $hideselectlimit Force to hide select limit
 * @param int $hidenavigation Force to hide the arrows and page for navigation
 * @param int $pagenavastextinput 1=Do not suggest list of pages to navigate but suggest the page number into an input field.
 * @param string $morehtmlrightbeforearrow More html to show (before arrows)
 * @return void
 */
function print_barre_liste($title, $page, $file, $options = '', $sortfield = '', $sortorder = '', $morehtmlcenter = '', $num = -1, $totalnboflines = '', $picto = 'generic', $pictoisfullpath = 0, $morehtmlright = '', $morecss = '', $limit = -1, $hideselectlimit = 0, $hidenavigation = 0, $pagenavastextinput = 0, $morehtmlrightbeforearrow = '')
{
    global $conf;

    $savlimit = $limit;
    $savtotalnboflines = $totalnboflines;
    if (is_numeric($totalnboflines)) {
        $totalnboflines = abs($totalnboflines);
    }

    $page = (int)$page;

    if ($picto == 'setup') {
        $picto = 'title_setup.png';
    }
    if (($conf->browser->name == 'ie') && $picto == 'generic') {
        $picto = 'title.gif';
    }
    if ($limit < 0) {
        $limit = $conf->liste_limit;
    }

    if ($savlimit != 0 && (($num > $limit) || ($num == -1) || ($limit == 0))) {
        $nextpage = 1;
    } else {
        $nextpage = 0;
    }
    //print 'totalnboflines='.$totalnboflines.'-savlimit='.$savlimit.'-limit='.$limit.'-num='.$num.'-nextpage='.$nextpage.'-hideselectlimit='.$hideselectlimit.'-hidenavigation='.$hidenavigation;

    print "\n";
    print "<!-- Begin title -->\n";
    print '<table class="centpercent notopnoleftnoright table-fiche-title' . ($morecss ? ' ' . $morecss : '') . '"><tr>'; // maring bottom must be same than into load_fiche_tire

    // Left

    if ($picto && $title) {
        print '<td class="nobordernopadding widthpictotitle valignmiddle col-picto">' . img_picto('', $picto, 'class="valignmiddle pictotitle widthpictotitle"', $pictoisfullpath) . '</td>';
    }

    print '<td class="nobordernopadding valignmiddle col-title">';
    print '<div class="titre inline-block">';
    print $title;   // $title may contains HTML
    if (!empty($title) && $savtotalnboflines >= 0 && (string)$savtotalnboflines != '') {
        print '<span class="opacitymedium colorblack paddingleft">(' . $totalnboflines . ')</span>';
    }
    print '</div></td>';

    // Center
    if ($morehtmlcenter && empty($conf->dol_optimize_smallscreen)) {
        print '<td class="nobordernopadding center valignmiddle col-center">' . $morehtmlcenter . '</td>';
    }

    // Right
    print '<td class="nobordernopadding valignmiddle right col-right">';
    print '<input type="hidden" name="pageplusoneold" value="' . ((int)$page + 1) . '">';
    if ($sortfield) {
        $options .= "&sortfield=" . urlencode($sortfield);
    }
    if ($sortorder) {
        $options .= "&sortorder=" . urlencode($sortorder);
    }
    // Show navigation bar
    $pagelist = '';
    if ($savlimit != 0 && ($page > 0 || $num > $limit)) {
        if ($totalnboflines) {  // If we know total nb of lines
            // Define nb of extra page links before and after selected page + ... + first or last
            $maxnbofpage = (empty($conf->dol_optimize_smallscreen) ? 4 : 0);

            if ($limit > 0) {
                $nbpages = ceil($totalnboflines / $limit);
            } else {
                $nbpages = 1;
            }
            $cpt = ($page - $maxnbofpage);
            if ($cpt < 0) {
                $cpt = 0;
            }

            if ($cpt >= 1) {
                if (empty($pagenavastextinput)) {
                    $pagelist .= '<li class="pagination"><a class="reposition" href="' . $file . '?page=0' . $options . '">1</a></li>';
                    if ($cpt > 2) {
                        $pagelist .= '<li class="pagination"><span class="inactive">...</span></li>';
                    } elseif ($cpt == 2) {
                        $pagelist .= '<li class="pagination"><a class="reposition" href="' . $file . '?page=1' . $options . '">2</a></li>';
                    }
                }
            }

            do {
                if ($pagenavastextinput) {
                    if ($cpt == $page) {
                        $pagelist .= '<li class="pagination"><input type="text" class="' . ($totalnboflines > 100 ? 'width40' : 'width25') . ' center pageplusone" name="pageplusone" value="' . ($page + 1) . '"></li>';
                        $pagelist .= '/';
                    }
                } else {
                    if ($cpt == $page) {
                        $pagelist .= '<li class="pagination"><span class="active">' . ($page + 1) . '</span></li>';
                    } else {
                        $pagelist .= '<li class="pagination"><a class="reposition" href="' . $file . '?page=' . $cpt . $options . '">' . ($cpt + 1) . '</a></li>';
                    }
                }
                $cpt++;
            } while ($cpt < $nbpages && $cpt <= ($page + $maxnbofpage));

            if (empty($pagenavastextinput)) {
                if ($cpt < $nbpages) {
                    if ($cpt < $nbpages - 2) {
                        $pagelist .= '<li class="pagination"><span class="inactive">...</span></li>';
                    } elseif ($cpt == $nbpages - 2) {
                        $pagelist .= '<li class="pagination"><a class="reposition" href="' . $file . '?page=' . ($nbpages - 2) . $options . '">' . ($nbpages - 1) . '</a></li>';
                    }
                    $pagelist .= '<li class="pagination"><a class="reposition" href="' . $file . '?page=' . ($nbpages - 1) . $options . '">' . $nbpages . '</a></li>';
                }
            } else {
                //var_dump($page.' '.$cpt.' '.$nbpages);
                $pagelist .= '<li class="pagination paginationlastpage"><a class="reposition" href="' . $file . '?page=' . ($nbpages - 1) . $options . '">' . $nbpages . '</a></li>';
            }
        } else {
            $pagelist .= '<li class="pagination"><span class="active">' . ($page + 1) . "</li>";
        }
    }

    if ($savlimit || $morehtmlright || $morehtmlrightbeforearrow) {
        print_fleche_navigation($page, $file, $options, $nextpage, $pagelist, $morehtmlright, $savlimit, $totalnboflines, $hideselectlimit, $morehtmlrightbeforearrow, $hidenavigation); // output the div and ul for previous/last completed with page numbers into $pagelist
    }

    // js to autoselect page field on focus
    if ($pagenavastextinput) {
        print ajax_autoselect('.pageplusone');
    }

    print '</td>';
    print '</tr>';

    print '</table>' . "\n";

    // Center
    if ($morehtmlcenter && !empty($conf->dol_optimize_smallscreen)) {
        print '<div class="nobordernopadding marginbottomonly center valignmiddle col-center centpercent">' . $morehtmlcenter . '</div>';
    }

    print "<!-- End title -->\n\n";
}

/**
 *  Function to show navigation arrows into lists
 *
 * @param int $page Number of page
 * @param string $file Page URL (in most cases provided with $_SERVER["PHP_SELF"])
 * @param string $options Other url parameters to propagate ("" by default, may include sortfield and sortorder)
 * @param integer $nextpage Do we show a next page button
 * @param string $betweenarrows HTML content to show between arrows. MUST contains '<li> </li>' tags or '<li><span> </span></li>'.
 * @param string $afterarrows HTML content to show after arrows. Must NOT contains '<li> </li>' tags.
 * @param int $limit Max nb of record to show  (-1 = no combo with limit, 0 = no limit, > 0 = limit)
 * @param int $totalnboflines Total number of records/lines for all pages (if known)
 * @param int $hideselectlimit Force to hide select limit
 * @param string $beforearrows HTML content to show before arrows. Must NOT contains '<li> </li>' tags.
 * @param int $hidenavigation Force to hide the switch mode view and the navigation tool (hide limit section, html in $betweenarrows and $afterarrows but not $beforearrows)
 * @return void
 */
function print_fleche_navigation($page, $file, $options = '', $nextpage = 0, $betweenarrows = '', $afterarrows = '', $limit = -1, $totalnboflines = 0, $hideselectlimit = 0, $beforearrows = '', $hidenavigation = 0)
{
    global $conf, $langs;

    print '<div class="pagination"><ul>';
    if ($beforearrows) {
        print '<li class="paginationbeforearrows">';
        print $beforearrows;
        print '</li>';
    }

    if (empty($hidenavigation)) {
        if ((int)$limit > 0 && empty($hideselectlimit)) {
            $pagesizechoices = '10:10,15:15,20:20,25:25,50:50,100:100,250:250,500:500,1000:1000';
            $pagesizechoices .= ',5000:5000,10000:10000,20000:20000';
            //$pagesizechoices.=',0:'.$langs->trans("All");     // Not yet supported
            //$pagesizechoices.=',2:2';
            if (getDolGlobalString('MAIN_PAGESIZE_CHOICES')) {
                $pagesizechoices = getDolGlobalString('MAIN_PAGESIZE_CHOICES');
            }

            if (getDolGlobalString('MAIN_USE_HTML5_LIMIT_SELECTOR')) {
                print '<li class="pagination">';
                print '<input onfocus="this.value=null;" onchange="this.blur();" class="flat selectlimit nopadding maxwidth75 right pageplusone" id="limit" name="limit" list="limitlist" title="' . dol_escape_htmltag($langs->trans("MaxNbOfRecordPerPage")) . '" value="' . $limit . '">';
                print '<datalist id="limitlist">';
            } else {
                print '<li class="paginationxxx valignmiddle">';
                print '<select id="limit" class="flat selectlimit nopadding maxwidth75 center" name="limit" title="' . dol_escape_htmltag($langs->trans("MaxNbOfRecordPerPage")) . '">';
            }
            $tmpchoice = explode(',', $pagesizechoices);
            $tmpkey = $limit . ':' . $limit;
            if (!in_array($tmpkey, $tmpchoice)) {
                $tmpchoice[] = $tmpkey;
            }
            $tmpkey = $conf->liste_limit . ':' . $conf->liste_limit;
            if (!in_array($tmpkey, $tmpchoice)) {
                $tmpchoice[] = $tmpkey;
            }
            asort($tmpchoice, SORT_NUMERIC);
            foreach ($tmpchoice as $val) {
                $selected = '';
                $tmp = explode(':', $val);
                $key = $tmp[0];
                $val = $tmp[1];
                if ($key != '' && $val != '') {
                    if ((int)$key == (int)$limit) {
                        $selected = ' selected="selected"';
                    }
                    print '<option name="' . $key . '"' . $selected . '>' . dol_escape_htmltag($val) . '</option>' . "\n";
                }
            }
            if (getDolGlobalString('MAIN_USE_HTML5_LIMIT_SELECTOR')) {
                print '</datalist>';
            } else {
                print '</select>';
                print ajax_combobox("limit", array(), 0, 0, 'resolve', -1, 'limit');
                //print ajax_combobox("limit");
            }

            if ($conf->use_javascript_ajax) {
                print '<!-- JS CODE TO ENABLE select limit to launch submit of page -->
	            		<script>
	                	jQuery(document).ready(function () {
	            	  		jQuery(".selectlimit").change(function() {
	                            console.log("Change limit. Send submit");
	                            $(this).parents(\'form:first\').submit();
	            	  		});
	                	});
	            		</script>
	                ';
            }
            print '</li>';
        }
        if ($page > 0) {
            print '<li class="pagination paginationpage paginationpageleft"><a class="paginationprevious reposition" href="' . $file . '?page=' . ($page - 1) . $options . '"><i class="fa fa-chevron-left" title="' . dol_escape_htmltag($langs->trans("Previous")) . '"></i></a></li>';
        }
        if ($betweenarrows) {
            print '<!--<div class="betweenarrows nowraponall inline-block">-->';
            print $betweenarrows;
            print '<!--</div>-->';
        }
        if ($nextpage > 0) {
            print '<li class="pagination paginationpage paginationpageright"><a class="paginationnext reposition" href="' . $file . '?page=' . ($page + 1) . $options . '"><i class="fa fa-chevron-right" title="' . dol_escape_htmltag($langs->trans("Next")) . '"></i></a></li>';
        }
        if ($afterarrows) {
            print '<li class="paginationafterarrows">';
            print $afterarrows;
            print '</li>';
        }
    }
    print '</ul></div>' . "\n";
}

/**
 * Displays an error page when a record is not found. It allows customization of the message,
 * whether to include the header and footer, and if only the message should be shown without additional details.
 * The function also supports executing additional hooks for customized handling of error pages.
 *
 * @param string $message Custom error message to display. If empty, a default "Record Not Found" message is shown.
 * @param int<0,1> $printheader Determines if the page header should be printed (1 = yes, 0 = no).
 * @param int<0,1> $printfooter Determines if the page footer should be printed (1 = yes, 0 = no).
 * @param int<0,1> $showonlymessage If set to 1, only the error message is displayed without any additional information or hooks.
 * @param mixed $params Optional parameters to pass to hooks for further processing or customization.
 * @return void This function terminates script execution after outputting the error page.
 * @global Conf $conf Dolibarr configuration object (global)
 * @global DoliDB $db Database connection object (global)
 * @global User $user Current user object (global)
 * @global Translate $langs Language translation object, initialized within the function if not already.
 * @global HookManager $hookmanager Hook manager object, initialized within the function if not already for executing hooks.
 * @global string $action Current action, can be modified by hooks.
 * @global object $object Current object, can be modified by hooks.
 */
function recordNotFound($message = '', $printheader = 1, $printfooter = 1, $showonlymessage = 0, $params = null)
{
    global $conf, $db, $langs, $hookmanager;
    global $action, $object;

    if (!is_object($langs)) {
        $langs = new Translate('', $conf);
        $langs->setDefaultLang();
    }

    $langs->load("errors");

    if ($printheader) {
        if (function_exists("llxHeader")) {
            llxHeader('');
        } elseif (function_exists("llxHeaderVierge")) {
            llxHeaderVierge('');
        }
    }

    print '<div class="error">';
    if (empty($message)) {
        print $langs->trans("ErrorRecordNotFound");
    } else {
        print $langs->trans($message);
    }
    print '</div>';
    print '<br>';

    if (empty($showonlymessage)) {
        if (empty($hookmanager)) {
            $hookmanager = new HookManager($db);
            // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
            $hookmanager->initHooks(array('main'));
        }

        $parameters = array('message' => $message, 'params' => $params);
        $reshook = $hookmanager->executeHooks('getErrorRecordNotFound', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
        print $hookmanager->resPrint;
    }

    if ($printfooter && function_exists("llxFooter")) {
        llxFooter();
    }
    exit(0);
}

/**
 *  Show html area with actions in messaging format.
 *  Note: Global parameter $param must be defined.
 *
 * @param Conf $conf Object conf
 * @param Translate $langs Object langs
 * @param DoliDB $db Object db
 * @param  ?CommonObject $filterobj Filter on object Adherent|Societe|Project|Product|CommandeFournisseur|Dolresource|Ticket|... to list events linked to an object
 * @param  ?Contact $objcon Filter on object contact to filter events on a contact
 * @param int $noprint Return string but does not output it
 * @param string $actioncode Filter on actioncode
 * @param string $donetodo Filter on event 'done' or 'todo' or ''=nofilter (all).
 * @param array<string,string> $filters Filter on other fields
 * @param string $sortfield Sort field
 * @param string $sortorder Sort order
 * @return string|void                     Return html part or void if noprint is 1
 */
function show_actions_messaging($conf, $langs, $db, $filterobj, $objcon = null, $noprint = 0, $actioncode = '', $donetodo = 'done', $filters = array(), $sortfield = 'a.datep,a.id', $sortorder = 'DESC')
{
    global $user, $conf;
    global $form;

    global $param, $massactionbutton;


    // Check parameters
    if (!is_object($filterobj) && !is_object($objcon)) {
        dol_print_error(null, 'BadParameter');
    }

    $histo = array();
    '@phan-var-force array<int,array{type:string,tododone:string,id:string,datestart:int|string,dateend:int|string,note:string,message:string,percent:string,userid:string,login:string,userfirstname:string,userlastname:string,userphoto:string,msg_from?:string,contact_id?:string,socpeopleassigned?:int[],lastname?:string,firstname?:string,fk_element?:int,elementtype?:string,acode:string,alabel?:string,libelle?:string,apicto?:string}> $histo';

    $numaction = 0;
    $now = dol_now();

    $sortfield_list = explode(',', $sortfield);
    $sortfield_label_list = array('a.id' => 'id', 'a.datep' => 'dp', 'a.percent' => 'percent');
    $sortfield_new_list = array();
    foreach ($sortfield_list as $sortfield_value) {
        $sortfield_new_list[] = $sortfield_label_list[trim($sortfield_value)];
    }
    $sortfield_new = implode(',', $sortfield_new_list);

    $sql = null;
    $sql2 = null;

    if (isModEnabled('agenda')) {
        // Search histo on actioncomm
        if (is_object($objcon) && $objcon->id > 0) {
            $sql = "SELECT DISTINCT a.id, a.label as label,";
        } else {
            $sql = "SELECT a.id, a.label as label,";
        }
        $sql .= " a.datep as dp,";
        $sql .= " a.note as message,";
        $sql .= " a.datep2 as dp2,";
        $sql .= " a.percent as percent, 'action' as type,";
        $sql .= " a.fk_element, a.elementtype,";
        $sql .= " a.fk_contact,";
        $sql .= " a.email_from as msg_from,";
        $sql .= " c.code as acode, c.libelle as alabel, c.picto as apicto,";
        $sql .= " u.rowid as user_id, u.login as user_login, u.photo as user_photo, u.firstname as user_firstname, u.lastname as user_lastname";
        if (is_object($filterobj) && get_only_class($filterobj) == 'Societe') {
            $sql .= ", sp.lastname, sp.firstname";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Adherent') {
            $sql .= ", m.lastname, m.firstname";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'CommandeFournisseur') {
            $sql .= ", o.ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Product') {
            $sql .= ", o.ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Ticket') {
            $sql .= ", o.ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'BOM') {
            $sql .= ", o.ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Contrat') {
            $sql .= ", o.ref";
        }
        $sql .= " FROM " . MAIN_DB_PREFIX . "actioncomm as a";
        $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "user as u on u.rowid = a.fk_user_action";
        $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "c_actioncomm as c ON a.fk_action = c.id";

        $force_filter_contact = $filterobj instanceof User;

        if (is_object($objcon) && $objcon->id > 0) {
            $force_filter_contact = true;
            $sql .= " INNER JOIN " . MAIN_DB_PREFIX . "actioncomm_resources as r ON a.id = r.fk_actioncomm";
            $sql .= " AND r.element_type = '" . $db->escape($objcon->table_element) . "' AND r.fk_element = " . ((int)$objcon->id);
        }

        if (is_object($filterobj) && get_only_class($filterobj) == 'Societe') {
            $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "socpeople as sp ON a.fk_contact = sp.rowid";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Dolresource') {
            $sql .= " INNER JOIN " . MAIN_DB_PREFIX . "element_resources as er";
            $sql .= " ON er.resource_type = 'dolresource'";
            $sql .= " AND er.element_id = a.id";
            $sql .= " AND er.resource_id = " . ((int)$filterobj->id);
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Adherent') {
            $sql .= ", " . MAIN_DB_PREFIX . "adherent as m";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'CommandeFournisseur') {
            $sql .= ", " . MAIN_DB_PREFIX . "commande_fournisseur as o";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Product') {
            $sql .= ", " . MAIN_DB_PREFIX . "product as o";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Ticket') {
            $sql .= ", " . MAIN_DB_PREFIX . "ticket as o";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'BOM') {
            $sql .= ", " . MAIN_DB_PREFIX . "bom_bom as o";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Contrat') {
            $sql .= ", " . MAIN_DB_PREFIX . "contrat as o";
        }

        $sql .= " WHERE a.entity IN (" . getEntity('agenda') . ")";
        if (!$force_filter_contact) {
            if (is_object($filterobj) && in_array(get_only_class($filterobj), array('Societe', 'Client', 'Fournisseur')) && $filterobj->id) {
                $sql .= " AND a.fk_soc = " . ((int)$filterobj->id);
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Project' && $filterobj->id) {
                $sql .= " AND a.fk_project = " . ((int)$filterobj->id);
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Adherent') {
                $sql .= " AND a.fk_element = m.rowid AND a.elementtype = 'member'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'CommandeFournisseur') {
                $sql .= " AND a.fk_element = o.rowid AND a.elementtype = 'order_supplier'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Product') {
                $sql .= " AND a.fk_element = o.rowid AND a.elementtype = 'product'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Ticket') {
                $sql .= " AND a.fk_element = o.rowid AND a.elementtype = 'ticket'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'BOM') {
                $sql .= " AND a.fk_element = o.rowid AND a.elementtype = 'bom'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Contrat') {
                $sql .= " AND a.fk_element = o.rowid AND a.elementtype = 'contract'";
                if ($filterobj->id) {
                    $sql .= " AND a.fk_element = " . ((int)$filterobj->id);
                }
            }
        } else {
            $sql .= " AND u.rowid = " . ((int)$filterobj->id);
        }

        // Condition on actioncode
        if (!empty($actioncode)) {
            if (!getDolGlobalString('AGENDA_USE_EVENT_TYPE')) {
                if ($actioncode == 'AC_NON_AUTO') {
                    $sql .= " AND c.type != 'systemauto'";
                } elseif ($actioncode == 'AC_ALL_AUTO') {
                    $sql .= " AND c.type = 'systemauto'";
                } else {
                    if ($actioncode == 'AC_OTH') {
                        $sql .= " AND c.type != 'systemauto'";
                    } elseif ($actioncode == 'AC_OTH_AUTO') {
                        $sql .= " AND c.type = 'systemauto'";
                    }
                }
            } else {
                if ($actioncode == 'AC_NON_AUTO') {
                    $sql .= " AND c.type != 'systemauto'";
                } elseif ($actioncode == 'AC_ALL_AUTO') {
                    $sql .= " AND c.type = 'systemauto'";
                } else {
                    $sql .= " AND c.code = '" . $db->escape($actioncode) . "'";
                }
            }
        }
        if ($donetodo == 'todo') {
            $sql .= " AND ((a.percent >= 0 AND a.percent < 100) OR (a.percent = -1 AND a.datep > '" . $db->idate($now) . "'))";
        } elseif ($donetodo == 'done') {
            $sql .= " AND (a.percent = 100 OR (a.percent = -1 AND a.datep <= '" . $db->idate($now) . "'))";
        }
        if (is_array($filters) && $filters['search_agenda_label']) {
            $sql .= natural_search('a.label', $filters['search_agenda_label']);
        }
    }

    // Add also event from emailings. TODO This should be replaced by an automatic event ? May be it's too much for very large emailing.
    if (
        isModEnabled('mailing') && !empty($objcon->email)
        && (empty($actioncode) || $actioncode == 'AC_OTH_AUTO' || $actioncode == 'AC_EMAILING')
    ) {
        $langs->load("mails");

        $sql2 = "SELECT m.rowid as id, m.titre as label, mc.date_envoi as dp, mc.date_envoi as dp2, '100' as percent, 'mailing' as type";
        $sql2 .= ", null as fk_element, '' as elementtype, null as contact_id";
        $sql2 .= ", 'AC_EMAILING' as acode, '' as alabel, '' as apicto";
        $sql2 .= ", u.rowid as user_id, u.login as user_login, u.photo as user_photo, u.firstname as user_firstname, u.lastname as user_lastname"; // User that valid action
        if (is_object($filterobj) && get_only_class($filterobj) == 'Societe') {
            $sql2 .= ", '' as lastname, '' as firstname";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Adherent') {
            $sql2 .= ", '' as lastname, '' as firstname";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'CommandeFournisseur') {
            $sql2 .= ", '' as ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Product') {
            $sql2 .= ", '' as ref";
        } elseif (is_object($filterobj) && get_only_class($filterobj) == 'Ticket') {
            $sql2 .= ", '' as ref";
        }
        $sql2 .= " FROM " . MAIN_DB_PREFIX . "mailing as m, " . MAIN_DB_PREFIX . "mailing_cibles as mc, " . MAIN_DB_PREFIX . "user as u";
        $sql2 .= " WHERE mc.email = '" . $db->escape($objcon->email) . "'"; // Search is done on email.
        $sql2 .= " AND mc.statut = 1";
        $sql2 .= " AND u.rowid = m.fk_user_valid";
        $sql2 .= " AND mc.fk_mailing=m.rowid";
    }

    if ($sql || $sql2) {    // May not be defined if module Agenda is not enabled and mailing module disabled too
        if (!empty($sql) && !empty($sql2)) {
            $sql = $sql . " UNION " . $sql2;
        } elseif (empty($sql) && !empty($sql2)) {
            $sql = $sql2;
        }

        //TODO Add navigation with this limits...
        $offset = 0;
        $limit = 1000;

        // Complete request and execute it with limit
        $sql .= $db->order($sortfield_new, $sortorder);
        if ($limit) {
            $sql .= $db->plimit($limit + 1, $offset);
        }

        dol_syslog("function.lib::show_actions_messaging", LOG_DEBUG);
        $resql = $db->query($sql);
        if ($resql) {
            $i = 0;
            $num = $db->num_rows($resql);

            $imaxinloop = ($limit ? min($num, $limit) : $num);
            while ($i < $imaxinloop) {
                $obj = $db->fetch_object($resql);

                if ($obj->type == 'action') {
                    $contactaction = new ActionComm($db);
                    $contactaction->id = $obj->id;
                    $result = $contactaction->fetchResources();
                    if ($result < 0) {
                        dol_print_error($db);
                        setEventMessage("actions.lib::show_actions_messaging Error fetch resource", 'errors');
                    }

                    //if ($donetodo == 'todo') $sql.= " AND ((a.percent >= 0 AND a.percent < 100) OR (a.percent = -1 AND a.datep > '".$db->idate($now)."'))";
                    //elseif ($donetodo == 'done') $sql.= " AND (a.percent = 100 OR (a.percent = -1 AND a.datep <= '".$db->idate($now)."'))";
                    $tododone = '';
                    if (($obj->percent >= 0 and $obj->percent < 100) || ($obj->percent == -1 && $obj->dp > $now)) {
                        $tododone = 'todo';
                    }

                    $histo[$numaction] = array(
                        'type' => $obj->type,
                        'tododone' => $tododone,
                        'id' => $obj->id,
                        'datestart' => $db->jdate($obj->dp),
                        'dateend' => $db->jdate($obj->dp2),
                        'note' => $obj->label,
                        'message' => dol_htmlentitiesbr($obj->message),
                        'percent' => $obj->percent,

                        'userid' => $obj->user_id,
                        'login' => $obj->user_login,
                        'userfirstname' => $obj->user_firstname,
                        'userlastname' => $obj->user_lastname,
                        'userphoto' => $obj->user_photo,
                        'msg_from' => $obj->msg_from,

                        'contact_id' => $obj->fk_contact,
                        'socpeopleassigned' => $contactaction->socpeopleassigned,
                        'lastname' => (empty($obj->lastname) ? '' : $obj->lastname),
                        'firstname' => (empty($obj->firstname) ? '' : $obj->firstname),
                        'fk_element' => $obj->fk_element,
                        'elementtype' => $obj->elementtype,
                        // Type of event
                        'acode' => $obj->acode,
                        'alabel' => $obj->alabel,
                        'libelle' => $obj->alabel, // deprecated
                        'apicto' => $obj->apicto
                    );
                } else {
                    $histo[$numaction] = array(
                        'type' => $obj->type,
                        'tododone' => 'done',
                        'id' => $obj->id,
                        'datestart' => $db->jdate($obj->dp),
                        'dateend' => $db->jdate($obj->dp2),
                        'note' => $obj->label,
                        'message' => dol_htmlentitiesbr($obj->message),
                        'percent' => $obj->percent,
                        'acode' => $obj->acode,

                        'userid' => $obj->user_id,
                        'login' => $obj->user_login,
                        'userfirstname' => $obj->user_firstname,
                        'userlastname' => $obj->user_lastname,
                        'userphoto' => $obj->user_photo
                    );
                }

                $numaction++;
                $i++;
            }
        } else {
            dol_print_error($db);
        }
    }

    // Set $out to show events
    $out = '';

    if (!isModEnabled('agenda')) {
        $langs->loadLangs(array("admin", "errors"));
        $out = info_admin($langs->trans("WarningModuleXDisabledSoYouMayMissEventHere", $langs->transnoentitiesnoconv("Module2400Name")), 0, 0, 'warning');
    }

    if (isModEnabled('agenda') || (isModEnabled('mailing') && !empty($objcon->email))) {
        $delay_warning = $conf->global->MAIN_DELAY_ACTIONS_TODO * 24 * 60 * 60;

        include_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

        $formactions = new FormActions($db);
        $actionstatic = new ActionComm($db);
        $userstatic = new User($db);
        $contactstatic = new Contact($db);
        $userGetNomUrlCache = array();
        $contactGetNomUrlCache = array();

        $out .= '<div class="filters-container" >';
        $out .= '<form name="listactionsfilter" class="listactionsfilter" action="' . $_SERVER["PHP_SELF"] . '" method="POST">';
        $out .= '<input type="hidden" name="token" value="' . newToken() . '">';

        if (
            $objcon && get_only_class($objcon) == 'Contact' &&
            (is_null($filterobj) || get_only_class($filterobj) == 'Societe')
        ) {
            $out .= '<input type="hidden" name="id" value="' . $objcon->id . '" />';
        } else {
            $out .= '<input type="hidden" name="id" value="' . $filterobj->id . '" />';
        }
        if (($filterobj && get_only_class($filterobj) == 'Societe')) {
            $out .= '<input type="hidden" name="socid" value="' . $filterobj->id . '" />';
        } else {
            $out .= '<input type="hidden" name="userid" value="' . $filterobj->id . '" />';
        }

        $out .= "\n";

        $out .= '<div class="div-table-responsive-no-min">';
        $out .= '<table class="noborder borderbottom centpercent">';

        $out .= '<tr class="liste_titre">';

        // Action column
        if (getDolGlobalString('MAIN_CHECKBOX_LEFT_COLUMN')) {
            $out .= '<th class="liste_titre width50 middle">';
            $searchpicto = $form->showFilterAndCheckAddButtons($massactionbutton ? 1 : 0, 'checkforselect', 1);
            $out .= $searchpicto;
            $out .= '</th>';
        }

        $out .= getTitleFieldOfList('Date', 0, $_SERVER["PHP_SELF"], 'a.datep', '', $param, '', $sortfield, $sortorder, '') . "\n";

        $out .= '<th class="liste_titre"><strong class="hideonsmartphone">' . $langs->trans("Search") . ' : </strong></th>';
        if ($donetodo) {
            $out .= '<th class="liste_titre"></th>';
        }
        $out .= '<th class="liste_titre">';
        $out .= '<span class="fas fa-square inline-block fawidth30" style=" color: #ddd;" title="' . $langs->trans("ActionType") . '"></span>';
        //$out .= img_picto($langs->trans("Type"), 'type');
        $out .= $formactions->select_type_actions($actioncode, "actioncode", '', !getDolGlobalString('AGENDA_USE_EVENT_TYPE') ? 1 : -1, 0, 0, 1, 'minwidth200imp');
        $out .= '</th>';
        $out .= '<th class="liste_titre maxwidth100onsmartphone">';
        $out .= '<input type="text" class="maxwidth100onsmartphone" name="search_agenda_label" value="' . $filters['search_agenda_label'] . '" placeholder="' . $langs->trans("Label") . '">';
        $out .= '</th>';

        // Action column
        if (!getDolGlobalString('MAIN_CHECKBOX_LEFT_COLUMN')) {
            $out .= '<th class="liste_titre width50 middle">';
            $searchpicto = $form->showFilterAndCheckAddButtons($massactionbutton ? 1 : 0, 'checkforselect', 1);
            $out .= $searchpicto;
            $out .= '</th>';
        }

        $out .= '</tr>';


        $out .= '</table>';

        $out .= '</form>';
        $out .= '</div>';

        $out .= "\n";

        $out .= '<ul class="timeline">';

        if ($donetodo) {
            $tmp = '';
            if ($filterobj instanceof Societe) {
                $tmp .= '<a href="' . constant('BASE_URL') . '/comm/action/list.php?mode=show_list&socid=' . $filterobj->id . '&status=done">';
            }
            if ($filterobj instanceof User) {
                $tmp .= '<a href="' . constant('BASE_URL') . '/comm/action/list.php?mode=show_list&socid=' . $filterobj->id . '&status=done">';
            }
            $tmp .= ($donetodo != 'done' ? $langs->trans("ActionsToDoShort") : '');
            $tmp .= ($donetodo != 'done' && $donetodo != 'todo' ? ' / ' : '');
            $tmp .= ($donetodo != 'todo' ? $langs->trans("ActionsDoneShort") : '');
            //$out.=$langs->trans("ActionsToDoShort").' / '.$langs->trans("ActionsDoneShort");
            if ($filterobj instanceof Societe) {
                $tmp .= '</a>';
            }
            if ($filterobj instanceof User) {
                $tmp .= '</a>';
            }
            $out .= getTitleFieldOfList($tmp);
        }

        $caction = new CActionComm($db);
        $arraylist = $caction->liste_array(1, 'code', '', (!getDolGlobalString('AGENDA_USE_EVENT_TYPE') ? 1 : 0), '', 1);

        $actualCycleDate = false;

        // Loop on each event to show it
        foreach ($histo as $key => $value) {
            $actionstatic->fetch($histo[$key]['id']); // TODO Do we need this, we already have a lot of data of line into $histo

            $actionstatic->type_picto = $histo[$key]['apicto'];
            $actionstatic->type_code = $histo[$key]['acode'];

            $labeltype = $actionstatic->type_code;
            if (!getDolGlobalString('AGENDA_USE_EVENT_TYPE') && empty($arraylist[$labeltype])) {
                $labeltype = 'AC_OTH';
            }
            if (!empty($actionstatic->code) && preg_match('/^TICKET_MSG/', $actionstatic->code)) {
                $labeltype = $langs->trans("Message");
            } else {
                if (!empty($arraylist[$labeltype])) {
                    $labeltype = $arraylist[$labeltype];
                }
                if ($actionstatic->type_code == 'AC_OTH_AUTO' && ($actionstatic->type_code != $actionstatic->code) && $labeltype && !empty($arraylist[$actionstatic->code])) {
                    $labeltype .= ' - ' . $arraylist[$actionstatic->code]; // Use code in priority on type_code
                }
            }

            $url = constant('BASE_URL') . '/comm/action/card.php?id=' . $histo[$key]['id'];

            $tmpa = dol_getdate($histo[$key]['datestart'], false);

            if (isset($tmpa['year']) && isset($tmpa['yday']) && $actualCycleDate !== $tmpa['year'] . '-' . $tmpa['yday']) {
                $actualCycleDate = $tmpa['year'] . '-' . $tmpa['yday'];
                $out .= '<!-- timeline time label -->';
                $out .= '<li class="time-label">';
                $out .= '<span class="timeline-badge-date">';
                $out .= dol_print_date($histo[$key]['datestart'], 'daytext', 'tzuserrel', $langs);
                $out .= '</span>';
                $out .= '</li>';
                $out .= '<!-- /.timeline-label -->';
            }


            $out .= '<!-- timeline item -->' . "\n";
            $out .= '<li class="timeline-code-' . strtolower($actionstatic->code) . '">';

            //$timelineicon = getTimelineIcon($actionstatic, $histo, $key);
            $typeicon = $actionstatic->getTypePicto('pictofixedwidth timeline-icon-not-applicble', $labeltype);
            //$out .= $timelineicon;
            //var_dump($timelineicon);
            $out .= $typeicon;

            $out .= '<div class="timeline-item">' . "\n";

            $out .= '<span class="time timeline-header-action2">';

            if (isset($histo[$key]['type']) && $histo[$key]['type'] == 'mailing') {
                $out .= '<a class="paddingleft paddingright timeline-btn2 editfielda" href="' . constant('BASE_URL') . '/comm/mailing/card.php?id=' . $histo[$key]['id'] . '">' . img_object($langs->trans("ShowEMailing"), "email") . ' ';
                $out .= $histo[$key]['id'];
                $out .= '</a> ';
            } else {
                $out .= $actionstatic->getNomUrl(1, -1, 'valignmiddle') . ' ';
            }

            if (
                $user->hasRight('agenda', 'allactions', 'create') ||
                (($actionstatic->authorid == $user->id || $actionstatic->userownerid == $user->id) && $user->hasRight('agenda', 'myactions', 'create'))
            ) {
                $out .= '<a class="paddingleft paddingright timeline-btn2 editfielda" href="' . DOL_MAIN_URL_ROOT . '/comm/action/card.php?action=edit&token=' . newToken() . '&id=' . $actionstatic->id . '&backtopage=' . $_SERVER["PHP_SELF"] . ('?' . $param) . '">';
                //$out .= '<i class="fa fa-pencil" title="'.$langs->trans("Modify").'" ></i>';
                $out .= img_picto($langs->trans("Modify"), 'edit', 'class="edita"');
                $out .= '</a>';
            }

            $out .= '</span>';

            // Date
            $out .= '<span class="time"><i class="fa fa-clock-o valignmiddle"></i> <span class="valignmiddle">';
            $out .= dol_print_date($histo[$key]['datestart'], 'dayhour', 'tzuserrel');
            if ($histo[$key]['dateend'] && $histo[$key]['dateend'] != $histo[$key]['datestart']) {
                $tmpa = dol_getdate($histo[$key]['datestart'], true);
                $tmpb = dol_getdate($histo[$key]['dateend'], true);
                if ($tmpa['mday'] == $tmpb['mday'] && $tmpa['mon'] == $tmpb['mon'] && $tmpa['year'] == $tmpb['year']) {
                    $out .= '-' . dol_print_date($histo[$key]['dateend'], 'hour', 'tzuserrel');
                } else {
                    $out .= '-' . dol_print_date($histo[$key]['dateend'], 'dayhour', 'tzuserrel');
                }
            }
            $late = 0;
            if ($histo[$key]['percent'] == 0 && $histo[$key]['datestart'] && $histo[$key]['datestart'] < ($now - $delay_warning)) {
                $late = 1;
            }
            if ($histo[$key]['percent'] == 0 && !$histo[$key]['datestart'] && $histo[$key]['dateend'] && $histo[$key]['datestart'] < ($now - $delay_warning)) {
                $late = 1;
            }
            if ($histo[$key]['percent'] > 0 && $histo[$key]['percent'] < 100 && $histo[$key]['dateend'] && $histo[$key]['dateend'] < ($now - $delay_warning)) {
                $late = 1;
            }
            if ($histo[$key]['percent'] > 0 && $histo[$key]['percent'] < 100 && !$histo[$key]['dateend'] && $histo[$key]['datestart'] && $histo[$key]['datestart'] < ($now - $delay_warning)) {
                $late = 1;
            }
            if ($late) {
                $out .= img_warning($langs->trans("Late")) . ' ';
            }
            $out .= "</span></span>\n";

            // Ref
            $out .= '<h3 class="timeline-header">';

            // Author of event
            $out .= '<div class="messaging-author inline-block tdoverflowmax150 valignmiddle marginrightonly">';
            if ($histo[$key]['userid'] > 0) {
                if (!isset($userGetNomUrlCache[$histo[$key]['userid']])) { // is in cache ?
                    $userstatic->fetch($histo[$key]['userid']);
                    $userGetNomUrlCache[$histo[$key]['userid']] = $userstatic->getNomUrl(-1, '', 0, 0, 16, 0, 'firstelselast', '');
                }
                $out .= $userGetNomUrlCache[$histo[$key]['userid']];
            } elseif (!empty($histo[$key]['msg_from']) && $actionstatic->code == 'TICKET_MSG') {
                if (!isset($contactGetNomUrlCache[$histo[$key]['msg_from']])) {
                    if ($contactstatic->fetch(0, null, '', $histo[$key]['msg_from']) > 0) {
                        $contactGetNomUrlCache[$histo[$key]['msg_from']] = $contactstatic->getNomUrl(-1, '', 16);
                    } else {
                        $contactGetNomUrlCache[$histo[$key]['msg_from']] = $histo[$key]['msg_from'];
                    }
                }
                $out .= $contactGetNomUrlCache[$histo[$key]['msg_from']];
            }
            $out .= '</div>';

            // Title
            $out .= ' <div class="messaging-title inline-block">';
            //$out .= $actionstatic->getTypePicto();
            if (empty($conf->dol_optimize_smallscreen) && $actionstatic->type_code != 'AC_OTH_AUTO') {
                $out .= $labeltype . ' - ';
            }

            $libelle = '';
            if (preg_match('/^TICKET_MSG/', $actionstatic->code)) {
                $out .= $langs->trans('TicketNewMessage');
            } elseif (preg_match('/^TICKET_MSG_PRIVATE/', $actionstatic->code)) {
                $out .= $langs->trans('TicketNewMessage') . ' <em>(' . $langs->trans('Private') . ')</em>';
            } elseif (isset($histo[$key]['type'])) {
                if ($histo[$key]['type'] == 'action') {
                    $transcode = $langs->transnoentitiesnoconv("Action" . $histo[$key]['acode']);
                    $libelle = ($transcode != "Action" . $histo[$key]['acode'] ? $transcode : $histo[$key]['alabel']);
                    $libelle = $histo[$key]['note'];
                    $actionstatic->id = $histo[$key]['id'];
                    $out .= dol_escape_htmltag(dol_trunc($libelle, 120));
                } elseif ($histo[$key]['type'] == 'mailing') {
                    $out .= '<a href="' . constant('BASE_URL') . '/comm/mailing/card.php?id=' . $histo[$key]['id'] . '">' . img_object($langs->trans("ShowEMailing"), "email") . ' ';
                    $transcode = $langs->transnoentitiesnoconv("Action" . $histo[$key]['acode']);
                    $libelle = ($transcode != "Action" . $histo[$key]['acode'] ? $transcode : 'Send mass mailing');
                    $out .= dol_escape_htmltag(dol_trunc($libelle, 120));
                } else {
                    $libelle .= $histo[$key]['note'];
                    $out .= dol_escape_htmltag(dol_trunc($libelle, 120));
                }
            }

            if (isset($histo[$key]['elementtype']) && !empty($histo[$key]['fk_element'])) {
                if (isset($conf->cache['elementlinkcache'][$histo[$key]['elementtype']]) && isset($conf->cache['elementlinkcache'][$histo[$key]['elementtype']][$histo[$key]['fk_element']])) {
                    $link = $conf->cache['elementlinkcache'][$histo[$key]['elementtype']][$histo[$key]['fk_element']];
                } else {
                    if (!isset($conf->cache['elementlinkcache'][$histo[$key]['elementtype']])) {
                        $conf->cache['elementlinkcache'][$histo[$key]['elementtype']] = array();
                    }
                    $link = dolGetElementUrl($histo[$key]['fk_element'], $histo[$key]['elementtype'], 1);
                    $conf->cache['elementlinkcache'][$histo[$key]['elementtype']][$histo[$key]['fk_element']] = $link;
                }
                if ($link) {
                    $out .= ' - ' . $link;
                }
            }

            $out .= '</div>';

            $out .= '</h3>';

            // Message
            if (
                !empty($histo[$key]['message'] && $histo[$key]['message'] != $libelle)
                && $actionstatic->code != 'AC_TICKET_CREATE'
                && $actionstatic->code != 'AC_TICKET_MODIFY'
            ) {
                $out .= '<div class="timeline-body wordbreak">';
                $truncateLines = getDolGlobalInt('MAIN_TRUNCATE_TIMELINE_MESSAGE', 3);
                $truncatedText = dolGetFirstLineOfText($histo[$key]['message'], $truncateLines);
                if ($truncateLines > 0 && strlen($histo[$key]['message']) > strlen($truncatedText)) {
                    $out .= '<div class="readmore-block --closed" >';
                    $out .= '	<div class="readmore-block__excerpt" >';
                    $out .= dolPrintHTML($truncatedText);
                    $out .= ' 	<br><a class="read-more-link" data-read-more-action="open" href="' . DOL_MAIN_URL_ROOT . '/comm/action/card.php?id=' . $actionstatic->id . '&backtopage=' . $_SERVER["PHP_SELF"] . ('?' . $param) . '" >' . $langs->trans("ReadMore") . ' <span class="fa fa-chevron-right" aria-hidden="true"></span></a>';
                    $out .= '	</div>';
                    $out .= '	<div class="readmore-block__full-text" >';
                    $out .= dolPrintHTML($histo[$key]['message']);
                    $out .= ' 	<a class="read-less-link" data-read-more-action="close" href="#" ><span class="fa fa-chevron-up" aria-hidden="true"></span> ' . $langs->trans("ReadLess") . '</a>';
                    $out .= '	</div>';
                    $out .= '</div>';
                } else {
                    $out .= dolPrintHTML($histo[$key]['message']);
                }

                $out .= '</div>';
            }

            // Timeline footer
            $footer = '';

            // Contact for this action
            if (isset($histo[$key]['socpeopleassigned']) && is_array($histo[$key]['socpeopleassigned']) && count($histo[$key]['socpeopleassigned']) > 0) {
                $contactList = '';
                foreach ($histo[$key]['socpeopleassigned'] as $cid => $Tab) {
                    if (empty($conf->cache['contact'][$histo[$key]['contact_id']])) {
                        $contact = new Contact($db);
                        $contact->fetch($cid);
                        $conf->cache['contact'][$histo[$key]['contact_id']] = $contact;
                    } else {
                        $contact = $conf->cache['contact'][$histo[$key]['contact_id']];
                    }

                    if ($contact) {
                        $contactList .= !empty($contactList) ? ', ' : '';
                        $contactList .= $contact->getNomUrl(1);
                        if (isset($histo[$key]['acode']) && $histo[$key]['acode'] == 'AC_TEL') {
                            if (!empty($contact->phone_pro)) {
                                $contactList .= '(' . dol_print_phone($contact->phone_pro) . ')';
                            }
                        }
                    }
                }

                $footer .= $langs->trans('ActionOnContact') . ' : ' . $contactList;
            } elseif (empty($objcon->id) && isset($histo[$key]['contact_id']) && $histo[$key]['contact_id'] > 0) {
                if (empty($conf->cache['contact'][$histo[$key]['contact_id']])) {
                    $contact = new Contact($db);
                    $result = $contact->fetch($histo[$key]['contact_id']);
                    $conf->cache['contact'][$histo[$key]['contact_id']] = $contact;
                } else {
                    $contact = $conf->cache['contact'][$histo[$key]['contact_id']];
                    $result = ($contact instanceof Contact) ? $contact->id : 0;
                }

                if ($result > 0) {
                    $footer .= $contact->getNomUrl(1);
                    if (isset($histo[$key]['acode']) && $histo[$key]['acode'] == 'AC_TEL') {
                        if (!empty($contact->phone_pro)) {
                            $footer .= '(' . dol_print_phone($contact->phone_pro) . ')';
                        }
                    }
                }
            }

            $documents = getActionCommEcmList($actionstatic);
            if (!empty($documents)) {
                $footer .= '<div class="timeline-documents-container">';
                foreach ($documents as $doc) {
                    $footer .= '<span id="document_' . $doc->id . '" class="timeline-documents" ';
                    $footer .= ' data-id="' . $doc->id . '" ';
                    $footer .= ' data-path="' . $doc->filepath . '"';
                    $footer .= ' data-filename="' . dol_escape_htmltag($doc->filename) . '" ';
                    $footer .= '>';

                    $filePath = DOL_DATA_ROOT . '/' . $doc->filepath . '/' . $doc->filename;
                    $mime = dol_mimetype($filePath);
                    $file = $actionstatic->id . '/' . $doc->filename;
                    $thumb = $actionstatic->id . '/thumbs/' . substr($doc->filename, 0, strrpos($doc->filename, '.')) . '_mini' . substr($doc->filename, strrpos($doc->filename, '.'));
                    $doclink = dol_buildpath('document.php', 1) . '?modulepart=actions&attachment=0&file=' . urlencode($file) . '&entity=' . $conf->entity;
                    $viewlink = dol_buildpath('viewimage.php', 1) . '?modulepart=actions&file=' . urlencode($thumb) . '&entity=' . $conf->entity;

                    $mimeAttr = ' mime="' . $mime . '" ';
                    $class = '';
                    if (in_array($mime, array('image/png', 'image/jpeg', 'application/pdf'))) {
                        $class .= ' documentpreview';
                    }

                    $footer .= '<a href="' . $doclink . '" class="btn-link ' . $class . '" target="_blank" rel="noopener noreferrer" ' . $mimeAttr . ' >';
                    $footer .= img_mime($filePath) . ' ' . $doc->filename;
                    $footer .= '</a>';

                    $footer .= '</span>';
                }
                $footer .= '</div>';
            }

            if (!empty($footer)) {
                $out .= '<div class="timeline-footer">' . $footer . '</div>';
            }

            $out .= '</div>' . "\n"; // end timeline-item

            $out .= '</li>';
            $out .= '<!-- END timeline item -->';
        }

        $out .= "</ul>\n";

        $out .= '<script>
				jQuery(document).ready(function () {
				   $(document).on("click", "[data-read-more-action]", function(e){
					   let readMoreBloc = $(this).closest(".readmore-block");
					   if(readMoreBloc.length > 0){
							e.preventDefault();
							if($(this).attr("data-read-more-action") == "close"){
								readMoreBloc.addClass("--closed").removeClass("--open");
								 $("html, body").animate({
									scrollTop: readMoreBloc.offset().top - 200
								}, 100);
							}else{
								readMoreBloc.addClass("--open").removeClass("--closed");
							}
					   }
					});
				});
			</script>';


        if (empty($histo)) {
            $out .= '<span class="opacitymedium">' . $langs->trans("NoRecordFound") . '</span>';
        }
    }

    if ($noprint) {
        return $out;
    } else {
        print $out;
    }
}

/**
 * Get timeline icon
 *
 * @param ActionComm $actionstatic actioncomm
 * @param array<int,array{percent:int}> $histo histo
 * @param int $key key
 * @return  string                      String with timeline icon
 * @deprecated Use actioncomm->getPictoType() instead
 */
function getTimelineIcon($actionstatic, &$histo, $key)
{
    global $langs;

    $out = '<!-- timeline icon -->' . "\n";
    $iconClass = 'fa fa-comments';
    $img_picto = '';
    $colorClass = '';
    $pictoTitle = '';

    if ($histo[$key]['percent'] == -1) {
        $colorClass = 'timeline-icon-not-applicble';
        $pictoTitle = $langs->trans('StatusNotApplicable');
    } elseif ($histo[$key]['percent'] == 0) {
        $colorClass = 'timeline-icon-todo';
        $pictoTitle = $langs->trans('StatusActionToDo') . ' (0%)';
    } elseif ($histo[$key]['percent'] > 0 && $histo[$key]['percent'] < 100) {
        $colorClass = 'timeline-icon-in-progress';
        $pictoTitle = $langs->trans('StatusActionInProcess') . ' (' . $histo[$key]['percent'] . '%)';
    } elseif ($histo[$key]['percent'] >= 100) {
        $colorClass = 'timeline-icon-done';
        $pictoTitle = $langs->trans('StatusActionDone') . ' (100%)';
    }

    if ($actionstatic->code == 'AC_TICKET_CREATE') {
        $iconClass = 'fa fa-ticket';
    } elseif ($actionstatic->code == 'AC_TICKET_MODIFY') {
        $iconClass = 'fa fa-pencilxxx';
    } elseif (preg_match('/^TICKET_MSG/', $actionstatic->code)) {
        $iconClass = 'fa fa-comments';
    } elseif (preg_match('/^TICKET_MSG_PRIVATE/', $actionstatic->code)) {
        $iconClass = 'fa fa-mask';
    } elseif (getDolGlobalString('AGENDA_USE_EVENT_TYPE')) {
        if ($actionstatic->type_picto) {
            $img_picto = img_picto('', $actionstatic->type_picto);
        } else {
            if ($actionstatic->type_code == 'AC_RDV') {
                $iconClass = 'fa fa-handshake';
            } elseif ($actionstatic->type_code == 'AC_TEL') {
                $iconClass = 'fa fa-phone';
            } elseif ($actionstatic->type_code == 'AC_FAX') {
                $iconClass = 'fa fa-fax';
            } elseif ($actionstatic->type_code == 'AC_EMAIL') {
                $iconClass = 'fa fa-envelope';
            } elseif ($actionstatic->type_code == 'AC_INT') {
                $iconClass = 'fa fa-shipping-fast';
            } elseif ($actionstatic->type_code == 'AC_OTH_AUTO') {
                $iconClass = 'fa fa-robot';
            } elseif (!preg_match('/_AUTO/', $actionstatic->type_code)) {
                $iconClass = 'fa fa-robot';
            }
        }
    }

    $out .= '<i class="' . $iconClass . ' ' . $colorClass . '" title="' . $pictoTitle . '">' . $img_picto . '</i>' . "\n";
    return $out;
}

/**
 * Create a button to copy $valuetocopy in the clipboard (for copy and paste feature).
 * Code that handle the click is inside core/js/lib_foot.js.php.
 *
 * @param string $valuetocopy The value to print
 * @param int<0,1> $showonlyonhover Show the copy-paste button only on hover
 * @param string $texttoshow Replace the value to show with this text. Use 'none' to show no text (only the copy-paste picto)
 * @return  string                          The string to print for the button
 */
function showValueWithClipboardCPButton($valuetocopy, $showonlyonhover = 1, $texttoshow = '')
{
    /*
    global $conf;

    if (!empty($conf->dol_no_mouse_hover)) {
        $showonlyonhover = 0;
    }*/

    $tag = 'span';  // Using div (like any style of type 'block') does not work when using the js copy code.
    if ($texttoshow === 'none') {
        $result = '<span class="clipboardCP' . ($showonlyonhover ? ' clipboardCPShowOnHover' : '') . '"><' . $tag . ' class="clipboardCPValue hidewithsize">' . dol_escape_htmltag($valuetocopy, 1, 1) . '</' . $tag . '><span class="clipboardCPValueToPrint"></span><span class="clipboardCPButton far fa-clipboard opacitymedium paddingleft paddingright"></span><span class="clipboardCPText"></span></span>';
    } elseif ($texttoshow) {
        $result = '<span class="clipboardCP' . ($showonlyonhover ? ' clipboardCPShowOnHover' : '') . '"><' . $tag . ' class="clipboardCPValue hidewithsize">' . dol_escape_htmltag($valuetocopy, 1, 1) . '</' . $tag . '><span class="clipboardCPValueToPrint">' . dol_escape_htmltag($texttoshow, 1, 1) . '</span><span class="clipboardCPButton far fa-clipboard opacitymedium paddingleft paddingright"></span><span class="clipboardCPText"></span></span>';
    } else {
        $result = '<span class="clipboardCP' . ($showonlyonhover ? ' clipboardCPShowOnHover' : '') . '"><' . $tag . ' class="clipboardCPValue">' . dol_escape_htmltag($valuetocopy, 1, 1) . '</' . $tag . '><span class="clipboardCPButton far fa-clipboard opacitymedium paddingleft paddingright"></span><span class="clipboardCPText"></span></span>';
    }

    return $result;
}

/**
 * Start a table with headers and a optional clickable number (don't forget to use "finishSimpleTable()" after the last table row)
 *
 * @param string $header The first left header of the table (automatic translated)
 * @param string $link (optional) The link to a internal dolibarr page, where to go on clicking on the number or the ... (without the first "/")
 * @param string $arguments (optional) Additional arguments for the link (e.g. "search_status=0")
 * @param integer $emptyColumns (optional) Number of empty columns to add after the first column
 * @param integer $number (optional) The number that is shown right after the first header, when -1 the link is shown as '...'
 * @param string $pictofulllist (optional) The picto to use for the full list link
 * @return void
 *
 * @see finishSimpleTable()
 */
function startSimpleTable($header, $link = "", $arguments = "", $emptyColumns = 0, $number = -1, $pictofulllist = '')
{
    global $langs;

    print '<div class="div-table-responsive-no-min">';
    print '<table class="noborder centpercent">';
    print '<tr class="liste_titre">';

    print ($emptyColumns < 1) ? '<th>' : '<th colspan="' . ($emptyColumns + 1) . '">';

    print '<span class="valignmiddle">' . $langs->trans($header) . '</span>';

    if (!empty($link)) {
        if (!empty($arguments)) {
            print '<a href="' . constant('BASE_URL') . '/' . $link . '?' . $arguments . '">';
        } else {
            print '<a href="' . constant('BASE_URL') . '/' . $link . '">';
        }
    }

    if ($number > -1) {
        print '<span class="badge marginleftonlyshort">' . $number . '</span>';
    } elseif (!empty($link)) {
        print '<span class="badge marginleftonlyshort">...</span>';
    }

    if (!empty($link)) {
        print '</a>';
    }

    print '</th>';

    if ($number < 0 && !empty($link)) {
        print '<th class="right">';
        print '</th>';
    }

    print '</tr>';
}

/**
 * Add the correct HTML close tags for "startSimpleTable(...)" (use after the last table line)
 *
 * @param bool $addLineBreak (optional) Add a extra line break after the complete table (\<br\>)
 * @return  void
 *
 * @see startSimpleTable()
 */
function finishSimpleTable($addLineBreak = false)
{
    print '</table>';
    print '</div>';

    if ($addLineBreak) {
        print '<br>';
    }
}

/**
 * Add a summary line to the current open table ("None", "XMoreLines" or "Total xxx")
 *
 * @param integer $tableColumnCount The complete count columns of the table
 * @param integer $num The count of the rows of the table, when it is zero (0) the "$noneWord" is shown instead
 * @param integer $nbofloop (optional)  The maximum count of rows thaht the table show (when it is zero (0) no summary line will show, expect "$noneWord" when $num === 0)
 * @param integer $total (optional)  The total value thaht is shown after when the table has minimum of one entire
 * @param string $noneWord (optional)  The word that is shown when the table has no entries ($num === 0)
 * @param boolean $extraRightColumn (optional)  Add a additional column after the summary word and total number
 * @return void
 */
function addSummaryTableLine($tableColumnCount, $num, $nbofloop = 0, $total = 0, $noneWord = "None", $extraRightColumn = false)
{
    global $langs;

    if ($num === 0) {
        print '<tr class="oddeven">';
        print '<td colspan="' . $tableColumnCount . '"><span class="opacitymedium">' . $langs->trans($noneWord) . '</span></td>';
        print '</tr>';
        return;
    }

    if ($nbofloop === 0) {
        // don't show a summary line
        return;
    }

    if ($num === 0) {
        $colspan = $tableColumnCount;
    } elseif ($num > $nbofloop) {
        $colspan = $tableColumnCount;
    } else {
        $colspan = $tableColumnCount - 1;
    }

    if ($extraRightColumn) {
        $colspan--;
    }

    print '<tr class="liste_total">';

    if ($nbofloop > 0 && $num > $nbofloop) {
        print '<td colspan="' . $colspan . '" class="right">' . $langs->trans("XMoreLines", ($num - $nbofloop)) . '</td>';
    } else {
        print '<td colspan="' . $colspan . '" class="right"> ' . $langs->trans("Total") . '</td>';
        print '<td class="right centpercent">' . price($total) . '</td>';
    }

    if ($extraRightColumn) {
        print '<td></td>';
    }

    print '</tr>';
}

/**
 * Add space between dolGetButtonTitle
 *
 * @param string $moreClass more css class label
 * @return string               html of title separator
 */
function dolGetButtonTitleSeparator($moreClass = "")
{
    return '<span class="button-title-separator ' . $moreClass . '" ></span>';
}

/**
 * get field error icon
 *
 * @param string $fieldValidationErrorMsg message to add in tooltip
 * @return string html output
 */
function getFieldErrorIcon($fieldValidationErrorMsg)
{
    $out = '';
    if (!empty($fieldValidationErrorMsg)) {
        $out .= '<span class="field-error-icon classfortooltip" title="' . dol_escape_htmltag($fieldValidationErrorMsg, 1) . '"  role="alert" >'; // role alert is used for accessibility
        $out .= '<span class="fa fa-exclamation-circle" aria-hidden="true" ></span>'; // For accessibility icon is separated and aria-hidden
        $out .= '</span>';
    }

    return $out;
}

/**
 * Function dolGetButtonTitle : this kind of buttons are used in title in list
 *
 * @param string $label label of button
 * @param string $helpText optional : content for help tooltip
 * @param string $iconClass class for icon element (Example: 'fa fa-file')
 * @param string $url the url for link
 * @param string $id attribute id of button
 * @param int<-2,2> $status 0 no user rights, 1 active, 2 current action or selected, -1 Feature Disabled, -2 disable Other reason use param $helpText as tooltip help
 * @param array<string,mixed> $params various params for future : recommended rather than adding more function arguments
 * @return string               html button
 */
function dolGetButtonTitle($label, $helpText = '', $iconClass = 'fa fa-file', $url = '', $id = '', $status = 1, $params = array())
{
    global $langs, $conf, $user;

    // Actually this conf is used in css too for external module compatibility and smooth transition to this function
    if (getDolGlobalString('MAIN_BUTTON_HIDE_UNAUTHORIZED') && (!$user->admin) && $status <= 0) {
        return '';
    }

    $class = 'btnTitle';
    if (in_array($iconClass, array('fa fa-plus-circle', 'fa fa-plus-circle size15x', 'fa fa-comment-dots', 'fa fa-paper-plane'))) {
        $class .= ' btnTitlePlus';
    }
    $useclassfortooltip = 1;

    if (!empty($params['morecss'])) {
        $class .= ' ' . $params['morecss'];
    }

    $attr = array(
        'class' => $class,
        'href' => empty($url) ? '' : $url
    );

    if (!empty($helpText)) {
        $attr['title'] = dol_escape_htmltag($helpText);
    } elseif (empty($attr['title']) && $label) {
        $attr['title'] = $label;
        $useclassfortooltip = 0;
    }

    if ($status == 2) {
        $attr['class'] .= ' btnTitleSelected';
    } elseif ($status <= 0) {
        $attr['class'] .= ' refused';

        $attr['href'] = '';

        if ($status == -1) { // disable
            $attr['title'] = dol_escape_htmltag($langs->transnoentitiesnoconv("FeatureDisabled"));
        } elseif ($status == 0) { // Not enough permissions
            $attr['title'] = dol_escape_htmltag($langs->transnoentitiesnoconv("NotEnoughPermissions"));
        }
    }

    if (!empty($attr['title']) && $useclassfortooltip) {
        $attr['class'] .= ' classfortooltip';
    }

    if (!empty($id)) {
        $attr['id'] = $id;
    }

    // Override attr
    if (!empty($params['attr']) && is_array($params['attr'])) {
        foreach ($params['attr'] as $key => $value) {
            if ($key == 'class') {
                $attr['class'] .= ' ' . $value;
            } elseif ($key == 'classOverride') {
                $attr['class'] = $value;
            } else {
                $attr[$key] = $value;
            }
        }
    }

    if (isset($attr['href']) && empty($attr['href'])) {
        unset($attr['href']);
    }

    // TODO : add a hook

    // escape all attribute
    $attr = array_map('dol_escape_htmltag', $attr);

    $TCompiledAttr = array();
    foreach ($attr as $key => $value) {
        $TCompiledAttr[] = $key . '="' . $value . '"';
    }

    $compiledAttributes = (empty($TCompiledAttr) ? '' : implode(' ', $TCompiledAttr));

    $tag = (empty($attr['href']) ? 'span' : 'a');

    $button = '<' . $tag . ' ' . $compiledAttributes . '>';
    $button .= '<span class="' . $iconClass . ' valignmiddle btnTitle-icon"></span>';
    if (!empty($params['forcenohideoftext'])) {
        $button .= '<span class="valignmiddle text-plus-circle btnTitle-label' . (empty($params['forcenohideoftext']) ? ' hideonsmartphone' : '') . '">' . $label . '</span>';
    }
    $button .= '</' . $tag . '>';

    return $button;
}

/**
 * Get an array with properties of an element.
 *
 * @param string $elementType Element type (Value of $object->element or value of $object->element@$object->module). Example:
 *                                    'action', 'facture', 'project', 'project_task' or
 *                                    'myobject@mymodule' (or old syntax 'mymodule_myobject' like 'project_task')
 * @return  array{module:string,element:string,table_element:string,subelement:string,classpath:string,classfile:string,classname:string,dir_output:string}     array('module'=>, 'classpath'=>, 'element'=>, 'subelement'=>, 'classfile'=>, 'classname'=>, 'dir_output'=>)
 * @see fetchObjectByElement(), getMultidirOutput()
 */
function getElementProperties($elementType)
{
    global $conf, $db, $hookmanager;

    $regs = array();

    //$element_type='facture';

    $classfile = $classname = $classpath = $subdir = $dir_output = '';

    // Parse element/subelement
    $module = $elementType;
    $element = $elementType;
    $subelement = $elementType;
    $table_element = $elementType;

    // If we ask a resource form external module (instead of default path)
    if (preg_match('/^([^@]+)@([^@]+)$/i', $elementType, $regs)) {  // 'myobject@mymodule'
        $element = $subelement = $regs[1];
        $module = $regs[2];
    }

    // If we ask a resource for a string with an element and a subelement
    // Example 'project_task'
    if (preg_match('/^([^_]+)_([^_]+)/i', $element, $regs)) {   // 'myobject_mysubobject' with myobject=mymodule
        $module = $element = $regs[1];
        $subelement = $regs[2];
    }

    // Object lines will use parent classpath and module ref
    if (substr($elementType, -3) == 'det') {
        $module = preg_replace('/det$/', '', $element);
        $subelement = preg_replace('/det$/', '', $subelement);
        $classpath = $module . '/class';
        $classfile = $module;
        $classname = preg_replace('/det$/', 'Line', $element);
        if (in_array($module, array('expedition', 'propale', 'facture', 'contrat', 'fichinter', 'commandefournisseur'))) {
            $classname = preg_replace('/det$/', 'Ligne', $element);
        }
    }
    // For compatibility and to work with non standard path
    if ($elementType == "action" || $elementType == "actioncomm") {
        $classpath = 'comm/action/class';
        $subelement = 'Actioncomm';
        $module = 'agenda';
        $table_element = 'actioncomm';
    } elseif ($elementType == 'cronjob') {
        $classpath = 'cron/class';
        $module = 'cron';
        $table_element = 'cron';
    } elseif ($elementType == 'adherent_type') {
        $classpath = 'adherents/class';
        $classfile = 'adherent_type';
        $module = 'adherent';
        $subelement = 'adherent_type';
        $classname = 'AdherentType';
        $table_element = 'adherent_type';
    } elseif ($elementType == 'bank_account') {
        $classpath = 'compta/bank/class';
        $module = 'bank';   // We need $conf->bank->dir_output and not $conf->banque->dir_output
        $classfile = 'account';
        $classname = 'Account';
    } elseif ($elementType == 'category') {
        $classpath = 'categories/class';
        $module = 'categorie';
        $subelement = 'categorie';
        $table_element = 'categorie';
    } elseif ($elementType == 'contact') {
        $classpath = 'contact/class';
        $classfile = 'contact';
        $module = 'societe';
        $subelement = 'contact';
        $table_element = 'socpeople';
    } elseif ($elementType == 'inventory') {
        $module = 'product';
        $classpath = 'product/inventory/class';
    } elseif ($elementType == 'stock' || $elementType == 'entrepot') {
        $module = 'stock';
        $classpath = 'product/stock/class';
        $classfile = 'entrepot';
        $classname = 'Entrepot';
        $table_element = 'entrepot';
    } elseif ($elementType == 'project') {
        $classpath = 'projet/class';
        $module = 'projet';
        $table_element = 'projet';
    } elseif ($elementType == 'project_task') {
        $classpath = 'projet/class';
        $module = 'projet';
        $subelement = 'task';
        $table_element = 'projet_task';
    } elseif ($elementType == 'facture' || $elementType == 'invoice') {
        $classpath = 'compta/facture/class';
        $module = 'facture';
        $subelement = 'facture';
        $table_element = 'facture';
    } elseif ($elementType == 'facturerec') {
        $classpath = 'compta/facture/class';
        $module = 'facture';
        $classname = 'FactureRec';
    } elseif ($elementType == 'commande' || $elementType == 'order') {
        $classpath = 'commande/class';
        $module = 'commande';
        $subelement = 'commande';
        $table_element = 'commande';
    } elseif ($elementType == 'propal') {
        $classpath = 'comm/propal/class';
        $table_element = 'propal';
    } elseif ($elementType == 'shipping') {
        $classpath = 'expedition/class';
        $classfile = 'expedition';
        $classname = 'Expedition';
        $module = 'expedition';
        $table_element = 'expedition';
    } elseif ($elementType == 'delivery_note') {
        $classpath = 'delivery/class';
        $subelement = 'delivery';
        $module = 'expedition';
    } elseif ($elementType == 'delivery') {
        $classpath = 'delivery/class';
        $subelement = 'delivery';
        $module = 'expedition';
    } elseif ($elementType == 'supplier_proposal') {
        $classpath = 'supplier_proposal/class';
        $module = 'supplier_proposal';
        $element = 'supplierproposal';
        $classfile = 'supplier_proposal';
        $subelement = 'supplierproposal';
    } elseif ($elementType == 'contract') {
        $classpath = 'contrat/class';
        $module = 'contrat';
        $subelement = 'contrat';
        $table_element = 'contract';
    } elseif ($elementType == 'mailing') {
        $classpath = 'comm/mailing/class';
        $module = 'mailing';
        $classfile = 'mailing';
        $classname = 'Mailing';
        $subelement = '';
    } elseif ($elementType == 'member') {
        $classpath = 'adherents/class';
        $module = 'adherent';
        $subelement = 'adherent';
        $table_element = 'adherent';
    } elseif ($elementType == 'usergroup') {
        $classpath = 'user/class';
        $module = 'user';
    } elseif ($elementType == 'mo') {
        $classpath = 'mrp/class';
        $classfile = 'mo';
        $classname = 'Mo';
        $module = 'mrp';
        $subelement = '';
        $table_element = 'mrp_mo';
    } elseif ($elementType == 'cabinetmed_cons') {
        $classpath = 'cabinetmed/class';
        $module = 'cabinetmed';
        $subelement = 'cabinetmedcons';
        $table_element = 'cabinetmedcons';
    } elseif ($elementType == 'fichinter') {
        $classpath = 'fichinter/class';
        $module = 'ficheinter';
        $subelement = 'fichinter';
        $table_element = 'fichinter';
    } elseif ($elementType == 'dolresource' || $elementType == 'resource') {
        $classpath = 'resource/class';
        $module = 'resource';
        $subelement = 'dolresource';
        $table_element = 'resource';
    } elseif ($elementType == 'propaldet') {
        $classpath = 'comm/propal/class';
        $module = 'propal';
        $subelement = 'propaleligne';
    } elseif ($elementType == 'opensurvey_sondage') {
        $classpath = 'opensurvey/class';
        $module = 'opensurvey';
        $subelement = 'opensurveysondage';
    } elseif ($elementType == 'order_supplier') {
        $classpath = 'fourn/class';
        $module = 'fournisseur';
        $classfile = 'fournisseur.commande';
        $element = 'order_supplier';
        $subelement = '';
        $classname = 'CommandeFournisseur';
        $table_element = 'commande_fournisseur';
    } elseif ($elementType == 'commande_fournisseurdet') {
        $classpath = 'fourn/class';
        $module = 'fournisseur';
        $classfile = 'fournisseur.commande';
        $element = 'commande_fournisseurdet';
        $subelement = '';
        $classname = 'CommandeFournisseurLigne';
        $table_element = 'commande_fournisseurdet';
    } elseif ($elementType == 'invoice_supplier') {
        $classpath = 'fourn/class';
        $module = 'fournisseur';
        $classfile = 'fournisseur.facture';
        $element = 'invoice_supplier';
        $subelement = '';
        $classname = 'FactureFournisseur';
        $table_element = 'facture_fourn';
    } elseif ($elementType == "service") {
        $classpath = 'product/class';
        $subelement = 'product';
        $table_element = 'product';
    } elseif ($elementType == 'salary') {
        $classpath = 'salaries/class';
        $module = 'salaries';
    } elseif ($elementType == 'payment_salary') {
        $classpath = 'salaries/class';
        $classfile = 'paymentsalary';
        $classname = 'PaymentSalary';
        $module = 'salaries';
    } elseif ($elementType == 'productlot') {
        $module = 'productbatch';
        $classpath = 'product/stock/class';
        $classfile = 'productlot';
        $classname = 'Productlot';
        $element = 'productlot';
        $subelement = '';
        $table_element = 'product_lot';
    } elseif ($elementType == 'societeaccount') {
        $classpath = 'societe/class';
        $classfile = 'societeaccount';
        $classname = 'SocieteAccount';
        $module = 'societe';
    } elseif ($elementType == 'websitepage') {
        $classpath = 'website/class';
        $classfile = 'websitepage';
        $classname = 'Websitepage';
        $module = 'website';
        $subelement = 'websitepage';
        $table_element = 'website_page';
    } elseif ($elementType == 'fiscalyear') {
        $classpath = 'core/class';
        $module = 'accounting';
        $subelement = 'fiscalyear';
    } elseif ($elementType == 'chargesociales') {
        $classpath = 'compta/sociales/class';
        $module = 'tax';
        $table_element = 'chargesociales';
    } elseif ($elementType == 'tva') {
        $classpath = 'compta/tva/class';
        $module = 'tax';
        $subdir = '/vat';
        $table_element = 'tva';
    } elseif ($elementType == 'emailsenderprofile') {
        $module = '';
        $classpath = 'core/class';
        $classfile = 'emailsenderprofile';
        $classname = 'EmailSenderProfile';
        $table_element = 'c_email_senderprofile';
        $subelement = '';
    } elseif ($elementType == 'conferenceorboothattendee') {
        $classpath = 'eventorganization/class';
        $classfile = 'conferenceorboothattendee';
        $classname = 'ConferenceOrBoothAttendee';
        $module = 'eventorganization';
    } elseif ($elementType == 'conferenceorbooth') {
        $classpath = 'eventorganization/class';
        $classfile = 'conferenceorbooth';
        $classname = 'ConferenceOrBooth';
        $module = 'eventorganization';
    } elseif ($elementType == 'ccountry') {
        $module = '';
        $classpath = 'core/class';
        $classfile = 'ccountry';
        $classname = 'Ccountry';
        $table_element = 'c_country';
        $subelement = '';
    } elseif ($elementType == 'knowledgerecord') {
        $module = '';
        $classpath = 'knowledgemanagement/class';
        $classfile = 'knowledgerecord';
        $classname = 'KnowledgeRecord';
        $table_element = 'knowledgemanagement_knowledgerecord';
        $subelement = '';
    }

    if (empty($classfile)) {
        $classfile = strtolower($subelement);
    }
    if (empty($classname)) {
        $classname = ucfirst($subelement);
    }
    if (empty($classpath)) {
        $classpath = $module . '/class';
    }

    //print 'getElementProperties subdir='.$subdir;

    // Set dir_output
    if ($module && isset($conf->$module)) { // The generic case
        if (!empty($conf->$module->multidir_output[$conf->entity])) {
            $dir_output = $conf->$module->multidir_output[$conf->entity];
        } elseif (!empty($conf->$module->output[$conf->entity])) {
            $dir_output = $conf->$module->output[$conf->entity];
        } elseif (!empty($conf->$module->dir_output)) {
            $dir_output = $conf->$module->dir_output;
        }
    }

    // Overwrite value for special cases
    if ($element == 'order_supplier') {
        $dir_output = $conf->fournisseur->commande->dir_output;
    } elseif ($element == 'invoice_supplier') {
        $dir_output = $conf->fournisseur->facture->dir_output;
    }
    $dir_output .= $subdir;

    $elementProperties = array(
        'module' => $module,
        'element' => $element,
        'table_element' => $table_element,
        'subelement' => $subelement,
        'classpath' => $classpath,
        'classfile' => $classfile,
        'classname' => $classname,
        'dir_output' => $dir_output
    );


    // Add  hook
    if (!is_object($hookmanager)) {
        $hookmanager = new HookManager($db);
    }
    $hookmanager->initHooks(array('elementproperties'));


    // Hook params
    $parameters = array(
        'elementType' => $elementType,
        'elementProperties' => $elementProperties
    );

    $reshook = $hookmanager->executeHooks('getElementProperties', $parameters);

    if ($reshook) {
        $elementProperties = $hookmanager->resArray;
    } elseif (!empty($hookmanager->resArray) && is_array($hookmanager->resArray)) { // resArray is always an array but for sécurity against misconfigured external modules
        $elementProperties = array_replace($elementProperties, $hookmanager->resArray);
    }

    // context of elementproperties doesn't need to exist out of this function so delete it to avoid elementproperties context is equal to all
    if (($key = array_search('elementproperties', $hookmanager->contextarray)) !== false) {
        unset($hookmanager->contextarray[$key]);
    }

    return $elementProperties;
}

/**
 * Function dolGetBadge
 *
 * @param string $label label of badge no html : use in alt attribute for accessibility
 * @param string $html optional : label of badge with html
 * @param string $type type of badge : Primary Secondary Success Danger Warning Info Light Dark status0 status1 status2 status3 status4 status5 status6 status7 status8 status9
 * @param ''|'pill'|'dot' $mode Default '' , 'pill', 'dot'
 * @param string $url the url for link
 * @param array<string,mixed> $params Various params for future : recommended rather than adding more function arguments. array('attr'=>array('title'=>'abc'))
 * @return  string                          Html badge
 */
function dolGetBadge($label, $html = '', $type = 'primary', $mode = '', $url = '', $params = array())
{
    $csstouse = 'badge';
    $csstouse .= (!empty($mode) ? ' badge-' . $mode : '');
    $csstouse .= (!empty($type) ? ' badge-' . $type : '');
    $csstouse .= (empty($params['css']) ? '' : ' ' . $params['css']);

    $attr = array(
        'class' => $csstouse
    );

    if (empty($html)) {
        $html = $label;
    }

    if (!empty($url)) {
        $attr['href'] = $url;
    }

    if ($mode === 'dot') {
        $attr['class'] .= ' classfortooltip';
        $attr['title'] = $html;
        $attr['aria-label'] = $label;
        $html = '';
    }

    // Override attr
    if (!empty($params['attr']) && is_array($params['attr'])) {
        foreach ($params['attr'] as $key => $value) {
            if ($key == 'class') {
                $attr['class'] .= ' ' . $value;
            } elseif ($key == 'classOverride') {
                $attr['class'] = $value;
            } else {
                $attr[$key] = $value;
            }
        }
    }

    // TODO: add hook

    // escape all attribute
    $attr = array_map('dol_escape_htmltag', $attr);

    $TCompiledAttr = array();
    foreach ($attr as $key => $value) {
        $TCompiledAttr[] = $key . '="' . $value . '"';
    }

    $compiledAttributes = !empty($TCompiledAttr) ? implode(' ', $TCompiledAttr) : '';

    $tag = !empty($url) ? 'a' : 'span';

    return '<' . $tag . ' ' . $compiledAttributes . '>' . $html . '</' . $tag . '>';
}


/**
 * Output the badge of a status.
 *
 * @param string $statusLabel Label of badge no html : use in alt attribute for accessibility
 * @param string $statusLabelShort Short label of badge no html
 * @param string $html Optional : label of badge with html
 * @param string $statusType status0 status1 status2 status3 status4 status5 status6 status7 status8 status9 : image name or badge name
 * @param int<0,6> $displayMode 0=Long label, 1=Short label, 2=Picto + Short label, 3=Picto, 4=Picto + Long label, 5=Short label + Picto, 6=Long label + Picto
 * @param string $url The url for link
 * @param array<string,mixed> $params Various params. Example: array('tooltip'=>'no|...', 'badgeParams'=>...)
 * @return  string                                  Html status string
 */
function dolGetStatus($statusLabel = '', $statusLabelShort = '', $html = '', $statusType = 'status0', $displayMode = 0, $url = '', $params = array())
{
    global $conf;

    $return = '';
    $dolGetBadgeParams = array();

    if (!empty($params['badgeParams'])) {
        $dolGetBadgeParams = $params['badgeParams'];
    }

    // TODO : add a hook
    if ($displayMode == 0) {
        $return = !empty($html) ? $html : (empty($conf->dol_optimize_smallscreen) ? $statusLabel : (empty($statusLabelShort) ? $statusLabel : $statusLabelShort));
    } elseif ($displayMode == 1) {
        $return = !empty($html) ? $html : (empty($statusLabelShort) ? $statusLabel : $statusLabelShort);
    } elseif (getDolGlobalString('MAIN_STATUS_USES_IMAGES')) {
        // Use status with images (for backward compatibility)
        $return = '';
        $htmlLabel = (in_array($displayMode, array(1, 2, 5)) ? '<span class="hideonsmartphone">' : '') . (!empty($html) ? $html : $statusLabel) . (in_array($displayMode, array(1, 2, 5)) ? '</span>' : '');
        $htmlLabelShort = (in_array($displayMode, array(1, 2, 5)) ? '<span class="hideonsmartphone">' : '') . (!empty($html) ? $html : (!empty($statusLabelShort) ? $statusLabelShort : $statusLabel)) . (in_array($displayMode, array(1, 2, 5)) ? '</span>' : '');

        // For small screen, we always use the short label instead of long label.
        if (!empty($conf->dol_optimize_smallscreen)) {
            if ($displayMode == 0) {
                $displayMode = 1;
            } elseif ($displayMode == 4) {
                $displayMode = 2;
            } elseif ($displayMode == 6) {
                $displayMode = 5;
            }
        }

        // For backward compatibility. Image's filename are still in French, so we use this array to convert
        $statusImg = array(
            'status0' => 'statut0',
            'status1' => 'statut1',
            'status2' => 'statut2',
            'status3' => 'statut3',
            'status4' => 'statut4',
            'status5' => 'statut5',
            'status6' => 'statut6',
            'status7' => 'statut7',
            'status8' => 'statut8',
            'status9' => 'statut9'
        );

        if (!empty($statusImg[$statusType])) {
            $htmlImg = img_picto($statusLabel, $statusImg[$statusType]);
        } else {
            $htmlImg = img_picto($statusLabel, $statusType);
        }

        if ($displayMode === 2) {
            $return = $htmlImg . ' ' . $htmlLabelShort;
        } elseif ($displayMode === 3) {
            $return = $htmlImg;
        } elseif ($displayMode === 4) {
            $return = $htmlImg . ' ' . $htmlLabel;
        } elseif ($displayMode === 5) {
            $return = $htmlLabelShort . ' ' . $htmlImg;
        } else { // $displayMode >= 6
            $return = $htmlLabel . ' ' . $htmlImg;
        }
    } elseif (!getDolGlobalString('MAIN_STATUS_USES_IMAGES') && !empty($displayMode)) {
        // Use new badge
        $statusLabelShort = (empty($statusLabelShort) ? $statusLabel : $statusLabelShort);

        $dolGetBadgeParams['attr']['class'] = 'badge-status';
        if (empty($dolGetBadgeParams['attr']['title'])) {
            $dolGetBadgeParams['attr']['title'] = empty($params['tooltip']) ? $statusLabel : ($params['tooltip'] != 'no' ? $params['tooltip'] : '');
        } else {    // If a title was forced from $params['badgeParams']['attr']['title'], we set the class to get it as a tooltip.
            $dolGetBadgeParams['attr']['class'] .= ' classfortooltip';
            // And if we use tooltip, we can output title in HTML
            $dolGetBadgeParams['attr']['title'] = dol_htmlentitiesbr($dolGetBadgeParams['attr']['title'], 1);
        }

        if ($displayMode == 3) {
            $return = dolGetBadge((empty($conf->dol_optimize_smallscreen) ? $statusLabel : (empty($statusLabelShort) ? $statusLabel : $statusLabelShort)), '', $statusType, 'dot', $url, $dolGetBadgeParams);
        } elseif ($displayMode === 5) {
            $return = dolGetBadge($statusLabelShort, $html, $statusType, '', $url, $dolGetBadgeParams);
        } else {
            $return = dolGetBadge((empty($conf->dol_optimize_smallscreen) ? $statusLabel : (empty($statusLabelShort) ? $statusLabel : $statusLabelShort)), $html, $statusType, '', $url, $dolGetBadgeParams);
        }
    }

    return $return;
}


/**
 * Function dolGetButtonAction
 *
 * @param string $label Label or tooltip of button if $text is provided. Also used as tooltip in title attribute. Can be escaped HTML content or full simple text.
 * @param string $text Optional : short label on button. Can be escaped HTML content or full simple text.
 * @param string $actionType 'default', 'danger', 'email', 'clone', 'cancel', 'delete', ...
 *
 * @param string|array<int,array{lang:string,enabled:bool,perm:bool,label:string,url:string}> $url Url for link or array of subbutton description
 *
 *                                                                                                              Example when an array is used: $arrayforbutaction = array(
 *                                                                                                              10 => array('lang'=>'propal', 'enabled'=>isModEnabled("propal"), 'perm'=>$user->hasRight('propal', 'creer'), 'label' => 'AddProp', 'url'=>'/comm/propal/card.php?action=create&amp;projectid='.$object->id.'&amp;socid='.$object->socid),
 *                                                                                                              20 => array('lang'=>'orders', 'enabled'=>isModEnabled("order"), 'perm'=>$user->hasRight('commande', 'creer'), 'label' => 'CreateOrder', 'url'=>'/commande/card.php?action=create&amp;projectid='.$object->id.'&amp;socid='.$object->socid),
 *                                                                                                              30 => array('lang'=>'bills', 'enabled'=>isModEnabled("invoice"), 'perm'=>$user->hasRight('facture', 'creer'), 'label' => 'CreateBill', 'url'=>'/compta/facture/card.php?action=create&amp;projectid='.$object->id.'&amp;socid='.$object->socid),
 *                                                                                                              );
 * @param string $id Attribute id of action button. Example 'action-delete'. This can be used for full ajax confirm if this code is reused into the ->formconfirm() method.
 * @param int|boolean $userRight User action right
 * // phpcs:disable
 * @param array<string,mixed> $params = [ // Various params for future : recommended rather than adding more function arguments
 *                                      'attr' => [ // to add or override button attributes
 *                                      'xxxxx' => '', // your xxxxx attribute you want
 *                                      'class' => 'reposition', // to add more css class to the button class attribute
 *                                      'classOverride' => '' // to replace class attribute of the button
 *                                      ],
 *                                      'confirm' => [
 *                                      'url' => 'http://', // Override Url to go when user click on action btn, if empty default url is $url.?confirm=yes, for no js compatibility use $url for fallback confirm.
 *                                      'title' => '', // Override title of modal,  if empty default title use "ConfirmBtnCommonTitle" lang key
 *                                      'action-btn-label' => '', // Override label of action button,  if empty default label use "Confirm" lang key
 *                                      'cancel-btn-label' => '', // Override label of cancel button,  if empty default label use "CloseDialog" lang key
 *                                      'content' => '', // Override text of content,  if empty default content use "ConfirmBtnCommonContent" lang key
 *                                      'modal' => true, // true|false to display dialog as a modal (with dark background)
 *                                      'isDropDrown' => false, // true|false to display dialog as a dropdown (with dark background)
 *                                      ],
 *                                      ]
 * // phpcs:enable
 * @return string                   html button
 */
function dolGetButtonAction($label, $text = '', $actionType = 'default', $url = '', $id = '', $userRight = 1, $params = array())
{
    global $hookmanager, $action, $object, $langs;

    // If $url is an array, we must build a dropdown button or recursively iterate over each value
    if (is_array($url)) {
        // Loop on $url array to remove entries of disabled modules
        foreach ($url as $key => $subbutton) {
            if (isset($subbutton['enabled']) && empty($subbutton['enabled'])) {
                unset($url[$key]);
            }
        }

        $out = '';

        if (isset($params["areDropdownButtons"]) && $params["areDropdownButtons"] === false) {
            foreach ($url as $button) {
                if (!empty($button['lang'])) {
                    $langs->load($button['lang']);
                }
                $label = $langs->trans($button['label']);
                $text = $button['text'] ?? '';
                $actionType = $button['actionType'] ?? '';
                $tmpUrl = DOL_URL_ROOT . $button['url'] . (empty($params['backtopage']) ? '' : '&amp;backtopage=' . urlencode($params['backtopage']));
                $id = $button['$id'] ?? '';
                $userRight = $button['perm'] ?? 1;
                $params = $button['$params'] ?? [];

                $out .= dolGetButtonAction($label, $text, $actionType, $tmpUrl, $id, $userRight, $params);
            }
            return $out;
        }

        if (count($url) > 1) {
            $out .= '<div class="dropdown inline-block dropdown-holder">';
            $out .= '<a style="margin-right: auto;" class="dropdown-toggle classfortooltip butAction' . ($userRight ? '' : 'Refused') . '" title="' . dol_escape_htmltag($label) . '" data-toggle="dropdown">' . ($text ? $text : $label) . '</a>';
            $out .= '<div class="dropdown-content">';
            foreach ($url as $subbutton) {
                if (!empty($subbutton['lang'])) {
                    $langs->load($subbutton['lang']);
                }
                $tmpurl = DOL_URL_ROOT . $subbutton['url'] . (empty($params['backtopage']) ? '' : '&amp;backtopage=' . urlencode($params['backtopage']));
                $out .= dolGetButtonAction('', $langs->trans($subbutton['label']), 'default', $tmpurl, '', $subbutton['perm'], array('isDropDown' => true));
            }
            $out .= "</div>";
            $out .= "</div>";
        } else {
            foreach ($url as $subbutton) {  // Should loop on 1 record only
                if (!empty($subbutton['lang'])) {
                    $langs->load($subbutton['lang']);
                }
                $tmpurl = DOL_URL_ROOT . $subbutton['url'] . (empty($params['backtopage']) ? '' : '&amp;backtopage=' . urlencode($params['backtopage']));
                $out .= dolGetButtonAction('', $langs->trans($subbutton['label']), 'default', $tmpurl, '', $subbutton['perm']);
            }
        }

        return $out;
    }

    // Here, $url is a simple link

    if (!empty($params['isDropdown'])) {
        $class = "dropdown-item";
    } else {
        $class = 'butAction';
        if ($actionType == 'danger' || $actionType == 'delete') {
            $class = 'butActionDelete';
            if (!empty($url) && strpos($url, 'token=') === false) {
                $url .= '&token=' . newToken();
            }
        }
    }
    $attr = array(
        'class' => $class,
        'href' => empty($url) ? '' : $url,
        'title' => $label
    );

    if (empty($text)) {
        $text = $label;
        $attr['title'] = ''; // if html not set, leave label on title is redundant
    } else {
        $attr['title'] = $label;
        $attr['aria-label'] = $label;
    }

    if (empty($userRight)) {
        $attr['class'] = 'butActionRefused';
        $attr['href'] = '';
        $attr['title'] = (($label && $text && $label != $text) ? $label : $langs->trans('NotEnoughPermissions'));
    }

    if (!empty($id)) {
        $attr['id'] = $id;
    }

    // Override attr
    if (!empty($params['attr']) && is_array($params['attr'])) {
        foreach ($params['attr'] as $key => $value) {
            if ($key == 'class') {
                $attr['class'] .= ' ' . $value;
            } elseif ($key == 'classOverride') {
                $attr['class'] = $value;
            } else {
                $attr[$key] = $value;
            }
        }
    }

    // automatic add tooltip when title is detected
    if (!empty($attr['title']) && !empty($attr['class']) && strpos($attr['class'], 'classfortooltip') === false) {
        $attr['class'] .= ' classfortooltip';
    }

    // Js Confirm button
    if ($userRight && !empty($params['confirm'])) {
        if (!is_array($params['confirm'])) {
            $params['confirm'] = array();
        }

        if (empty($params['confirm']['url'])) {
            $params['confirm']['url'] = $url . (strpos($url, '?') > 0 ? '&' : '?') . 'confirm=yes';
        }

        // for js disabled compatibility set $url as call to confirm action and $params['confirm']['url'] to confirmed action
        $attr['data-confirm-url'] = $params['confirm']['url'];
        $attr['data-confirm-title'] = !empty($params['confirm']['title']) ? $params['confirm']['title'] : $langs->trans('ConfirmBtnCommonTitle', $label);
        $attr['data-confirm-content'] = !empty($params['confirm']['content']) ? $params['confirm']['content'] : $langs->trans('ConfirmBtnCommonContent', $label);
        $attr['data-confirm-content'] = preg_replace("/\r|\n/", "", $attr['data-confirm-content']);
        $attr['data-confirm-action-btn-label'] = !empty($params['confirm']['action-btn-label']) ? $params['confirm']['action-btn-label'] : $langs->trans('Confirm');
        $attr['data-confirm-cancel-btn-label'] = !empty($params['confirm']['cancel-btn-label']) ? $params['confirm']['cancel-btn-label'] : $langs->trans('CloseDialog');
        $attr['data-confirm-modal'] = !empty($params['confirm']['modal']) ? $params['confirm']['modal'] : true;

        $attr['class'] .= ' butActionConfirm';
    }

    if (isset($attr['href']) && empty($attr['href'])) {
        unset($attr['href']);
    }

    // escape all attribute
    $attr = array_map('dol_escape_htmltag', $attr);

    $TCompiledAttr = array();
    foreach ($attr as $key => $value) {
        $TCompiledAttr[] = $key . '= "' . $value . '"';
    }

    $compiledAttributes = empty($TCompiledAttr) ? '' : implode(' ', $TCompiledAttr);

    $tag = !empty($attr['href']) ? 'a' : 'span';


    $parameters = array(
        'TCompiledAttr' => $TCompiledAttr,              // array
        'compiledAttributes' => $compiledAttributes,    // string
        'attr' => $attr,
        'tag' => $tag,
        'label' => $label,
        'html' => $text,
        'actionType' => $actionType,
        'url' => $url,
        'id' => $id,
        'userRight' => $userRight,
        'params' => $params
    );

    $reshook = $hookmanager->executeHooks('dolGetButtonAction', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
    if ($reshook < 0) {
        setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
    }

    if (empty($reshook)) {
        if (dol_textishtml($text)) {    // If content already HTML encoded
            return '<' . $tag . ' ' . $compiledAttributes . '>' . $text . '</' . $tag . '>';
        } else {
            return '<' . $tag . ' ' . $compiledAttributes . '>' . dol_escape_htmltag($text) . '</' . $tag . '>';
        }
    } else {
        return $hookmanager->resPrint;
    }
}


/**
 * Return string with full Url. The file qualified is the one defined by relative path in $object->last_main_doc
 *
 * @param CommonObject $object Object
 * @return  string                      Url string
 */
function showDirectDownloadLink($object)
{
    global $conf, $langs;

    $out = '';
    $url = $object->getLastMainDocLink($object->element);

    $out .= img_picto($langs->trans("PublicDownloadLinkDesc"), 'globe') . ' <span class="opacitymedium">' . $langs->trans("DirectDownloadLink") . '</span><br>';
    if ($url) {
        $out .= '<div class="urllink"><input type="text" id="directdownloadlink" class="quatrevingtpercent" value="' . $url . '"></div>';
        $out .= ajax_autoselect("directdownloadlink", 0);
    } else {
        $out .= '<div class="urllink">' . $langs->trans("FileNotShared") . '</div>';
    }

    return $out;
}

/**
 * Set focus onto field with selector (similar behaviour of 'autofocus' HTML5 tag)
 *
 * @param string $selector Selector ('#id' or 'input[name="ref"]') to use to find the HTML input field that must get the autofocus. You must use a CSS selector, so unique id preceding with the '#' char.
 * @return  void
 */
function dol_set_focus($selector)
{
    print "\n" . '<!-- Set focus onto a specific field -->' . "\n";
    print '<script nonce="' . getNonce() . '">jQuery(document).ready(function() { jQuery("' . dol_escape_js($selector) . '").focus(); });</script>' . "\n";
}


/**
 *  Complete or removed entries into a head array (used to build tabs).
 *  For example, with value added by external modules. Such values are declared into $conf->modules_parts['tab'].
 *  Or by change using hook completeTabsHead
 *
 * @param Conf $conf Object conf
 * @param Translate $langs Object langs
 * @param object|null $object Object object
 * @param array<array<int,string>> $head List of head tabs (updated by this function)
 * @param int $h New position to fill (updated by this function)
 * @param string $type Value for object where objectvalue can be
 *                                          'thirdparty'       to add a tab in third party view
 *                                          'intervention'     to add a tab in intervention view
 *                                          'supplier_order'   to add a tab in purchase order view
 *                                          'supplier_invoice' to add a tab in purchase invoice view
 *                                          'invoice'          to add a tab in sales invoice view
 *                                          'order'            to add a tab in sales order view
 *                                          'contract'         to add a table in contract view
 *                                          'product'          to add a tab in product view
 *                                          'propal'           to add a tab in propal view
 *                                          'user'             to add a tab in user view
 *                                          'group'            to add a tab in group view
 *                                          'member'           to add a tab in foundation member view
 *                                          'categories_x'     to add a tab in category view ('x': type of category (0=product, 1=supplier, 2=customer, 3=member)
 *                                          'ecm'              to add a tab for another ecm view
 *                                          'stock'            to add a tab for warehouse view
 * @param string $mode 'add' to complete head, 'remove' to remove entries
 * @param string $filterorigmodule Filter on module origin: 'external' will show only external modules. 'core' only core modules. No filter (default) will add both.
 * @return void
 */
function complete_head_from_modules($conf, $langs, $object, &$head, &$h, $type, $mode = 'add', $filterorigmodule = '')
{
    global $hookmanager, $db;

    if (isset($conf->modules_parts['tabs'][$type]) && is_array($conf->modules_parts['tabs'][$type])) {
        foreach ($conf->modules_parts['tabs'][$type] as $value) {
            $values = explode(':', $value);

            $reg = array();
            if ($mode == 'add' && !preg_match('/^\-/', $values[1])) {
                $newtab = array();
                $postab = $h;
                // detect if position set in $values[1] ie : +(2)mytab@mymodule (first tab is 0, second is one, ...)
                $str = $values[1];
                $posstart = strpos($str, '(');
                if ($posstart > 0) {
                    $posend = strpos($str, ')');
                    if ($posstart > 0) {
                        $res1 = substr($str, $posstart + 1, $posend - $posstart - 1);
                        if (is_numeric($res1)) {
                            $postab = (int)$res1;
                            $values[1] = '+' . substr($str, $posend + 1);
                        }
                    }
                }
                if (count($values) == 6) {
                    // new declaration with permissions:
                    // $value='objecttype:+tabname1:Title1:langfile@mymodule:$user->rights->mymodule->read:/mymodule/mynewtab1.php?id=__ID__'
                    // $value='objecttype:+tabname1:Title1,class,pathfile,method:langfile@mymodule:$user->rights->mymodule->read:/mymodule/mynewtab1.php?id=__ID__'
                    if ($values[0] != $type) {
                        continue;
                    }

                    if (verifCond($values[4], '2')) {
                        if ($values[3]) {
                            if ($filterorigmodule) {    // If a filter of module origin has been requested
                                if (strpos($values[3], '@')) {  // This is an external module
                                    if ($filterorigmodule != 'external') {
                                        continue;
                                    }
                                } else {    // This looks a core module
                                    if ($filterorigmodule != 'core') {
                                        continue;
                                    }
                                }
                            }
                            $langs->load($values[3]);
                        }
                        if (preg_match('/SUBSTITUTION_([^_]+)/i', $values[2], $reg)) {
                            // If label is "SUBSTITUION_..."
                            $substitutionarray = array();
                            complete_substitutions_array($substitutionarray, $langs, $object, array('needforkey' => $values[2]));
                            $label = make_substitutions($reg[1], $substitutionarray);
                        } else {
                            // If label is "Label,Class,File,Method", we call the method to show content inside the badge
                            $labeltemp = explode(',', $values[2]);
                            $label = $langs->trans($labeltemp[0]);

                            if (!empty($labeltemp[1]) && is_object($object) && !empty($object->id)) {
                                dol_include_once($labeltemp[2]);
                                $classtoload = $labeltemp[1];
                                if (class_exists($classtoload)) {
                                    $obj = new $classtoload($db);
                                    $function = $labeltemp[3];
                                    if ($obj && $function && method_exists($obj, $function)) {
                                        // @phan-suppress-next-line PhanPluginUnknownObjectMethodCall
                                        $nbrec = $obj->$function($object->id, $obj);
                                        if (!empty($nbrec)) {
                                            $label .= '<span class="badge marginleftonlyshort">' . $nbrec . '</span>';
                                        }
                                    }
                                }
                            }
                        }

                        $newtab[0] = dol_buildpath(preg_replace('/__ID__/i', ((is_object($object) && !empty($object->id)) ? $object->id : ''), $values[5]), 1);
                        $newtab[1] = $label;
                        $newtab[2] = str_replace('+', '', $values[1]);
                        $h++;
                    } else {
                        continue;
                    }
                } elseif (count($values) == 5) {       // case deprecated
                    dol_syslog('Passing 5 values in tabs module_parts is deprecated. Please update to 6 with permissions.', LOG_WARNING);

                    if ($values[0] != $type) {
                        continue;
                    }
                    if ($values[3]) {
                        if ($filterorigmodule) {    // If a filter of module origin has been requested
                            if (strpos($values[3], '@')) {  // This is an external module
                                if ($filterorigmodule != 'external') {
                                    continue;
                                }
                            } else {    // This looks a core module
                                if ($filterorigmodule != 'core') {
                                    continue;
                                }
                            }
                        }
                        $langs->load($values[3]);
                    }
                    if (preg_match('/SUBSTITUTION_([^_]+)/i', $values[2], $reg)) {
                        $substitutionarray = array();
                        complete_substitutions_array($substitutionarray, $langs, $object, array('needforkey' => $values[2]));
                        $label = make_substitutions($reg[1], $substitutionarray);
                    } else {
                        $label = $langs->trans($values[2]);
                    }

                    $newtab[0] = dol_buildpath(preg_replace('/__ID__/i', ((is_object($object) && !empty($object->id)) ? $object->id : ''), $values[4]), 1);
                    $newtab[1] = $label;
                    $newtab[2] = str_replace('+', '', $values[1]);
                    $h++;
                }
                // set tab at its position
                $head = array_merge(array_slice($head, 0, $postab), array($newtab), array_slice($head, $postab));
            } elseif ($mode == 'remove' && preg_match('/^\-/', $values[1])) {
                if ($values[0] != $type) {
                    continue;
                }
                $tabname = str_replace('-', '', $values[1]);
                foreach ($head as $key => $val) {
                    $condition = (!empty($values[3]) ? verifCond($values[3], '2') : 1);
                    //var_dump($key.' - '.$tabname.' - '.$head[$key][2].' - '.$values[3].' - '.$condition);
                    if ($head[$key][2] == $tabname && $condition) {
                        unset($head[$key]);
                        break;
                    }
                }
            }
        }
    }

    // No need to make a return $head. Var is modified as a reference
    if (!empty($hookmanager)) {
        $parameters = array('object' => $object, 'mode' => $mode, 'head' => &$head, 'filterorigmodule' => $filterorigmodule);
        $reshook = $hookmanager->executeHooks('completeTabsHead', $parameters, $object);
        if ($reshook > 0) {     // Hook ask to replace completely the array
            $head = $hookmanager->resArray;
        } else {                // Hook
            $head = array_merge($head, $hookmanager->resArray);
        }
        $h = count($head);
    }
}

/**
 * Print common footer :
 *      conf->global->MAIN_HTML_FOOTER
 *      js for switch of menu hider
 *      js for conf->global->MAIN_GOOGLE_AN_ID
 *      js for conf->global->MAIN_SHOW_TUNING_INFO or $_SERVER["MAIN_SHOW_TUNING_INFO"]
 *      js for conf->logbuffer
 *
 * @param string $zone 'private' (for private pages) or 'public' (for public pages)
 * @return  void
 */
function printCommonFooter($zone = 'private')
{
    global $conf, $hookmanager, $user, $debugbar;
    global $action;
    global $micro_start_time;

    if ($zone == 'private') {
        print "\n" . '<!-- Common footer for private page -->' . "\n";
    } else {
        print "\n" . '<!-- Common footer for public page -->' . "\n";
    }

    // A div to store page_y POST parameter so we can read it using javascript
    print "\n<!-- A div to store page_y POST parameter -->\n";
    print '<div id="page_y" style="display: none;">' . (GETPOST('page_y') ? GETPOST('page_y') : '') . '</div>' . "\n";

    $parameters = array();
    $reshook = $hookmanager->executeHooks('printCommonFooter', $parameters); // Note that $action and $object may have been modified by some hooks
    if (empty($reshook)) {
        if (getDolGlobalString('MAIN_HTML_FOOTER')) {
            print getDolGlobalString('MAIN_HTML_FOOTER') . "\n";
        }

        print "\n";
        if (!empty($conf->use_javascript_ajax)) {
            print "\n<!-- A script section to add menuhider handler on backoffice, manage focus and mandatory fields, tuning info, ... -->\n";
            print '<script>' . "\n";
            print 'jQuery(document).ready(function() {' . "\n";

            if ($zone == 'private' && empty($conf->dol_use_jmobile)) {
                print "\n";
                print '/* JS CODE TO ENABLE to manage handler to switch left menu page (menuhider) */' . "\n";
                print 'jQuery("li.menuhider").click(function(event) {';
                print '  if (!$( "body" ).hasClass( "sidebar-collapse" )){ event.preventDefault(); }' . "\n";
                print '  console.log("We click on .menuhider");' . "\n";
                print '  $("body").toggleClass("sidebar-collapse")' . "\n";
                print '});' . "\n";
            }

            // Management of focus and mandatory for fields
            if ($action == 'create' || $action == 'edit' || (empty($action) && (preg_match('/new\.php/', $_SERVER["PHP_SELF"]))) || ((empty($action) || $action == 'addline') && (preg_match('/card\.php/', $_SERVER["PHP_SELF"])))) {
                print '/* JS CODE TO ENABLE to manage focus and mandatory form fields */' . "\n";
                $relativepathstring = $_SERVER["PHP_SELF"];
                // Clean $relativepathstring
                if (constant('DOL_URL_ROOT')) {
                    $relativepathstring = preg_replace('/^' . preg_quote(constant('DOL_URL_ROOT'), '/') . '/', '', $relativepathstring);
                }
                $relativepathstring = preg_replace('/^\//', '', $relativepathstring);
                $relativepathstring = preg_replace('/^custom\//', '', $relativepathstring);
                //$tmpqueryarraywehave = explode('&', dol_string_nohtmltag($_SERVER['QUERY_STRING']));
                if (!empty($user->default_values[$relativepathstring]['focus'])) {
                    foreach ($user->default_values[$relativepathstring]['focus'] as $defkey => $defval) {
                        $qualified = 0;
                        if ($defkey != '_noquery_') {
                            $tmpqueryarraytohave = explode('&', $defkey);
                            $foundintru = 0;
                            foreach ($tmpqueryarraytohave as $tmpquerytohave) {
                                $tmpquerytohaveparam = explode('=', $tmpquerytohave);
                                //print "console.log('".$tmpquerytohaveparam[0]." ".$tmpquerytohaveparam[1]." ".GETPOST($tmpquerytohaveparam[0])."');";
                                if (!GETPOSTISSET($tmpquerytohaveparam[0]) || ($tmpquerytohaveparam[1] != GETPOST($tmpquerytohaveparam[0]))) {
                                    $foundintru = 1;
                                }
                            }
                            if (!$foundintru) {
                                $qualified = 1;
                            }
                            //var_dump($defkey.'-'.$qualified);
                        } else {
                            $qualified = 1;
                        }

                        if ($qualified) {
                            foreach ($defval as $paramkey => $paramval) {
                                // Set focus on field
                                print 'jQuery("input[name=\'' . $paramkey . '\']").focus();' . "\n";
                                print 'jQuery("textarea[name=\'' . $paramkey . '\']").focus();' . "\n";
                                print 'jQuery("select[name=\'' . $paramkey . '\']").focus();' . "\n"; // Not really useful, but we keep it in case of.
                            }
                        }
                    }
                }
                if (!empty($user->default_values[$relativepathstring]['mandatory'])) {
                    foreach ($user->default_values[$relativepathstring]['mandatory'] as $defkey => $defval) {
                        $qualified = 0;
                        if ($defkey != '_noquery_') {
                            $tmpqueryarraytohave = explode('&', $defkey);
                            $foundintru = 0;
                            foreach ($tmpqueryarraytohave as $tmpquerytohave) {
                                $tmpquerytohaveparam = explode('=', $tmpquerytohave);
                                //print "console.log('".$tmpquerytohaveparam[0]." ".$tmpquerytohaveparam[1]." ".GETPOST($tmpquerytohaveparam[0])."');";
                                if (!GETPOSTISSET($tmpquerytohaveparam[0]) || ($tmpquerytohaveparam[1] != GETPOST($tmpquerytohaveparam[0]))) {
                                    $foundintru = 1;
                                }
                            }
                            if (!$foundintru) {
                                $qualified = 1;
                            }
                            //var_dump($defkey.'-'.$qualified);
                        } else {
                            $qualified = 1;
                        }

                        if ($qualified) {
                            foreach ($defval as $paramkey => $paramval) {
                                // Add property 'required' on input
                                print 'jQuery("input[name=\'' . $paramkey . '\']").prop(\'required\',true);' . "\n";
                                print 'jQuery("textarea[name=\'' . $paramkey . '\']").prop(\'required\',true);' . "\n";
                                print '// required on a select works only if key is "", so we add the required attributes but also we reset the key -1 or 0 to an empty string' . "\n";
                                print 'jQuery("select[name=\'' . $paramkey . '\']").prop(\'required\',true);' . "\n";
                                print 'jQuery("select[name=\'' . $paramkey . '\'] option[value=\'-1\']").prop(\'value\', \'\');' . "\n";
                                print 'jQuery("select[name=\'' . $paramkey . '\'] option[value=\'0\']").prop(\'value\', \'\');' . "\n";

                                // Add 'field required' class on closest td for all input elements : input, textarea and select
                                print 'jQuery(":input[name=\'' . $paramkey . '\']").closest("tr").find("td:first").addClass("fieldrequired");' . "\n";
                            }
                            // If we submit the cancel button we remove the required attributes
                            print 'jQuery("input[name=\'cancel\']").click(function() {
								console.log("We click on cancel button so removed all required attribute");
								jQuery("input, textarea, select").each(function(){this.removeAttribute(\'required\');});
								});' . "\n";
                        }
                    }
                }
            }

            print '});' . "\n";

            // End of tuning
            if (!empty($_SERVER['MAIN_SHOW_TUNING_INFO']) || getDolGlobalString('MAIN_SHOW_TUNING_INFO')) {
                print "\n";
                print "/* JS CODE TO ENABLE to add memory info */\n";
                print 'window.console && console.log("';
                if (getDolGlobalString('MEMCACHED_SERVER')) {
                    print 'MEMCACHED_SERVER=' . getDolGlobalString('MEMCACHED_SERVER') . ' - ';
                }
                print 'MAIN_OPTIMIZE_SPEED=' . getDolGlobalString('MAIN_OPTIMIZE_SPEED', 'off');
                if (!empty($micro_start_time)) {   // Works only if MAIN_SHOW_TUNING_INFO is defined at $_SERVER level. Not in global variable.
                    $micro_end_time = microtime(true);
                    print ' - Build time: ' . ceil(1000 * ($micro_end_time - $micro_start_time)) . ' ms';
                }

                if (function_exists("memory_get_usage")) {
                    print ' - Mem: ' . memory_get_usage(); // Do not use true here, it seems it takes the peak amount
                }
                if (function_exists("memory_get_peak_usage")) {
                    print ' - Real mem peak: ' . memory_get_peak_usage(true);
                }
                if (function_exists("zend_loader_file_encoded")) {
                    print ' - Zend encoded file: ' . (zend_loader_file_encoded() ? 'yes' : 'no');
                }
                print '");' . "\n";
            }

            print "\n" . '</script>' . "\n";

            // Google Analytics
            // TODO Add a hook here
            if (isModEnabled('google') && getDolGlobalString('MAIN_GOOGLE_AN_ID')) {
                $tmptagarray = explode(',', getDolGlobalString('MAIN_GOOGLE_AN_ID'));
                foreach ($tmptagarray as $tmptag) {
                    print "\n";
                    print "<!-- JS CODE TO ENABLE for google analtics tag -->\n";
                    print '
					<!-- Global site tag (gtag.js) - Google Analytics -->
					<script nonce="' . getNonce() . '" async src="https://www.googletagmanager.com/gtag/js?id=' . trim($tmptag) . '"></script>
					<script>
					window.dataLayer = window.dataLayer || [];
					function gtag(){dataLayer.push(arguments);}
					gtag(\'js\', new Date());

					gtag(\'config\', \'' . trim($tmptag) . '\');
					</script>';
                    print "\n";
                }
            }
        }

        // Add Xdebug coverage of code
        if (defined('XDEBUGCOVERAGE')) {
            print_r(xdebug_get_code_coverage());
        }

        // Add DebugBar data
        if ($user->hasRight('debugbar', 'read') && $debugbar instanceof DebugBar\DebugBar) {
            if (isset($debugbar['time'])) {
                // @phan-suppress-next-line PhanPluginUnknownObjectMethodCall
                $debugbar['time']->stopMeasure('pageaftermaster');
            }
            print '<!-- Output debugbar data -->' . "\n";
            $renderer = $debugbar->getJavascriptRenderer();
            print $renderer->render();
        } elseif (count($conf->logbuffer)) {    // If there is some logs in buffer to show
            print "\n";
            print "<!-- Start of log output\n";
            //print '<div class="hidden">'."\n";
            foreach ($conf->logbuffer as $logline) {
                print $logline . "<br>\n";
            }
            //print '</div>'."\n";
            print "End of log output -->\n";
        }
    }
}

/**
 *  Print formatted messages to output (Used to show messages on html output).
 *  Note: Calling dol_htmloutput_events is done into pages by standard llxFooter() function, so there is
 *  no need to call it explicitly.
 *
 * @param int $disabledoutputofmessages Clear all messages stored into session without displaying them
 * @return void
 * @see                                        dol_htmloutput_mesg()
 */
function dol_htmloutput_events($disabledoutputofmessages = 0)
{
    // Show mesgs
    if (isset($_SESSION['dol_events']['mesgs'])) {
        if (empty($disabledoutputofmessages)) {
            dol_htmloutput_mesg('', $_SESSION['dol_events']['mesgs']);
        }
        unset($_SESSION['dol_events']['mesgs']);
    }
    // Show errors
    if (isset($_SESSION['dol_events']['errors'])) {
        if (empty($disabledoutputofmessages)) {
            dol_htmloutput_mesg('', $_SESSION['dol_events']['errors'], 'error');
        }
        unset($_SESSION['dol_events']['errors']);
    }

    // Show warnings
    if (isset($_SESSION['dol_events']['warnings'])) {
        if (empty($disabledoutputofmessages)) {
            dol_htmloutput_mesg('', $_SESSION['dol_events']['warnings'], 'warning');
        }
        unset($_SESSION['dol_events']['warnings']);
    }
}

/**
 *  Get formatted messages to output (Used to show messages on html output).
 *  This include also the translation of the message key.
 *
 * @param string $mesgstring Message string or message key
 * @param string[] $mesgarray Array of message strings or message keys
 * @param string $style Style of message output ('ok' or 'error')
 * @param int $keepembedded Set to 1 in error message must be kept embedded into its html place (this disable jnotify)
 * @return string                      Return html output
 *
 * @see    dol_print_error()
 * @see    dol_htmloutput_errors()
 * @see    setEventMessages()
 */
function get_htmloutput_mesg($mesgstring = '', $mesgarray = [], $style = 'ok', $keepembedded = 0)
{
    global $conf, $langs;

    $ret = 0;
    $return = '';
    $out = '';
    $divstart = $divend = '';

    // If inline message with no format, we add it.
    if ((empty($conf->use_javascript_ajax) || getDolGlobalString('MAIN_DISABLE_JQUERY_JNOTIFY') || $keepembedded) && !preg_match('/<div class=".*">/i', $out)) {
        $divstart = '<div class="' . $style . ' clearboth">';
        $divend = '</div>';
    }

    if ((is_array($mesgarray) && count($mesgarray)) || $mesgstring) {
        $langs->load("errors");
        $out .= $divstart;
        if (is_array($mesgarray) && count($mesgarray)) {
            foreach ($mesgarray as $message) {
                $ret++;
                $out .= $langs->trans($message);
                if ($ret < count($mesgarray)) {
                    $out .= "<br>\n";
                }
            }
        }
        if ($mesgstring) {
            $ret++;
            $out .= $langs->trans($mesgstring);
        }
        $out .= $divend;
    }

    if ($out) {
        if (!empty($conf->use_javascript_ajax) && !getDolGlobalString('MAIN_DISABLE_JQUERY_JNOTIFY') && empty($keepembedded)) {
            $return = '<script nonce="' . getNonce() . '">
					$(document).ready(function() {
						var block = ' . (getDolGlobalString('MAIN_USE_JQUERY_BLOCKUI') ? "true" : "false") . '
						if (block) {
							$.dolEventValid("","' . dol_escape_js($out) . '");
						} else {
							/* jnotify(message, preset of message type, keepmessage) */
							$.jnotify("' . dol_escape_js($out) . '",
							"' . ($style == "ok" ? 3000 : $style) . '",
							' . ($style == "ok" ? "false" : "true") . ',
							{ remove: function (){} } );
						}
					});
				</script>';
        } else {
            $return = $out;
        }
    }

    return $return;
}

/**
 *  Get formatted error messages to output (Used to show messages on html output).
 *
 * @param string $mesgstring Error message
 * @param string[] $mesgarray Error messages array
 * @param int $keepembedded Set to 1 in error message must be kept embedded into its html place (this disable jnotify)
 * @return string                      Return html output
 *
 * @see    dol_print_error()
 * @see    dol_htmloutput_mesg()
 */
function get_htmloutput_errors($mesgstring = '', $mesgarray = array(), $keepembedded = 0)
{
    return get_htmloutput_mesg($mesgstring, $mesgarray, 'error', $keepembedded);
}

/**
 *  Print formatted messages to output (Used to show messages on html output).
 *
 * @param string $mesgstring Message string or message key
 * @param string[] $mesgarray Array of message strings or message keys
 * @param string $style Which style to use ('ok', 'warning', 'error')
 * @param int $keepembedded Set to 1 if message must be kept embedded into its html place (this disable jnotify)
 * @return void
 *
 * @see    dol_print_error()
 * @see    dol_htmloutput_errors()
 * @see    setEventMessages()
 */
function dol_htmloutput_mesg($mesgstring = '', $mesgarray = array(), $style = 'ok', $keepembedded = 0)
{
    if (empty($mesgstring) && (!is_array($mesgarray) || count($mesgarray) == 0)) {
        return;
    }

    $iserror = 0;
    $iswarning = 0;
    if (is_array($mesgarray)) {
        foreach ($mesgarray as $val) {
            if ($val && preg_match('/class="error"/i', $val)) {
                $iserror++;
                break;
            }
            if ($val && preg_match('/class="warning"/i', $val)) {
                $iswarning++;
                break;
            }
        }
    } elseif ($mesgstring && preg_match('/class="error"/i', $mesgstring)) {
        $iserror++;
    } elseif ($mesgstring && preg_match('/class="warning"/i', $mesgstring)) {
        $iswarning++;
    }
    if ($style == 'error') {
        $iserror++;
    }
    if ($style == 'warning') {
        $iswarning++;
    }

    if ($iserror || $iswarning) {
        // Remove div from texts
        $mesgstring = preg_replace('/<\/div><div class="(error|warning)">/', '<br>', $mesgstring);
        $mesgstring = preg_replace('/<div class="(error|warning)">/', '', $mesgstring);
        $mesgstring = preg_replace('/<\/div>/', '', $mesgstring);
        // Remove div from texts array
        if (is_array($mesgarray)) {
            $newmesgarray = array();
            foreach ($mesgarray as $val) {
                if (is_string($val)) {
                    $tmpmesgstring = preg_replace('/<\/div><div class="(error|warning)">/', '<br>', $val);
                    $tmpmesgstring = preg_replace('/<div class="(error|warning)">/', '', $tmpmesgstring);
                    $tmpmesgstring = preg_replace('/<\/div>/', '', $tmpmesgstring);
                    $newmesgarray[] = $tmpmesgstring;
                } else {
                    dol_syslog("Error call of dol_htmloutput_mesg with an array with a value that is not a string", LOG_WARNING);
                }
            }
            $mesgarray = $newmesgarray;
        }
        print get_htmloutput_mesg($mesgstring, $mesgarray, ($iserror ? 'error' : 'warning'), $keepembedded);
    } else {
        print get_htmloutput_mesg($mesgstring, $mesgarray, 'ok', $keepembedded);
    }
}

/**
 *  Print formatted error messages to output (Used to show messages on html output).
 *
 * @param string $mesgstring Error message
 * @param string[] $mesgarray Error messages array
 * @param int<0,1> $keepembedded Set to 1 in error message must be kept embedded into its html place (this disable jnotify)
 * @return void
 *
 * @see    dol_print_error()
 * @see    dol_htmloutput_mesg()
 */
function dol_htmloutput_errors($mesgstring = '', $mesgarray = array(), $keepembedded = 0)
{
    dol_htmloutput_mesg($mesgstring, $mesgarray, 'error', $keepembedded);
}

/**
 * Sanitize a HTML to remove js, dangerous content and external link.
 * This function is used by dolPrintHTML... function for example.
 *
 * @param string $stringtoencode String to encode
 * @param int $nouseofiframesandbox 0=Default, 1=Allow use of option MAIN_SECURITY_USE_SANDBOX_FOR_HTMLWITHNOJS for html sanitizing (not yet working)
 * @param string $check 'restricthtmlnolink' or 'restricthtml' or 'restricthtmlallowclass' or 'restricthtmlallowunvalid'
 * @return  string                              HTML sanitized
 */
function dol_htmlwithnojs($stringtoencode, $nouseofiframesandbox = 0, $check = 'restricthtml')
{
    if (empty($nouseofiframesandbox) && getDolGlobalString('MAIN_SECURITY_USE_SANDBOX_FOR_HTMLWITHNOJS')) {
        // TODO using sandbox on inline html content is not possible yet with current browsers
        //$s = '<iframe class="iframewithsandbox" sandbox><html><body>';
        //$s .= $stringtoencode;
        //$s .= '</body></html></iframe>';
        return $stringtoencode;
    } else {
        $out = $stringtoencode;

        do {
            $oldstringtoclean = $out;

            if (!empty($out) && getDolGlobalString('MAIN_RESTRICTHTML_ONLY_VALID_HTML') && $check != 'restricthtmlallowunvalid') {
                try {
                    libxml_use_internal_errors(false);  // Avoid to fill memory with xml errors
                    if (LIBXML_VERSION < 20900) {
                        // Avoid load of external entities (security problem).
                        // Required only if LIBXML_VERSION < 20900
                        // @phan-suppress-next-line PhanDeprecatedFunctionInternal
                        libxml_disable_entity_loader(true);
                    }

                    $dom = new DOMDocument();
                    // Add a trick to solve pb with text without parent tag
                    // like '<h1>Foo</h1><p>bar</p>' that wrongly ends up, without the trick, with '<h1>Foo<p>bar</p></h1>'
                    // like 'abc' that wrongly ends up, without the trick, with '<p>abc</p>'

                    if (dol_textishtml($out)) {
                        $out = '<?xml encoding="UTF-8"><div class="tricktoremove">' . $out . '</div>';
                    } else {
                        $out = '<?xml encoding="UTF-8"><div class="tricktoremove">' . dol_nl2br($out) . '</div>';
                    }

                    $dom->loadHTML($out, LIBXML_HTML_NODEFDTD | LIBXML_ERR_NONE | LIBXML_HTML_NOIMPLIED | LIBXML_NONET | LIBXML_NOWARNING | LIBXML_NOERROR | LIBXML_NOXMLDECL);
                    $out = trim($dom->saveHTML());

                    // Remove the trick added to solve pb with text without parent tag
                    $out = preg_replace('/^<\?xml encoding="UTF-8"><div class="tricktoremove">/', '', $out);
                    $out = preg_replace('/<\/div>$/', '', $out);
                } catch (Exception $e) {
                    // If error, invalid HTML string with no way to clean it
                    //print $e->getMessage();
                    $out = 'InvalidHTMLStringCantBeCleaned ' . $e->getMessage();
                }
            }

            if (!empty($out) && getDolGlobalString('MAIN_RESTRICTHTML_ONLY_VALID_HTML_TIDY') && $check != 'restricthtmlallowunvalid') {
                try {
                    // Try cleaning using tidy
                    if (extension_loaded('tidy') && class_exists("tidy")) {
                        //print "aaa".$out."\n";

                        // See options at https://tidy.sourceforge.net/docs/quickref.html
                        $config = array(
                            'clean' => false,
                            'quote-marks' => false,     // do not replace " that are used for real text content (not a string symbol for html attribute) into &quot;
                            'doctype' => 'strict',
                            'show-body-only' => true,
                            "indent-attributes" => false,
                            "vertical-space" => false,
                            //'ident' => false,         // Not always supported
                            "wrap" => 0
                            // HTML5 tags
                            //'new-blocklevel-tags' => 'article aside audio bdi canvas details dialog figcaption figure footer header hgroup main menu menuitem nav section source summary template track video',
                            //'new-blocklevel-tags' => 'footer header section menu menuitem'
                            //'new-empty-tags' => 'command embed keygen source track wbr',
                            //'new-inline-tags' => 'audio command datalist embed keygen mark menuitem meter output progress source time video wbr',
                        );

                        // Tidy
                        $tidy = new tidy();
                        $out = $tidy->repairString($out, $config, 'utf8');

                        //print "xxx".$out;exit;
                    }
                } catch (Exception $e) {
                    // If error, invalid HTML string with no way to clean it
                    //print $e->getMessage();
                    $out = 'InvalidHTMLStringCantBeCleaned ' . $e->getMessage();
                }
            }

            // Clean some html entities that are useless so text is cleaner
            $out = preg_replace('/&(tab|newline);/i', ' ', $out);

            // Ckeditor uses the numeric entity for apostrophe so we force it to text entity (all other special chars are
            // encoded using text entities) so we can then exclude all numeric entities.
            $out = preg_replace('/&#39;/i', '&apos;', $out);

            // We replace chars from a/A to z/Z encoded with numeric HTML entities with the real char so we won't loose the chars at the next step (preg_replace).
            // No need to use a loop here, this step is not to sanitize (this is done at next step, this is to try to save chars, even if they are
            // using a non conventionnal way to be encoded, to not have them sanitized just after)
            $out = preg_replace_callback(
                '/&#(x?[0-9][0-9a-f]+;?)/i',
                /**
                 * @param string[] $m
                 * @return string
                 */
                static function ($m) {
                    return realCharForNumericEntities($m);
                },
                $out
            );

            // Now we remove all remaining HTML entities starting with a number. We don't want such entities.
            $out = preg_replace('/&#x?[0-9]+/i', '', $out); // For example if we have j&#x61vascript with an entities without the ; to hide the 'a' of 'javascript'.

            // Keep only some html tags and remove also some 'javascript:' strings
            $out = dol_string_onlythesehtmltags($out, 0, ($check == 'restricthtmlallowclass' ? 0 : 1), 1);

            // Keep only some html attributes and exclude non expected HTML attributes and clean content of some attributes (keep only alt=, title=...).
            if (getDolGlobalString('MAIN_RESTRICTHTML_REMOVE_ALSO_BAD_ATTRIBUTES')) {
                $out = dol_string_onlythesehtmlattributes($out);
            }

            // Restore entity &apos; into &#39; (restricthtml is for html content so we can use html entity)
            $out = preg_replace('/&apos;/i', "&#39;", $out);
        } while ($oldstringtoclean != $out);

        // Check the limit of external links that are automatically executed in a Rich text content. We count:
        // '<img' to avoid <img src="http...">,  we can only accept "<img src="data:..."
        // 'url(' to avoid inline style like background: url(http...
        // '<link' to avoid <link href="http...">
        $reg = array();
        $tmpout = preg_replace('/<img src="data:/mi', '<__IMG_SRC_DATA__ src="data:', $out);
        preg_match_all('/(<img|url\(|<link)/i', $tmpout, $reg);
        $nblinks = count($reg[0]);
        if ($nblinks > getDolGlobalInt("MAIN_SECURITY_MAX_IMG_IN_HTML_CONTENT", 1000)) {
            $out = 'ErrorTooManyLinksIntoHTMLString';
        }

        if (getDolGlobalInt('MAIN_DISALLOW_URL_INTO_DESCRIPTIONS') == 2 || $check == 'restricthtmlnolink') {
            if ($nblinks > 0) {
                $out = 'ErrorHTMLLinksNotAllowed';
            }
        } elseif (getDolGlobalInt('MAIN_DISALLOW_URL_INTO_DESCRIPTIONS') == 1) {
            $nblinks = 0;
            // Loop on each url in src= and url(
            $pattern = '/src=["\']?(http[^"\']+)|url\(["\']?(http[^\)]+)/';

            $matches = array();
            if (preg_match_all($pattern, $out, $matches)) {
                // URLs are into $matches[1]
                $urls = $matches[1];

                // Affiche les URLs
                foreach ($urls as $url) {
                    $nblinks++;
                    echo "Found url = " . $url . "\n";
                }
                if ($nblinks > 0) {
                    $out = 'ErrorHTMLExternalLinksNotAllowed';
                }
            }
        }

        return $out;
    }
}

/**
 *  This function is called to encode a string into a HTML string but differs from htmlentities because
 *  a detection is done before to see if text is already HTML or not. Also, all entities but &,<,>," are converted.
 *  This permits to encode special chars to entities with no double encoding for already encoded HTML strings.
 *  This function also remove last EOL or BR if $removelasteolbr=1 (default).
 *  For PDF usage, you can show text by 2 ways:
 *        - writeHTMLCell -> param must be encoded into HTML.
 *        - MultiCell -> param must not be encoded into HTML.
 *        Because writeHTMLCell convert also \n into <br>, if function is used to build PDF, nl2brmode must be 1.
 *  Note: When we output string on pages, we should use
 *        - dolPrintHTML... that is dol_escape_htmltag(dol_htmlwithnojs(dol_string_onlythesehtmltags(dol_htmlentitiesbr(), 1, 1, 1), 1, 1) for notes or descriptions,
 *        - dolPrintPassword that is abelhtmlspecialchars( , ENT_COMPAT, 'UTF-8') for passwords.
 *
 * @param string $stringtoencode String to encode
 * @param int $nl2brmode 0=Adding br before \n, 1=Replacing \n by br (for use with FPDF writeHTMLCell function for example)
 * @param string $pagecodefrom Pagecode stringtoencode is encoded
 * @param int $removelasteolbr 1=Remove last br or lasts \n (default), 0=Do nothing
 * @return string                      String encoded
 * @see dol_escape_htmltag(), dolGetFirstLineOfText(), dol_string_onlythesehtmltags()
 */
function dol_htmlentitiesbr($stringtoencode, $nl2brmode = 0, $pagecodefrom = 'UTF-8', $removelasteolbr = 1)
{
    if (is_null($stringtoencode)) {
        return '';
    }

    $newstring = $stringtoencode;
    if (dol_textishtml($stringtoencode)) {  // Check if text is already HTML or not
        $newstring = preg_replace('/<br(\s[\sa-zA-Z_="]*)?\/?>/i', '<br>', $newstring); // Replace "<br type="_moz" />" by "<br>". It's same and avoid pb with FPDF.
        if ($removelasteolbr) {
            $newstring = preg_replace('/<br>$/i', '', $newstring); // Remove last <br> (remove only last one)
        }
        $newstring = strtr($newstring, array('&' => '__and__', '<' => '__lt__', '>' => '__gt__', '"' => '__dquot__'));
        $newstring = dol_htmlentities($newstring, ENT_COMPAT, $pagecodefrom); // Make entity encoding
        $newstring = strtr($newstring, array('__and__' => '&', '__lt__' => '<', '__gt__' => '>', '__dquot__' => '"'));
    } else {
        if ($removelasteolbr) {
            $newstring = preg_replace('/(\r\n|\r|\n)$/i', '', $newstring); // Remove last \n (may remove several)
        }
        $newstring = dol_nl2br(dol_htmlentities($newstring, ENT_COMPAT, $pagecodefrom), $nl2brmode);
    }
    // Other substitutions that htmlentities does not do
    //$newstring=str_replace(chr(128),'&euro;',$newstring); // 128 = 0x80. Not in html entity table.     // Seems useles with TCPDF. Make bug with UTF8 languages
    return $newstring;
}

/**
 *  This function is called to decode a HTML string (it decodes entities and br tags)
 *
 * @param string $stringtodecode String to decode
 * @param string $pagecodeto Page code for result
 * @return string                      String decoded
 */
function dol_htmlentitiesbr_decode($stringtodecode, $pagecodeto = 'UTF-8')
{
    $ret = dol_html_entity_decode($stringtodecode, ENT_COMPAT | ENT_HTML5, $pagecodeto);
    $ret = preg_replace('/' . "\r\n" . '<br(\s[\sa-zA-Z_="]*)?\/?>/i', "<br>", $ret);
    $ret = preg_replace('/<br(\s[\sa-zA-Z_="]*)?\/?>' . "\r\n" . '/i', "\r\n", $ret);
    $ret = preg_replace('/<br(\s[\sa-zA-Z_="]*)?\/?>' . "\n" . '/i', "\n", $ret);
    $ret = preg_replace('/<br(\s[\sa-zA-Z_="]*)?\/?>/i', "\n", $ret);
    return $ret;
}

/**
 *  This function remove all ending \n and br at end
 *
 * @param string $stringtodecode String to decode
 * @return string                      String decoded
 */
function dol_htmlcleanlastbr($stringtodecode)
{
    $ret = preg_replace('/&nbsp;$/i', "", $stringtodecode);     // Because wysiwyg editor may add a &nbsp; at end of last line
    $ret = preg_replace('/(<br>|<br(\s[\sa-zA-Z_="]*)?\/?>|' . "\n" . '|' . "\r" . ')+$/i', "", $ret);
    return $ret;
}

/**
 * Replace html_entity_decode functions to manage errors
 *
 * @param string $a Operand a
 * @param string $b Operand b (ENT_QUOTES|ENT_HTML5=convert simple, double quotes, colon, e accent, ...)
 * @param string $c Operand c
 * @param int $keepsomeentities Entities but &, <, >, " are not converted.
 * @return  string                      String decoded
 */
function dol_html_entity_decode($a, $b, $c = 'UTF-8', $keepsomeentities = 0)
{
    $newstring = $a;
    if ($keepsomeentities) {
        $newstring = strtr($newstring, array('&amp;' => '__andamp__', '&lt;' => '__andlt__', '&gt;' => '__andgt__', '"' => '__dquot__'));
    }
    $newstring = html_entity_decode((string)$newstring, (int)$b, (string)$c);
    if ($keepsomeentities) {
        $newstring = strtr($newstring, array('__andamp__' => '&amp;', '__andlt__' => '&lt;', '__andgt__' => '&gt;', '__dquot__' => '"'));
    }
    return $newstring;
}

/**
 * Replace htmlentities functions.
 * Goal of this function is to be sure to have default values of htmlentities that match what we need.
 *
 * @param string $string The input string to encode
 * @param int $flags Flags (see PHP doc above)
 * @param string $encoding Encoding page code
 * @param bool $double_encode When double_encode is turned off, PHP will not encode existing html entities
 * @return  string  $ret            Encoded string
 * @see dol_htmlentitiesbr()
 */
function dol_htmlentities($string, $flags = ENT_QUOTES | ENT_SUBSTITUTE, $encoding = 'UTF-8', $double_encode = false)
{
    return htmlentities($string, $flags, $encoding, $double_encode);
}

/**
 *  Clean a string from some undesirable HTML tags.
 *  Note: Complementary to dol_string_onlythesehtmltags().
 *  This method is used for example by dol_htmlwithnojs() when option MAIN_RESTRICTHTML_REMOVE_ALSO_BAD_ATTRIBUTES is set to 1.
 *
 * @param string $stringtoclean String to clean
 * @param string[] $allowed_attributes Array of tags not allowed
 * @return string                          String cleaned
 *
 * @see    dol_escape_htmltag() strip_tags() dol_string_nohtmltag() dol_string_onlythesehtmltags() dol_string_neverthesehtmltags()
 * @phan-suppress PhanUndeclaredProperty
 */
function dol_string_onlythesehtmlattributes($stringtoclean, $allowed_attributes = null)
{
    if (is_null($allowed_attributes)) {
        $allowed_attributes = array(
            "allow", "allowfullscreen", "alt", "class", "contenteditable", "data-html", "frameborder", "height", "href", "id", "name", "src", "style", "target", "title", "width",
            // HTML5
            "header", "footer", "nav", "section", "menu", "menuitem"
        );
    }

    if (class_exists('DOMDocument') && !empty($stringtoclean)) {
        $stringtoclean = '<?xml encoding="UTF-8"><html><body>' . $stringtoclean . '</body></html>';

        // Warning: loadHTML does not support HTML5 on old libxml versions.
        $dom = new DOMDocument('', 'UTF-8');
        // If $stringtoclean is wrong, it will generates warnings. So we disable warnings and restore them later.
        $savwarning = error_reporting();
        error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE);
        $dom->loadHTML($stringtoclean, LIBXML_ERR_NONE | LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD | LIBXML_NONET | LIBXML_NOWARNING | LIBXML_NOXMLDECL);
        error_reporting($savwarning);

        if ($dom instanceof DOMDocument) {
            for ($els = $dom->getElementsByTagname('*'), $i = $els->length - 1; $i >= 0; $i--) {
                $el = $els->item($i);
                if (!$el instanceof DOMElement) {
                    continue;
                }
                $attrs = $el->attributes;
                for ($ii = $attrs->length - 1; $ii >= 0; $ii--) {
                    //var_dump($attrs->item($ii));
                    if (!empty($attrs->item($ii)->name)) {
                        if (!in_array($attrs->item($ii)->name, $allowed_attributes)) {
                            // Delete attribute if not into allowed_attributes  @phan-suppress-next-line PhanUndeclaredMethod
                            $els->item($i)->removeAttribute($attrs->item($ii)->name);
                        } elseif (in_array($attrs->item($ii)->name, array('style'))) {
                            // If attribute is 'style'
                            $valuetoclean = $attrs->item($ii)->value;

                            if (isset($valuetoclean)) {
                                do {
                                    $oldvaluetoclean = $valuetoclean;
                                    $valuetoclean = preg_replace('/\/\*.*\*\//m', '', $valuetoclean);   // clean css comments
                                    $valuetoclean = preg_replace('/position\s*:\s*[a-z]+/mi', '', $valuetoclean);
                                    if ($els->item($i)->tagName == 'a') {   // more paranoiac cleaning for clickable tags.
                                        $valuetoclean = preg_replace('/display\s*:/mi', '', $valuetoclean);
                                        $valuetoclean = preg_replace('/z-index\s*:/mi', '', $valuetoclean);
                                        $valuetoclean = preg_replace('/\s+(top|left|right|bottom)\s*:/mi', '', $valuetoclean);
                                    }

                                    // We do not allow logout|passwordforgotten.php and action= into the content of a "style" tag
                                    $valuetoclean = preg_replace('/(logout|passwordforgotten)\.php/mi', '', $valuetoclean);
                                    $valuetoclean = preg_replace('/action=/mi', '', $valuetoclean);
                                } while ($oldvaluetoclean != $valuetoclean);
                            }

                            $attrs->item($ii)->value = $valuetoclean;
                        }
                    }
                }
            }
        }

        $return = $dom->saveHTML(); // This may add a LF at end of lines, so we will trim later
        //$return = '<html><body>aaaa</p>bb<p>ssdd</p>'."\n<p>aaa</p>aa<p>bb</p>";

        $return = preg_replace('/^' . preg_quote('<?xml encoding="UTF-8">', '/') . '/', '', $return);
        $return = preg_replace('/^' . preg_quote('<html><body>', '/') . '/', '', $return);
        $return = preg_replace('/' . preg_quote('</body></html>', '/') . '$/', '', $return);
        return trim($return);
    } else {
        return $stringtoclean;
    }
}

/**
 *  Return picto saying a field is required
 *
 * @return  string     Chaine avec picto obligatoire
 */
function picto_required()
{
    return '<span class="fieldrequired">*</span>';
}


/**
 *  Clean a string from all HTML tags and entities.
 *  This function differs from strip_tags because:
 *  - <br> are replaced with \n if removelinefeed=0 or 1
 *  - if entities are found, they are decoded BEFORE the strip
 *  - you can decide to convert line feed into a space
 *
 * @param string $stringtoclean String to clean
 * @param integer $removelinefeed 1=Replace all new lines by 1 space, 0=Only ending new lines are removed others are replaced with \n, 2=The ending new line is removed but others are kept with the same number of \n than the nb of <br> when there is both "...<br>\n..."
 * @param string $pagecodeto Encoding of input/output string
 * @param integer $strip_tags 0=Use internal strip, 1=Use strip_tags() php function (bugged when text contains a < char that is not for a html tag or when tags is not closed like '<img onload=aaa')
 * @param integer $removedoublespaces Replace double space into one space
 * @return string                      String cleaned
 *
 * @see    dol_escape_htmltag() strip_tags() dol_string_onlythesehtmltags() dol_string_neverthesehtmltags(), dolStripPhpCode()
 */
function dol_string_nohtmltag($stringtoclean, $removelinefeed = 1, $pagecodeto = 'UTF-8', $strip_tags = 0, $removedoublespaces = 1)
{
    if (is_null($stringtoclean)) {
        return '';
    }

    if ($removelinefeed == 2) {
        $stringtoclean = preg_replace('/<br[^>]*>(\n|\r)+/ims', '<br>', $stringtoclean);
    }
    $temp = preg_replace('/<br[^>]*>/i', "\n", $stringtoclean);

    // We remove entities BEFORE stripping (in case of an open separator char that is entity encoded and not the closing other, the strip will fails)
    $temp = dol_html_entity_decode($temp, ENT_COMPAT | ENT_HTML5, $pagecodeto);

    $temp = str_replace('< ', '__ltspace__', $temp);
    $temp = str_replace('<:', '__lttwopoints__', $temp);

    if ($strip_tags) {
        $temp = strip_tags($temp);
    } else {
        // Remove '<' into remaining, so remove non closing html tags like '<abc' or '<<abc'. Note: '<123abc' is not a html tag (can be kept), but '<abc123' is (must be removed).
        $pattern = "/<[^<>]+>/";
        // Example of $temp: <a href="/myurl" title="<u>A title</u>">0000-021</a>
        // pass 1 - $temp after pass 1: <a href="/myurl" title="A title">0000-021
        // pass 2 - $temp after pass 2: 0000-021
        $tempbis = $temp;
        do {
            $temp = $tempbis;
            $tempbis = str_replace('<>', '', $temp);    // No reason to have this into a text, except if value is to try bypass the next html cleaning
            $tempbis = preg_replace($pattern, '', $tempbis);
            //$idowhile++; print $temp.'-'.$tempbis."\n"; if ($idowhile > 100) break;
        } while ($tempbis != $temp);

        $temp = $tempbis;

        // Remove '<' into remaining, so remove non closing html tags like '<abc' or '<<abc'. Note: '<123abc' is not a html tag (can be kept), but '<abc123' is (must be removed).
        $temp = preg_replace('/<+([a-z]+)/i', '\1', $temp);
    }

    $temp = dol_html_entity_decode($temp, ENT_COMPAT, $pagecodeto);

    // Remove also carriage returns
    if ($removelinefeed == 1) {
        $temp = str_replace(array("\r\n", "\r", "\n"), " ", $temp);
    }

    // And double quotes
    if ($removedoublespaces) {
        while (strpos($temp, "  ")) {
            $temp = str_replace("  ", " ", $temp);
        }
    }

    $temp = str_replace('__ltspace__', '< ', $temp);
    $temp = str_replace('__lttwopoints__', '<:', $temp);

    return trim($temp);
}

/**
 *  Clean a string to keep only desirable HTML tags.
 *  WARNING: This also clean HTML comments (because they can be used to obfuscate tag name).
 *
 * @param string $stringtoclean String to clean
 * @param int $cleanalsosomestyles Remove absolute/fixed positioning from inline styles
 * @param int $removeclassattribute 1=Remove the class attribute from tags
 * @param int $cleanalsojavascript Remove also occurrence of 'javascript:'.
 * @param int $allowiframe Allow iframe tags.
 * @param string[] $allowed_tags List of allowed tags to replace the default list
 * @param int $allowlink Allow "link" tags.
 * @return string                          String cleaned
 *
 * @see    dol_htmlwithnojs() dol_escape_htmltag() strip_tags() dol_string_nohtmltag() dol_string_neverthesehtmltags()
 */
function dol_string_onlythesehtmltags($stringtoclean, $cleanalsosomestyles = 1, $removeclassattribute = 1, $cleanalsojavascript = 0, $allowiframe = 0, $allowed_tags = array(), $allowlink = 0)
{
    if (empty($allowed_tags)) {
        $allowed_tags = array(
            "html", "head", "meta", "body", "article", "a", "abbr", "b", "blockquote", "br", "cite", "div", "dl", "dd", "dt", "em", "font", "img", "ins", "hr", "i", "li",
            "ol", "p", "q", "s", "span", "strike", "strong", "title", "table", "tr", "th", "td", "u", "ul", "sup", "sub", "blockquote", "pre", "h1", "h2", "h3", "h4", "h5", "h6",
            "header", "footer", "nav", "section", "menu", "menuitem"    // html5 tags
        );
    }
    $allowed_tags[] = "comment";        // this tags is added to manage comment <!--...--> that are replaced into <comment>...</comment>
    if ($allowiframe) {
        if (!in_array('iframe', $allowed_tags)) {
            $allowed_tags[] = "iframe";
        }
    }
    if ($allowlink) {
        if (!in_array('link', $allowed_tags)) {
            $allowed_tags[] = "link";
        }
    }

    $allowed_tags_string = implode("><", $allowed_tags);
    $allowed_tags_string = '<' . $allowed_tags_string . '>';

    $stringtoclean = str_replace('<!DOCTYPE html>', '__!DOCTYPE_HTML__', $stringtoclean);   // Replace DOCTYPE to avoid to have it removed by the strip_tags

    $stringtoclean = dol_string_nounprintableascii($stringtoclean, 0);

    //$stringtoclean = preg_replace('/<!--[^>]*-->/', '', $stringtoclean);
    $stringtoclean = preg_replace('/<!--([^>]*)-->/', '<comment>\1</comment>', $stringtoclean);

    $stringtoclean = preg_replace('/&colon;/i', ':', $stringtoclean);
    $stringtoclean = preg_replace('/&#58;|&#0+58|&#x3A/i', '', $stringtoclean); // refused string ':' encoded (no reason to have a : encoded like this) to disable 'javascript:...'

    $temp = strip_tags($stringtoclean, $allowed_tags_string);   // Warning: This remove also undesired </>, so may changes string obfuscated with </> that pass the injection detection into a harmfull string

    if ($cleanalsosomestyles) { // Clean for remaining html tags
        $temp = preg_replace('/position\s*:\s*(absolute|fixed)\s*!\s*important/i', '', $temp); // Note: If hacker try to introduce css comment into string to bypass this regex, the string must also be encoded by the dol_htmlentitiesbr during output so it become harmless
    }
    if ($removeclassattribute) {    // Clean for remaining html tags
        $temp = preg_replace('/(<[^>]+)\s+class=((["\']).*?\\3|\\w*)/i', '\\1', $temp);
    }

    // Remove 'javascript:' that we should not find into a text with
    // Warning: This is not reliable to fight against obfuscated javascript, there is a lot of other solution to include js into a common html tag (only filtered by a GETPOST(.., powerfullfilter)).
    if ($cleanalsojavascript) {
        $temp = preg_replace('/j\s*a\s*v\s*a\s*s\s*c\s*r\s*i\s*p\s*t\s*:/i', '', $temp);
    }

    $temp = str_replace('__!DOCTYPE_HTML__', '<!DOCTYPE html>', $temp); // Restore the DOCTYPE

    $temp = preg_replace('/<comment>([^>]*)<\/comment>/', '<!--\1-->', $temp);  // Restore html comments


    return $temp;
}

/**
 *  Clean a string from some undesirable HTML tags.
 *  Note: You should use instead dol_string_onlythesehtmltags() that is more secured if you can.
 *
 * @param string $stringtoclean String to clean
 * @param array $disallowed_tags Array of tags not allowed
 * @param int $cleanalsosomestyles Clean also some tags
 * @return string                          String cleaned
 *
 * @see    dol_escape_htmltag() strip_tags() dol_string_nohtmltag() dol_string_onlythesehtmltags() dol_string_onlythesehtmlattributes()
 */
function dol_string_neverthesehtmltags($stringtoclean, $disallowed_tags = array('textarea'), $cleanalsosomestyles = 0)
{
    $temp = $stringtoclean;
    foreach ($disallowed_tags as $tagtoremove) {
        $temp = preg_replace('/<\/?' . $tagtoremove . '>/', '', $temp);
        $temp = preg_replace('/<\/?' . $tagtoremove . '\s+[^>]*>/', '', $temp);
    }

    if ($cleanalsosomestyles) {
        $temp = preg_replace('/position\s*:\s*(absolute|fixed)\s*!\s*important/', '', $temp); // Note: If hacker try to introduce css comment into string to avoid this, string should be encoded by the dol_htmlentitiesbr so be harmless
    }

    return $temp;
}


/**
 *  Return yes or no in current language
 *
 * @param string|int $yesno Value to test (1, 'yes', 'true' or 0, 'no', 'false')
 * @param integer $case 1=Yes/No, 0=yes/no, 2=Disabled checkbox, 3=Disabled checkbox + Yes/No
 * @param int $color 0=texte only, 1=Text is formatted with a color font style ('ok' or 'error'), 2=Text is formatted with 'ok' color.
 * @return string                      HTML string
 */
function yn($yesno, $case = 1, $color = 0)
{
    global $langs;

    $result = 'unknown';
    $classname = '';
    if ($yesno == 1 || (isset($yesno) && (strtolower($yesno) == 'yes' || strtolower($yesno) == 'true'))) {  // To set to 'no' before the test because of the '== 0'
        $result = $langs->trans('yes');
        if ($case == 1 || $case == 3) {
            $result = $langs->trans("Yes");
        }
        if ($case == 2) {
            $result = '<input type="checkbox" value="1" checked disabled>';
        }
        if ($case == 3) {
            $result = '<input type="checkbox" value="1" checked disabled> ' . $result;
        }
        if ($case == 4) {
            $result = img_picto('check', 'check');
        }

        $classname = 'ok';
    } elseif ($yesno == 0 || strtolower($yesno) == 'no' || strtolower($yesno) == 'false') {
        $result = $langs->trans("no");
        if ($case == 1 || $case == 3) {
            $result = $langs->trans("No");
        }
        if ($case == 2) {
            $result = '<input type="checkbox" value="0" disabled>';
        }
        if ($case == 3) {
            $result = '<input type="checkbox" value="0" disabled> ' . $result;
        }
        if ($case == 4) {
            $result = img_picto('uncheck', 'uncheck');
        }

        if ($color == 2) {
            $classname = 'ok';
        } else {
            $classname = 'error';
        }
    }
    if ($color) {
        return '<span class="' . $classname . '">' . $result . '</span>';
    }
    return $result;
}
