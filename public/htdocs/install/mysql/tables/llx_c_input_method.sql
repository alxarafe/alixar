-- ========================================================================
-- Copyright (C) 2004-2005 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2005-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2022 	   Juanjo Menent        <jmenent@2byte.es>
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
-- ========================================================================

create table llx_c_input_method
(
    rowid   integer AUTO_INCREMENT PRIMARY KEY,
    code    varchar(30),
    libelle varchar(128),
    active  tinyint default 1 NOT NULL,
    module  varchar(32) NULL
)ENGINE=innodb;

