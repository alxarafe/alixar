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
-- Types paiement
--

-- Payment modes
insert into llx_c_paiement (id, code, libelle, type, active)
values (1, 'TIP', 'TIP', 2, 0);
insert into llx_c_paiement (id, code, libelle, type, active)
values (2, 'VIR', 'Credit Transfer', 2, 1);
insert into llx_c_paiement (id, code, libelle, type, active)
values (3, 'PRE', 'Direct Debit', 2, 1);
insert into llx_c_paiement (id, code, libelle, type, active)
values (4, 'LIQ', 'Cash', 2, 1);
insert into llx_c_paiement (id, code, libelle, type, active)
values (6, 'CB', 'Credit card', 2, 1);
insert into llx_c_paiement (id, code, libelle, type, active)
values (7, 'CHQ', 'Cheque', 2, 1);
-- Alternative not common payment modes
insert into llx_c_paiement (id, code, libelle, type, active)
values (50, 'VAD', 'Online payment', 2, 0);
insert into llx_c_paiement (id, code, libelle, type, active)
values (51, 'TRA', 'Traite', 2, 0);
insert into llx_c_paiement (id, code, libelle, type, active)
values (52, 'LCR', 'LCR', 2, 0);
insert into llx_c_paiement (id, code, libelle, type, active)
values (53, 'FAC', 'Factor', 2, 0);
-- Payment services
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (100, 'KLA', 'Klarna', 1, 0);
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (101, 'SOF', 'Sofort', 1, 0);
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (102, 'BANCON', 'Bancontact', 1, 0);
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (103, 'IDE', 'iDeal', 1, 0);
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (104, 'GIR', 'Giropay', 1, 0);
INSERT INTO llx_c_paiement (id, code, libelle, type, active)
values (105, 'PPL', 'PayPal', 1, 0);
