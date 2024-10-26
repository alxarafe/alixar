-- Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see https://www.gnu.org/licenses/.

create table llx_expedition_package
(
    rowid           integer AUTO_INCREMENT PRIMARY KEY,
    fk_expedition   integer NOT NULL,
    description     varchar(255),              -- Description of goods in the package (required by the custom)
    value           double(24, 8) DEFAULT 0,   -- Value (Price of the content, for insurance & custom)
    fk_package_type integer,                   -- Type or package, linked to llx_c_shipment_parcel_type (eg: 1=enveloppe, 2=package, 3=palette, 4=other)
    height          float,                     -- height
    width           float,                     -- width
    size            float,                     -- depth
    size_units      integer,                   -- unit of all sizes (height, width, depth)
    weight          float,                     -- weight
    weight_units    integer,                   -- unit of weight
    dangerous_goods varchar(20)   DEFAULT '0', -- (comma separated list eg : 3,5,7) 0 = no dangerous goods or 1 = Explosives, 2 = Flammable Gases, 3 = Flammable Liquids, 4 = Flammable solids, 5 = Oxidizing, 6 = Toxic & Infectious, 7 = Radioactive, 8 = Corrosives, 9 = Miscellaneous (see https://en.wikipedia.org/wiki/Dangerous_goods). I'm not sure if just register 0 (no) or 1 (yes) is enough.
    tail_lift       smallint      DEFAULT 0,   -- 0 = no tail lift required to load/unload package(s), 1 = a tail lift is required to load/unload package(s). Sometime tail lift load can be different than tail lift delivery so maybe adding a new table line.
    rang            integer       DEFAULT 0
) ENGINE = innodb;
