<?php

/* Copyright (C) 2003-2007  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2010  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2009  Regis Houssin               <regis.houssin@inodbox.com>
 * Copyright (C) 2015-2024  Frederic France             <frederic.france@netlogic.fr>
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
 */

use Dolibarr\Code\Core\Classes\HookManager;

/**
 *  \file       htdocs/core/boxes/box_dolibarr_state_board.php
 *  \ingroup    core
 *  \brief      Module Dolibarr state base
 */

include_once DOL_DOCUMENT_ROOT . '/core/boxes/modules_boxes.php';

/**
 * Class to manage the box to show last thirdparties
 */
class box_dolibarr_state_board extends ModeleBoxes
{
    public $boxcode = "dolibarrstatebox";
    public $boximg = "generic";
    public $boxlabel = "BoxDolibarrStateBoard";
    public $depends = array("user");

    public $enabled = 1;

    /**
     *  Constructor
     *
     * @param DoliDB $db Database handler
     * @param string $param More parameters
     */
    public function __construct($db, $param = '')
    {
        $this->db = $db;
    }

    /**
     *  Load data for box to show them later
     *
     * @param int $max Maximum number of records to load
     * @return void
     */
    public function loadBox($max = 5)
    {
        global $user, $langs;
        $langs->load("boxes");

        $this->max = $max;
        $this->info_box_head = array('text' => $langs->trans("DolibarrStateBoard"));

        if (empty($user->socid) && !getDolGlobalString('MAIN_DISABLE_GLOBAL_BOXSTATS')) {
            $hookmanager = new HookManager($this->db);
            $hookmanager->initHooks(array('index'));
            $object = new stdClass();
            $action = '';
            $parameters = array();
            $hookmanager->executeHooks('addStatisticLine', $parameters, $object, $action);
            $boxstatItems = array();
            $boxstatFromHook = '';
            $boxstatFromHook = $hookmanager->resPrint;
            $boxstat = '';

            $keys = array(
                'users',
                'members',
                'expensereports',
                'holidays',
                'customers',
                'prospects',
                'suppliers',
                'contacts',
                'products',
                'services',
                'projects',
                'proposals',
                'orders',
                'invoices',
                'donations',
                'supplier_proposals',
                'supplier_orders',
                'supplier_invoices',
                'contracts',
                'interventions',
                'ticket',
                'dolresource'
            );
            $conditions = array(
                'users' => $user->hasRight('user', 'user', 'lire'),
                'members' => isModEnabled('member') && $user->hasRight('adherent', 'lire'),
                'customers' => isModEnabled('societe') && $user->hasRight('societe', 'lire') && !getDolGlobalString('SOCIETE_DISABLE_CUSTOMERS') && !getDolGlobalString('SOCIETE_DISABLE_CUSTOMERS_STATS'),
                'prospects' => isModEnabled('societe') && $user->hasRight('societe', 'lire') && !getDolGlobalString('SOCIETE_DISABLE_PROSPECTS') && !getDolGlobalString('SOCIETE_DISABLE_PROSPECTS_STATS'),
                'suppliers' => (
                        (isModEnabled("fournisseur") && !getDolGlobalString('MAIN_USE_NEW_SUPPLIERMOD') && $user->hasRight('fournisseur', 'lire'))
                        || (isModEnabled("supplier_order") && $user->hasRight('supplier_order', 'lire'))
                        || (isModEnabled("supplier_invoice") && $user->hasRight('supplier_invoice', 'lire'))
                    )
                    && !getDolGlobalString('SOCIETE_DISABLE_SUPPLIERS_STATS'),
                'contacts' => isModEnabled('societe') && $user->hasRight('societe', 'contact', 'lire'),
                'products' => isModEnabled('product') && $user->hasRight('product', 'read'),
                'services' => isModEnabled('service') && $user->hasRight('service', 'read'),
                'proposals' => isModEnabled('propal') && $user->hasRight('propal', 'read'),
                'orders' => isModEnabled('order') && $user->hasRight('commande', 'lire'),
                'invoices' => isModEnabled('invoice') && $user->hasRight('facture', 'lire'),
                'donations' => isModEnabled('don') && $user->hasRight('don', 'lire'),
                'contracts' => isModEnabled('contract') && $user->hasRight('contrat', 'lire'),
                'interventions' => isModEnabled('intervention') && $user->hasRight('ficheinter', 'lire'),
                'supplier_orders' => isModEnabled('supplier_order') && $user->hasRight('fournisseur', 'commande', 'lire') && !getDolGlobalString('SOCIETE_DISABLE_SUPPLIERS_ORDERS_STATS'),
                'supplier_invoices' => isModEnabled('supplier_invoice') && $user->hasRight('fournisseur', 'facture', 'lire') && !getDolGlobalString('SOCIETE_DISABLE_SUPPLIERS_INVOICES_STATS'),
                'supplier_proposals' => isModEnabled('supplier_proposal') && $user->hasRight('supplier_proposal', 'lire') && !getDolGlobalString('SOCIETE_DISABLE_SUPPLIERS_PROPOSAL_STATS'),
                'projects' => isModEnabled('project') && $user->hasRight('projet', 'lire'),
                'expensereports' => isModEnabled('expensereport') && $user->hasRight('expensereport', 'lire'),
                'holidays' => isModEnabled('holiday') && $user->hasRight('holiday', 'read'),
                'ticket' => isModEnabled('ticket') && $user->hasRight('ticket', 'read'),
                'dolresource' => isModEnabled('resource') && $user->hasRight('resource', 'read')
            );
            $classes = array(
                'users' => new \Dolibarr\Code\User\Classes\User($this->db),
                'members' => new \Dolibarr\Code\Adherents\Classes\Adherent($this->db),
                'customers' => new \Dolibarr\Code\Societe\Classes\Client($this->db),
                'prospects' => new \Dolibarr\Code\Societe\Classes\Client($this->db),
                'suppliers' => new \Dolibarr\Code\Fourn\Classes\Fournisseur($this->db),
                'contacts' => new \Dolibarr\Code\Contact\Classes\Contact($this->db),
                'products' => new \Dolibarr\Code\Product\Classes\Product($this->db),
                'services' => new \Dolibarr\Code\Product\Classes\ProductService($this->db),
                'proposals' => new \Dolibarr\Code\Comm\Classes\Propal($this->db),
                'orders' => new \Dolibarr\Code\Commande\Classes\Commande($this->db),
                'invoices' => new \Dolibarr\Code\Compta\Classes\Facture($this->db),
                'donations' => new \Dolibarr\Code\Don\Classes\Don($this->db),
                'contracts' => new \Dolibarr\Code\Contrat\Classes\Contrat($this->db),
                'interventions' => new \Dolibarr\Code\FichInter\Classes\Fichinter($this->db),
                'supplier_orders' => new \Dolibarr\Code\Fourn\Classes\CommandeFournisseur($this->db),
                'supplier_invoices' => new \Dolibarr\Code\Fourn\Classes\FactureFournisseur($this->db),
                'supplier_proposals' => new \Dolibarr\Code\SupplierProposal\Classes\SupplierProposal($this->db),
                'projects' => new \Dolibarr\Code\Projet\Classes\Project($this->db),
                'expensereports' => new \Dolibarr\Code\ExpenseReport\Classes\ExpenseReport($this->db),
                'holidays' => new \Dolibarr\Code\Holiday\Classes\Holiday($this->db),
                'ticket' => new \Dolibarr\Code\Ticket\Classes\Ticket($this->db),
                'dolresource' => new \Dolibarr\Code\Resource\Classes\Dolresource($this->db)
            );
            $includes = array(
                'users' => DOL_DOCUMENT_ROOT . "/user/class/user.class.php",
                'members' => DOL_DOCUMENT_ROOT . "/adherents/class/adherent.class.php",
                'customers' => DOL_DOCUMENT_ROOT . "/societe/class/client.class.php",
                'prospects' => DOL_DOCUMENT_ROOT . "/societe/class/client.class.php",
                'suppliers' => DOL_DOCUMENT_ROOT . "/fourn/class/fournisseur.class.php",
                'contacts' => DOL_DOCUMENT_ROOT . "/contact/class/contact.class.php",
                'products' => DOL_DOCUMENT_ROOT . "/product/class/product.class.php",
                'services' => DOL_DOCUMENT_ROOT . "/product/class/product.class.php",
                'proposals' => DOL_DOCUMENT_ROOT . "/comm/propal/class/propal.class.php",
                'orders' => DOL_DOCUMENT_ROOT . "/commande/class/commande.class.php",
                'invoices' => DOL_DOCUMENT_ROOT . "/compta/facture/class/facture.class.php",
                'donations' => DOL_DOCUMENT_ROOT . "/don/class/don.class.php",
                'contracts' => DOL_DOCUMENT_ROOT . "/contrat/class/contrat.class.php",
                'interventions' => DOL_DOCUMENT_ROOT . "/fichinter/class/fichinter.class.php",
                'supplier_orders' => DOL_DOCUMENT_ROOT . "/fourn/class/fournisseur.commande.class.php",
                'supplier_invoices' => DOL_DOCUMENT_ROOT . "/fourn/class/fournisseur.facture.class.php",
                'supplier_proposals' => DOL_DOCUMENT_ROOT . "/supplier_proposal/class/supplier_proposal.class.php",
                'projects' => DOL_DOCUMENT_ROOT . "/projet/class/project.class.php",
                'expensereports' => DOL_DOCUMENT_ROOT . "/expensereport/class/expensereport.class.php",
                'holidays' => DOL_DOCUMENT_ROOT . "/holiday/class/holiday.class.php",
                'ticket' => DOL_DOCUMENT_ROOT . "/ticket/class/ticket.class.php",
                'dolresource' => DOL_DOCUMENT_ROOT . "/resource/class/dolresource.class.php"
            );
            $links = array(
                'users' => constant('BASE_URL') . '/user/list.php',
                'members' => constant('BASE_URL') . '/adherents/list.php?statut=1&mainmenu=members',
                'customers' => constant('BASE_URL') . '/societe/list.php?type=c&mainmenu=companies',
                'prospects' => constant('BASE_URL') . '/societe/list.php?type=p&mainmenu=companies',
                'suppliers' => constant('BASE_URL') . '/societe/list.php?type=f&mainmenu=companies',
                'contacts' => constant('BASE_URL') . '/contact/list.php?mainmenu=companies',
                'products' => constant('BASE_URL') . '/product/list.php?type=0&mainmenu=products',
                'services' => constant('BASE_URL') . '/product/list.php?type=1&mainmenu=products',
                'proposals' => constant('BASE_URL') . '/comm/propal/list.php?mainmenu=commercial&leftmenu=propals',
                'orders' => constant('BASE_URL') . '/commande/list.php?mainmenu=commercial&leftmenu=orders',
                'invoices' => constant('BASE_URL') . '/compta/facture/list.php?mainmenu=billing&leftmenu=customers_bills',
                'donations' => constant('BASE_URL') . '/don/list.php?leftmenu=donations',
                'contracts' => constant('BASE_URL') . '/contrat/list.php?mainmenu=commercial&leftmenu=contracts',
                'interventions' => constant('BASE_URL') . '/fichinter/list.php?mainmenu=commercial&leftmenu=ficheinter',
                'supplier_orders' => constant('BASE_URL') . '/fourn/commande/list.php?mainmenu=commercial&leftmenu=orders_suppliers',
                'supplier_invoices' => constant('BASE_URL') . '/fourn/facture/list.php?mainmenu=billing&leftmenu=suppliers_bills',
                'supplier_proposals' => constant('BASE_URL') . '/supplier_proposal/list.php?mainmenu=commercial&leftmenu=',
                'projects' => constant('BASE_URL') . '/projet/list.php?mainmenu=project',
                'expensereports' => constant('BASE_URL') . '/expensereport/list.php?mainmenu=hrm&leftmenu=expensereport',
                'holidays' => constant('BASE_URL') . '/holiday/list.php?mainmenu=hrm&leftmenu=holiday',
                'ticket' => constant('BASE_URL') . '/ticket/list.php?leftmenu=ticket',
                'dolresource' => constant('BASE_URL') . '/resource/list.php?mainmenu=agenda',
            );
            $titres = array(
                'users' => "Users",
                'members' => "Members",
                'customers' => "ThirdPartyCustomersStats",
                'prospects' => "ThirdPartyProspectsStats",
                'suppliers' => "Suppliers",
                'contacts' => "Contacts",
                'products' => "Products",
                'services' => "Services",
                'proposals' => "CommercialProposalsShort",
                'orders' => "CustomersOrders",
                'invoices' => "BillsCustomers",
                'donations' => "Donations",
                'contracts' => "Contracts",
                'interventions' => "Interventions",
                'supplier_orders' => "SuppliersOrders",
                'supplier_invoices' => "SuppliersInvoices",
                'supplier_proposals' => "SupplierProposalShort",
                'projects' => "Projects",
                'expensereports' => "ExpenseReports",
                'holidays' => "Holidays",
                'ticket' => "Ticket",
                'dolresource' => "Resources",
            );
            $langfile = array(
                'customers' => "companies",
                'contacts' => "companies",
                'services' => "products",
                'proposals' => "propal",
                'invoices' => "bills",
                'supplier_orders' => "orders",
                'supplier_invoices' => "bills",
                'supplier_proposals' => 'supplier_proposal',
                'expensereports' => "trips",
                'holidays' => "holiday",
            );
            $boardloaded = array();

            foreach ($keys as $val) {
                if ($conditions[$val]) {
                    $boxstatItem = '';
                    $class = $classes[$val];
                    // Search in cache if load_state_board is already realized
                    $classkeyforcache = $val;
                    if ($classkeyforcache == 'ProductService') {
                        $classkeyforcache = 'Product'; // ProductService use same load_state_board than Product
                    }

                    if (!isset($boardloaded[$classkeyforcache]) || !is_object($boardloaded[$classkeyforcache])) {
                        // include_once $includes[$val]; // Loading a class cost around 1Mb
                        // $board = new $class($this->db);

                        $board = $class;
                        if (method_exists($board, 'load_state_board')) {
                            // @phan-suppress-next-line PhanUndeclaredMethod  (Legacy, not present in core).
                            $board->load_state_board();
                        } elseif (method_exists($board, 'loadStateBoard')) {
                            $board->loadStateBoard();
                        } else {
                            $board = -1;
                        }
                        $boardloaded[$val] = $board;
                    } else {
                        $board = $boardloaded[$val];
                    }

                    $langs->load(empty($langfile[$val]) ? $val : $langfile[$val]);

                    $text = $langs->trans($titres[$val]);
                    $boxstatItem .= '<a href="' . $links[$val] . '" class="boxstatsindicator thumbstat nobold nounderline">';
                    $boxstatItem .= '<div class="boxstats">';
                    $boxstatItem .= '<span class="boxstatstext" title="' . dol_escape_htmltag($text) . '">' . $text . '</span><br>';
                    $boxstatItem .= '<span class="boxstatsindicator">' . img_object("", $board->picto, 'class="inline-block"') . ' ' . (!empty($board->nb[$val]) ? $board->nb[$val] : 0) . '</span>';
                    $boxstatItem .= '</div>';
                    $boxstatItem .= '</a>';

                    $boxstatItems[$val] = $boxstatItem;
                }
            }

            if (!empty($boxstatFromHook) || !empty($boxstatItems)) {
                $boxstat .= $boxstatFromHook;

                if (is_array($boxstatItems) && count($boxstatItems) > 0) {
                    $boxstat .= implode('', $boxstatItems);
                }

                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';
                $boxstat .= '<a class="boxstatsindicator thumbstat nobold nounderline"><div class="boxstatsempty"></div></a>';

                $this->info_box_contents[0][0] = array(
                    'tr' => 'class="nohover"',
                    'td' => 'class="tdwidgetstate center"',
                    'textnoformat' => $boxstat
                );
            }
        } else {
            $this->info_box_contents[0][0] = array(
                'td' => '',
                'text' => $langs->trans("ReadPermissionNotAllowed")
            );
        }
    }


    /**
     *  Method to show box
     *
     * @param array $head Array with properties of box title
     * @param array $contents Array with properties of box lines
     * @param int $nooutput No print, only return string
     * @return string
     */
    public function showBox($head = null, $contents = null, $nooutput = 0)
    {
        return parent::showBox($this->info_box_head, $this->info_box_contents, $nooutput);
    }
}
