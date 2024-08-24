<?php

/* Copyright (C) 2005-2012  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2012	Regis Houssin			    <regis.houssin@inodbox.com>
 * Copyright (C) 2010-2011	Juanjo Menent			    <jmenent@2byte.es>
 * Copyright (C) 2015-2017	Marcos García			    <marcosgdf@gmail.com>
 * Copyright (C) 2015-2017	Nicolas ZABOURI			    <info@inovea-conseil.com>
 * Copyright (C) 2018-2022	Frédéric France			    <frederic.france@netlogic.fr>
 * Copyright (C) 2022		Charlene Benke			    <charlene@patas-monkey.com>
 * Copyright (C) 2023		Anthony Berton			    <anthony.berton@bb2a.fr>
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

namespace Dolibarr\Code\Core\Classes;

use DoliDB;

/**
 *       \file       htdocs/core/class/html.formmail.class.php
 *       \ingroup    core
 *       \brief      Fichier de la class permettant la generation du formulaire html d'envoi de mail unitaire
 */


/**
 * ModelMail
 *
 * Object of table llx_c_email_templates
 */
class ModelMail
{
    /**
     * @var int ID
     */
    public $id;

    /**
     * @var string Model mail label
     */
    public $label;

    /**
     * @var int Owner of email template
     */
    public $fk_user;

    /**
     * @var int Is template private
     */
    public $private;

    /**
     * @var string Model mail topic
     */
    public $topic;

    /**
     * @var string Model mail content
     */
    public $content;
    public $content_lines;
    public $lang;
    public $joinfiles;

    public $email_from;
    public $email_to;
    public $email_tocc;
    public $email_tobcc;

    /**
     * @var string Module the template is dedicated for
     */
    public $module;

    /**
     * @var int Position of template in a combo list
     */
    public $position;
}
