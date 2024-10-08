-- ============================================================================
-- Copyright (C) 2013-23 Laurent Destailleur <eldy@users.sourceforge.net>
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
-- ============================================================================


-- This table is deprecated. Still updated but no more read.

CREATE TABLE llx_oauth_state
(
    rowid   integer AUTO_INCREMENT PRIMARY KEY,
    service varchar(36),
    state   varchar(128),
    fk_user integer,
    fk_adherent integer,
    entity  integer DEFAULT 1
)ENGINE=innodb;
