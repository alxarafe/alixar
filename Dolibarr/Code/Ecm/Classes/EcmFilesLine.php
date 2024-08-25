<?php

/* Copyright (C) 2007-2012  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2014-2016  Juanjo Menent               <jmenent@2byte.es>
 * Copyright (C) 2015       Florian Henry               <florian.henry@open-concept.pro>
 * Copyright (C) 2015       Raphaël Doursenaud          <rdoursenaud@gpcsolutions.fr>
 * Copyright (C) 2018       Francis Appels              <francis.appels@yahoo.com>
 * Copyright (C) 2019-2024  Frédéric France             <frederic.france@free.fr>
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

namespace Dolibarr\Code\Ecm\Classes;

/**
 * \file    htdocs/ecm/class/ecmfiles.class.php
 * \ingroup ecm
 * \brief   Class to manage ECM Files (Create/Read/Update/Delete)
 */

/**
 * Class of an index line of a document
 */
class EcmFilesLine
{
    /**
     * @var string ECM files line label
     */
    public $label;

    /**
     * @var int Entity
     */
    public $entity;

    public $filename;
    public $filepath;
    public $fullpath_orig;

    /**
     * @var string description
     */
    public $description;

    public $keywords;
    public $cover;
    public $position;
    public $gen_or_uploaded; // can be 'generated', 'uploaded', 'unknown'
    public $extraparams;
    public $date_c = '';
    public $date_m = '';

    /**
     * @var int ID
     */
    public $fk_user_c;

    /**
     * @var int ID
     */
    public $fk_user_m;

    public $acl;
    public $src_object_type;
    public $src_object_id;
}
