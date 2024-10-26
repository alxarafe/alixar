-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
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
--

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- Types effectifs
--

delete
from llx_c_effectif;
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (0, 'EF0', '-');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (1, 'EF1-5', '1 - 5');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (2, 'EF6-10', '6 - 10');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (3, 'EF11-50', '11 - 50');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (4, 'EF51-100', '51 - 100');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (5, 'EF101-500', '101 - 500');
INSERT INTO llx_c_effectif (id, code, libelle)
VALUES (6, 'EF500-', '> 500');
