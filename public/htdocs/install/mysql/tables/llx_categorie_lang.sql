-- ============================================================================
-- Copyright (C) 2002-2003 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2005-2010 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2009      Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2014      Jean-François Ferry  <jfefe@aternatik.fr>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- ============================================================================


-- Table to manage the multilanguage of categories (label and description)

create table llx_categorie_lang
(
    rowid       integer AUTO_INCREMENT PRIMARY KEY,
    fk_category integer    DEFAULT 0 NOT NULL,
    lang        varchar(5) DEFAULT 0 NOT NULL,
    label       varchar(255)         NOT NULL,
    description text
)ENGINE=innodb;
