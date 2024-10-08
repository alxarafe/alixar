-- ========================================================================
-- Copyright (C) 2011 Philippe GRAND      <philippe.grand@atoo-net.com>
-- Copyright (C) 2020 Alexandre SPANGARO  <aspangaro@open-dsi.fr>
-- Copyright (C) 2022 Juanjo Menent       <jmenent@2byte.es>
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

create table llx_c_availability
(
    rowid         integer AUTO_INCREMENT PRIMARY KEY,
    code          varchar(30)  NOT NULL,
    label         varchar(128) NOT NULL,
    type_duration varchar(1),
    qty           real,
    active        tinyint               DEFAULT 1 NOT NULL,
    position      integer      NOT NULL DEFAULT 0
)ENGINE=innodb;
