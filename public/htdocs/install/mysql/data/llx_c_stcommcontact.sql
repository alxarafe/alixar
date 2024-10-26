-- Copyright (C) 2020 	   Open-Dsi  <support@open-dsi.fr>
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
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
--

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- Types action st for contacts
--

delete
from llx_c_stcommcontact;
INSERT INTO llx_c_stcommcontact (id, code, libelle)
VALUES (-1, 'ST_NO', 'Do not contact');
INSERT INTO llx_c_stcommcontact (id, code, libelle)
VALUES (0, 'ST_NEVER', 'Never contacted');
INSERT INTO llx_c_stcommcontact (id, code, libelle)
VALUES (1, 'ST_TODO', 'To contact');
INSERT INTO llx_c_stcommcontact (id, code, libelle)
VALUES (2, 'ST_PEND', 'Contact in progress');
INSERT INTO llx_c_stcommcontact (id, code, libelle)
VALUES (3, 'ST_DONE', 'Contacted');
