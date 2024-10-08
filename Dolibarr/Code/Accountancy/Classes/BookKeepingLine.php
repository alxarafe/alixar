<?php

/* Copyright (C) 2014-2017  Olivier Geffroy             <jeff@jeffinfo.com>
 * Copyright (C) 2015-2022  Alexandre Spangaro          <aspangaro@open-dsi.fr>
 * Copyright (C) 2015-2020  Florian Henry               <florian.henry@open-concept.pro>
 * Copyright (C) 2018-2024  Frédéric France             <frederic.france@free.fr>
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

namespace Dolibarr\Code\Accountancy\Classes;

use Dolibarr\Core\Base\CommonObjectLine;

/**
 * \file        htdocs/accountancy/class/bookkeeping.class.php
 * \ingroup     Accountancy (Double entries)
 * \brief       File of class to manage Ledger (General Ledger and Subledger)
 */

// Class

/**
 * Class BookKeepingLine
 */
class BookKeepingLine extends CommonObjectLine
{
    /**
     * @var int ID
     */
    public $id;

    public $doc_date = null;
    public $doc_type;
    public $doc_ref;

    /**
     * @var int ID
     */
    public $fk_doc;

    /**
     * @var int ID
     */
    public $fk_docdet;

    public $thirdparty_code;
    public $subledger_account;
    public $subledger_label;
    public $numero_compte;
    public $label_compte;
    public $label_operation;
    public $debit;
    public $credit;

    /**
     * @var float Amount
     * @deprecated see $amount
     */
    public $montant;

    /**
     * @var float   Amount
     */
    public $amount;

    /**
     * @var float   Multicurrency amount
     */
    public $multicurrency_amount;

    /**
     * @var string  Multicurrency code
     */
    public $multicurrency_code;

    /**
     * @var string Sens
     */
    public $sens;
    public $lettering_code;
    public $date_lettering;

    /**
     * @var int ID
     */
    public $fk_user_author;

    public $import_key;
    public $code_journal;
    public $journal_label;
    /**
     * @var int accounting transaction id
     */
    public $piece_num;

    /**
     * @var integer|string date_creation
     */
    public $date_creation;

    /**
     * @var integer|string $date_modification;
     */
    public $date_modification;

    /**
     * @var integer|string $date_export;
     */
    public $date_export;

    /**
     * @var integer|string $date_validation;
     */
    public $date_validation;

    /**
     * @var integer|string $date_lim_reglement;
     */
    public $date_lim_reglement;
}
