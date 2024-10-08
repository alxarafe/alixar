-- ========================================================================
-- Copyright (C) 2007-2018	Regis Houssin		<regis.houssin@inodbox.com>
-- Copyright (C) 2009		Laurent Destailleur	<eldy@users.sourceforge.net>
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

create table llx_c_ecotaxe
(
    rowid        integer AUTO_INCREMENT PRIMARY KEY,
    code         varchar(64)       NOT NULL, -- Code servant a la traduction et a la reference interne
    label        varchar(255),               -- Description
    price double(24,8),                      -- Montant HT
    organization varchar(255),               -- Organisme gerant le bareme tarifaire
    fk_pays      integer           NOT NULL, -- Pays correspondant
    active       tinyint DEFAULT 1 NOT NULL
)ENGINE=innodb;
