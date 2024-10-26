-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2011 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2010-2016 Juanjo Menent        <jmenent@2byte.es>
-- Copyright (C) 2012      Sebastian Neuwert    <sebastian.neuwert@modula71.de>
-- Copyright (C) 2012	   Ricardo Schluter		<info@ripasch.nl>
-- Copyright (C) 2022	   Miro Sertić   		<miro.sertic0606@gmail.com>
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
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- FR:
-- Taux TVA
-- Source des taux: https://fr.wikipedia.org/wiki/Taxe_sur_la_valeur_ajout%C3%A9e
--
-- EN:
-- VAT - value-added tax
-- Source:  https://en.wikipedia.org/wiki/Value-added_tax
--


delete
from llx_c_tva;

-- ALGERIA (id country=13)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (131, 13, '0', '0', 'TVA 0%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (132, 13, '9', '0', 'TVA 9%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (133, 13, '19', '0', 'TVA 19%', 1);

-- ANGOLA (id country=35)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (351, 35, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (352, 35, '7', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (353, 35, '14', '0', 'VAT rate - standard', 1);

-- ARGENTINA (id country=23)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (231, 23, '0', '0', 'IVA Rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (232, 23, '10.5', '0', 'IVA reduced rate', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (233, 23, '21', '0', 'IVA standard rate', 1);

-- AUSTRALIA (id country=28)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (281, 28, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (282, 28, '10', '0', 'VAT rate - standard', 1);

-- AUSTRIA (id country=41)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (411, 41, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (412, 41, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (413, 41, '20', '0', 'VAT rate - standard', 1);

-- BRASIL (id country=56)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (561, 56, '0', '0', 'VAT rate - reduced', 1);

-- BULGARIA (id country=59)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (591, 59, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (592, 59, '7', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (593, 59, '20', '0', 'VAT rate - standard', 1);

-- BELGIUM (id country=2)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (21, 2, '0', '0', 'VAT rate 0 ou non applicable', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (22, 2, '6', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (23, 2, '21', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (24, 2, '12', '0', 'VAT rate - reduced', 1);

-- CANADA (id country=14)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (141, 14, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (142, 14, '7', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, note, active)
VALUES (143, 14, '5', '0', '9.975', '1', 'GST/TPS and PST/TVQ rate for Province', 1);
-- INSERT INTO llx_c_tva(rowid,fk_pays,taux,recuperableonly,localtax1,localtax1_type,note,active) VALUES (143, 14,'5','0','9.975','1','GST/TPS and PST/TVQ rate for Quebec',1);
-- INSERT INTO llx_c_tva(rowid,fk_pays,taux,recuperableonly,localtax1,localtax1_type,note,active) VALUES (144, 14,'5','0','7','1','GST/TPS and PST/TVQ rate for British Columbia',1);
-- INSERT INTO llx_c_tva(rowid,fk_pays,taux,recuperableonly,localtax1,localtax1_type,note,active) VALUES (149, 14,'5','0',null,null,'GST/TPS and PST/TVQ rate for Yukon',1);


-- CAMEROUN (id country=24)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (241, 24, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (242, 24, '19.25', '0', 'VAT rate - standard', 1);

-- CHILE (id country=67)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (671, 67, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (672, 67, '19', '0', 'VAT rate - standard', 1);

-- CHINA (id country=9)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (91, 9, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (92, 9, '13', '0', 'VAT rate - reduced 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (93, 9, '3', '0', 'VAT rate -  super-reduced 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (94, 9, '17', '0', 'VAT rate - standard', 1);

-- CONGO = REPUBLIQUE DU CONGO (id country=72)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (721, 72, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, note, active)
VALUES (722, 72, '18', '0', '0.9', '1', 'VAT rate 18+0.9', 1);

-- CROATIA (id country=76)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, note, active)
VALUES (761, 76, '25', 'PDV 25%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, note, active)
VALUES (762, 76, '13', 'PDV 13%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, note, active)
VALUES (763, 76, '5', 'PDV 5%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, note, active)
VALUES (764, 76, '0', 'PDV 0%', 1);

-- CYPRUS (id country=78)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (781, 78, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (782, 78, '9', '0', 'VAT rate 9', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (783, 78, '5', '0', 'VAT rate 5', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (784, 78, '19', '0', 'VAT rate - standard', 1);

-- DANMERK (id country=80)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (801, 80, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (802, 80, '25', '0', 'VAT rate - standard', 1);

-- FRANCE (id country=1)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (11, 1, '0', '0', 'VAT rate 0 ou non applicable', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (12, 1, '20', '0', 'VAT rate - standard (France hors DOM-TOM)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (13, 1, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (14, 1, '5.5', '0', 'VAT rate - reduced (France hors DOM-TOM)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (15, 1, '2.1', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, code, recuperableonly, note, active)
values (16, 1, '8.5', '85', '0', 'VAT rate - standard (DOM sauf Guyane et Saint-Martin)', 0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, code, recuperableonly, note, active)
values (17, 1, '8.5', '85NPR', '1',
        'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',
        0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, code, recuperableonly, localtax1, localtax1_type, note, active)
values (18, 1, '8.5', '85NPROM', '1', 2, 3, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer',
        0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, code, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type,
                      note, active)
VALUES (19, 1, '8.5', '85NPROMOMR', '1', 2, 3, 2.5, 3,
        'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional', 0);

-- GABON (id country=16)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (161, 16, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (162, 16, 'TPS95', 10, 0, '0', 0, '0', 0, 'VAT 9.5', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (163, 16, 'TPS95C', 10, 1, '1', 0, '0', 0, 'VAT 9.5+CSS', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (164, 16, 'TPS10', 10, 0, '0', 0, '0', 0, 'VAT 10', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (165, 16, 'TPS10C', 10, 1, '1', 0, '0', 0, 'VAT 10+CSS', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (166, 16, 'TPS18', 18, 0, '0', 0, '0', 0, 'VAT 18', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (167, 16, 'TPS18C', 18, 1, '1', 0, '0', 0, 'VAT 18+CSS', 1);


-- GERMANY (id country=5)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (51, 5, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (52, 5, '7.0', '0', 'ermäßigte USt.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (54, 5, '5.5', '0', 'USt. Forst', 0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (55, 5, '10.7', '0', 'USt. Landwirtschaft', 0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (56, 5, '19.0', '0', 'allgemeine Ust.', 1);

-- GREECE (id country=102)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1021, 102, 0, 0, '0', 0, '0', 0, 'Μηδενικό Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1022, 102, 24, 0, '0', 0, '0', 0, 'Κανονικός Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1023, 102, 13, 0, '0', 0, '0', 0, 'Μειωμένος Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1024, 102, 6, 0, '0', 0, '0', 0, 'Υπερμειωμένος Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1025, 102, 3, 0, '0', 0, '0', 0, 'Νήσων υπερμειωμένος Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1026, 102, 9, 0, '0', 0, '0', 0, 'Νήσων μειωμένος Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1027, 102, 4, 0, '0', 0, '0', 0, 'Νήσων υπερμειωμένος Φ.Π.Α.', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly, note,
                      active)
VALUES (1028, 102, 17, 0, '0', 0, '0', 0, 'Νήσων υπερμειωμένος Φ.Π.Α.', 1);

-- ICELAND (id country=116)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1161, 116, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1163, 116, '25.5', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1162, 116, '7', '0', 'VAT rate - reduced', 1);

-- INDIA (id country=117)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1171, 117, '0', '0', 'VAT rate 0', 0);

INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1172, 117, 'C+S-5', 0, 2.5, '1', 2.5, '1', 0, 'CGST+SGST - Same state sales', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1173, 117, 'I-5', 5, 0, '0', 0, '0', 0, 'IGST', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1174, 117, 'C+S-12', 0, 6, '1', 6, '1', 0, 'CGST+SGST - Same state sales', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1175, 117, 'I-12', 12, 0, '0', 0, '0', 0, 'IGST', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1176, 117, 'C+S-18', 0, 9, '1', 9, '1', 0, 'CGST+SGST - Same state sales', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1177, 117, 'I-18', 18, 0, '0', 0, '0', 0, 'IGST', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1178, 117, 'C+S-28', 0, 14, '1', 14, '1', 0, 'CGST+SGST - Same state sales', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, code, taux, localtax1, localtax1_type, localtax2, localtax2_type, recuperableonly,
                      note, active)
VALUES (1179, 117, 'I-28', 28, 0, '0', 0, '0', 0, 'IGST', 1);

-- IRELAND (id country=8)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (81, 8, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (82, 8, '23', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (83, 8, '13.5', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (84, 8, '9', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (85, 8, '4.8', '0', 'VAT rate - reduced', 1);

-- ITALY (id country=3)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (31, 3, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (32, 3, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (33, 3, '4', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (34, 3, '22', '0', 'VAT rate - standard', 1);

-- IVORY COST (id country=21)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (211, 21, '0', '0', 0, 0, 0, 0, 'IVA Rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (212, 21, '18', '0', 7.5, 2, 0, 0, 'IVA standard rate', 1);

-- JAPAN (id country=123)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1231, 123, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1232, 123, '5', '0', 'VAT rate 5', 1);

-- LUXEMBOURG (id country=140)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1401, 140, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1402, 140, '14', '0', 'VAT rate - intermediary', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1403, 140, '8', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1404, 140, '3', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1405, 140, '16', '0', 'VAT rate - standard', 1);

-- MALI (id country=147)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1471, 147, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1472, 147, '18', '0', 'VAT rate - standard', 1);

-- MONACO (id country=27)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (271, 27, '0', '0', 'VAT rate 0 ou non applicable', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (272, 27, '8.5', '0', 'VAT rate - standard (DOM sauf Guyane et Saint-Martin)', 0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (273, 27, '8.5', '1',
        'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',
        0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (274, 27, '5.5', '0', 'VAT rate - reduced (France hors DOM-TOM)', 0);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (275, 27, '19.6', '0', 'VAT rate - standard (France hors DOM-TOM)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (276, 27, '2.1', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (277, 27, '7', '0', 'VAT rate - reduced', 1);

-- MAROCO (id country=12)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (121, 12, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (122, 12, '14', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (123, 12, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (124, 12, '7', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (125, 12, '20', '0', 'VAT rate - standard', 1);

-- MALTA (id country=148)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1481, 148, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1482, 148, '7', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1483, 148, '5', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1484, 148, '18', '0', 'VAT rate - standard', 1);

-- NEDERLAND (id country=17)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (171, 17, '0', '0', '0 BTW tarief', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (172, 17, '6', '0', 'Verlaagd BTW tarief', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (173, 17, '19', '0', 'Algemeen BTW tarief', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (174, 17, '21', '0', 'Algemeen BTW tarief (vanaf 1 oktober 2012)', 0);

-- NEW CALEDONIA (id country=165)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1651, 165, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1652, 165, '3', '0', 'VAT standard 3', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1653, 165, '6', '0', 'VAT standard 6', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1654, 165, '11', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1655, 165, '22', '0', 'VAT standard high', 1);

-- NEW ZEALAND (id country=166)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1661, 166, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1662, 166, '15', '0', 'VAT rate - standard', 1);

-- NIGERIA (id country=169)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1691, 169, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1692, 169, '5', '0', 'VAT rate - standard', 1);

-- NORWAY (id country=173)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1731, 173, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1732, 173, '14', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1733, 173, '8', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1734, 173, '25', '0', 'VAT rate - standard', 1);

-- PANAMA (id country=178)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1781, 178, '0', '0', 'ITBMS Rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1782, 178, '7', '0', 'ITBMS standard rate', 1);

-- PERU (id country=181)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1811, 181, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1818, 181, '18', '0', 'VAT rate - standard', 1);

-- POLAND (id country=184)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1841, 184, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1842, 184, '8', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1843, 184, '3', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1844, 184, '23', '0', 'VAT rate - standard', 1);

-- PORTUGAL (id country=25)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (251, 25, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (252, 25, '13', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (253, 25, '23', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (254, 25, '6', '0', 'VAT rate - reduced', 1);

-- ROMANIA (id country=188)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1881, 188, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1882, 188, '9', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1883, 188, '19', '0', 'VAT rate - standard', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1884, 188, '5', '0', 'VAT rate - reduced', 1);

-- SAUDI ARABIA (id country=26)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (261, 26, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (262, 26, '5', '0', 'VAT rate 5', 1);

-- SAN SALVADOR (id country=86)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (861, 86, '0', '0', 'SIN IVA', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (862, 86, '13', '0', 'IVA 13', 1);

-- SENEGAL (id country=22)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (221, 22, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (222, 22, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (223, 22, '18', '0', 'VAT rate - standard', 1);

-- SLOVAKIA (id country=201)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2011, 201, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2012, 201, '10', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2013, 201, '20', '0', 'VAT rate - standard', 1);

-- SLOVENIA (id country=202)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2021, 202, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2022, 202, '9.5', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2023, 202, '22', '0', 'VAT rate - standard', 1);

-- SOUTH AFRICA (id country=205)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2051, 205, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2052, 205, '15', '0', 'VAT rate - standard', 1);

-- SPAIN (id country=4)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (41, 4, '0', '0', '0', '3', '-19:-15:-9', '5', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (42, 4, '10', '0', '1.4', '3', '-19:-15:-9', '5', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (43, 4, '4', '0', '0.5', '3', '-19:-15:-9', '5', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, localtax1, localtax1_type, localtax2, localtax2_type, note,
                      active)
VALUES (44, 4, '21', '0', '5.2', '3', '-19:-15:-9', '5', 'VAT rate - standard', 1);

-- SWEDEN (id country=20)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (201, 20, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (202, 20, '12', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (203, 20, '6', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (204, 20, '25', '0', 'VAT rate - standard', 1);

-- SWITZERLAND (id country=6)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (61, 6, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (62, 6, '3.8', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (63, 6, '2.6', '0', 'VAT rate - super-reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (64, 6, '8.1', '0', 'VAT rate - standard', 1);

-- SRI LANKA (id country=207)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2071, 207, '0', '0', 'VAT 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2072, 207, '15', '0', 'VAT 15%', 1);

-- TAIWAN (id country=213)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2131, 213, '0', '0', 'VAT 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2132, 213, '5', '0', 'VAT 5%', 1);

-- TUNISIA (id country=10)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (101, 10, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (102, 10, '12', '0', 'VAT 12%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (103, 10, '18', '0', 'VAT 18%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (104, 10, '7.5', '0', 'VAT 6% Majoré à 25% (7.5%)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (105, 10, '15', '0', 'VAT 12% Majoré à 25% (15%)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (106, 10, '22.5', '0', 'VAT 18% Majoré à 25% (22.5%)', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (107, 10, '6', '0', 'VAT 6%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active, localtax1, localtax1_type, localtax2,
                      localtax2_type)
VALUES (108, 10, '18.18', '0', 'VAT 18%+FODEC', 1, 1, '4', 0, 0);

-- UKRAINE (id country=226)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2261, 226, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2262, 226, '20', '0', 'VAT standart rate', 1);

-- UNITED OF KINGDOM (id country=7)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (71, 7, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (72, 7, '17.5', '0', 'VAT rate - standard before 2011', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (73, 7, '5', '0', 'VAT rate - reduced', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (74, 7, '20', '0', 'VAT rate - standard', 1);

-- UNITED STATES (id country=11)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (111, 11, '0', '0', 'No Sales Tax', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (112, 11, '4', '0', 'Sales Tax 4%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (113, 11, '6', '0', 'Sales Tax 6%', 1);


-- Pour les DOM-TOM, il faut utiliser le pays FRANCE (Sinon pb avec regles de TVA et autres regles propres aux pays et europe)

-- SAINT PIERRE ET MIQUELON (id country=19)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1931, 193, '0', '0', 'No VAT in SPM', 1);

-- SAINT MARTIN (id country=24)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2461, 246, '0', '0', 'VAT rate 0', 1);


-- MAURITANIA (id country=151)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1511, 151, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1512, 151, '14', '0', 'VAT rate 14', 1);

-- MAURITIUS (id country=152)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1521, 152, '0', '0', 'VAT rate 0', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1522, 152, '15', '0', 'VAT rate 15', 1);

-- HONDURAS (id country=114)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1141, 114, '0', '0', 'No ISV', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1142, 114, '12', '0', 'ISV 12%', 1);

-- MEXIQUE (id country=154)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1541, 154, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1542, 154, '16', '0', 'VAT 16%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (1543, 154, '10', '0', 'VAT Frontero', 1);

-- BARBADOS (id country=46)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (461, 46, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (462, 46, '15', '0', 'VAT 15%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (463, 46, '7.5', '0', 'VAT 7.5%', 1);

-- VENEZUELA (id country=232)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2321, 232, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2322, 232, '12', '0', 'VAT 12%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2323, 232, '8', '0', 'VAT 8%', 1);

-- VIETNAM (id country=233)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2331, 233, '0', '0', 'Thuế GTGT đươc khấu trừ 0%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2332, 233, '5', '0', 'Thuế GTGT đươc khấu trừ 5%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2333, 233, '8', '0', 'Thuế GTGT đươc khấu trừ 8%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2334, 233, '10', '0', 'Thuế GTGT đươc khấu trừ 10%', 1);
-- Example of code to insert a VAT rate 0 for each country
-- delete from llx_c_tva where rowid = 1181;		-- to delete a record that does not follow rules for rowid (fk_pays+'1')
-- INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active) SELECT CONCAT(c.rowid, '1'), c.rowid, 0, 0, 'No VAT', 1 from llx_c_country as c where c.rowid not in (select fk_pays from llx_c_tva);

-- BURUNDI (id country=61) -- https://www.objectif-import-export.fr/fr/marches-internationaux/fiche-pays/burundi/presentation-fiscalite
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2335, 61, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2336, 61, '10', '0', 'VAT 10%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (2337, 61, '18', '0', 'VAT 18%', 1);

-- Turkiye (Turkey) (id country=221)
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (22101, 221, '0', '0', 'No VAT', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (22102, 221, '1', '0', 'VAT 1%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (22103, 221, '8', '0', 'VAT 8%', 1);
INSERT INTO llx_c_tva(rowid, fk_pays, taux, recuperableonly, note, active)
VALUES (22104, 221, '18', '0', 'VAT 18%', 1);
