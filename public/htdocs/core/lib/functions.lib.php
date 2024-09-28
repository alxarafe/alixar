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

use Dolibarr\Code\Core\Classes\DolGeoIP;
use Dolibarr\Code\Core\Classes\HookManager;
use Dolibarr\Code\Core\Classes\Translate;
use Dolibarr\Code\Fourn\Classes\ProductFournisseur;
use Dolibarr\Code\Product\Classes\Product;
use Dolibarr\Code\Societe\Classes\Societe;
use Dolibarr\Code\User\Classes\User;
use Dolibarr\Core\Base\CommonObject;

/**
 *  \file           htdocs/core/lib/functions.lib.php
 *  \brief          A set of functions for Dolibarr
 *                  This file contains all frequently used functions.
 */

include_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/json.lib.php';

/**
 * Functions extracted from functions.lib
 */
include_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/data.lib.php';
include_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/html.lib.php';

/**
 * Return the full path of the directory where a module (or an object of a module) stores its files,
 * Path may depends on the entity if a multicompany module is enabled.
 *
 * @param CommonObject $object Dolibarr common object
 * @param string $module Override object element, for example to use 'mycompany' instead of 'societe'
 * @param int $forobject Return the more complete path for the given object instead of for the module only.
 * @param string $mode 'output' (full main dir) or 'outputrel' (relative dir) or 'temp' (for temporary files) or 'version' (dir for archived files)
 * @return  string|null                 The path of the relative directory of the module, ending with /
 * @since Dolibarr V18
 */
function getMultidirOutput($object, $module = '', $forobject = 0, $mode = 'output')
{
    global $conf;

    if (!is_object($object) && empty($module)) {
        return null;
    }
    if (empty($module) && !empty($object->element)) {
        $module = $object->element;
    }

    // Special case for backward compatibility
    if ($module == 'fichinter') {
        $module = 'ficheinter';
    } elseif ($module == 'invoice_supplier') {
        $module = 'supplier_invoice';
    } elseif ($module == 'order_supplier') {
        $module = 'supplier_order';
    }

    // Get the relative path of directory
    if ($mode == 'output' || $mode == 'outputrel' || $mode == 'version') {
        if (isset($conf->$module) && property_exists($conf->$module, 'multidir_output')) {
            $s = '';
            if ($mode != 'outputrel') {
                $s = $conf->$module->multidir_output[(empty($object->entity) ? $conf->entity : $object->entity)];
            }
            if ($forobject && $object->id > 0) {
                $s .= ($mode != 'outputrel' ? '/' : '') . get_exdir(0, 0, 0, 0, $object);
            }
            return $s;
        } else {
            return 'error-diroutput-not-defined-for-this-object=' . $module;
        }
    } elseif ($mode == 'temp') {
        if (isset($conf->$module) && property_exists($conf->$module, 'multidir_temp')) {
            return $conf->$module->multidir_temp[(empty($object->entity) ? $conf->entity : $object->entity)];
        } else {
            return 'error-dirtemp-not-defined-for-this-object=' . $module;
        }
    } else {
        return 'error-bad-value-for-mode';
    }
}

/**
 * Return the full path of the directory where a module (or an object of a module) stores its temporary files.
 * Path may depends on the entity if a multicompany module is enabled.
 *
 * @param CommonObject $object Dolibarr common object
 * @param string $module Override object element, for example to use 'mycompany' instead of 'societe'
 * @param int $forobject Return the more complete path for the given object instead of for the module only.
 * @return  string|null                 The path of the relative temp directory of the module
 */
function getMultidirTemp($object, $module = '', $forobject = 0)
{
    return getMultidirOutput($object, $module, $forobject, 'temp');
}

/**
 * Return the full path of the directory where a module (or an object of a module) stores its versioned files.
 * Path may depends on the entity if a multicompany module is enabled.
 *
 * @param CommonObject $object Dolibarr common object
 * @param string $module Override object element, for example to use 'mycompany' instead of 'societe'
 * @param int $forobject Return the more complete path for the given object instead of for the module only.
 * @return string|null                  The path of the relative version directory of the module
 */
function getMultidirVersion($object, $module = '', $forobject = 0)
{
    return getMultidirOutput($object, $module, $forobject, 'version');
}


/**
 * Return dolibarr global constant string value
 *
 * @param string $key key to return value, return $default if not set
 * @param string $default value to return
 * @return string
 * @see getDolUserString()
 */
function getDolGlobalString($key, $default = '')
{
    global $conf;
    return (string)(isset($conf->global->$key) ? $conf->global->$key : $default);
}

/**
 * Return a Dolibarr global constant int value.
 * The constants $conf->global->xxx are loaded by the script master.inc.php included at begin of any PHP page.
 *
 * @param string $key key to return value, return 0 if not set
 * @param int $default value to return
 * @return int
 * @see getDolUserInt()
 */
function getDolGlobalInt($key, $default = 0)
{
    global $conf;
    return (int)(isset($conf->global->$key) ? $conf->global->$key : $default);
}

/**
 * Return Dolibarr user constant string value
 *
 * @param string $key key to return value, return '' if not set
 * @param string $default value to return
 * @param User $tmpuser To get another user than current user
 * @return string
 */
function getDolUserString($key, $default = '', $tmpuser = null)
{
    if (empty($tmpuser)) {
        global $user;
        $tmpuser = $user;
    }

    return (string)(empty($tmpuser->conf->$key) ? $default : $tmpuser->conf->$key);
}

/**
 * Return Dolibarr user constant int value
 *
 * @param string $key key to return value, return 0 if not set
 * @param int $default value to return
 * @param User $tmpuser To get another user than current user
 * @return int
 */
function getDolUserInt($key, $default = 0, $tmpuser = null)
{
    if (empty($tmpuser)) {
        global $user;
        $tmpuser = $user;
    }

    return (int)(empty($tmpuser->conf->$key) ? $default : $tmpuser->conf->$key);
}


/**
 * This mapping defines the conversion to the current internal
 * names from the alternative allowed names (including effectively deprecated
 * and future new names (not yet used as internal names).
 *
 * This allows to map any temporary or future name to the effective internal name.
 *
 * The value is typically the name of module's root directory.
 */
define(
    'MODULE_MAPPING',
    array(
        // Map deprecated names to new names
        'adherent' => 'member',  // Has new directory
        'member_type' => 'adherent_type',   // No directory, but file called adherent_type
        'banque' => 'bank',   // Has new directory
        'contrat' => 'contract', // Has new directory
        'entrepot' => 'stock',   // Has new directory
        'projet' => 'project', // Has new directory
        'categorie' => 'category', // Has old directory
        'commande' => 'order',    // Has old directory
        'expedition' => 'shipping', // Has old directory
        'facture' => 'invoice', // Has old directory
        'fichinter' => 'intervention', // Has old directory
        'ficheinter' => 'intervention',  // Backup for 'fichinter'
        'propale' => 'propal', // Has old directory
        'socpeople' => 'contact', // Has old directory
        'fournisseur' => 'supplier',  // Has old directory

        'actioncomm' => 'agenda',  // NO module directory (public dir agenda)
        'product_price' => 'productprice', // NO directory
        'product_fournisseur_price' => 'productsupplierprice', // NO directory
    )
);

/**
 * Is Dolibarr module enabled
 *
 * @param string $module Module name to check
 * @return  boolean             True if module is enabled
 */
function isModEnabled($module)
{
    global $conf;

    // Fix old names (map to new names)
    $arrayconv = MODULE_MAPPING;
    $arrayconvbis = array_flip(MODULE_MAPPING);

    if (!getDolGlobalString('MAIN_USE_NEW_SUPPLIERMOD')) {
        // Special cases: both use the same module.
        $arrayconv['supplier_order'] = 'fournisseur';
        $arrayconv['supplier_invoice'] = 'fournisseur';
    }
    // Special case.
    // @TODO Replace isModEnabled('delivery_note') with
    // isModEnabled('shipping') && getDolGlobalString('MAIN_SUBMODULE_EXPEDITION')
    if ($module == 'delivery_note') {
        if (!getDolGlobalString('MAIN_SUBMODULE_EXPEDITION')) {
            return false;
        } else {
            $module = 'shipping';
        }
    }

    $module_alt = $module;
    if (!empty($arrayconv[$module])) {
        $module_alt = $arrayconv[$module];
    }
    $module_bis = $module;
    if (!empty($arrayconvbis[$module])) {
        $module_bis = $arrayconvbis[$module];
    }

    return !empty($conf->modules[$module]) || !empty($conf->modules[$module_alt]) || !empty($conf->modules[$module_bis]);
    //return !empty($conf->$module->enabled);
}

/**
 * isDolTms check if a timestamp is valid.
 *
 * @param int|string|null $timestamp timestamp to check
 * @return bool
 */
function isDolTms($timestamp)
{
    if ($timestamp === '') {
        dol_syslog('Using empty string for a timestamp is deprecated, prefer use of null when calling page ' . $_SERVER["PHP_SELF"], LOG_NOTICE);
        return false;
    }
    if (is_null($timestamp) || !is_numeric($timestamp)) {
        return false;
    }

    return true;
}

/**
 * Return a DoliDB instance (database handler).
 *
 * @param string $type Type of database (mysql, pgsql...)
 * @param string $host Address of database server
 * @param string $user Authorized username
 * @param string $pass Password
 * @param string $name Name of database
 * @param int $port Port of database server
 * @return  DoliDB              A DoliDB instance
 */
function getDoliDBInstance($type, $host, $user, $pass, $name, $port)
{
    require_once DOL_DOCUMENT_ROOT . "/core/db/" . $type . '.class.php';

    $class = 'DoliDB' . ucfirst($type);
    $db = new $class($type, $host, $user, $pass, $name, $port);
    return $db;
}

/**
 *  Get list of entity id to use.
 *
 * @param string $element Current element
 *                                  'societe', 'socpeople', 'actioncomm', 'agenda', 'resource',
 *                                  'product', 'productprice', 'stock', 'bom', 'mo',
 *                                  'propal', 'supplier_proposal', 'invoice', 'supplier_invoice', 'payment_various',
 *                                  'categorie', 'bank_account', 'bank_account', 'adherent', 'user',
 *                                  'commande', 'supplier_order', 'expedition', 'intervention', 'survey',
 *                                  'contract', 'tax', 'expensereport', 'holiday', 'multicurrency', 'project',
 *                                  'email_template', 'event', 'donation'
 *                                  'c_paiement', 'c_payment_term', ...
 * @param int<0,1> $shared 0=Return id of current entity only,
 *                                  1=Return id of current entity + shared entities (default)
 * @param  ?CommonObject $currentobject Current object if needed
 * @return string                  Entity id(s) to use ( eg. entity IN ('.getEntity(elementname).')' )
 */
function getEntity($element, $shared = 1, $currentobject = null)
{
    global $conf, $mc, $hookmanager, $object, $action, $db;

    if (!is_object($hookmanager)) {
        $hookmanager = new HookManager($db);
    }

    // fix different element names (France to English)
    switch ($element) {
        case 'projet':
            $element = 'project';
            break;
        case 'contrat':
            $element = 'contract';
            break; // "/contrat/class/contrat.class.php"
        case 'order_supplier':
            $element = 'supplier_order';
            break; // "/fourn/class/fournisseur.commande.class.php"
        case 'invoice_supplier':
            $element = 'supplier_invoice';
            break; // "/fourn/class/fournisseur.facture.class.php"
    }

    if (is_object($mc)) {
        $out = $mc->getEntity($element, $shared, $currentobject);
    } else {
        $out = '';
        $addzero = array('user', 'usergroup', 'cronjob', 'c_email_templates', 'email_template', 'default_values', 'overwrite_trans');
        if (in_array($element, $addzero)) {
            $out .= '0,';
        }
        $out .= ((int)$conf->entity);
    }

    // Manipulate entities to query on the fly
    $parameters = array(
        'element' => $element,
        'shared' => $shared,
        'object' => $object,
        'currentobject' => $currentobject,
        'out' => $out
    );
    $reshook = $hookmanager->executeHooks('hookGetEntity', $parameters, $currentobject, $action); // Note that $action and $object may have been modified by some hooks

    if (is_numeric($reshook)) {
        if ($reshook == 0 && !empty($hookmanager->resPrint)) {
            $out .= ',' . $hookmanager->resPrint; // add
        } elseif ($reshook == 1) {
            $out = $hookmanager->resPrint; // replace
        }
    }

    return $out;
}

/**
 *  Set entity id to use when to create an object
 *
 * @param CommonObject $currentobject Current object
 * @return int                             Entity id to use ( eg. entity = '.setEntity($object) )
 */
function setEntity($currentobject)
{
    global $conf, $mc;

    if (is_object($mc) && method_exists($mc, 'setEntity')) {
        return $mc->setEntity($currentobject);
    } else {
        return ((is_object($currentobject) && $currentobject->id > 0 && $currentobject->entity > 0) ? $currentobject->entity : $conf->entity);
    }
}

/**
 *  Return if string has a name dedicated to store a secret
 *
 * @param string $keyname Name of key to test
 * @return boolean             True if key is used to store a secret
 */
function isASecretKey($keyname)
{
    return preg_match('/(_pass|password|_pw|_key|securekey|serverkey|secret\d?|p12key|exportkey|_PW_[a-z]+|token)$/i', $keyname);
}


/**
 * Return a numeric value into an Excel like column number. So 0 return 'A', 1 returns 'B'..., 26 return 'AA'
 *
 * @param int|string $n Numeric value
 * @return  string                  Column in Excel format
 */
function num2Alpha($n)
{
    for ($r = ""; $n >= 0; $n = intval($n / 26) - 1) {
        $r = chr($n % 26 + 0x41) . $r;
    }
    return $r;
}


/**
 * Return information about user browser
 *
 * Returns array with the following format:
 * array(
 *  'browsername' => Browser name (firefox|chrome|iceweasel|epiphany|safari|opera|ie|unknown)
 *  'browserversion' => Browser version. Empty if unknown
 *  'browseros' => Set with mobile OS (android|blackberry|ios|palm|symbian|webos|maemo|windows|unknown)
 *  'layout' => (tablet|phone|classic)
 *  'phone' => empty if not mobile, (android|blackberry|ios|palm|unknown) if mobile
 *  'tablet' => true/false
 * )
 *
 * @param string $user_agent Content of $_SERVER["HTTP_USER_AGENT"] variable
 * @return  array{browsername:string,browserversion:string,browseros:string,browserua:string,layout:string,phone:string,tablet:bool} Check function documentation
 */
function getBrowserInfo($user_agent)
{
    include_once DOL_DOCUMENT_ROOT . '/includes/mobiledetect/mobiledetectlib/Mobile_Detect.php';

    $name = 'unknown';
    $version = '';
    $os = 'unknown';
    $phone = '';

    $user_agent = substr($user_agent, 0, 512);  // Avoid to process too large user agent

    $detectmobile = new Mobile_Detect(null, $user_agent);
    $tablet = $detectmobile->isTablet();

    if ($detectmobile->isMobile()) {
        $phone = 'unknown';

        // If phone/smartphone, we set phone os name.
        if ($detectmobile->is('AndroidOS')) {
            $os = $phone = 'android';
        } elseif ($detectmobile->is('BlackBerryOS')) {
            $os = $phone = 'blackberry';
        } elseif ($detectmobile->is('iOS')) {
            $os = 'ios';
            $phone = 'iphone';
        } elseif ($detectmobile->is('PalmOS')) {
            $os = $phone = 'palm';
        } elseif ($detectmobile->is('SymbianOS')) {
            $os = 'symbian';
        } elseif ($detectmobile->is('webOS')) {
            $os = 'webos';
        } elseif ($detectmobile->is('MaemoOS')) {
            $os = 'maemo';
        } elseif ($detectmobile->is('WindowsMobileOS') || $detectmobile->is('WindowsPhoneOS')) {
            $os = 'windows';
        }
    }

    // OS
    if (preg_match('/linux/i', $user_agent)) {
        $os = 'linux';
    } elseif (preg_match('/macintosh/i', $user_agent)) {
        $os = 'macintosh';
    } elseif (preg_match('/windows/i', $user_agent)) {
        $os = 'windows';
    }

    // Name
    $reg = array();
    if (preg_match('/firefox(\/|\s)([\d.]*)/i', $user_agent, $reg)) {
        $name = 'firefox';
        $version = empty($reg[2]) ? '' : $reg[2];
    } elseif (preg_match('/edge(\/|\s)([\d.]*)/i', $user_agent, $reg)) {
        $name = 'edge';
        $version = empty($reg[2]) ? '' : $reg[2];
    } elseif (preg_match('/chrome(\/|\s)([\d.]+)/i', $user_agent, $reg)) {
        $name = 'chrome';
        $version = empty($reg[2]) ? '' : $reg[2];
    } elseif (preg_match('/chrome/i', $user_agent, $reg)) {
        // we can have 'chrome (Mozilla...) chrome x.y' in one string
        $name = 'chrome';
    } elseif (preg_match('/iceweasel/i', $user_agent)) {
        $name = 'iceweasel';
    } elseif (preg_match('/epiphany/i', $user_agent)) {
        $name = 'epiphany';
    } elseif (preg_match('/safari(\/|\s)([\d.]*)/i', $user_agent, $reg)) {
        $name = 'safari';
        $version = empty($reg[2]) ? '' : $reg[2];
    } elseif (preg_match('/opera(\/|\s)([\d.]*)/i', $user_agent, $reg)) {
        // Safari is often present in string for mobile but its not.
        $name = 'opera';
        $version = empty($reg[2]) ? '' : $reg[2];
    } elseif (preg_match('/(MSIE\s([0-9]+\.[0-9]))|.*(Trident\/[0-9]+.[0-9];.*rv:([0-9]+\.[0-9]+))/i', $user_agent, $reg)) {
        $name = 'ie';
        $version = end($reg);
    } elseif (preg_match('/(Windows NT\s([0-9]+\.[0-9])).*(Trident\/[0-9]+.[0-9];.*rv:([0-9]+\.[0-9]+))/i', $user_agent, $reg)) {
        // MS products at end
        $name = 'ie';
        $version = end($reg);
    } elseif (preg_match('/l[iy]n(x|ks)(\(|\/|\s)*([\d.]+)/i', $user_agent, $reg)) {
        // MS products at end
        $name = 'lynxlinks';
        $version = empty($reg[3]) ? '' : $reg[3];
    }

    if ($tablet) {
        $layout = 'tablet';
    } elseif ($phone) {
        $layout = 'phone';
    } else {
        $layout = 'classic';
    }

    return array(
        'browsername' => $name,
        'browserversion' => $version,
        'browseros' => $os,
        'browserua' => $user_agent,
        'layout' => $layout,    // tablet, phone, classic
        'phone' => $phone,      // deprecated
        'tablet' => $tablet     // deprecated
    );
}

/**
 *  Function called at end of web php process
 *
 * @return void
 */
function dol_shutdown()
{
    global $db;
    $disconnectdone = false;
    $depth = 0;
    if (is_object($db) && !empty($db->connected)) {
        $depth = $db->transaction_opened;
        $disconnectdone = $db->close();
    }
    dol_syslog("--- End access to " . (empty($_SERVER["PHP_SELF"]) ? 'unknown' : $_SERVER["PHP_SELF"]) . (($disconnectdone && $depth) ? ' (Warn: db disconnection forced, transaction depth was ' . $depth . ')' : ''), (($disconnectdone && $depth) ? LOG_WARNING : LOG_INFO));
}

/**
 * Return true if we are in a context of submitting the parameter $paramname from a POST of a form.
 * Warning:
 * For action=add, use:     $var = GETPOST('var');      // No GETPOSTISSET, so GETPOST always called and default value is retrieved if not a form POST, and value of form is retrieved if it is a form POST.
 * For action=update, use:  $var = GETPOSTISSET('var') ? GETPOST('var') : $object->var;
 *
 * @param string $paramname Name or parameter to test
 * @return  boolean                 True if we have just submit a POST or GET request with the parameter provided (even if param is empty)
 */
function GETPOSTISSET($paramname)
{
    $isset = false;

    $relativepathstring = $_SERVER["PHP_SELF"];
    // Clean $relativepathstring
    if (constant('DOL_URL_ROOT')) {
        $relativepathstring = preg_replace('/^' . preg_quote(constant('DOL_URL_ROOT'), '/') . '/', '', $relativepathstring);
    }
    $relativepathstring = preg_replace('/^\//', '', $relativepathstring);
    $relativepathstring = preg_replace('/^custom\//', '', $relativepathstring);
    //var_dump($relativepathstring);
    //var_dump($user->default_values);

    // Code for search criteria persistence.
    // Retrieve values if restore_lastsearch_values
    if (!empty($_GET['restore_lastsearch_values'])) {        // Use $_GET here and not GETPOST
        if (!empty($_SESSION['lastsearch_values_' . $relativepathstring])) {  // If there is saved values
            $tmp = json_decode($_SESSION['lastsearch_values_' . $relativepathstring], true);
            if (is_array($tmp)) {
                foreach ($tmp as $key => $val) {
                    if ($key == $paramname) {   // We are on the requested parameter
                        $isset = true;
                        break;
                    }
                }
            }
        }
        // If there is saved contextpage, limit, page or mode
        if ($paramname == 'contextpage' && !empty($_SESSION['lastsearch_contextpage_' . $relativepathstring])) {
            $isset = true;
        } elseif ($paramname == 'limit' && !empty($_SESSION['lastsearch_limit_' . $relativepathstring])) {
            $isset = true;
        } elseif ($paramname == 'page' && !empty($_SESSION['lastsearch_page_' . $relativepathstring])) {
            $isset = true;
        } elseif ($paramname == 'mode' && !empty($_SESSION['lastsearch_mode_' . $relativepathstring])) {
            $isset = true;
        }
    } else {
        $isset = (isset($_POST[$paramname]) || isset($_GET[$paramname])); // We must keep $_POST and $_GET here
    }

    return $isset;
}

/**
 * Return true if the parameter $paramname is submit from a POST OR GET as an array.
 * Can be used before GETPOST to know if the $check param of GETPOST need to check an array or a string
 *
 * @param string $paramname Name or parameter to test
 * @param int<0,3> $method Type of method (0 = get then post, 1 = only get, 2 = only post, 3 = post then get)
 * @return  bool                    True if we have just submit a POST or GET request with the parameter provided (even if param is empty)
 */
function GETPOSTISARRAY($paramname, $method = 0)
{
    // for $method test need return the same $val as GETPOST
    if (empty($method)) {
        $val = $_GET[$paramname] ?? ($_POST[$paramname] ?? '');
    } elseif ($method == 1) {
        $val = $_GET[$paramname] ?? '';
    } elseif ($method == 2) {
        $val = $_POST[$paramname] ?? '';
    } elseif ($method == 3) {
        $val = $_POST[$paramname] ?? ($_GET[$paramname] ?? '');
    } else {
        $val = 'BadFirstParameterForGETPOST';
    }

    return is_array($val);
}

/**
 *  Return value of a param into GET or POST supervariable.
 *  Use the property $user->default_values[path]['createform'] and/or $user->default_values[path]['filters'] and/or $user->default_values[path]['sortorder']
 *  Note: The property $user->default_values is loaded by main.php when loading the user.
 *
 * @param string $paramname Name of parameter to found
 * @param string $check Type of check
 *                               ''=no check (deprecated)
 *                               'none'=no check (only for param that should have very rich content like passwords)
 *                               'array', 'array:restricthtml' or 'array:aZ09' to check it's an array
 *                               'int'=check it's numeric (integer or float)
 *                               'intcomma'=check it's integer+comma ('1,2,3,4...')
 *                               'alpha'=Same than alphanohtml
 *                               'alphawithlgt'=alpha with lgt
 *                               'alphanohtml'=check there is no html content and no " and no ../
 *                               'aZ'=check it's a-z only
 *                               'aZ09'=check it's simple alpha string (recommended for keys)
 *                               'aZ09arobase'=check it's a string for an element type ('myobject@mymodule')
 *                               'aZ09comma'=check it's a string for a sortfield or sortorder
 *                               'san_alpha'=Use filter_var with FILTER_SANITIZE_STRING (do not use this for free text string)
 *                               'nohtml'=check there is no html content
 *                               'restricthtml'=check html content is restricted to some tags only
 *                               'custom'= custom filter specify $filter and $options)
 * @param int $method Type of method (0 = get then post, 1 = only get, 2 = only post, 3 = post then get)
 * @param  ?int $filter Filter to apply when $check is set to 'custom'. (See http://php.net/manual/en/filter.filters.php for détails)
 * @param mixed $options Options to pass to filter_var when $check is set to 'custom'
 * @param int $noreplace Force disable of replacement of __xxx__ strings.
 * @return string|array         Value found (string or array), or '' if check fails
 */
function GETPOST($paramname, $check = 'alphanohtml', $method = 0, $filter = null, $options = null, $noreplace = 0)
{
    global $mysoc, $user, $conf;

    if (empty($paramname)) {   // Explicit test for null for phan.
        return 'BadFirstParameterForGETPOST';
    }
    if (empty($check)) {
        dol_syslog("Deprecated use of GETPOST, called with 1st param = " . $paramname . " and a 2nd param that is '', when calling page " . $_SERVER["PHP_SELF"], LOG_WARNING);
        // Enable this line to know who call the GETPOST with '' $check parameter.
        //var_dump(debug_backtrace()[0]);
    }

    if (empty($method)) {
        $out = isset($_GET[$paramname]) ? $_GET[$paramname] : (isset($_POST[$paramname]) ? $_POST[$paramname] : '');
    } elseif ($method == 1) {
        $out = isset($_GET[$paramname]) ? $_GET[$paramname] : '';
    } elseif ($method == 2) {
        $out = isset($_POST[$paramname]) ? $_POST[$paramname] : '';
    } elseif ($method == 3) {
        $out = isset($_POST[$paramname]) ? $_POST[$paramname] : (isset($_GET[$paramname]) ? $_GET[$paramname] : '');
    } else {
        return 'BadThirdParameterForGETPOST';
    }

    $relativepathstring = ''; // For static analysis - looks possibly undefined if not set.

    if (empty($method) || $method == 3 || $method == 4) {
        $relativepathstring = (empty($_SERVER["PHP_SELF"]) ? '' : $_SERVER["PHP_SELF"]);
        // Clean $relativepathstring
        if (constant('DOL_URL_ROOT')) {
            $relativepathstring = preg_replace('/^' . preg_quote(constant('DOL_URL_ROOT'), '/') . '/', '', $relativepathstring);
        }
        $relativepathstring = preg_replace('/^\//', '', $relativepathstring);
        $relativepathstring = preg_replace('/^custom\//', '', $relativepathstring);
        //var_dump($relativepathstring);
        //var_dump($user->default_values);

        // Code for search criteria persistence.
        // Retrieve saved values if restore_lastsearch_values is set
        if (!empty($_GET['restore_lastsearch_values'])) {        // Use $_GET here and not GETPOST
            if (!empty($_SESSION['lastsearch_values_' . $relativepathstring])) {  // If there is saved values
                $tmp = json_decode($_SESSION['lastsearch_values_' . $relativepathstring], true);
                if (is_array($tmp)) {
                    foreach ($tmp as $key => $val) {
                        if ($key == $paramname) {   // We are on the requested parameter
                            $out = $val;
                            break;
                        }
                    }
                }
            }
            // If there is saved contextpage, page or limit
            if ($paramname == 'contextpage' && !empty($_SESSION['lastsearch_contextpage_' . $relativepathstring])) {
                $out = $_SESSION['lastsearch_contextpage_' . $relativepathstring];
            } elseif ($paramname == 'limit' && !empty($_SESSION['lastsearch_limit_' . $relativepathstring])) {
                $out = $_SESSION['lastsearch_limit_' . $relativepathstring];
            } elseif ($paramname == 'page' && !empty($_SESSION['lastsearch_page_' . $relativepathstring])) {
                $out = $_SESSION['lastsearch_page_' . $relativepathstring];
            } elseif ($paramname == 'mode' && !empty($_SESSION['lastsearch_mode_' . $relativepathstring])) {
                $out = $_SESSION['lastsearch_mode_' . $relativepathstring];
            }
        } elseif (!isset($_GET['sortfield'])) {
            // Else, retrieve default values if we are not doing a sort
            // If we did a click on a field to sort, we do no apply default values. Same if option MAIN_ENABLE_DEFAULT_VALUES is not set
            if (!empty($_GET['action']) && $_GET['action'] == 'create' && !isset($_GET[$paramname]) && !isset($_POST[$paramname])) {
                // Search default value from $object->field
                global $object;
                '@phan-var-force CommonObject $object'; // Suppose it's a CommonObject for analysis, but other objects have the $fields field as well
                if (is_object($object) && isset($object->fields[$paramname]['default'])) {
                    // @phan-suppress-next-line PhanTypePossiblyInvalidDimOffset
                    $out = $object->fields[$paramname]['default'];
                }
            }
            if (getDolGlobalString('MAIN_ENABLE_DEFAULT_VALUES')) {
                if (!empty($_GET['action']) && (preg_match('/^create/', $_GET['action']) || preg_match('/^presend/', $_GET['action'])) && !isset($_GET[$paramname]) && !isset($_POST[$paramname])) {
                    // Now search in setup to overwrite default values
                    if (!empty($user->default_values)) {        // $user->default_values defined from menu 'Setup - Default values'
                        if (isset($user->default_values[$relativepathstring]['createform'])) {
                            foreach ($user->default_values[$relativepathstring]['createform'] as $defkey => $defval) {
                                $qualified = 0;
                                if ($defkey != '_noquery_') {
                                    $tmpqueryarraytohave = explode('&', $defkey);
                                    $tmpqueryarraywehave = explode('&', dol_string_nohtmltag($_SERVER['QUERY_STRING']));
                                    $foundintru = 0;
                                    foreach ($tmpqueryarraytohave as $tmpquerytohave) {
                                        if (!in_array($tmpquerytohave, $tmpqueryarraywehave)) {
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
                                    if (isset($user->default_values[$relativepathstring]['createform'][$defkey][$paramname])) {
                                        $out = $user->default_values[$relativepathstring]['createform'][$defkey][$paramname];
                                        break;
                                    }
                                }
                            }
                        }
                    }
                } elseif (!empty($paramname) && !isset($_GET[$paramname]) && !isset($_POST[$paramname])) {
                    // Management of default search_filters and sort order
                    if (!empty($user->default_values)) {
                        // $user->default_values defined from menu 'Setup - Default values'
                        //var_dump($user->default_values[$relativepathstring]);
                        if ($paramname == 'sortfield' || $paramname == 'sortorder') {
                            // Sorted on which fields ? ASC or DESC ?
                            if (isset($user->default_values[$relativepathstring]['sortorder'])) {
                                // Even if paramname is sortfield, data are stored into ['sortorder...']
                                foreach ($user->default_values[$relativepathstring]['sortorder'] as $defkey => $defval) {
                                    $qualified = 0;
                                    if ($defkey != '_noquery_') {
                                        $tmpqueryarraytohave = explode('&', $defkey);
                                        $tmpqueryarraywehave = explode('&', dol_string_nohtmltag($_SERVER['QUERY_STRING']));
                                        $foundintru = 0;
                                        foreach ($tmpqueryarraytohave as $tmpquerytohave) {
                                            if (!in_array($tmpquerytohave, $tmpqueryarraywehave)) {
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
                                        $forbidden_chars_to_replace = array(" ", "'", "/", "\\", ":", "*", "?", "\"", "<", ">", "|", "[", "]", ";", "="); // we accept _, -, . and ,
                                        foreach ($user->default_values[$relativepathstring]['sortorder'][$defkey] as $key => $val) {
                                            if ($out) {
                                                $out .= ', ';
                                            }
                                            if ($paramname == 'sortfield') {
                                                $out .= dol_string_nospecial($key, '', $forbidden_chars_to_replace);
                                            }
                                            if ($paramname == 'sortorder') {
                                                $out .= dol_string_nospecial($val, '', $forbidden_chars_to_replace);
                                            }
                                        }
                                        //break;    // No break for sortfield and sortorder so we can cumulate fields (is it really useful ?)
                                    }
                                }
                            }
                        } elseif (isset($user->default_values[$relativepathstring]['filters'])) {
                            foreach ($user->default_values[$relativepathstring]['filters'] as $defkey => $defval) { // $defkey is a querystring like 'a=b&c=d', $defval is key of user
                                if (!empty($_GET['disabledefaultvalues'])) {    // If set of default values has been disabled by a request parameter
                                    continue;
                                }
                                $qualified = 0;
                                if ($defkey != '_noquery_') {
                                    $tmpqueryarraytohave = explode('&', $defkey);
                                    $tmpqueryarraywehave = explode('&', dol_string_nohtmltag($_SERVER['QUERY_STRING']));
                                    $foundintru = 0;
                                    foreach ($tmpqueryarraytohave as $tmpquerytohave) {
                                        if (!in_array($tmpquerytohave, $tmpqueryarraywehave)) {
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

                                if ($qualified && isset($user->default_values[$relativepathstring]['filters'][$defkey][$paramname])) {
                                    // We must keep $_POST and $_GET here
                                    if (isset($_POST['sall']) || isset($_POST['search_all']) || isset($_GET['sall']) || isset($_GET['search_all'])) {
                                        // We made a search from quick search menu, do we still use default filter ?
                                        if (!getDolGlobalString('MAIN_DISABLE_DEFAULT_FILTER_FOR_QUICK_SEARCH')) {
                                            $forbidden_chars_to_replace = array(" ", "'", "/", "\\", ":", "*", "?", "\"", "<", ">", "|", "[", "]", ";", "="); // we accept _, -, . and ,
                                            $out = dol_string_nospecial($user->default_values[$relativepathstring]['filters'][$defkey][$paramname], '', $forbidden_chars_to_replace);
                                        }
                                    } else {
                                        $forbidden_chars_to_replace = array(" ", "'", "/", "\\", ":", "*", "?", "\"", "<", ">", "|", "[", "]", ";", "="); // we accept _, -, . and ,
                                        $out = dol_string_nospecial($user->default_values[$relativepathstring]['filters'][$defkey][$paramname], '', $forbidden_chars_to_replace);
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Substitution variables for GETPOST (used to get final url with variable parameters or final default value, when using variable parameters __XXX__ in the GET URL)
    // Example of variables: __DAY__, __MONTH__, __YEAR__, __MYCOMPANY_COUNTRY_ID__, __USER_ID__, ...
    // We do this only if var is a GET. If it is a POST, may be we want to post the text with vars as the setup text.
    '@phan-var-force string $paramname';
    if (!is_array($out) && empty($_POST[$paramname]) && empty($noreplace)) {
        $reg = array();
        $maxloop = 20;
        $loopnb = 0; // Protection against infinite loop
        while (preg_match('/__([A-Z0-9]+_?[A-Z0-9]+)__/i', $out, $reg) && ($loopnb < $maxloop)) {    // Detect '__ABCDEF__' as key 'ABCDEF' and '__ABC_DEF__' as key 'ABC_DEF'. Detection is also correct when 2 vars are side by side.
            $loopnb++;
            $newout = '';

            if ($reg[1] == 'DAY') {
                $tmp = dol_getdate(dol_now(), true);
                $newout = $tmp['mday'];
            } elseif ($reg[1] == 'MONTH') {
                $tmp = dol_getdate(dol_now(), true);
                $newout = $tmp['mon'];
            } elseif ($reg[1] == 'YEAR') {
                $tmp = dol_getdate(dol_now(), true);
                $newout = $tmp['year'];
            } elseif ($reg[1] == 'PREVIOUS_DAY') {
                $tmp = dol_getdate(dol_now(), true);
                $tmp2 = dol_get_prev_day($tmp['mday'], $tmp['mon'], $tmp['year']);
                $newout = $tmp2['day'];
            } elseif ($reg[1] == 'PREVIOUS_MONTH') {
                $tmp = dol_getdate(dol_now(), true);
                $tmp2 = dol_get_prev_month($tmp['mon'], $tmp['year']);
                $newout = $tmp2['month'];
            } elseif ($reg[1] == 'PREVIOUS_YEAR') {
                $tmp = dol_getdate(dol_now(), true);
                $newout = ($tmp['year'] - 1);
            } elseif ($reg[1] == 'NEXT_DAY') {
                $tmp = dol_getdate(dol_now(), true);
                $tmp2 = dol_get_next_day($tmp['mday'], $tmp['mon'], $tmp['year']);
                $newout = $tmp2['day'];
            } elseif ($reg[1] == 'NEXT_MONTH') {
                $tmp = dol_getdate(dol_now(), true);
                $tmp2 = dol_get_next_month($tmp['mon'], $tmp['year']);
                $newout = $tmp2['month'];
            } elseif ($reg[1] == 'NEXT_YEAR') {
                $tmp = dol_getdate(dol_now(), true);
                $newout = ($tmp['year'] + 1);
            } elseif ($reg[1] == 'MYCOMPANY_COUNTRY_ID' || $reg[1] == 'MYCOUNTRY_ID' || $reg[1] == 'MYCOUNTRYID') {
                $newout = $mysoc->country_id;
            } elseif ($reg[1] == 'USER_ID' || $reg[1] == 'USERID') {
                $newout = $user->id;
            } elseif ($reg[1] == 'USER_SUPERVISOR_ID' || $reg[1] == 'SUPERVISOR_ID' || $reg[1] == 'SUPERVISORID') {
                $newout = $user->fk_user;
            } elseif ($reg[1] == 'ENTITY_ID' || $reg[1] == 'ENTITYID') {
                $newout = $conf->entity;
            } else {
                $newout = ''; // Key not found, we replace with empty string
            }
            //var_dump('__'.$reg[1].'__ -> '.$newout);
            $out = preg_replace('/__' . preg_quote($reg[1], '/') . '__/', $newout, $out);
        }
    }

    // Check type of variable and make sanitization according to this
    if (preg_match('/^array/', $check)) {   // If 'array' or 'array:restricthtml' or 'array:aZ09' or 'array:intcomma'
        if (!is_array($out) || empty($out)) {
            $out = array();
        } else {
            $tmparray = explode(':', $check);
            if (!empty($tmparray[1])) {
                $tmpcheck = $tmparray[1];
            } else {
                $tmpcheck = 'alphanohtml';
            }
            foreach ($out as $outkey => $outval) {
                $out[$outkey] = sanitizeVal($outval, $tmpcheck, $filter, $options);
            }
        }
    } else {
        // If field name is 'search_xxx' then we force the add of space after each < and > (when following char is numeric) because it means
        // we use the < or > to make a search on a numeric value to do higher or lower so we can add a space to break html tags
        if (strpos($paramname, 'search_') === 0) {
            $out = preg_replace('/([<>])([-+]?\d)/', '\1 \2', $out);
        }

        // @phan-suppress-next-line UnknownSanitizeType
        $out = sanitizeVal($out, $check, $filter, $options);
    }

    // Sanitizing for special parameters.
    // Note: There is no reason to allow the backtopage, backtolist or backtourl parameter to contains an external URL. Only relative URLs are allowed.
    if ($paramname == 'backtopage' || $paramname == 'backtolist' || $paramname == 'backtourl') {
        $out = str_replace('\\', '/', $out);                                // Can be before the loop because only 1 char is replaced. No risk to get it after other replacements.
        $out = str_replace(array(':', ';', '@', "\t", ' '), '', $out);      // Can be before the loop because only 1 char is replaced. No risk to retrieve it after other replacements.
        do {
            $oldstringtoclean = $out;
            $out = str_ireplace(array('javascript', 'vbscript', '&colon', '&#'), '', $out);
            $out = preg_replace(array('/^[^?]*%/'), '', $out);             // We remove any % chars before the ?. Example in url: '/product/stock/card.php?action=create&backtopage=%2Fdolibarr_dev%2Fhtdocs%2Fpro%25duct%2Fcard.php%3Fid%3Dabc'
            $out = preg_replace(array('/^[a-z]*\/\s*\/+/i'), '', $out);     // We remove schema*// to remove external URL
        } while ($oldstringtoclean != $out);
    }

    // Code for search criteria persistence.
    // Save data into session if key start with 'search_'
    if (empty($method) || $method == 3 || $method == 4) {
        if (preg_match('/^search_/', $paramname) || in_array($paramname, array('sortorder', 'sortfield'))) {
            //var_dump($paramname.' - '.$out.' '.$user->default_values[$relativepathstring]['filters'][$paramname]);

            // We save search key only if $out not empty that means:
            // - posted value not empty, or
            // - if posted value is empty and a default value exists that is not empty (it means we did a filter to an empty value when default was not).

            if ($out != '' && isset($user)) {// $out = '0' or 'abc', it is a search criteria to keep
                $user->lastsearch_values_tmp[$relativepathstring][$paramname] = $out;
            }
        }
    }

    return $out;
}

/**
 *  Return the value of a $_GET or $_POST supervariable, converted into integer.
 *  Use the property $user->default_values[path]['creatform'] and/or $user->default_values[path]['filters'] and/or $user->default_values[path]['sortorder']
 *  Note: The property $user->default_values is loaded by main.php when loading the user.
 *
 * @param string $paramname Name of the $_GET or $_POST parameter
 * @param int<0,3> $method Type of method (0 = $_GET then $_POST, 1 = only $_GET, 2 = only $_POST, 3 = $_POST then $_GET)
 * @return int                     Value converted into integer
 */
function GETPOSTINT($paramname, $method = 0)
{
    return (int)GETPOST($paramname, 'int', $method, null, null, 0);
}


/**
 *  Return the value of a $_GET or $_POST supervariable, converted into float.
 *
 * @param string $paramname Name of the $_GET or $_POST parameter
 * @param string|int $rounding Type of rounding ('', 'MU', 'MT, 'MS', 'CU', 'CT', integer) {@see price2num()}
 * @return float                           Value converted into float
 * @since  Dolibarr V20
 */
function GETPOSTFLOAT($paramname, $rounding = '')
{
    // price2num() is used to sanitize any valid user input (such as "1 234.5", "1 234,5", "1'234,5", "1·234,5", "1,234.5", etc.)
    return (float)price2num(GETPOST($paramname), $rounding, 2);
}


/**
 *  Return a sanitized or empty value after checking value against a rule.
 *
 * @param string|array $out Value to check/clear.
 * @param string $check Type of check/sanitizing
 * @param int $filter Filter to apply when $check is set to 'custom'. (See http://php.net/manual/en/filter.filters.php for détails)
 * @param mixed $options Options to pass to filter_var when $check is set to 'custom'
 * @return string|array                 Value sanitized (string or array). It may be '' if format check fails.
 * @deprecated
 */
function checkVal($out = '', $check = 'alphanohtml', $filter = null, $options = null)
{
    return sanitizeVal($out, $check, $filter, $options);
}

/**
 *  Return a sanitized or empty value after checking value against a rule.
 *
 * @param string|array $out Value to check/clear.
 * @param string $check Type of check/sanitizing
 * @param int $filter Filter to apply when $check is set to 'custom'. (See http://php.net/manual/en/filter.filters.php for détails)
 * @param mixed $options Options to pass to filter_var when $check is set to 'custom'
 * @return string|array                 Value sanitized (string or array). It may be '' if format check fails.
 */
function sanitizeVal($out = '', $check = 'alphanohtml', $filter = null, $options = null)
{
    // TODO : use class "Validate" to perform tests (and add missing tests) if needed for factorize
    // Check is done after replacement
    switch ($check) {
        case 'none':
            break;
        case 'int':    // Check param is a numeric value (integer but also float or hexadecimal)
            if (!is_numeric($out)) {
                $out = '';
            }
            break;
        case 'intcomma':
            if (is_array($out)) {
                $out = implode(',', $out);
            }
            if (preg_match('/[^0-9,-]+/i', $out)) {
                $out = '';
            }
            break;
        case 'san_alpha':
            $out = filter_var($out, FILTER_SANITIZE_STRING);
            break;
        case 'email':
            $out = filter_var($out, FILTER_SANITIZE_EMAIL);
            break;
        case 'aZ':
            if (!is_array($out)) {
                $out = trim($out);
                if (preg_match('/[^a-z]+/i', $out)) {
                    $out = '';
                }
            }
            break;
        case 'aZ09':
            if (!is_array($out)) {
                $out = trim($out);
                if (preg_match('/[^a-z0-9_\-.]+/i', $out)) {
                    $out = '';
                }
            }
            break;
        case 'aZ09arobase':     // great to sanitize $objecttype parameter
            if (!is_array($out)) {
                $out = trim($out);
                if (preg_match('/[^a-z0-9_\-.@]+/i', $out)) {
                    $out = '';
                }
            }
            break;
        case 'aZ09comma':       // great to sanitize $sortfield or $sortorder params that can be 't.abc,t.def_gh'
            if (!is_array($out)) {
                $out = trim($out);
                if (preg_match('/[^a-z0-9_\-.,]+/i', $out)) {
                    $out = '';
                }
            }
            break;
        case 'alpha':       // No html and no ../ and "
        case 'alphanohtml': // Recommended for most scalar parameters and search parameters
            if (!is_array($out)) {
                $out = trim($out);
                do {
                    $oldstringtoclean = $out;
                    // Remove html tags
                    $out = dol_string_nohtmltag($out, 0);
                    // Refuse octal syntax \999, hexa syntax \x999 and unicode syntax \u{999} by replacing the \ into / (so if it is a \ for a windows path, it is still ok).
                    $out = preg_replace('/\\\([0-9xu])/', '/\1', $out);
                    // Remove also other dangerous string sequences
                    // '../' or '..\' is dangerous because it allows dir transversals
                    // '&#38', '&#0000038', '&#x26'... is a the char '&' alone but there is no reason to accept such way to encode input char
                    // '"' = '&#34' = '&#0000034' = '&#x22' is dangerous because param in url can close the href= or src= and add javascript functions.
                    // '&#47', '&#0000047', '&#x2F' is the char '/' but there is no reason to accept such way to encode this input char
                    // '&#92' = '&#0000092' = '&#x5C' is the char '\' but there is no reason to accept such way to encode this input char
                    $out = str_ireplace(array('../', '..\\', '&#38', '&#0000038', '&#x26', '&quot', '"', '&#34', '&#0000034', '&#x22', '&#47', '&#0000047', '&#x2F', '&#92', '&#0000092', '&#x5C'), '', $out);
                } while ($oldstringtoclean != $out);
                // keep lines feed
            }
            break;
        case 'alphawithlgt':        // No " and no ../ but we keep balanced < > tags with no special chars inside. Can be used for email string like "Name <email>". Less secured than 'alphanohtml'
            if (!is_array($out)) {
                $out = trim($out);
                do {
                    $oldstringtoclean = $out;
                    // Decode html entities
                    $out = dol_html_entity_decode($out, ENT_COMPAT | ENT_HTML5, 'UTF-8');
                    // Refuse octal syntax \999, hexa syntax \x999 and unicode syntax \u{999} by replacing the \ into / (so if it is a \ for a windows path, it is still ok).
                    $out = preg_replace('/\\\([0-9xu])/', '/\1', $out);
                    // Remove also other dangerous string sequences
                    // '../' or '..\' is dangerous because it allows dir transversals
                    // '&#38', '&#0000038', '&#x26'... is a the char '&' alone but there is no reason to accept such way to encode input char
                    // '"' = '&#34' = '&#0000034' = '&#x22' is dangerous because param in url can close the href= or src= and add javascript functions.
                    // '&#47', '&#0000047', '&#x2F' is the char '/' but there is no reason to accept such way to encode this input char
                    // '&#92' = '&#0000092' = '&#x5C' is the char '\' but there is no reason to accept such way to encode this input char
                    $out = str_ireplace(array('../', '..\\', '&#38', '&#0000038', '&#x26', '&quot', '"', '&#34', '&#0000034', '&#x22', '&#47', '&#0000047', '&#x2F', '&#92', '&#0000092', '&#x5C'), '', $out);
                } while ($oldstringtoclean != $out);
            }
            break;
        case 'nohtml':      // No html
            $out = dol_string_nohtmltag($out, 0);
            break;
        case 'restricthtmlnolink':
        case 'restricthtml':        // Recommended for most html textarea
        case 'restricthtmlallowclass':
        case 'restricthtmlallowunvalid':
            $out = dol_htmlwithnojs($out, 1, $check);
            break;
        case 'custom':
            if (!empty($out)) {
                if (empty($filter)) {
                    return 'BadParameterForGETPOST - Param 3 of sanitizeVal()';
                }
                if (is_null($options)) {
                    $options = 0;
                }
                $out = filter_var($out, $filter, $options);
            }
            break;
        default:
            dol_syslog("Error, you call sanitizeVal() with a bad value for the check type. Data will be sanitized with alphanohtml.", LOG_ERR);
            $out = GETPOST($out, 'alphanohtml');
            break;
    }

    return $out;
}


if (!function_exists('dol_getprefix')) {
    /**
     *  Return a prefix to use for this Dolibarr instance, for session/cookie names or email id.
     *  The prefix is unique for instance and avoid conflict between multi-instances, even when having two instances with same root dir
     *  or two instances in same virtual servers.
     *  This function must not use dol_hash (that is used for password hash) and need to have all context $conf loaded.
     *
     * @param string $mode '' (prefix for session name) or 'email' (prefix for email id)
     * @return string                          A calculated prefix
     * @phan-suppress PhanRedefineFunction - Also defined in webportal.main.inc.php
     */
    function dol_getprefix($mode = '')
    {
        // If prefix is for email (we need to have $conf already loaded for this case)
        if ($mode == 'email') {
            global $conf;

            if (getDolGlobalString('MAIL_PREFIX_FOR_EMAIL_ID')) {   // If MAIL_PREFIX_FOR_EMAIL_ID is set
                if (getDolGlobalString('MAIL_PREFIX_FOR_EMAIL_ID') != 'SERVER_NAME') {
                    return $conf->global->MAIL_PREFIX_FOR_EMAIL_ID;
                } elseif (isset($_SERVER["SERVER_NAME"])) { // If MAIL_PREFIX_FOR_EMAIL_ID is set to 'SERVER_NAME'
                    return $_SERVER["SERVER_NAME"];
                }
            }

            // The recommended value if MAIL_PREFIX_FOR_EMAIL_ID is not defined (may be not defined for old versions)
            if (!empty($conf->file->instance_unique_id)) {
                return sha1('dolibarr' . $conf->file->instance_unique_id);
            }

            // For backward compatibility when instance_unique_id is not set
            return sha1(DOL_DOCUMENT_ROOT . DOL_URL_ROOT);
        }

        // If prefix is for session (no need to have $conf loaded)
        global $dolibarr_main_instance_unique_id, $dolibarr_main_cookie_cryptkey;   // This is loaded by filefunc.inc.php
        $tmp_instance_unique_id = empty($dolibarr_main_instance_unique_id) ? (empty($dolibarr_main_cookie_cryptkey) ? '' : $dolibarr_main_cookie_cryptkey) : $dolibarr_main_instance_unique_id; // Unique id of instance

        // The recommended value (may be not defined for old versions)
        if (!empty($tmp_instance_unique_id)) {
            return sha1('dolibarr' . $tmp_instance_unique_id);
        }

        // For backward compatibility when instance_unique_id is not set
        if (isset($_SERVER["SERVER_NAME"]) && isset($_SERVER["DOCUMENT_ROOT"])) {
            return sha1($_SERVER["SERVER_NAME"] . $_SERVER["DOCUMENT_ROOT"] . DOL_DOCUMENT_ROOT . DOL_URL_ROOT);
        } else {
            return sha1(DOL_DOCUMENT_ROOT . DOL_URL_ROOT);
        }
    }
}

/**
 *  Make an include_once using default root and alternate root if it fails.
 *  To link to a core file, use include(DOL_DOCUMENT_ROOT.'/pathtofile')
 *  To link to a module file from a module file, use include './mymodulefile';
 *  To link to a module file from a core file, then this function can be used (call by hook / trigger / speciales pages)
 *
 * @param string $relpath Relative path to file (Ie: mydir/myfile, ../myfile, ...)
 * @param string $classname Class name (deprecated)
 * @return bool                True if load is a success, False if it fails
 */
function dol_include_once($relpath, $classname = '')
{
    global $conf, $langs, $user, $mysoc; // Do not remove this. They must be defined for files we include. Other globals var must be retrieved with $GLOBALS['var']

    $fullpath = dol_buildpath($relpath);

    if (!file_exists($fullpath)) {
        dol_syslog('functions::dol_include_once Tried to load unexisting file: ' . $relpath, LOG_WARNING);
        return false;
    }

    if (!empty($classname) && !class_exists($classname)) {
        return include $fullpath;
    } else {
        return include_once $fullpath;
    }
}


/**
 *  Return path of url or filesystem. Can check into alternate dir or alternate dir + main dir depending on value of $returnemptyifnotfound.
 *
 * @param string $path Relative path to file (if mode=0) or relative url (if mode=1). Ie: mydir/myfile, ../myfile
 * @param int $type 0=Used for a Filesystem path, 1=Used for an URL path (output relative), 2=Used for an URL path (output full path using same host that current url), 3=Used for an URL path (output full path using host defined into $dolibarr_main_url_root of conf file)
 * @param int $returnemptyifnotfound 0:If $type==0 and if file was not found into alternate dir, return default path into main dir (no test on it)
 *                                              1:If $type==0 and if file was not found into alternate dir, return empty string
 *                                              2:If $type==0 and if file was not found into alternate dir, test into main dir, return default path if found, empty string if not found
 * @return string                              Full filesystem path (if path=0) or '' if file not found, Full url path (if mode=1)
 */
function dol_buildpath($path, $type = 0, $returnemptyifnotfound = 0)
{
    global $conf;

    $path = preg_replace('/^\//', '', $path);

    if (empty($type)) { // For a filesystem path
        $res = DOL_DOCUMENT_ROOT . '/' . $path; // Standard default path
        if (is_array($conf->file->dol_document_root)) {
            foreach ($conf->file->dol_document_root as $key => $dirroot) {  // ex: array("main"=>"/home/main/htdocs", "alt0"=>"/home/dirmod/htdocs", ...)
                if ($key == 'main') {
                    continue;
                }
                // if (@file_exists($dirroot.'/'.$path)) {
                if (@file_exists($dirroot . '/' . $path)) { // avoid [php:warn]
                    $res = $dirroot . '/' . $path;
                    return $res;
                }
            }
        }
        if ($returnemptyifnotfound) {
            // Not found into alternate dir
            if ($returnemptyifnotfound == 1 || !file_exists($res)) {
                return '';
            }
        }
    } else {
        // For an url path
        // We try to get local path of file on filesystem from url
        // Note that trying to know if a file on disk exist by forging path on disk from url
        // works only for some web server and some setup. This is bugged when
        // using proxy, rewriting, virtual path, etc...
        $res = '';
        if ($type == 1) {
            $res = constant('BASE_URL') . '/' . $path; // Standard value
        }
        if ($type == 2) {
            $res = DOL_MAIN_URL_ROOT . '/' . $path; // Standard value
        }
        if ($type == 3) {
            $res = constant('DOL_URL_ROOT') . '/' . $path;
        }

        foreach ($conf->file->dol_document_root as $key => $dirroot) {  // ex: array(["main"]=>"/home/main/htdocs", ["alt0"]=>"/home/dirmod/htdocs", ...)
            if ($key == 'main') {
                if ($type == 3) {
                    /*global $dolibarr_main_url_root;*/

                    // Define $urlwithroot
                    $urlwithouturlroot = preg_replace('/' . preg_quote(DOL_URL_ROOT, '/') . '$/i', '', trim($conf->file->dol_main_url_root));
                    $urlwithroot = $urlwithouturlroot . DOL_URL_ROOT; // This is to use external domain name found into config file
                    //$urlwithroot=DOL_MAIN_URL_ROOT;                   // This is to use same domain name than current

                    $res2 = (preg_match('/^http/i', $conf->file->dol_url_root[$key]) ? '' : $urlwithroot) . '/' . $path; // Test on start with http is for old conf syntax

                    $res = constant('DOL_URL_ROOT') . '/' . $path;
                }
                continue;
            }
            $regs = array();
            preg_match('/^([^?]+(\.css\.php|\.css|\.js\.php|\.js|\.png|\.jpg|\.php)?)/i', $path, $regs); // Take part before '?'
            if (!empty($regs[1])) {
                //print $key.'-'.$dirroot.'/'.$path.'-'.$conf->file->dol_url_root[$type].'<br>'."\n";
                //if (file_exists($dirroot.'/'.$regs[1])) {
                if (@file_exists($dirroot . '/' . $regs[1])) {  // avoid [php:warn]
                    if ($type == 1) {
                        $res = (preg_match('/^http/i', $conf->file->dol_url_root[$key]) ? '' : DOL_URL_ROOT) . $conf->file->dol_url_root[$key] . '/' . $path;
                    }
                    if ($type == 2) {
                        $res = (preg_match('/^http/i', $conf->file->dol_url_root[$key]) ? '' : DOL_MAIN_URL_ROOT) . $conf->file->dol_url_root[$key] . '/' . $path;
                    }
                    if ($type == 3) {
                        /*global $dolibarr_main_url_root;*/

                        // Define $urlwithroot
                        $urlwithouturlroot = preg_replace('/' . preg_quote(DOL_URL_ROOT, '/') . '$/i', '', trim($conf->file->dol_main_url_root));
                        $urlwithroot = $urlwithouturlroot . DOL_URL_ROOT; // This is to use external domain name found into config file
                        //$urlwithroot=DOL_MAIN_URL_ROOT;                   // This is to use same domain name than current

                        $res = (preg_match('/^http/i', $conf->file->dol_url_root[$key]) ? '' : $urlwithroot) . $conf->file->dol_url_root[$key] . '/' . $path; // Test on start with http is for old conf syntax
                    }
                    break;
                }
            }
        }
    }

    return $res;
}

/**
 *  Get properties for an object - including magic properties when requested
 *
 *  Only returns properties that exist
 *
 * @param object $obj Object to get properties from
 * @param string[] $properties Optional list of properties to get.
 *                                  When empty, only gets public properties.
 * @return array<string,mixed>     Hash for retrieved values (key=name)
 */
function dol_get_object_properties($obj, $properties = [])
{
    // Get real properties using get_object_vars() if $properties is empty
    if (empty($properties)) {
        return get_object_vars($obj);
    }

    $existingProperties = [];
    $realProperties = get_object_vars($obj);

    // Get the real or magic property values
    foreach ($properties as $property) {
        if (array_key_exists($property, $realProperties)) {
            // Real property, add the value
            $existingProperties[$property] = $obj->{$property};
        } elseif (property_exists($obj, $property)) {
            // Magic property
            $existingProperties[$property] = $obj->{$property};
        }
    }

    return $existingProperties;
}


/**
 *  Create a clone of instance of object (new instance with same value for each properties)
 *  With native = 0: Property that are references are different memory area in the new object (full isolation clone). This means $this->object of new object may not be valid (except this->db that is voluntarly kept).
 *  With native = 1: Use PHP clone. Property that are reference are same pointer. This means $this->db of new object is still valid but point to same this->db than original object.
 *  With native = 2: Property that are reference are different memory area in the new object (full isolation clone). Only scalar and array values are cloned. This means method are not availables and $this->db of new object is not valid.
 *
 * @template T of object
 *
 * @param T $object Object to clone
 * @param int $native 0=Full isolation method, 1=Native PHP method, 2=Full isolation method keeping only scalar and array properties (recommended)
 * @return T                   Clone object
 * @see https://php.net/manual/language.oop5.cloning.php
 * @phan-suppress PhanTypeExpectedObjectPropAccess
 */
function dol_clone($object, $native = 0)
{
    if ($native == 0) {
        // deprecated method, use the method with native = 2 instead
        $tmpsavdb = null;
        if (isset($object->db) && isset($object->db->db) && is_object($object->db->db) && get_only_class($object->db->db) == 'PgSql\Connection') {
            $tmpsavdb = $object->db;
            unset($object->db);     // Such property can not be serialized with pgsl (when object->db->db = 'PgSql\Connection')
        }

        $myclone = unserialize(serialize($object)); // serialize then unserialize is a hack to be sure to have a new object for all fields

        if (!empty($tmpsavdb)) {
            $object->db = $tmpsavdb;
        }
    } elseif ($native == 2) {
        // recommended method to have a full isolated cloned object
        $myclone = new stdClass();
        $tmparray = get_object_vars($object);   // return only public properties

        if (is_array($tmparray)) {
            foreach ($tmparray as $propertykey => $propertyval) {
                if (is_scalar($propertyval) || is_array($propertyval)) {
                    $myclone->$propertykey = $propertyval;
                }
            }
        }
    } else {
        $myclone = clone $object; // PHP clone is a shallow copy only, not a real clone, so properties of references will keep the reference (referring to the same target/variable)
    }

    return $myclone;
}

/**
 *  Optimize a size for some browsers (phone, smarphone, ...)
 *
 * @param int $size Size we want
 * @param string $type Type of optimizing:
 *                              '' = function used to define a size for truncation
 *                              'width' = function is used to define a width
 * @return int                 New size after optimizing
 */
function dol_size($size, $type = '')
{
    global $conf;
    if (empty($conf->dol_optimize_smallscreen)) {
        return $size;
    }
    if ($type == 'width' && $size > 250) {
        return 250;
    } else {
        return 10;
    }
}


/**
 *  Clean a string to use it as a file name.
 *  Replace also '--' and ' -' strings, they are used for parameters separation (Note: ' - ' is allowed).
 *
 * @param string $str String to clean
 * @param string $newstr String to replace bad chars with.
 * @param int $unaccent 1=Remove also accent (default), 0 do not remove them
 * @return string                  String cleaned (a-zA-Z_)
 *
 * @see            dol_string_nospecial(), dol_string_unaccent(), dol_sanitizePathName()
 */
function dol_sanitizeFileName($str, $newstr = '_', $unaccent = 1)
{
    // List of special chars for filenames in windows are defined on page https://docs.microsoft.com/en-us/windows/win32/fileio/naming-a-file
    // Char '>' '<' '|' '$' and ';' are special chars for shells.
    // Char '/' and '\' are file delimiters.
    // Chars '--' can be used into filename to inject special parameters like --use-compress-program to make command with file as parameter making remote execution of command
    $filesystem_forbidden_chars = array('<', '>', '/', '\\', '?', '*', '|', '"', ':', '°', '$', ';', '`');
    $tmp = dol_string_nospecial($unaccent ? dol_string_unaccent($str) : $str, $newstr, $filesystem_forbidden_chars);
    $tmp = preg_replace('/--+/', '_', $tmp);
    $tmp = preg_replace('/\s+-([^\s])/', ' _$1', $tmp);
    $tmp = preg_replace('/\s+-$/', '', $tmp);
    $tmp = str_replace('..', '', $tmp);
    return $tmp;
}


/**
 *  Clean a string to use it as a path name. Similar to dol_sanitizeFileName but accept / and \ chars.
 *  Replace also '--' and ' -' strings, they are used for parameters separation (Note: ' - ' is allowed).
 *
 * @param string $str String to clean
 * @param string $newstr String to replace bad chars with
 * @param int $unaccent 1=Remove also accent (default), 0 do not remove them
 * @return string                  String cleaned (a-zA-Z_)
 *
 * @see            dol_string_nospecial(), dol_string_unaccent(), dol_sanitizeFileName()
 */
function dol_sanitizePathName($str, $newstr = '_', $unaccent = 1)
{
    // List of special chars for filenames in windows are defined on page https://docs.microsoft.com/en-us/windows/win32/fileio/naming-a-file
    // Char '>' '<' '|' '$' and ';' are special chars for shells.
    // Chars '--' can be used into filename to inject special parameters like --use-compress-program to make command with file as parameter making remote execution of command
    $filesystem_forbidden_chars = array('<', '>', '?', '*', '|', '"', '°', '$', ';', '`');
    $tmp = dol_string_nospecial($unaccent ? dol_string_unaccent($str) : $str, $newstr, $filesystem_forbidden_chars);
    $tmp = preg_replace('/--+/', '_', $tmp);
    $tmp = preg_replace('/\s+-([^\s])/', ' _$1', $tmp);
    $tmp = preg_replace('/\s+-$/', '', $tmp);
    $tmp = str_replace('..', '', $tmp);
    return $tmp;
}

/**
 *  Clean a string to use it as an URL (into a href or src attribute)
 *
 * @param string $stringtoclean String to clean
 * @param int $type 0=Accept all Url, 1=Clean external Url (keep only relative Url)
 * @return     string                          Escaped string.
 */
function dol_sanitizeUrl($stringtoclean, $type = 1)
{
    // We clean string because some hacks try to obfuscate evil strings by inserting non printable chars. Example: 'java(ascci09)scr(ascii00)ipt' is processed like 'javascript' (whatever is place of evil ascii char)
    // We should use dol_string_nounprintableascii but function may not be yet loaded/available
    $stringtoclean = preg_replace('/[\x00-\x1F\x7F]/u', '', $stringtoclean); // /u operator makes UTF8 valid characters being ignored so are not included into the replace
    // We clean html comments because some hacks try to obfuscate evil strings by inserting HTML comments. Example: on<!-- -->error=alert(1)
    $stringtoclean = preg_replace('/<!--[^>]*-->/', '', $stringtoclean);

    $stringtoclean = str_replace('\\', '/', $stringtoclean);
    if ($type == 1) {
        // removing : should disable links to external url like http:aaa)
        // removing ';' should disable "named" html entities encode into an url (we should not have this into an url)
        $stringtoclean = str_replace(array(':', ';', '@'), '', $stringtoclean);
    }

    do {
        $oldstringtoclean = $stringtoclean;
        // removing '&colon' should disable links to external url like http:aaa)
        // removing '&#' should disable "numeric" html entities encode into an url (we should not have this into an url)
        $stringtoclean = str_ireplace(array('javascript', 'vbscript', '&colon', '&#'), '', $stringtoclean);
    } while ($oldstringtoclean != $stringtoclean);

    if ($type == 1) {
        // removing '//' should disable links to external url like //aaa or http//)
        $stringtoclean = preg_replace(array('/^[a-z]*\/\/+/i'), '', $stringtoclean);
    }

    return $stringtoclean;
}

/**
 *  Clean a string to use it as an Email.
 *
 * @param string $stringtoclean String to clean. Example 'abc@mycompany.com <My name>'
 * @return     string                          Escaped string.
 */
function dol_sanitizeEmail($stringtoclean)
{
    do {
        $oldstringtoclean = $stringtoclean;
        $stringtoclean = str_ireplace(array('"', ':', '[', ']', "\n", "\r", '\\', '\/'), '', $stringtoclean);
    } while ($oldstringtoclean != $stringtoclean);

    return $stringtoclean;
}

/**
 *  Clean a string from all accent characters to be used as ref, login or by dol_sanitizeFileName
 *
 * @param string $str String to clean
 * @return string                  Cleaned string
 *
 * @see            dol_sanitizeFilename(), dol_string_nospecial()
 */
function dol_string_unaccent($str)
{
    global $conf;

    if (is_null($str)) {
        return '';
    }

    if (utf8_check($str)) {
        if (extension_loaded('intl') && getDolGlobalString('MAIN_UNACCENT_USE_TRANSLITERATOR')) {
            $transliterator = Transliterator::createFromRules(':: Any-Latin; :: Latin-ASCII; :: NFD; :: [:Nonspacing Mark:] Remove; :: NFC;', Transliterator::FORWARD);
            return $transliterator->transliterate($str);
        }
        // See http://www.utf8-chartable.de/
        $string = rawurlencode($str);
        $replacements = array(
            '%C3%80' => 'A', '%C3%81' => 'A', '%C3%82' => 'A', '%C3%83' => 'A', '%C3%84' => 'A', '%C3%85' => 'A',
            '%C3%87' => 'C',
            '%C3%88' => 'E', '%C3%89' => 'E', '%C3%8A' => 'E', '%C3%8B' => 'E',
            '%C3%8C' => 'I', '%C3%8D' => 'I', '%C3%8E' => 'I', '%C3%8F' => 'I',
            '%C3%91' => 'N',
            '%C3%92' => 'O', '%C3%93' => 'O', '%C3%94' => 'O', '%C3%95' => 'O', '%C3%96' => 'O',
            '%C5%A0' => 'S',
            '%C3%99' => 'U', '%C3%9A' => 'U', '%C3%9B' => 'U', '%C3%9C' => 'U',
            '%C3%9D' => 'Y', '%C5%B8' => 'y',
            '%C3%A0' => 'a', '%C3%A1' => 'a', '%C3%A2' => 'a', '%C3%A3' => 'a', '%C3%A4' => 'a', '%C3%A5' => 'a',
            '%C3%A7' => 'c',
            '%C3%A8' => 'e', '%C3%A9' => 'e', '%C3%AA' => 'e', '%C3%AB' => 'e',
            '%C3%AC' => 'i', '%C3%AD' => 'i', '%C3%AE' => 'i', '%C3%AF' => 'i',
            '%C3%B1' => 'n',
            '%C3%B2' => 'o', '%C3%B3' => 'o', '%C3%B4' => 'o', '%C3%B5' => 'o', '%C3%B6' => 'o',
            '%C5%A1' => 's',
            '%C3%B9' => 'u', '%C3%BA' => 'u', '%C3%BB' => 'u', '%C3%BC' => 'u',
            '%C3%BD' => 'y', '%C3%BF' => 'y'
        );
        $string = strtr($string, $replacements);
        return rawurldecode($string);
    } else {
        // See http://www.ascii-code.com/
        $string = strtr(
            $str,
            "\xC0\xC1\xC2\xC3\xC4\xC5\xC7
			\xC8\xC9\xCA\xCB\xCC\xCD\xCE\xCF\xD0\xD1
			\xD2\xD3\xD4\xD5\xD8\xD9\xDA\xDB\xDD
			\xE0\xE1\xE2\xE3\xE4\xE5\xE7\xE8\xE9\xEA\xEB
			\xEC\xED\xEE\xEF\xF0\xF1\xF2\xF3\xF4\xF5\xF8
			\xF9\xFA\xFB\xFC\xFD\xFF",
            "AAAAAAC
			EEEEIIIIDN
			OOOOOUUUY
			aaaaaaceeee
			iiiidnooooo
			uuuuyy"
        );
        $string = strtr($string, array("\xC4" => "Ae", "\xC6" => "AE", "\xD6" => "Oe", "\xDC" => "Ue", "\xDE" => "TH", "\xDF" => "ss", "\xE4" => "ae", "\xE6" => "ae", "\xF6" => "oe", "\xFC" => "ue", "\xFE" => "th"));
        return $string;
    }
}

/**
 *  Clean a string from all punctuation characters to use it as a ref or login.
 *  This is a more complete function than dol_sanitizeFileName().
 *
 * @param string $str String to clean
 * @param string $newstr String to replace forbidden chars with
 * @param array|string $badcharstoreplace Array of forbidden characters to replace. Use '' to keep default list.
 * @param array|string $badcharstoremove Array of forbidden characters to remove. Use '' to keep default list.
 * @param int $keepspaces 1=Do not treat space as a special char to replace or remove
 * @return string                              Cleaned string
 *
 * @see            dol_sanitizeFilename(), dol_string_unaccent(), dol_string_nounprintableascii()
 */
function dol_string_nospecial($str, $newstr = '_', $badcharstoreplace = '', $badcharstoremove = '', $keepspaces = 0)
{
    $forbidden_chars_to_replace = array("'", "/", "\\", ":", "*", "?", "\"", "<", ">", "|", "[", "]", ",", ";", "=", '°', '$', ';'); // more complete than dol_sanitizeFileName
    if (empty($keepspaces)) {
        $forbidden_chars_to_replace[] = " ";
    }
    $forbidden_chars_to_remove = array();
    //$forbidden_chars_to_remove=array("(",")");

    if (is_array($badcharstoreplace)) {
        $forbidden_chars_to_replace = $badcharstoreplace;
    }
    if (is_array($badcharstoremove)) {
        $forbidden_chars_to_remove = $badcharstoremove;
    }

    // @phan-suppress-next-line PhanPluginSuspiciousParamOrderInternal
    return str_replace($forbidden_chars_to_replace, $newstr, str_replace($forbidden_chars_to_remove, "", $str));
}


/**
 *  Clean a string from all non printable ASCII chars (0x00-0x1F and 0x7F). It can also removes also Tab-CR-LF. UTF8 chars remains.
 *  This can be used to sanitize a string and view its real content. Some hacks try to obfuscate attacks by inserting non printable chars.
 *  Note, for information: UTF8 on 1 byte are: \x00-\7F
 *                                 2 bytes are: byte 1 \xc0-\xdf, byte 2 = \x80-\xbf
 *                                 3 bytes are: byte 1 \xe0-\xef, byte 2 = \x80-\xbf, byte 3 = \x80-\xbf
 *                                 4 bytes are: byte 1 \xf0-\xf7, byte 2 = \x80-\xbf, byte 3 = \x80-\xbf, byte 4 = \x80-\xbf
 * @param string $str String to clean
 * @param int $removetabcrlf Remove also CR-LF
 * @return string                      Cleaned string
 *
 * @see            dol_sanitizeFilename(), dol_string_unaccent(), dol_string_nospecial()
 */
function dol_string_nounprintableascii($str, $removetabcrlf = 1)
{
    if ($removetabcrlf) {
        return preg_replace('/[\x00-\x1F\x7F]/u', '', $str); // /u operator makes UTF8 valid characters being ignored so are not included into the replace
    } else {
        return preg_replace('/[\x00-\x08\x11-\x12\x14-\x1F\x7F]/u', '', $str); // /u operator should make UTF8 valid characters being ignored so are not included into the replace
    }
}

/**
 *  Returns text escaped for inclusion into javascript code
 *
 * @param string $stringtoescape String to escape
 * @param int<0,3> $mode 0=Escape also ' and " into ', 1=Escape ' but not " for usage into 'string', 2=Escape " but not ' for usage into "string", 3=Escape ' and " with \
 * @param int $noescapebackslashn 0=Escape also \n. 1=Do not escape \n.
 * @return string                          Escaped string. Both ' and " are escaped into ' if they are escaped.
 */
function dol_escape_js($stringtoescape, $mode = 0, $noescapebackslashn = 0)
{
    if (is_null($stringtoescape)) {
        return '';
    }

    // escape quotes and backslashes, newlines, etc.
    $substitjs = array("&#039;" => "\\'", "\r" => '\\r');
    //$substitjs['</']='<\/';   // We removed this. Should be useless.
    if (empty($noescapebackslashn)) {
        $substitjs["\n"] = '\\n';
        $substitjs['\\'] = '\\\\';
    }
    if (empty($mode)) {
        $substitjs["'"] = "\\'";
        $substitjs['"'] = "\\'";
    } elseif ($mode == 1) {
        $substitjs["'"] = "\\'";
    } elseif ($mode == 2) {
        $substitjs['"'] = '\\"';
    } elseif ($mode == 3) {
        $substitjs["'"] = "\\'";
        $substitjs['"'] = "\\\"";
    }
    return strtr($stringtoescape, $substitjs);
}

/**
 *  Returns text escaped for inclusion into javascript code
 *
 * @param string $stringtoescape String to escape
 * @return     string                          Escaped string for JSON content.
 */
function dol_escape_json($stringtoescape)
{
    return str_replace('"', '\"', $stringtoescape);
}

/**
 *  Returns text escaped for inclusion into a php string, build with double quotes " or '
 *
 * @param string $stringtoescape String to escape
 * @param int<1,2> $stringforquotes 2=String for doublequotes, 1=String for simple quotes
 * @return     string                          Escaped string for PHP content.
 */
function dol_escape_php($stringtoescape, $stringforquotes = 2)
{
    if (is_null($stringtoescape)) {
        return '';
    }

    if ($stringforquotes == 2) {
        return str_replace('"', "'", $stringtoescape);
    } elseif ($stringforquotes == 1) {
        // We remove the \ char.
        // If we allow the \ char, we can have $stringtoescape =
        // abc\';phpcodedanger;  so the escapement will become
        // abc\\';phpcodedanger;  and injecting this into
        // $a='...' will give $ac='abc\\';phpcodedanger;
        $stringtoescape = str_replace('\\', '', $stringtoescape);
        return str_replace("'", "\'", str_replace('"', "'", $stringtoescape));
    }

    return 'Bad parameter for stringforquotes in dol_escape_php';
}

/**
 *  Returns text escaped for inclusion into a XML string
 *
 * @param string $stringtoescape String to escape
 * @return     string                          Escaped string for XML content.
 */
function dol_escape_xml($stringtoescape)
{
    return $stringtoescape;
}

/**
 * Return a string label (so on 1 line only and that should not contains any HTML) ready to be output on HTML page
 * To use text that is not HTML content inside an attribute, use can simply only dol_escape_htmltag(). In doubt, use dolPrintHTMLForAttribute().
 *
 * @param string $s String to print
 * @return  string          String ready for HTML output
 */
function dolPrintLabel($s)
{
    return dol_escape_htmltag(dol_string_nohtmltag($s, 1, 'UTF-8', 0, 0), 0, 0, '', 0, 1);
}

/**
 * Return a string (that can be on several lines) ready to be output on a HTML page.
 * To output a text inside an attribute, you can use dolPrintHTMLForAttribute() or dolPrintHTMLForTextArea() inside a textarea
 *
 * @param string $s String to print
 * @param int $allowiframe Allow iframe tags
 * @return  string                  String ready for HTML output (sanitized and escape)
 * @see dolPrintHTMLForAttribute(), dolPrintHTMLFortextArea()
 */
function dolPrintHTML($s, $allowiframe = 0)
{
    return dol_escape_htmltag(dol_htmlwithnojs(dol_string_onlythesehtmltags(dol_htmlentitiesbr($s), 1, 1, 1, $allowiframe)), 1, 1, 'common', 0, 1);
}

/**
 * Return a string ready to be output on an HTML attribute (alt, title, data-html, ...)
 *
 * @param string $s String to print
 * @return  string          String ready for HTML output
 * @see dolPrintHTML(), dolPrintHTMLFortextArea()
 */
function dolPrintHTMLForAttribute($s)
{
    // The dol_htmlentitiesbr will convert simple text into html
    // The dol_escape_htmltag will escape html chars.
    return dol_escape_htmltag(dol_string_onlythesehtmltags(dol_htmlentitiesbr($s), 1, 0, 0, 0, array('br', 'b', 'font', 'span')), 1, -1, '', 0, 1);
}

/**
 * Return a string ready to be output on input textarea
 *
 * @param string $s String to print
 * @param int $allowiframe Allow iframe tags
 * @return  string                  String ready for HTML output into a textarea
 * @see dolPrintHTML(), dolPrintHTMLForAttribute()
 */
function dolPrintHTMLForTextArea($s, $allowiframe = 0)
{
    return dol_escape_htmltag(dol_htmlwithnojs(dol_string_onlythesehtmltags(dol_htmlentitiesbr($s), 1, 1, 1, $allowiframe)), 1, 1, '', 0, 1);
}

/**
 * Return a string ready to be output on an HTML attribute (alt, title, ...)
 *
 * @param string $s String to print
 * @return  string          String ready for HTML output
 */
function dolPrintPassword($s)
{
    return htmlspecialchars($s, ENT_COMPAT, 'UTF-8');
}


/**
 *  Returns text escaped for inclusion in HTML alt or title or value tags, or into values of HTML input fields.
 *  When we need to output strings on pages, we should use:
 *        - dolPrintHTML... that is dol_escape_htmltag(dol_htmlwithnojs(dol_string_onlythesehtmltags(dol_htmlentitiesbr(), 1, 1, 1)), 1, 1) for notes or descriptions into textarea, add 'common' if into a html content
 *        - dolPrintPassword that is abelhtmlspecialchars( , ENT_COMPAT, 'UTF-8') for passwords.
 *
 * @param string $stringtoescape String to escape
 * @param int $keepb 1=Replace b tags with escaped value (except if in $noescapetags), 0=Remove them completely
 * @param int $keepn 1=Preserve \r\n strings, 0=Replace them with escaped value, -1=Remove them. Set to 1 when escaping for a <textarea>.
 * @param string $noescapetags '' or 'common' or list of tags to not escape.
 * @param int $escapeonlyhtmltags 1=Escape only html tags, not the special chars like accents.
 * @param int $cleanalsojavascript Clean also javascript. @TODO switch this option to 1 by default.
 * @return     string                              Escaped string
 * @see        dol_string_nohtmltag(), dol_string_onlythesehtmltags(), dol_string_nospecial(), dol_string_unaccent(), dol_htmlentitiesbr()
 */
function dol_escape_htmltag($stringtoescape, $keepb = 0, $keepn = 0, $noescapetags = '', $escapeonlyhtmltags = 0, $cleanalsojavascript = 0)
{
    if ($noescapetags == 'common') {
        $noescapetags = 'html,body,a,b,em,hr,i,u,ul,li,br,div,img,font,p,span,strong,table,tr,td,th,tbody,h1,h2,h3,h4,h5,h6,h7,h8,h9';
        // Add also html5 tags
        $noescapetags .= ',header,footer,nav,section,menu,menuitem';
    }
    if ($cleanalsojavascript) {
        $stringtoescape = dol_string_onlythesehtmltags($stringtoescape, 0, 0, $cleanalsojavascript, 0, array(), 0);
    }

    // escape quotes and backslashes, newlines, etc.
    if ($escapeonlyhtmltags) {
        $tmp = htmlspecialchars_decode((string)$stringtoescape, ENT_COMPAT);
    } else {
        $tmp = html_entity_decode((string)$stringtoescape, ENT_COMPAT, 'UTF-8');
    }
    if (!$keepb) {
        $tmp = strtr($tmp, array("<b>" => '', '</b>' => '', '<strong>' => '', '</strong>' => ''));
    }
    if (!$keepn) {
        $tmp = strtr($tmp, array("\r" => '\\r', "\n" => '\\n'));
    } elseif ($keepn == -1) {
        $tmp = strtr($tmp, array("\r" => '', "\n" => ''));
    }

    if ($escapeonlyhtmltags) {
        return htmlspecialchars($tmp, ENT_COMPAT, 'UTF-8');
    } else {
        // Escape tags to keep
        $tmparrayoftags = array();
        if ($noescapetags) {
            $tmparrayoftags = explode(',', $noescapetags);
        }
        if (count($tmparrayoftags)) {
            $tmp = str_ireplace('__DOUBLEQUOTE', '', $tmp); // The keyword DOUBLEQUOTE is forbidden. Reserved, so we removed it if we find it.

            foreach ($tmparrayoftags as $tagtoreplace) {
                $tmp = preg_replace('/<' . preg_quote($tagtoreplace, '/') . '>/', '__BEGINTAGTOREPLACE' . $tagtoreplace . '__', $tmp);
                $tmp = str_ireplace('</' . $tagtoreplace . '>', '__ENDTAGTOREPLACE' . $tagtoreplace . '__', $tmp);
                $tmp = preg_replace('/<' . preg_quote($tagtoreplace, '/') . ' \/>/', '__BEGINENDTAGTOREPLACE' . $tagtoreplace . '__', $tmp);

                // For case of tag with attribute
                $reg = array();
                if (preg_match('/<' . preg_quote($tagtoreplace, '/') . '\s+([^>]+)>/', $tmp, $reg)) {
                    $tmpattributes = str_ireplace(array('[', ']'), '_', $reg[1]);   // We must never have [ ] inside the attribute string
                    $tmpattributes = str_ireplace('href="http:', '__HREFHTTPA', $tmpattributes);
                    $tmpattributes = str_ireplace('href="https:', '__HREFHTTPSA', $tmpattributes);
                    $tmpattributes = str_ireplace('src="http:', '__SRCHTTPIMG', $tmpattributes);
                    $tmpattributes = str_ireplace('src="https:', '__SRCHTTPSIMG', $tmpattributes);
                    $tmpattributes = str_ireplace('"', '__DOUBLEQUOTE', $tmpattributes);
                    $tmpattributes = preg_replace('#[^a-z0-9_/?;\s=&.-]#i', '', $tmpattributes);
                    $tmp = preg_replace('/<' . preg_quote($tagtoreplace, '/') . '\s+([^>]+)>/', '__BEGINTAGTOREPLACE' . $tagtoreplace . '[' . $tmpattributes . ']__', $tmp);
                }
                if (preg_match('/<' . preg_quote($tagtoreplace, '/') . '\s+([^>]+)> \/>/', $tmp, $reg)) {
                    $tmpattributes = str_ireplace(array('[', ']'), '_', $reg[1]);   // We must not have [ ] inside the attribute string
                    $tmpattributes = str_ireplace('"', '__DOUBLEQUOTE', $tmpattributes);
                    $tmpattributes = preg_replace('/[^a-z0-9_\/?;\s=&]/i', '', $tmpattributes);
                    $tmp = preg_replace('/<' . preg_quote($tagtoreplace, '/') . '\s+([^>]+) \/>/', '__BEGINENDTAGTOREPLACE' . $tagtoreplace . '[' . $tmpattributes . ']__', $tmp);
                }
            }
        }

        $result = htmlentities($tmp, ENT_COMPAT, 'UTF-8');

        if (count($tmparrayoftags)) {
            foreach ($tmparrayoftags as $tagtoreplace) {
                $result = str_ireplace('__BEGINTAGTOREPLACE' . $tagtoreplace . '__', '<' . $tagtoreplace . '>', $result);
                $result = preg_replace('/__BEGINTAGTOREPLACE' . $tagtoreplace . '\[(.*)]__/', '<' . $tagtoreplace . ' \1>', $result);
                $result = str_ireplace('__ENDTAGTOREPLACE' . $tagtoreplace . '__', '</' . $tagtoreplace . '>', $result);
                $result = str_ireplace('__BEGINENDTAGTOREPLACE' . $tagtoreplace . '__', '<' . $tagtoreplace . ' />', $result);
                $result = preg_replace('/__BEGINENDTAGTOREPLACE' . $tagtoreplace . '\[(.*)]__/', '<' . $tagtoreplace . ' \1 />', $result);
            }

            $result = str_ireplace('__HREFHTTPA', 'href="http:', $result);
            $result = str_ireplace('__HREFHTTPSA', 'href="https:', $result);
            $result = str_ireplace('__SRCHTTPIMG', 'src="http:', $result);
            $result = str_ireplace('__SRCHTTPSIMG', 'src="https:', $result);
            $result = str_ireplace('__DOUBLEQUOTE', '"', $result);
        }

        return $result;
    }
}

/**
 * Convert a string to lower. Never use strtolower because it does not works with UTF8 strings.
 *
 * @param string $string String to encode
 * @param string $encoding Character set encoding
 * @return  string                          String converted
 */
function dol_strtolower($string, $encoding = "UTF-8")
{
    if (function_exists('mb_strtolower')) {
        return mb_strtolower($string, $encoding);
    } else {
        return strtolower($string);
    }
}

/**
 * Convert a string to upper. Never use strtolower because it does not works with UTF8 strings.
 *
 * @param string $string String to encode
 * @param string $encoding Character set encoding
 * @return  string                          String converted
 * @see dol_ucfirst(), dol_ucwords()
 */
function dol_strtoupper($string, $encoding = "UTF-8")
{
    if (function_exists('mb_strtoupper')) {
        return mb_strtoupper($string, $encoding);
    } else {
        return strtoupper($string);
    }
}

/**
 * Convert first character of the first word of a string to upper. Never use ucfirst because it does not works with UTF8 strings.
 *
 * @param string $string String to encode
 * @param string $encoding Character set encodign
 * @return  string                      String converted
 * @see dol_strtoupper(), dol_ucwords()
 */
function dol_ucfirst($string, $encoding = "UTF-8")
{
    if (function_exists('mb_substr')) {
        return mb_strtoupper(mb_substr($string, 0, 1, $encoding), $encoding) . mb_substr($string, 1, null, $encoding);
    } else {
        return ucfirst($string);
    }
}

/**
 * Convert first character of all the words of a string to upper.
 *
 * @param string $string String to encode
 * @param string $encoding Character set encodign
 * @return  string                      String converted
 * @see dol_strtoupper(), dol_ucfirst()
 */
function dol_ucwords($string, $encoding = "UTF-8")
{
    if (function_exists('mb_convert_case')) {
        return mb_convert_case($string, MB_CASE_TITLE, $encoding);
    } else {
        return ucwords($string);
    }
}

/**
 *  Write log message into outputs. Possible outputs can be:
 *  SYSLOG_HANDLERS = ["mod_syslog_file"]       file name is then defined by SYSLOG_FILE
 *  SYSLOG_HANDLERS = ["mod_syslog_syslog"]     facility is then defined by SYSLOG_FACILITY
 *  Warning, syslog functions are bugged on Windows, generating memory protection faults. To solve
 *  this, use logging to files instead of syslog (see setup of module).
 *  Note: If constant 'SYSLOG_FILE_NO_ERROR' defined, we never output any error message when writing to log fails.
 *  Note: You can get log message into html sources by adding parameter &logtohtml=1 (constant MAIN_LOGTOHTML must be set)
 *  This function works only if syslog module is enabled.
 *  This must not use any call to other function calling dol_syslog (avoid infinite loop).
 *
 * @param string $message Line to log. ''=Show nothing
 * @param int $level Log level
 *                                              On Windows LOG_ERR=4, LOG_WARNING=5, LOG_NOTICE=LOG_INFO=6, LOG_DEBUG=6 if define_syslog_variables ou PHP 5.3+, 7 if dolibarr
 *                                              On Linux   LOG_ERR=3, LOG_WARNING=4, LOG_NOTICE=5, LOG_INFO=6, LOG_DEBUG=7
 * @param int $ident 1=Increase ident of 1 (after log), -1=Decrease ident of 1 (before log)
 * @param string $suffixinfilename When output is a file, append this suffix into default log filename. Example '_stripe', '_mail'
 * @param string $restricttologhandler Force output of log only to this log handler
 * @param array|null $logcontext If defined, an array with extra information (can be used by some log handlers)
 * @return void
 * @phan-suppress PhanPluginUnknownArrayFunctionParamType  $logcontext is not defined in detail
 */
function dol_syslog($message, $level = LOG_INFO, $ident = 0, $suffixinfilename = '', $restricttologhandler = '', $logcontext = null)
{
    global $conf, $user, $debugbar;

    // If syslog module enabled
    if (!isModEnabled('syslog')) {
        return;
    }

    // Check if we are into execution of code of a website
    if (defined('USEEXTERNALSERVER') && !defined('USEDOLIBARRSERVER') && !defined('USEDOLIBARREDITOR')) {
        global $website, $websitekey;
        if (is_object($website) && !empty($website->ref)) {
            $suffixinfilename .= '_website_' . $website->ref;
        } elseif (!empty($websitekey)) {
            $suffixinfilename .= '_website_' . $websitekey;
        }
    }

    // Check if we have a forced suffix
    if (defined('USESUFFIXINLOG')) {
        $suffixinfilename .= constant('USESUFFIXINLOG');
    }

    if ($ident < 0) {
        foreach ($conf->loghandlers as $loghandlerinstance) {
            $loghandlerinstance->setIdent($ident);
        }
    }

    if (!empty($message)) {
        // Test log level
        // @phan-suppress-next-line PhanPluginDuplicateArrayKey
        $logLevels = array(LOG_EMERG => 'EMERG', LOG_ALERT => 'ALERT', LOG_CRIT => 'CRITICAL', LOG_ERR => 'ERR', LOG_WARNING => 'WARN', LOG_NOTICE => 'NOTICE', LOG_INFO => 'INFO', LOG_DEBUG => 'DEBUG');
        if (!array_key_exists($level, $logLevels)) {
            throw new Exception('Incorrect log level');
        }
        if ($level > getDolGlobalInt('SYSLOG_LEVEL')) {
            return;
        }

        if (!getDolGlobalString('MAIN_SHOW_PASSWORD_INTO_LOG')) {
            $message = preg_replace('/password=\'[^\']*\'/', 'password=\'hidden\'', $message); // protection to avoid to have value of password in log
        }

        // If adding log inside HTML page is required
        if (
            (!empty($_REQUEST['logtohtml']) && getDolGlobalString('MAIN_ENABLE_LOG_TO_HTML'))
            || (is_object($user) && $user->hasRight('debugbar', 'read') && is_object($debugbar))
        ) {
            $ospid = sprintf("%7s", dol_trunc(getmypid(), 7, 'right', 'UTF-8', 1));
            $osuser = " " . sprintf("%6s", dol_trunc(function_exists('posix_getuid') ? posix_getuid() : '', 6, 'right', 'UTF-8', 1));

            $conf->logbuffer[] = dol_print_date(time(), "%Y-%m-%d %H:%M:%S") . " " . sprintf("%-7s", $logLevels[$level]) . " " . $ospid . " " . $osuser . " " . $message;
        }

        //TODO: Remove this. MAIN_ENABLE_LOG_INLINE_HTML should be deprecated and use a log handler dedicated to HTML output
        // If html log tag enabled and url parameter log defined, we show output log on HTML comments
        if (getDolGlobalString('MAIN_ENABLE_LOG_INLINE_HTML') && GETPOSTINT("log")) {
            print "\n\n<!-- Log start\n";
            print dol_escape_htmltag($message) . "\n";
            print "Log end -->\n";
        }

        $data = array(
            'message' => $message,
            'script' => (isset($_SERVER['PHP_SELF']) ? basename($_SERVER['PHP_SELF'], '.php') : false),
            'level' => $level,
            'user' => ((is_object($user) && $user->id) ? $user->login : false),
            'ip' => false,
            'osuser' => function_exists('posix_getuid') ? posix_getuid() : false,
            'ospid' => getmypid()   // on linux, max value is defined into cat /proc/sys/kernel/pid_max
        );

        $remoteip = getUserRemoteIP(); // Get ip when page run on a web server
        if (!empty($remoteip)) {
            $data['ip'] = $remoteip;
            // This is when server run behind a reverse proxy
            if (!empty($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'] != $remoteip) {
                $data['ip'] = $_SERVER['HTTP_X_FORWARDED_FOR'] . ' -> ' . $data['ip'];
            } elseif (!empty($_SERVER['HTTP_CLIENT_IP']) && $_SERVER['HTTP_CLIENT_IP'] != $remoteip) {
                $data['ip'] = $_SERVER['HTTP_CLIENT_IP'] . ' -> ' . $data['ip'];
            }
        } elseif (!empty($_SERVER['SERVER_ADDR'])) {
            // This is when PHP session is ran inside a web server but not inside a client request (example: init code of apache)
            $data['ip'] = $_SERVER['SERVER_ADDR'];
        } elseif (!empty($_SERVER['COMPUTERNAME'])) {
            // This is when PHP session is ran outside a web server, like from Windows command line (Not always defined, but useful if OS defines it).
            $data['ip'] = $_SERVER['COMPUTERNAME'];
        } else {
            $data['ip'] = '???';
        }

        if (!empty($_SERVER['USERNAME'])) {
            // This is when PHP session is ran outside a web server, like from Linux command line (Not always defined, but useful if OS defines it).
            $data['osuser'] = $_SERVER['USERNAME'];
        } elseif (!empty($_SERVER['LOGNAME'])) {
            // This is when PHP session is ran outside a web server, like from Linux command line (Not always defined, but useful if OS defines it).
            $data['osuser'] = $_SERVER['LOGNAME'];
        }

        // Loop on each log handler and send output
        foreach ($conf->loghandlers as $loghandlerinstance) {
            if ($restricttologhandler && $loghandlerinstance->code != $restricttologhandler) {
                continue;
            }
            $loghandlerinstance->export($data, $suffixinfilename);
        }
        unset($data);
    }

    if ($ident > 0) {
        foreach ($conf->loghandlers as $loghandlerinstance) {
            $loghandlerinstance->setIdent($ident);
        }
    }
}

/**
 *  Show tab header of a card
 *
 * @param array<string,array<int<0,5>,string>> $links Array of tabs (0=>url, 1=>label, 2=>code, 3=>not used, 4=>text after link, 5=>morecssonlink). Currently initialized by calling a function xxx_admin_prepare_head. Note that label into $links[$i][1] must be already HTML escaped.
 * @param string $active Active tab name (document', 'info', 'ldap', ....)
 * @param string $title Title
 * @param int $notab -1 or 0=Add tab header, 1=no tab header (if you set this to 1, using print dol_get_fiche_end() to close tab is not required), -2=Add tab header with no sepaaration under tab (to start a tab just after), -3=Add tab header but no footer separation
 * @param string $picto Add a picto on tab title
 * @param int $pictoisfullpath If 1, image path is a full path. If you set this to 1, you can use url returned by dol_buildpath('/mymodyle/img/myimg.png',1) for $picto.
 * @param string $morehtmlright Add more html content on right of tabs title
 * @param string $morecss More Css
 * @param int $limittoshow Limit number of tabs to show. Use 0 to use automatic default value.
 * @param string $moretabssuffix A suffix to use when you have several dol_get_fiche_head() in same page
 * @return void
 * @deprecated Use print dol_get_fiche_head() instead
 */
function dol_fiche_head($links = array(), $active = '0', $title = '', $notab = 0, $picto = '', $pictoisfullpath = 0, $morehtmlright = '', $morecss = '', $limittoshow = 0, $moretabssuffix = '')
{
    print dol_get_fiche_head($links, $active, $title, $notab, $picto, $pictoisfullpath, $morehtmlright, $morecss, $limittoshow, $moretabssuffix);
}

/**
 *  Show tab footer of a card
 *
 * @param int<-1,1> $notab -1 or 0=Add tab footer, 1=no tab footer
 * @return void
 * @deprecated Use print dol_get_fiche_end() instead
 */
function dol_fiche_end($notab = 0)
{
    print dol_get_fiche_end($notab);
}

/**
 *  Return tab footer of a card
 *
 * @param int<-1,1> $notab -1 or 0=Add tab footer, 1=no tab footer
 * @return string
 */
function dol_get_fiche_end($notab = 0)
{
    if (!$notab || $notab == -1) {
        return "\n</div>\n";
    } else {
        return '';
    }
}

/**
 *      Return a formatted address (part address/zip/town/state) according to country rules.
 *      See https://en.wikipedia.org/wiki/Address
 *
 * @param Object $object A company or contact object
 * @param int $withcountry 1=Add country into address string
 * @param string $sep Separator to use to separate info when building string
 * @param  ?Translate $outputlangs Object lang that contains language for text translation.
 * @param int $mode 0=Standard output, 1=Remove address
 * @param string $extralangcode User extralanguage $langcode as values for address, town
 * @return string                      Formatted string
 * @see dol_print_address()
 */
function dol_format_address($object, $withcountry = 0, $sep = "\n", $outputlangs = null, $mode = 0, $extralangcode = '')
{
    global $langs, $hookmanager;

    $ret = '';
    $countriesusingstate = array('AU', 'CA', 'US', 'IN', 'GB', 'ES', 'UK', 'TR', 'CN'); // See also MAIN_FORCE_STATE_INTO_ADDRESS

    // See format of addresses on https://en.wikipedia.org/wiki/Address
    // Address
    if (empty($mode)) {
        $ret .= ($extralangcode ? $object->array_languages['address'][$extralangcode] : (empty($object->address) ? '' : preg_replace('/(\r\n|\r|\n)+/', $sep, $object->address)));
    }
    // Zip/Town/State
    if (isset($object->country_code) && in_array($object->country_code, array('AU', 'CA', 'US', 'CN')) || getDolGlobalString('MAIN_FORCE_STATE_INTO_ADDRESS')) {
        // US: title firstname name \n address lines \n town, state, zip \n country
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= (($ret && $town) ? $sep : '') . $town;

        if (!empty($object->state)) {
            $ret .= ($ret ? ($town ? ", " : $sep) : '') . $object->state;
        }
        if (!empty($object->zip)) {
            $ret .= ($ret ? (($town || $object->state) ? ", " : $sep) : '') . $object->zip;
        }
    } elseif (isset($object->country_code) && in_array($object->country_code, array('GB', 'UK'))) {
        // UK: title firstname name \n address lines \n town state \n zip \n country
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= ($ret ? $sep : '') . $town;
        if (!empty($object->state)) {
            $ret .= ($ret ? ", " : '') . $object->state;
        }
        if (!empty($object->zip)) {
            $ret .= ($ret ? $sep : '') . $object->zip;
        }
    } elseif (isset($object->country_code) && in_array($object->country_code, array('ES', 'TR'))) {
        // ES: title firstname name \n address lines \n zip town \n state \n country
        $ret .= ($ret ? $sep : '') . $object->zip;
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= ($town ? (($object->zip ? ' ' : '') . $town) : '');
        if (!empty($object->state)) {
            $ret .= $sep . $object->state;
        }
    } elseif (isset($object->country_code) && $object->country_code == 'JP') {
        // JP: In romaji, title firstname name\n address lines \n [state,] town zip \n country
        // See https://www.sljfaq.org/afaq/addresses.html
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= ($ret ? $sep : '') . ($object->state ? $object->state . ', ' : '') . $town . ($object->zip ? ' ' : '') . $object->zip;
    } elseif (isset($object->country_code) && $object->country_code == 'IT') {
        // IT: title firstname name\n address lines \n zip town state_code \n country
        $ret .= ($ret ? $sep : '') . $object->zip;
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= ($town ? (($object->zip ? ' ' : '') . $town) : '');
        $ret .= (empty($object->state_code) ? '' : (' ' . $object->state_code));
    } else {
        // Other: title firstname name \n address lines \n zip town[, state] \n country
        $town = ($extralangcode ? $object->array_languages['town'][$extralangcode] : (empty($object->town) ? '' : $object->town));
        $ret .= !empty($object->zip) ? (($ret ? $sep : '') . $object->zip) : '';
        $ret .= ($town ? (($object->zip ? ' ' : ($ret ? $sep : '')) . $town) : '');
        if (!empty($object->state) && in_array($object->country_code, $countriesusingstate)) {
            $ret .= ($ret ? ", " : '') . $object->state;
        }
    }

    if (!is_object($outputlangs)) {
        $outputlangs = $langs;
    }
    if ($withcountry) {
        $langs->load("dict");
        $ret .= (empty($object->country_code) ? '' : ($ret ? $sep : '') . $outputlangs->convToOutputCharset($outputlangs->transnoentitiesnoconv("Country" . $object->country_code)));
    }
    if ($hookmanager) {
        $parameters = array('withcountry' => $withcountry, 'sep' => $sep, 'outputlangs' => $outputlangs, 'mode' => $mode, 'extralangcode' => $extralangcode);
        $reshook = $hookmanager->executeHooks('formatAddress', $parameters, $object);
        if ($reshook > 0) {
            $ret = '';
        }
        $ret .= $hookmanager->resPrint;
    }

    return $ret;
}


/**
 *  Format a string.
 *
 * @param string $fmt Format of strftime function (http://php.net/manual/fr/function.strftime.php)
 * @param int|false $ts Timestamp (If is_gmt is true, timestamp is already includes timezone and daylight saving offset, if is_gmt is false, timestamp is a GMT timestamp and we must compensate with server PHP TZ)
 * @param bool $is_gmt See comment of timestamp parameter
 * @return string                  A formatted string
 * @see dol_stringtotime()
 */
function dol_strftime($fmt, $ts = false, $is_gmt = false)
{
    if ((abs($ts) <= 0x7FFFFFFF)) { // check if number in 32-bit signed range
        return dol_print_date($ts, $fmt, $is_gmt);
    } else {
        return 'Error date outside supported range';
    }
}

/**
 *  Output date in a string format according to outputlangs (or langs if not defined).
 *  Return charset is always UTF-8, except if encodetoouput is defined. In this case charset is output charset
 *
 * @param int|string $time GM Timestamps date
 * @param string $format Output date format (tag of strftime function)
 *                                      "%d %b %Y",
 *                                      "%d/%m/%Y %H:%M",
 *                                      "%d/%m/%Y %H:%M:%S",
 *                                      "%B"=Long text of month, "%A"=Long text of day, "%b"=Short text of month, "%a"=Short text of day
 *                                      "day", "daytext", "dayhour", "dayhourldap", "dayhourtext", "dayrfc", "dayhourrfc", "...inputnoreduce", "...reduceformat"
 * @param string|bool $tzoutput true or 'gmt' => string is for Greenwich location
 *                                      false or 'tzserver' => output string is for local PHP server TZ usage
 *                                      'tzuser' => output string is for user TZ (current browser TZ with current dst) => In a future, we should have same behaviour than 'tzuserrel'
 *                                      'tzuserrel' => output string is for user TZ (current browser TZ with dst or not, depending on date position)
 * @param Translate $outputlangs Object lang that contains language for text translation.
 * @param boolean $encodetooutput false=no convert into output pagecode
 * @return string                      Formatted date or '' if time is null
 *
 * @throws DateInvalidTimeZoneException
 * @throws DateInvalidTimeZoneException
 * @see        dol_mktime(), dol_stringtotime(), dol_getdate(), selectDate()
 */
function dol_print_date($time, $format = '', $tzoutput = 'auto', $outputlangs = null, $encodetooutput = false)
{
    global $conf, $langs;

    // If date undefined or "", we return ""
    if (dol_strlen($time) == 0) {
        return ''; // $time=0 allowed (it means 01/01/1970 00:00:00)
    }

    if ($tzoutput === 'auto') {
        $tzoutput = (empty($conf) ? 'tzserver' : ($conf->tzuserinputkey ?? 'tzserver'));
    }

    // Clean parameters
    $to_gmt = false;
    $offsettz = $offsetdst = 0;
    if ($tzoutput) {
        $to_gmt = true; // For backward compatibility
        if (is_string($tzoutput)) {
            if ($tzoutput == 'tzserver') {
                $to_gmt = false;
                $offsettzstring = @date_default_timezone_get(); // Example 'Europe/Berlin' or 'Indian/Reunion'
                // @phan-suppress-next-line PhanPluginRedundantAssignment
                $offsettz = 0;  // Timezone offset with server timezone (because to_gmt is false), so 0
                // @phan-suppress-next-line PhanPluginRedundantAssignment
                $offsetdst = 0; // Dst offset with server timezone (because to_gmt is false), so 0
            } elseif ($tzoutput == 'tzuser' || $tzoutput == 'tzuserrel') {
                $to_gmt = true;
                $offsettzstring = (empty($_SESSION['dol_tz_string']) ? 'UTC' : $_SESSION['dol_tz_string']); // Example 'Europe/Berlin' or 'Indian/Reunion'

                if (class_exists('DateTimeZone')) {
                    $user_date_tz = new DateTimeZone($offsettzstring);
                    $user_dt = new DateTime();
                    $user_dt->setTimezone($user_date_tz);
                    $user_dt->setTimestamp($tzoutput == 'tzuser' ? dol_now() : (int)$time);
                    $offsettz = $user_dt->getOffset();  // should include dst ?
                } else {    // with old method (The 'tzuser' was processed like the 'tzuserrel')
                    $offsettz = (empty($_SESSION['dol_tz']) ? 0 : $_SESSION['dol_tz']) * 60 * 60; // Will not be used anymore
                    $offsetdst = (empty($_SESSION['dol_dst']) ? 0 : $_SESSION['dol_dst']) * 60 * 60; // Will not be used anymore
                }
            }
        }
    }
    if (!is_object($outputlangs)) {
        $outputlangs = $langs;
    }
    if (!$format) {
        $format = 'daytextshort';
    }

    // Do we have to reduce the length of date (year on 2 chars) to save space.
    // Note: dayinputnoreduce is same than day but no reduction of year length will be done
    $reduceformat = (!empty($conf->dol_optimize_smallscreen) && in_array($format, array('day', 'dayhour', 'dayhoursec'))) ? 1 : 0;  // Test on original $format param.
    $format = preg_replace('/inputnoreduce/', '', $format); // so format 'dayinputnoreduce' is processed like day
    $formatwithoutreduce = preg_replace('/reduceformat/', '', $format);
    if ($formatwithoutreduce != $format) {
        $format = $formatwithoutreduce;
        $reduceformat = 1;
    }  // so format 'dayreduceformat' is processed like day

    // Change predefined format into computer format. If found translation in lang file we use it, otherwise we use default.
    // TODO Add format daysmallyear and dayhoursmallyear
    if ($format == 'day') {
        $format = ($outputlangs->trans("FormatDateShort") != "FormatDateShort" ? $outputlangs->trans("FormatDateShort") : $conf->format_date_short);
    } elseif ($format == 'hour') {
        $format = ($outputlangs->trans("FormatHourShort") != "FormatHourShort" ? $outputlangs->trans("FormatHourShort") : $conf->format_hour_short);
    } elseif ($format == 'hourduration') {
        $format = ($outputlangs->trans("FormatHourShortDuration") != "FormatHourShortDuration" ? $outputlangs->trans("FormatHourShortDuration") : $conf->format_hour_short_duration);
    } elseif ($format == 'daytext') {
        $format = ($outputlangs->trans("FormatDateText") != "FormatDateText" ? $outputlangs->trans("FormatDateText") : $conf->format_date_text);
    } elseif ($format == 'daytextshort') {
        $format = ($outputlangs->trans("FormatDateTextShort") != "FormatDateTextShort" ? $outputlangs->trans("FormatDateTextShort") : $conf->format_date_text_short);
    } elseif ($format == 'dayhour') {
        $format = ($outputlangs->trans("FormatDateHourShort") != "FormatDateHourShort" ? $outputlangs->trans("FormatDateHourShort") : $conf->format_date_hour_short);
    } elseif ($format == 'dayhoursec') {
        $format = ($outputlangs->trans("FormatDateHourSecShort") != "FormatDateHourSecShort" ? $outputlangs->trans("FormatDateHourSecShort") : $conf->format_date_hour_sec_short);
    } elseif ($format == 'dayhourtext') {
        $format = ($outputlangs->trans("FormatDateHourText") != "FormatDateHourText" ? $outputlangs->trans("FormatDateHourText") : $conf->format_date_hour_text);
    } elseif ($format == 'dayhourtextshort') {
        $format = ($outputlangs->trans("FormatDateHourTextShort") != "FormatDateHourTextShort" ? $outputlangs->trans("FormatDateHourTextShort") : $conf->format_date_hour_text_short);
    } elseif ($format == 'dayhourlog') {
        // Format not sensitive to language
        $format = '%Y%m%d%H%M%S';
    } elseif ($format == 'dayhourlogsmall') {
        // Format not sensitive to language
        $format = '%y%m%d%H%M';
    } elseif ($format == 'dayhourldap') {
        $format = '%Y%m%d%H%M%SZ';
    } elseif ($format == 'dayhourxcard') {
        $format = '%Y%m%dT%H%M%SZ';
    } elseif ($format == 'dayxcard') {
        $format = '%Y%m%d';
    } elseif ($format == 'dayrfc') {
        $format = '%Y-%m-%d'; // DATE_RFC3339
    } elseif ($format == 'dayhourrfc') {
        $format = '%Y-%m-%dT%H:%M:%SZ'; // DATETIME RFC3339
    } elseif ($format == 'standard') {
        $format = '%Y-%m-%d %H:%M:%S';
    }

    if ($reduceformat) {
        $format = str_replace('%Y', '%y', $format);
        $format = str_replace('yyyy', 'yy', $format);
    }

    // Clean format
    if (preg_match('/%b/i', $format)) {     // There is some text to translate
        // We inhibit translation to text made by strftime functions. We will use trans instead later.
        $format = str_replace('%b', '__b__', $format);
        $format = str_replace('%B', '__B__', $format);
    }
    if (preg_match('/%a/i', $format)) {     // There is some text to translate
        // We inhibit translation to text made by strftime functions. We will use trans instead later.
        $format = str_replace('%a', '__a__', $format);
        $format = str_replace('%A', '__A__', $format);
    }

    // Analyze date
    $reg = array();
    if (preg_match('/^([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9])([0-9][0-9])([0-9][0-9])([0-9][0-9])$/i', (string)$time, $reg)) {  // Deprecated. Ex: 1970-01-01, 1970-01-01 01:00:00, 19700101010000
        dol_print_error(null, "Functions.lib::dol_print_date function called with a bad value from page " . (empty($_SERVER["PHP_SELF"]) ? 'unknown' : $_SERVER["PHP_SELF"]));
        return '';
    } elseif (preg_match('/^([0-9]+)-([0-9]+)-([0-9]+) ?([0-9]+)?:?([0-9]+)?:?([0-9]+)?/i', (string)$time, $reg)) {    // Still available to solve problems in extrafields of type date
        // This part of code should not be used anymore.
        dol_syslog("Functions.lib::dol_print_date function called with a bad value from page " . (empty($_SERVER["PHP_SELF"]) ? 'unknown' : $_SERVER["PHP_SELF"]), LOG_WARNING);
        //if (function_exists('debug_print_backtrace')) debug_print_backtrace();
        // Date has format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'
        $syear = (!empty($reg[1]) ? $reg[1] : '');
        $smonth = (!empty($reg[2]) ? $reg[2] : '');
        $sday = (!empty($reg[3]) ? $reg[3] : '');
        $shour = (!empty($reg[4]) ? $reg[4] : '');
        $smin = (!empty($reg[5]) ? $reg[5] : '');
        $ssec = (!empty($reg[6]) ? $reg[6] : '');

        $time = dol_mktime($shour, $smin, $ssec, $smonth, $sday, $syear, true);

        if ($to_gmt) {
            $tzo = new DateTimeZone('UTC'); // when to_gmt is true, base for offsettz and offsetdst (so timetouse) is UTC
        } else {
            $tzo = new DateTimeZone(date_default_timezone_get());   // when to_gmt is false, base for offsettz and offsetdst (so timetouse) is PHP server
        }
        $dtts = new DateTime();
        $dtts->setTimestamp($time);
        $dtts->setTimezone($tzo);
        $newformat = str_replace(
            array('%Y', '%y', '%m', '%d', '%H', '%I', '%M', '%S', '%p', 'T', 'Z', '__a__', '__A__', '__b__', '__B__'),
            array('Y', 'y', 'm', 'd', 'H', 'h', 'i', 's', 'A', '__£__', '__$__', '__{__', '__}__', '__[__', '__]__'),
            $format
        );
        $ret = $dtts->format($newformat);
        $ret = str_replace(
            array('__£__', '__$__', '__{__', '__}__', '__[__', '__]__'),
            array('T', 'Z', '__a__', '__A__', '__b__', '__B__'),
            $ret
        );
    } else {
        // Date is a timestamps
        if ($time < 100000000000) { // Protection against bad date values
            $timetouse = $time + $offsettz + $offsetdst; // TODO We could be able to disable use of offsettz and offsetdst to use only offsettzstring.

            if ($to_gmt) {
                $tzo = new DateTimeZone('UTC'); // when to_gmt is true, base for offsettz and offsetdst (so timetouse) is UTC
            } else {
                $tzo = new DateTimeZone(date_default_timezone_get());   // when to_gmt is false, base for offsettz and offsetdst (so timetouse) is PHP server
            }
            $dtts = new DateTime();
            $dtts->setTimestamp($timetouse);
            $dtts->setTimezone($tzo);
            $newformat = str_replace(
                array('%Y', '%y', '%m', '%d', '%H', '%I', '%M', '%S', '%p', '%w', 'T', 'Z', '__a__', '__A__', '__b__', '__B__'),
                array('Y', 'y', 'm', 'd', 'H', 'h', 'i', 's', 'A', 'w', '__£__', '__$__', '__{__', '__}__', '__[__', '__]__'),
                $format
            );
            $ret = $dtts->format($newformat);
            $ret = str_replace(
                array('__£__', '__$__', '__{__', '__}__', '__[__', '__]__'),
                array('T', 'Z', '__a__', '__A__', '__b__', '__B__'),
                $ret
            );
            //var_dump($ret);exit;
        } else {
            $ret = 'Bad value ' . $time . ' for date';
        }
    }

    if (preg_match('/__b__/i', $format)) {
        $timetouse = $time + $offsettz + $offsetdst; // TODO We could be able to disable use of offsettz and offsetdst to use only offsettzstring.

        if ($to_gmt) {
            $tzo = new DateTimeZone('UTC'); // when to_gmt is true, base for offsettz and offsetdst (so timetouse) is UTC
        } else {
            $tzo = new DateTimeZone(date_default_timezone_get());   // when to_gmt is false, base for offsettz and offsetdst (so timetouse) is PHP server
        }
        $dtts = new DateTime();
        $dtts->setTimestamp($timetouse);
        $dtts->setTimezone($tzo);
        $month = (int)$dtts->format("m");
        $month = sprintf("%02d", $month); // $month may be return with format '06' on some installation and '6' on other, so we force it to '06'.
        if ($encodetooutput) {
            $monthtext = $outputlangs->transnoentities('Month' . $month);
            $monthtextshort = $outputlangs->transnoentities('MonthShort' . $month);
        } else {
            $monthtext = $outputlangs->transnoentitiesnoconv('Month' . $month);
            $monthtextshort = $outputlangs->transnoentitiesnoconv('MonthShort' . $month);
        }
        //print 'monthtext='.$monthtext.' monthtextshort='.$monthtextshort;
        $ret = str_replace('__b__', $monthtextshort, $ret);
        $ret = str_replace('__B__', $monthtext, $ret);
        //print 'x'.$outputlangs->charset_output.'-'.$ret.'x';
        //return $ret;
    }
    if (preg_match('/__a__/i', $format)) {
        //print "time=$time offsettz=$offsettz offsetdst=$offsetdst offsettzstring=$offsettzstring";
        $timetouse = $time + $offsettz + $offsetdst; // TODO Replace this with function Date PHP. We also should not use anymore offsettz and offsetdst but only offsettzstring.

        if ($to_gmt) {
            $tzo = new DateTimeZone('UTC');
        } else {
            $tzo = new DateTimeZone(date_default_timezone_get());
        }
        $dtts = new DateTime();
        $dtts->setTimestamp($timetouse);
        $dtts->setTimezone($tzo);
        $w = $dtts->format("w");
        $dayweek = $outputlangs->transnoentitiesnoconv('Day' . $w);

        $ret = str_replace('__A__', $dayweek, $ret);
        $ret = str_replace('__a__', dol_substr($dayweek, 0, 3), $ret);
    }

    return $ret;
}


/**
 *  Return an array with locale date info.
 *  WARNING: This function use PHP server timezone by default to return locale information.
 *  Be aware to add the third parameter to "UTC" if you need to work on UTC.
 *
 * @param int $timestamp Timestamp
 * @param boolean $fast Fast mode. deprecated.
 * @param string $forcetimezone '' to use the PHP server timezone. Or use a form like 'gmt', 'Europe/Paris' or '+0200' to force timezone.
 * @return array{}|array{seconds:int<0,59>,minutes:int<0,59>,hours:int<0,23>,mday:int<1,31>,wday:int<0,6>,mon:int<1,12>,year:int<0,9999>,yday:int<0,366>,0:int}                        Array of information
 *                                      'seconds' => $secs,
 *                                      'minutes' => $min,
 *                                      'hours' => $hour,
 *                                      'mday' => $day,
 *                                      'wday' => $dow,     0=sunday, 6=saturday
 *                                      'mon' => $month,
 *                                      'year' => $year,
 *                                      'yday' => floor($secsInYear/$_day_power)
 *                                      '0' => original timestamp
 * @throws DateInvalidTimeZoneException
 * @see                                dol_print_date(), dol_stringtotime(), dol_mktime()
 */
function dol_getdate($timestamp, $fast = false, $forcetimezone = '')
{
    if ($timestamp === '') {
        return array();
    }

    $datetimeobj = new DateTime();
    $datetimeobj->setTimestamp($timestamp); // Use local PHP server timezone
    if ($forcetimezone) {
        $datetimeobj->setTimezone(new DateTimeZone($forcetimezone == 'gmt' ? 'UTC' : $forcetimezone)); //  (add timezone relative to the date entered)
    }
    $arrayinfo = array(
        'year' => ((int)date_format($datetimeobj, 'Y')),
        'mon' => ((int)date_format($datetimeobj, 'm')),
        'mday' => ((int)date_format($datetimeobj, 'd')),
        'wday' => ((int)date_format($datetimeobj, 'w')),
        'yday' => ((int)date_format($datetimeobj, 'z')),
        'hours' => ((int)date_format($datetimeobj, 'H')),
        'minutes' => ((int)date_format($datetimeobj, 'i')),
        'seconds' => ((int)date_format($datetimeobj, 's')),
        '0' => $timestamp
    );

    return $arrayinfo;
}

/**
 *  Return a timestamp date built from detailed information (by default a local PHP server timestamp)
 *  Replace function mktime not available under Windows if year < 1970
 *  PHP mktime is restricted to the years 1901-2038 on Unix and 1970-2038 on Windows
 *
 * @param int $hour Hour    (can be -1 for undefined)
 * @param int $minute Minute  (can be -1 for undefined)
 * @param int $second Second  (can be -1 for undefined)
 * @param int $month Month (1 to 12)
 * @param int $day Day (1 to 31)
 * @param int $year Year
 * @param mixed $gm True or 1 or 'gmt'=Input information are GMT values
 *                                      False or 0 or 'tzserver' = local to server TZ
 *                                      'auto'
 *                                      'tzuser' = local to user TZ taking dst into account at the current date. Not yet implemented.
 *                                      'tzuserrel' = local to user TZ taking dst into account at the given date. Use this one to convert date input from user into a GMT date.
 *                                      'tz,TimeZone' = use specified timezone
 * @param int $check 0=No check on parameters (Can use day 32, etc...)
 * @return int|string                  Date as a timestamp, '' if error
 * @see                                dol_print_date(), dol_stringtotime(), dol_getdate()
 */
function dol_mktime($hour, $minute, $second, $month, $day, $year, $gm = 'auto', $check = 1)
{
    global $conf;
    //print "- ".$hour.",".$minute.",".$second.",".$month.",".$day.",".$year.",".$_SERVER["WINDIR"]." -";

    if ($gm === 'auto') {
        $gm = (empty($conf) ? 'tzserver' : $conf->tzuserinputkey);
    }
    //print 'gm:'.$gm.' gm === auto:'.($gm === 'auto').'<br>';exit;

    // Clean parameters
    if ($hour == -1 || empty($hour)) {
        $hour = 0;
    }
    if ($minute == -1 || empty($minute)) {
        $minute = 0;
    }
    if ($second == -1 || empty($second)) {
        $second = 0;
    }

    // Check parameters
    if ($check) {
        if (!$month || !$day) {
            return '';
        }
        if ($day > 31) {
            return '';
        }
        if ($month > 12) {
            return '';
        }
        if ($hour < 0 || $hour > 24) {
            return '';
        }
        if ($minute < 0 || $minute > 60) {
            return '';
        }
        if ($second < 0 || $second > 60) {
            return '';
        }
    }

    if (empty($gm) || ($gm === 'server' || $gm === 'tzserver')) {
        $default_timezone = @date_default_timezone_get(); // Example 'Europe/Berlin'
        $localtz = new DateTimeZone($default_timezone);
    } elseif ($gm === 'user' || $gm === 'tzuser' || $gm === 'tzuserrel') {
        // We use dol_tz_string first because it is more reliable.
        $default_timezone = (empty($_SESSION["dol_tz_string"]) ? @date_default_timezone_get() : $_SESSION["dol_tz_string"]); // Example 'Europe/Berlin'
        try {
            $localtz = new DateTimeZone($default_timezone);
        } catch (Exception $e) {
            dol_syslog("Warning dol_tz_string contains an invalid value " . json_encode($_SESSION["dol_tz_string"] ?? null), LOG_WARNING);
            $default_timezone = @date_default_timezone_get();
        }
    } elseif (strrpos($gm, "tz,") !== false) {
        $timezone = str_replace("tz,", "", $gm); // Example 'tz,Europe/Berlin'
        try {
            $localtz = new DateTimeZone($timezone);
        } catch (Exception $e) {
            dol_syslog("Warning passed timezone contains an invalid value " . $timezone, LOG_WARNING);
        }
    }

    if (empty($localtz)) {
        $localtz = new DateTimeZone('UTC');
    }
    //var_dump($localtz);
    //var_dump($year.'-'.$month.'-'.$day.'-'.$hour.'-'.$minute);
    $dt = new DateTime('now', $localtz);
    $dt->setDate((int)$year, (int)$month, (int)$day);
    $dt->setTime((int)$hour, (int)$minute, (int)$second);
    $date = $dt->getTimestamp(); // should include daylight saving time
    //var_dump($date);
    return $date;
}


/**
 *  Return date for now. In most cases, we use this function without parameters (that means GMT time).
 *
 * @param string $mode 'auto' => for backward compatibility (avoid this),
 *                              'gmt' => we return GMT timestamp,
 *                              'tzserver' => we add the PHP server timezone
 *                              'tzref' => we add the company timezone. Not implemented.
 *                              'tzuser' or 'tzuserrel' => we add the user timezone
 * @return int   $date Timestamp
 */
function dol_now($mode = 'auto')
{
    $ret = 0;

    if ($mode === 'auto') {
        $mode = 'gmt';
    }

    if ($mode == 'gmt') {
        $ret = time(); // Time for now at greenwich.
    } elseif ($mode == 'tzserver') {        // Time for now with PHP server timezone added
        require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/date.lib.php';
        $tzsecond = getServerTimeZoneInt('now'); // Contains tz+dayling saving time
        $ret = (int)(dol_now('gmt') + ($tzsecond * 3600));
        //} elseif ($mode == 'tzref') {// Time for now with parent company timezone is added
        //  require_once DOL_DOCUMENT_ROOT.'/core/lib/date.lib.php';
        //  $tzsecond=getParentCompanyTimeZoneInt();    // Contains tz+dayling saving time
        //  $ret=dol_now('gmt')+($tzsecond*3600);
        //}
    } elseif ($mode == 'tzuser' || $mode == 'tzuserrel') {
        // Time for now with user timezone added
        //print 'time: '.time();
        $offsettz = (empty($_SESSION['dol_tz']) ? 0 : $_SESSION['dol_tz']) * 60 * 60;
        $offsetdst = (empty($_SESSION['dol_dst']) ? 0 : $_SESSION['dol_dst']) * 60 * 60;
        $ret = (int)(dol_now('gmt') + ($offsettz + $offsetdst));
    }

    return $ret;
}


/**
 * Return string with formatted size
 *
 * @param int $size Size to print
 * @param int $shortvalue Tell if we want long value to use another unit (Ex: 1.5Kb instead of 1500b)
 * @param int $shortunit Use short label of size unit (for example 'b' instead of 'bytes')
 * @return  string              Link
 */
function dol_print_size($size, $shortvalue = 0, $shortunit = 0)
{
    global $conf, $langs;
    $level = 1024;

    if (!empty($conf->dol_optimize_smallscreen)) {
        $shortunit = 1;
    }

    // Set value text
    if (empty($shortvalue) || $size < ($level * 10)) {
        $ret = $size;
        $textunitshort = $langs->trans("b");
        $textunitlong = $langs->trans("Bytes");
    } else {
        $ret = round($size / $level, 0);
        $textunitshort = $langs->trans("Kb");
        $textunitlong = $langs->trans("KiloBytes");
    }
    // Use long or short text unit
    if (empty($shortunit)) {
        $ret .= ' ' . $textunitlong;
    } else {
        $ret .= ' ' . $textunitshort;
    }

    return $ret;
}

/**
 * Get array of social network dictionary
 *
 * @return  array<string,array{rowid:int,label:string,url:string,icon:string,active:int}>   Array of Social Networks Dictionary
 */
function getArrayOfSocialNetworks()
{
    global $conf, $db;

    $socialnetworks = array();
    // Enable caching of array
    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/memory.lib.php';
    $cachekey = 'socialnetworks_' . $conf->entity;
    $dataretrieved = dol_getcache($cachekey);
    if (!is_null($dataretrieved)) {
        $socialnetworks = $dataretrieved;
    } else {
        $sql = "SELECT rowid, code, label, url, icon, active FROM " . MAIN_DB_PREFIX . "c_socialnetworks";
        $sql .= " WHERE entity=" . $conf->entity;
        $resql = $db->query($sql);
        if ($resql) {
            while ($obj = $db->fetch_object($resql)) {
                $socialnetworks[$obj->code] = array(
                    'rowid' => $obj->rowid,
                    'label' => $obj->label,
                    'url' => $obj->url,
                    'icon' => $obj->icon,
                    'active' => $obj->active,
                );
            }
        }
        dol_setcache($cachekey, $socialnetworks); // If setting cache fails, this is not a problem, so we do not test result.
    }
    return $socialnetworks;
}

/**
 *  Format professional IDs according to their country
 *
 * @param string $profID Value of profID to format
 * @param string $profIDtype Type of profID to format ('1', '2', '3', '4', '5', '6' or 'VAT')
 * @param string $countrycode Country code to use for formatting
 * @param int<0,2> $addcpButton Add button to copy to clipboard (1 => show only on hoover ; 2 => always display )
 * @return string                  Formatted profID
 */
function dol_print_profids($profID, $profIDtype, $countrycode = '', $addcpButton = 1)
{
    global $mysoc;

    if (empty($profID) || empty($profIDtype)) {
        return '';
    }
    if (empty($countrycode)) {
        $countrycode = $mysoc->country_code;
    }
    $newProfID = $profID;
    $id = substr($profIDtype, -1);
    $ret = '';
    if (strtoupper($countrycode) == 'FR') {
        // France
        // (see https://www.economie.gouv.fr/entreprises/numeros-identification-entreprise)

        if ($id == 1 && dol_strlen($newProfID) == 9) {
            // SIREN (ex: 123 123 123)
            $newProfID = substr($newProfID, 0, 3) . ' ' . substr($newProfID, 3, 3) . ' ' . substr($newProfID, 6, 3);
        }
        if ($id == 2 && dol_strlen($newProfID) == 14) {
            // SIRET (ex: 123 123 123 12345)
            $newProfID = substr($newProfID, 0, 3) . ' ' . substr($newProfID, 3, 3) . ' ' . substr($newProfID, 6, 3) . ' ' . substr($newProfID, 9, 5);
        }
        if ($id == 3 && dol_strlen($newProfID) == 5) {
            // NAF/APE (ex: 69.20Z)
            $newProfID = substr($newProfID, 0, 2) . '.' . substr($newProfID, 2, 3);
        }
        if ($profIDtype === 'VAT' && dol_strlen($newProfID) == 13) {
            // TVA intracommunautaire (ex: FR12 123 123 123)
            $newProfID = substr($newProfID, 0, 4) . ' ' . substr($newProfID, 4, 3) . ' ' . substr($newProfID, 7, 3) . ' ' . substr($newProfID, 10, 3);
        }
    }
    if (!empty($addcpButton)) {
        $ret = showValueWithClipboardCPButton(dol_escape_htmltag($profID), ($addcpButton == 1 ? 1 : 0), $newProfID);
    } else {
        $ret = $newProfID;
    }
    return $ret;
}

/**
 *  Return an IP formatted to be shown on screen
 *
 * @param string $ip IP
 * @param int $mode 0=return IP + country/flag, 1=return only country/flag, 2=return only IP
 * @return string              Formatted IP, with country if GeoIP module is enabled
 */
function dol_print_ip($ip, $mode = 0)
{
    global $langs;

    $ret = '';

    if (empty($mode)) {
        $ret .= $ip;
    }

    if ($mode != 2) {
        $countrycode = dolGetCountryCodeFromIp($ip);
        if ($countrycode) { // If success, countrycode is us, fr, ...
            if (file_exists(DOL_DOCUMENT_ROOT . '/theme/common/flags/' . $countrycode . '.png')) {
                $ret .= ' ' . img_picto($countrycode . ' ' . $langs->trans("AccordingToGeoIPDatabase"), constant('DOL_URL_ROOT') . '/theme/common/flags/' . $countrycode . '.png', '', 1);
            } else {
                $ret .= ' (' . $countrycode . ')';
            }
        }
    }

    return $ret;
}

/**
 * Return the IP of remote user.
 * Take HTTP_X_FORWARDED_FOR (defined when using proxy)
 * Then HTTP_CLIENT_IP if defined (rare)
 * Then REMOTE_ADDR (no way to be modified by user but may be wrong if user is using a proxy)
 *
 * @return  string      Ip of remote user.
 */
function getUserRemoteIP()
{
    if (empty($_SERVER['HTTP_X_FORWARDED_FOR']) || preg_match('/[^0-9.:,\[\]]/', $_SERVER['HTTP_X_FORWARDED_FOR'])) {
        if (empty($_SERVER['HTTP_CLIENT_IP']) || preg_match('/[^0-9.:,\[\]]/', $_SERVER['HTTP_CLIENT_IP'])) {
            if (empty($_SERVER["HTTP_CF_CONNECTING_IP"])) {
                $ip = (empty($_SERVER['REMOTE_ADDR']) ? '' : $_SERVER['REMOTE_ADDR']);  // value may have been the IP of the proxy and not the client
            } else {
                $ip = $_SERVER["HTTP_CF_CONNECTING_IP"];    // value here may have been forged by client
            }
        } else {
            $ip = $_SERVER['HTTP_CLIENT_IP']; // value is clean here but may have been forged by proxy
        }
    } else {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR']; // value is clean here but may have been forged by proxy
    }
    return $ip;
}

/**
 * Return if we are using a HTTPS connection
 * Check HTTPS (no way to be modified by user but may be empty or wrong if user is using a proxy)
 * Take HTTP_X_FORWARDED_PROTO (defined when using proxy)
 * Then HTTP_X_FORWARDED_SSL
 *
 * @return  boolean     True if user is using HTTPS
 */
function isHTTPS()
{
    $isSecure = false;
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
        $isSecure = true;
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
        $isSecure = true;
    }
    return $isSecure;
}

/**
 *  Return a country code from IP. Empty string if not found.
 *
 * @param string $ip IP
 * @return string              Country code ('us', 'fr', ...)
 */
function dolGetCountryCodeFromIp($ip)
{
    global $conf;

    $countrycode = '';

    if (!empty($conf->geoipmaxmind->enabled)) {
        $datafile = getDolGlobalString('GEOIPMAXMIND_COUNTRY_DATAFILE');
        //$ip='24.24.24.24';
        //$datafile='/usr/share/GeoIP/GeoIP.dat';    Note that this must be downloaded datafile (not same than datafile provided with ubuntu packages)
        $geoip = new DolGeoIP('country', $datafile);
        //print 'ip='.$ip.' databaseType='.$geoip->gi->databaseType." GEOIP_CITY_EDITION_REV1=".GEOIP_CITY_EDITION_REV1."\n";
        $countrycode = $geoip->getCountryCodeFromIP($ip);
    }

    return $countrycode;
}


/**
 *  Return country code for current user.
 *  If software is used inside a local network, detection may fails (we need a public ip)
 *
 * @return     string      Country code (fr, es, it, us, ...)
 */
function dol_user_country()
{
    global $conf, $langs, $user;

    //$ret=$user->xxx;
    $ret = '';
    if (!empty($conf->geoipmaxmind->enabled)) {
        $ip = getUserRemoteIP();
        $datafile = getDolGlobalString('GEOIPMAXMIND_COUNTRY_DATAFILE');
        //$ip='24.24.24.24';
        //$datafile='E:\Mes Sites\Web\Admin1\awstats\maxmind\GeoIP.dat';
        $geoip = new DolGeoIP('country', $datafile);
        $countrycode = $geoip->getCountryCodeFromIP($ip);
        $ret = $countrycode;
    }
    return $ret;
}

/**
 *  Format address string
 *
 * @param string $address Address string, already formatted with dol_format_address()
 * @param int $htmlid Html ID (for example 'gmap')
 * @param int $element 'thirdparty'|'contact'|'member'|'user'|'other'
 * @param int $id Id of object
 * @param int $noprint No output. Result is the function return
 * @param string $charfornl Char to use instead of nl2br. '' means we use a standad nl2br.
 * @return string|void         Nothing if noprint is 0, formatted address if noprint is 1
 * @see dol_format_address()
 */
function dol_print_address($address, $htmlid, $element, $id, $noprint = 0, $charfornl = '')
{
    global $conf, $user, $langs, $hookmanager;

    $out = '';

    if ($address) {
        if ($hookmanager) {
            $parameters = array('element' => $element, 'id' => $id);
            $reshook = $hookmanager->executeHooks('printAddress', $parameters, $address);
            $out .= $hookmanager->resPrint;
        }
        if (empty($reshook)) {
            if (empty($charfornl)) {
                $out .= nl2br($address);
            } else {
                $out .= preg_replace('/[\r\n]+/', $charfornl, $address);
            }

            // TODO Remove this block, we can add this using the hook now
            $showgmap = $showomap = 0;
            if (($element == 'thirdparty' || $element == 'societe') && isModEnabled('google') && getDolGlobalString('GOOGLE_ENABLE_GMAPS')) {
                $showgmap = 1;
            }
            if ($element == 'contact' && isModEnabled('google') && getDolGlobalString('GOOGLE_ENABLE_GMAPS_CONTACTS')) {
                $showgmap = 1;
            }
            if ($element == 'member' && isModEnabled('google') && getDolGlobalString('GOOGLE_ENABLE_GMAPS_MEMBERS')) {
                $showgmap = 1;
            }
            if ($element == 'user' && isModEnabled('google') && getDolGlobalString('GOOGLE_ENABLE_GMAPS_USERS')) {
                $showgmap = 1;
            }
            if (($element == 'thirdparty' || $element == 'societe') && isModEnabled('openstreetmap') && getDolGlobalString('OPENSTREETMAP_ENABLE_MAPS')) {
                $showomap = 1;
            }
            if ($element == 'contact' && isModEnabled('openstreetmap') && getDolGlobalString('OPENSTREETMAP_ENABLE_MAPS_CONTACTS')) {
                $showomap = 1;
            }
            if ($element == 'member' && isModEnabled('openstreetmap') && getDolGlobalString('OPENSTREETMAP_ENABLE_MAPS_MEMBERS')) {
                $showomap = 1;
            }
            if ($element == 'user' && isModEnabled('openstreetmap') && getDolGlobalString('OPENSTREETMAP_ENABLE_MAPS_USERS')) {
                $showomap = 1;
            }
            if ($showgmap) {
                $url = dol_buildpath('/google/gmaps.php?mode=' . $element . '&id=' . $id, 1);
                $out .= ' <a href="' . $url . '" target="_gmaps"><img id="' . $htmlid . '" class="valigntextbottom" src="' . constant('DOL_URL_ROOT') . '/theme/common/gmap.png"></a>';
            }
            if ($showomap) {
                $url = dol_buildpath('/openstreetmap/maps.php?mode=' . $element . '&id=' . $id, 1);
                $out .= ' <a href="' . $url . '" target="_gmaps"><img id="' . $htmlid . '_openstreetmap" class="valigntextbottom" src="' . constant('DOL_URL_ROOT') . '/theme/common/gmap.png"></a>';
            }
        }
    }
    if ($noprint) {
        return $out;
    } else {
        print $out;
    }
}


/**
 *  Return true if email syntax is ok.
 *
 * @param string $address email (Ex: "toto@example.com". Long form "John Do <johndo@example.com>" will be false)
 * @param int $acceptsupervisorkey If 1, the special string '__SUPERVISOREMAIL__' is also accepted as valid
 * @param int $acceptuserkey If 1, the special string '__USER_EMAIL__' is also accepted as valid
 * @return     boolean                             true if email syntax is OK, false if KO or empty string
 * @see isValidMXRecord()
 */
function isValidEmail($address, $acceptsupervisorkey = 0, $acceptuserkey = 0)
{
    if ($acceptsupervisorkey && $address == '__SUPERVISOREMAIL__') {
        return true;
    }
    if ($acceptuserkey && $address == '__USER_EMAIL__') {
        return true;
    }
    if (filter_var($address, FILTER_VALIDATE_EMAIL)) {
        return true;
    }

    return false;
}

/**
 *  Return if the domain name has a valid MX record.
 *  WARNING: This need function idn_to_ascii, checkdnsrr and getmxrr
 *
 * @param string $domain Domain name (Ex: "yahoo.com", "yhaoo.com", "dolibarr.fr")
 * @return     int                                 -1 if error (function not available), 0=Not valid, 1=Valid
 * @see isValidEmail()
 * @suppress PhanDeprecatedFunctionInternal Error in Phan plugins incorrectly tags some functions here
 */
function isValidMXRecord($domain)
{
    if (function_exists('idn_to_ascii') && function_exists('checkdnsrr')) {
        if (!checkdnsrr(idn_to_ascii($domain), 'MX')) {
            return 0;
        }
        if (function_exists('getmxrr')) {
            $mxhosts = array();
            $weight = array();
            getmxrr(idn_to_ascii($domain), $mxhosts, $weight);
            if (count($mxhosts) > 1) {
                return 1;
            }
            if (count($mxhosts) == 1 && !in_array((string)$mxhosts[0], array('', '.'))) {
                return 1;
            }

            return 0;
        }
    }

    // function idn_to_ascii or checkdnsrr or getmxrr does not exists
    return -1;
}

/**
 *  Return true if phone number syntax is ok
 *  TODO Decide what to do with this
 *
 * @param string $phone phone (Ex: "0601010101")
 * @return boolean                 true if phone syntax is OK, false if KO or empty string
 */
function isValidPhone($phone)
{
    return true;
}


/**
 * Return first letters of a strings.
 * Example with nbofchar=1: 'ghi' will return 'g' but 'abc def' will return 'ad'
 * Example with nbofchar=2: 'ghi' will return 'gh' but 'abc def' will return 'abde'
 *
 * @param string $s String to truncate
 * @param int $nbofchar Nb of characters to keep
 * @return  string                  Return first chars.
 */
function dolGetFirstLetters($s, $nbofchar = 1)
{
    $ret = '';
    $tmparray = explode(' ', $s);
    foreach ($tmparray as $tmps) {
        $ret .= dol_substr($tmps, 0, $nbofchar);
    }

    return $ret;
}


/**
 * Make a strlen call. Works even if mbstring module not enabled
 *
 * @param string $string String to calculate length
 * @param string $stringencoding Encoding of string
 * @return  int                             Length of string
 */
function dol_strlen($string, $stringencoding = 'UTF-8')
{
    if (is_null($string)) {
        return 0;
    }

    if (function_exists('mb_strlen')) {
        return mb_strlen($string, $stringencoding);
    } else {
        return strlen($string);
    }
}

/**
 * Make a substring. Works even if mbstring module is not enabled for better compatibility.
 *
 * @param string $string String to scan
 * @param int $start Start position (0 for first char)
 * @param int|null $length Length (in nb of characters or nb of bytes depending on trunconbytes param)
 * @param string $stringencoding Page code used for input string encoding
 * @param int $trunconbytes 1=Length is max of bytes instead of max of characters
 * @return  string                          substring
 */
function dol_substr($string, $start, $length = null, $stringencoding = '', $trunconbytes = 0)
{
    global $langs;

    if (empty($stringencoding)) {
        $stringencoding = (empty($langs) ? 'UTF-8' : $langs->charset_output);
    }

    $ret = '';
    if (empty($trunconbytes)) {
        if (function_exists('mb_substr')) {
            $ret = mb_substr($string, $start, $length, $stringencoding);
        } else {
            $ret = substr($string, $start, $length);
        }
    } else {
        if (function_exists('mb_strcut')) {
            $ret = mb_strcut($string, $start, $length, $stringencoding);
        } else {
            $ret = substr($string, $start, $length);
        }
    }
    return $ret;
}


/**
 *  Truncate a string to a particular length adding '…' if string larger than length.
 *  If length = max length+1, we do no truncate to avoid having just 1 char replaced with '…'.
 *  MAIN_DISABLE_TRUNC=1 can disable all truncings
 *
 * @param string $string String to truncate
 * @param int $size Max string size visible (excluding …). 0 for no limit. WARNING: Final string size can have 3 more chars (if we added …, or if size was max+1 so it does not worse to replace with ...)
 * @param string $trunc Where to trunc: 'right', 'left', 'middle' (size must be a 2 power), 'wrap'
 * @param string $stringencoding Tell what is source string encoding
 * @param int $nodot Truncation do not add … after truncation. So it's an exact truncation.
 * @param int $display Trunc is used to display data and can be changed for small screen. TODO Remove this param (must be dealt with CSS)
 * @return string                      Truncated string. WARNING: length is never higher than $size if $nodot is set, but can be 3 chars higher otherwise.
 */
function dol_trunc($string, $size = 40, $trunc = 'right', $stringencoding = 'UTF-8', $nodot = 0, $display = 0)
{
    global $conf;

    if (empty($size) || getDolGlobalString('MAIN_DISABLE_TRUNC')) {
        return $string;
    }

    if (empty($stringencoding)) {
        $stringencoding = 'UTF-8';
    }
    // reduce for small screen
    if (!empty($conf->dol_optimize_smallscreen) && $conf->dol_optimize_smallscreen == 1 && $display == 1) {
        $size = round($size / 3);
    }

    // We go always here
    if ($trunc == 'right') {
        $newstring = dol_textishtml($string) ? dol_string_nohtmltag($string, 1) : $string;
        if (dol_strlen($newstring, $stringencoding) > ($size + ($nodot ? 0 : 1))) {
            // If nodot is 0 and size is 1 chars more, we don't trunc and don't add …
            return dol_substr($newstring, 0, $size, $stringencoding) . ($nodot ? '' : '…');
        } else {
            //return 'u'.$size.'-'.$newstring.'-'.dol_strlen($newstring,$stringencoding).'-'.$string;
            return $string;
        }
    } elseif ($trunc == 'middle') {
        $newstring = dol_textishtml($string) ? dol_string_nohtmltag($string, 1) : $string;
        if (dol_strlen($newstring, $stringencoding) > 2 && dol_strlen($newstring, $stringencoding) > ($size + 1)) {
            $size1 = round($size / 2);
            $size2 = round($size / 2);
            return dol_substr($newstring, 0, $size1, $stringencoding) . '…' . dol_substr($newstring, dol_strlen($newstring, $stringencoding) - $size2, $size2, $stringencoding);
        } else {
            return $string;
        }
    } elseif ($trunc == 'left') {
        $newstring = dol_textishtml($string) ? dol_string_nohtmltag($string, 1) : $string;
        if (dol_strlen($newstring, $stringencoding) > ($size + ($nodot ? 0 : 1))) {
            // If nodot is 0 and size is 1 chars more, we don't trunc and don't add …
            return '…' . dol_substr($newstring, dol_strlen($newstring, $stringencoding) - $size, $size, $stringencoding);
        } else {
            return $string;
        }
    } elseif ($trunc == 'wrap') {
        $newstring = dol_textishtml($string) ? dol_string_nohtmltag($string, 1) : $string;
        if (dol_strlen($newstring, $stringencoding) > ($size + 1)) {
            return dol_substr($newstring, 0, $size, $stringencoding) . "\n" . dol_trunc(dol_substr($newstring, $size, dol_strlen($newstring, $stringencoding) - $size, $stringencoding), $size, $trunc);
        } else {
            return $string;
        }
    } else {
        return 'BadParam3CallingDolTrunc';
    }
}

/**
 * Return the picto for a data type
 *
 * @param string $key Key
 * @param string $morecss Add more css to the object
 * @return  string                  Pïcto for the key
 */
function getPictoForType($key, $morecss = '')
{
    // Set array with type -> picto
    $type2picto = array(
        'varchar' => 'font',
        'text' => 'font',
        'html' => 'code',
        'int' => 'sort-numeric-down',
        'double' => 'sort-numeric-down',
        'price' => 'currency',
        'pricecy' => 'multicurrency',
        'password' => 'key',
        'boolean' => 'check-square',
        'date' => 'calendar',
        'datetime' => 'calendar',
        'phone' => 'phone',
        'mail' => 'email',
        'url' => 'url',
        'ip' => 'country',
        'select' => 'list',
        'sellist' => 'list',
        'radio' => 'check-circle',
        'checkbox' => 'check-square',
        'chkbxlst' => 'check-square',
        'link' => 'link',
        'icon' => "question",
        'point' => "country",
        'multipts' => 'country',
        'linestrg' => "country",
        'polygon' => "country",
        'separate' => 'minus'
    );

    if (!empty($type2picto[$key])) {
        return img_picto('', $type2picto[$key], 'class="pictofixedwidth' . ($morecss ? ' ' . $morecss : '') . '"');
    }

    return img_picto('', 'generic', 'class="pictofixedwidth' . ($morecss ? ' ' . $morecss : '') . '"');
}


/**
 *  Show picto whatever it's its name (generic function)
 *
 * @param string $titlealt Text on title tag for tooltip. Not used if param notitle is set to 1.
 * @param string $picto Name of image file to show ('filenew', ...).
 *                                                  For font awesome icon (example 'user'), you can use picto_nocolor to not have the color of picto forced.
 *                                                  If no extension provided and it is not a font awesome icon, we use '.png'. Image must be stored into theme/xxx/img directory.
 *                                                  Example: picto.png                  if picto.png is stored into htdocs/theme/mytheme/img
 *                                                  Example: picto.png@mymodule         if picto.png is stored into htdocs/mymodule/img
 *                                                  Example: /mydir/mysubdir/picto.png  if picto.png is stored into htdocs/mydir/mysubdir (pictoisfullpath must be set to 1)
 *                                                  Example: fontawesome_envelope-open-text_fas_red_1em if you want to use fontaweseome icons: fontawesome_<icon-name>_<style>_<color>_<size> (only icon-name is mandatory)
 * @param string $moreatt Add more attribute on img tag (For example 'class="pictofixedwidth"')
 * @param int<0,1> $pictoisfullpath If true or 1, image path is a full path, 0 if not
 * @param int $srconly Return only content of the src attribute of img.
 * @param int $notitle 1=Disable tag title. Use it if you add js tooltip, to avoid duplicate tooltip.
 * @param string $alt Force alt for bind people
 * @param string $morecss Add more class css on img tag (For example 'myclascss').
 * @param int $marginleftonlyshort 1 = Add a short left margin on picto, 2 = Add a larger left margin on picto, 0 = No margin left. Works for fontawesome picto only.
 * @return     string                              Return img tag
 * @see        img_object(), img_picto_common()
 */
function img_picto($titlealt, $picto, $moreatt = '', $pictoisfullpath = 0, $srconly = 0, $notitle = 0, $alt = '', $morecss = '', $marginleftonlyshort = 2)
{
    global $conf;

    // We forge fullpathpicto for image to $path/img/$picto. By default, we take DOL_URL_ROOT/theme/$conf->theme/img/$picto
    $url = DOL_URL_ROOT;
    $theme = isset($conf->theme) ? $conf->theme : null;
    $path = 'theme/' . $theme;
    if (empty($picto)) {
        $picto = 'generic';
    }

    // Define fullpathpicto to use into src
    if ($pictoisfullpath) {
        // Clean parameters
        if (!preg_match('/(\.png|\.gif|\.svg)$/i', $picto)) {
            $picto .= '.png';
        }
        $fullpathpicto = $picto;
        $reg = array();
        if (preg_match('/class="([^"]+)"/', $moreatt, $reg)) {
            $morecss .= ($morecss ? ' ' : '') . $reg[1];
            $moreatt = str_replace('class="' . $reg[1] . '"', '', $moreatt);
        }
    } else {
        $pictowithouttext = preg_replace('/(\.png|\.gif|\.svg)$/', '', (is_null($picto) ? '' : $picto));
        $pictowithouttext = str_replace('object_', '', $pictowithouttext);
        $pictowithouttext = str_replace('_nocolor', '', $pictowithouttext);

        if (strpos($pictowithouttext, 'fontawesome_') === 0 || strpos($pictowithouttext, 'fa-') === 0) {
            // This is a font awesome image 'fontawesome_xxx' or 'fa-xxx'
            $pictowithouttext = str_replace('fontawesome_', '', $pictowithouttext);
            $pictowithouttext = str_replace('fa-', '', $pictowithouttext);

            // Compatibility with old fontawesome versions
            if ($pictowithouttext == 'file-o') {
                $pictowithouttext = 'file';
            }

            $pictowithouttextarray = explode('_', $pictowithouttext);
            $marginleftonlyshort = 0;

            if (!empty($pictowithouttextarray[1])) {
                // Syntax is 'fontawesome_fakey_faprefix_facolor_fasize' or 'fa-fakey_faprefix_facolor_fasize'
                $fakey = 'fa-' . $pictowithouttextarray[0];
                $faprefix = empty($pictowithouttextarray[1]) ? 'fas' : $pictowithouttextarray[1];
                $facolor = empty($pictowithouttextarray[2]) ? '' : $pictowithouttextarray[2];
                $fasize = empty($pictowithouttextarray[3]) ? '' : $pictowithouttextarray[3];
            } else {
                $fakey = 'fa-' . $pictowithouttext;
                $faprefix = 'fas';
                $facolor = '';
                $fasize = '';
            }

            // This snippet only needed since function img_edit accepts only one additional parameter: no separate one for css only.
            // class/style need to be extracted to avoid duplicate class/style validation errors when $moreatt is added to the end of the attributes.
            $morestyle = '';
            $reg = array();
            if (preg_match('/class="([^"]+)"/', $moreatt, $reg)) {
                $morecss .= ($morecss ? ' ' : '') . $reg[1];
                $moreatt = str_replace('class="' . $reg[1] . '"', '', $moreatt);
            }
            if (preg_match('/style="([^"]+)"/', $moreatt, $reg)) {
                $morestyle = $reg[1];
                $moreatt = str_replace('style="' . $reg[1] . '"', '', $moreatt);
            }
            $moreatt = trim($moreatt);

            $enabledisablehtml = '<span class="' . $faprefix . ' ' . $fakey . ($marginleftonlyshort ? ($marginleftonlyshort == 1 ? ' marginleftonlyshort' : ' marginleftonly') : '');
            $enabledisablehtml .= ($morecss ? ' ' . $morecss : '') . '" style="' . ($fasize ? ('font-size: ' . $fasize . ';') : '') . ($facolor ? (' color: ' . $facolor . ';') : '') . ($morestyle ? ' ' . $morestyle : '') . '"' . (($notitle || empty($titlealt)) ? '' : ' title="' . dol_escape_htmltag($titlealt) . '"') . ($moreatt ? ' ' . $moreatt : '') . '>';
            /*if (!empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                $enabledisablehtml .= $titlealt;
            }*/
            $enabledisablehtml .= '</span>';

            return $enabledisablehtml;
        }

        if (
            empty($srconly) && in_array($pictowithouttext, array(
                '1downarrow', '1uparrow', '1leftarrow', '1rightarrow', '1uparrow_selected', '1downarrow_selected', '1leftarrow_selected', '1rightarrow_selected',
                'accountancy', 'accounting_account', 'account', 'accountline', 'action', 'add', 'address', 'ai', 'angle-double-down', 'angle-double-up', 'asset',
                'bank_account', 'barcode', 'bank', 'bell', 'bill', 'billa', 'billr', 'billd', 'birthday-cake', 'bom', 'bookcal', 'bookmark', 'briefcase-medical', 'bug', 'building',
                'card', 'calendarlist', 'calendar', 'calendarmonth', 'calendarweek', 'calendarday', 'calendarperuser', 'calendarpertype',
                'cash-register', 'category', 'chart', 'check', 'clock', 'clone', 'close_title', 'code', 'cog', 'collab', 'company', 'contact', 'country', 'contract', 'conversation', 'cron', 'cross', 'cubes',
                'check-circle', 'check-square', 'circle', 'stop-circle', 'currency', 'multicurrency',
                'chevron-left', 'chevron-right', 'chevron-down', 'chevron-top',
                'chevron-double-left', 'chevron-double-right', 'chevron-double-down', 'chevron-double-top',
                'commercial', 'companies',
                'delete', 'dolly', 'dollyrevert', 'donation', 'download', 'dynamicprice',
                'edit', 'ellipsis-h', 'email', 'entity', 'envelope', 'eraser', 'establishment', 'expensereport', 'external-link-alt', 'external-link-square-alt', 'eye',
                'filter', 'file', 'file-o', 'file-code', 'file-export', 'file-import', 'file-upload', 'autofill', 'folder', 'folder-open', 'folder-plus', 'font',
                'gears', 'generate', 'generic', 'globe', 'globe-americas', 'graph', 'grip', 'grip_title', 'group',
                'hands-helping', 'help', 'holiday',
                'id-card', 'images', 'incoterm', 'info', 'intervention', 'inventory', 'intracommreport', 'jobprofile',
                'key', 'knowledgemanagement',
                'label', 'language', 'layout', 'line', 'link', 'list', 'list-alt', 'listlight', 'loan', 'lock', 'lot', 'long-arrow-alt-right',
                'margin', 'map-marker-alt', 'member', 'meeting', 'minus', 'money-bill-alt', 'movement', 'mrp', 'note', 'next',
                'off', 'on', 'order',
                'paiment', 'paragraph', 'play', 'pdf', 'phone', 'phoning', 'phoning_mobile', 'phoning_fax', 'playdisabled', 'previous', 'poll', 'pos', 'printer', 'product', 'propal', 'proposal', 'puce',
                'stock', 'resize', 'service', 'stats',
                'security', 'setup', 'share-alt', 'sign-out', 'split', 'stripe', 'stripe-s', 'switch_off', 'switch_on', 'switch_on_warning', 'switch_on_red', 'tools', 'unlink', 'uparrow', 'user', 'user-tie', 'vcard', 'wrench',
                'github', 'google', 'jabber', 'microsoft', 'skype', 'twitter', 'facebook', 'linkedin', 'instagram', 'snapchat', 'youtube', 'google-plus-g', 'whatsapp',
                'generic', 'home', 'hrm', 'members', 'products', 'invoicing',
                'partnership', 'payment', 'payment_vat', 'pencil-ruler', 'pictoconfirm', 'preview', 'project', 'projectpub', 'projecttask', 'question', 'refresh', 'region',
                'salary', 'shipment', 'state', 'supplier_invoice', 'supplier_invoicea', 'supplier_invoicer', 'supplier_invoiced',
                'technic', 'ticket',
                'error', 'warning',
                'recent', 'reception', 'recruitmentcandidature', 'recruitmentjobposition', 'replacement', 'resource', 'recurring', 'rss',
                'shapes', 'skill', 'square', 'sort-numeric-down', 'status', 'stop-circle', 'supplier', 'supplier_proposal', 'supplier_order', 'supplier_invoice',
                'terminal', 'tick', 'timespent', 'title_setup', 'title_accountancy', 'title_bank', 'title_hrm', 'title_agenda', 'trip',
                'uncheck', 'url', 'user-cog', 'user-injured', 'user-md', 'vat', 'website', 'workstation', 'webhook', 'world', 'private',
                'conferenceorbooth', 'eventorganization',
                'stamp', 'signature',
                'webportal'
            ))
        ) {
            $fakey = $pictowithouttext;
            $facolor = '';
            $fasize = '';
            $fa = getDolGlobalString('MAIN_FONTAWESOME_ICON_STYLE', 'fas');
            if (in_array($pictowithouttext, array('card', 'bell', 'clock', 'establishment', 'file', 'file-o', 'generic', 'minus-square', 'object_generic', 'pdf', 'plus-square', 'timespent', 'note', 'off', 'on', 'object_bookmark', 'bookmark', 'vcard'))) {
                $fa = 'far';
            }
            if (in_array($pictowithouttext, array('black-tie', 'github', 'google', 'microsoft', 'skype', 'twitter', 'facebook', 'linkedin', 'instagram', 'snapchat', 'stripe', 'stripe-s', 'youtube', 'google-plus-g', 'whatsapp'))) {
                $fa = 'fab';
            }

            $arrayconvpictotofa = array(
                'account' => 'university', 'accounting_account' => 'clipboard-list', 'accountline' => 'receipt', 'accountancy' => 'search-dollar', 'action' => 'calendar-alt', 'add' => 'plus-circle', 'address' => 'address-book', 'ai' => 'magic',
                'asset' => 'money-check-alt', 'autofill' => 'fill',
                'bank_account' => 'university',
                'bill' => 'file-invoice-dollar', 'billa' => 'file-excel', 'billr' => 'file-invoice-dollar', 'billd' => 'file-medical',
                'bookcal' => 'calendar-check',
                'supplier_invoice' => 'file-invoice-dollar', 'supplier_invoicea' => 'file-excel', 'supplier_invoicer' => 'file-invoice-dollar', 'supplier_invoiced' => 'file-medical',
                'bom' => 'shapes',
                'card' => 'address-card', 'chart' => 'chart-line', 'company' => 'building', 'contact' => 'address-book', 'contract' => 'suitcase', 'collab' => 'people-arrows', 'conversation' => 'comments', 'country' => 'globe-americas', 'cron' => 'business-time', 'cross' => 'times',
                'chevron-double-left' => 'angle-double-left', 'chevron-double-right' => 'angle-double-right', 'chevron-double-down' => 'angle-double-down', 'chevron-double-top' => 'angle-double-up',
                'donation' => 'file-alt', 'dynamicprice' => 'hand-holding-usd',
                'setup' => 'cog', 'companies' => 'building', 'products' => 'cube', 'commercial' => 'suitcase', 'invoicing' => 'coins',
                'accounting' => 'search-dollar', 'category' => 'tag', 'dollyrevert' => 'dolly',
                'file-o' => 'file', 'generate' => 'plus-square', 'hrm' => 'user-tie', 'incoterm' => 'truck-loading',
                'margin' => 'calculator', 'members' => 'user-friends', 'ticket' => 'ticket-alt', 'globe' => 'external-link-alt', 'lot' => 'barcode',
                'email' => 'at', 'establishment' => 'building', 'edit' => 'pencil-alt', 'entity' => 'globe',
                'graph' => 'chart-line', 'grip_title' => 'arrows-alt', 'grip' => 'arrows-alt', 'help' => 'question-circle',
                'generic' => 'file', 'holiday' => 'umbrella-beach',
                'info' => 'info-circle', 'inventory' => 'boxes', 'intracommreport' => 'globe-europe', 'jobprofile' => 'cogs',
                'knowledgemanagement' => 'ticket-alt', 'label' => 'layer-group', 'layout' => 'columns', 'line' => 'bars', 'loan' => 'money-bill-alt',
                'member' => 'user-alt', 'meeting' => 'chalkboard-teacher', 'mrp' => 'cubes', 'next' => 'arrow-alt-circle-right',
                'trip' => 'wallet', 'expensereport' => 'wallet', 'group' => 'users', 'movement' => 'people-carry',
                'sign-out' => 'sign-out-alt',
                'switch_off' => 'toggle-off', 'switch_on' => 'toggle-on', 'switch_on_warning' => 'toggle-on', 'switch_on_red' => 'toggle-on', 'check' => 'check', 'bookmark' => 'star',
                'bank' => 'university', 'close_title' => 'times', 'delete' => 'trash', 'filter' => 'filter',
                'list-alt' => 'list-alt', 'calendarlist' => 'bars', 'calendar' => 'calendar-alt', 'calendarmonth' => 'calendar-alt', 'calendarweek' => 'calendar-week', 'calendarday' => 'calendar-day', 'calendarperuser' => 'table',
                'intervention' => 'ambulance', 'invoice' => 'file-invoice-dollar', 'order' => 'file-invoice',
                'error' => 'exclamation-triangle', 'warning' => 'exclamation-triangle',
                'other' => 'square',
                'playdisabled' => 'play', 'pdf' => 'file-pdf', 'poll' => 'check-double', 'pos' => 'cash-register', 'preview' => 'binoculars', 'project' => 'project-diagram', 'projectpub' => 'project-diagram', 'projecttask' => 'tasks', 'propal' => 'file-signature', 'proposal' => 'file-signature',
                'partnership' => 'handshake', 'payment' => 'money-check-alt', 'payment_vat' => 'money-check-alt', 'pictoconfirm' => 'check-square', 'phoning' => 'phone', 'phoning_mobile' => 'mobile-alt', 'phoning_fax' => 'fax', 'previous' => 'arrow-alt-circle-left', 'printer' => 'print', 'product' => 'cube', 'puce' => 'angle-right',
                'recent' => 'check-square', 'reception' => 'dolly', 'recruitmentjobposition' => 'id-card-alt', 'recruitmentcandidature' => 'id-badge',
                'resize' => 'crop', 'supplier_order' => 'dol-order_supplier', 'supplier_proposal' => 'file-signature',
                'refresh' => 'redo', 'region' => 'map-marked', 'replacement' => 'exchange-alt', 'resource' => 'laptop-house', 'recurring' => 'history',
                'service' => 'concierge-bell',
                'skill' => 'shapes', 'state' => 'map-marked-alt', 'security' => 'key', 'salary' => 'wallet', 'shipment' => 'dolly', 'stock' => 'box-open', 'stats' => 'chart-bar', 'split' => 'code-branch',
                'status' => 'stop-circle',
                'stripe' => 'stripe-s', 'supplier' => 'building',
                'technic' => 'cogs', 'tick' => 'check', 'timespent' => 'clock', 'title_setup' => 'tools', 'title_accountancy' => 'money-check-alt', 'title_bank' => 'university', 'title_hrm' => 'umbrella-beach',
                'title_agenda' => 'calendar-alt',
                'uncheck' => 'times', 'uparrow' => 'share', 'url' => 'external-link-alt', 'vat' => 'money-check-alt', 'vcard' => 'arrow-alt-circle-down',
                'jabber' => 'comment-o',
                'website' => 'globe-americas', 'workstation' => 'pallet', 'webhook' => 'bullseye', 'world' => 'globe', 'private' => 'user-lock',
                'conferenceorbooth' => 'chalkboard-teacher', 'eventorganization' => 'project-diagram',
                'webportal' => 'door-open'
            );
            if ($conf->currency == 'EUR') {
                $arrayconvpictotofa['currency'] = 'euro-sign';
                $arrayconvpictotofa['multicurrency'] = 'dollar-sign';
            } else {
                $arrayconvpictotofa['currency'] = 'dollar-sign';
                $arrayconvpictotofa['multicurrency'] = 'euro-sign';
            }
            if ($pictowithouttext == 'off') {
                $fakey = 'fa-square';
                $fasize = '1.3em';
            } elseif ($pictowithouttext == 'on') {
                $fakey = 'fa-check-square';
                $fasize = '1.3em';
            } elseif ($pictowithouttext == 'listlight') {
                $fakey = 'fa-download';
                $marginleftonlyshort = 1;
            } elseif ($pictowithouttext == 'printer') {
                $fakey = 'fa-print';
                $fasize = '1.2em';
            } elseif ($pictowithouttext == 'note') {
                $fakey = 'fa-sticky-note';
                $marginleftonlyshort = 1;
            } elseif (in_array($pictowithouttext, array('1uparrow', '1downarrow', '1leftarrow', '1rightarrow', '1uparrow_selected', '1downarrow_selected', '1leftarrow_selected', '1rightarrow_selected'))) {
                $convertarray = array('1uparrow' => 'caret-up', '1downarrow' => 'caret-down', '1leftarrow' => 'caret-left', '1rightarrow' => 'caret-right', '1uparrow_selected' => 'caret-up', '1downarrow_selected' => 'caret-down', '1leftarrow_selected' => 'caret-left', '1rightarrow_selected' => 'caret-right');
                $fakey = 'fa-' . $convertarray[$pictowithouttext];
                if (preg_match('/selected/', $pictowithouttext)) {
                    $facolor = '#888';
                }
                $marginleftonlyshort = 1;
            } elseif (!empty($arrayconvpictotofa[$pictowithouttext])) {
                $fakey = 'fa-' . $arrayconvpictotofa[$pictowithouttext];
            } else {
                $fakey = 'fa-' . $pictowithouttext;
            }

            if (in_array($pictowithouttext, array('dollyrevert', 'member', 'members', 'contract', 'group', 'resource', 'shipment', 'reception'))) {
                $morecss .= ' em092';
            }
            if (in_array($pictowithouttext, array('conferenceorbooth', 'collab', 'eventorganization', 'holiday', 'info', 'project', 'workstation'))) {
                $morecss .= ' em088';
            }
            if (in_array($pictowithouttext, array('asset', 'intervention', 'payment', 'loan', 'partnership', 'stock', 'technic'))) {
                $morecss .= ' em080';
            }

            // Define $marginleftonlyshort
            $arrayconvpictotomarginleftonly = array(
                'bank', 'check', 'delete', 'generic', 'grip', 'grip_title', 'jabber',
                'grip_title', 'grip', 'listlight', 'note', 'on', 'off', 'playdisabled', 'printer', 'resize', 'sign-out', 'stats', 'switch_on', 'switch_on_red', 'switch_off',
                'uparrow', '1uparrow', '1downarrow', '1leftarrow', '1rightarrow', '1uparrow_selected', '1downarrow_selected', '1leftarrow_selected', '1rightarrow_selected'
            );
            if (!isset($arrayconvpictotomarginleftonly[$pictowithouttext])) {
                $marginleftonlyshort = 0;
            }

            // Add CSS
            $arrayconvpictotomorcess = array(
                'action' => 'infobox-action', 'account' => 'infobox-bank_account', 'accounting_account' => 'infobox-bank_account', 'accountline' => 'infobox-bank_account', 'accountancy' => 'infobox-bank_account', 'asset' => 'infobox-bank_account',
                'bank_account' => 'infobox-bank_account',
                'bill' => 'infobox-commande', 'billa' => 'infobox-commande', 'billr' => 'infobox-commande', 'billd' => 'infobox-commande',
                'bookcal' => 'infobox-action',
                'margin' => 'infobox-bank_account', 'conferenceorbooth' => 'infobox-project',
                'cash-register' => 'infobox-bank_account', 'contract' => 'infobox-contrat', 'check' => 'font-status4', 'collab' => 'infobox-action', 'conversation' => 'infobox-contrat',
                'donation' => 'infobox-commande', 'dolly' => 'infobox-commande', 'dollyrevert' => 'flip infobox-order_supplier',
                'ecm' => 'infobox-action', 'eventorganization' => 'infobox-project',
                'hrm' => 'infobox-adherent', 'group' => 'infobox-adherent', 'intervention' => 'infobox-contrat',
                'incoterm' => 'infobox-supplier_proposal',
                'currency' => 'infobox-bank_account', 'multicurrency' => 'infobox-bank_account',
                'members' => 'infobox-adherent', 'member' => 'infobox-adherent', 'money-bill-alt' => 'infobox-bank_account',
                'order' => 'infobox-commande',
                'user' => 'infobox-adherent', 'users' => 'infobox-adherent',
                'error' => 'pictoerror', 'warning' => 'pictowarning', 'switch_on' => 'font-status4', 'switch_on_warning' => 'font-status4 warning', 'switch_on_red' => 'font-status8',
                'holiday' => 'infobox-holiday', 'info' => 'opacityhigh', 'invoice' => 'infobox-commande',
                'knowledgemanagement' => 'infobox-contrat rotate90', 'loan' => 'infobox-bank_account',
                'payment' => 'infobox-bank_account', 'payment_vat' => 'infobox-bank_account', 'poll' => 'infobox-adherent', 'pos' => 'infobox-bank_account', 'project' => 'infobox-project', 'projecttask' => 'infobox-project',
                'propal' => 'infobox-propal', 'proposal' => 'infobox-propal', 'private' => 'infobox-project',
                'reception' => 'flip infobox-order_supplier', 'recruitmentjobposition' => 'infobox-adherent', 'recruitmentcandidature' => 'infobox-adherent',
                'resource' => 'infobox-action',
                'salary' => 'infobox-bank_account', 'shapes' => 'infobox-adherent', 'shipment' => 'infobox-commande', 'stripe' => 'infobox-bank_account', 'supplier_invoice' => 'infobox-order_supplier', 'supplier_invoicea' => 'infobox-order_supplier', 'supplier_invoiced' => 'infobox-order_supplier',
                'supplier' => 'infobox-order_supplier', 'supplier_order' => 'infobox-order_supplier', 'supplier_proposal' => 'infobox-supplier_proposal',
                'ticket' => 'infobox-contrat', 'title_accountancy' => 'infobox-bank_account', 'title_hrm' => 'infobox-holiday', 'expensereport' => 'infobox-expensereport', 'trip' => 'infobox-expensereport', 'title_agenda' => 'infobox-action',
                'vat' => 'infobox-bank_account',
                //'title_setup'=>'infobox-action', 'tools'=>'infobox-action',
                'list-alt' => 'imgforviewmode', 'calendar' => 'imgforviewmode', 'calendarweek' => 'imgforviewmode', 'calendarmonth' => 'imgforviewmode', 'calendarday' => 'imgforviewmode', 'calendarperuser' => 'imgforviewmode'
            );
            if (!empty($arrayconvpictotomorcess[$pictowithouttext]) && strpos($picto, '_nocolor') === false) {
                $morecss .= ($morecss ? ' ' : '') . $arrayconvpictotomorcess[$pictowithouttext];
            }

            // Define $color
            $arrayconvpictotocolor = array(
                'address' => '#6c6aa8', 'building' => '#6c6aa8', 'bom' => '#a69944',
                'clone' => '#999', 'cog' => '#999', 'companies' => '#6c6aa8', 'company' => '#6c6aa8', 'contact' => '#6c6aa8', 'cron' => '#555',
                'dynamicprice' => '#a69944',
                'edit' => '#444', 'note' => '#999', 'error' => '', 'help' => '#bbb', 'listlight' => '#999', 'language' => '#555',
                //'dolly'=>'#a69944', 'dollyrevert'=>'#a69944',
                'lock' => '#ddd', 'lot' => '#a69944',
                'map-marker-alt' => '#aaa', 'mrp' => '#a69944', 'product' => '#a69944', 'service' => '#a69944', 'inventory' => '#a69944', 'stock' => '#a69944', 'movement' => '#a69944',
                'other' => '#ddd', 'world' => '#986c6a',
                'partnership' => '#6c6aa8', 'playdisabled' => '#ccc', 'printer' => '#444', 'projectpub' => '#986c6a', 'resize' => '#444', 'rss' => '#cba',
                //'shipment'=>'#a69944',
                'security' => '#999', 'square' => '#888', 'stop-circle' => '#888', 'stats' => '#444', 'switch_off' => '#999',
                'technic' => '#999', 'tick' => '#282', 'timespent' => '#555',
                'uncheck' => '#800', 'uparrow' => '#555', 'user-cog' => '#999', 'country' => '#aaa', 'globe-americas' => '#aaa', 'region' => '#aaa', 'state' => '#aaa',
                'website' => '#304', 'workstation' => '#a69944'
            );
            if (isset($arrayconvpictotocolor[$pictowithouttext]) && strpos($picto, '_nocolor') === false) {
                $facolor = $arrayconvpictotocolor[$pictowithouttext];
            }

            // This snippet only needed since function img_edit accepts only one additional parameter: no separate one for css only.
            // class/style need to be extracted to avoid duplicate class/style validation errors when $moreatt is added to the end of the attributes.
            $morestyle = '';
            $reg = array();
            if (preg_match('/class="([^"]+)"/', $moreatt, $reg)) {
                $morecss .= ($morecss ? ' ' : '') . $reg[1];
                $moreatt = str_replace('class="' . $reg[1] . '"', '', $moreatt);
            }
            if (preg_match('/style="([^"]+)"/', $moreatt, $reg)) {
                $morestyle = $reg[1];
                $moreatt = str_replace('style="' . $reg[1] . '"', '', $moreatt);
            }
            $moreatt = trim($moreatt);

            $enabledisablehtml = '<span class="' . $fa . ' ' . $fakey . ($marginleftonlyshort ? ($marginleftonlyshort == 1 ? ' marginleftonlyshort' : ' marginleftonly') : '');
            $enabledisablehtml .= ($morecss ? ' ' . $morecss : '') . '" style="' . ($fasize ? ('font-size: ' . $fasize . ';') : '') . ($facolor ? (' color: ' . $facolor . ';') : '') . ($morestyle ? ' ' . $morestyle : '') . '"' . (($notitle || empty($titlealt)) ? '' : ' title="' . dol_escape_htmltag($titlealt) . '"') . ($moreatt ? ' ' . $moreatt : '') . '>';
            /*if (!empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                $enabledisablehtml .= $titlealt;
            }*/
            $enabledisablehtml .= '</span>';

            return $enabledisablehtml;
        }

        if (getDolGlobalString('MAIN_OVERWRITE_THEME_PATH')) {
            $path = getDolGlobalString('MAIN_OVERWRITE_THEME_PATH') . '/theme/' . $theme; // If the theme does not have the same name as the module
        } elseif (getDolGlobalString('MAIN_OVERWRITE_THEME_RES')) {
            $path = getDolGlobalString('MAIN_OVERWRITE_THEME_RES') . '/theme/' . getDolGlobalString('MAIN_OVERWRITE_THEME_RES'); // To allow an external module to overwrite image resources whatever is activated theme
        } elseif (!empty($conf->modules_parts['theme']) && array_key_exists($theme, $conf->modules_parts['theme'])) {
            $path = $theme . '/theme/' . $theme; // If the theme have the same name as the module
        }

        // If we ask an image into $url/$mymodule/img (instead of default path)
        $regs = array();
        if (preg_match('/^([^@]+)@([^@]+)$/i', $picto, $regs)) {
            $picto = $regs[1];
            $path = $regs[2]; // $path is $mymodule
        }

        // Clean parameters
        if (!preg_match('/(\.png|\.gif|\.svg)$/i', $picto)) {
            $picto .= '.png';
        }
        // If alt path are defined, define url where img file is, according to physical path
        // ex: array(["main"]=>"/home/maindir/htdocs", ["alt0"]=>"/home/moddir0/htdocs", ...)
        foreach ($conf->file->dol_document_root as $type => $dirroot) {
            if ($type == 'main') {
                continue;
            }
            // This need a lot of time, that's why enabling alternative dir like "custom" dir is not recommended
            if (file_exists($dirroot . '/' . $path . '/img/' . $picto)) {
                $url = DOL_URL_ROOT . $conf->file->dol_url_root[$type];
                break;
            }
        }

        // $url is '' or '/custom', $path is current theme or
        $fullpathpicto = $url . '/' . $path . '/img/' . $picto;
    }

    if ($srconly) {
        return $fullpathpicto;
    }

    // tag title is used for tooltip on <a>, tag alt can be used with very simple text on image for blind people
    return '<img src="' . $fullpathpicto . '"' . ($notitle ? '' : ' alt="' . dol_escape_htmltag($alt) . '"') . (($notitle || empty($titlealt)) ? '' : ' title="' . dol_escape_htmltag($titlealt) . '"') . ($moreatt ? ' ' . $moreatt . ($morecss ? ' class="' . $morecss . '"' : '') : ' class="inline-block' . ($morecss ? ' ' . $morecss : '') . '"') . '>'; // Alt is used for accessibility, title for popup
}

/**
 *  Show a picto called object_picto (generic function)
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $picto Name of image to show object_picto (example: user, group, action, bill, contract, propal, product, ...)
 *                                      For external modules use imagename@mymodule to search into directory "img" of module.
 * @param string $moreatt Add more attribute on img tag (ie: class="datecallink")
 * @param int $pictoisfullpath If 1, image path is a full path
 * @param int $srconly Return only content of the src attribute of img.
 * @param int $notitle 1=Disable tag title. Use it if you add js tooltip, to avoid duplicate tooltip.
 * @return string                      Return img tag
 * @see    img_picto(), img_picto_common()
 */
function img_object($titlealt, $picto, $moreatt = '', $pictoisfullpath = 0, $srconly = 0, $notitle = 0)
{
    if (strpos($picto, '^') === 0) {
        return img_picto($titlealt, str_replace('^', '', $picto), $moreatt, $pictoisfullpath, $srconly, $notitle);
    } else {
        return img_picto($titlealt, 'object_' . $picto, $moreatt, $pictoisfullpath, $srconly, $notitle);
    }
}

/**
 *  Show weather picto
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string|int $picto Name of image file to show (If no extension provided, we use '.png'). Image must be stored into htdocs/theme/common directory. Or level of meteo image (0-4).
 * @param string $moreatt Add more attribute on img tag
 * @param int $pictoisfullpath If 1, image path is a full path
 * @param string $morecss More CSS
 * @return     string                          Return img tag
 * @see        img_object(), img_picto()
 */
function img_weather($titlealt, $picto, $moreatt = '', $pictoisfullpath = 0, $morecss = '')
{
    global $conf;

    if (is_numeric($picto)) {
        //$leveltopicto = array(0=>'weather-clear.png', 1=>'weather-few-clouds.png', 2=>'weather-clouds.png', 3=>'weather-many-clouds.png', 4=>'weather-storm.png');
        //$picto = $leveltopicto[$picto];
        return '<i class="fa fa-weather-level' . $picto . '"></i>';
    } elseif (!preg_match('/(\.png|\.gif)$/i', $picto)) {
        $picto .= '.png';
    }

    $path = constant('DOL_URL_ROOT') . '/theme/' . $conf->theme . '/img/weather/' . $picto;

    return img_picto($titlealt, $path, $moreatt, 1, 0, 0, '', $morecss);
}

/**
 *  Show picto (generic function)
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $picto Name of image file to show (If no extension provided, we use '.png'). Image must be stored into htdocs/theme/common directory.
 * @param string $moreatt Add more attribute on img tag
 * @param int $pictoisfullpath If 1, image path is a full path
 * @param int $notitle 1=Disable tag title. Use it if you add js tooltip, to avoid duplicate tooltip.
 * @return     string                          Return img tag
 * @see        img_object(), img_picto()
 */
function img_picto_common($titlealt, $picto, $moreatt = '', $pictoisfullpath = 0, $notitle = 0)
{
    global $conf;

    if (!preg_match('/(\.png|\.gif)$/i', $picto)) {
        $picto .= '.png';
    }

    if ($pictoisfullpath) {
        $path = $picto;
    } else {
        $path = constant('DOL_URL_ROOT') . '/theme/common/' . $picto;

        if (getDolGlobalInt('MAIN_MODULE_CAN_OVERWRITE_COMMONICONS')) {
            $themepath = DOL_DOCUMENT_ROOT . '/theme/' . $conf->theme . '/img/' . $picto;

            if (file_exists($themepath)) {
                $path = $themepath;
            }
        }
    }

    return img_picto($titlealt, $path, $moreatt, 1, 0, $notitle);
}

/**
 *  Show logo action
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $numaction Action id or code to show
 * @param string $picto Name of image file to show ('filenew', ...)
 *                                      If no extension provided, we use '.png'. Image must be stored into theme/xxx/img directory.
 *                                      Example: picto.png                  if picto.png is stored into htdocs/theme/mytheme/img
 *                                      Example: picto.png@mymodule         if picto.png is stored into htdocs/mymodule/img
 *                                      Example: /mydir/mysubdir/picto.png  if picto.png is stored into htdocs/mydir/mysubdir (pictoisfullpath must be set to 1)
 * @param string $moreatt More attributes
 * @return string                      Return an img tag
 */
function img_action($titlealt, $numaction, $picto = '', $moreatt = '')
{
    global $langs;

    if (empty($titlealt) || $titlealt == 'default') {
        if ($numaction == '-1' || $numaction == 'ST_NO') {
            $numaction = -1;
            $titlealt = $langs->transnoentitiesnoconv('ChangeDoNotContact');
        } elseif ($numaction == '0' || $numaction == 'ST_NEVER') {
            $numaction = 0;
            $titlealt = $langs->transnoentitiesnoconv('ChangeNeverContacted');
        } elseif ($numaction == '1' || $numaction == 'ST_TODO') {
            $numaction = 1;
            $titlealt = $langs->transnoentitiesnoconv('ChangeToContact');
        } elseif ($numaction == '2' || $numaction == 'ST_PEND') {
            $numaction = 2;
            $titlealt = $langs->transnoentitiesnoconv('ChangeContactInProcess');
        } elseif ($numaction == '3' || $numaction == 'ST_DONE') {
            $numaction = 3;
            $titlealt = $langs->transnoentitiesnoconv('ChangeContactDone');
        } else {
            $titlealt = $langs->transnoentitiesnoconv('ChangeStatus ' . $numaction);
            $numaction = 0;
        }
    }
    if (!is_numeric($numaction)) {
        $numaction = 0;
    }

    return img_picto($titlealt, (empty($picto) ? 'stcomm' . $numaction . '.png' : $picto), $moreatt);
}

/**
 *  Show pdf logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param int $size Taille de l'icone : 3 = 16x16px , 2 = 14x14px
 * @return string                  Retourne tag img
 */
function img_pdf($titlealt = 'default', $size = 3)
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Show');
    }

    return img_picto($titlealt, 'pdf' . $size . '.png');
}

/**
 *  Show logo +
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Return tag img
 */
function img_edit_add($titlealt = 'default', $other = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Add');
    }

    return img_picto($titlealt, 'edit_add.png', $other);
}

/**
 *  Show logo -
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Return tag img
 */
function img_edit_remove($titlealt = 'default', $other = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Remove');
    }

    return img_picto($titlealt, 'edit_remove.png', $other);
}

/**
 *  Show logo edit/modify fiche
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param integer $float If you have to put the style "float: right"
 * @param string $other Add more attributes on img
 * @return string              Return tag img
 */
function img_edit($titlealt = 'default', $float = 0, $other = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Modify');
    }

    return img_picto($titlealt, 'edit.png', ($float ? 'style="float: ' . ($langs->tab_translate["DIRECTION"] == 'rtl' ? 'left' : 'right') . '"' : "") . ($other ? ' ' . $other : ''));
}

/**
 *  Show logo view card
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param integer $float If you have to put the style "float: right"
 * @param string $other Add more attributes on img
 * @return string              Return tag img
 */
function img_view($titlealt = 'default', $float = 0, $other = 'class="valignmiddle"')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('View');
    }

    $moreatt = ($float ? 'style="float: right" ' : '') . $other;

    return img_picto($titlealt, 'eye', $moreatt);
}

/**
 *  Show delete logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @param string $morecss More CSS
 * @return string              Retourne tag img
 */
function img_delete($titlealt = 'default', $other = 'class="pictodelete"', $morecss = '')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Delete');
    }

    return img_picto($titlealt, 'delete.png', $other, 0, 0, 0, '', $morecss);
}

/**
 *  Show printer logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Retourne tag img
 */
function img_printer($titlealt = "default", $other = '')
{
    global $langs;
    if ($titlealt == "default") {
        $titlealt = $langs->trans("Print");
    }
    return img_picto($titlealt, 'printer.png', $other);
}

/**
 *  Show split logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @param string $other Add more attributes on img
 * @return string              Retourne tag img
 */
function img_split($titlealt = 'default', $other = 'class="pictosplit"')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Split');
    }

    return img_picto($titlealt, 'split.png', $other);
}

/**
 *  Show help logo with cursor "?"
 *
 * @param int $usehelpcursor 1=Use help cursor, 2=Use click pointer cursor, 0=No specific cursor
 * @param int|string $usealttitle Text to use as alt title
 * @return string                                  Return tag img
 */
function img_help($usehelpcursor = 1, $usealttitle = 1)
{
    global $langs;

    if ($usealttitle) {
        if (is_string($usealttitle)) {
            $usealttitle = dol_escape_htmltag($usealttitle);
        } else {
            $usealttitle = $langs->trans('Info');
        }
    }

    return img_picto($usealttitle, 'info.png', 'style="vertical-align: middle;' . ($usehelpcursor == 1 ? ' cursor: help' : ($usehelpcursor == 2 ? ' cursor: pointer' : '')) . '"');
}

/**
 *  Show info logo
 *
 * @param string $titlealt Text on alt and title of image. Alt only if param notitle is set to 1. If text is "TextA:TextB", use Text A on alt and Text B on title.
 * @return string              Return img tag
 */
function img_info($titlealt = 'default')
{
    global $langs;

    if ($titlealt == 'default') {
        $titlealt = $langs->trans('Informations');
    }

    return img_picto($titlealt, 'info.png', 'style="vertical-align: middle;"');
}

/**
 *  Return a string with VAT rate label formatted for view output
 *  Used into pdf and HTML pages
 *
 * @param string $rate Rate value to format ('19.6', '19,6', '19.6%', '19,6%', '19.6 (CODEX)', ...)
 * @param boolean $addpercent Add a percent % sign in output
 * @param int $info_bits Miscellaneous information on vat (0=Default, 1=French NPR vat)
 * @param int $usestarfornpr -1=Never show, 0 or 1=Use '*' for NPR vat rates
 * @param int $html Used for html output
 * @return string                  String with formatted amounts ('19,6' or '19,6%' or '8.5% (NPR)' or '8.5% *' or '19,6 (CODEX)')
 */
function vatrate($rate, $addpercent = false, $info_bits = 0, $usestarfornpr = 0, $html = 0)
{
    $morelabel = '';

    if (preg_match('/%/', $rate)) {
        $rate = str_replace('%', '', $rate);
        $addpercent = true;
    }
    $reg = array();
    if (preg_match('/\((.*)\)/', $rate, $reg)) {
        $morelabel = ' (' . $reg[1] . ')';
        $rate = preg_replace('/\s*' . preg_quote($morelabel, '/') . '/', '', $rate);
        $morelabel = ' ' . ($html ? '<span class="opacitymedium">' : '') . '(' . $reg[1] . ')' . ($html ? '</span>' : '');
    }
    if (preg_match('/\*/', $rate)) {
        $rate = str_replace('*', '', $rate);
        $info_bits |= 1;
    }

    // If rate is '9/9/9' we don't change it.  If rate is '9.000' we apply price()
    if (!preg_match('/\//', $rate)) {
        $ret = price($rate, 0, '', 0, 0) . ($addpercent ? '%' : '');
    } else {
        // TODO Split on / and output with a price2num to have clean numbers without ton of 000.
        $ret = $rate . ($addpercent ? '%' : '');
    }
    if (($info_bits & 1) && $usestarfornpr >= 0) {
        $ret .= ' *';
    }
    $ret .= $morelabel;
    return $ret;
}


/**
 *      Function to format a value into an amount for visual output
 *      Function used into PDF and HTML pages
 *
 * @param string|float $amount Amount value to format
 * @param int<0,1> $form Type of formatting: 1=HTML, 0=no formatting (no by default)
 * @param Translate|string|null $outlangs Object langs for output. '' use default lang. 'none' use international separators.
 * @param int $trunc 1=Truncate if there is more decimals than MAIN_MAX_DECIMALS_SHOWN (default), 0=Does not truncate. Deprecated because amount are rounded (to unit or total amount accuracy) before being inserted into database or after a computation, so this parameter should be useless.
 * @param int $rounding MINIMUM number of decimal to show: 0=no change, -1=we use min($conf->global->MAIN_MAX_DECIMALS_UNIT,$conf->global->MAIN_MAX_DECIMALS_TOT)
 * @param int|string $forcerounding MAXIMUM number of decimal to forcerounding decimal: -1=no change, 'MU' or 'MT' or a numeric to round to MU or MT or to a given number of decimal
 * @param string $currency_code To add currency symbol (''=add nothing, 'auto'=Use default currency, 'XXX'=add currency symbols for XXX currency)
 * @return string                                  String with formatted amount
 *
 * @see    price2num()                             Revert function of price
 */
function price($amount, $form = 0, $outlangs = '', $trunc = 1, $rounding = -1, $forcerounding = -1, $currency_code = '')
{
    global $langs, $conf;

    // Clean parameters
    if (empty($amount)) {
        $amount = 0; // To have a numeric value if amount not defined or = ''
    }
    $amount = (is_numeric($amount) ? $amount : 0); // Check if amount is numeric, for example, an error occurred when amount value = o (letter) instead 0 (number)
    if ($rounding == -1) {
        $rounding = min(getDolGlobalString('MAIN_MAX_DECIMALS_UNIT'), getDolGlobalString('MAIN_MAX_DECIMALS_TOT'));
    }
    $nbdecimal = $rounding;

    if ($outlangs === 'none') {
        // Use international separators
        $dec = '.';
        $thousand = '';
    } else {
        // Output separators by default (french)
        $dec = ',';
        $thousand = ' ';

        // If $outlangs not forced, we use use language
        if (!($outlangs instanceof Translate)) {
            $outlangs = $langs;
        }

        if ($outlangs->transnoentitiesnoconv("SeparatorDecimal") != "SeparatorDecimal") {
            $dec = $outlangs->transnoentitiesnoconv("SeparatorDecimal");
        }
        if ($outlangs->transnoentitiesnoconv("SeparatorThousand") != "SeparatorThousand") {
            $thousand = $outlangs->transnoentitiesnoconv("SeparatorThousand");
        }
        if ($thousand == 'None') {
            $thousand = '';
        } elseif ($thousand == 'Space') {
            $thousand = ' ';
        }
    }
    //print "outlangs=".$outlangs->defaultlang." amount=".$amount." html=".$form." trunc=".$trunc." nbdecimal=".$nbdecimal." dec='".$dec."' thousand='".$thousand."'<br>";

    //print "amount=".$amount."-";
    $amount = str_replace(',', '.', $amount); // should be useless
    //print $amount."-";
    $data = explode('.', $amount);
    $decpart = isset($data[1]) ? $data[1] : '';
    $decpart = preg_replace('/0+$/i', '', $decpart); // Supprime les 0 de fin de partie decimale
    //print "decpart=".$decpart."<br>";
    $end = '';

    // We increase nbdecimal if there is more decimal than asked (to not loose information)
    if (dol_strlen($decpart) > $nbdecimal) {
        $nbdecimal = dol_strlen($decpart);
    }
    // Si on depasse max
    $max_nbdecimal = getDolGlobalString('MAIN_MAX_DECIMALS_SHOWN');
    if ($trunc && $nbdecimal > (int)$max_nbdecimal) {
        $nbdecimal = $max_nbdecimal;
        if (preg_match('/\.\.\./i', $nbdecimal)) {
            // Si un affichage est tronque, on montre des ...
            $end = '...';
        }
    }

    // If force rounding
    if ((string)$forcerounding != '-1') {
        if ($forcerounding === 'MU') {
            $nbdecimal = getDolGlobalString('MAIN_MAX_DECIMALS_UNIT');
        } elseif ($forcerounding === 'MT') {
            $nbdecimal = getDolGlobalString('MAIN_MAX_DECIMALS_TOT');
        } elseif ($forcerounding >= 0) {
            $nbdecimal = $forcerounding;
        }
    }

    // Format number
    $output = number_format((float)$amount, $nbdecimal, $dec, $thousand);
    if ($form) {
        $output = preg_replace('/\s/', '&nbsp;', $output);
        $output = preg_replace('/\'/', '&#039;', $output);
    }
    // Add symbol of currency if requested
    $cursymbolbefore = $cursymbolafter = '';
    if ($currency_code && is_object($outlangs)) {
        if ($currency_code == 'auto') {
            $currency_code = $conf->currency;
        }

        $listofcurrenciesbefore = array('AUD', 'CAD', 'CNY', 'COP', 'CLP', 'GBP', 'HKD', 'MXN', 'PEN', 'USD', 'CRC', 'ZAR');
        $listoflanguagesbefore = array('nl_NL');
        if (in_array($currency_code, $listofcurrenciesbefore) || in_array($outlangs->defaultlang, $listoflanguagesbefore)) {
            $cursymbolbefore .= $outlangs->getCurrencySymbol($currency_code);
        } else {
            $tmpcur = $outlangs->getCurrencySymbol($currency_code);
            $cursymbolafter .= ($tmpcur == $currency_code ? ' ' . $tmpcur : $tmpcur);
        }
    }
    $output = $cursymbolbefore . $output . $end . ($cursymbolafter ? ' ' : '') . $cursymbolafter;

    return $output;
}

/**
 *  Function that return a number with universal decimal format (decimal separator is '.') from an amount typed by a user.
 *  Function to use on each input amount before any numeric test or database insert. A better name for this function
 *  should be roundtext2num().
 *
 * @param string|float $amount Amount to convert/clean or round
 * @param string|int $rounding ''=No rounding
 *                                          'MU'=Round to Max unit price (MAIN_MAX_DECIMALS_UNIT)
 *                                          'MT'=Round to Max for totals with Tax (MAIN_MAX_DECIMALS_TOT)
 *                                          'MS'=Round to Max for stock quantity (MAIN_MAX_DECIMALS_STOCK)
 *                                          'CU'=Round to Max unit price of foreign currency accuracy
 *                                          'CT'=Round to Max for totals with Tax of foreign currency accuracy
 *                                          Numeric = Nb of digits for rounding (For example 2 for a percentage)
 * @param int $option Put 1 if you know that content is already universal format number (so no correction on decimal will be done)
 *                                          Put 2 if you know that number is a user input (so we know we have to fix decimal separator).
 * @return string                          Amount with universal numeric format (Example: '99.99999'), or error message.
 *                                          If conversion fails to return a numeric, it returns:
 *                                          - text unchanged or partial if ($rounding = ''): price2num('W9ç', '', 0)   => '9ç', price2num('W9ç', '', 1)   => 'W9ç', price2num('W9ç', '', 2)   => '9ç'
 *                                          - '0' if ($rounding is defined):                 price2num('W9ç', 'MT', 0) => '9',  price2num('W9ç', 'MT', 1) => '0',   price2num('W9ç', 'MT', 2) => '9'
 *                                          Note: The best way to guarantee a numeric value is to add a cast (float) before the price2num().
 *                                          If amount is null or '', it returns '' if $rounding = '', it returns '0' if $rounding is defined.
 *
 * @see    price()                         Opposite function of price2num
 */
function price2num($amount, $rounding = '', $option = 0)
{
    global $langs, $conf;

    // Clean parameters
    if (is_null($amount)) {
        $amount = '';
    }

    // Round PHP function does not allow number like '1,234.56' nor '1.234,56' nor '1 234,56'
    // Numbers must be '1234.56'
    // Decimal delimiter for PHP and database SQL requests must be '.'
    $dec = ',';
    $thousand = ' ';
    if (is_null($langs)) {  // $langs is not defined, we use english values.
        $dec = '.';
        $thousand = ',';
    } else {
        if ($langs->transnoentitiesnoconv("SeparatorDecimal") != "SeparatorDecimal") {
            $dec = $langs->transnoentitiesnoconv("SeparatorDecimal");
        }
        if ($langs->transnoentitiesnoconv("SeparatorThousand") != "SeparatorThousand") {
            $thousand = $langs->transnoentitiesnoconv("SeparatorThousand");
        }
    }
    if ($thousand == 'None') {
        $thousand = '';
    } elseif ($thousand == 'Space') {
        $thousand = ' ';
    }
    //print "amount=".$amount." html=".$form." trunc=".$trunc." nbdecimal=".$nbdecimal." dec='".$dec."' thousand='".$thousand."'<br>";

    // Convert value to universal number format (no thousand separator, '.' as decimal separator)
    if ($option != 1) { // If not a PHP number or unknown, we change or clean format
        //print "\n".'PP'.$amount.' - '.$dec.' - '.$thousand.' - '.intval($amount).'<br>';
        if (!is_numeric($amount)) {
            $amount = preg_replace('/[a-zA-Z\/\\\*\(\)\<\>\_]/', '', $amount);
        }

        if ($option == 2 && $thousand == '.' && preg_match('/\.(\d\d\d)$/', (string)$amount)) {    // It means the . is used as a thousand separator and string come from input data, so 1.123 is 1123
            $amount = str_replace($thousand, '', $amount);
        }

        // Convert amount to format with dolibarr dec and thousand (this is because PHP convert a number
        // to format defined by LC_NUMERIC after a calculation and we want source format to be like defined by Dolibarr setup.
        // So if number was already a good number, it is converted into local Dolibarr setup.
        if (is_numeric($amount)) {
            // We put in temps value of decimal ("0.00001"). Works with 0 and 2.0E-5 and 9999.10
            $temps = sprintf("%10.10F", $amount - intval($amount)); // temps=0.0000000000 or 0.0000200000 or 9999.1000000000
            $temps = preg_replace('/([\.1-9])0+$/', '\\1', $temps); // temps=0. or 0.00002 or 9999.1
            $nbofdec = max(0, dol_strlen($temps) - 2); // -2 to remove "0."
            $amount = number_format($amount, $nbofdec, $dec, $thousand);
        }
        //print "QQ".$amount."<br>\n";

        // Now make replace (the main goal of function)
        if ($thousand != ',' && $thousand != '.') {
            $amount = str_replace(',', '.', $amount); // To accept 2 notations for french users
        }

        $amount = str_replace(' ', '', $amount); // To avoid spaces
        $amount = str_replace($thousand, '', $amount); // Replace of thousand before replace of dec to avoid pb if thousand is .
        $amount = str_replace($dec, '.', $amount);

        $amount = preg_replace('/[^0-9\-\.]/', '', $amount);    // Clean non numeric chars (so it clean some UTF8 spaces for example.
    }
    //print ' XX'.$amount.' '.$rounding;

    // Now, $amount is a real PHP float number. We make a rounding if required.
    if ($rounding) {
        $nbofdectoround = '';
        if ($rounding == 'MU') {
            $nbofdectoround = getDolGlobalString('MAIN_MAX_DECIMALS_UNIT');
        } elseif ($rounding == 'MT') {
            $nbofdectoround = getDolGlobalString('MAIN_MAX_DECIMALS_TOT');
        } elseif ($rounding == 'MS') {
            $nbofdectoround = isset($conf->global->MAIN_MAX_DECIMALS_STOCK) ? $conf->global->MAIN_MAX_DECIMALS_STOCK : 5;
        } elseif ($rounding == 'CU') {
            $nbofdectoround = max(getDolGlobalString('MAIN_MAX_DECIMALS_UNIT'), 8); // TODO Use param of currency
        } elseif ($rounding == 'CT') {
            $nbofdectoround = max(getDolGlobalString('MAIN_MAX_DECIMALS_TOT'), 8);      // TODO Use param of currency
        } elseif (is_numeric($rounding)) {
            $nbofdectoround = (int)$rounding;
        }

        //print " RR".$amount.' - '.$nbofdectoround.'<br>';
        if (dol_strlen($nbofdectoround)) {
            $amount = round(is_string($amount) ? (float)$amount : $amount, $nbofdectoround); // $nbofdectoround can be 0.
        } else {
            return 'ErrorBadParameterProvidedToFunction';
        }
        //print ' SS'.$amount.' - '.$nbofdec.' - '.$dec.' - '.$thousand.' - '.$nbofdectoround.'<br>';

        // Convert amount to format with dolibarr dec and thousand (this is because PHP convert a number
        // to format defined by LC_NUMERIC after a calculation and we want source format to be defined by Dolibarr setup.
        if (is_numeric($amount)) {
            // We put in temps value of decimal ("0.00001"). Works with 0 and 2.0E-5 and 9999.10
            $temps = sprintf("%10.10F", $amount - intval($amount)); // temps=0.0000000000 or 0.0000200000 or 9999.1000000000
            $temps = preg_replace('/([\.1-9])0+$/', '\\1', $temps); // temps=0. or 0.00002 or 9999.1
            $nbofdec = max(0, dol_strlen($temps) - 2); // -2 to remove "0."
            $amount = number_format($amount, min($nbofdec, $nbofdectoround), $dec, $thousand); // Convert amount to format with dolibarr dec and thousand
        }
        //print "TT".$amount.'<br>';

        // Always make replace because each math function (like round) replace
        // with local values and we want a number that has a SQL string format x.y
        if ($thousand != ',' && $thousand != '.') {
            $amount = str_replace(',', '.', $amount); // To accept 2 notations for french users
        }

        $amount = str_replace(' ', '', $amount); // To avoid spaces
        $amount = str_replace($thousand, '', $amount); // Replace of thousand before replace of dec to avoid pb if thousand is .
        $amount = str_replace($dec, '.', $amount);

        $amount = preg_replace('/[^0-9\-\.]/', '', $amount);    // Clean non numeric chars (so it clean some UTF8 spaces for example.
    }

    return $amount;
}

/**
 * Output a dimension with best unit
 *
 * @param float $dimension Dimension
 * @param int $unit Unit scale of dimension (Example: 0=kg, -3=g, -6=mg, 98=ounce, 99=pound, ...)
 * @param string $type 'weight', 'volume', ...
 * @param Translate $outputlangs Translate language object
 * @param int $round -1 = non rounding, x = number of decimal
 * @param string $forceunitoutput 'no' or numeric (-3, -6, ...) compared to $unit (In most case, this value is value defined into $conf->global->MAIN_WEIGHT_DEFAULT_UNIT)
 * @param int $use_short_label 1=Use short label ('g' instead of 'gram'). Short labels are not translated.
 * @return  string                          String to show dimensions
 */
function showDimensionInBestUnit($dimension, $unit, $type, $outputlangs, $round = -1, $forceunitoutput = 'no', $use_short_label = 0)
{
    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/product.lib.php';

    if (($forceunitoutput == 'no' && $dimension < 1 / 10000 && $unit < 90) || (is_numeric($forceunitoutput) && $forceunitoutput == -6)) {
        $dimension *= 1000000;
        $unit -= 6;
    } elseif (($forceunitoutput == 'no' && $dimension < 1 / 10 && $unit < 90) || (is_numeric($forceunitoutput) && $forceunitoutput == -3)) {
        $dimension *= 1000;
        $unit -= 3;
    } elseif (($forceunitoutput == 'no' && $dimension > 100000000 && $unit < 90) || (is_numeric($forceunitoutput) && $forceunitoutput == 6)) {
        $dimension /= 1000000;
        $unit += 6;
    } elseif (($forceunitoutput == 'no' && $dimension > 100000 && $unit < 90) || (is_numeric($forceunitoutput) && $forceunitoutput == 3)) {
        $dimension /= 1000;
        $unit += 3;
    }
    // Special case when we want output unit into pound or ounce
    /* TODO
    if ($unit < 90 && $type == 'weight' && is_numeric($forceunitoutput) && (($forceunitoutput == 98) || ($forceunitoutput == 99))
    {
        $dimension = // convert dimension from standard unit into ounce or pound
        $unit = $forceunitoutput;
    }
    if ($unit > 90 && $type == 'weight' && is_numeric($forceunitoutput) && $forceunitoutput < 90)
    {
        $dimension = // convert dimension from standard unit into ounce or pound
        $unit = $forceunitoutput;
    }*/

    $ret = price($dimension, 0, $outputlangs, 0, 0, $round);
    // @phan-suppress-next-line PhanPluginSuspiciousParamPosition
    $ret .= ' ' . measuringUnitString(0, $type, $unit, $use_short_label, $outputlangs);

    return $ret;
}


/**
 *  Return localtax rate for a particular vat, when selling a product with vat $vatrate, from a $thirdparty_buyer to a $thirdparty_seller
 *  Note: This function applies same rules than get_default_tva
 *
 * @param float|string $vatrate Vat rate. Can be '8.5' or '8.5 (VATCODEX)' for example
 * @param int $local Local tax to search and return (1 or 2 return only tax rate 1 or tax rate 2)
 * @param Societe $thirdparty_buyer Object of buying third party
 * @param Societe $thirdparty_seller Object of selling third party ($mysoc if not defined)
 * @param int $vatnpr If vat rate is NPR or not
 * @return int<0,0>|string                     0 if not found, localtax rate if found
 * @see get_default_tva()
 */
function get_localtax($vatrate, $local, $thirdparty_buyer = null, $thirdparty_seller = null, $vatnpr = 0)
{
    global $db, $conf, $mysoc;

    if (empty($thirdparty_seller) || !is_object($thirdparty_seller)) {
        $thirdparty_seller = $mysoc;
    }

    dol_syslog("get_localtax tva=" . $vatrate . " local=" . $local . " thirdparty_buyer id=" . (is_object($thirdparty_buyer) ? $thirdparty_buyer->id : '') . "/country_code=" . (is_object($thirdparty_buyer) ? $thirdparty_buyer->country_code : '') . " thirdparty_seller id=" . $thirdparty_seller->id . "/country_code=" . $thirdparty_seller->country_code . " thirdparty_seller localtax1_assuj=" . $thirdparty_seller->localtax1_assuj . "  thirdparty_seller localtax2_assuj=" . $thirdparty_seller->localtax2_assuj);

    $vatratecleaned = $vatrate;
    $reg = array();
    if (preg_match('/^(.*)\s*\((.*)\)$/', (string)$vatrate, $reg)) {     // If vat is "xx (yy)"
        $vatratecleaned = trim($reg[1]);
        $vatratecode = $reg[2];
    }

    /*if ($thirdparty_buyer->country_code != $thirdparty_seller->country_code)
    {
        return 0;
    }*/

    // Some test to guess with no need to make database access
    if ($mysoc->country_code == 'ES') { // For spain localtaxes 1 and 2, tax is qualified if buyer use local tax
        if ($local == 1) {
            if (!$mysoc->localtax1_assuj || (string)$vatratecleaned == "0") {
                return 0;
            }
            if ($thirdparty_seller->id == $mysoc->id) {
                if (!$thirdparty_buyer->localtax1_assuj) {
                    return 0;
                }
            } else {
                if (!$thirdparty_seller->localtax1_assuj) {
                    return 0;
                }
            }
        }

        if ($local == 2) {
            //if (! $mysoc->localtax2_assuj || (string) $vatratecleaned == "0") return 0;
            if (!$mysoc->localtax2_assuj) {
                return 0; // If main vat is 0, IRPF may be different than 0.
            }
            if ($thirdparty_seller->id == $mysoc->id) {
                if (!$thirdparty_buyer->localtax2_assuj) {
                    return 0;
                }
            } else {
                if (!$thirdparty_seller->localtax2_assuj) {
                    return 0;
                }
            }
        }
    } else {
        if ($local == 1 && !$thirdparty_seller->localtax1_assuj) {
            return 0;
        }
        if ($local == 2 && !$thirdparty_seller->localtax2_assuj) {
            return 0;
        }
    }

    // For some country MAIN_GET_LOCALTAXES_VALUES_FROM_THIRDPARTY is forced to on.
    if (in_array($mysoc->country_code, array('ES'))) {
        $conf->global->MAIN_GET_LOCALTAXES_VALUES_FROM_THIRDPARTY = 1;
    }

    // Search local taxes
    if (getDolGlobalString('MAIN_GET_LOCALTAXES_VALUES_FROM_THIRDPARTY')) {
        if ($local == 1) {
            if ($thirdparty_seller != $mysoc) {
                if (!isOnlyOneLocalTax($local)) {  // TODO We should provide $vatrate to search on correct line and not always on line with highest vat rate
                    return $thirdparty_seller->localtax1_value;
                }
            } else { // i am the seller
                if (!isOnlyOneLocalTax($local)) { // TODO If seller is me, why not always returning this, even if there is only one locatax vat.
                    return $conf->global->MAIN_INFO_VALUE_LOCALTAX1;
                }
            }
        }
        if ($local == 2) {
            if ($thirdparty_seller != $mysoc) {
                if (!isOnlyOneLocalTax($local)) {  // TODO We should provide $vatrate to search on correct line and not always on line with highest vat rate
                    // TODO We should also return value defined on thirdparty only if defined
                    return $thirdparty_seller->localtax2_value;
                }
            } else { // i am the seller
                if (in_array($mysoc->country_code, array('ES'))) {
                    return $thirdparty_buyer->localtax2_value;
                } else {
                    return $conf->global->MAIN_INFO_VALUE_LOCALTAX2;
                }
            }
        }
    }

    // By default, search value of local tax on line of common tax
    $sql = "SELECT t.localtax1, t.localtax2, t.localtax1_type, t.localtax2_type";
    $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t, " . MAIN_DB_PREFIX . "c_country as c";
    $sql .= " WHERE t.fk_pays = c.rowid AND c.code = '" . $db->escape($thirdparty_seller->country_code) . "'";
    $sql .= " AND t.taux = " . ((float)$vatratecleaned) . " AND t.active = 1";
    $sql .= " AND t.entity IN (" . getEntity('c_tva') . ")";
    if (!empty($vatratecode)) {
        $sql .= " AND t.code ='" . $db->escape($vatratecode) . "'"; // If we have the code, we use it in priority
    } else {
        $sql .= " AND t.recuperableonly = '" . $db->escape($vatnpr) . "'";
    }

    $resql = $db->query($sql);

    if ($resql) {
        $obj = $db->fetch_object($resql);
        if ($obj) {
            if ($local == 1) {
                return $obj->localtax1;
            } elseif ($local == 2) {
                return $obj->localtax2;
            }
        }
    }

    return 0;
}


/**
 * Return true if LocalTax (1 or 2) is unique.
 * Example: If localtax1 is 5 on line with highest common vat rate, return true
 * Example: If localtax1 is 5:8:15 on line with highest common vat rate, return false
 *
 * @param int $local Local tax to test (1 or 2)
 * @return  boolean         True if LocalTax have multiple values, False if not
 */
function isOnlyOneLocalTax($local)
{
    $tax = get_localtax_by_third($local);

    $valors = explode(":", $tax);

    if (count($valors) > 1) {
        return false;
    } else {
        return true;
    }
}

/**
 * Get values of localtaxes (1 or 2) for company country for the common vat with the highest value
 *
 * @param int $local LocalTax to get
 * @return  string                      Values of localtax (Can be '20', '-19:-15:-9') or 'Error'
 */
function get_localtax_by_third($local)
{
    global $db, $mysoc;

    $sql = " SELECT t.localtax" . $local . " as localtax";
    $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t INNER JOIN " . MAIN_DB_PREFIX . "c_country as c ON c.rowid = t.fk_pays";
    $sql .= " WHERE c.code = '" . $db->escape($mysoc->country_code) . "' AND t.active = 1 AND t.entity IN (" . getEntity('c_tva') . ") AND t.taux = (";
    $sql .= "SELECT MAX(tt.taux) FROM " . MAIN_DB_PREFIX . "c_tva as tt INNER JOIN " . MAIN_DB_PREFIX . "c_country as c ON c.rowid = tt.fk_pays";
    $sql .= " WHERE c.code = '" . $db->escape($mysoc->country_code) . "' AND t.entity IN (" . getEntity('c_tva') . ") AND tt.active = 1)";
    $sql .= " AND t.localtax" . $local . "_type <> '0'";
    $sql .= " ORDER BY t.rowid DESC";

    $resql = $db->query($sql);
    if ($resql) {
        $obj = $db->fetch_object($resql);
        if ($obj) {
            return $obj->localtax;
        } else {
            return '0';
        }
    }

    return 'Error';
}


/**
 *  Get tax (VAT) main information from Id.
 *  You can also call getLocalTaxesFromRate() after to get only localtax fields.
 *
 * @param int|string $vatrate VAT ID or Rate. Value can be value or the string with code into parenthesis or rowid if $firstparamisid is 1. Example: '8.5' or '8.5 (8.5NPR)' or 123.
 * @param Societe $buyer Company object
 * @param Societe $seller Company object
 * @param int<0,1> $firstparamisid 1 if first param is id into table (use this if you can)
 * @return array{}|array{rowid:int,code:string,rate:float,localtax1:float,localtax1_type:string,localtax2:float,localtax2_type:string,npr:float,accountancy_code_sell:string,accountancy_code_buy:string} array('rowid'=> , 'code'=> ...)
 * @see getLocalTaxesFromRate()
 */
function getTaxesFromId($vatrate, $buyer = null, $seller = null, $firstparamisid = 1)
{
    global $db;

    dol_syslog("getTaxesFromId vat id or rate = " . $vatrate);

    // Search local taxes
    $sql = "SELECT t.rowid, t.code, t.taux as rate, t.recuperableonly as npr, t.accountancy_code_sell, t.accountancy_code_buy,";
    $sql .= " t.localtax1, t.localtax1_type, t.localtax2, t.localtax2_type";
    $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t";
    if ($firstparamisid) {
        $sql .= " WHERE t.rowid = " . (int)$vatrate;
    } else {
        $vatratecleaned = $vatrate;
        $vatratecode = '';
        $reg = array();
        if (preg_match('/^(.*)\s*\((.*)\)$/', $vatrate, $reg)) {      // If vat is "xx (yy)"
            $vatratecleaned = $reg[1];
            $vatratecode = $reg[2];
        }

        $sql .= ", " . MAIN_DB_PREFIX . "c_country as c";
        /*if ($mysoc->country_code == 'ES') $sql.= " WHERE t.fk_pays = c.rowid AND c.code = '".$db->escape($buyer->country_code)."'";    // vat in spain use the buyer country ??
        else $sql.= " WHERE t.fk_pays = c.rowid AND c.code = '".$db->escape($seller->country_code)."'";*/
        $sql .= " WHERE t.fk_pays = c.rowid AND c.code = '" . $db->escape($seller->country_code) . "'";
        $sql .= " AND t.taux = " . ((float)$vatratecleaned) . " AND t.active = 1";
        $sql .= " AND t.entity IN (" . getEntity('c_tva') . ")";
        if ($vatratecode) {
            $sql .= " AND t.code = '" . $db->escape($vatratecode) . "'";
        }
    }

    $resql = $db->query($sql);
    if ($resql) {
        $obj = $db->fetch_object($resql);
        if ($obj) {
            return array(
                'rowid' => $obj->rowid,
                'code' => $obj->code,
                'rate' => $obj->rate,
                'localtax1' => $obj->localtax1,
                'localtax1_type' => $obj->localtax1_type,
                'localtax2' => $obj->localtax2,
                'localtax2_type' => $obj->localtax2_type,
                'npr' => $obj->npr,
                'accountancy_code_sell' => $obj->accountancy_code_sell,
                'accountancy_code_buy' => $obj->accountancy_code_buy
            );
        } else {
            return array();
        }
    } else {
        dol_print_error($db);
    }

    return array();
}

/**
 *  Get type and rate of localtaxes for a particular vat rate/country of a thirdparty.
 *  This does not take into account the seller setup if subject to vat or not, only country.
 *
 *  TODO This function is ALSO called to retrieve type for building PDF. Such call of function must be removed.
 *  Instead this function must be called when adding a line to get the array of possible values for localtax and type, and then
 *  provide the selected value to the function calcul_price_total.
 *
 * @param int|string $vatrate VAT ID or Rate+Code. Value can be value or the string with code into parenthesis or rowid if $firstparamisid is 1. Example: '8.5' or '8.5 (8.5NPR)' or 123.
 * @param int $local Number of localtax (1 or 2, or 0 to return 1 & 2)
 * @param Societe $buyer Company object
 * @param Societe $seller Company object
 * @param int $firstparamisid 1 if first param is ID into table instead of Rate+code (use this if you can)
 * @return array{}|array{0:string,1:float,2:string,3:string}|array{0:string,1:float,2:string,3:float,4:string,5:string}    array(localtax_type1(1-6 or 0 if not found), rate localtax1, localtax_type2, rate localtax2, accountancycodecust, accountancycodesupp)
 * @see getTaxesFromId()
 */
function getLocalTaxesFromRate($vatrate, $local, $buyer, $seller, $firstparamisid = 0)
{
    global $db, $mysoc;

    dol_syslog("getLocalTaxesFromRate vatrate=" . $vatrate . " local=" . $local);

    // Search local taxes
    $sql = "SELECT t.taux as rate, t.code, t.localtax1, t.localtax1_type, t.localtax2, t.localtax2_type, t.accountancy_code_sell, t.accountancy_code_buy";
    $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t";
    if ($firstparamisid) {
        $sql .= " WHERE t.rowid = " . (int)$vatrate;
    } else {
        $vatratecleaned = $vatrate;
        $vatratecode = '';
        $reg = array();
        if (preg_match('/^(.*)\s*\((.*)\)$/', $vatrate, $reg)) {     // If vat is "x.x (yy)"
            $vatratecleaned = $reg[1];
            $vatratecode = $reg[2];
        }

        $sql .= ", " . MAIN_DB_PREFIX . "c_country as c";
        if (!empty($mysoc) && $mysoc->country_code == 'ES') {
            $countrycodetouse = ((empty($buyer) || empty($buyer->country_code)) ? $mysoc->country_code : $buyer->country_code);
            $sql .= " WHERE t.fk_pays = c.rowid AND c.code = '" . $db->escape($countrycodetouse) . "'"; // local tax in spain use the buyer country ??
        } else {
            $countrycodetouse = ((empty($seller) || empty($seller->country_code)) ? $mysoc->country_code : $seller->country_code);
            $sql .= " WHERE t.fk_pays = c.rowid AND c.code = '" . $db->escape($countrycodetouse) . "'";
        }
        $sql .= " AND t.taux = " . ((float)$vatratecleaned) . " AND t.active = 1";
        if ($vatratecode) {
            $sql .= " AND t.code = '" . $db->escape($vatratecode) . "'";
        }
    }

    $resql = $db->query($sql);
    if ($resql) {
        $obj = $db->fetch_object($resql);

        if ($obj) {
            $vateratestring = $obj->rate . ($obj->code ? ' (' . $obj->code . ')' : '');

            if ($local == 1) {
                return array($obj->localtax1_type, get_localtax($vateratestring, $local, $buyer, $seller), $obj->accountancy_code_sell, $obj->accountancy_code_buy);
            } elseif ($local == 2) {
                return array($obj->localtax2_type, get_localtax($vateratestring, $local, $buyer, $seller), $obj->accountancy_code_sell, $obj->accountancy_code_buy);
            } else {
                return array($obj->localtax1_type, get_localtax($vateratestring, 1, $buyer, $seller), $obj->localtax2_type, get_localtax($vateratestring, 2, $buyer, $seller), $obj->accountancy_code_sell, $obj->accountancy_code_buy);
            }
        }
    }

    return array();
}

/**
 *  Return vat rate of a product in a particular country, or default country vat if product is unknown.
 *  Function called by get_default_tva(). Do not use this function directly, prefer to use get_default_tva().
 *
 * @param int $idprod Id of product or 0 if not a predefined product
 * @param Societe $thirdpartytouse Thirdparty with a ->country_code defined (FR, US, IT, ...)
 * @param int $idprodfournprice Id product_fournisseur_price (for "supplier" proposal/order/invoice)
 * @return float|string                        Vat rate to use with format 5.0 or '5.0 (XXX)'
 * @see get_default_tva(), get_product_localtax_for_country()
 */
function get_product_vat_for_country($idprod, $thirdpartytouse, $idprodfournprice = 0)
{
    global $db, $mysoc;


    $ret = 0;
    $found = 0;

    if ($idprod > 0) {
        // Load product
        $product = new Product($db);
        $product->fetch($idprod);

        if (
            ($mysoc->country_code == $thirdpartytouse->country_code)
            || (in_array($mysoc->country_code, array('FR', 'MC')) && in_array($thirdpartytouse->country_code, array('FR', 'MC')))
            || (in_array($mysoc->country_code, array('MQ', 'GP')) && in_array($thirdpartytouse->country_code, array('MQ', 'GP')))
        ) {
            // If country of thirdparty to consider is ours
            if ($idprodfournprice > 0) {     // We want vat for product for a "supplier" object
                $result = $product->get_buyprice($idprodfournprice, 0, 0, 0);
                if ($result > 0) {
                    $ret = $product->vatrate_supplier;
                    if ($product->default_vat_code_supplier) {
                        $ret .= ' (' . $product->default_vat_code_supplier . ')';
                    }
                    $found = 1;
                }
            }
            if (!$found) {
                $ret = $product->tva_tx;    // Default sales vat of product
                if ($product->default_vat_code) {
                    $ret .= ' (' . $product->default_vat_code . ')';
                }
                $found = 1;
            }
        } else {
            // TODO Read default product vat according to product and an other countrycode.
            // Vat for couple anothercountrycode/product is data that is not managed and store yet, so we will fallback on next rule.
        }
    }

    if (!$found) {
        if (!getDolGlobalString('MAIN_VAT_DEFAULT_IF_AUTODETECT_FAILS')) {
            // If vat of product for the country not found or not defined, we return the first rate found (sorting on use_default, then on higher vat of country).
            $sql = "SELECT t.taux as vat_rate, t.code as default_vat_code";
            $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t, " . MAIN_DB_PREFIX . "c_country as c";
            $sql .= " WHERE t.active = 1 AND t.fk_pays = c.rowid AND c.code = '" . $db->escape($thirdpartytouse->country_code) . "'";
            $sql .= " AND t.entity IN (" . getEntity('c_tva') . ")";
            $sql .= " ORDER BY t.use_default DESC, t.taux DESC, t.code ASC, t.recuperableonly ASC";
            $sql .= $db->plimit(1);

            $resql = $db->query($sql);
            if ($resql) {
                $obj = $db->fetch_object($resql);
                if ($obj) {
                    $ret = $obj->vat_rate;
                    if ($obj->default_vat_code) {
                        $ret .= ' (' . $obj->default_vat_code . ')';
                    }
                }
                $db->free($resql);
            } else {
                dol_print_error($db);
            }
        } else {
            // Forced value if autodetect fails. MAIN_VAT_DEFAULT_IF_AUTODETECT_FAILS can be
            // '1.23'
            // or '1.23 (CODE)'
            $defaulttx = '';
            if (getDolGlobalString('MAIN_VAT_DEFAULT_IF_AUTODETECT_FAILS') != 'none') {
                $defaulttx = getDolGlobalString('MAIN_VAT_DEFAULT_IF_AUTODETECT_FAILS');
            }
            /*if (preg_match('/\((.*)\)/', $defaulttx, $reg)) {
                $defaultcode = $reg[1];
                $defaulttx = preg_replace('/\s*\(.*\)/', '', $defaulttx);
            }*/

            $ret = $defaulttx;
        }
    }

    dol_syslog("get_product_vat_for_country: ret=" . $ret);
    return $ret;
}

/**
 *  Return localtax vat rate of a product in a particular country or default country vat if product is unknown
 *
 * @param int $idprod Id of product
 * @param int $local 1 for localtax1, 2 for localtax 2
 * @param Societe $thirdpartytouse Thirdparty with a ->country_code defined (FR, US, IT, ...)
 * @return int                             Return integer <0 if KO, Vat rate if OK
 * @see get_product_vat_for_country()
 */
function get_product_localtax_for_country($idprod, $local, $thirdpartytouse)
{
    global $db, $mysoc;

    if (!class_exists('Product')) {
    }

    $ret = 0;
    $found = 0;

    if ($idprod > 0) {
        // Load product
        $product = new Product($db);
        $result = $product->fetch($idprod);

        if ($mysoc->country_code == $thirdpartytouse->country_code) { // If selling country is ours
            /* Not defined yet, so we don't use this
            if ($local==1) $ret=$product->localtax1_tx;
            elseif ($local==2) $ret=$product->localtax2_tx;
            $found=1;
            */
        } else {
            // TODO Read default product vat according to product and another countrycode.
            // Vat for couple anothercountrycode/product is data that is not managed and store yet, so we will fallback on next rule.
        }
    }

    if (!$found) {
        // If vat of product for the country not found or not defined, we return higher vat of country.
        $sql = "SELECT taux as vat_rate, localtax1, localtax2";
        $sql .= " FROM " . MAIN_DB_PREFIX . "c_tva as t, " . MAIN_DB_PREFIX . "c_country as c";
        $sql .= " WHERE t.active=1 AND t.fk_pays = c.rowid AND c.code='" . $db->escape($thirdpartytouse->country_code) . "'";
        $sql .= " AND t.entity IN (" . getEntity('c_tva') . ")";
        $sql .= " ORDER BY t.taux DESC, t.recuperableonly ASC";
        $sql .= $db->plimit(1);

        $resql = $db->query($sql);
        if ($resql) {
            $obj = $db->fetch_object($resql);
            if ($obj) {
                if ($local == 1) {
                    $ret = $obj->localtax1;
                } elseif ($local == 2) {
                    $ret = $obj->localtax2;
                }
            }
        } else {
            dol_print_error($db);
        }
    }

    dol_syslog("get_product_localtax_for_country: ret=" . $ret);
    return $ret;
}

/**
 *  Function that return vat rate of a product line (according to seller, buyer and product vat rate)
 *   VATRULE 1: If seller does not use VAT, default VAT is 0. End of rule.
 *   VATRULE 2: If the (seller country = buyer country) then the default VAT = VAT of the product sold. End of rule.
 *   VATRULE 3: If (seller and buyer in the European Community) and (property sold = new means of transport such as car, boat, plane) then VAT by default = 0 (VAT must be paid by the buyer to the tax center of his country and not to the seller). End of rule.
 *   VATRULE 4: If (seller and buyer in the European Community) and (buyer = individual) then VAT by default = VAT of the product sold. End of rule
 *   VATRULE 5: If (seller and buyer in European Community) and (buyer = company) then VAT by default=0. End of rule
 *   VATRULE 6: Otherwise the VAT proposed by default=0. End of rule.
 *
 * @param Societe $thirdparty_seller Object Seller company
 * @param Societe $thirdparty_buyer Object Buyer company
 * @param int $idprod Id product
 * @param int $idprodfournprice Id product_fournisseur_price (for supplier order/invoice)
 * @return float|string                        Vat rate to use with format 5.0 or '5.0 (XXX)', -1 if we can't guess it
 * @see get_default_localtax(), get_default_npr()
 */
function get_default_tva(Societe $thirdparty_seller, Societe $thirdparty_buyer, $idprod = 0, $idprodfournprice = 0)
{
    global $conf;

    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/company.lib.php';

    // Note: possible values for tva_assuj are 0/1 or franchise/reel
    $seller_use_vat = ((is_numeric($thirdparty_seller->tva_assuj) && !$thirdparty_seller->tva_assuj) || (!is_numeric($thirdparty_seller->tva_assuj) && $thirdparty_seller->tva_assuj == 'franchise')) ? 0 : 1;

    $seller_country_code = $thirdparty_seller->country_code;
    $seller_in_cee = isInEEC($thirdparty_seller);

    $buyer_country_code = $thirdparty_buyer->country_code;
    $buyer_in_cee = isInEEC($thirdparty_buyer);

    dol_syslog("get_default_tva: seller use vat=" . $seller_use_vat . ", seller country=" . $seller_country_code . ", seller in cee=" . ((string)(int)$seller_in_cee) . ", buyer vat number=" . $thirdparty_buyer->tva_intra . " buyer country=" . $buyer_country_code . ", buyer in cee=" . ((string)(int)$buyer_in_cee) . ", idprod=" . $idprod . ", idprodfournprice=" . $idprodfournprice . ", SERVICE_ARE_ECOMMERCE_200238EC=" . (getDolGlobalString('SERVICES_ARE_ECOMMERCE_200238EC') ? $conf->global->SERVICES_ARE_ECOMMERCE_200238EC : ''));

    // If services are eServices according to EU Council Directive 2002/38/EC (http://ec.europa.eu/taxation_customs/taxation/vat/traders/e-commerce/article_1610_en.htm)
    // we use the buyer VAT.
    if (getDolGlobalString('SERVICE_ARE_ECOMMERCE_200238EC')) {
        if ($seller_in_cee && $buyer_in_cee) {
            $isacompany = $thirdparty_buyer->isACompany();
            if ($isacompany && getDolGlobalString('MAIN_USE_VAT_COMPANIES_IN_EEC_WITH_INVALID_VAT_ID_ARE_INDIVIDUAL')) {
                require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions2.lib.php';
                if (!isValidVATID($thirdparty_buyer)) {
                    $isacompany = 0;
                }
            }

            if (!$isacompany) {
                //print 'VATRULE 0';
                return get_product_vat_for_country($idprod, $thirdparty_buyer, $idprodfournprice);
            }
        }
    }

    // If seller does not use VAT, default VAT is 0. End of rule.
    if (!$seller_use_vat) {
        //print 'VATRULE 1';
        return 0;
    }

    // If the (seller country = buyer country) then the default VAT = VAT of the product sold. End of rule.
    if (
        ($seller_country_code == $buyer_country_code)
        || (in_array($seller_country_code, array('FR', 'MC')) && in_array($buyer_country_code, array('FR', 'MC')))
        || (in_array($seller_country_code, array('MQ', 'GP')) && in_array($buyer_country_code, array('MQ', 'GP')))
    ) { // Warning ->country_code not always defined
        //print 'VATRULE 2';
        $tmpvat = get_product_vat_for_country($idprod, $thirdparty_seller, $idprodfournprice);

        if ($seller_country_code == 'IN' && getDolGlobalString('MAIN_SALETAX_AUTOSWITCH_I_CS_FOR_INDIA')) {
            // Special case for india.
            //print 'VATRULE 2b';
            $reg = array();
            if (preg_match('/C+S-(\d+)/', $tmpvat, $reg) && $thirdparty_seller->state_id != $thirdparty_buyer->state_id) {
                // we must revert the C+S into I
                $tmpvat = str_replace("C+S", "I", $tmpvat);
            } elseif (preg_match('/I-(\d+)/', $tmpvat, $reg) && $thirdparty_seller->state_id == $thirdparty_buyer->state_id) {
                // we must revert the I into C+S
                $tmpvat = str_replace("I", "C+S", $tmpvat);
            }
        }

        return $tmpvat;
    }

    // If (seller and buyer in the European Community) and (property sold = new means of transport such as car, boat, plane) then VAT by default = 0 (VAT must be paid by the buyer to the tax center of his country and not to the seller). End of rule.
    // 'VATRULE 3' - Not supported

    // If (seller and buyer in the European Community) and (buyer = individual) then VAT by default = VAT of the product sold. End of rule
    // If (seller and buyer in European Community) and (buyer = company) then VAT by default=0. End of rule
    if (($seller_in_cee && $buyer_in_cee)) {
        $isacompany = $thirdparty_buyer->isACompany();
        if ($isacompany && getDolGlobalString('MAIN_USE_VAT_COMPANIES_IN_EEC_WITH_INVALID_VAT_ID_ARE_INDIVIDUAL')) {
            require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions2.lib.php';
            if (!isValidVATID($thirdparty_buyer)) {
                $isacompany = 0;
            }
        }

        if (!$isacompany) {
            //print 'VATRULE 4';
            return get_product_vat_for_country($idprod, $thirdparty_seller, $idprodfournprice);
        } else {
            //print 'VATRULE 5';
            return 0;
        }
    }

    // If (seller in the European Community and buyer outside the European Community and private buyer) then VAT by default = VAT of the product sold. End of rule
    // I don't see any use case that need this rule.
    if (getDolGlobalString('MAIN_USE_VAT_OF_PRODUCT_FOR_INDIVIDUAL_CUSTOMER_OUT_OF_EEC') && empty($buyer_in_cee)) {
        $isacompany = $thirdparty_buyer->isACompany();
        if (!$isacompany) {
            return get_product_vat_for_country($idprod, $thirdparty_seller, $idprodfournprice);
            //print 'VATRULE extra';
        }
    }

    // Otherwise the VAT proposed by default=0. End of rule.
    // Rem: This means that at least one of the 2 is outside the European Community and the country differs
    //print 'VATRULE 6';
    return 0;
}


/**
 *  Function that returns whether VAT must be recoverable collected VAT (e.g.: VAT NPR in France)
 *
 * @param Societe $thirdparty_seller Thirdparty seller
 * @param Societe $thirdparty_buyer Thirdparty buyer
 * @param int $idprod Id product
 * @param int $idprodfournprice Id supplier price for product
 * @return float                               0 or 1
 * @see get_default_tva(), get_default_localtax()
 */
function get_default_npr(Societe $thirdparty_seller, Societe $thirdparty_buyer, $idprod = 0, $idprodfournprice = 0)
{
    global $db;

    if ($idprodfournprice > 0) {
        $prodprice = new ProductFournisseur($db);
        $prodprice->fetch_product_fournisseur_price($idprodfournprice);
        return $prodprice->fourn_tva_npr;
    }

    if ($idprod > 0) {
        $prod = new Product($db);
        $prod->fetch($idprod);
        return $prod->tva_npr;
    }

    return 0;
}

/**
 *  Function that return localtax of a product line (according to seller, buyer and product vat rate)
 *   If the seller is not subject to VAT, then default VAT=0. Rule/Test ends.
 *   If (seller country == buyer country) default VAT=sold product VAT. Rule/Test ends.
 *   Else, default VAT=0. Rule/Test ends
 *
 * @param Societe $thirdparty_seller Third party seller
 * @param Societe $thirdparty_buyer Third party buyer
 * @param int $local Localtax to process (1 or 2)
 * @param int $idprod Id product
 * @return int                                 localtax, -1 if it can not be determined
 * @see get_default_tva(), get_default_npr()
 */
function get_default_localtax($thirdparty_seller, $thirdparty_buyer, $local, $idprod = 0)
{
    global $mysoc;

    if (!is_object($thirdparty_seller)) {
        return -1;
    }
    if (!is_object($thirdparty_buyer)) {
        return -1;
    }

    if ($local == 1) { // Localtax 1
        if ($mysoc->country_code == 'ES') {
            if (is_numeric($thirdparty_buyer->localtax1_assuj) && !$thirdparty_buyer->localtax1_assuj) {
                return 0;
            }
        } else {
            // Si vendeur non assujeti a Localtax1, localtax1 par default=0
            if (is_numeric($thirdparty_seller->localtax1_assuj) && !$thirdparty_seller->localtax1_assuj) {
                return 0;
            }
            if (!is_numeric($thirdparty_seller->localtax1_assuj) && $thirdparty_seller->localtax1_assuj == 'localtax1off') {
                return 0;
            }
        }
    } elseif ($local == 2) { //I Localtax 2
        // Si vendeur non assujeti a Localtax2, localtax2 par default=0
        if (is_numeric($thirdparty_seller->localtax2_assuj) && !$thirdparty_seller->localtax2_assuj) {
            return 0;
        }
        if (!is_numeric($thirdparty_seller->localtax2_assuj) && $thirdparty_seller->localtax2_assuj == 'localtax2off') {
            return 0;
        }
    }

    if ($thirdparty_seller->country_code == $thirdparty_buyer->country_code) {
        return get_product_localtax_for_country($idprod, $local, $thirdparty_seller);
    }

    return 0;
}

/**
 *  Return a path to have a the directory according to object where files are stored.
 *  This function is called by getMultidirOutput
 *  New usage:  $conf->module->multidir_output[$object->entity].'/'.get_exdir(0, 0, 0, 1, $object, '').'/'
 *         or:  $conf->module->dir_output.'/'.get_exdir(0, 0, 0, 0, $object, '')
 *
 *  Example of output with new usage:       $object is invoice -> 'INYYMM-ABCD'
 *  Example of output with old usage:       '015' with level 3->"0/1/5/", '015' with level 1->"5/", 'ABC-1' with level 3 ->"0/0/1/"
 *
 * @param string|int $num Id of object (deprecated, $object->id will be used in future)
 * @param int $level Level of subdirs to return (1, 2 or 3 levels). (deprecated, global setup will be used in future)
 * @param int $alpha 0=Keep number only to forge path, 1=Use alpha part after the - (By default, use 0). (deprecated, global option will be used in future)
 * @param int $withoutslash 0=With slash at end (except if '/', we return ''), 1=without slash at end
 * @param  ?CommonObject $object Object to use to get ref to forge the path.
 * @param string $modulepart Type of object ('invoice_supplier, 'donation', 'invoice', ...'). Use '' for autodetect from $object.
 * @return string                          Dir to use ending. Example '' or '1/' or '1/2/'
 * @see getMultidirOutput()
 */
function get_exdir($num, $level, $alpha, $withoutslash, $object, $modulepart = '')
{
    if (empty($modulepart) && is_object($object)) {
        if (!empty($object->module)) {
            $modulepart = $object->module;
        } elseif (!empty($object->element)) {
            $modulepart = $object->element;
        }
    }

    $path = '';

    // Define $arrayforoldpath that is module path using a hierarchy on more than 1 level.
    $arrayforoldpath = array('cheque' => 2, 'category' => 2, 'holiday' => 2, 'supplier_invoice' => 2, 'invoice_supplier' => 2, 'mailing' => 2, 'supplier_payment' => 2);
    if (getDolGlobalInt('PRODUCT_USE_OLD_PATH_FOR_PHOTO')) {
        $arrayforoldpath['product'] = 2;
    }

    if (empty($level) && array_key_exists($modulepart, $arrayforoldpath)) {
        $level = $arrayforoldpath[$modulepart];
    }

    if (!empty($level) && array_key_exists($modulepart, $arrayforoldpath)) {
        // This part should be removed once all code is using "get_exdir" to forge path, with parameter $object and $modulepart provided.
        if (empty($num) && is_object($object)) {
            $num = $object->id;
        }
        if (empty($alpha)) {
            $num = preg_replace('/([^0-9])/i', '', $num);
        } else {
            $num = preg_replace('/^.*-/i', '', $num);
        }
        $num = substr("000" . $num, -$level);
        if ($level == 1) {
            $path = substr($num, 0, 1);
        }
        if ($level == 2) {
            $path = substr($num, 1, 1) . '/' . substr($num, 0, 1);
        }
        if ($level == 3) {
            $path = substr($num, 2, 1) . '/' . substr($num, 1, 1) . '/' . substr($num, 0, 1);
        }
    } else {
        // We will enhance here a common way of forging path for document storage.
        // In a future, we may distribute directories on several levels depending on setup and object.
        // Here, $object->id, $object->ref and $modulepart are required.
        //var_dump($modulepart);
        $path = dol_sanitizeFileName(empty($object->ref) ? (string)((is_object($object) && property_exists($object, 'id')) ? $object->id : '') : $object->ref);
    }

    if (empty($withoutslash) && !empty($path)) {
        $path .= '/';
    }

    return $path;
}

/**
 *  Creation of a directory (this can create recursive subdir)
 *
 * @param string $dir Directory to create (Separator must be '/'. Example: '/mydir/mysubdir')
 * @param string $dataroot Data root directory (To avoid having the data root in the loop. Using this will also lost the warning, on first dir, saying PHP has no permission when open_basedir is used)
 * @param string $newmask Mask for new file (Defaults to $conf->global->MAIN_UMASK or 0755 if unavailable). Example: '0444'
 * @return int                     Return integer < 0 if KO, 0 = already exists, > 0 if OK
 */
function dol_mkdir($dir, $dataroot = '', $newmask = '')
{
    global $conf;

    dol_syslog("functions.lib::dol_mkdir: dir=" . $dir, LOG_INFO);

    $dir_osencoded = dol_osencode($dir);
    if (@is_dir($dir_osencoded)) {
        return 0;
    }

    $nberr = 0;
    $nbcreated = 0;

    $ccdir = '';
    if (!empty($dataroot)) {
        // Remove data root from loop
        $dir = str_replace($dataroot . '/', '', $dir);
        $ccdir = $dataroot . '/';
    }

    $cdir = explode("/", $dir);
    $num = count($cdir);
    for ($i = 0; $i < $num; $i++) {
        if ($i > 0) {
            $ccdir .= '/' . $cdir[$i];
        } else {
            $ccdir .= $cdir[$i];
        }
        $regs = array();
        if (preg_match("/^.:$/", $ccdir, $regs)) {
            continue; // If the Windows path is incomplete, continue with next directory
        }

        // Attention, is_dir() can fail event if the directory exists
        // (i.e. according the open_basedir configuration)
        if ($ccdir) {
            $ccdir_osencoded = dol_osencode($ccdir);
            if (!@is_dir($ccdir_osencoded)) {
                dol_syslog("functions.lib::dol_mkdir: Directory '" . $ccdir . "' does not exists or is outside open_basedir PHP setting.", LOG_DEBUG);

                umask(0);
                $dirmaskdec = octdec((string)$newmask);
                if (empty($newmask)) {
                    $dirmaskdec = !getDolGlobalString('MAIN_UMASK') ? octdec('0755') : octdec($conf->global->MAIN_UMASK);
                }
                $dirmaskdec |= octdec('0111'); // Set x bit required for directories
                if (!@mkdir($ccdir_osencoded, $dirmaskdec)) {
                    // If the is_dir has returned a false information, we arrive here
                    dol_syslog("functions.lib::dol_mkdir: Fails to create directory '" . $ccdir . "' or directory already exists.", LOG_WARNING);
                    $nberr++;
                } else {
                    dol_syslog("functions.lib::dol_mkdir: Directory '" . $ccdir . "' created", LOG_DEBUG);
                    $nberr = 0; // At this point in the code, the previous failures can be ignored -> set $nberr to 0
                    $nbcreated++;
                }
            } else {
                $nberr = 0; // At this point in the code, the previous failures can be ignored -> set $nberr to 0
            }
        }
    }
    return ($nberr ? -$nberr : $nbcreated);
}


/**
 *  Change mod of a file
 *
 * @param string $filepath Full file path
 * @param string $newmask Force new mask. For example '0644'
 * @return void
 */
function dolChmod($filepath, $newmask = '')
{
    global $conf;

    if (!empty($newmask)) {
        @chmod($filepath, octdec($newmask));
    } elseif (getDolGlobalString('MAIN_UMASK')) {
        @chmod($filepath, octdec($conf->global->MAIN_UMASK));
    }
}

/**
 * Return first line of text. Cut will depends if content is HTML or not.
 *
 * @param string $text Input text
 * @param int $nboflines Nb of lines to get (default is 1 = first line only)
 * @param string $charset Charset of $text string (UTF-8 by default)
 * @return  string              Output text
 * @see dol_nboflines_bis(), dol_string_nohtmltag(), dol_escape_htmltag()
 */
function dolGetFirstLineOfText($text, $nboflines = 1, $charset = 'UTF-8')
{
    if ($nboflines == 1) {
        if (dol_textishtml($text)) {
            $firstline = preg_replace('/<br[^>]*>.*$/s', '', $text); // The s pattern modifier means the . can match newline characters
            $firstline = preg_replace('/<div[^>]*>.*$/s', '', $firstline); // The s pattern modifier means the . can match newline characters
        } else {
            if (isset($text)) {
                $firstline = preg_replace('/[\n\r].*/', '', $text);
            } else {
                $firstline = '';
            }
        }
        return $firstline . (isset($firstline) && isset($text) && (strlen($firstline) != strlen($text)) ? '...' : '');
    } else {
        $ishtml = 0;
        if (dol_textishtml($text)) {
            $text = preg_replace('/\n/', '', $text);
            $ishtml = 1;
            $repTable = array("\t" => " ", "\n" => " ", "\r" => " ", "\0" => " ", "\x0B" => " ");
        } else {
            $repTable = array("\t" => " ", "\n" => "<br>", "\r" => " ", "\0" => " ", "\x0B" => " ");
        }

        $text = strtr($text, $repTable);
        if ($charset == 'UTF-8') {
            $pattern = '/(<br[^>]*>)/Uu';
        } else {
            // /U is to have UNGREEDY regex to limit to one html tag. /u is for UTF8 support
            $pattern = '/(<br[^>]*>)/U'; // /U is to have UNGREEDY regex to limit to one html tag.
        }
        $a = preg_split($pattern, $text, -1, PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);

        $firstline = '';
        $i = 0;
        $countline = 0;
        $lastaddediscontent = 1;
        while ($countline < $nboflines && isset($a[$i])) {
            if (preg_match('/<br[^>]*>/', $a[$i])) {
                if (array_key_exists($i + 1, $a) && !empty($a[$i + 1])) {
                    $firstline .= ($ishtml ? "<br>\n" : "\n");
                    // Is it a br for a new line of after a printed line ?
                    if (!$lastaddediscontent) {
                        $countline++;
                    }
                    $lastaddediscontent = 0;
                }
            } else {
                $firstline .= $a[$i];
                $lastaddediscontent = 1;
                $countline++;
            }
            $i++;
        }

        $adddots = (isset($a[$i]) && (!preg_match('/<br[^>]*>/', $a[$i]) || (array_key_exists($i + 1, $a) && !empty($a[$i + 1]))));
        //unset($a);
        $ret = $firstline . ($adddots ? '...' : '');
        //exit;
        return $ret;
    }
}


/**
 * Replace CRLF in string with a HTML BR tag.
 * WARNING: The content after operation contains some HTML tags (the <br>) so be sure to also have
 *          encoded the special chars of stringtoencode into HTML before with dol_htmlentitiesbr().
 *
 * @param string $stringtoencode String to encode
 * @param int $nl2brmode 0=Adding br before \n, 1=Replacing \n by br
 * @param bool $forxml false=Use <br>, true=Use <br />
 * @return  string                      String encoded
 * @see dol_htmlentitiesbr(), dol_nboflines(), dolGetFirstLineOfText()
 */
function dol_nl2br($stringtoencode, $nl2brmode = 0, $forxml = false)
{
    if (is_null($stringtoencode)) {
        return '';
    }

    if (!$nl2brmode) {
        return nl2br($stringtoencode, $forxml);
    } else {
        $ret = preg_replace('/(\r\n|\r|\n)/i', ($forxml ? '<br />' : '<br>'), $stringtoencode);
        return $ret;
    }
}

/**
 *  Check if a string is a correct iso string
 *  If not, it will not be considered as HTML encoded even if it is by FPDF.
 *  Example, if string contains euro symbol that has ascii code 128
 *
 * @param string $s String to check
 * @param int $clean Clean if it is not an ISO. Warning, if file is utf8, you will get a bad formatted file.
 * @return int|string              0 if bad iso, 1 if good iso, Or the clean string if $clean is 1
 * @deprecated Duplicate of ascii_check()
 * @see ascii_check()
 */
function dol_string_is_good_iso($s, $clean = 0)
{
    $len = dol_strlen($s);
    $out = '';
    $ok = 1;
    for ($scursor = 0; $scursor < $len; $scursor++) {
        $ordchar = ord($s[$scursor]);
        //print $scursor.'-'.$ordchar.'<br>';
        if ($ordchar < 32 && $ordchar != 13 && $ordchar != 10) {
            $ok = 0;
            break;
        } elseif ($ordchar > 126 && $ordchar < 160) {
            $ok = 0;
            break;
        } elseif ($clean) {
            $out .= $s[$scursor];
        }
    }
    if ($clean) {
        return $out;
    }
    return $ok;
}

/**
 *  Return nb of lines of a clear text
 *
 * @param string $s String to check
 * @param int $maxchar Not yet used
 * @return int                 Number of lines
 * @see    dol_nboflines_bis(), dolGetFirstLineOfText()
 */
function dol_nboflines($s, $maxchar = 0)
{
    if ($s == '') {
        return 0;
    }
    $arraystring = explode("\n", $s);
    $nb = count($arraystring);

    return $nb;
}


/**
 *  Return nb of lines of a formatted text with \n and <br> (WARNING: string must not have mixed \n and br separators)
 *
 * @param string $text Text
 * @param int $maxlinesize Linewidth in character count (default = 0 == nolimit)
 * @param string $charset Give the charset used to encode the $text variable in memory.
 * @return int                     Number of lines
 * @see    dol_nboflines(), dolGetFirstLineOfText()
 */
function dol_nboflines_bis($text, $maxlinesize = 0, $charset = 'UTF-8')
{
    $repTable = array("\t" => " ", "\n" => "<br>", "\r" => " ", "\0" => " ", "\x0B" => " ");
    if (dol_textishtml($text)) {
        $repTable = array("\t" => " ", "\n" => " ", "\r" => " ", "\0" => " ", "\x0B" => " ");
    }

    $text = strtr($text, $repTable);
    if ($charset == 'UTF-8') {
        $pattern = '/(<br[^>]*>)/Uu';
    } else {
        // /U is to have UNGREEDY regex to limit to one html tag. /u is for UTF8 support
        $pattern = '/(<br[^>]*>)/U'; // /U is to have UNGREEDY regex to limit to one html tag.
    }
    $a = preg_split($pattern, $text, -1, PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);

    $nblines = (int)floor((count($a) + 1) / 2);
    // count possible auto line breaks
    if ($maxlinesize) {
        foreach ($a as $line) {
            if (dol_strlen($line) > $maxlinesize) {
                //$line_dec = html_entity_decode(strip_tags($line));
                $line_dec = html_entity_decode($line);
                if (dol_strlen($line_dec) > $maxlinesize) {
                    $line_dec = wordwrap($line_dec, $maxlinesize, '\n', true);
                    $nblines += substr_count($line_dec, '\n');
                }
            }
        }
    }

    unset($a);
    return $nblines;
}

/**
 *  Return if a text is a html content
 *
 * @param string $msg Content to check
 * @param int $option 0=Full detection, 1=Fast check
 * @return boolean             true/false
 * @see    dol_concatdesc()
 */
function dol_textishtml($msg, $option = 0)
{
    if (is_null($msg)) {
        return false;
    }

    if ($option == 1) {
        if (preg_match('/<html/i', $msg)) {
            return true;
        } elseif (preg_match('/<body/i', $msg)) {
            return true;
        } elseif (preg_match('/<\/textarea/i', $msg)) {
            return true;
        } elseif (preg_match('/<(b|em|i|u)(\s+[^>]+)?>/i', $msg)) {
            return true;
        } elseif (preg_match('/<br/i', $msg)) {
            return true;
        }
        return false;
    } else {
        // Remove all urls because 'http://aa?param1=abc&amp;param2=def' must not be used inside detection
        $msg = preg_replace('/https?:\/\/[^"\'\s]+/i', '', $msg);
        if (preg_match('/<html/i', $msg)) {
            return true;
        } elseif (preg_match('/<body/i', $msg)) {
            return true;
        } elseif (preg_match('/<\/textarea/i', $msg)) {
            return true;
        } elseif (preg_match('/<(b|em|i|u)(\s+[^>]+)?>/i', $msg)) {
            return true;
        } elseif (preg_match('/<(br|hr)\/>/i', $msg)) {
            return true;
        } elseif (preg_match('/<(br|hr|div|font|li|p|span|strong|table)>/i', $msg)) {
            return true;
        } elseif (preg_match('/<(br|hr|div|font|li|p|span|strong|table)\s+[^<>\/]*\/?>/i', $msg)) {
            return true;
        } elseif (preg_match('/<img\s+[^<>]*src[^<>]*>/i', $msg)) {
            return true; // must accept <img src="http://example.com/aaa.png" />
        } elseif (preg_match('/<a\s+[^<>]*href[^<>]*>/i', $msg)) {
            return true; // must accept <a href="http://example.com/aaa.png" />
        } elseif (preg_match('/<h[0-9]>/i', $msg)) {
            return true;
        } elseif (preg_match('/&[A-Z0-9]{1,6};/i', $msg)) {
            // TODO If content is 'A link https://aaa?param=abc&amp;param2=def', it return true but must be false
            return true; // Html entities names (http://www.w3schools.com/tags/ref_entities.asp)
        } elseif (preg_match('/&#[0-9]{2,3};/i', $msg)) {
            return true; // Html entities numbers (http://www.w3schools.com/tags/ref_entities.asp)
        }

        return false;
    }
}

/**
 *  Concat 2 descriptions with a new line between them (second operand after first one with appropriate new line separator)
 *  text1 html + text2 html => text1 + '<br>' + text2
 *  text1 html + text2 txt  => text1 + '<br>' + dol_nl2br(text2)
 *  text1 txt  + text2 html => dol_nl2br(text1) + '<br>' + text2
 *  text1 txt  + text2 txt  => text1 + '\n' + text2
 *
 * @param string $text1 Text 1
 * @param string $text2 Text 2
 * @param bool $forxml true=Use <br /> instead of <br> if we have to add a br tag
 * @param bool $invert invert order of description lines (we often use config MAIN_CHANGE_ORDER_CONCAT_DESCRIPTION in this parameter)
 * @return string                  Text 1 + new line + Text2
 * @see    dol_textishtml()
 */
function dol_concatdesc($text1, $text2, $forxml = false, $invert = false)
{
    if (!empty($invert)) {
        $tmp = $text1;
        $text1 = $text2;
        $text2 = $tmp;
    }

    $ret = '';
    $ret .= (!dol_textishtml($text1) && dol_textishtml($text2)) ? dol_nl2br(dol_escape_htmltag($text1, 0, 1, '', 1), 0, $forxml) : $text1;
    $ret .= (!empty($text1) && !empty($text2)) ? ((dol_textishtml($text1) || dol_textishtml($text2)) ? ($forxml ? "<br \>\n" : "<br>\n") : "\n") : "";
    $ret .= (dol_textishtml($text1) && !dol_textishtml($text2)) ? dol_nl2br(dol_escape_htmltag($text2, 0, 1, '', 1), 0, $forxml) : $text2;
    return $ret;
}


/**
 * Return array of possible common substitutions. This includes several families like: 'system', 'mycompany', 'object', 'objectamount', 'date', 'user'
 *
 * @param Translate $outputlangs Output language
 * @param int $onlykey 1=Do not calculate some heavy values of keys (performance enhancement when we need only the keys),
 *                                          2=Values are trunc and html sanitized (to use for help tooltip)
 * @param string[]|null $exclude Array of family keys we want to exclude. For example array('system', 'mycompany', 'object', 'objectamount', 'date', 'user', ...)
 * @param   ?CommonObject $object Object for keys on object
 * @param string[]|null $include Array of family keys we want to include. For example array('system', 'mycompany', 'object', 'objectamount', 'date', 'user', ...)
 * @return  array<string,string>            Array of substitutions
 * @see setSubstitFromObject()
 * @phan-suppress PhanTypeArraySuspiciousNullable,PhanTypePossiblyInvalidDimOffset,PhanUndeclaredProperty
 */
function getCommonSubstitutionArray($outputlangs, $onlykey = 0, $exclude = null, $object = null, $include = null)
{
    global $db, $conf, $mysoc, $user, $extrafields;

    $substitutionarray = array();

    if ((empty($exclude) || !in_array('user', $exclude)) && (empty($include) || in_array('user', $include))) {
        // Add SIGNATURE into substitutionarray first, so, when we will make the substitution,
        // this will include signature content first and then replace var found into content of signature
        //var_dump($onlykey);
        $emailsendersignature = $user->signature; //  dy default, we use the signature of current user. We must complete substitution with signature in c_email_senderprofile of array after calling getCommonSubstitutionArray()
        $usersignature = $user->signature;
        $substitutionarray = array_merge($substitutionarray, array(
            '__SENDEREMAIL_SIGNATURE__' => (string)((!getDolGlobalString('MAIN_MAIL_DO_NOT_USE_SIGN')) ? ($onlykey == 2 ? dol_trunc('SignatureFromTheSelectedSenderProfile', 30) : $emailsendersignature) : ''),
            '__USER_SIGNATURE__' => (string)(($usersignature && !getDolGlobalString('MAIN_MAIL_DO_NOT_USE_SIGN')) ? ($onlykey == 2 ? dol_trunc(dol_string_nohtmltag($usersignature), 30) : $usersignature) : '')
        ));

        if (is_object($user) && ($user instanceof User)) {
            $substitutionarray = array_merge($substitutionarray, array(
                '__USER_ID__' => (string)$user->id,
                '__USER_LOGIN__' => (string)$user->login,
                '__USER_EMAIL__' => (string)$user->email,
                '__USER_PHONE__' => (string)dol_print_phone($user->office_phone, '', 0, 0, '', " ", '', '', -1),
                '__USER_PHONEPRO__' => (string)dol_print_phone($user->user_mobile, '', 0, 0, '', " ", '', '', -1),
                '__USER_PHONEMOBILE__' => (string)dol_print_phone($user->personal_mobile, '', 0, 0, '', " ", '', '', -1),
                '__USER_FAX__' => (string)$user->office_fax,
                '__USER_LASTNAME__' => (string)$user->lastname,
                '__USER_FIRSTNAME__' => (string)$user->firstname,
                '__USER_FULLNAME__' => (string)$user->getFullName($outputlangs),
                '__USER_SUPERVISOR_ID__' => (string)($user->fk_user ? $user->fk_user : '0'),
                '__USER_JOB__' => (string)$user->job,
                '__USER_REMOTE_IP__' => (string)getUserRemoteIP(),
                '__USER_VCARD_URL__' => (string)$user->getOnlineVirtualCardUrl('', 'external')
            ));
        }
    }
    if ((empty($exclude) || !in_array('mycompany', $exclude)) && is_object($mysoc) && (empty($include) || in_array('mycompany', $include))) {
        $substitutionarray = array_merge($substitutionarray, array(
            '__MYCOMPANY_NAME__' => $mysoc->name,
            '__MYCOMPANY_EMAIL__' => $mysoc->email,
            '__MYCOMPANY_PHONE__' => dol_print_phone($mysoc->phone, '', 0, 0, '', " ", '', '', -1),
            '__MYCOMPANY_FAX__' => dol_print_phone($mysoc->fax, '', 0, 0, '', " ", '', '', -1),
            '__MYCOMPANY_PROFID1__' => $mysoc->idprof1,
            '__MYCOMPANY_PROFID2__' => $mysoc->idprof2,
            '__MYCOMPANY_PROFID3__' => $mysoc->idprof3,
            '__MYCOMPANY_PROFID4__' => $mysoc->idprof4,
            '__MYCOMPANY_PROFID5__' => $mysoc->idprof5,
            '__MYCOMPANY_PROFID6__' => $mysoc->idprof6,
            '__MYCOMPANY_PROFID7__' => $mysoc->idprof7,
            '__MYCOMPANY_PROFID8__' => $mysoc->idprof8,
            '__MYCOMPANY_PROFID9__' => $mysoc->idprof9,
            '__MYCOMPANY_PROFID10__' => $mysoc->idprof10,
            '__MYCOMPANY_CAPITAL__' => $mysoc->capital,
            '__MYCOMPANY_FULLADDRESS__' => (method_exists($mysoc, 'getFullAddress') ? $mysoc->getFullAddress(1, ', ') : ''),    // $mysoc may be stdClass
            '__MYCOMPANY_ADDRESS__' => $mysoc->address,
            '__MYCOMPANY_ZIP__' => $mysoc->zip,
            '__MYCOMPANY_TOWN__' => $mysoc->town,
            '__MYCOMPANY_COUNTRY__' => $mysoc->country,
            '__MYCOMPANY_COUNTRY_ID__' => $mysoc->country_id,
            '__MYCOMPANY_COUNTRY_CODE__' => $mysoc->country_code,
            '__MYCOMPANY_CURRENCY_CODE__' => $conf->currency
        ));
    }

    if (($onlykey || is_object($object)) && (empty($exclude) || !in_array('object', $exclude)) && (empty($include) || in_array('object', $include))) {
        if ($onlykey) {
            $substitutionarray['__ID__'] = '__ID__';
            $substitutionarray['__REF__'] = '__REF__';
            $substitutionarray['__NEWREF__'] = '__NEWREF__';
            $substitutionarray['__LABEL__'] = '__LABEL__';
            $substitutionarray['__REF_CLIENT__'] = '__REF_CLIENT__';
            $substitutionarray['__REF_SUPPLIER__'] = '__REF_SUPPLIER__';
            $substitutionarray['__NOTE_PUBLIC__'] = '__NOTE_PUBLIC__';
            $substitutionarray['__NOTE_PRIVATE__'] = '__NOTE_PRIVATE__';
            $substitutionarray['__EXTRAFIELD_XXX__'] = '__EXTRAFIELD_XXX__';

            if (isModEnabled("societe")) {  // Most objects are concerned
                $substitutionarray['__THIRDPARTY_ID__'] = '__THIRDPARTY_ID__';
                $substitutionarray['__THIRDPARTY_NAME__'] = '__THIRDPARTY_NAME__';
                $substitutionarray['__THIRDPARTY_NAME_ALIAS__'] = '__THIRDPARTY_NAME_ALIAS__';
                $substitutionarray['__THIRDPARTY_CODE_CLIENT__'] = '__THIRDPARTY_CODE_CLIENT__';
                $substitutionarray['__THIRDPARTY_CODE_FOURNISSEUR__'] = '__THIRDPARTY_CODE_FOURNISSEUR__';
                $substitutionarray['__THIRDPARTY_EMAIL__'] = '__THIRDPARTY_EMAIL__';
                //$substitutionarray['__THIRDPARTY_EMAIL_URLENCODED__'] = '__THIRDPARTY_EMAIL_URLENCODED__';    // We hide this one
                $substitutionarray['__THIRDPARTY_PHONE__'] = '__THIRDPARTY_PHONE__';
                $substitutionarray['__THIRDPARTY_FAX__'] = '__THIRDPARTY_FAX__';
                $substitutionarray['__THIRDPARTY_ADDRESS__'] = '__THIRDPARTY_ADDRESS__';
                $substitutionarray['__THIRDPARTY_ZIP__'] = '__THIRDPARTY_ZIP__';
                $substitutionarray['__THIRDPARTY_TOWN__'] = '__THIRDPARTY_TOWN__';
                $substitutionarray['__THIRDPARTY_IDPROF1__'] = '__THIRDPARTY_IDPROF1__';
                $substitutionarray['__THIRDPARTY_IDPROF2__'] = '__THIRDPARTY_IDPROF2__';
                $substitutionarray['__THIRDPARTY_IDPROF3__'] = '__THIRDPARTY_IDPROF3__';
                $substitutionarray['__THIRDPARTY_IDPROF4__'] = '__THIRDPARTY_IDPROF4__';
                $substitutionarray['__THIRDPARTY_IDPROF5__'] = '__THIRDPARTY_IDPROF5__';
                $substitutionarray['__THIRDPARTY_IDPROF6__'] = '__THIRDPARTY_IDPROF6__';
                $substitutionarray['__THIRDPARTY_IDPROF7__'] = '__THIRDPARTY_IDPROF7__';
                $substitutionarray['__THIRDPARTY_IDPROF8__'] = '__THIRDPARTY_IDPROF8__';
                $substitutionarray['__THIRDPARTY_IDPROF9__'] = '__THIRDPARTY_IDPROF9__';
                $substitutionarray['__THIRDPARTY_IDPROF10__'] = '__THIRDPARTY_IDPROF10__';
                $substitutionarray['__THIRDPARTY_TVAINTRA__'] = '__THIRDPARTY_TVAINTRA__';
                $substitutionarray['__THIRDPARTY_NOTE_PUBLIC__'] = '__THIRDPARTY_NOTE_PUBLIC__';
                $substitutionarray['__THIRDPARTY_NOTE_PRIVATE__'] = '__THIRDPARTY_NOTE_PRIVATE__';
            }
            if (isModEnabled('member') && (!is_object($object) || $object->element == 'adherent') && (empty($exclude) || !in_array('member', $exclude)) && (empty($include) || in_array('member', $include))) {
                $substitutionarray['__MEMBER_ID__'] = '__MEMBER_ID__';
                $substitutionarray['__MEMBER_CIVILITY__'] = '__MEMBER_CIVILITY__';
                $substitutionarray['__MEMBER_FIRSTNAME__'] = '__MEMBER_FIRSTNAME__';
                $substitutionarray['__MEMBER_LASTNAME__'] = '__MEMBER_LASTNAME__';
                $substitutionarray['__MEMBER_USER_LOGIN_INFORMATION__'] = 'Login and pass of the external user account';
                /*$substitutionarray['__MEMBER_NOTE_PUBLIC__'] = '__MEMBER_NOTE_PUBLIC__';
                $substitutionarray['__MEMBER_NOTE_PRIVATE__'] = '__MEMBER_NOTE_PRIVATE__';*/
            }
            // add substitution variables for ticket
            if (isModEnabled('ticket') && (!is_object($object) || $object->element == 'ticket') && (empty($exclude) || !in_array('ticket', $exclude)) && (empty($include) || in_array('ticket', $include))) {
                $substitutionarray['__TICKET_TRACKID__'] = '__TICKET_TRACKID__';
                $substitutionarray['__TICKET_SUBJECT__'] = '__TICKET_SUBJECT__';
                $substitutionarray['__TICKET_TYPE__'] = '__TICKET_TYPE__';
                $substitutionarray['__TICKET_SEVERITY__'] = '__TICKET_SEVERITY__';
                $substitutionarray['__TICKET_CATEGORY__'] = '__TICKET_CATEGORY__';
                $substitutionarray['__TICKET_ANALYTIC_CODE__'] = '__TICKET_ANALYTIC_CODE__';
                $substitutionarray['__TICKET_MESSAGE__'] = '__TICKET_MESSAGE__';
                $substitutionarray['__TICKET_PROGRESSION__'] = '__TICKET_PROGRESSION__';
                $substitutionarray['__TICKET_USER_ASSIGN__'] = '__TICKET_USER_ASSIGN__';
            }

            if (isModEnabled('recruitment') && (!is_object($object) || $object->element == 'recruitmentcandidature') && (empty($exclude) || !in_array('recruitment', $exclude)) && (empty($include) || in_array('recruitment', $include))) {
                $substitutionarray['__CANDIDATE_FULLNAME__'] = '__CANDIDATE_FULLNAME__';
                $substitutionarray['__CANDIDATE_FIRSTNAME__'] = '__CANDIDATE_FIRSTNAME__';
                $substitutionarray['__CANDIDATE_LASTNAME__'] = '__CANDIDATE_LASTNAME__';
            }
            if (isModEnabled('project') && (empty($exclude) || !in_array('project', $exclude)) && (empty($include) || in_array('project', $include))) {     // Most objects
                $substitutionarray['__PROJECT_ID__'] = '__PROJECT_ID__';
                $substitutionarray['__PROJECT_REF__'] = '__PROJECT_REF__';
                $substitutionarray['__PROJECT_NAME__'] = '__PROJECT_NAME__';
                /*$substitutionarray['__PROJECT_NOTE_PUBLIC__'] = '__PROJECT_NOTE_PUBLIC__';
                $substitutionarray['__PROJECT_NOTE_PRIVATE__'] = '__PROJECT_NOTE_PRIVATE__';*/
            }
            if (isModEnabled('contract') && (!is_object($object) || $object->element == 'contract') && (empty($exclude) || !in_array('contract', $exclude)) && (empty($include) || in_array('contract', $include))) {
                $substitutionarray['__CONTRACT_HIGHEST_PLANNED_START_DATE__'] = 'Highest date planned for a service start';
                $substitutionarray['__CONTRACT_HIGHEST_PLANNED_START_DATETIME__'] = 'Highest date and hour planned for service start';
                $substitutionarray['__CONTRACT_LOWEST_EXPIRATION_DATE__'] = 'Lowest data for planned expiration of service';
                $substitutionarray['__CONTRACT_LOWEST_EXPIRATION_DATETIME__'] = 'Lowest date and hour for planned expiration of service';
            }
            if (isModEnabled("propal") && (!is_object($object) || $object->element == 'propal') && (empty($exclude) || !in_array('propal', $exclude)) && (empty($include) || in_array('propal', $include))) {
                $substitutionarray['__ONLINE_SIGN_URL__'] = 'ToOfferALinkForOnlineSignature';
            }
            if (isModEnabled("intervention") && (!is_object($object) || $object->element == 'fichinter') && (empty($exclude) || !in_array('intervention', $exclude)) && (empty($include) || in_array('intervention', $include))) {
                $substitutionarray['__ONLINE_SIGN_FICHINTER_URL__'] = 'ToOfferALinkForOnlineSignature';
            }
            $substitutionarray['__ONLINE_PAYMENT_URL__'] = 'UrlToPayOnlineIfApplicable';
            $substitutionarray['__ONLINE_PAYMENT_TEXT_AND_URL__'] = 'TextAndUrlToPayOnlineIfApplicable';
            $substitutionarray['__SECUREKEYPAYMENT__'] = 'Security key (if key is not unique per record)';
            $substitutionarray['__SECUREKEYPAYMENT_MEMBER__'] = 'Security key for payment on a member subscription (one key per member)';
            $substitutionarray['__SECUREKEYPAYMENT_ORDER__'] = 'Security key for payment on an order';
            $substitutionarray['__SECUREKEYPAYMENT_INVOICE__'] = 'Security key for payment on an invoice';
            $substitutionarray['__SECUREKEYPAYMENT_CONTRACTLINE__'] = 'Security key for payment on a service of a contract';

            $substitutionarray['__DIRECTDOWNLOAD_URL_PROPOSAL__'] = 'Direct download url of a proposal';
            $substitutionarray['__DIRECTDOWNLOAD_URL_ORDER__'] = 'Direct download url of an order';
            $substitutionarray['__DIRECTDOWNLOAD_URL_INVOICE__'] = 'Direct download url of an invoice';
            $substitutionarray['__DIRECTDOWNLOAD_URL_CONTRACT__'] = 'Direct download url of a contract';
            $substitutionarray['__DIRECTDOWNLOAD_URL_SUPPLIER_PROPOSAL__'] = 'Direct download url of a supplier proposal';

            if (isModEnabled("shipping") && (!is_object($object) || $object->element == 'shipping')) {
                $substitutionarray['__SHIPPINGTRACKNUM__'] = 'Shipping tracking number';
                $substitutionarray['__SHIPPINGTRACKNUMURL__'] = 'Shipping tracking url';
                $substitutionarray['__SHIPPINGMETHOD__'] = 'Shipping method';
            }
            if (isModEnabled("reception") && (!is_object($object) || $object->element == 'reception')) {
                $substitutionarray['__RECEPTIONTRACKNUM__'] = 'Shipping tracking number of shipment';
                $substitutionarray['__RECEPTIONTRACKNUMURL__'] = 'Shipping tracking url';
            }
        } else {
            '@phan-var-force Adherent|Delivery $object';
            $substitutionarray['__ID__'] = $object->id;
            $substitutionarray['__REF__'] = $object->ref;
            $substitutionarray['__NEWREF__'] = $object->newref;
            $substitutionarray['__LABEL__'] = (isset($object->label) ? $object->label : (isset($object->title) ? $object->title : null));
            $substitutionarray['__REF_CLIENT__'] = (isset($object->ref_client) ? $object->ref_client : (isset($object->ref_customer) ? $object->ref_customer : null));
            $substitutionarray['__REF_SUPPLIER__'] = (isset($object->ref_supplier) ? $object->ref_supplier : null);
            $substitutionarray['__NOTE_PUBLIC__'] = (isset($object->note_public) ? $object->note_public : null);
            $substitutionarray['__NOTE_PRIVATE__'] = (isset($object->note_private) ? $object->note_private : null);
            $substitutionarray['__DATE_CREATION__'] = (isset($object->date_creation) ? dol_print_date($object->date_creation, 'day', 0, $outputlangs) : '');
            $substitutionarray['__DATE_MODIFICATION__'] = (isset($object->date_modification) ? dol_print_date($object->date_modification, 'day', 0, $outputlangs) : '');
            $substitutionarray['__DATE_VALIDATION__'] = (isset($object->date_validation) ? dol_print_date($object->date_validation, 'day', 0, $outputlangs) : '');
            $substitutionarray['__DATE_DELIVERY__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, 'day', 0, $outputlangs) : '');
            $substitutionarray['__DATE_DELIVERY_DAY__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%d") : '');
            $substitutionarray['__DATE_DELIVERY_DAY_TEXT__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%A") : '');
            $substitutionarray['__DATE_DELIVERY_MON__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%m") : '');
            $substitutionarray['__DATE_DELIVERY_MON_TEXT__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%b") : '');
            $substitutionarray['__DATE_DELIVERY_YEAR__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%Y") : '');
            $substitutionarray['__DATE_DELIVERY_HH__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%H") : '');
            $substitutionarray['__DATE_DELIVERY_MM__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%M") : '');
            $substitutionarray['__DATE_DELIVERY_SS__'] = (isset($object->date_delivery) ? dol_print_date($object->date_delivery, "%S") : '');

            // For backward compatibility (deprecated)
            $substitutionarray['__REFCLIENT__'] = (isset($object->ref_client) ? $object->ref_client : (isset($object->ref_customer) ? $object->ref_customer : null));
            $substitutionarray['__REFSUPPLIER__'] = (isset($object->ref_supplier) ? $object->ref_supplier : null);
            $substitutionarray['__SUPPLIER_ORDER_DATE_DELIVERY__'] = (isset($object->delivery_date) ? dol_print_date($object->delivery_date, 'day', 0, $outputlangs) : '');
            $substitutionarray['__SUPPLIER_ORDER_DELAY_DELIVERY__'] = (isset($object->availability_code) ? ($outputlangs->transnoentities("AvailabilityType" . $object->availability_code) != 'AvailabilityType' . $object->availability_code ? $outputlangs->transnoentities("AvailabilityType" . $object->availability_code) : $outputlangs->convToOutputCharset(isset($object->availability) ? $object->availability : '')) : '');
            $substitutionarray['__EXPIRATION_DATE__'] = (isset($object->fin_validite) ? dol_print_date($object->fin_validite, 'daytext') : '');

            if (is_object($object) && ($object->element == 'adherent' || $object->element == 'member') && $object->id > 0) {
                '@phan-var-force Adherent $object';
                $birthday = (empty($object->birth) ? '' : dol_print_date($object->birth, 'day'));

                $substitutionarray['__MEMBER_ID__'] = (isset($object->id) ? $object->id : '');
                if (method_exists($object, 'getCivilityLabel')) {
                    $substitutionarray['__MEMBER_CIVILITY__'] = $object->getCivilityLabel();
                }
                $substitutionarray['__MEMBER_FIRSTNAME__'] = (isset($object->firstname) ? $object->firstname : '');
                $substitutionarray['__MEMBER_LASTNAME__'] = (isset($object->lastname) ? $object->lastname : '');
                $substitutionarray['__MEMBER_USER_LOGIN_INFORMATION__'] = '';
                if (method_exists($object, 'getFullName')) {
                    $substitutionarray['__MEMBER_FULLNAME__'] = $object->getFullName($outputlangs);
                }
                $substitutionarray['__MEMBER_COMPANY__'] = (isset($object->societe) ? $object->societe : '');
                $substitutionarray['__MEMBER_ADDRESS__'] = (isset($object->address) ? $object->address : '');
                $substitutionarray['__MEMBER_ZIP__'] = (isset($object->zip) ? $object->zip : '');
                $substitutionarray['__MEMBER_TOWN__'] = (isset($object->town) ? $object->town : '');
                $substitutionarray['__MEMBER_COUNTRY__'] = (isset($object->country) ? $object->country : '');
                $substitutionarray['__MEMBER_EMAIL__'] = (isset($object->email) ? $object->email : '');
                $substitutionarray['__MEMBER_BIRTH__'] = (isset($birthday) ? $birthday : '');
                $substitutionarray['__MEMBER_PHOTO__'] = (isset($object->photo) ? $object->photo : '');
                $substitutionarray['__MEMBER_LOGIN__'] = (isset($object->login) ? $object->login : '');
                $substitutionarray['__MEMBER_PASSWORD__'] = (isset($object->pass) ? $object->pass : '');
                $substitutionarray['__MEMBER_PHONE__'] = (isset($object->phone) ? dol_print_phone($object->phone) : '');
                $substitutionarray['__MEMBER_PHONEPRO__'] = (isset($object->phone_perso) ? dol_print_phone($object->phone_perso) : '');
                $substitutionarray['__MEMBER_PHONEMOBILE__'] = (isset($object->phone_mobile) ? dol_print_phone($object->phone_mobile) : '');
                $substitutionarray['__MEMBER_TYPE__'] = (isset($object->type) ? $object->type : '');
                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE__'] = dol_print_date($object->first_subscription_date, 'day');

                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE_RFC__'] = dol_print_date($object->first_subscription_date, 'dayrfc');
                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE_START__'] = (isset($object->first_subscription_date_start) ? dol_print_date($object->first_subscription_date_start, 'day') : '');
                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE_START_RFC__'] = (isset($object->first_subscription_date_start) ? dol_print_date($object->first_subscription_date_start, 'dayrfc') : '');
                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE_END__'] = (isset($object->first_subscription_date_end) ? dol_print_date($object->first_subscription_date_end, 'day') : '');
                $substitutionarray['__MEMBER_FIRST_SUBSCRIPTION_DATE_END_RFC__'] = (isset($object->first_subscription_date_end) ? dol_print_date($object->first_subscription_date_end, 'dayrfc') : '');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE__'] = dol_print_date($object->last_subscription_date, 'day');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE_RFC__'] = dol_print_date($object->last_subscription_date, 'dayrfc');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE_START__'] = dol_print_date($object->last_subscription_date_start, 'day');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE_START_RFC__'] = dol_print_date($object->last_subscription_date_start, 'dayrfc');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE_END__'] = dol_print_date($object->last_subscription_date_end, 'day');
                $substitutionarray['__MEMBER_LAST_SUBSCRIPTION_DATE_END_RFC__'] = dol_print_date($object->last_subscription_date_end, 'dayrfc');
            }

            if (is_object($object) && $object->element == 'societe') {
                '@phan-var-force Societe $object';
                $substitutionarray['__THIRDPARTY_ID__'] = (is_object($object) ? $object->id : '');
                $substitutionarray['__THIRDPARTY_NAME__'] = (is_object($object) ? $object->name : '');
                $substitutionarray['__THIRDPARTY_NAME_ALIAS__'] = (is_object($object) ? $object->name_alias : '');
                $substitutionarray['__THIRDPARTY_CODE_CLIENT__'] = (is_object($object) ? $object->code_client : '');
                $substitutionarray['__THIRDPARTY_CODE_FOURNISSEUR__'] = (is_object($object) ? $object->code_fournisseur : '');
                $substitutionarray['__THIRDPARTY_EMAIL__'] = (is_object($object) ? $object->email : '');
                $substitutionarray['__THIRDPARTY_EMAIL_URLENCODED__'] = urlencode(is_object($object) ? $object->email : '');
                $substitutionarray['__THIRDPARTY_PHONE__'] = (is_object($object) ? dol_print_phone($object->phone) : '');
                $substitutionarray['__THIRDPARTY_FAX__'] = (is_object($object) ? dol_print_phone($object->fax) : '');
                $substitutionarray['__THIRDPARTY_ADDRESS__'] = (is_object($object) ? $object->address : '');
                $substitutionarray['__THIRDPARTY_ZIP__'] = (is_object($object) ? $object->zip : '');
                $substitutionarray['__THIRDPARTY_TOWN__'] = (is_object($object) ? $object->town : '');
                $substitutionarray['__THIRDPARTY_COUNTRY_ID__'] = (is_object($object) ? $object->country_id : '');
                $substitutionarray['__THIRDPARTY_COUNTRY_CODE__'] = (is_object($object) ? $object->country_code : '');
                $substitutionarray['__THIRDPARTY_IDPROF1__'] = (is_object($object) ? $object->idprof1 : '');
                $substitutionarray['__THIRDPARTY_IDPROF2__'] = (is_object($object) ? $object->idprof2 : '');
                $substitutionarray['__THIRDPARTY_IDPROF3__'] = (is_object($object) ? $object->idprof3 : '');
                $substitutionarray['__THIRDPARTY_IDPROF4__'] = (is_object($object) ? $object->idprof4 : '');
                $substitutionarray['__THIRDPARTY_IDPROF5__'] = (is_object($object) ? $object->idprof5 : '');
                $substitutionarray['__THIRDPARTY_IDPROF6__'] = (is_object($object) ? $object->idprof6 : '');
                $substitutionarray['__THIRDPARTY_TVAINTRA__'] = (is_object($object) ? $object->tva_intra : '');
                $substitutionarray['__THIRDPARTY_NOTE_PUBLIC__'] = (is_object($object) ? dol_htmlentitiesbr($object->note_public) : '');
                $substitutionarray['__THIRDPARTY_NOTE_PRIVATE__'] = (is_object($object) ? dol_htmlentitiesbr($object->note_private) : '');
            } elseif (is_object($object->thirdparty)) {
                $substitutionarray['__THIRDPARTY_ID__'] = (is_object($object->thirdparty) ? $object->thirdparty->id : '');
                $substitutionarray['__THIRDPARTY_NAME__'] = (is_object($object->thirdparty) ? $object->thirdparty->name : '');
                $substitutionarray['__THIRDPARTY_NAME_ALIAS__'] = (is_object($object->thirdparty) ? $object->thirdparty->name_alias : '');
                $substitutionarray['__THIRDPARTY_CODE_CLIENT__'] = (is_object($object->thirdparty) ? $object->thirdparty->code_client : '');
                $substitutionarray['__THIRDPARTY_CODE_FOURNISSEUR__'] = (is_object($object->thirdparty) ? $object->thirdparty->code_fournisseur : '');
                $substitutionarray['__THIRDPARTY_EMAIL__'] = (is_object($object->thirdparty) ? $object->thirdparty->email : '');
                $substitutionarray['__THIRDPARTY_EMAIL_URLENCODED__'] = urlencode(is_object($object->thirdparty) ? $object->thirdparty->email : '');
                $substitutionarray['__THIRDPARTY_PHONE__'] = (is_object($object->thirdparty) ? dol_print_phone($object->thirdparty->phone) : '');
                $substitutionarray['__THIRDPARTY_FAX__'] = (is_object($object->thirdparty) ? dol_print_phone($object->thirdparty->fax) : '');
                $substitutionarray['__THIRDPARTY_ADDRESS__'] = (is_object($object->thirdparty) ? $object->thirdparty->address : '');
                $substitutionarray['__THIRDPARTY_ZIP__'] = (is_object($object->thirdparty) ? $object->thirdparty->zip : '');
                $substitutionarray['__THIRDPARTY_TOWN__'] = (is_object($object->thirdparty) ? $object->thirdparty->town : '');
                $substitutionarray['__THIRDPARTY_COUNTRY_ID__'] = (is_object($object->thirdparty) ? $object->thirdparty->country_id : '');
                $substitutionarray['__THIRDPARTY_COUNTRY_CODE__'] = (is_object($object->thirdparty) ? $object->thirdparty->country_code : '');
                $substitutionarray['__THIRDPARTY_IDPROF1__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof1 : '');
                $substitutionarray['__THIRDPARTY_IDPROF2__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof2 : '');
                $substitutionarray['__THIRDPARTY_IDPROF3__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof3 : '');
                $substitutionarray['__THIRDPARTY_IDPROF4__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof4 : '');
                $substitutionarray['__THIRDPARTY_IDPROF5__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof5 : '');
                $substitutionarray['__THIRDPARTY_IDPROF6__'] = (is_object($object->thirdparty) ? $object->thirdparty->idprof6 : '');
                $substitutionarray['__THIRDPARTY_TVAINTRA__'] = (is_object($object->thirdparty) ? $object->thirdparty->tva_intra : '');
                $substitutionarray['__THIRDPARTY_NOTE_PUBLIC__'] = (is_object($object->thirdparty) ? dol_htmlentitiesbr($object->thirdparty->note_public) : '');
                $substitutionarray['__THIRDPARTY_NOTE_PRIVATE__'] = (is_object($object->thirdparty) ? dol_htmlentitiesbr($object->thirdparty->note_private) : '');
            }

            if (is_object($object) && $object->element == 'recruitmentcandidature') {
                '@phan-var-force RecruitmentCandidature $object';
                $substitutionarray['__CANDIDATE_FULLNAME__'] = $object->getFullName($outputlangs);
                $substitutionarray['__CANDIDATE_FIRSTNAME__'] = isset($object->firstname) ? $object->firstname : '';
                $substitutionarray['__CANDIDATE_LASTNAME__'] = isset($object->lastname) ? $object->lastname : '';
            }
            if (is_object($object) && $object->element == 'conferenceorboothattendee') {
                '@phan-var-force ConferenceOrBoothAttendee $object';
                $substitutionarray['__ATTENDEE_FULLNAME__'] = $object->getFullName($outputlangs);
                $substitutionarray['__ATTENDEE_FIRSTNAME__'] = isset($object->firstname) ? $object->firstname : '';
                $substitutionarray['__ATTENDEE_LASTNAME__'] = isset($object->lastname) ? $object->lastname : '';
            }

            if (is_object($object) && $object->element == 'project') {
                '@phan-var-force Project $object';
                $substitutionarray['__PROJECT_ID__'] = $object->id;
                $substitutionarray['__PROJECT_REF__'] = $object->ref;
                $substitutionarray['__PROJECT_NAME__'] = $object->title;
            } elseif (is_object($object)) {
                $project = null;
                if (!empty($object->project)) {
                    $project = $object->project;
                } elseif (!empty($object->projet)) { // Deprecated, for backward compatibility
                    $project = $object->projet;
                }
                if (!is_null($project) && is_object($project)) {
                    $substitutionarray['__PROJECT_ID__'] = $project->id;
                    $substitutionarray['__PROJECT_REF__'] = $project->ref;
                    $substitutionarray['__PROJECT_NAME__'] = $project->title;
                } else {
                    // can substitute variables for project : uses lazy load in "make_substitutions" method
                    $project_id = 0;
                    if (!empty($object->fk_project) && $object->fk_project > 0) {
                        $project_id = $object->fk_project;
                    } elseif (!empty($object->fk_projet) && $object->fk_projet > 0) {
                        $project_id = $object->fk_project;
                    }
                    if ($project_id > 0) {
                        // path:class:method:id
                        $substitutionarray['__PROJECT_ID__@lazyload'] = '/projet/class/project.class.php:Project:fetchAndSetSubstitution:' . $project_id;
                        $substitutionarray['__PROJECT_REF__@lazyload'] = '/projet/class/project.class.php:Project:fetchAndSetSubstitution:' . $project_id;
                        $substitutionarray['__PROJECT_NAME__@lazyload'] = '/projet/class/project.class.php:Project:fetchAndSetSubstitution:' . $project_id;
                    }
                }
            }

            if (is_object($object) && $object->element == 'facture') {
                '@phan-var-force Facture $object';
                $substitutionarray['__INVOICE_SITUATION_NUMBER__'] = isset($object->situation_counter) ? $object->situation_counter : '';
            }
            if (is_object($object) && $object->element == 'shipping') {
                '@phan-var-force Expedition $object';
                $substitutionarray['__SHIPPINGTRACKNUM__'] = $object->tracking_number;
                $substitutionarray['__SHIPPINGTRACKNUMURL__'] = $object->tracking_url;
                $substitutionarray['__SHIPPINGMETHOD__'] = $object->shipping_method;
            }
            if (is_object($object) && $object->element == 'reception') {
                '@phan-var-force Reception $object';
                $substitutionarray['__RECEPTIONTRACKNUM__'] = $object->tracking_number;
                $substitutionarray['__RECEPTIONTRACKNUMURL__'] = $object->tracking_url;
            }

            if (is_object($object) && $object->element == 'contrat' && $object->id > 0 && is_array($object->lines)) {
                '@phan-var-force Contrat $object';
                $dateplannedstart = '';
                $datenextexpiration = '';
                foreach ($object->lines as $line) {
                    if ($line->date_start > $dateplannedstart) {
                        $dateplannedstart = $line->date_start;
                    }
                    if ($line->statut == 4 && $line->date_end && (!$datenextexpiration || $line->date_end < $datenextexpiration)) {
                        $datenextexpiration = $line->date_end;
                    }
                }
                $substitutionarray['__CONTRACT_HIGHEST_PLANNED_START_DATE__'] = dol_print_date($dateplannedstart, 'day');
                $substitutionarray['__CONTRACT_HIGHEST_PLANNED_START_DATE_RFC__'] = dol_print_date($dateplannedstart, 'dayrfc');
                $substitutionarray['__CONTRACT_HIGHEST_PLANNED_START_DATETIME__'] = dol_print_date($dateplannedstart, 'standard');

                $substitutionarray['__CONTRACT_LOWEST_EXPIRATION_DATE__'] = dol_print_date($datenextexpiration, 'day');
                $substitutionarray['__CONTRACT_LOWEST_EXPIRATION_DATE_RFC__'] = dol_print_date($datenextexpiration, 'dayrfc');
                $substitutionarray['__CONTRACT_LOWEST_EXPIRATION_DATETIME__'] = dol_print_date($datenextexpiration, 'standard');
            }
            // add substitution variables for ticket
            if (is_object($object) && $object->element == 'ticket') {
                '@phan-var-force Ticket $object';
                $substitutionarray['__TICKET_TRACKID__'] = $object->track_id;
                $substitutionarray['__TICKET_SUBJECT__'] = $object->subject;
                $substitutionarray['__TICKET_TYPE__'] = $object->type_code;
                $substitutionarray['__TICKET_SEVERITY__'] = $object->severity_code;
                $substitutionarray['__TICKET_CATEGORY__'] = $object->category_code; // For backward compatibility
                $substitutionarray['__TICKET_ANALYTIC_CODE__'] = $object->category_code;
                $substitutionarray['__TICKET_MESSAGE__'] = $object->message;
                $substitutionarray['__TICKET_PROGRESSION__'] = $object->progress;
                $userstat = new User($db);
                if ($object->fk_user_assign > 0) {
                    $userstat->fetch($object->fk_user_assign);
                    $substitutionarray['__TICKET_USER_ASSIGN__'] = dolGetFirstLastname($userstat->firstname, $userstat->lastname);
                }

                if ($object->fk_user_create > 0) {
                    $userstat->fetch($object->fk_user_create);
                    $substitutionarray['__USER_CREATE__'] = dolGetFirstLastname($userstat->firstname, $userstat->lastname);
                }
            }

            // Create dynamic tags for __EXTRAFIELD_FIELD__
            if ($object->table_element && $object->id > 0) {
                if (!is_object($extrafields)) {
                    $extrafields = new ExtraFields($db);
                }
                $extrafields->fetch_name_optionals_label($object->table_element, true);

                if ($object->fetch_optionals() > 0) {
                    if (is_array($extrafields->attributes[$object->table_element]['label']) && count($extrafields->attributes[$object->table_element]['label']) > 0) {
                        foreach ($extrafields->attributes[$object->table_element]['label'] as $key => $label) {
                            if ($extrafields->attributes[$object->table_element]['type'][$key] == 'date') {
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '__'] = dol_print_date($object->array_options['options_' . $key], 'day');
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_LOCALE__'] = dol_print_date($object->array_options['options_' . $key], 'day', 'tzserver', $outputlangs);
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_RFC__'] = dol_print_date($object->array_options['options_' . $key], 'dayrfc');
                            } elseif ($extrafields->attributes[$object->table_element]['type'][$key] == 'datetime') {
                                $datetime = $object->array_options['options_' . $key];
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '__'] = ($datetime != "0000-00-00 00:00:00" ? dol_print_date($datetime, 'dayhour') : '');
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_LOCALE__'] = ($datetime != "0000-00-00 00:00:00" ? dol_print_date($datetime, 'dayhour', 'tzserver', $outputlangs) : '');
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_DAY_LOCALE__'] = ($datetime != "0000-00-00 00:00:00" ? dol_print_date($datetime, 'day', 'tzserver', $outputlangs) : '');
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_RFC__'] = ($datetime != "0000-00-00 00:00:00" ? dol_print_date($datetime, 'dayhourrfc') : '');
                            } elseif ($extrafields->attributes[$object->table_element]['type'][$key] == 'phone') {
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '__'] = dol_print_phone($object->array_options['options_' . $key]);
                            } elseif ($extrafields->attributes[$object->table_element]['type'][$key] == 'price') {
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '__'] = $object->array_options['options_' . $key];
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_FORMATED__'] = price($object->array_options['options_' . $key]);    // For compatibility
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '_FORMATTED__'] = price($object->array_options['options_' . $key]);
                            } elseif ($extrafields->attributes[$object->table_element]['type'][$key] != 'separator') {
                                $substitutionarray['__EXTRAFIELD_' . strtoupper($key) . '__'] = !empty($object->array_options['options_' . $key]) ? $object->array_options['options_' . $key] : '';
                            }
                        }
                    }
                }
            }

            // Complete substitution array with the url to make online payment
            if (empty($substitutionarray['__REF__'])) {
                $paymenturl = '';
            } else {
                // Set the online payment url link into __ONLINE_PAYMENT_URL__ key
                require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/payments.lib.php';
                $outputlangs->loadLangs(array('paypal', 'other'));

                $amounttouse = 0;
                $typeforonlinepayment = 'free';
                if (is_object($object) && $object->element == 'commande') {
                    $typeforonlinepayment = 'order';
                }
                if (is_object($object) && $object->element == 'facture') {
                    $typeforonlinepayment = 'invoice';
                }
                if (is_object($object) && $object->element == 'member') {
                    $typeforonlinepayment = 'member';
                    if (!empty($object->last_subscription_amount)) {
                        $amounttouse = $object->last_subscription_amount;
                    }
                }
                if (is_object($object) && $object->element == 'contrat') {
                    $typeforonlinepayment = 'contract';
                }
                if (is_object($object) && $object->element == 'fichinter') {
                    $typeforonlinepayment = 'ficheinter';
                }

                $url = getOnlinePaymentUrl(0, $typeforonlinepayment, $substitutionarray['__REF__'], $amounttouse);
                $paymenturl = $url;
            }

            if ($object->id > 0) {
                $substitutionarray['__ONLINE_PAYMENT_TEXT_AND_URL__'] = ($paymenturl ? str_replace('\n', "\n", $outputlangs->trans("PredefinedMailContentLink", $paymenturl)) : '');
                $substitutionarray['__ONLINE_PAYMENT_URL__'] = $paymenturl;

                if (getDolGlobalString('PROPOSAL_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'propal') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_PROPOSAL__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_PROPOSAL__'] = '';
                }
                if (getDolGlobalString('ORDER_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'commande') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_ORDER__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_ORDER__'] = '';
                }
                if (getDolGlobalString('INVOICE_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'facture') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_INVOICE__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_INVOICE__'] = '';
                }
                if (getDolGlobalString('CONTRACT_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'contrat') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_CONTRACT__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_CONTRACT__'] = '';
                }
                if (getDolGlobalString('FICHINTER_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'fichinter') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_FICHINTER__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_FICHINTER__'] = '';
                }
                if (getDolGlobalString('SUPPLIER_PROPOSAL_ALLOW_EXTERNAL_DOWNLOAD') && is_object($object) && $object->element == 'supplier_proposal') {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_SUPPLIER_PROPOSAL__'] = $object->getLastMainDocLink($object->element);
                } else {
                    $substitutionarray['__DIRECTDOWNLOAD_URL_SUPPLIER_PROPOSAL__'] = '';
                }

                if (is_object($object) && $object->element == 'propal') {
                    '@phan-var-force Propal $object';
                    $substitutionarray['__URL_PROPOSAL__'] = DOL_MAIN_URL_ROOT . "/comm/propal/card.php?id=" . $object->id;
                    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/signature.lib.php';
                    $substitutionarray['__ONLINE_SIGN_URL__'] = getOnlineSignatureUrl(0, 'proposal', $object->ref, 1, $object);
                }
                if (is_object($object) && $object->element == 'commande') {
                    '@phan-var-force Commande $object';
                    $substitutionarray['__URL_ORDER__'] = DOL_MAIN_URL_ROOT . "/commande/card.php?id=" . $object->id;
                }
                if (is_object($object) && $object->element == 'facture') {
                    '@phan-var-force Facture $object';
                    $substitutionarray['__URL_INVOICE__'] = DOL_MAIN_URL_ROOT . "/compta/facture/card.php?id=" . $object->id;
                }
                if (is_object($object) && $object->element == 'contrat') {
                    '@phan-var-force Contrat $object';
                    $substitutionarray['__URL_CONTRACT__'] = DOL_MAIN_URL_ROOT . "/contrat/card.php?id=" . $object->id;
                    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/signature.lib.php';
                    $substitutionarray['__ONLINE_SIGN_URL__'] = getOnlineSignatureUrl(0, 'contract', $object->ref, 1, $object);
                }
                if (is_object($object) && $object->element == 'fichinter') {
                    '@phan-var-force Fichinter $object';
                    $substitutionarray['__URL_FICHINTER__'] = DOL_MAIN_URL_ROOT . "/fichinter/card.php?id=" . $object->id;
                    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/signature.lib.php';
                    $substitutionarray['__ONLINE_SIGN_FICHINTER_URL__'] = getOnlineSignatureUrl(0, 'fichinter', $object->ref, 1, $object);
                }
                if (is_object($object) && $object->element == 'supplier_proposal') {
                    '@phan-var-force SupplierProposal $object';
                    $substitutionarray['__URL_SUPPLIER_PROPOSAL__'] = DOL_MAIN_URL_ROOT . "/supplier_proposal/card.php?id=" . $object->id;
                }
                if (is_object($object) && $object->element == 'invoice_supplier') {
                    '@phan-var-force FactureFournisseur $object';
                    $substitutionarray['__URL_SUPPLIER_INVOICE__'] = DOL_MAIN_URL_ROOT . "/fourn/facture/card.php?id=" . $object->id;
                }
                if (is_object($object) && $object->element == 'shipping') {
                    '@phan-var-force Expedition $object';
                    $substitutionarray['__URL_SHIPMENT__'] = DOL_MAIN_URL_ROOT . "/expedition/card.php?id=" . $object->id;
                }
            }

            if (is_object($object) && $object->element == 'action') {
                '@phan-var-force ActionComm $object';
                $substitutionarray['__EVENT_LABEL__'] = $object->label;
                $substitutionarray['__EVENT_TYPE__'] = $outputlangs->trans("Action" . $object->type_code);
                $substitutionarray['__EVENT_DATE__'] = dol_print_date($object->datep, 'day', 'auto', $outputlangs);
                $substitutionarray['__EVENT_TIME__'] = dol_print_date($object->datep, 'hour', 'auto', $outputlangs);
            }
        }
    }
    if ((empty($exclude) || !in_array('objectamount', $exclude)) && (empty($include) || in_array('objectamount', $include))) {
        '@phan-var-force Facture|FactureRec $object';
        include_once DOL_DOCUMENT_ROOT . '/core/lib/functionsnumtoword.lib.php';

        $substitutionarray['__DATE_YMD__'] = is_object($object) ? (isset($object->date) ? dol_print_date($object->date, 'day', 0, $outputlangs) : null) : '';
        $substitutionarray['__DATE_DUE_YMD__'] = is_object($object) ? (isset($object->date_lim_reglement) ? dol_print_date($object->date_lim_reglement, 'day', 0, $outputlangs) : null) : '';
        $substitutionarray['__DATE_YMD_TEXT__'] = is_object($object) ? (isset($object->date) ? dol_print_date($object->date, 'daytext', 0, $outputlangs) : null) : '';
        $substitutionarray['__DATE_DUE_YMD_TEXT__'] = is_object($object) ? (isset($object->date_lim_reglement) ? dol_print_date($object->date_lim_reglement, 'daytext', 0, $outputlangs) : null) : '';

        $already_payed_all = 0;
        if (is_object($object) && ($object instanceof Facture)) {
            $already_payed_all = $object->sumpayed + $object->sumdeposit + $object->sumcreditnote;
        }

        $substitutionarray['__AMOUNT_EXCL_TAX__'] = is_object($object) ? $object->total_ht : '';
        $substitutionarray['__AMOUNT_EXCL_TAX_TEXT__'] = is_object($object) ? dol_convertToWord($object->total_ht, $outputlangs, '', true) : '';
        $substitutionarray['__AMOUNT_EXCL_TAX_TEXTCURRENCY__'] = is_object($object) ? dol_convertToWord($object->total_ht, $outputlangs, $conf->currency, true) : '';

        $substitutionarray['__AMOUNT__'] = is_object($object) ? $object->total_ttc : '';
        $substitutionarray['__AMOUNT_TEXT__'] = is_object($object) ? dol_convertToWord($object->total_ttc, $outputlangs, '', true) : '';
        $substitutionarray['__AMOUNT_TEXTCURRENCY__'] = is_object($object) ? dol_convertToWord($object->total_ttc, $outputlangs, $conf->currency, true) : '';

        $substitutionarray['__AMOUNT_REMAIN__'] = is_object($object) ? price2num($object->total_ttc - $already_payed_all, 'MT') : '';

        $substitutionarray['__AMOUNT_VAT__'] = is_object($object) ? (isset($object->total_vat) ? $object->total_vat : $object->total_tva) : '';
        $substitutionarray['__AMOUNT_VAT_TEXT__'] = is_object($object) ? (isset($object->total_vat) ? dol_convertToWord($object->total_vat, $outputlangs, '', true) : dol_convertToWord($object->total_tva, $outputlangs, '', true)) : '';
        $substitutionarray['__AMOUNT_VAT_TEXTCURRENCY__'] = is_object($object) ? (isset($object->total_vat) ? dol_convertToWord($object->total_vat, $outputlangs, $conf->currency, true) : dol_convertToWord($object->total_tva, $outputlangs, $conf->currency, true)) : '';

        if ($onlykey != 2 || $mysoc->useLocalTax(1)) {
            $substitutionarray['__AMOUNT_TAX2__'] = is_object($object) ? $object->total_localtax1 : '';
        }
        if ($onlykey != 2 || $mysoc->useLocalTax(2)) {
            $substitutionarray['__AMOUNT_TAX3__'] = is_object($object) ? $object->total_localtax2 : '';
        }

        // Amount keys formatted in a currency
        $substitutionarray['__AMOUNT_EXCL_TAX_FORMATTED__'] = is_object($object) ? ($object->total_ht ? price($object->total_ht, 0, $outputlangs, 0, -1, -1, $conf->currency) : null) : '';
        $substitutionarray['__AMOUNT_FORMATTED__'] = is_object($object) ? ($object->total_ttc ? price($object->total_ttc, 0, $outputlangs, 0, -1, -1, $conf->currency) : null) : '';
        $substitutionarray['__AMOUNT_REMAIN_FORMATTED__'] = is_object($object) ? ($object->total_ttc ? price($object->total_ttc - $already_payed_all, 0, $outputlangs, 0, -1, -1, $conf->currency) : null) : '';
        $substitutionarray['__AMOUNT_VAT_FORMATTED__'] = is_object($object) ? (isset($object->total_vat) ? price($object->total_vat, 0, $outputlangs, 0, -1, -1, $conf->currency) : ($object->total_tva ? price($object->total_tva, 0, $outputlangs, 0, -1, -1, $conf->currency) : null)) : '';
        if ($onlykey != 2 || $mysoc->useLocalTax(1)) {
            $substitutionarray['__AMOUNT_TAX2_FORMATTED__'] = is_object($object) ? ($object->total_localtax1 ? price($object->total_localtax1, 0, $outputlangs, 0, -1, -1, $conf->currency) : null) : '';
        }
        if ($onlykey != 2 || $mysoc->useLocalTax(2)) {
            $substitutionarray['__AMOUNT_TAX3_FORMATTED__'] = is_object($object) ? ($object->total_localtax2 ? price($object->total_localtax2, 0, $outputlangs, 0, -1, -1, $conf->currency) : null) : '';
        }
        // Amount keys formatted in a currency (with the typo error for backward compatibility)
        if ($onlykey != 2) {
            $substitutionarray['__AMOUNT_EXCL_TAX_FORMATED__'] = $substitutionarray['__AMOUNT_EXCL_TAX_FORMATTED__'];
            $substitutionarray['__AMOUNT_FORMATED__'] = $substitutionarray['__AMOUNT_FORMATTED__'];
            $substitutionarray['__AMOUNT_REMAIN_FORMATED__'] = $substitutionarray['__AMOUNT_REMAIN_FORMATTED__'];
            $substitutionarray['__AMOUNT_VAT_FORMATED__'] = $substitutionarray['__AMOUNT_VAT_FORMATTED__'];
            if ($mysoc instanceof Societe && $mysoc->useLocalTax(1)) {
                $substitutionarray['__AMOUNT_TAX2_FORMATED__'] = $substitutionarray['__AMOUNT_TAX2_FORMATTED__'];
            }
            if ($mysoc instanceof Societe && $mysoc->useLocalTax(2)) {
                $substitutionarray['__AMOUNT_TAX3_FORMATED__'] = $substitutionarray['__AMOUNT_TAX3_FORMATTED__'];
            }
        }

        $substitutionarray['__AMOUNT_MULTICURRENCY__'] = (is_object($object) && isset($object->multicurrency_total_ttc)) ? $object->multicurrency_total_ttc : '';
        $substitutionarray['__AMOUNT_MULTICURRENCY_TEXT__'] = (is_object($object) && isset($object->multicurrency_total_ttc)) ? dol_convertToWord($object->multicurrency_total_ttc, $outputlangs, '', true) : '';
        $substitutionarray['__AMOUNT_MULTICURRENCY_TEXTCURRENCY__'] = (is_object($object) && isset($object->multicurrency_total_ttc)) ? dol_convertToWord($object->multicurrency_total_ttc, $outputlangs, $object->multicurrency_code, true) : '';
        // TODO Add other keys for foreign multicurrency

        // For backward compatibility
        if ($onlykey != 2) {
            $substitutionarray['__TOTAL_TTC__'] = is_object($object) ? $object->total_ttc : '';
            $substitutionarray['__TOTAL_HT__'] = is_object($object) ? $object->total_ht : '';
            $substitutionarray['__TOTAL_VAT__'] = is_object($object) ? (isset($object->total_vat) ? $object->total_vat : $object->total_tva) : '';
        }
    }


    if ((empty($exclude) || !in_array('date', $exclude)) && (empty($include) || in_array('date', $include))) {
        include_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';

        $now = dol_now();

        $tmp = dol_getdate($now, true);
        $tmp2 = dol_get_prev_day($tmp['mday'], $tmp['mon'], $tmp['year']);
        $tmp3 = dol_get_prev_month($tmp['mon'], $tmp['year']);
        $tmp4 = dol_get_next_day($tmp['mday'], $tmp['mon'], $tmp['year']);
        $tmp5 = dol_get_next_month($tmp['mon'], $tmp['year']);

        $daytext = $outputlangs->trans('Day' . $tmp['wday']);

        $substitutionarray = array_merge($substitutionarray, array(
            '__NOW_TMS__' => (string)$now,     // Must be the string that represent the int
            '__NOW_TMS_YMD__' => dol_print_date($now, 'day', 'auto', $outputlangs),
            '__DAY__' => (string)$tmp['mday'],
            '__DAY_TEXT__' => $daytext, // Monday
            '__DAY_TEXT_SHORT__' => dol_trunc($daytext, 3, 'right', 'UTF-8', 1), // Mon
            '__DAY_TEXT_MIN__' => dol_trunc($daytext, 1, 'right', 'UTF-8', 1), // M
            '__MONTH__' => (string)$tmp['mon'],
            '__MONTH_TEXT__' => $outputlangs->trans('Month' . sprintf("%02d", $tmp['mon'])),
            '__MONTH_TEXT_SHORT__' => $outputlangs->trans('MonthShort' . sprintf("%02d", $tmp['mon'])),
            '__MONTH_TEXT_MIN__' => $outputlangs->trans('MonthVeryShort' . sprintf("%02d", $tmp['mon'])),
            '__YEAR__' => (string)$tmp['year'],
            '__PREVIOUS_DAY__' => (string)$tmp2['day'],
            '__PREVIOUS_MONTH__' => (string)$tmp3['month'],
            '__PREVIOUS_YEAR__' => (string)($tmp['year'] - 1),
            '__NEXT_DAY__' => (string)$tmp4['day'],
            '__NEXT_MONTH__' => (string)$tmp5['month'],
            '__NEXT_MONTH_TEXT__' => $outputlangs->trans('Month' . sprintf("%02d", $tmp5['month'])),
            '__NEXT_MONTH_TEXT_SHORT__' => $outputlangs->trans('MonthShort' . sprintf("%02d", $tmp5['month'])),
            '__NEXT_MONTH_TEXT_MIN__' => $outputlangs->trans('MonthVeryShort' . sprintf("%02d", $tmp5['month'])),
            '__NEXT_YEAR__' => (string)($tmp['year'] + 1),
        ));
    }

    if (isModEnabled('multicompany')) {
        $substitutionarray = array_merge($substitutionarray, array('__ENTITY_ID__' => $conf->entity));
    }
    if ((empty($exclude) || !in_array('system', $exclude)) && (empty($include) || in_array('user', $include))) {
        $substitutionarray['__DOL_MAIN_URL_ROOT__'] = DOL_MAIN_URL_ROOT;
        $substitutionarray['__(AnyTranslationKey)__'] = $outputlangs->trans('TranslationOfKey');
        $substitutionarray['__(AnyTranslationKey|langfile)__'] = $outputlangs->trans('TranslationOfKey') . ' (load also language file before)';
        $substitutionarray['__[AnyConstantKey]__'] = $outputlangs->trans('ValueOfConstantKey');
    }

    // Note: The lazyload variables are replaced only during the call by make_substitutions, and only if necessary

    return $substitutionarray;
}

/**
 *  Make substitution into a text string, replacing keys with vals from $substitutionarray (oldval=>newval),
 *  and texts like __(TranslationKey|langfile)__ and __[ConstantKey]__ are also replaced.
 *  Example of usage:
 *  $substitutionarray = getCommonSubstitutionArray($langs, 0, null, $thirdparty);
 *  complete_substitutions_array($substitutionarray, $langs, $thirdparty);
 *  $mesg = make_substitutions($mesg, $substitutionarray, $langs);
 *
 * @param string $text Source string in which we must do substitution
 * @param array<string,string> $substitutionarray Array with key->val to substitute. Example: array('__MYKEY__' => 'MyVal', ...)
 * @param  ?Translate $outputlangs Output language
 * @param int $converttextinhtmlifnecessary 0=Convert only value into HTML if text is already in HTML
 *                                                      1=Will also convert initial $text into HTML if we try to insert one value that is HTML
 * @return string                                      Output string after substitutions
 * @see    complete_substitutions_array(), getCommonSubstitutionArray()
 */
function make_substitutions($text, $substitutionarray, $outputlangs = null, $converttextinhtmlifnecessary = 0)
{
    global $conf, $db, $langs;

    if (!is_array($substitutionarray)) {
        return 'ErrorBadParameterSubstitutionArrayWhenCalling_make_substitutions';
    }

    if (empty($outputlangs)) {
        $outputlangs = $langs;
    }

    // Is initial text HTML or simple text ?
    $msgishtml = 0;
    if (dol_textishtml($text, 1)) {
        $msgishtml = 1;
    }

    // Make substitution for language keys: __(AnyTranslationKey)__ or __(AnyTranslationKey|langfile)__
    if (is_object($outputlangs)) {
        $reg = array();
        while (preg_match('/__\(([^\)]+)\)__/', $text, $reg)) {
            // If key is __(TranslationKey|langfile)__, then force load of langfile.lang
            $tmp = explode('|', $reg[1]);
            if (!empty($tmp[1])) {
                $outputlangs->load($tmp[1]);
            }

            $value = $outputlangs->transnoentitiesnoconv($reg[1]);

            if (empty($converttextinhtmlifnecessary)) {
                // convert $newval into HTML is necessary
                $text = preg_replace('/__\(' . preg_quote($reg[1], '/') . '\)__/', $msgishtml ? dol_htmlentitiesbr($value) : $value, $text);
            } else {
                if (!$msgishtml) {
                    $valueishtml = dol_textishtml($value, 1);
                    //var_dump("valueishtml=".$valueishtml);

                    if ($valueishtml) {
                        $text = dol_htmlentitiesbr($text);
                        $msgishtml = 1;
                    }
                } else {
                    $value = dol_nl2br("$value");
                }

                $text = preg_replace('/__\(' . preg_quote($reg[1], '/') . '\)__/', $value, $text);
            }
        }
    }

    // Make substitution for constant keys.
    // Must be after the substitution of translation, so if the text of translation contains a string __[xxx]__, it is also converted.
    $reg = array();
    while (preg_match('/__\[([^\]]+)\]__/', $text, $reg)) {
        $keyfound = $reg[1];
        if (isASecretKey($keyfound)) {
            $value = '*****forbidden*****';
        } else {
            $value = empty($conf->global->$keyfound) ? '' : $conf->global->$keyfound;
        }

        if (empty($converttextinhtmlifnecessary)) {
            // convert $newval into HTML is necessary
            $text = preg_replace('/__\[' . preg_quote($keyfound, '/') . '\]__/', $msgishtml ? dol_htmlentitiesbr($value) : $value, $text);
        } else {
            if (!$msgishtml) {
                $valueishtml = dol_textishtml($value, 1);

                if ($valueishtml) {
                    $text = dol_htmlentitiesbr($text);
                    $msgishtml = 1;
                }
            } else {
                $value = dol_nl2br("$value");
            }

            $text = preg_replace('/__\[' . preg_quote($keyfound, '/') . '\]__/', $value, $text);
        }
    }

    // Make substitution for array $substitutionarray
    foreach ($substitutionarray as $key => $value) {
        if (!isset($value)) {
            continue; // If value is null, it same than not having substitution key at all into array, we do not replace.
        }

        if (($key == '__USER_SIGNATURE__' || $key == '__SENDEREMAIL_SIGNATURE__') && (getDolGlobalString('MAIN_MAIL_DO_NOT_USE_SIGN'))) {
            $value = ''; // Protection
        }

        if (empty($converttextinhtmlifnecessary)) {
            $text = str_replace("$key", "$value", $text); // We must keep the " to work when value is 123.5 for example
        } else {
            if (!$msgishtml) {
                $valueishtml = dol_textishtml($value, 1);

                if ($valueishtml) {
                    $text = dol_htmlentitiesbr($text);
                    $msgishtml = 1;
                }
            } else {
                $value = dol_nl2br("$value");
            }
            $text = str_replace("$key", "$value", $text); // We must keep the " to work when value is 123.5 for example
        }
    }

    // TODO Implement the lazyload substitution
    /*
    add a loop to scan $substitutionarray:
    For each key ending with '@lazyload', we extract the substitution key 'XXX' and we check inside the $text (the 1st parameter of make_substitutions), if the string XXX exists.
    If no, we don't need to make replacement, so we do nothing.
    If yes, we can make the substitution:

    include_once $path;
    $tmpobj = new $class($db);
    $valuetouseforsubstitution = $tmpobj->$method($id, '__XXX__');
    And make the replacement of "__XXX__@lazyload" with $valuetouseforsubstitution
    */
    $memory_object_list = array();
    foreach ($substitutionarray as $key => $value) {
        $lazy_load_arr = array();
        if (preg_match('/(__[A-Z\_]+__)@lazyload$/', $key, $lazy_load_arr)) {
            if (isset($lazy_load_arr[1]) && !empty($lazy_load_arr[1])) {
                $key_to_substitute = $lazy_load_arr[1];
                if (preg_match('/' . preg_quote($key_to_substitute, '/') . '/', $text)) {
                    $param_arr = explode(':', $value);
                    // path:class:method:id
                    if (count($param_arr) == 4) {
                        $path = $param_arr[0];
                        $class = $param_arr[1];
                        $method = $param_arr[2];
                        $id = (int)$param_arr[3];

                        // load class file and init object list in memory
                        if (!isset($memory_object_list[$class])) {
                            if (dol_is_file(DOL_DOCUMENT_ROOT . $path)) {
                                require_once DOL_DOCUMENT_ROOT . $path;
                                if (class_exists($class)) {
                                    $memory_object_list[$class] = array(
                                        'list' => array(),
                                    );
                                }
                            }
                        }

                        // fetch object and set substitution
                        if (isset($memory_object_list[$class]) && isset($memory_object_list[$class]['list'])) {
                            if (method_exists($class, $method)) {
                                if (!isset($memory_object_list[$class]['list'][$id])) {
                                    $tmpobj = new $class($db);
                                    // @phan-suppress-next-line PhanPluginUnknownObjectMethodCall
                                    $valuetouseforsubstitution = $tmpobj->$method($id, $key_to_substitute);
                                    $memory_object_list[$class]['list'][$id] = $tmpobj;
                                } else {
                                    // @phan-suppress-next-line PhanTypeArraySuspiciousNullable
                                    $tmpobj = $memory_object_list[$class]['list'][$id];
                                    // @phan-suppress-next-line PhanPluginUnknownObjectMethodCall
                                    $valuetouseforsubstitution = $tmpobj->$method($id, $key_to_substitute, true);
                                }

                                $text = str_replace("$key_to_substitute", "$valuetouseforsubstitution", $text); // We must keep the " to work when value is 123.5 for example
                            }
                        }
                    }
                }
            }
        }
    }

    return $text;
}

/**
 *  Complete the $substitutionarray with more entries coming from external module that had set the "substitutions=1" into module_part array.
 *  In this case, method completesubstitutionarray provided by module is called.
 *
 * @param array<string,string> $substitutionarray Array substitution old value => new value value
 * @param Translate $outputlangs Output language
 * @param CommonObject $object Source object
 * @param mixed $parameters Add more parameters (useful to pass product lines)
 * @param string $callfunc What is the name of the custom function that will be called? (default: completesubstitutionarray)
 * @return void
 * @see    make_substitutions()
 */
function complete_substitutions_array(&$substitutionarray, $outputlangs, $object = null, $parameters = null, $callfunc = "completesubstitutionarray")
{
    global $conf, $user;

    require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/files.lib.php';

    // Note: substitution key for each extrafields, using key __EXTRA_XXX__ is already available into the getCommonSubstitutionArray used to build the substitution array.

    // Check if there is external substitution to do, requested by plugins
    $dirsubstitutions = array_merge(array(), (array)$conf->modules_parts['substitutions']);

    foreach ($dirsubstitutions as $reldir) {
        $dir = dol_buildpath($reldir, 0);

        // Check if directory exists
        if (!dol_is_dir($dir)) {
            continue;
        }

        $substitfiles = dol_dir_list($dir, 'files', 0, 'functions_');
        foreach ($substitfiles as $substitfile) {
            $reg = array();
            if (preg_match('/functions_(.*)\.lib\.php/i', $substitfile['name'], $reg)) {
                $module = $reg[1];

                dol_syslog("Library " . $substitfile['name'] . " found into " . $dir);
                // Include the user's functions file
                require_once $dir . $substitfile['name'];
                // Call the user's function, and only if it is defined
                $function_name = $module . "_" . $callfunc;
                if (function_exists($function_name)) {
                    $function_name($substitutionarray, $outputlangs, $object, $parameters);
                }
            }
        }
    }
    if (getDolGlobalString('ODT_ENABLE_ALL_TAGS_IN_SUBSTITUTIONS')) {
        // to list all tags in odt template
        $tags = '';
        foreach ($substitutionarray as $key => $value) {
            $tags .= '{' . $key . '} => ' . $value . "\n";
        }
        $substitutionarray = array_merge($substitutionarray, array('__ALL_TAGS__' => $tags));
    }
}

/**
 *    Format output for start and end date
 *
 * @param int $date_start Start date
 * @param int $date_end End date
 * @param string $format Output format
 * @param Translate $outputlangs Output language
 * @return   void
 */
function print_date_range($date_start, $date_end, $format = '', $outputlangs = null)
{
    print get_date_range($date_start, $date_end, $format, $outputlangs);
}

/**
 *    Format output for start and end date
 *
 * @param int $date_start Start date
 * @param int $date_end End date
 * @param string $format Output date format ('day', 'dayhour', ...)
 * @param Translate $outputlangs Output language
 * @param integer $withparenthesis 1=Add parenthesis, 0=no parenthesis
 * @return   string                          String
 */
function get_date_range($date_start, $date_end, $format = '', $outputlangs = null, $withparenthesis = 1)
{
    global $langs;

    $out = '';

    if (!is_object($outputlangs)) {
        $outputlangs = $langs;
    }

    if ($date_start && $date_end) {
        $out .= ($withparenthesis ? ' (' : '') . $outputlangs->transnoentitiesnoconv('DateFromTo', dol_print_date($date_start, $format, false, $outputlangs), dol_print_date($date_end, $format, false, $outputlangs)) . ($withparenthesis ? ')' : '');
    }
    if ($date_start && !$date_end) {
        $out .= ($withparenthesis ? ' (' : '') . $outputlangs->transnoentitiesnoconv('DateFrom', dol_print_date($date_start, $format, false, $outputlangs)) . ($withparenthesis ? ')' : '');
    }
    if (!$date_start && $date_end) {
        $out .= ($withparenthesis ? ' (' : '') . $outputlangs->transnoentitiesnoconv('DateUntil', dol_print_date($date_end, $format, false, $outputlangs)) . ($withparenthesis ? ')' : '');
    }

    return $out;
}

/**
 * Return firstname and lastname in correct order
 *
 * @param string $firstname Firstname
 * @param string $lastname Lastname
 * @param int $nameorder -1=Auto, 0=Lastname+Firstname, 1=Firstname+Lastname, 2=Firstname, 3=Firstname if defined else lastname, 4=Lastname, 5=Lastname if defined else firstname
 * @return  string                  Firstname + lastname or Lastname + firstname
 */
function dolGetFirstLastname($firstname, $lastname, $nameorder = -1)
{
    global $conf;

    $ret = '';
    // If order not defined, we use the setup
    if ($nameorder < 0) {
        $nameorder = (!getDolGlobalString('MAIN_FIRSTNAME_NAME_POSITION') ? 1 : 0);
    }
    if ($nameorder == 1) {
        $ret .= $firstname;
        if ($firstname && $lastname) {
            $ret .= ' ';
        }
        $ret .= $lastname;
    } elseif ($nameorder == 2 || $nameorder == 3) {
        $ret .= $firstname;
        if (empty($ret) && $nameorder == 3) {
            $ret .= $lastname;
        }
    } else {    // 0, 4 or 5
        $ret .= $lastname;
        if (empty($ret) && $nameorder == 5) {
            $ret .= $firstname;
        }
        if ($nameorder == 0) {
            if ($firstname && $lastname) {
                $ret .= ' ';
            }
            $ret .= $firstname;
        }
    }
    return $ret;
}


/**
 *  Set event message in dol_events session object. Will be output by calling dol_htmloutput_events.
 *  Note: Calling dol_htmloutput_events is done into pages by standard llxFooter() function.
 *  Note: Prefer to use setEventMessages instead.
 *
 * @param string|string[] $mesgs Message string or array
 * @param string $style Which style to use ('mesgs' by default, 'warnings', 'errors')
 * @param int $noduplicate 1 means we do not add the message if already present in session stack
 * @return void
 * @see    dol_htmloutput_events()
 */
function setEventMessage($mesgs, $style = 'mesgs', $noduplicate = 0)
{
    //dol_syslog(__FUNCTION__ . " is deprecated", LOG_WARNING);     This is not deprecated, it is used by setEventMessages function
    if (!is_array($mesgs)) {
        $mesgs = trim((string)$mesgs);
        // If mesgs is a not an empty string
        if ($mesgs) {
            if (!empty($noduplicate) && isset($_SESSION['dol_events'][$style]) && in_array($mesgs, $_SESSION['dol_events'][$style])) {
                return;
            }
            $_SESSION['dol_events'][$style][] = $mesgs;
        }
    } else {
        // If mesgs is an array
        foreach ($mesgs as $mesg) {
            $mesg = trim((string)$mesg);
            if ($mesg) {
                if (!empty($noduplicate) && isset($_SESSION['dol_events'][$style]) && in_array($mesg, $_SESSION['dol_events'][$style])) {
                    return;
                }
                $_SESSION['dol_events'][$style][] = $mesg;
            }
        }
    }
}

/**
 *  Set event messages in dol_events session object. Will be output by calling dol_htmloutput_events.
 *  Note: Calling dol_htmloutput_events is done into pages by standard llxFooter() function.
 *
 * @param string|null $mesg Message string
 * @param string[]|null $mesgs Message array
 * @param string $style Which style to use ('mesgs' by default, 'warnings', 'errors')
 * @param string $messagekey A key to be used to allow the feature "Never show this message during this session again"
 * @param int $noduplicate 1 means we do not add the message if already present in session stack
 * @return void
 * @see    dol_htmloutput_events()
 */
function setEventMessages($mesg, $mesgs, $style = 'mesgs', $messagekey = '', $noduplicate = 0)
{
    if (empty($mesg) && empty($mesgs)) {
        dol_syslog("Try to add a message in stack, but value to add is empty message", LOG_WARNING);
    } else {
        if ($messagekey) {
            // Complete message with a js link to set a cookie "DOLHIDEMESSAGE".$messagekey;
            // TODO
            $mesg .= '';
        }
        if (empty($messagekey) || empty($_COOKIE["DOLHIDEMESSAGE" . $messagekey])) {
            if (!in_array((string)$style, array('mesgs', 'warnings', 'errors'))) {
                dol_print_error(null, 'Bad parameter style=' . $style . ' for setEventMessages');
            }
            if (empty($mesgs)) {
                setEventMessage($mesg, $style, $noduplicate);
            } else {
                if (!empty($mesg) && !in_array($mesg, $mesgs)) {
                    setEventMessage($mesg, $style, $noduplicate); // Add message string if not already into array
                }
                setEventMessage($mesgs, $style, $noduplicate);
            }
        }
    }
}

/**
 *  Advanced sort array by the value of a given key, which produces ascending (default) or descending
 *  output and uses optionally natural case insensitive sorting (which can be optionally case sensitive as well).
 *
 * @param array<string|int,mixed> $array Array to sort (array of array('key1'=>val1,'key2'=>val2,'key3'...) or array of objects)
 * @param string $index Key in array to use for sorting criteria
 * @param string $order Sort order ('asc' or 'desc')
 * @param int<0,1> $natsort If values are strings (I said value not type): 0=Use alphabetical order, 1=use "natural" sort (natsort)
 *                                          If values are numeric (I said value not type): 0=Use numeric order (even if type is string) so use a "natural" sort, 1=use "natural" sort too (same than 0), -1=Force alphabetical order
 * @param int<0,1> $case_sensitive 1=sort is case sensitive, 0=not case sensitive
 * @param int<0,1> $keepindex If 0 and index key of array to sort is a numeric, then index will be rewritten. If 1 or index key is not numeric, key for index is kept after sorting.
 * @return array<string|int,mixed>         Return the sorted array (the source array is not modified !)
 */
function dol_sort_array(&$array, $index, $order = 'asc', $natsort = 0, $case_sensitive = 0, $keepindex = 0)
{
    // Clean parameters
    $order = strtolower($order);

    if (is_array($array)) {
        $sizearray = count($array);
        if ($sizearray > 0) {
            $temp = array();
            foreach (array_keys($array) as $key) {
                if (is_object($array[$key])) {
                    $temp[$key] = empty($array[$key]->$index) ? 0 : $array[$key]->$index;
                } else {
                    // @phan-suppress-next-line PhanTypeArraySuspiciousNullable
                    $temp[$key] = empty($array[$key][$index]) ? 0 : $array[$key][$index];
                }
                if ($natsort == -1) {
                    $temp[$key] = '___' . $temp[$key];        // We add a string at begin of value to force an alpha order when using asort.
                }
            }

            if (empty($natsort) || $natsort == -1) {
                if ($order == 'asc') {
                    asort($temp);
                } else {
                    arsort($temp);
                }
            } else {
                if ($case_sensitive) {
                    natsort($temp);
                } else {
                    natcasesort($temp); // natecasesort is not sensible to case
                }
                if ($order != 'asc') {
                    $temp = array_reverse($temp, true);
                }
            }

            $sorted = array();

            foreach (array_keys($temp) as $key) {
                (is_numeric($key) && empty($keepindex)) ? $sorted[] = $array[$key] : $sorted[$key] = $array[$key];
            }

            return $sorted;
        }
    }
    return $array;
}


/**
 *  Check if a string is in UTF8. Seems similar to utf8_valid() but in pure PHP.
 *
 * @param string $str String to check
 * @return boolean             True if string is UTF8 or ISO compatible with UTF8, False if not (ISO with special non utf8 char or Binary)
 * @see utf8_valid()
 */
function utf8_check($str)
{
    $str = (string)$str;   // Sometimes string is an int.

    // We must use here a binary strlen function (so not dol_strlen)
    $strLength = strlen($str);
    for ($i = 0; $i < $strLength; $i++) {
        if (ord($str[$i]) < 0x80) {
            continue; // 0bbbbbbb
        } elseif ((ord($str[$i]) & 0xE0) == 0xC0) {
            $n = 1; // 110bbbbb
        } elseif ((ord($str[$i]) & 0xF0) == 0xE0) {
            $n = 2; // 1110bbbb
        } elseif ((ord($str[$i]) & 0xF8) == 0xF0) {
            $n = 3; // 11110bbb
        } elseif ((ord($str[$i]) & 0xFC) == 0xF8) {
            $n = 4; // 111110bb
        } elseif ((ord($str[$i]) & 0xFE) == 0xFC) {
            $n = 5; // 1111110b
        } else {
            return false; // Does not match any model
        }
        for ($j = 0; $j < $n; $j++) { // n bytes matching 10bbbbbb follow ?
            if ((++$i == strlen($str)) || ((ord($str[$i]) & 0xC0) != 0x80)) {
                return false;
            }
        }
    }
    return true;
}

/**
 *      Check if a string is in UTF8. Seems similar to utf8_check().
 *
 * @param string $str String to check
 * @return boolean             True if string is valid UTF8 string, false if corrupted
 * @see utf8_check()
 */
function utf8_valid($str)
{
    /* 2 other methods to test if string is utf8
     $validUTF8 = mb_check_encoding($messagetext, 'UTF-8');
     $validUTF8b = ! (false === mb_detect_encoding($messagetext, 'UTF-8', true));
     */
    return preg_match('//u', $str) ? true : false;
}


/**
 *      Check if a string is in ASCII
 *
 * @param string $str String to check
 * @return boolean             True if string is ASCII, False if not (byte value > 0x7F)
 */
function ascii_check($str)
{
    if (function_exists('mb_check_encoding')) {
        //if (mb_detect_encoding($str, 'ASCII', true) return false;
        if (!mb_check_encoding($str, 'ASCII')) {
            return false;
        }
    } else {
        if (preg_match('/[^\x00-\x7f]/', $str)) {
            return false; // Contains a byte > 7f
        }
    }

    return true;
}


/**
 *      Return a string encoded into OS filesystem encoding. This function is used to define
 *      value to pass to filesystem PHP functions.
 *
 * @param string $str String to encode (UTF-8)
 * @return string              Encoded string (UTF-8, ISO-8859-1)
 */
function dol_osencode($str)
{
    $tmp = ini_get("unicode.filesystem_encoding");
    if (empty($tmp) && !empty($_SERVER["WINDIR"])) {
        $tmp = 'iso-8859-1'; // By default for windows
    }
    if (empty($tmp)) {
        $tmp = 'utf-8'; // By default for other
    }
    if (getDolGlobalString('MAIN_FILESYSTEM_ENCODING')) {
        $tmp = getDolGlobalString('MAIN_FILESYSTEM_ENCODING');
    }

    if ($tmp == 'iso-8859-1') {
        return mb_convert_encoding($str, 'ISO-8859-1', 'UTF-8');
    }
    return $str;
}


/**
 *      Return an id or code from a code or id.
 *      Store also Code-Id into a cache to speed up next request on same table and key.
 *
 * @param DoliDB $db Database handler
 * @param string $key Code or Id to get Id or Code
 * @param string $tablename Table name without prefix
 * @param string $fieldkey Field to search the key into
 * @param string $fieldid Field to get
 * @param int $entityfilter Filter by entity
 * @param string $filters Filters to add. WARNING: string must be escaped for SQL and not coming from user input.
 * @return int<-1,max>|string                  ID of code if OK, 0 if key empty, -1 if KO
 * @see $langs->getLabelFromKey
 */
function dol_getIdFromCode($db, $key, $tablename, $fieldkey = 'code', $fieldid = 'id', $entityfilter = 0, $filters = '')
{
    global $conf;

    // If key empty
    if ($key == '') {
        return 0;
    }

    // Check in cache
    if (isset($conf->cache['codeid'][$tablename][$key][$fieldid])) {    // Can be defined to 0 or ''
        return $conf->cache['codeid'][$tablename][$key][$fieldid]; // Found in cache
    }

    dol_syslog('dol_getIdFromCode (value for field ' . $fieldid . ' from key ' . $key . ' not found into cache)', LOG_DEBUG);

    $sql = "SELECT " . $fieldid . " as valuetoget";
    $sql .= " FROM " . MAIN_DB_PREFIX . $tablename;
    $sql .= " WHERE " . $fieldkey . " = '" . $db->escape($key) . "'";
    if (!empty($entityfilter)) {
        $sql .= " AND entity IN (" . getEntity($tablename) . ")";
    }
    if ($filters) {
        $sql .= $filters;
    }

    $resql = $db->query($sql);
    if ($resql) {
        $obj = $db->fetch_object($resql);
        if ($obj) {
            $conf->cache['codeid'][$tablename][$key][$fieldid] = $obj->valuetoget;
        } else {
            $conf->cache['codeid'][$tablename][$key][$fieldid] = '';
        }
        $db->free($resql);

        return $conf->cache['codeid'][$tablename][$key][$fieldid];
    } else {
        return -1;
    }
}

/**
 *  Check if a variable with name $var startx with $text.
 *  Can be used to forge dol_eval() conditions.
 *
 * @param string $var Variable
 * @param string $regextext Text that must be a valid regex string
 * @param int<0,1> $matchrule 1=Test if start with, 0=Test if equal
 * @return boolean|string      True or False, text if bad usage.
 */
function isStringVarMatching($var, $regextext, $matchrule = 1)
{
    if ($matchrule == 1) {
        if ($var == 'mainmenu') {
            global $mainmenu;
            return (preg_match('/^' . $regextext . '/', $mainmenu));
        } elseif ($var == 'leftmenu') {
            global $leftmenu;
            return (preg_match('/^' . $regextext . '/', $leftmenu));
        } else {
            return 'This variable is not accessible with dol_eval';
        }
    } else {
        return 'This value for matchrule is not implemented';
    }
}


/**
 * Verify if condition in string is ok or not
 *
 * @param string $strToEvaluate String with condition to check
 * @param string $onlysimplestring '0' (deprecated, do not use it anymore)=Accept all chars,
 *                                      '1' (most common use)=Accept only simple string with char 'a-z0-9\s^$_+-.*>&|=!?():"\',/@';',
 *                                      '2' (used for example for the compute property of extrafields)=Accept also '[]'
 * @return  boolean                     True or False. Note: It returns also True if $strToEvaluate is ''. False if error
 */
function verifCond($strToEvaluate, $onlysimplestring = '1')
{
    //print $strToEvaluate."<br>\n";
    $rights = true;
    if (isset($strToEvaluate) && $strToEvaluate !== '') {
        //var_dump($strToEvaluate);
        //$rep = dol_eval($strToEvaluate, 1, 0, '1'); // to show the error
        $rep = (int)dol_eval($strToEvaluate, 1, 1, $onlysimplestring); // The dol_eval() must contains all the "global $xxx;" for all variables $xxx found into the string condition
        $rights = $rep && (!is_string($rep) || strpos($rep, 'Bad string syntax to evaluate') === false);
        //var_dump($rights);
    }
    return $rights;
}

/**
 * Replace eval function to add more security.
 * This function is called by verifCond() or trans() and transnoentitiesnoconv().
 *
 * @param string $s String to evaluate
 * @param int<0,1> $returnvalue 0=No return (deprecated, used to execute eval($a=something)). 1=Value of eval is returned (used to eval($something)).
 * @param int<0,1> $hideerrors 1=Hide errors
 * @param string $onlysimplestring '0' (deprecated, do not use it anymore)=Accept all chars,
 *                                          '1' (most common use)=Accept only simple string with char 'a-z0-9\s^$_+-.*>&|=!?():"\',/@';',
 *                                          '2' (used for example for the compute property of extrafields)=Accept also '[]'
 * @return  void|string                     Nothing or return result of eval (even if type can be int, it is safer to assume string and find all potential typing issues as abs(dol_eval(...)).
 * @see verifCond()
 * @phan-suppress PhanPluginUnsafeEval
 */
function dol_eval($s, $returnvalue = 1, $hideerrors = 1, $onlysimplestring = '1')
{
    // Only this global variables can be read by eval function and returned to caller
    global $conf;   // Read of const is done with getDolGlobalString() but we need $conf->currency for example
    global $db, $langs, $user, $website, $websitepage;
    global $action, $mainmenu, $leftmenu;
    global $mysoc;
    global $objectoffield;  // To allow the use of $objectoffield in computed fields

    // Old variables used
    global $object;
    global $obj; // To get $obj used into list when dol_eval() is used for computed fields and $obj is not yet $object

    $isObBufferActive = false;  // When true, the ObBuffer must be cleaned in the exception handler
    if (!in_array($onlysimplestring, array('0', '1', '2'))) {
        return "Bad call of dol_eval. Parameter onlysimplestring must be '0' (deprecated), '1' or '2'";
    }

    try {
        // Test on dangerous char (used for RCE), we allow only characters to make PHP variable testing
        if ($onlysimplestring == '1' || $onlysimplestring == '2') {
            // We must accept with 1: '1 && getDolGlobalInt("doesnotexist1") && getDolGlobalString("MAIN_FEATURES_LEVEL")'
            // We must accept with 1: '$user->hasRight("cabinetmed", "read") && !$object->canvas=="patient@cabinetmed"'
            // We must accept with 2: (($reloadedobj = new Task($db)) && ($reloadedobj->fetchNoCompute($object->id) > 0) && ($secondloadedobj = new Project($db)) && ($secondloadedobj->fetchNoCompute($reloadedobj->fk_project) > 0)) ? $secondloadedobj->ref : "Parent project not found"
            $specialcharsallowed = '^$_+-.*>&|=!?():"\',/@';
            if ($onlysimplestring == '2') {
                $specialcharsallowed .= '[]';
            }
            if (getDolGlobalString('MAIN_ALLOW_UNSECURED_SPECIAL_CHARS_IN_DOL_EVAL')) {
                $specialcharsallowed .= getDolGlobalString('MAIN_ALLOW_UNSECURED_SPECIAL_CHARS_IN_DOL_EVAL');
            }
            if (preg_match('/[^a-z0-9\s' . preg_quote($specialcharsallowed, '/') . ']/i', $s)) {
                if ($returnvalue) {
                    return 'Bad string syntax to evaluate (found chars that are not chars for a simple clean eval string): ' . $s;
                } else {
                    dol_syslog('Bad string syntax to evaluate (found chars that are not chars for a simple clean eval string): ' . $s);
                    return '';
                }
            }
            $savescheck = '';
            $scheck = $s;
            while ($scheck && $savescheck != $scheck) {
                $savescheck = $scheck;
                $scheck = preg_replace('/->[a-zA-Z0-9_]+\(/', '->__METHOD__', $scheck); // accept parenthesis in '...->method(...'
                $scheck = preg_replace('/^\(/', '__PARENTHESIS__ ', $scheck);   // accept parenthesis in '(...'. Must replace with __PARENTHESIS__ with a space after to allow following substitutions
                $scheck = preg_replace('/\s\(/', '__PARENTHESIS__ ', $scheck);  // accept parenthesis in '... ('. Must replace with __PARENTHESIS__ with a space after to allow following substitutions
                $scheck = preg_replace('/^!?[a-zA-Z0-9_]+\(/', '__FUNCTION__', $scheck); // accept parenthesis in 'function(' and '!function('
                $scheck = preg_replace('/\s!?[a-zA-Z0-9_]+\(/', '__FUNCTION__', $scheck); // accept parenthesis in '... function(' and '... !function('
                $scheck = preg_replace('/(\^|\')\(/', '__REGEXSTART__', $scheck);   // To allow preg_match('/^(aaa|bbb)/'...  or  isStringVarMatching('leftmenu', '(aaa|bbb)')
            }
            //print 'scheck='.$scheck." : ".strpos($scheck, '(')."<br>\n";
            if (strpos($scheck, '(') !== false) {
                if ($returnvalue) {
                    return 'Bad string syntax to evaluate (mode ' . $onlysimplestring . ', found call of a function or method without using the direct name of the function): ' . $s;
                } else {
                    dol_syslog('Bad string syntax to evaluate (mode ' . $onlysimplestring . ', found call of a function or method without using the direct name of the function): ' . $s);
                    return '';
                }
            }
            // TODO
            // We can exclude $ char that are not:
            // $db, $langs, $leftmenu, $topmenu, $user, $langs, $objectoffield, $object...,
        }
        if (is_array($s) || $s === 'Array') {
            return 'Bad string syntax to evaluate (value is Array) ' . var_export($s, true);
        }
        if (strpos($s, '::') !== false) {
            if ($returnvalue) {
                return 'Bad string syntax to evaluate (double : char is forbidden): ' . $s;
            } else {
                dol_syslog('Bad string syntax to evaluate (double : char is forbidden): ' . $s);
                return '';
            }
        }
        if (strpos($s, '`') !== false) {
            if ($returnvalue) {
                return 'Bad string syntax to evaluate (backtick char is forbidden): ' . $s;
            } else {
                dol_syslog('Bad string syntax to evaluate (backtick char is forbidden): ' . $s);
                return '';
            }
        }
        if (preg_match('/[^0-9]+\.[^0-9]+/', $s)) { // We refuse . if not between 2 numbers
            if ($returnvalue) {
                return 'Bad string syntax to evaluate (dot char is forbidden): ' . $s;
            } else {
                dol_syslog('Bad string syntax to evaluate (dot char is forbidden): ' . $s);
                return '';
            }
        }

        // We block use of php exec or php file functions
        $forbiddenphpstrings = array('$$');
        $forbiddenphpstrings = array_merge($forbiddenphpstrings, array('_ENV', '_SESSION', '_COOKIE', '_GET', '_POST', '_REQUEST', 'ReflectionFunction'));

        $forbiddenphpfunctions = array("exec", "passthru", "shell_exec", "system", "proc_open", "popen");
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("dol_eval", "executeCLI", "verifCond")); // native dolibarr functions
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("base64_decode", "rawurldecode", "urldecode", "str_rot13", "hex2bin")); // decode string functions used to obfuscated function name
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("fopen", "file_put_contents", "fputs", "fputscsv", "fwrite", "fpassthru", "require", "include", "mkdir", "rmdir", "symlink", "touch", "unlink", "umask"));
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("get_defined_functions", "get_defined_vars", "get_defined_constants", "get_declared_classes"));
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("function", "call_user_func"));
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("require", "include", "require_once", "include_once"));
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("eval", "create_function", "assert", "mb_ereg_replace")); // function with eval capabilities
        $forbiddenphpfunctions = array_merge($forbiddenphpfunctions, array("dol_compress_dir", "dol_decode", "dol_delete_file", "dol_delete_dir", "dol_delete_dir_recursive", "dol_copy", "archiveOrBackupFile")); // more dolibarr functions

        $forbiddenphpmethods = array('invoke', 'invokeArgs');   // Method of ReflectionFunction to execute a function

        $forbiddenphpregex = 'global\s+\$|\b(' . implode('|', $forbiddenphpfunctions) . ')\b';

        $forbiddenphpmethodsregex = '->(' . implode('|', $forbiddenphpmethods) . ')';

        do {
            $oldstringtoclean = $s;
            $s = str_ireplace($forbiddenphpstrings, '__forbiddenstring__', $s);
            $s = preg_replace('/' . $forbiddenphpregex . '/i', '__forbiddenstring__', $s);
            $s = preg_replace('/' . $forbiddenphpmethodsregex . '/i', '__forbiddenstring__', $s);
            //$s = preg_replace('/\$[a-zA-Z0-9_\->\$]+\(/i', '', $s);   // Remove $function( call and $mycall->mymethod(
        } while ($oldstringtoclean != $s);

        if (strpos($s, '__forbiddenstring__') !== false) {
            dol_syslog('Bad string syntax to evaluate: ' . $s, LOG_WARNING);
            if ($returnvalue) {
                return 'Bad string syntax to evaluate: ' . $s;
            } else {
                dol_syslog('Bad string syntax to evaluate: ' . $s);
                return '';
            }
        }

        //print $s."<br>\n";
        if ($returnvalue) {
            if ($hideerrors) {
                ob_start(); // An evaluation has no reason to output data
                $isObBufferActive = true;
                $tmps = @eval('return ' . $s . ';');
                $tmpo = ob_get_clean();
                $isObBufferActive = false;
                if ($tmpo) {
                    print 'Bad string syntax to evaluate. Some data were output when it should not when evaluating: ' . $s;
                }
                return $tmps;
            } else {
                ob_start(); // An evaluation has no reason to output data
                $isObBufferActive = true;
                $tmps = eval('return ' . $s . ';');
                $tmpo = ob_get_clean();
                $isObBufferActive = false;
                if ($tmpo) {
                    print 'Bad string syntax to evaluate. Some data were output when it should not when evaluating: ' . $s;
                }
                return $tmps;
            }
        } else {
            dol_syslog('Do not use anymore dol_eval with param returnvalue=0', LOG_WARNING);
            if ($hideerrors) {
                @eval($s);
            } else {
                eval($s);
            }
            return '';
        }
    } catch (Error $e) {
        if ($isObBufferActive) {
            // Clean up buffer which was left behind due to exception.
            $tmpo = ob_get_clean();
            $isObBufferActive = false;
        }
        $error = 'dol_eval try/catch error : ';
        $error .= $e->getMessage();
        dol_syslog($error, LOG_WARNING);
        if ($returnvalue) {
            return 'Exception during evaluation: ' . $s;
        } else {
            return '';
        }
    }
}

/**
 * Return if var element is ok
 *
 * @param string $element Variable to check
 * @return  boolean                 Return true of variable is not empty
 * @see getElementProperties()
 */
function dol_validElement($element)
{
    return (trim($element) != '');
}

/**
 *  Return img flag of country for a language code or country code.
 *
 * @param string $codelang Language code ('en_IN', 'fr_CA', ...) or ISO Country code on 2 characters in uppercase ('IN', 'FR')
 * @param string $moreatt Add more attribute on img tag (For example 'style="float: right"' or 'class="saturatemedium"')
 * @param int<0,1> $notitlealt No title alt
 * @return string              HTML img string with flag.
 */
function picto_from_langcode($codelang, $moreatt = '', $notitlealt = 0)
{
    if (empty($codelang)) {
        return '';
    }

    if ($codelang == 'auto') {
        return '<span class="fa fa-language"></span>';
    }

    $langtocountryflag = array(
        'ar_AR' => '',
        'ca_ES' => 'catalonia',
        'da_DA' => 'dk',
        'fr_CA' => 'mq',
        'sv_SV' => 'se',
        'sw_SW' => 'unknown',
        'AQ' => 'unknown',
        'CW' => 'unknown',
        'IM' => 'unknown',
        'JE' => 'unknown',
        'MF' => 'unknown',
        'BL' => 'unknown',
        'SX' => 'unknown'
    );

    if (isset($langtocountryflag[$codelang])) {
        $flagImage = $langtocountryflag[$codelang];
    } else {
        $tmparray = explode('_', $codelang);
        $flagImage = empty($tmparray[1]) ? $tmparray[0] : $tmparray[1];
    }

    $morecss = '';
    $reg = array();
    if (preg_match('/class="([^"]+)"/', $moreatt, $reg)) {
        $morecss = $reg[1];
        $moreatt = "";
    }

    // return img_picto_common($codelang, 'flags/'.strtolower($flagImage).'.png', $moreatt, 0, $notitlealt);
    return '<span class="flag-sprite ' . strtolower($flagImage) . ($morecss ? ' ' . $morecss : '') . '"' . ($moreatt ? ' ' . $moreatt : '') . (!$notitlealt ? ' title="' . $codelang . '"' : '') . '></span>';
}

/**
 * Return default language from country code.
 * Return null if not found.
 *
 * @param string $countrycode Country code like 'US', 'FR', 'CA', 'ES', 'IN', 'MX', ...
 * @return  ?string                 Value of locale like 'en_US', 'fr_FR', ... or null if not found
 */
function getLanguageCodeFromCountryCode($countrycode)
{
    global $mysoc;

    if (empty($countrycode)) {
        return null;
    }

    if (strtoupper($countrycode) == 'MQ') {
        return 'fr_CA';
    }
    if (strtoupper($countrycode) == 'SE') {
        return 'sv_SE'; // se_SE is Sami/Sweden, and we want in priority sv_SE for SE country
    }
    if (strtoupper($countrycode) == 'CH') {
        if ($mysoc->country_code == 'FR') {
            return 'fr_CH';
        }
        if ($mysoc->country_code == 'DE') {
            return 'de_CH';
        }
        if ($mysoc->country_code == 'IT') {
            return 'it_CH';
        }
    }

    // Locale list taken from:
    // http://stackoverflow.com/questions/3191664/
    // list-of-all-locales-and-their-short-codes
    $locales = array(
        'af-ZA',
        'am-ET',
        'ar-AE',
        'ar-BH',
        'ar-DZ',
        'ar-EG',
        'ar-IQ',
        'ar-JO',
        'ar-KW',
        'ar-LB',
        'ar-LY',
        'ar-MA',
        'ar-OM',
        'ar-QA',
        'ar-SA',
        'ar-SY',
        'ar-TN',
        'ar-YE',
        //'as-IN',      // Moved after en-IN
        'ba-RU',
        'be-BY',
        'bg-BG',
        'bn-BD',
        //'bn-IN',      // Moved after en-IN
        'bo-CN',
        'br-FR',
        'ca-ES',
        'co-FR',
        'cs-CZ',
        'cy-GB',
        'da-DK',
        'de-AT',
        'de-CH',
        'de-DE',
        'de-LI',
        'de-LU',
        'dv-MV',
        'el-GR',
        'en-AU',
        'en-BZ',
        'en-CA',
        'en-GB',
        'en-IE',
        'en-IN',
        'as-IN',    // as-IN must be after en-IN (en in priority if country is IN)
        'bn-IN',    // bn-IN must be after en-IN (en in priority if country is IN)
        'en-JM',
        'en-MY',
        'en-NZ',
        'en-PH',
        'en-SG',
        'en-TT',
        'en-US',
        'en-ZA',
        'en-ZW',
        'es-AR',
        'es-BO',
        'es-CL',
        'es-CO',
        'es-CR',
        'es-DO',
        'es-EC',
        'es-ES',
        'es-GT',
        'es-HN',
        'es-MX',
        'es-NI',
        'es-PA',
        'es-PE',
        'es-PR',
        'es-PY',
        'es-SV',
        'es-US',
        'es-UY',
        'es-VE',
        'et-EE',
        'eu-ES',
        'fa-IR',
        'fi-FI',
        'fo-FO',
        'fr-BE',
        'fr-CA',
        'fr-CH',
        'fr-FR',
        'fr-LU',
        'fr-MC',
        'fy-NL',
        'ga-IE',
        'gd-GB',
        'gl-ES',
        'gu-IN',
        'he-IL',
        'hi-IN',
        'hr-BA',
        'hr-HR',
        'hu-HU',
        'hy-AM',
        'id-ID',
        'ig-NG',
        'ii-CN',
        'is-IS',
        'it-CH',
        'it-IT',
        'ja-JP',
        'ka-GE',
        'kk-KZ',
        'kl-GL',
        'km-KH',
        'kn-IN',
        'ko-KR',
        'ky-KG',
        'lb-LU',
        'lo-LA',
        'lt-LT',
        'lv-LV',
        'mi-NZ',
        'mk-MK',
        'ml-IN',
        'mn-MN',
        'mr-IN',
        'ms-BN',
        'ms-MY',
        'mt-MT',
        'nb-NO',
        'ne-NP',
        'nl-BE',
        'nl-NL',
        'nn-NO',
        'oc-FR',
        'or-IN',
        'pa-IN',
        'pl-PL',
        'ps-AF',
        'pt-BR',
        'pt-PT',
        'rm-CH',
        'ro-MD',
        'ro-RO',
        'ru-RU',
        'rw-RW',
        'sa-IN',
        'se-FI',
        'se-NO',
        'se-SE',
        'si-LK',
        'sk-SK',
        'sl-SI',
        'sq-AL',
        'sv-FI',
        'sv-SE',
        'sw-KE',
        'ta-IN',
        'te-IN',
        'th-TH',
        'tk-TM',
        'tn-ZA',
        'tr-TR',
        'tt-RU',
        'ug-CN',
        'uk-UA',
        'ur-PK',
        'vi-VN',
        'wo-SN',
        'xh-ZA',
        'yo-NG',
        'zh-CN',
        'zh-HK',
        'zh-MO',
        'zh-SG',
        'zh-TW',
        'zu-ZA',
    );

    $buildprimarykeytotest = strtolower($countrycode) . '-' . strtoupper($countrycode);
    if (in_array($buildprimarykeytotest, $locales)) {
        return strtolower($countrycode) . '_' . strtoupper($countrycode);
    }

    if (function_exists('locale_get_primary_language') && function_exists('locale_get_region')) {    // Need extension php-intl
        foreach ($locales as $locale) {
            $locale_language = locale_get_primary_language($locale);
            $locale_region = locale_get_region($locale);
            if (strtoupper($countrycode) == $locale_region) {
                //var_dump($locale.' - '.$locale_language.' - '.$locale_region);
                return strtolower($locale_language) . '_' . strtoupper($locale_region);
            }
        }
    } else {
        dol_syslog("Warning Extension php-intl is not available", LOG_WARNING);
    }

    return null;
}

/**
 * Split a string with 2 keys into key array.
 * For example: "A=1;B=2;C=2" is exploded into array('A'=>'1','B'=>'2','C'=>'3')
 *
 * @param   ?string $string String to explode
 * @param string $delimiter Delimiter between each couple of data. Example: ';' or '[\n;]+' or '(\n\r|\r|\n|;)'
 * @param string $kv Delimiter between key and value
 * @return  array<string,string>    Array of data exploded
 */
function dolExplodeIntoArray($string, $delimiter = ';', $kv = '=')
{
    if (is_null($string)) {
        return array();
    }

    if (preg_match('/^\[.*\]$/sm', $delimiter) || preg_match('/^\(.*\)$/sm', $delimiter)) {
        // This is a regex string
        $newdelimiter = $delimiter;
    } else {
        // This is a simple string
        // @phan-suppress-next-line PhanPluginSuspiciousParamPositionInternal
        $newdelimiter = preg_quote($delimiter, '/');
    }

    if ($a = preg_split('/' . $newdelimiter . '/', $string)) {
        $ka = array();
        foreach ($a as $s) { // each part
            if ($s) {
                if ($pos = strpos($s, $kv)) { // key/value delimiter
                    $ka[trim(substr($s, 0, $pos))] = trim(substr($s, $pos + strlen($kv)));
                } else { // key delimiter not found
                    $ka[] = trim($s);
                }
            }
        }
        return $ka;
    }

    return array();
}

/**
 * Return getmypid() or random PID when function is disabled
 * Some web hosts disable this php function for security reasons
 * and sometimes we can't redeclare function.
 *
 * @return  int
 */
function dol_getmypid()
{
    if (!function_exists('getmypid')) {
        return mt_rand(99900000, 99965535);
    } else {
        return getmypid();  // May be a number on 64 bits (depending on OS)
    }
}


/**
 * Generate natural SQL search string for a criteria (this criteria can be tested on one or several fields)
 *
 * @param string|string[] $fields String or array of strings, filled with the name of all fields in the SQL query we must check (combined with a OR). Example: array("p.field1","p.field2")
 * @param string $value The value to look for.
 *                                      If param $mode is 0, can contains several keywords separated with a space or |
 *                                      like "keyword1 keyword2" = We want record field like keyword1 AND field like keyword2
 *                                      or like "keyword1|keyword2" = We want record field like keyword1 OR field like keyword2
 *                                      If param $mode is 1, can contains an operator <, > or = like "<10" or ">=100.5 < -1000"
 *                                      If param $mode is 2 or -2, can contains a list of int id separated by comma like "1,3,4"
 *                                      If param $mode is 3 or -3, can contains a list of string separated by comma like "a,b,c".
 * @param integer $mode 0=value is list of keyword strings,
 *                                      1=value is a numeric test (Example ">5.5 <10"),
 *                                      2=value is a list of ID separated with comma (Example '1,3,4'), -2 is for exclude list,
 *                                      3=value is list of string separated with comma (Example 'text 1,text 2'), -3 if for exclude list,
 *                                      4=value is a list of ID separated with comma (Example '2,7') to be used to search into a multiselect string '1,2,3,4'
 * @param integer $nofirstand 1=Do not output the first 'AND'
 * @return  string          $res        The statement to append to the SQL query
 * @see dolSqlDateFilter()
 * @see forgeSQLFromUniversalSearchCriteria()
 */
function natural_search($fields, $value, $mode = 0, $nofirstand = 0)
{
    global $db, $langs;

    $value = trim($value);

    if ($mode == 0) {
        $value = preg_replace('/\*/', '%', $value); // Replace * with %
    }
    if ($mode == 1) {
        $value = preg_replace('/([!<>=]+)\s+([0-9' . preg_quote($langs->trans("DecimalSeparator"), '/') . '\-])/', '\1\2', $value); // Clean string '< 10' into '<10' so we can then explode on space to get all tests to do
    }

    $value = preg_replace('/\s*\|\s*/', '|', $value);

    $crits = explode(' ', $value);
    $res = '';
    if (!is_array($fields)) {
        $fields = array($fields);
    }

    $i1 = 0;    // count the nb of and criteria added (all fields / criteria)
    foreach ($crits as $crit) {     // Loop on each AND criteria
        $crit = trim($crit);
        $i2 = 0;    // count the nb of valid criteria added for this this first criteria
        $newres = '';
        foreach ($fields as $field) {
            if ($mode == 1) {
                $tmpcrits = explode('|', $crit);
                $i3 = 0;    // count the nb of valid criteria added for this current field
                foreach ($tmpcrits as $tmpcrit) {
                    if ($tmpcrit !== '0' && empty($tmpcrit)) {
                        continue;
                    }
                    $tmpcrit = trim($tmpcrit);

                    $newres .= (($i2 > 0 || $i3 > 0) ? ' OR ' : '');

                    $operator = '=';
                    $newcrit = preg_replace('/([!<>=]+)/', '', $tmpcrit);

                    $reg = array();
                    preg_match('/([!<>=]+)/', $tmpcrit, $reg);
                    if (!empty($reg[1])) {
                        $operator = $reg[1];
                    }
                    if ($newcrit != '') {
                        $numnewcrit = price2num($newcrit);
                        if (is_numeric($numnewcrit)) {
                            $newres .= $field . ' ' . $operator . ' ' . ((float)$numnewcrit); // should be a numeric
                        } else {
                            $newres .= '1 = 2'; // force false, we received a corrupted data
                        }
                        $i3++; // a criteria was added to string
                    }
                }
                $i2++; // a criteria for 1 more field was added to string
            } elseif ($mode == 2 || $mode == -2) {
                $crit = preg_replace('/[^0-9,]/', '', $crit); // ID are always integer
                $newres .= ($i2 > 0 ? ' OR ' : '') . $field . " " . ($mode == -2 ? 'NOT ' : '');
                $newres .= $crit ? "IN (" . $db->sanitize($db->escape($crit)) . ")" : "IN (0)";
                if ($mode == -2) {
                    $newres .= ' OR ' . $field . ' IS NULL';
                }
                $i2++; // a criteria for 1 more field was added to string
            } elseif ($mode == 3 || $mode == -3) {
                $tmparray = explode(',', $crit);
                if (count($tmparray)) {
                    $listofcodes = '';
                    foreach ($tmparray as $val) {
                        $val = trim($val);
                        if ($val) {
                            $listofcodes .= ($listofcodes ? ',' : '');
                            $listofcodes .= "'" . $db->escape($val) . "'";
                        }
                    }
                    $newres .= ($i2 > 0 ? ' OR ' : '') . $field . " " . ($mode == -3 ? 'NOT ' : '') . "IN (" . $db->sanitize($listofcodes, 1) . ")";
                    $i2++; // a criteria for 1 more field was added to string
                }
                if ($mode == -3) {
                    $newres .= ' OR ' . $field . ' IS NULL';
                }
            } elseif ($mode == 4) {
                $tmparray = explode(',', $crit);
                if (count($tmparray)) {
                    $listofcodes = '';
                    foreach ($tmparray as $val) {
                        $val = trim($val);
                        if ($val) {
                            $newres .= ($i2 > 0 ? " OR (" : "(") . $field . " LIKE '" . $db->escape($val) . ",%'";
                            $newres .= ' OR ' . $field . " = '" . $db->escape($val) . "'";
                            $newres .= ' OR ' . $field . " LIKE '%," . $db->escape($val) . "'";
                            $newres .= ' OR ' . $field . " LIKE '%," . $db->escape($val) . ",%'";
                            $newres .= ')';
                            $i2++; // a criteria for 1 more field was added to string (we can add several criteria for the same field as it is a multiselect search criteria)
                        }
                    }
                }
            } else { // $mode=0
                $tmpcrits = explode('|', $crit);
                $i3 = 0;    // count the nb of valid criteria added for the current couple criteria/field
                foreach ($tmpcrits as $tmpcrit) {   // loop on each OR criteria
                    if ($tmpcrit !== '0' && empty($tmpcrit)) {
                        continue;
                    }
                    $tmpcrit = trim($tmpcrit);

                    if ($tmpcrit == '^$' || strpos($crit, '!') === 0) { // If we search empty, we must combined different OR fields with AND
                        $newres .= (($i2 > 0 || $i3 > 0) ? ' AND ' : '');
                    } else {
                        $newres .= (($i2 > 0 || $i3 > 0) ? ' OR ' : '');
                    }

                    if (preg_match('/\.(id|rowid)$/', $field)) {    // Special case for rowid that is sometimes a ref so used as a search field
                        $newres .= $field . " = " . (is_numeric($tmpcrit) ? ((float)$tmpcrit) : '0');
                    } else {
                        $tmpcrit2 = $tmpcrit;
                        $tmpbefore = '%';
                        $tmpafter = '%';
                        $tmps = '';

                        if (preg_match('/^!/', $tmpcrit)) {
                            $tmps .= $field . " NOT LIKE "; // ! as exclude character
                            $tmpcrit2 = preg_replace('/^!/', '', $tmpcrit2);
                        } else {
                            $tmps .= $field . " LIKE ";
                        }
                        $tmps .= "'";

                        if (preg_match('/^[\^\$]/', $tmpcrit)) {
                            $tmpbefore = '';
                            $tmpcrit2 = preg_replace('/^[\^\$]/', '', $tmpcrit2);
                        }
                        if (preg_match('/[\^\$]$/', $tmpcrit)) {
                            $tmpafter = '';
                            $tmpcrit2 = preg_replace('/[\^\$]$/', '', $tmpcrit2);
                        }

                        if ($tmpcrit2 == '' || preg_match('/^!/', $tmpcrit)) {
                            $tmps = "(" . $tmps;
                        }
                        $newres .= $tmps;
                        $newres .= $tmpbefore;
                        $newres .= $db->escape($tmpcrit2);
                        $newres .= $tmpafter;
                        $newres .= "'";
                        if ($tmpcrit2 == '' || preg_match('/^!/', $tmpcrit)) {
                            $newres .= " OR " . $field . " IS NULL)";
                        }
                    }

                    $i3++;
                }

                $i2++; // a criteria for 1 more field was added to string
            }
        }

        if ($newres) {
            $res = $res . ($res ? ' AND ' : '') . ($i2 > 1 ? '(' : '') . $newres . ($i2 > 1 ? ')' : '');
        }
        $i1++;
    }
    $res = ($nofirstand ? "" : " AND ") . "(" . $res . ")";

    return $res;
}

/**
 * Return the filename of file to get the thumbs
 *
 * @param string $file Original filename (full or relative path)
 * @param string $extName Extension to differentiate thumb file name ('', '_small', '_mini')
 * @param string $extImgTarget Force image extension for thumbs. Use '' to keep same extension than original image (default).
 * @return  string                  New file name (full or relative path, including the thumbs/). May be the original path if no thumb can exists.
 */
function getImageFileNameForSize($file, $extName, $extImgTarget = '')
{
    $dirName = dirname($file);
    if ($dirName == '.') {
        $dirName = '';
    }

    $fileName = preg_replace('/(\.gif|\.jpeg|\.jpg|\.png|\.bmp|\.webp)$/i', '', $file); // We remove extension, whatever is its case
    $fileName = basename($fileName);

    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.jpg$/i', $file) ? '.jpg' : '');
    }
    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.jpeg$/i', $file) ? '.jpeg' : '');
    }
    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.gif$/i', $file) ? '.gif' : '');
    }
    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.png$/i', $file) ? '.png' : '');
    }
    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.bmp$/i', $file) ? '.bmp' : '');
    }
    if (empty($extImgTarget)) {
        $extImgTarget = (preg_match('/\.webp$/i', $file) ? '.webp' : '');
    }

    if (!$extImgTarget) {
        return $file;
    }

    $subdir = '';
    if ($extName) {
        $subdir = 'thumbs/';
    }

    return ($dirName ? $dirName . '/' : '') . $subdir . $fileName . $extName . $extImgTarget; // New filename for thumb
}


/**
 * Return URL we can use for advanced preview links
 *
 * @param string $modulepart propal, facture, facture_fourn, ...
 * @param string $relativepath Relative path of docs.
 * @param int<0,1> $alldata Return array with all components (1 is recommended, then use a simple a href link with the class, target and mime attribute added. 'documentpreview' css class is handled by jquery code into main.inc.php)
 * @param string $param More param on http links
 * @return  string|array{}|array{target:string,css:string,url:string,mime:string}   Output string with href link or array with all components of link
 */
function getAdvancedPreviewUrl($modulepart, $relativepath, $alldata = 0, $param = '')
{
    global $conf, $langs;

    if (empty($conf->use_javascript_ajax)) {
        return '';
    }

    $isAllowedForPreview = dolIsAllowedForPreview($relativepath);

    if ($alldata == 1) {
        if ($isAllowedForPreview) {
            return array('target' => '_blank', 'css' => 'documentpreview', 'url' => constant('BASE_URL') . '/document.php?modulepart=' . urlencode($modulepart) . '&attachment=0&file=' . urlencode($relativepath) . ($param ? '&' . $param : ''), 'mime' => dol_mimetype($relativepath));
        } else {
            return array();
        }
    }

    // old behavior, return a string
    if ($isAllowedForPreview) {
        $tmpurl = constant('BASE_URL') . '/document.php?modulepart=' . urlencode($modulepart) . '&attachment=0&file=' . urlencode($relativepath) . ($param ? '&' . $param : '');
        $title = $langs->transnoentities("Preview");
        //$title = '%27-alert(document.domain)-%27';
        //$tmpurl = 'file='.urlencode("'-alert(document.domain)-'_small.jpg");

        // We need to urlencode the parameter after the dol_escape_js($tmpurl) because  $tmpurl may contain n url with param file=abc%27def if file has a ' inside.
        // and when we click on href with this javascript string, a urlcode is done by browser, converted the %27 of file param
        return 'javascript:document_preview(\'' . urlencode(dol_escape_js($tmpurl)) . '\', \'' . urlencode(dol_mimetype($relativepath)) . '\', \'' . urlencode(dol_escape_js($title)) . '\')';
    } else {
        return '';
    }
}


/**
 * Make content of an input box selected when we click into input field.
 *
 * @param string $htmlname Id of html object ('#idvalue' or '.classvalue')
 * @param string $addlink Add a 'link to' after
 * @param string $textonlink Text to show on link or 'image'
 * @return string
 */
function ajax_autoselect($htmlname, $addlink = '', $textonlink = 'Link')
{
    global $langs;
    $out = '<script nonce="' . getNonce() . '">
               jQuery(document).ready(function () {
				    jQuery("' . ((strpos($htmlname, '.') === 0 ? '' : '#') . $htmlname) . '").click(function() { jQuery(this).select(); } );
				});
		    </script>';
    if ($addlink) {
        if ($textonlink === 'image') {
            $out .= ' <a href="' . $addlink . '" target="_blank" rel="noopener noreferrer">' . img_picto('', 'globe') . '</a>';
        } else {
            $out .= ' <a href="' . $addlink . '" target="_blank" rel="noopener noreferrer">' . $langs->trans("Link") . '</a>';
        }
    }
    return $out;
}

/**
 *  Return if a file is qualified for preview
 *
 * @param string $file Filename we looking for information
 * @return int<0,1>            1 If allowed, 0 otherwise
 * @see    dol_mimetype(), image_format_supported() from images.lib.php
 */
function dolIsAllowedForPreview($file)
{
    // Check .noexe extension in filename
    if (preg_match('/\.noexe$/i', $file)) {
        return 0;
    }

    // Check mime types
    $mime_preview = array('bmp', 'jpeg', 'png', 'gif', 'tiff', 'pdf', 'plain', 'css', 'webp');
    if (getDolGlobalString('MAIN_ALLOW_SVG_FILES_AS_IMAGES')) {
        $mime_preview[] = 'svg+xml';
    }
    //$mime_preview[]='vnd.oasis.opendocument.presentation';
    //$mime_preview[]='archive';
    $num_mime = array_search(dol_mimetype($file, '', 1), $mime_preview);
    if ($num_mime !== false) {
        return 1;
    }

    // By default, not allowed for preview
    return 0;
}


/**
 *  Return MIME type of a file from its name with extension.
 *
 * @param string $file Filename we looking for MIME type
 * @param string $default Default mime type if extension not found in known list
 * @param int<0,4> $mode 0=Return full mime, 1=otherwise short mime string, 2=image for mime type, 3=source language, 4=css of font fa
 * @return string              Return a mime type family (text/xxx, application/xxx, image/xxx, audio, video, archive)
 * @see    dolIsAllowedForPreview(), image_format_supported() from images.lib.php
 */
function dol_mimetype($file, $default = 'application/octet-stream', $mode = 0)
{
    $mime = $default;
    $imgmime = 'other.png';
    $famime = 'file-o';
    $srclang = '';

    $tmpfile = preg_replace('/\.noexe$/', '', $file);

    // Plain text files
    if (preg_match('/\.txt$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.rtx$/i', $tmpfile)) {
        $mime = 'text/richtext';
        $imgmime = 'text.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.csv$/i', $tmpfile)) {
        $mime = 'text/csv';
        $imgmime = 'text.png';
        $famime = 'file-csv';
    } elseif (preg_match('/\.tsv$/i', $tmpfile)) {
        $mime = 'text/tab-separated-values';
        $imgmime = 'text.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.(cf|conf|log)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.ini$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'ini';
        $famime = 'file-alt';
    } elseif (preg_match('/\.md$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'md';
        $famime = 'file-alt';
    } elseif (preg_match('/\.css$/i', $tmpfile)) {
        $mime = 'text/css';
        $imgmime = 'css.png';
        $srclang = 'css';
        $famime = 'file-alt';
    } elseif (preg_match('/\.lang$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'lang';
        $famime = 'file-alt';
    } elseif (preg_match('/\.(crt|cer|key|pub)$/i', $tmpfile)) {    // Certificate files
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.(html|htm|shtml)$/i', $tmpfile)) {     // XML based (HTML/XML/XAML)
        $mime = 'text/html';
        $imgmime = 'html.png';
        $srclang = 'html';
        $famime = 'file-alt';
    } elseif (preg_match('/\.(xml|xhtml)$/i', $tmpfile)) {
        $mime = 'text/xml';
        $imgmime = 'other.png';
        $srclang = 'xml';
        $famime = 'file-alt';
    } elseif (preg_match('/\.xaml$/i', $tmpfile)) {
        $mime = 'text/xml';
        $imgmime = 'other.png';
        $srclang = 'xaml';
        $famime = 'file-alt';
    } elseif (preg_match('/\.bas$/i', $tmpfile)) {                  // Languages
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'bas';
        $famime = 'file-code';
    } elseif (preg_match('/\.(c)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'c';
        $famime = 'file-code';
    } elseif (preg_match('/\.(cpp)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'cpp';
        $famime = 'file-code';
    } elseif (preg_match('/\.cs$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'cs';
        $famime = 'file-code';
    } elseif (preg_match('/\.(h)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'h';
        $famime = 'file-code';
    } elseif (preg_match('/\.(java|jsp)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'java';
        $famime = 'file-code';
    } elseif (preg_match('/\.php([0-9]{1})?$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'php.png';
        $srclang = 'php';
        $famime = 'file-code';
    } elseif (preg_match('/\.phtml$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'php.png';
        $srclang = 'php';
        $famime = 'file-code';
    } elseif (preg_match('/\.(pl|pm)$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'pl.png';
        $srclang = 'perl';
        $famime = 'file-code';
    } elseif (preg_match('/\.sql$/i', $tmpfile)) {
        $mime = 'text/plain';
        $imgmime = 'text.png';
        $srclang = 'sql';
        $famime = 'file-code';
    } elseif (preg_match('/\.js$/i', $tmpfile)) {
        $mime = 'text/x-javascript';
        $imgmime = 'jscript.png';
        $srclang = 'js';
        $famime = 'file-code';
    } elseif (preg_match('/\.odp$/i', $tmpfile)) {                  // Open office
        $mime = 'application/vnd.oasis.opendocument.presentation';
        $imgmime = 'ooffice.png';
        $famime = 'file-powerpoint';
    } elseif (preg_match('/\.ods$/i', $tmpfile)) {
        $mime = 'application/vnd.oasis.opendocument.spreadsheet';
        $imgmime = 'ooffice.png';
        $famime = 'file-excel';
    } elseif (preg_match('/\.odt$/i', $tmpfile)) {
        $mime = 'application/vnd.oasis.opendocument.text';
        $imgmime = 'ooffice.png';
        $famime = 'file-word';
    } elseif (preg_match('/\.mdb$/i', $tmpfile)) {                  // MS Office
        $mime = 'application/msaccess';
        $imgmime = 'mdb.png';
        $famime = 'file';
    } elseif (preg_match('/\.doc[xm]?$/i', $tmpfile)) {
        $mime = 'application/msword';
        $imgmime = 'doc.png';
        $famime = 'file-word';
    } elseif (preg_match('/\.dot[xm]?$/i', $tmpfile)) {
        $mime = 'application/msword';
        $imgmime = 'doc.png';
        $famime = 'file-word';
    } elseif (preg_match('/\.xlt(x)?$/i', $tmpfile)) {
        $mime = 'application/vnd.ms-excel';
        $imgmime = 'xls.png';
        $famime = 'file-excel';
    } elseif (preg_match('/\.xla(m)?$/i', $tmpfile)) {
        $mime = 'application/vnd.ms-excel';
        $imgmime = 'xls.png';
        $famime = 'file-excel';
    } elseif (preg_match('/\.xls$/i', $tmpfile)) {
        $mime = 'application/vnd.ms-excel';
        $imgmime = 'xls.png';
        $famime = 'file-excel';
    } elseif (preg_match('/\.xls[bmx]$/i', $tmpfile)) {
        $mime = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        $imgmime = 'xls.png';
        $famime = 'file-excel';
    } elseif (preg_match('/\.pps[mx]?$/i', $tmpfile)) {
        $mime = 'application/vnd.ms-powerpoint';
        $imgmime = 'ppt.png';
        $famime = 'file-powerpoint';
    } elseif (preg_match('/\.ppt[mx]?$/i', $tmpfile)) {
        $mime = 'application/x-mspowerpoint';
        $imgmime = 'ppt.png';
        $famime = 'file-powerpoint';
    } elseif (preg_match('/\.pdf$/i', $tmpfile)) {                  // Other
        $mime = 'application/pdf';
        $imgmime = 'pdf.png';
        $famime = 'file-pdf';
    } elseif (preg_match('/\.bat$/i', $tmpfile)) {                  // Scripts
        $mime = 'text/x-bat';
        $imgmime = 'script.png';
        $srclang = 'dos';
        $famime = 'file-code';
    } elseif (preg_match('/\.sh$/i', $tmpfile)) {
        $mime = 'text/x-sh';
        $imgmime = 'script.png';
        $srclang = 'bash';
        $famime = 'file-code';
    } elseif (preg_match('/\.ksh$/i', $tmpfile)) {
        $mime = 'text/x-ksh';
        $imgmime = 'script.png';
        $srclang = 'bash';
        $famime = 'file-code';
    } elseif (preg_match('/\.bash$/i', $tmpfile)) {
        $mime = 'text/x-bash';
        $imgmime = 'script.png';
        $srclang = 'bash';
        $famime = 'file-code';
    } elseif (preg_match('/\.ico$/i', $tmpfile)) {                  // Images
        $mime = 'image/x-icon';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.(jpg|jpeg)$/i', $tmpfile)) {
        $mime = 'image/jpeg';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.png$/i', $tmpfile)) {
        $mime = 'image/png';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.gif$/i', $tmpfile)) {
        $mime = 'image/gif';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.bmp$/i', $tmpfile)) {
        $mime = 'image/bmp';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.(tif|tiff)$/i', $tmpfile)) {
        $mime = 'image/tiff';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.svg$/i', $tmpfile)) {
        $mime = 'image/svg+xml';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.webp$/i', $tmpfile)) {
        $mime = 'image/webp';
        $imgmime = 'image.png';
        $famime = 'file-image';
    } elseif (preg_match('/\.vcs$/i', $tmpfile)) {                  // Calendar
        $mime = 'text/calendar';
        $imgmime = 'other.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.ics$/i', $tmpfile)) {
        $mime = 'text/calendar';
        $imgmime = 'other.png';
        $famime = 'file-alt';
    } elseif (preg_match('/\.torrent$/i', $tmpfile)) {              // Other
        $mime = 'application/x-bittorrent';
        $imgmime = 'other.png';
        $famime = 'file-o';
    } elseif (preg_match('/\.(mp3|ogg|au|wav|wma|mid)$/i', $tmpfile)) { // Audio
        $mime = 'audio';
        $imgmime = 'audio.png';
        $famime = 'file-audio';
    } elseif (preg_match('/\.mp4$/i', $tmpfile)) {                  // Video
        $mime = 'video/mp4';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.ogv$/i', $tmpfile)) {
        $mime = 'video/ogg';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.webm$/i', $tmpfile)) {
        $mime = 'video/webm';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.avi$/i', $tmpfile)) {
        $mime = 'video/x-msvideo';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.divx$/i', $tmpfile)) {
        $mime = 'video/divx';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.xvid$/i', $tmpfile)) {
        $mime = 'video/xvid';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.(wmv|mpg|mpeg)$/i', $tmpfile)) {
        $mime = 'video';
        $imgmime = 'video.png';
        $famime = 'file-video';
    } elseif (preg_match('/\.(zip|rar|gz|tgz|z|cab|bz2|7z|tar|lzh|zst)$/i', $tmpfile)) {    // Archive
        // application/xxx where zzz is zip, ...
        $mime = 'archive';
        $imgmime = 'archive.png';
        $famime = 'file-archive';
    } elseif (preg_match('/\.(exe|com)$/i', $tmpfile)) {                    // Exe
        $mime = 'application/octet-stream';
        $imgmime = 'other.png';
        $famime = 'file-o';
    } elseif (preg_match('/\.(dll|lib|o|so|a)$/i', $tmpfile)) {             // Lib
        $mime = 'library';
        $imgmime = 'library.png';
        $famime = 'file-o';
    } elseif (preg_match('/\.err$/i', $tmpfile)) {                             // phpcs:ignore
        $mime = 'error';
        $imgmime = 'error.png';
        $famime = 'file-alt';
    }

    // Return mimetype string
    switch ((int)$mode) {
        case 1:
            $tmp = explode('/', $mime);
            return (!empty($tmp[1]) ? $tmp[1] : $tmp[0]);
        case 2:
            return $imgmime;
        case 3:
            return $srclang;
        case 4:
            return $famime;
    }
    return $mime;
}

/**
 * Return the value of a filed into a dictionary for the record $id.
 * This also set all the values into a cache for a next search.
 *
 * @param string $tablename Name of table dictionary (without the MAIN_DB_PREFIX, example: 'c_holiday_types')
 * @param string $field The name of field where to find the value to return
 * @param int $id Id of line record
 * @param bool $checkentity Add filter on entity
 * @param string $rowidfield Name of the column rowid (to use for the filter on $id)
 * @return string                   The value of field $field. This also set $dictvalues cache.
 */
function getDictionaryValue($tablename, $field, $id, $checkentity = false, $rowidfield = 'rowid')
{
    global $conf, $db;

    $tablename = preg_replace('/^' . preg_quote(MAIN_DB_PREFIX, '/') . '/', '', $tablename);    // Clean name of table for backward compatibility.

    $dictvalues = (isset($conf->cache['dictvalues_' . $tablename]) ? $conf->cache['dictvalues_' . $tablename] : null);

    if (is_null($dictvalues)) {
        $dictvalues = array();

        $sql = "SELECT * FROM " . MAIN_DB_PREFIX . $tablename . " WHERE 1 = 1"; // Here select * is allowed as it is generic code and we don't have list of fields
        if ($checkentity) {
            $sql .= ' AND entity IN (0,' . getEntity($tablename) . ')';
        }

        $resql = $db->query($sql);
        if ($resql) {
            while ($obj = $db->fetch_object($resql)) {
                $dictvalues[$obj->$rowidfield] = $obj;  // $obj is stdClass
            }
        } else {
            dol_print_error($db);
        }

        $conf->cache['dictvalues_' . $tablename] = $dictvalues;
    }

    if (!empty($dictvalues[$id])) {
        // Found
        $tmp = $dictvalues[$id];
        return (property_exists($tmp, $field) ? $tmp->$field : '');
    } else {
        // Not found
        return '';
    }
}

/**
 *  Return true if the color is light
 *
 * @param string $stringcolor String with hex (FFFFFF) or comma RGB ('255,255,255')
 * @return int<-1,1>                   -1 : Error with argument passed |0 : color is dark | 1 : color is light
 */
function colorIsLight($stringcolor)
{
    $stringcolor = str_replace('#', '', $stringcolor);
    $res = -1;
    if (!empty($stringcolor)) {
        $res = 0;
        $tmp = explode(',', $stringcolor);
        if (count($tmp) > 1) {   // This is a comma RGB ('255','255','255')
            $r = $tmp[0];
            $g = $tmp[1];
            $b = $tmp[2];
        } else {
            $hexr = $stringcolor[0] . $stringcolor[1];
            $hexg = $stringcolor[2] . $stringcolor[3];
            $hexb = $stringcolor[4] . $stringcolor[5];
            $r = hexdec($hexr);
            $g = hexdec($hexg);
            $b = hexdec($hexb);
        }
        $bright = (max($r, $g, $b) + min($r, $g, $b)) / 510.0; // HSL algorithm
        if ($bright > 0.6) {
            $res = 1;
        }
    }
    return $res;
}

/**
 * Function to test if an entry is enabled or not
 *
 * @param int<0,1> $type_user 0=We test for internal user, 1=We test for external user
 * @param array{enabled:int<0,1>,module:string,perms:string} $menuentry Array for feature entry to test
 * @param string[] $listofmodulesforexternal Array with list of modules allowed to external users
 * @return  int<0,2>                                0=Hide, 1=Show, 2=Show gray
 */
function isVisibleToUserType($type_user, &$menuentry, &$listofmodulesforexternal)
{
    global $conf;

    //print 'type_user='.$type_user.' module='.$menuentry['module'].' enabled='.$menuentry['enabled'].' perms='.$menuentry['perms'];
    //print 'ok='.in_array($menuentry['module'], $listofmodulesforexternal);
    if (empty($menuentry['enabled'])) {
        return 0; // Entry disabled by condition
    }
    if ($type_user && $menuentry['module']) {
        $tmploops = explode('|', $menuentry['module']);
        $found = 0;
        foreach ($tmploops as $tmploop) {
            if (in_array($tmploop, $listofmodulesforexternal)) {
                $found++;
                break;
            }
        }
        if (!$found) {
            return 0; // Entry is for menus all excluded to external users
        }
    }
    if (!$menuentry['perms'] && $type_user) {
        return 0; // No permissions and user is external
    }
    if (!$menuentry['perms'] && getDolGlobalString('MAIN_MENU_HIDE_UNAUTHORIZED')) {
        return 0; // No permissions and option to hide when not allowed, even for internal user, is on
    }
    if (!$menuentry['perms']) {
        return 2; // No permissions and user is external
    }
    return 1;
}

/**
 * Round to next multiple.
 *
 * @param float $n Number to round up
 * @param int $x Multiple. For example 60 to round up to nearest exact minute for a date with seconds.
 * @return  int             Value rounded.
 */
function roundUpToNextMultiple($n, $x = 5)
{
    $result = (ceil($n) % $x === 0) ? ceil($n) : (round(($n + $x / 2) / $x) * $x);
    return (int)$result;
}

/**
 * Fetch an object from its id and element_type
 * Inclusion of classes is automatic
 *
 * @param int $element_id Element id (Use this or element_ref but not both. If id and ref are empty, object with no fetch is returned)
 * @param string $element_type Element type ('module' or 'myobject@mymodule' or 'mymodule_myobject')
 * @param string $element_ref Element ref (Use this or element_id but not both. If id and ref are empty, object with no fetch is returned)
 * @param int<0,2> $useCache If you want to store object in cache or get it from cache 0 => no use cache , 1 use cache, 2 force reload  cache
 * @param int $maxCacheByType Number of object in cache for this element type
 * @return  int<-1,0>|object                object || 0 || <0 if error
 * @see getElementProperties()
 */
function fetchObjectByElement($element_id, $element_type, $element_ref = '', $useCache = 0, $maxCacheByType = 10)
{
    global $db, $globalCacheForGetObjectFromCache;

    $ret = 0;

    $element_prop = getElementProperties($element_type);

    if ($element_prop['module'] == 'product' || $element_prop['module'] == 'service') {
        // For example, for an extrafield 'product' (shared for both product and service) that is a link to an object,
        // this is called with $element_type = 'product' when we need element properties of a service, we must return a product. If we create the
        // extrafield for a service, it is not supported and not found when editing the product/service card. So we must keep 'product' for extrafields
        // of service and we will return properties of a product.
        $ismodenabled = (isModEnabled('product') || isModEnabled('service'));
    } elseif ($element_prop['module'] == 'societeaccount') {
        $ismodenabled = isModEnabled('website') || isModEnabled('webportal');
    } else {
        $ismodenabled = isModEnabled($element_prop['module']);
    }
    //var_dump('element_type='.$element_type);
    //var_dump($element_prop);
    //var_dump($element_prop['module'].' '.$ismodenabled);
    if (is_array($element_prop) && (empty($element_prop['module']) || $ismodenabled)) {
        if (
            $useCache === 1
            && !empty($globalCacheForGetObjectFromCache[$element_type])
            && !empty($globalCacheForGetObjectFromCache[$element_type][$element_id])
            && is_object($globalCacheForGetObjectFromCache[$element_type][$element_id])
        ) {
            return $globalCacheForGetObjectFromCache[$element_type][$element_id];
        }

        dol_include_once('/' . $element_prop['classpath'] . '/' . $element_prop['classfile'] . '.class.php');

        if (class_exists($element_prop['classname'])) {
            $className = $element_prop['classname'];
            $objecttmp = new $className($db);
            '@phan-var-force CommonObject $objecttmp';

            if ($element_id > 0 || !empty($element_ref)) {
                $ret = $objecttmp->fetch($element_id, $element_ref);
                if ($ret >= 0) {
                    if (empty($objecttmp->module)) {
                        $objecttmp->module = $element_prop['module'];
                    }

                    if ($useCache > 0) {
                        if (!isset($globalCacheForGetObjectFromCache[$element_type])) {
                            $globalCacheForGetObjectFromCache[$element_type] = [];
                        }

                        // Manage cache limit
                        if (!empty($globalCacheForGetObjectFromCache[$element_type]) && is_array($globalCacheForGetObjectFromCache[$element_type]) && count($globalCacheForGetObjectFromCache[$element_type]) >= $maxCacheByType) {
                            array_shift($globalCacheForGetObjectFromCache[$element_type]);
                        }

                        $globalCacheForGetObjectFromCache[$element_type][$element_id] = $objecttmp;
                    }

                    return $objecttmp;
                }
            } else {
                return $objecttmp;  // returned an object without fetch
            }
        } else {
            return -1;
        }
    }

    return $ret;
}

/**
 * Return if a file can contains executable content
 *
 * @param string $filename File name to test
 * @return  boolean                 True if yes, False if no
 */
function isAFileWithExecutableContent($filename)
{
    if (preg_match('/\.(htm|html|js|phar|php|php\d+|phtml|pht|pl|py|cgi|ksh|sh|shtml|bash|bat|cmd|wpk|exe|dmg)$/i', $filename)) {
        return true;
    }

    return false;
}

/**
 * Return the value of token currently saved into session with name 'newtoken'.
 * This token must be send by any POST as it will be used by next page for comparison with value in session.
 *
 * @return  string
 * @since Dolibarr v10.0.7
 */
function newToken()
{
    return empty($_SESSION['newtoken']) ? '' : $_SESSION['newtoken'];
}

/**
 * Return the value of token currently saved into session with name 'token'.
 * For ajax call, you must use this token as a parameter of the call into the js calling script (the called ajax php page must also set constant NOTOKENRENEWAL).
 *
 * @return  string
 * @since Dolibarr v10.0.7
 */
function currentToken()
{
    return isset($_SESSION['token']) ? $_SESSION['token'] : '';
}

/**
 * Return a random string to be used as a nonce value for js
 *
 * @return  string
 */
function getNonce()
{
    global $conf;

    if (empty($conf->cache['nonce'])) {
        $conf->cache['nonce'] = dolGetRandomBytes(8);
    }

    return $conf->cache['nonce'];
}

/**
 *  Return a file on output using a low memory. It can return very large files with no need of memory.
 *  WARNING: This close output buffers.
 *
 * @param string $fullpath_original_file_osencoded Full path of file to return.
 * @param int<-1,2> $method -1 automatic, 0=readfile, 1=fread, 2=stream_copy_to_stream
 * @return void
 */
function readfileLowMemory($fullpath_original_file_osencoded, $method = -1)
{
    if ($method == -1) {
        $method = 0;
        if (getDolGlobalString('MAIN_FORCE_READFILE_WITH_FREAD')) {
            $method = 1;
        }
        if (getDolGlobalString('MAIN_FORCE_READFILE_WITH_STREAM_COPY')) {
            $method = 2;
        }
    }

    // Be sure we don't have output buffering enabled to have readfile working correctly
    while (ob_get_level()) {
        ob_end_flush();
    }

    // Solution 0
    if ($method == 0) {
        readfile($fullpath_original_file_osencoded);
    } elseif ($method == 1) {
        // Solution 1
        $handle = fopen($fullpath_original_file_osencoded, "rb");
        while (!feof($handle)) {
            print fread($handle, 8192);
        }
        fclose($handle);
    } elseif ($method == 2) {
        // Solution 2
        $handle1 = fopen($fullpath_original_file_osencoded, "rb");
        $handle2 = fopen("php://output", "wb");
        stream_copy_to_stream($handle1, $handle2);
        fclose($handle1);
        fclose($handle2);
    }
}
