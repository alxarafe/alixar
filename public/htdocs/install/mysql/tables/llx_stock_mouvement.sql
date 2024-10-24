-- ============================================================================
-- Copyright (C) 2003      Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2009-2015 Laurent Destailleur  <eldy@users.sourceofrge.net>
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

create table llx_stock_mouvement
(
    rowid          integer AUTO_INCREMENT PRIMARY KEY,
    tms            timestamp        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    datem          datetime,                      -- Date and hour of movement
    fk_product     integer NOT NULL,              -- Id of product
    batch          varchar(128)     DEFAULT NULL, -- Lot or serial number
    eatby          date             DEFAULT NULL, -- Eatby date (deprecated, we should get value from batch number in table llx_product_lot)
    sellby         date             DEFAULT NULL, -- Sellby date (deprecated, we should get value from batch number in table llx_product_lot)
    fk_entrepot    integer NOT NULL,              -- Id warehouse
    value          real,                          -- Qty of movement
    price double(24,8) DEFAULT 0,                 -- Entry price (used to calculate PMP, FIFO or LIFO value)
    type_mouvement smallint,                      -- Type/Direction of movement (manual entry = 0, manual exit = 1, automatic exit = 2, automatic entry = 3)
    fk_user_author integer,                       -- Id user making movement
    label          varchar(255),                  -- Comment on movement
    inventorycode  varchar(128),                  -- Code used to group different movement line into one operation (may be an inventory, a mass picking)
    fk_project     integer,
    fk_origin      integer,
    origintype     varchar(64),
    model_pdf      varchar(255),
    fk_projet      integer NOT NULL DEFAULT 0
)ENGINE=innodb;
