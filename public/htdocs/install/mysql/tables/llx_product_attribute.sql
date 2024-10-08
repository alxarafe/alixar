-- ============================================================================
-- Copyright (C) 2016      Marcos García         <marcosgdf@gmail.com>
-- Copyright (C) 2020      Laurent Destailleur   <eldy@users.sourceforge.net>
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
-- llx_product_attribute is table for labels of product variants attributes. For exemple: COLOR, SIZE, ... 
-- The different possible values (for example BLUE, GREEN, ... for COLOR) are defined into llx_product_attribute_value.
-- ============================================================================

CREATE TABLE llx_product_attribute
(
    rowid    INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ref      VARCHAR(255)        NOT NULL,
    ref_ext  VARCHAR(255) NULL,
    label    VARCHAR(255)        NOT NULL,
    position INTEGER DEFAULT 0   NOT NULL,
    entity   INTEGER DEFAULT 1   NOT NULL
)ENGINE=innodb;
