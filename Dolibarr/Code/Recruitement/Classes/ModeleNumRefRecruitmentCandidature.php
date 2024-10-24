<?php

/* Copyright (C) 2003-2004  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2011  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Eric Seigne                 <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012  Regis Houssin               <regis.houssin@inodbox.com>
 * Copyright (C) 2006       Andre Cianfarani            <acianfa@free.fr>
 * Copyright (C) 2012       Juanjo Menent	            <jmenent@2byte.es>
 * Copyright (C) 2014       Marcos García               <marcosgdf@gmail.com>
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

namespace Dolibarr\Code\Recruitement\Classes;

use Dolibarr\Code\Core\Classes\CommonNumRefGenerator;


/**
 *  \file           htdocs/core/modules/recruitment/modules_recruitmentjobposition.php
 *  \ingroup        recruitment
 *  \brief          File that contains parent class for recruitmentjobpositions document models and parent class for recruitmentjobpositions numbering models
 */

/**
 *  Parent class to manage numbering of RecruitmentCandidature
 */
abstract class ModeleNumRefRecruitmentCandidature extends CommonNumRefGenerator
{
    // No overloaded code
}
