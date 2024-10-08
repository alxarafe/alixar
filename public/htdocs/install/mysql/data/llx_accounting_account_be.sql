-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2011-2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
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

-- Descriptif des plans comptables BE PCMN-BASE
-- ID 439-1357
-- ADD 200000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 439, 'PCMN-BASE', 'CAPIT', '10', '1351', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 440, 'PCMN-BASE', 'CAPIT', '100', '439', 'Capital souscrit ou capital personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 441, 'PCMN-BASE', 'CAPIT', '1000', '440', 'Capital non amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 442, 'PCMN-BASE', 'CAPIT', '1001', '440', 'Capital amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 443, 'PCMN-BASE', 'CAPIT', '101', '439', 'Capital non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 444, 'PCMN-BASE', 'CAPIT', '109', '439', 'Compte de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 445, 'PCMN-BASE', 'CAPIT', '1090', '444', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 446, 'PCMN-BASE', 'CAPIT', '1091', '444', 'Impôts personnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 447, 'PCMN-BASE', 'CAPIT', '1092', '444', 'Rémunérations et autres avantages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 448, 'PCMN-BASE', 'CAPIT', '11', '1351', 'Primes d''émission', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 449, 'PCMN-BASE', 'CAPIT', '12', '1351', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 450, 'PCMN-BASE', 'CAPIT', '120', '449',
        'Plus-values de réévaluation sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 451, 'PCMN-BASE', 'CAPIT', '1200', '450', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 452, 'PCMN-BASE', 'CAPIT', '1201', '450', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 453, 'PCMN-BASE', 'CAPIT', '121', '449',
        'Plus-values de réévaluation sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 454, 'PCMN-BASE', 'CAPIT', '1210', '453', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 455, 'PCMN-BASE', 'CAPIT', '1211', '453', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 456, 'PCMN-BASE', 'CAPIT', '122', '449',
        'Plus-values de réévaluation sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 457, 'PCMN-BASE', 'CAPIT', '1220', '456', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 458, 'PCMN-BASE', 'CAPIT', '1221', '456', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 459, 'PCMN-BASE', 'CAPIT', '123', '449', 'Plus-values de réévaluation sur stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 460, 'PCMN-BASE', 'CAPIT', '124', '449',
        'Reprises de réductions de valeur sur placements de trésorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 461, 'PCMN-BASE', 'CAPIT', '13', '1351', 'Réserve', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 462, 'PCMN-BASE', 'CAPIT', '130', '461', 'Réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 463, 'PCMN-BASE', 'CAPIT', '131', '461', 'Réserves indisponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 464, 'PCMN-BASE', 'CAPIT', '1310', '463', 'Réserve pour actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 465, 'PCMN-BASE', 'CAPIT', '1311', '463', 'Autres réserves indisponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 466, 'PCMN-BASE', 'CAPIT', '132', '461', 'Réserves immunisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 467, 'PCMN-BASE', 'CAPIT', '133', '461', 'Réserves disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 468, 'PCMN-BASE', 'CAPIT', '1330', '467', 'Réserve pour régularisation de dividendes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 469, 'PCMN-BASE', 'CAPIT', '1331', '467', 'Réserve pour renouvellement des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 470, 'PCMN-BASE', 'CAPIT', '1332', '467',
        'Réserve pour installations en faveur du personnel 1333 Réserves libres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 471, 'PCMN-BASE', 'CAPIT', '14', '1351', 'Bénéfice reporté (ou perte reportée)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 472, 'PCMN-BASE', 'CAPIT', '15', '1351', 'Subsides en capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 473, 'PCMN-BASE', 'CAPIT', '150', '472', 'Montants obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 474, 'PCMN-BASE', 'CAPIT', '151', '472', 'Montants transférés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 475, 'PCMN-BASE', 'CAPIT', '16', '1351', 'Provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 476, 'PCMN-BASE', 'CAPIT', '160', '475', 'Provisions pour pensions et obligations similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 477, 'PCMN-BASE', 'CAPIT', '161', '475', 'Provisions pour charges fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 478, 'PCMN-BASE', 'CAPIT', '162', '475', 'Provisions pour grosses réparations et gros entretiens',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 479, 'PCMN-BASE', 'CAPIT', '163', '475', 'à 169 Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 480, 'PCMN-BASE', 'CAPIT', '164', '475',
        'Provisions pour sûretés personnelles ou réelles constituées à l''appui de dettes et d''engagements de tiers',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 481, 'PCMN-BASE', 'CAPIT', '165', '475',
        'Provisions pour engagements relatifs à l''acquisition ou à la cession d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 482, 'PCMN-BASE', 'CAPIT', '166', '475', 'Provisions pour exécution de commandes passées ou reçues',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 483, 'PCMN-BASE', 'CAPIT', '167', '475',
        'Provisions pour positions et marchés à terme en devises ou positions et marchés à terme en marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 484, 'PCMN-BASE', 'CAPIT', '168', '475',
        'Provisions pour garanties techniques attachées aux ventes et prestations déjà effectuées par l''entreprise',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 485, 'PCMN-BASE', 'CAPIT', '169', '475', 'Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 486, 'PCMN-BASE', 'CAPIT', '1690', '485', 'Pour litiges en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 487, 'PCMN-BASE', 'CAPIT', '1691', '485', 'Pour amendes, doubles droits et pénalités', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 488, 'PCMN-BASE', 'CAPIT', '1692', '485', 'Pour propre assureur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 489, 'PCMN-BASE', 'CAPIT', '1693', '485',
        'Pour risques inhérents aux opérations de crédits à moyen ou long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 490, 'PCMN-BASE', 'CAPIT', '1695', '485', 'Provision pour charge de liquidation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 491, 'PCMN-BASE', 'CAPIT', '1696', '485', 'Provision pour départ de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 492, 'PCMN-BASE', 'CAPIT', '1699', '485', 'Pour risques divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 493, 'PCMN-BASE', 'CAPIT', '17', '1351', 'Dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 494, 'PCMN-BASE', 'CAPIT', '170', '493', 'Emprunts subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 495, 'PCMN-BASE', 'CAPIT', '1700', '494', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 496, 'PCMN-BASE', 'CAPIT', '1701', '494', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 497, 'PCMN-BASE', 'CAPIT', '171', '493', 'Emprunts obligataires non subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 498, 'PCMN-BASE', 'CAPIT', '1710', '498', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 499, 'PCMN-BASE', 'CAPIT', '1711', '498', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 500, 'PCMN-BASE', 'CAPIT', '172', '493', 'Dettes de location-financement et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 501, 'PCMN-BASE', 'CAPIT', '1720', '500', 'Dettes de location-financement de biens immobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 502, 'PCMN-BASE', 'CAPIT', '1721', '500', 'Dettes de location-financement de biens mobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 503, 'PCMN-BASE', 'CAPIT', '1722', '500', 'Dettes sur droits réels sur immeubles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 504, 'PCMN-BASE', 'CAPIT', '173', '493', 'Etablissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 505, 'PCMN-BASE', 'CAPIT', '1730', '504', 'Dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 506, 'PCMN-BASE', 'CAPIT', '17300', '505', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 507, 'PCMN-BASE', 'CAPIT', '17301', '505', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 508, 'PCMN-BASE', 'CAPIT', '17302', '505', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 509, 'PCMN-BASE', 'CAPIT', '17303', '505', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 510, 'PCMN-BASE', 'CAPIT', '1731', '504', 'Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 511, 'PCMN-BASE', 'CAPIT', '17310', '510', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 512, 'PCMN-BASE', 'CAPIT', '17311', '510', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 513, 'PCMN-BASE', 'CAPIT', '17312', '510', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 514, 'PCMN-BASE', 'CAPIT', '17313', '510', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 515, 'PCMN-BASE', 'CAPIT', '1732', '504', 'Crédits d''acceptation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 516, 'PCMN-BASE', 'CAPIT', '17320', '515', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 517, 'PCMN-BASE', 'CAPIT', '17321', '515', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 518, 'PCMN-BASE', 'CAPIT', '17322', '515', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 519, 'PCMN-BASE', 'CAPIT', '17323', '515', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 520, 'PCMN-BASE', 'CAPIT', '174', '493', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 521, 'PCMN-BASE', 'CAPIT', '175', '493', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 522, 'PCMN-BASE', 'CAPIT', '1750', '521', 'Fournisseurs : dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 523, 'PCMN-BASE', 'CAPIT', '17500', '522', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 524, 'PCMN-BASE', 'CAPIT', '175000', '523', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 525, 'PCMN-BASE', 'CAPIT', '175001', '523',
        'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526, 'PCMN-BASE', 'CAPIT', '17501', '522', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 527, 'PCMN-BASE', 'CAPIT', '175010', '526', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 528, 'PCMN-BASE', 'CAPIT', '175011', '526', 'Fournisseurs C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 529, 'PCMN-BASE', 'CAPIT', '175012', '526', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 530, 'PCMN-BASE', 'CAPIT', '1751', '521', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 531, 'PCMN-BASE', 'CAPIT', '17510', '530', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 532, 'PCMN-BASE', 'CAPIT', '175100', '531', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 533, 'PCMN-BASE', 'CAPIT', '175101', '531',
        'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 534, 'PCMN-BASE', 'CAPIT', '17511', '530', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 535, 'PCMN-BASE', 'CAPIT', '175110', '534', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 536, 'PCMN-BASE', 'CAPIT', '175111', '534', 'Fournisseurs C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 537, 'PCMN-BASE', 'CAPIT', '175112', '534', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 538, 'PCMN-BASE', 'CAPIT', '176', '493', 'Acomptes reçus sur commandes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 539, 'PCMN-BASE', 'CAPIT', '178', '493', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 540, 'PCMN-BASE', 'CAPIT', '179', '493', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 541, 'PCMN-BASE', 'CAPIT', '1790', '540', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 542, 'PCMN-BASE', 'CAPIT', '1791', '540',
        'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 543, 'PCMN-BASE', 'CAPIT', '1792', '540', 'Administrateurs, gérants et associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 544, 'PCMN-BASE', 'CAPIT', '1794', '540', 'Rentes viagères capitalisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 545, 'PCMN-BASE', 'CAPIT', '1798', '540',
        'Dettes envers les coparticipants des associations momentanées et en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 546, 'PCMN-BASE', 'CAPIT', '1799', '540', 'Autres dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 547, 'PCMN-BASE', 'CAPIT', '18', '1351', 'Comptes de liaison des établissements et succursales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 548, 'PCMN-BASE', 'IMMO', '20', '1352', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 549, 'PCMN-BASE', 'IMMO', '200', '548', 'Frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 550, 'PCMN-BASE', 'IMMO', '2000', '549', 'Frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 551, 'PCMN-BASE', 'IMMO', '2009', '549',
        'Amortissements sur frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 552, 'PCMN-BASE', 'IMMO', '201', '548', 'Frais d''émission d''emprunts et primes de remboursement',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 553, 'PCMN-BASE', 'IMMO', '2010', '552', 'Agios sur emprunts et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 554, 'PCMN-BASE', 'IMMO', '2019', '552',
        'Amortissements sur agios sur emprunts et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 555, 'PCMN-BASE', 'IMMO', '202', '548', 'Autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 556, 'PCMN-BASE', 'IMMO', '2020', '555', 'Autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 557, 'PCMN-BASE', 'IMMO', '2029', '555', 'Amortissements sur autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 558, 'PCMN-BASE', 'IMMO', '203', '548', 'Intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 559, 'PCMN-BASE', 'IMMO', '2030', '558', 'Intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 560, 'PCMN-BASE', 'IMMO', '2039', '558', 'Amortissements sur intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 561, 'PCMN-BASE', 'IMMO', '204', '548', 'Frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 562, 'PCMN-BASE', 'IMMO', '2040', '561', 'Coût des frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 563, 'PCMN-BASE', 'IMMO', '2049', '561', 'Amortissements sur frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 564, 'PCMN-BASE', 'IMMO', '21', '1352', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 565, 'PCMN-BASE', 'IMMO', '210', '564', 'Frais de recherche et de développement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 566, 'PCMN-BASE', 'IMMO', '2100', '565', 'Frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 567, 'PCMN-BASE', 'IMMO', '2108', '565',
        'Plus-values actées sur frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 568, 'PCMN-BASE', 'IMMO', '2109', '565',
        'Amortissements sur frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 569, 'PCMN-BASE', 'IMMO', '211', '564',
        'Concessions, brevets, licences, savoir-faire, marque et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 570, 'PCMN-BASE', 'IMMO', '2110', '569', 'Concessions, brevets, licences, marques, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 571, 'PCMN-BASE', 'IMMO', '2118', '569', 'Plus-values actées sur concessions, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 572, 'PCMN-BASE', 'IMMO', '2119', '569', 'Amortissements sur concessions, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 573, 'PCMN-BASE', 'IMMO', '212', '564', 'Goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 574, 'PCMN-BASE', 'IMMO', '2120', '573', 'Coût d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 575, 'PCMN-BASE', 'IMMO', '2128', '573', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 576, 'PCMN-BASE', 'IMMO', '2129', '573', 'Amortissements sur goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 577, 'PCMN-BASE', 'IMMO', '213', '564', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 578, 'PCMN-BASE', 'IMMO', '22', '1352', 'Terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 579, 'PCMN-BASE', 'IMMO', '220', '578', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 580, 'PCMN-BASE', 'IMMO', '2200', '579', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 581, 'PCMN-BASE', 'IMMO', '2201', '579', 'Frais d''acquisition sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 582, 'PCMN-BASE', 'IMMO', '2208', '579', 'Plus-values actées sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 583, 'PCMN-BASE', 'IMMO', '2209', '579', 'Amortissements et réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 584, 'PCMN-BASE', 'IMMO', '22090', '583', 'Amortissements sur frais d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 585, 'PCMN-BASE', 'IMMO', '22091', '583', 'Réductions de valeur sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 586, 'PCMN-BASE', 'IMMO', '221', '578', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 587, 'PCMN-BASE', 'IMMO', '2210', '586', 'Bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 588, 'PCMN-BASE', 'IMMO', '2211', '586', 'Bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 589, 'PCMN-BASE', 'IMMO', '2212', '586', 'Autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 590, 'PCMN-BASE', 'IMMO', '2213', '586', 'Voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 591, 'PCMN-BASE', 'IMMO', '2215', '586', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 592, 'PCMN-BASE', 'IMMO', '2216', '586', 'Frais d''acquisition sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 593, 'PCMN-BASE', 'IMMO', '2218', '586', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 594, 'PCMN-BASE', 'IMMO', '22180', '593', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 595, 'PCMN-BASE', 'IMMO', '22181', '593', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 596, 'PCMN-BASE', 'IMMO', '22182', '593', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 597, 'PCMN-BASE', 'IMMO', '22184', '593', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 598, 'PCMN-BASE', 'IMMO', '2219', '586', 'Amortissements sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 599, 'PCMN-BASE', 'IMMO', '22190', '598', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 600, 'PCMN-BASE', 'IMMO', '22191', '598', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 601, 'PCMN-BASE', 'IMMO', '22192', '598', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 602, 'PCMN-BASE', 'IMMO', '22194', '598', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 603, 'PCMN-BASE', 'IMMO', '22195', '598', 'Sur constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 604, 'PCMN-BASE', 'IMMO', '22196', '598', 'Sur frais d''acquisition sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 605, 'PCMN-BASE', 'IMMO', '222', '578', 'Terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 606, 'PCMN-BASE', 'IMMO', '2220', '605', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 607, 'PCMN-BASE', 'IMMO', '22200', '606', 'Bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 608, 'PCMN-BASE', 'IMMO', '22201', '606', 'Bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 609, 'PCMN-BASE', 'IMMO', '22202', '606', 'Autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 610, 'PCMN-BASE', 'IMMO', '22203', '606', 'Voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 611, 'PCMN-BASE', 'IMMO', '22204', '606', 'Frais d''acquisition des terrains à bâtir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 612, 'PCMN-BASE', 'IMMO', '2228', '605', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 613, 'PCMN-BASE', 'IMMO', '22280', '612', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 614, 'PCMN-BASE', 'IMMO', '22281', '612', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 615, 'PCMN-BASE', 'IMMO', '22282', '612', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 616, 'PCMN-BASE', 'IMMO', '22283', '612', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 617, 'PCMN-BASE', 'IMMO', '2229', '605', 'Amortissements sur terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 618, 'PCMN-BASE', 'IMMO', '22290', '617', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 619, 'PCMN-BASE', 'IMMO', '22291', '617', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 620, 'PCMN-BASE', 'IMMO', '22292', '617', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 621, 'PCMN-BASE', 'IMMO', '22293', '617', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 622, 'PCMN-BASE', 'IMMO', '22294', '617', 'Sur frais d''acquisition des terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 623, 'PCMN-BASE', 'IMMO', '223', '578', 'Autres droits réels sur des immeubles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 624, 'PCMN-BASE', 'IMMO', '2230', '623', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 625, 'PCMN-BASE', 'IMMO', '2238', '623', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 626, 'PCMN-BASE', 'IMMO', '2239', '623', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 627, 'PCMN-BASE', 'IMMO', '23', '1352', 'Installations, machines et outillages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 628, 'PCMN-BASE', 'IMMO', '230', '627', 'Installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 629, 'PCMN-BASE', 'IMMO', '2300', '628', 'Installations bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 630, 'PCMN-BASE', 'IMMO', '2301', '628', 'Installations bâtiments administratifs et commerciaux',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 631, 'PCMN-BASE', 'IMMO', '2302', '628', 'Installations bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 632, 'PCMN-BASE', 'IMMO', '2303', '628', 'Installations voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 633, 'PCMN-BASE', 'IMMO', '2304', '628', 'Installation d''eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 634, 'PCMN-BASE', 'IMMO', '2305', '628', 'Installation d''électricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 635, 'PCMN-BASE', 'IMMO', '2306', '628', 'Installation de vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 636, 'PCMN-BASE', 'IMMO', '2307', '628', 'Installation de gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 637, 'PCMN-BASE', 'IMMO', '2308', '628', 'Installation de chauffage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 638, 'PCMN-BASE', 'IMMO', '2309', '628', 'Installation de conditionnement d''air', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 640, 'PCMN-BASE', 'IMMO', '231', '627', 'Machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 641, 'PCMN-BASE', 'IMMO', '2310', '640', 'Division A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 642, 'PCMN-BASE', 'IMMO', '2311', '640', 'Division B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 643, 'PCMN-BASE', 'IMMO', '2312', '640', 'Division C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 644, 'PCMN-BASE', 'IMMO', '237', '627', 'Outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 645, 'PCMN-BASE', 'IMMO', '2370', '644', 'Division A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 646, 'PCMN-BASE', 'IMMO', '2371', '644', 'Division B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 647, 'PCMN-BASE', 'IMMO', '2372', '644', 'Division C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 648, 'PCMN-BASE', 'IMMO', '238', '627', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 649, 'PCMN-BASE', 'IMMO', '2380', '648', 'Sur installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 650, 'PCMN-BASE', 'IMMO', '2381', '648', 'Sur machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 651, 'PCMN-BASE', 'IMMO', '2382', '648', 'Sur outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 652, 'PCMN-BASE', 'IMMO', '239', '627', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 653, 'PCMN-BASE', 'IMMO', '2390', '652', 'Sur installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 654, 'PCMN-BASE', 'IMMO', '2391', '652', 'Sur machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 655, 'PCMN-BASE', 'IMMO', '2392', '652', 'Sur outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 656, 'PCMN-BASE', 'IMMO', '24', '1352', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 657, 'PCMN-BASE', 'IMMO', '240', '656', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 658, 'PCMN-BASE', 'IMMO', '2400', '656', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 659, 'PCMN-BASE', 'IMMO', '24000', '658', 'Mobilier des bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 660, 'PCMN-BASE', 'IMMO', '24001', '658', 'Mobilier des bâtiments administratifs et commerciaux',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 661, 'PCMN-BASE', 'IMMO', '24002', '658', 'Mobilier des autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 662, 'PCMN-BASE', 'IMMO', '24003', '658', 'Mobilier oeuvres sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 663, 'PCMN-BASE', 'IMMO', '2401', '657', 'Matériel de bureau et de service social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 664, 'PCMN-BASE', 'IMMO', '24010', '663', 'Des bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 665, 'PCMN-BASE', 'IMMO', '24011', '663', 'Des bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 666, 'PCMN-BASE', 'IMMO', '24012', '663', 'Des autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 667, 'PCMN-BASE', 'IMMO', '24013', '663', 'Des oeuvres sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 668, 'PCMN-BASE', 'IMMO', '2408', '657', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 669, 'PCMN-BASE', 'IMMO', '24080', '668', 'Plus-values actées sur mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 670, 'PCMN-BASE', 'IMMO', '24081', '668',
        'Plus-values actées sur matériel de bureau et service social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 671, 'PCMN-BASE', 'IMMO', '2409', '657', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 672, 'PCMN-BASE', 'IMMO', '24090', '671', 'Amortissements sur mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 673, 'PCMN-BASE', 'IMMO', '24091', '671', 'Amortissements sur matériel de bureau et service social',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 674, 'PCMN-BASE', 'IMMO', '241', '656', 'Matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 675, 'PCMN-BASE', 'IMMO', '2410', '674', 'Matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 676, 'PCMN-BASE', 'IMMO', '24100', '675', 'Voitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 677, 'PCMN-BASE', 'IMMO', '24105', '675', 'Camions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 678, 'PCMN-BASE', 'IMMO', '2411', '674', 'Matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 679, 'PCMN-BASE', 'IMMO', '2412', '674', 'Matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 680, 'PCMN-BASE', 'IMMO', '2413', '674', 'Matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 681, 'PCMN-BASE', 'IMMO', '2414', '674', 'Matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 682, 'PCMN-BASE', 'IMMO', '2418', '674', 'Plus-values sur matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 683, 'PCMN-BASE', 'IMMO', '24180', '682', 'Plus-values sur matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 684, 'PCMN-BASE', 'IMMO', '24181', '682', 'Idem sur matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 685, 'PCMN-BASE', 'IMMO', '24182', '682', 'Idem sur matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 686, 'PCMN-BASE', 'IMMO', '24183', '682', 'Idem sur matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 687, 'PCMN-BASE', 'IMMO', '24184', '682', 'Idem sur matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 688, 'PCMN-BASE', 'IMMO', '2419', '674', 'Amortissements sur matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 689, 'PCMN-BASE', 'IMMO', '24190', '688', 'Amortissements sur matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 690, 'PCMN-BASE', 'IMMO', '24191', '688', 'Idem sur matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 691, 'PCMN-BASE', 'IMMO', '24192', '688', 'Idem sur matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 692, 'PCMN-BASE', 'IMMO', '24193', '688', 'Idem sur matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 693, 'PCMN-BASE', 'IMMO', '24194', '688', 'Idem sur matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 694, 'PCMN-BASE', 'IMMO', '25', '1352',
        'Immobilisation détenues en location-financement et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 695, 'PCMN-BASE', 'IMMO', '250', '694', 'Terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 696, 'PCMN-BASE', 'IMMO', '2500', '695', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 697, 'PCMN-BASE', 'IMMO', '2501', '695', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 698, 'PCMN-BASE', 'IMMO', '2508', '695',
        'Plus-values sur emphytéose,  leasing et droits similaires : terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 699, 'PCMN-BASE', 'IMMO', '2509', '695',
        'Amortissements et réductions de valeur sur terrains et constructions en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 700, 'PCMN-BASE', 'IMMO', '251', '694', 'Installations,  machines et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 701, 'PCMN-BASE', 'IMMO', '2510', '700', 'Installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 702, 'PCMN-BASE', 'IMMO', '2511', '700', 'Machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 703, 'PCMN-BASE', 'IMMO', '2512', '700', 'Outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 704, 'PCMN-BASE', 'IMMO', '2518', '700',
        'Plus-values actées sur installations machines et outillage pris en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 705, 'PCMN-BASE', 'IMMO', '2519', '700',
        'Amortissements sur installations machines et outillage pris en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 706, 'PCMN-BASE', 'IMMO', '252', '694', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 707, 'PCMN-BASE', 'IMMO', '2520', '706', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 708, 'PCMN-BASE', 'IMMO', '2521', '706', 'Matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 709, 'PCMN-BASE', 'IMMO', '2528', '706',
        'Plus-values actées sur mobilier et matériel roulant en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 710, 'PCMN-BASE', 'IMMO', '2529', '706',
        'Amortissements sur mobilier et matériel roulant en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 711, 'PCMN-BASE', 'IMMO', '26', '1352', 'Autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 712, 'PCMN-BASE', 'IMMO', '260', '711', 'Frais d''aménagements de locaux pris en location', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 713, 'PCMN-BASE', 'IMMO', '261', '711', 'Maison d''habitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 714, 'PCMN-BASE', 'IMMO', '262', '711', 'Réserve immobilière', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 715, 'PCMN-BASE', 'IMMO', '263', '711', 'Matériel d''emballage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 716, 'PCMN-BASE', 'IMMO', '264', '711', 'Emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 717, 'PCMN-BASE', 'IMMO', '268', '711', 'Plus-values actées sur autres immobilisations corporelles',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 718, 'PCMN-BASE', 'IMMO', '269', '711', 'Amortissements sur autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 719, 'PCMN-BASE', 'IMMO', '2690', '718',
        'Amortissements sur frais d''aménagement des locaux pris en location', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 720, 'PCMN-BASE', 'IMMO', '2691', '718', 'Amortissements sur maison d''habitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 721, 'PCMN-BASE', 'IMMO', '2692', '718', 'Amortissements sur réserve immobilière', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 722, 'PCMN-BASE', 'IMMO', '2693', '718', 'Amortissements sur matériel d''emballage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 723, 'PCMN-BASE', 'IMMO', '2694', '718', 'Amortissements sur emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 724, 'PCMN-BASE', 'IMMO', '27', '1352', 'Immobilisations corporelles en cours et acomptes versés',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 725, 'PCMN-BASE', 'IMMO', '270', '724', 'Immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 726, 'PCMN-BASE', 'IMMO', '2700', '725', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 727, 'PCMN-BASE', 'IMMO', '2701', '725', 'Installations machines et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 728, 'PCMN-BASE', 'IMMO', '2702', '725', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 729, 'PCMN-BASE', 'IMMO', '2703', '725', 'Autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 730, 'PCMN-BASE', 'IMMO', '271', '724', 'Avances et acomptes versés sur immobilisations en cours',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 731, 'PCMN-BASE', 'IMMO', '28', '1352', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 732, 'PCMN-BASE', 'IMMO', '280', '731', 'Participations dans des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 733, 'PCMN-BASE', 'IMMO', '2800', '732',
        'Valeur d''acquisition (peut être subdivisé par participation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 734, 'PCMN-BASE', 'IMMO', '2801', '732', 'Montants non appelés (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 735, 'PCMN-BASE', 'IMMO', '2808', '732', 'Plus-values actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 736, 'PCMN-BASE', 'IMMO', '2809', '732', 'Réductions de valeurs actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 737, 'PCMN-BASE', 'IMMO', '281', '731', 'Créances sur des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 738, 'PCMN-BASE', 'IMMO', '2810', '737', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 739, 'PCMN-BASE', 'IMMO', '2811', '737', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 740, 'PCMN-BASE', 'IMMO', '2812', '737', 'Titres à revenu fixes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 741, 'PCMN-BASE', 'IMMO', '2817', '737', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 742, 'PCMN-BASE', 'IMMO', '2819', '737', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 743, 'PCMN-BASE', 'IMMO', '282', '731',
        'Participations dans des entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 744, 'PCMN-BASE', 'IMMO', '2820', '743',
        'Valeur d''acquisition (peut être subdivisé par participation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 745, 'PCMN-BASE', 'IMMO', '2821', '743', 'Montants non appelés (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 746, 'PCMN-BASE', 'IMMO', '2828', '743', 'Plus-values actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 747, 'PCMN-BASE', 'IMMO', '2829', '743', 'Réductions de valeurs actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 748, 'PCMN-BASE', 'IMMO', '283', '731',
        'Créances sur des entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 749, 'PCMN-BASE', 'IMMO', '2830', '748', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 750, 'PCMN-BASE', 'IMMO', '2831', '748', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 751, 'PCMN-BASE', 'IMMO', '2832', '748', 'Titres à revenu fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 752, 'PCMN-BASE', 'IMMO', '2837', '748', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 753, 'PCMN-BASE', 'IMMO', '2839', '748', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 754, 'PCMN-BASE', 'IMMO', '284', '731', 'Autres actions et parts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 755, 'PCMN-BASE', 'IMMO', '2840', '754', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 756, 'PCMN-BASE', 'IMMO', '2841', '754', 'Montants non appelés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 757, 'PCMN-BASE', 'IMMO', '2848', '754', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 758, 'PCMN-BASE', 'IMMO', '2849', '754', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 759, 'PCMN-BASE', 'IMMO', '285', '731', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 760, 'PCMN-BASE', 'IMMO', '2850', '759', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 761, 'PCMN-BASE', 'IMMO', '2851', '759', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 762, 'PCMN-BASE', 'IMMO', '2852', '759', 'Titres à revenu fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 763, 'PCMN-BASE', 'IMMO', '2857', '759', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 764, 'PCMN-BASE', 'IMMO', '2859', '759', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 765, 'PCMN-BASE', 'IMMO', '288', '731', 'Cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 766, 'PCMN-BASE', 'IMMO', '2880', '765', 'Téléphone, téléfax, télex', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 767, 'PCMN-BASE', 'IMMO', '2881', '765', 'Gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 768, 'PCMN-BASE', 'IMMO', '2882', '765', 'Eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 769, 'PCMN-BASE', 'IMMO', '2883', '765', 'Electricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 770, 'PCMN-BASE', 'IMMO', '2887', '765', 'Autres cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 771, 'PCMN-BASE', 'IMMO', '29', '1352', 'Créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 772, 'PCMN-BASE', 'IMMO', '290', '771', 'Créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 773, 'PCMN-BASE', 'IMMO', '2900', '772', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 774, 'PCMN-BASE', 'IMMO', '29000', '773', 'Créances en compte sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 775, 'PCMN-BASE', 'IMMO', '29001', '773',
        'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 776, 'PCMN-BASE', 'IMMO', '29002', '773', 'Sur clients Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 777, 'PCMN-BASE', 'IMMO', '29003', '773', 'Sur clients C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 778, 'PCMN-BASE', 'IMMO', '29004', '773', 'Sur clients exportation hors C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 779, 'PCMN-BASE', 'IMMO', '29005', '773',
        'Créances sur les coparticipants (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 780, 'PCMN-BASE', 'IMMO', '2901', '772', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 781, 'PCMN-BASE', 'IMMO', '29010', '780', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 782, 'PCMN-BASE', 'IMMO', '29011', '780',
        'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 783, 'PCMN-BASE', 'IMMO', '29012', '780', 'Sur clients Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 784, 'PCMN-BASE', 'IMMO', '29013', '780', 'Sur clients C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 785, 'PCMN-BASE', 'IMMO', '29014', '780', 'Sur clients exportation hors C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 786, 'PCMN-BASE', 'IMMO', '2905', '772', 'Retenues sur garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 787, 'PCMN-BASE', 'IMMO', '2906', '772', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 788, 'PCMN-BASE', 'IMMO', '2907', '772', 'Créances douteuses (à ventiler comme clients 2900)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 789, 'PCMN-BASE', 'IMMO', '2909', '772',
        'Réductions de valeur actées (à ventiler comme clients 2900)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 790, 'PCMN-BASE', 'IMMO', '291', '771', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 791, 'PCMN-BASE', 'IMMO', '2910', '790', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 792, 'PCMN-BASE', 'IMMO', '29100', '791', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 793, 'PCMN-BASE', 'IMMO', '29101', '791',
        'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 794, 'PCMN-BASE', 'IMMO', '29102', '791', 'Sur autres débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 795, 'PCMN-BASE', 'IMMO', '2911', '790', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 796, 'PCMN-BASE', 'IMMO', '29110', '795', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 797, 'PCMN-BASE', 'IMMO', '29111', '795',
        'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 798, 'PCMN-BASE', 'IMMO', '29112', '795', 'Sur autres débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 799, 'PCMN-BASE', 'IMMO', '2912', '790',
        'Créances résultant de la cession d''immobilisations données en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 800, 'PCMN-BASE', 'IMMO', '2917', '790', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 801, 'PCMN-BASE', 'IMMO', '2919', '790', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 802, 'PCMN-BASE', 'STOCK', '30', '1353', 'Approvisionnements - matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 803, 'PCMN-BASE', 'STOCK', '300', '802', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 804, 'PCMN-BASE', 'STOCK', '309', '802', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 805, 'PCMN-BASE', 'STOCK', '31', '1353', 'Approvsionnements et fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 806, 'PCMN-BASE', 'STOCK', '310', '805', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 807, 'PCMN-BASE', 'STOCK', '3100', '806', 'Matières d''approvisionnement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 808, 'PCMN-BASE', 'STOCK', '3101', '806', 'Energie, charbon, coke, mazout, essence, propane', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 809, 'PCMN-BASE', 'STOCK', '3102', '806', 'Produits d''entretien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 810, 'PCMN-BASE', 'STOCK', '3103', '806', 'Fournitures diverses et petit outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 811, 'PCMN-BASE', 'STOCK', '3104', '806', 'Imprimés et fournitures de bureau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 812, 'PCMN-BASE', 'STOCK', '3105', '806', 'Fournitures de services sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 813, 'PCMN-BASE', 'STOCK', '3106', '806', 'Emballages commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 814, 'PCMN-BASE', 'STOCK', '31060', '813', 'Emballages perdus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 815, 'PCMN-BASE', 'STOCK', '31061', '813', 'Emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 816, 'PCMN-BASE', 'STOCK', '319', '805', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 817, 'PCMN-BASE', 'STOCK', '32', '1353', 'En cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 818, 'PCMN-BASE', 'STOCK', '320', '817', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 819, 'PCMN-BASE', 'STOCK', '3200', '818', 'Produits semi-ouvrés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 820, 'PCMN-BASE', 'STOCK', '3201', '818', 'Produits en cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 821, 'PCMN-BASE', 'STOCK', '3202', '818', 'Travaux en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 822, 'PCMN-BASE', 'STOCK', '3205', '818', 'Déchets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 823, 'PCMN-BASE', 'STOCK', '3206', '818', 'Rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 824, 'PCMN-BASE', 'STOCK', '3209', '818', 'Travaux en association momentanée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 825, 'PCMN-BASE', 'STOCK', '329', '817', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 826, 'PCMN-BASE', 'STOCK', '33', '1353', 'Produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 827, 'PCMN-BASE', 'STOCK', '330', '826', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 828, 'PCMN-BASE', 'STOCK', '3300', '827', 'Produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 829, 'PCMN-BASE', 'STOCK', '339', '826', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 830, 'PCMN-BASE', 'STOCK', '34', '1353', 'Marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 831, 'PCMN-BASE', 'STOCK', '340', '830', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 832, 'PCMN-BASE', 'STOCK', '3400', '831', 'Groupe A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 833, 'PCMN-BASE', 'STOCK', '3401', '831', 'Groupe B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 834, 'PCMN-BASE', 'STOCK', '3402', '831', 'Groupe C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 835, 'PCMN-BASE', 'STOCK', '349', '830', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 836, 'PCMN-BASE', 'STOCK', '35', '1353', 'Immeubles destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 837, 'PCMN-BASE', 'STOCK', '350', '836', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 838, 'PCMN-BASE', 'STOCK', '3500', '837', 'Immeuble A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 839, 'PCMN-BASE', 'STOCK', '3501', '837', 'Immeuble B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 840, 'PCMN-BASE', 'STOCK', '3502', '837', 'Immeuble C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 841, 'PCMN-BASE', 'STOCK', '351', '836', 'Immeubles construits en vue de leur revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 842, 'PCMN-BASE', 'STOCK', '3510', '841', 'Immeuble A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 843, 'PCMN-BASE', 'STOCK', '3511', '841', 'Immeuble B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 844, 'PCMN-BASE', 'STOCK', '3512', '841', 'Immeuble C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 845, 'PCMN-BASE', 'STOCK', '359', '836', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 846, 'PCMN-BASE', 'STOCK', '36', '1353', 'Acomptes versés sur achats pour stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 847, 'PCMN-BASE', 'STOCK', '360', '846',
        'Acomptes versés (à ventiler éventuellement par catégorie)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 848, 'PCMN-BASE', 'STOCK', '369', '846', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 849, 'PCMN-BASE', 'STOCK', '37', '1353', 'Commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 850, 'PCMN-BASE', 'STOCK', '370', '849', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 851, 'PCMN-BASE', 'STOCK', '371', '849', 'Bénéfice pris en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 852, 'PCMN-BASE', 'STOCK', '379', '849', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 853, 'PCMN-BASE', 'THIRDPARTY', '40', '1354', 'Créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 854, 'PCMN-BASE', 'THIRDPARTY', '400', '853', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 855, 'PCMN-BASE', 'THIRDPARTY', '4007', '854',
        'Rabais, remises et  ristournes à accorder et autres notes de crédit à établir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 856, 'PCMN-BASE', 'THIRDPARTY', '4008', '854',
        'Créances résultant de livraisons de biens (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 857, 'PCMN-BASE', 'THIRDPARTY', '401', '853', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 858, 'PCMN-BASE', 'THIRDPARTY', '4010', '857', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 859, 'PCMN-BASE', 'THIRDPARTY', '4013', '857', 'Effets à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 860, 'PCMN-BASE', 'THIRDPARTY', '4015', '857', 'Effets à l''escompte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 861, 'PCMN-BASE', 'THIRDPARTY', '402', '853',
        'Clients, créances courantes, entreprises apparentées, administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 862, 'PCMN-BASE', 'THIRDPARTY', '4020', '861', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 863, 'PCMN-BASE', 'THIRDPARTY', '4021', '861',
        'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 864, 'PCMN-BASE', 'THIRDPARTY', '4022', '861', 'Administrateurs et gérants d''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 865, 'PCMN-BASE', 'THIRDPARTY', '403', '853',
        'Effets à recevoir sur entreprises apparentées et administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 866, 'PCMN-BASE', 'THIRDPARTY', '4030', '865', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 867, 'PCMN-BASE', 'THIRDPARTY', '4031', '865',
        'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 868, 'PCMN-BASE', 'THIRDPARTY', '4032', '865', 'Administrateurs et gérants de l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 869, 'PCMN-BASE', 'THIRDPARTY', '404', '853', 'Produits à recevoir (factures à établir)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 870, 'PCMN-BASE', 'THIRDPARTY', '405', '853', 'Clients : retenues sur garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 871, 'PCMN-BASE', 'THIRDPARTY', '406', '853', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 872, 'PCMN-BASE', 'THIRDPARTY', '407', '853', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 873, 'PCMN-BASE', 'THIRDPARTY', '408', '853', 'Compensation clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 874, 'PCMN-BASE', 'THIRDPARTY', '409', '853', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 875, 'PCMN-BASE', 'THIRDPARTY', '41', '1354', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 876, 'PCMN-BASE', 'THIRDPARTY', '410', '875', 'Capital appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 877, 'PCMN-BASE', 'THIRDPARTY', '4100', '876', 'Appels de fonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 878, 'PCMN-BASE', 'THIRDPARTY', '4101', '876', 'Actionnaires défaillants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 879, 'PCMN-BASE', 'THIRDPARTY', '411', '875', 'T.V.A. à récupérer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 880, 'PCMN-BASE', 'THIRDPARTY', '4110', '879', 'T.V.A. due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 881, 'PCMN-BASE', 'THIRDPARTY', '4111', '879', 'T.V.A. déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 882, 'PCMN-BASE', 'THIRDPARTY', '4112', '879', 'Compte courant administration T.V.A.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 883, 'PCMN-BASE', 'THIRDPARTY', '4118', '879', 'Taxe d''égalisation due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 884, 'PCMN-BASE', 'THIRDPARTY', '412', '875', 'Impôts et versements fiscaux à récupérer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 885, 'PCMN-BASE', 'THIRDPARTY', '4120', '884', 'Impôts belges sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 886, 'PCMN-BASE', 'THIRDPARTY', '4125', '884', 'Autres impôts belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 887, 'PCMN-BASE', 'THIRDPARTY', '4128', '884', 'Impôts étrangers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 888, 'PCMN-BASE', 'THIRDPARTY', '414', '875', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 889, 'PCMN-BASE', 'THIRDPARTY', '416', '875', 'Créances diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 890, 'PCMN-BASE', 'THIRDPARTY', '4160', '889', 'Associés (compte d''apport en société)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 891, 'PCMN-BASE', 'THIRDPARTY', '4161', '889', 'Avances et prêts au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 892, 'PCMN-BASE', 'THIRDPARTY', '4162', '889', 'Compte courant des associés en S.P.R.L.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 893, 'PCMN-BASE', 'THIRDPARTY', '4163', '889', 'Compte courant des administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 894, 'PCMN-BASE', 'THIRDPARTY', '4164', '889', 'Créances sur sociétés apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 895, 'PCMN-BASE', 'THIRDPARTY', '4166', '889', 'Emballages et matériel à rendre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 896, 'PCMN-BASE', 'THIRDPARTY', '4167', '889', 'Etat et établissements publics', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 897, 'PCMN-BASE', 'THIRDPARTY', '41670', '896', 'Subsides à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 898, 'PCMN-BASE', 'THIRDPARTY', '41671', '896', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 899, 'PCMN-BASE', 'THIRDPARTY', '4168', '889',
        'Rabais, ristournes et remises à obtenir et autres avoirs non encore reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 900, 'PCMN-BASE', 'THIRDPARTY', '417', '875', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 901, 'PCMN-BASE', 'THIRDPARTY', '418', '875', 'Cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 902, 'PCMN-BASE', 'THIRDPARTY', '419', '875', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 903, 'PCMN-BASE', 'THIRDPARTY', '42', '1354', 'Dettes à plus d''un an échéant dans l''année', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 904, 'PCMN-BASE', 'THIRDPARTY', '420', '903', 'Emprunts subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 905, 'PCMN-BASE', 'THIRDPARTY', '4200', '904', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 906, 'PCMN-BASE', 'THIRDPARTY', '4201', '904', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 907, 'PCMN-BASE', 'THIRDPARTY', '421', '903', 'Emprunts obligataires non subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 908, 'PCMN-BASE', 'THIRDPARTY', '4210', '907', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 909, 'PCMN-BASE', 'THIRDPARTY', '4211', '907', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 910, 'PCMN-BASE', 'THIRDPARTY', '422', '903', 'Dettes de location-financement et assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 911, 'PCMN-BASE', 'THIRDPARTY', '4220', '910', 'Financement de biens immobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 912, 'PCMN-BASE', 'THIRDPARTY', '4221', '910', 'Financement de biens mobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 913, 'PCMN-BASE', 'THIRDPARTY', '423', '903', 'Etablissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 914, 'PCMN-BASE', 'THIRDPARTY', '4230', '913', 'Dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 915, 'PCMN-BASE', 'THIRDPARTY', '4231', '913', 'Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 916, 'PCMN-BASE', 'THIRDPARTY', '4232', '913', 'Crédits d''acceptation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 917, 'PCMN-BASE', 'THIRDPARTY', '424', '903', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 918, 'PCMN-BASE', 'THIRDPARTY', '425', '903', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 919, 'PCMN-BASE', 'THIRDPARTY', '4250', '918', 'Fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 920, 'PCMN-BASE', 'THIRDPARTY', '4251', '918', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 921, 'PCMN-BASE', 'THIRDPARTY', '426', '903', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 922, 'PCMN-BASE', 'THIRDPARTY', '429', '903', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 923, 'PCMN-BASE', 'THIRDPARTY', '4290', '922', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 924, 'PCMN-BASE', 'THIRDPARTY', '4291', '922',
        'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 925, 'PCMN-BASE', 'THIRDPARTY', '4292', '922', 'Administrateurs, gérants, associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 926, 'PCMN-BASE', 'THIRDPARTY', '4299', '922', 'Autres dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 927, 'PCMN-BASE', 'THIRDPARTY', '43', '1354', 'Dettes financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 928, 'PCMN-BASE', 'THIRDPARTY', '430', '927',
        'Etablissements de crédit. Emprunts en compte à terme fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 929, 'PCMN-BASE', 'THIRDPARTY', '431', '927', 'Etablissements de crédit. Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 930, 'PCMN-BASE', 'THIRDPARTY', '432', '927', 'Etablissements de crédit. Crédits d''acceptation',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 931, 'PCMN-BASE', 'THIRDPARTY', '433', '927', 'Etablissements de crédit. Dettes en compte courant',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 932, 'PCMN-BASE', 'THIRDPARTY', '439', '927', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 933, 'PCMN-BASE', 'THIRDPARTY', '44', '1354', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 934, 'PCMN-BASE', 'THIRDPARTY', '440', '933', 'Fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 935, 'PCMN-BASE', 'THIRDPARTY', '4400', '934', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 936, 'PCMN-BASE', 'THIRDPARTY', '44000', '935', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 937, 'PCMN-BASE', 'THIRDPARTY', '44001', '935',
        'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 938, 'PCMN-BASE', 'THIRDPARTY', '4401', '934', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 939, 'PCMN-BASE', 'THIRDPARTY', '44010', '938', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 940, 'PCMN-BASE', 'THIRDPARTY', '44011', '938', 'Fournisseurs CEE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 941, 'PCMN-BASE', 'THIRDPARTY', '44012', '938', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 942, 'PCMN-BASE', 'THIRDPARTY', '4402', '934',
        'Dettes envers les coparticipants (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 943, 'PCMN-BASE', 'THIRDPARTY', '4403', '934', 'Fournisseurs - retenues de garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 944, 'PCMN-BASE', 'THIRDPARTY', '441', '933', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 945, 'PCMN-BASE', 'THIRDPARTY', '4410', '944', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 946, 'PCMN-BASE', 'THIRDPARTY', '44100', '945', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 947, 'PCMN-BASE', 'THIRDPARTY', '44101', '945',
        'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 948, 'PCMN-BASE', 'THIRDPARTY', '4411', '944', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 949, 'PCMN-BASE', 'THIRDPARTY', '44110', '948', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 950, 'PCMN-BASE', 'THIRDPARTY', '44111', '948', 'Fournisseurs CEE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 951, 'PCMN-BASE', 'THIRDPARTY', '44112', '948', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 952, 'PCMN-BASE', 'THIRDPARTY', '444', '933', 'Factures à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 953, 'PCMN-BASE', 'THIRDPARTY', '446', '933', 'Acomptes reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 954, 'PCMN-BASE', 'THIRDPARTY', '448', '933', 'Compensations fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 955, 'PCMN-BASE', 'THIRDPARTY', '45', '1354', 'Dettes fiscales, salariales et sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 956, 'PCMN-BASE', 'THIRDPARTY', '450', '955', 'Dettes fiscales estimées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 957, 'PCMN-BASE', 'THIRDPARTY', '4501', '956', 'Impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 958, 'PCMN-BASE', 'THIRDPARTY', '4505', '956', 'Autres impôts en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 959, 'PCMN-BASE', 'THIRDPARTY', '4508', '956', 'Impôts à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 960, 'PCMN-BASE', 'THIRDPARTY', '451', '955', 'T.V.A. à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 961, 'PCMN-BASE', 'THIRDPARTY', '4510', '960', 'T.V.A. due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 962, 'PCMN-BASE', 'THIRDPARTY', '4511', '960', 'T.V.A. déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 963, 'PCMN-BASE', 'THIRDPARTY', '4512', '960', 'Compte courant administration T.V.A.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 964, 'PCMN-BASE', 'THIRDPARTY', '4518', '960', 'Taxe d''égalisation due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 965, 'PCMN-BASE', 'THIRDPARTY', '452', '955', 'Impôts et taxes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 966, 'PCMN-BASE', 'THIRDPARTY', '4520', '965', 'Autres impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 967, 'PCMN-BASE', 'THIRDPARTY', '4525', '965', 'Autres impôts et taxes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 968, 'PCMN-BASE', 'THIRDPARTY', '45250', '967', 'Précompte immobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 969, 'PCMN-BASE', 'THIRDPARTY', '45251', '967', 'Impôts communaux à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 970, 'PCMN-BASE', 'THIRDPARTY', '45252', '967', 'Impôts provinciaux à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 971, 'PCMN-BASE', 'THIRDPARTY', '45253', '967', 'Autres impôts et taxes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 972, 'PCMN-BASE', 'THIRDPARTY', '4528', '965', 'Impôts et taxes à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 973, 'PCMN-BASE', 'THIRDPARTY', '453', '955', 'Précomptes retenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 974, 'PCMN-BASE', 'THIRDPARTY', '4530', '973', 'Précompte professionnel retenu sur rémunérations',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 975, 'PCMN-BASE', 'THIRDPARTY', '4531', '973', 'Précompte professionnel retenu sur tantièmes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 976, 'PCMN-BASE', 'THIRDPARTY', '4532', '973', 'Précompte mobilier retenu sur dividendes attribués',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 977, 'PCMN-BASE', 'THIRDPARTY', '4533', '973', 'Précompte mobilier retenu sur intérêts payés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 978, 'PCMN-BASE', 'THIRDPARTY', '4538', '973', 'Autres précomptes retenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 979, 'PCMN-BASE', 'THIRDPARTY', '454', '955', 'Office National de la Sécurité Sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 980, 'PCMN-BASE', 'THIRDPARTY', '4540', '979', 'Arriérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 981, 'PCMN-BASE', 'THIRDPARTY', '4541', '979', '1er trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 982, 'PCMN-BASE', 'THIRDPARTY', '4542', '979', '2ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 983, 'PCMN-BASE', 'THIRDPARTY', '4543', '979', '3ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 984, 'PCMN-BASE', 'THIRDPARTY', '4544', '979', '4ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 985, 'PCMN-BASE', 'THIRDPARTY', '455', '955', 'Rémunérations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 986, 'PCMN-BASE', 'THIRDPARTY', '4550', '985',
        'Administrateurs,  gérants et commissaires (non réviseurs)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 987, 'PCMN-BASE', 'THIRDPARTY', '4551', '985', 'Direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 988, 'PCMN-BASE', 'THIRDPARTY', '4552', '985', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 989, 'PCMN-BASE', 'THIRDPARTY', '4553', '985', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 990, 'PCMN-BASE', 'THIRDPARTY', '456', '955', 'Pécules de vacances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 991, 'PCMN-BASE', 'THIRDPARTY', '4560', '990', 'Direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 992, 'PCMN-BASE', 'THIRDPARTY', '4561', '990', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 993, 'PCMN-BASE', 'THIRDPARTY', '4562', '990', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 994, 'PCMN-BASE', 'THIRDPARTY', '459', '955', 'Autres dettes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 995, 'PCMN-BASE', 'THIRDPARTY', '4590', '994', 'Provision pour gratifications de fin d''année', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 996, 'PCMN-BASE', 'THIRDPARTY', '4591', '994', 'Départs de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 997, 'PCMN-BASE', 'THIRDPARTY', '4592', '994', 'Oppositions sur rémunérations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 998, 'PCMN-BASE', 'THIRDPARTY', '4593', '994', 'Assurances relatives au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 999, 'PCMN-BASE', 'THIRDPARTY', '45930', '998', 'Assurance loi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1000, 'PCMN-BASE', 'THIRDPARTY', '45931', '998', 'Assurance salaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1001, 'PCMN-BASE', 'THIRDPARTY', '45932', '998', 'Assurance groupe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1002, 'PCMN-BASE', 'THIRDPARTY', '45933', '998', 'Assurances individuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1003, 'PCMN-BASE', 'THIRDPARTY', '4594', '994',
        'Caisse d''assurances sociales pour travailleurs indépendants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1004, 'PCMN-BASE', 'THIRDPARTY', '4597', '994', 'Dettes et provisions sociales diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1005, 'PCMN-BASE', 'THIRDPARTY', '46', '1354', 'Acomptes reçus sur commande', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1006, 'PCMN-BASE', 'THIRDPARTY', '47', '1354', 'Dettes découlant de l''affectation des résultats',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1007, 'PCMN-BASE', 'THIRDPARTY', '470', '1006', 'Dividendes et tantièmes d''exercices antérieurs',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1008, 'PCMN-BASE', 'THIRDPARTY', '471', '1006', 'Dividendes de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1009, 'PCMN-BASE', 'THIRDPARTY', '472', '1006', 'Tantièmes de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1010, 'PCMN-BASE', 'THIRDPARTY', '473', '1006', 'Autres allocataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1011, 'PCMN-BASE', 'THIRDPARTY', '48', '4', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1012, 'PCMN-BASE', 'THIRDPARTY', '480', '1011', 'Obligations et coupons échus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1013, 'PCMN-BASE', 'THIRDPARTY', '481', '1011', 'Actionnaires - capital à rembourser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1014, 'PCMN-BASE', 'THIRDPARTY', '482', '1011', 'Participation du personnel à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1015, 'PCMN-BASE', 'THIRDPARTY', '483', '1011', 'Acomptes reçus d''autres tiers à moins d''un an',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1016, 'PCMN-BASE', 'THIRDPARTY', '486', '1011', 'Emballages et matériel consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1017, 'PCMN-BASE', 'THIRDPARTY', '488', '1011', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1018, 'PCMN-BASE', 'THIRDPARTY', '489', '1011', 'Autres dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1019, 'PCMN-BASE', 'THIRDPARTY', '49', '1354', 'Comptes de régularisation et compte d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1020, 'PCMN-BASE', 'THIRDPARTY', '490', '1019',
        'Charges à reporter (à subdiviser par catégorie de charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1021, 'PCMN-BASE', 'THIRDPARTY', '491', '1019', 'Produits acquis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1022, 'PCMN-BASE', 'THIRDPARTY', '4910', '1021', 'Produits d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1023, 'PCMN-BASE', 'THIRDPARTY', '49100', '1022', 'Ristournes et rabais à obtenir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1024, 'PCMN-BASE', 'THIRDPARTY', '49101', '1022', 'Commissions à obtenir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1025, 'PCMN-BASE', 'THIRDPARTY', '49102', '1022',
        'Autres produits d''exploitation (redevances par exemple)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1026, 'PCMN-BASE', 'THIRDPARTY', '4911', '1021', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1027, 'PCMN-BASE', 'THIRDPARTY', '49110', '1026',
        'Intérêts courus et non échus sur prêts et débits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1028, 'PCMN-BASE', 'THIRDPARTY', '49111', '1026', 'Autres produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1029, 'PCMN-BASE', 'THIRDPARTY', '492', '1019',
        'Charges à imputer (à subdiviser par catégorie de charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1030, 'PCMN-BASE', 'THIRDPARTY', '493', '1019', 'Produits à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1031, 'PCMN-BASE', 'THIRDPARTY', '4930', '1030', 'Produits d''exploitation à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1032, 'PCMN-BASE', 'THIRDPARTY', '4931', '1030', 'Produits financiers à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1033, 'PCMN-BASE', 'THIRDPARTY', '499', '1019', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1034, 'PCMN-BASE', 'THIRDPARTY', '4990', '1033', 'Compte d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1035, 'PCMN-BASE', 'THIRDPARTY', '4991', '1033', 'Compte de répartition périodique des charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1036, 'PCMN-BASE', 'THIRDPARTY', '4999', '1033', 'Transferts d''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1037, 'PCMN-BASE', 'FINAN', '50', '1355', 'Actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1038, 'PCMN-BASE', 'FINAN', '51', '1355', 'Actions et parts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1039, 'PCMN-BASE', 'FINAN', '510', '1038', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1040, 'PCMN-BASE', 'FINAN', '511', '1038', 'Montants non appelés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1041, 'PCMN-BASE', 'FINAN', '519', '1038', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1042, 'PCMN-BASE', 'FINAN', '52', '1355', 'Titres à revenus fixes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1043, 'PCMN-BASE', 'FINAN', '520', '1042', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1044, 'PCMN-BASE', 'FINAN', '529', '1042', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1045, 'PCMN-BASE', 'FINAN', '53', '1355', 'Dépots à terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1046, 'PCMN-BASE', 'FINAN', '530', '1045', 'De plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1047, 'PCMN-BASE', 'FINAN', '531', '1045', 'De plus d''un mois et à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1048, 'PCMN-BASE', 'FINAN', '532', '1045', 'd''un mois au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1049, 'PCMN-BASE', 'FINAN', '539', '1045', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1050, 'PCMN-BASE', 'FINAN', '54', '1355', 'Valeurs échues à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1051, 'PCMN-BASE', 'FINAN', '540', '1050', 'Chèques à encaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1052, 'PCMN-BASE', 'FINAN', '541', '1050', 'Coupons à encaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1053, 'PCMN-BASE', 'FINAN', '55', '1355',
        'Etablissements de crédit - Comptes ouverts auprès des divers établissements.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1054, 'PCMN-BASE', 'FINAN', '550', '1053', 'Comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1055, 'PCMN-BASE', 'FINAN', '551', '1053', 'Chèques émis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1056, 'PCMN-BASE', 'FINAN', '559', '1053', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1057, 'PCMN-BASE', 'FINAN', '56', '1355', 'Office des chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1058, 'PCMN-BASE', 'FINAN', '560', '1057', 'Compte courant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1059, 'PCMN-BASE', 'FINAN', '561', '1057', 'Chèques émis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1060, 'PCMN-BASE', 'FINAN', '57', '1355', 'Caisses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1061, 'PCMN-BASE', 'FINAN', '570', '1060',
        'à 577 Caisses - espèces ( 0 - centrale ; 7 - succursales et agences)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1062, 'PCMN-BASE', 'FINAN', '578', '1060', 'Caisses - timbres ( 0 - fiscaux ; 1 - postaux)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1063, 'PCMN-BASE', 'FINAN', '58', '1355', 'Virements internes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1064, 'PCMN-BASE', 'EXPENSE', '60', '1356', 'Approvisionnements et marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1065, 'PCMN-BASE', 'EXPENSE', '600', '1064', 'Achats de matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1066, 'PCMN-BASE', 'EXPENSE', '601', '1064', 'Achats de fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1067, 'PCMN-BASE', 'EXPENSE', '602', '1064', 'Achats de services, travaux et études', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1068, 'PCMN-BASE', 'EXPENSE', '603', '1064', 'Sous-traitances générales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1069, 'PCMN-BASE', 'EXPENSE', '604', '1064', 'Achats de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1070, 'PCMN-BASE', 'EXPENSE', '605', '1064', 'Achats d''immeubles destinés à la revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1071, 'PCMN-BASE', 'EXPENSE', '608', '1064', 'Remises , ristournes et rabais obtenus sur achats',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1072, 'PCMN-BASE', 'EXPENSE', '609', '1064', 'Variations de stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1073, 'PCMN-BASE', 'EXPENSE', '6090', '1072', 'De matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1074, 'PCMN-BASE', 'EXPENSE', '6091', '1072', 'De fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1075, 'PCMN-BASE', 'EXPENSE', '6094', '1072', 'De marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1076, 'PCMN-BASE', 'EXPENSE', '6095', '1072', 'd''immeubles destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1077, 'PCMN-BASE', 'EXPENSE', '61', '1356', 'Services et biens divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1078, 'PCMN-BASE', 'EXPENSE', '610', '1077', 'Loyers et charges locatives', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1079, 'PCMN-BASE', 'EXPENSE', '6100', '1078', 'Loyers divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1080, 'PCMN-BASE', 'EXPENSE', '6101', '1078',
        'Charges locatives (assurances, frais de confort,etc)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1081, 'PCMN-BASE', 'EXPENSE', '611', '1077', 'Entretien et réparation (fournitures et prestations)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1082, 'PCMN-BASE', 'EXPENSE', '612', '1077', 'Fournitures faites à l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1083, 'PCMN-BASE', 'EXPENSE', '6120', '1082', 'Eau, gaz, électricité, vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1084, 'PCMN-BASE', 'EXPENSE', '61200', '1083', 'Eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1085, 'PCMN-BASE', 'EXPENSE', '61201', '1083', 'Gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1086, 'PCMN-BASE', 'EXPENSE', '61202', '1083', 'Electricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1087, 'PCMN-BASE', 'EXPENSE', '61203', '1083', 'Vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1088, 'PCMN-BASE', 'EXPENSE', '6121', '1082',
        'Téléphone, télégrammes, télex, téléfax, frais postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1089, 'PCMN-BASE', 'EXPENSE', '61210', '1088', 'Téléphone', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1090, 'PCMN-BASE', 'EXPENSE', '61211', '1088', 'Télégrammes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1091, 'PCMN-BASE', 'EXPENSE', '61212', '1088', 'Télex et téléfax', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1092, 'PCMN-BASE', 'EXPENSE', '61213', '1088', 'Frais postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1093, 'PCMN-BASE', 'EXPENSE', '6122', '1082', 'Livres, bibliothèque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1094, 'PCMN-BASE', 'EXPENSE', '6123', '1082',
        'Imprimés et fournitures de bureau (si non comptabilisé au 601)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1095, 'PCMN-BASE', 'EXPENSE', '613', '1077', 'Rétributions de tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1096, 'PCMN-BASE', 'EXPENSE', '6130', '1095', 'Redevances et royalties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1097, 'PCMN-BASE', 'EXPENSE', '61300', '1096',
        'Redevances pour brevets, licences, marques et accessoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1098, 'PCMN-BASE', 'EXPENSE', '61301', '1096', 'Autres redevances (procédés de fabrication)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1099, 'PCMN-BASE', 'EXPENSE', '6131', '1095', 'Assurances non relatives au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1100, 'PCMN-BASE', 'EXPENSE', '61310', '1099', 'Assurance incendie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1101, 'PCMN-BASE', 'EXPENSE', '61311', '1099', 'Assurance vol', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1102, 'PCMN-BASE', 'EXPENSE', '61312', '1099', 'Assurance autos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1103, 'PCMN-BASE', 'EXPENSE', '61313', '1099', 'Assurance crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1104, 'PCMN-BASE', 'EXPENSE', '61314', '1099', 'Assurances frais généraux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1105, 'PCMN-BASE', 'EXPENSE', '6132', '1095', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1106, 'PCMN-BASE', 'EXPENSE', '61320', '1105', 'Commissions aux tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1107, 'PCMN-BASE', 'EXPENSE', '61321', '1105', 'Honoraires d''avocats, d''experts, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1108, 'PCMN-BASE', 'EXPENSE', '61322', '1105', 'Cotisations aux groupements professionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1109, 'PCMN-BASE', 'EXPENSE', '61323', '1105', 'Dons, libéralités, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1110, 'PCMN-BASE', 'EXPENSE', '61324', '1105', 'Frais de contentieux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1111, 'PCMN-BASE', 'EXPENSE', '61325', '1105', 'Publications légales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1112, 'PCMN-BASE', 'EXPENSE', '6133', '1095', 'Transports et déplacements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1113, 'PCMN-BASE', 'EXPENSE', '61330', '1112', 'Transports de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1114, 'PCMN-BASE', 'EXPENSE', '61331', '1112', 'Voyages, déplacements et représentations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1115, 'PCMN-BASE', 'EXPENSE', '6134', '1095', 'Personnel intérimaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1116, 'PCMN-BASE', 'EXPENSE', '614', '1077', 'Annonces, publicité, propagande et documentation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1117, 'PCMN-BASE', 'EXPENSE', '6140', '1116', 'Annonces et insertions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1118, 'PCMN-BASE', 'EXPENSE', '6141', '1116', 'Catalogues et imprimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1119, 'PCMN-BASE', 'EXPENSE', '6142', '1116', 'Echantillons', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1120, 'PCMN-BASE', 'EXPENSE', '6143', '1116', 'Foires et expositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1121, 'PCMN-BASE', 'EXPENSE', '6144', '1116', 'Primes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1122, 'PCMN-BASE', 'EXPENSE', '6145', '1116', 'Cadeaux à la clientèle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1123, 'PCMN-BASE', 'EXPENSE', '6146', '1116', 'Missions et réceptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1124, 'PCMN-BASE', 'EXPENSE', '6147', '1116', 'Documentation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1125, 'PCMN-BASE', 'EXPENSE', '615', '1077', 'Sous-traitants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1126, 'PCMN-BASE', 'EXPENSE', '6150', '1125', 'Sous-traitants pour activités propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1127, 'PCMN-BASE', 'EXPENSE', '6151', '1125',
        'Sous-traitants d''associations momentanées (coparticipants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1128, 'PCMN-BASE', 'EXPENSE', '6152', '1125', 'Quote-part bénéficiaire des coparticipants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1129, 'PCMN-BASE', 'EXPENSE', '617', '1077',
        'Personnel intérimaire et personnes mises à la disposition de l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1130, 'PCMN-BASE', 'EXPENSE', '618', '1077',
        'Rémunérations, primes pour assurances extralégales, pensions de retraite et de survie des administrateurs, gérants et associés actifs qui ne sont pas attribuées en vertu d''un contrat de travail',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1131, 'PCMN-BASE', 'EXPENSE', '62', '1356', 'Rémunérations, charges sociales et pensions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1132, 'PCMN-BASE', 'EXPENSE', '620', '1131', 'Rémunérations et avantages sociaux directs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1133, 'PCMN-BASE', 'EXPENSE', '6200', '1132', 'Administrateurs ou gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1134, 'PCMN-BASE', 'EXPENSE', '6201', '1132', 'Personnel de direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1135, 'PCMN-BASE', 'EXPENSE', '6202', '1132', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1136, 'PCMN-BASE', 'EXPENSE', '6203', '1132', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1137, 'PCMN-BASE', 'EXPENSE', '6204', '1132', 'Autres membres du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1138, 'PCMN-BASE', 'EXPENSE', '621', '1131', 'Cotisations patronales d''assurances sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1139, 'PCMN-BASE', 'EXPENSE', '6210', '1138', 'Sur salaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1140, 'PCMN-BASE', 'EXPENSE', '6211', '1138', 'Sur appointements et commissions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1141, 'PCMN-BASE', 'EXPENSE', '622', '1131', 'Primes patronales pour assurances extralégales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1142, 'PCMN-BASE', 'EXPENSE', '623', '1131', 'Autres frais de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1143, 'PCMN-BASE', 'EXPENSE', '6230', '1142', 'Assurances du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1144, 'PCMN-BASE', 'EXPENSE', '62300', '1143',
        'Assurances loi, responsabilité civile, chemin du travail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1145, 'PCMN-BASE', 'EXPENSE', '62301', '1143', 'Assurance salaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1146, 'PCMN-BASE', 'EXPENSE', '62302', '1143', 'Assurances individuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1147, 'PCMN-BASE', 'EXPENSE', '6231', '1142', 'Charges sociales diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1148, 'PCMN-BASE', 'EXPENSE', '62310', '1147', 'Jours fériés payés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1149, 'PCMN-BASE', 'EXPENSE', '62311', '1147', 'Salaire hebdomadaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1150, 'PCMN-BASE', 'EXPENSE', '62312', '1147', 'Allocations familiales complémentaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1151, 'PCMN-BASE', 'EXPENSE', '6232', '1142',
        'Charges sociales des administrateurs, gérants et commissaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1152, 'PCMN-BASE', 'EXPENSE', '62320', '1151',
        'Allocations familiales complémentaires pour non salariés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1153, 'PCMN-BASE', 'EXPENSE', '62321', '1151', 'Lois sociales pour indépendants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1154, 'PCMN-BASE', 'EXPENSE', '62322', '1151', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1155, 'PCMN-BASE', 'EXPENSE', '624', '1131', 'Pensions de retraite et de survie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1156, 'PCMN-BASE', 'EXPENSE', '6240', '1155', 'Administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1157, 'PCMN-BASE', 'EXPENSE', '6241', '1155', 'Personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1158, 'PCMN-BASE', 'EXPENSE', '625', '1131', 'Provision pour pécule de vacances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1159, 'PCMN-BASE', 'EXPENSE', '6250', '1158', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1160, 'PCMN-BASE', 'EXPENSE', '6251', '1158', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1161, 'PCMN-BASE', 'EXPENSE', '63', '1356',
        'Amortissements, réductions de valeur et provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1162, 'PCMN-BASE', 'EXPENSE', '630', '1161',
        'Dotations aux amortissements et aux réductions de valeur sur immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1163, 'PCMN-BASE', 'EXPENSE', '6300', '1162',
        'Dotations aux amortissements sur frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1164, 'PCMN-BASE', 'EXPENSE', '6301', '1162',
        'Dotations aux amortissements sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1165, 'PCMN-BASE', 'EXPENSE', '6302', '1162',
        'Dotations aux amortissements sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1166, 'PCMN-BASE', 'EXPENSE', '6308', '1162',
        'Dotations aux réductions de valeur sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1167, 'PCMN-BASE', 'EXPENSE', '6309', '1162',
        'Dotations aux réductions de valeur sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1168, 'PCMN-BASE', 'EXPENSE', '631', '1161', 'Réductions de valeur sur stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1169, 'PCMN-BASE', 'EXPENSE', '6310', '1168', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1170, 'PCMN-BASE', 'EXPENSE', '6311', '1168', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1171, 'PCMN-BASE', 'EXPENSE', '632', '1161',
        'Réductions de valeur sur commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1172, 'PCMN-BASE', 'EXPENSE', '6320', '1171', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1173, 'PCMN-BASE', 'EXPENSE', '6321', '1171', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1174, 'PCMN-BASE', 'EXPENSE', '633', '1161',
        'Réductions de valeur sur créances commerciales à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1175, 'PCMN-BASE', 'EXPENSE', '6330', '1174', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1176, 'PCMN-BASE', 'EXPENSE', '6331', '1174', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1177, 'PCMN-BASE', 'EXPENSE', '634', '1161',
        'Réductions de valeur sur créances commerciales à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1178, 'PCMN-BASE', 'EXPENSE', '6340', '1177', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1179, 'PCMN-BASE', 'EXPENSE', '6341', '1177', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1180, 'PCMN-BASE', 'EXPENSE', '635', '1161', 'Provisions pour pensions et obligations similaires',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1181, 'PCMN-BASE', 'EXPENSE', '6350', '1180', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1182, 'PCMN-BASE', 'EXPENSE', '6351', '1180', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1183, 'PCMN-BASE', 'EXPENSE', '636', '11613',
        'Provisions pour grosses réparations et gros entretiens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1184, 'PCMN-BASE', 'EXPENSE', '6360', '1183', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1185, 'PCMN-BASE', 'EXPENSE', '6361', '1183', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1186, 'PCMN-BASE', 'EXPENSE', '637', '1161', 'Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1187, 'PCMN-BASE', 'EXPENSE', '6370', '1186', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1188, 'PCMN-BASE', 'EXPENSE', '6371', '1186', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1189, 'PCMN-BASE', 'EXPENSE', '64', '1356', 'Autres charges d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1190, 'PCMN-BASE', 'EXPENSE', '640', '1189', 'Charges fiscales d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1191, 'PCMN-BASE', 'EXPENSE', '6400', '1190', 'Taxes et impôts directs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1192, 'PCMN-BASE', 'EXPENSE', '64000', '1191', 'Taxes sur autos et camions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1193, 'PCMN-BASE', 'EXPENSE', '6401', '1190', 'Taxes et impôts indirects', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1194, 'PCMN-BASE', 'EXPENSE', '64010', '1193', 'Timbres fiscaux pris en charge par la firme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1195, 'PCMN-BASE', 'EXPENSE', '64011', '1193', 'Droits d''enregistrement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1196, 'PCMN-BASE', 'EXPENSE', '64012', '1193', 'T.V.A. non déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1197, 'PCMN-BASE', 'EXPENSE', '6402', '1190', 'Impôts provinciaux et communaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1198, 'PCMN-BASE', 'EXPENSE', '64020', '1197', 'Taxe sur la force motrice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1199, 'PCMN-BASE', 'EXPENSE', '64021', '1197', 'Taxe sur le personnel occupé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1200, 'PCMN-BASE', 'EXPENSE', '6403', '1190', 'Taxes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1201, 'PCMN-BASE', 'EXPENSE', '641', '1189',
        'Moins-values sur réalisations courantes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1202, 'PCMN-BASE', 'EXPENSE', '642', '1189',
        'Moins-values sur réalisations de créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1203, 'PCMN-BASE', 'EXPENSE', '643', '1189', 'à 648 Charges d''exploitations diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1204, 'PCMN-BASE', 'EXPENSE', '649', '1189',
        'Charges d''exploitation portées à l''actif au titre de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1205, 'PCMN-BASE', 'EXPENSE', '65', '1356', 'Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1206, 'PCMN-BASE', 'EXPENSE', '650', '1205', 'Charges des dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1207, 'PCMN-BASE', 'EXPENSE', '6500', '1206', 'Intérêts, commissions et frais afférents aux dettes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1208, 'PCMN-BASE', 'EXPENSE', '6501', '1206',
        'Amortissements des agios et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1209, 'PCMN-BASE', 'EXPENSE', '6502', '1206', 'Autres charges de dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1210, 'PCMN-BASE', 'EXPENSE', '6503', '1206', 'Intérêts intercalaires portés à l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1211, 'PCMN-BASE', 'EXPENSE', '651', '1205', 'Réductions de valeur sur actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1212, 'PCMN-BASE', 'EXPENSE', '6510', '1211', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1213, 'PCMN-BASE', 'EXPENSE', '6511', '1211', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1214, 'PCMN-BASE', 'EXPENSE', '652', '1205', 'Moins-values sur réalisation d''actifs circulants',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1215, 'PCMN-BASE', 'EXPENSE', '653', '1205', 'Charges d''escompte de créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1216, 'PCMN-BASE', 'EXPENSE', '654', '1205', 'Différences de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1217, 'PCMN-BASE', 'EXPENSE', '655', '1205', 'Ecarts de conversion des devises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1218, 'PCMN-BASE', 'EXPENSE', '656', '1205', 'Frais de banques, de chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1219, 'PCMN-BASE', 'EXPENSE', '657', '1205',
        'Commissions sur ouvertures de crédit, cautions et avals', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1220, 'PCMN-BASE', 'EXPENSE', '658', '1205', 'Frais de vente des titres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1221, 'PCMN-BASE', 'EXPENSE', '66', '1356', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1222, 'PCMN-BASE', 'EXPENSE', '660', '1221', 'Amortissements et réductions de valeur exceptionnels',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1223, 'PCMN-BASE', 'EXPENSE', '6600', '1222', 'Sur frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1224, 'PCMN-BASE', 'EXPENSE', '6601', '1222', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1225, 'PCMN-BASE', 'EXPENSE', '6602', '1222', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1226, 'PCMN-BASE', 'EXPENSE', '661', '1221', 'Réductions de valeur sur immobilisations financières',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1227, 'PCMN-BASE', 'EXPENSE', '662', '1221', 'Provisions pour risques et charges exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1228, 'PCMN-BASE', 'EXPENSE', '663', '1221', 'Moins-values sur réalisation d''actifs immobilisés',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1229, 'PCMN-BASE', 'EXPENSE', '6630', '1228', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1230, 'PCMN-BASE', 'EXPENSE', '6631', '1228', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1231, 'PCMN-BASE', 'EXPENSE', '6632', '1228',
        'Sur immobilisations détenues en location-financement et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1232, 'PCMN-BASE', 'EXPENSE', '6633', '1228', 'Sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1233, 'PCMN-BASE', 'EXPENSE', '6634', '1228',
        'Sur immeubles acquis ou construits en vue de la revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1234, 'PCMN-BASE', 'EXPENSE', '668', '1221', 'Autres charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1235, 'PCMN-BASE', 'EXPENSE', '664', '1221', 'Pénalités et amendes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1236, 'PCMN-BASE', 'EXPENSE', '665', '1221', 'Différence de charge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1237, 'PCMN-BASE', 'EXPENSE', '669', '1221',
        'Charges exceptionnelles transférées à l''actif en frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1238, 'PCMN-BASE', 'EXPENSE', '67', '1356', 'Impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1239, 'PCMN-BASE', 'EXPENSE', '670', '1238', 'Impôts belges sur le résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1240, 'PCMN-BASE', 'EXPENSE', '6700', '1239', 'Impôts et précomptes dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1241, 'PCMN-BASE', 'EXPENSE', '6701', '1239',
        'Excédent de versements d''impôts et précomptes porté à l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1242, 'PCMN-BASE', 'EXPENSE', '6702', '1239', 'Charges fiscales estimées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1243, 'PCMN-BASE', 'EXPENSE', '671', '1238',
        'Impôts belges sur le résultat d''exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1244, 'PCMN-BASE', 'EXPENSE', '6710', '1243', 'Suppléments d''impôts dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1245, 'PCMN-BASE', 'EXPENSE', '6711', '1243', 'Suppléments d''impôts estimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1246, 'PCMN-BASE', 'EXPENSE', '6712', '1243', 'Provisions fiscales constituées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1247, 'PCMN-BASE', 'EXPENSE', '672', '1238', 'Impôts étrangers sur le résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1248, 'PCMN-BASE', 'EXPENSE', '673', '1238',
        'Impôts étrangers sur le résultat d''exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1249, 'PCMN-BASE', 'EXPENSE', '68', '1356', 'Transferts aux réserves immunisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1250, 'PCMN-BASE', 'EXPENSE', '69', '1356', 'Affectation des résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1251, 'PCMN-BASE', 'EXPENSE', '690', '1250', 'Perte reportée de l''exercice précédent', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1252, 'PCMN-BASE', 'EXPENSE', '691', '1250', 'Dotation à la réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1253, 'PCMN-BASE', 'EXPENSE', '692', '1250', 'Dotation aux autres réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1254, 'PCMN-BASE', 'EXPENSE', '693', '1250', 'Bénéfice à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1255, 'PCMN-BASE', 'EXPENSE', '694', '1250', 'Rémunération du capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1256, 'PCMN-BASE', 'EXPENSE', '695', '1250', 'Administrateurs ou gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1257, 'PCMN-BASE', 'EXPENSE', '696', '1250', 'Autres allocataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1258, 'PCMN-BASE', 'INCOME', '70', '1357', 'Chiffre d''affaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1260, 'PCMN-BASE', 'INCOME', '700', '1258', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1261, 'PCMN-BASE', 'INCOME', '7000', '1260', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1262, 'PCMN-BASE', 'INCOME', '7001', '1260', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1263, 'PCMN-BASE', 'INCOME', '7002', '1260', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1264, 'PCMN-BASE', 'INCOME', '701', '1258', 'Ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1265, 'PCMN-BASE', 'INCOME', '7010', '1264', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1266, 'PCMN-BASE', 'INCOME', '7011', '1264', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1267, 'PCMN-BASE', 'INCOME', '7012', '1264', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1268, 'PCMN-BASE', 'INCOME', '702', '1258', 'Ventes de déchets et rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1269, 'PCMN-BASE', 'INCOME', '7020', '1268', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1270, 'PCMN-BASE', 'INCOME', '7021', '1268', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1271, 'PCMN-BASE', 'INCOME', '7022', '1268', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1272, 'PCMN-BASE', 'INCOME', '703', '1258', 'Ventes d''emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1273, 'PCMN-BASE', 'INCOME', '704', '1258',
        'Facturations des travaux en cours (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1274, 'PCMN-BASE', 'INCOME', '705', '1258', 'Prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1275, 'PCMN-BASE', 'INCOME', '7050', '1274', 'Prestations de services en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1276, 'PCMN-BASE', 'INCOME', '7051', '1274',
        'Prestations de services dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1277, 'PCMN-BASE', 'INCOME', '7052', '1274', 'Prestations de services en vue de l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1278, 'PCMN-BASE', 'INCOME', '706', '1258', 'Pénalités et dédits obtenus par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1279, 'PCMN-BASE', 'INCOME', '708', '1258', 'Remises, ristournes et rabais accordés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1280, 'PCMN-BASE', 'INCOME', '7080', '1279', 'Sur ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1281, 'PCMN-BASE', 'INCOME', '7081', '1279', 'Sur ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1282, 'PCMN-BASE', 'INCOME', '7082', '1279', 'Sur ventes de déchets et rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1283, 'PCMN-BASE', 'INCOME', '7083', '1279', 'Sur prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1284, 'PCMN-BASE', 'INCOME', '7084', '1279',
        'Mali sur travaux facturés aux associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1285, 'PCMN-BASE', 'INCOME', '71', '1357',
        'Variation des stocks et des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1286, 'PCMN-BASE', 'INCOME', '712', '1285', 'Des en cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1287, 'PCMN-BASE', 'INCOME', '713', '1285', 'Des produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1288, 'PCMN-BASE', 'INCOME', '715', '1285', 'Des immeubles construits destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1289, 'PCMN-BASE', 'INCOME', '717', '1285', 'Des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1290, 'PCMN-BASE', 'INCOME', '7170', '1289', 'Commandes en cours - Coût de revient', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1291, 'PCMN-BASE', 'INCOME', '71700', '1290', 'Coût des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1292, 'PCMN-BASE', 'INCOME', '71701', '1290',
        'Coût des travaux en cours des associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1293, 'PCMN-BASE', 'INCOME', '7171', '1289', 'Bénéfices portés en compte sur commandes en cours',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1294, 'PCMN-BASE', 'INCOME', '71710', '1293', 'Sur commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1295, 'PCMN-BASE', 'INCOME', '71711', '1293', 'Sur travaux en cours des associations momentanées',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1296, 'PCMN-BASE', 'INCOME', '72', '1357', 'Production immobilisée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1297, 'PCMN-BASE', 'INCOME', '720', '1296', 'En frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1298, 'PCMN-BASE', 'INCOME', '721', '1296', 'En immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1299, 'PCMN-BASE', 'INCOME', '722', '1296', 'En immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1300, 'PCMN-BASE', 'INCOME', '723', '1296', 'En immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1301, 'PCMN-BASE', 'INCOME', '74', '1357', 'Autres produits d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1302, 'PCMN-BASE', 'INCOME', '740', '1301', 'Subsides d''exploitation et montants compensatoires',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1303, 'PCMN-BASE', 'INCOME', '741', '1301',
        'Plus-values sur réalisations courantes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1304, 'PCMN-BASE', 'INCOME', '742', '1301', 'Plus-values sur réalisations de créances commerciales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1306, 'PCMN-BASE', 'INCOME', '743', '1301',
        'Produits de services exploités dans l''intérêt du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1307, 'PCMN-BASE', 'INCOME', '744', '1301', 'Commissions et courtages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1308, 'PCMN-BASE', 'INCOME', '745', '1301', 'Redevances pour brevets et licences', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1309, 'PCMN-BASE', 'INCOME', '746', '1301', 'Prestations de services (transports, études, etc)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1310, 'PCMN-BASE', 'INCOME', '747', '1301',
        'Revenus des immeubles affectés aux activités non professionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1311, 'PCMN-BASE', 'INCOME', '748', '1301', 'Locations diverses à caractère professionnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1312, 'PCMN-BASE', 'INCOME', '749', '1301', 'Produits divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1313, 'PCMN-BASE', 'INCOME', '7490', '1312', 'Bonis sur reprises d''emballages consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1314, 'PCMN-BASE', 'INCOME', '7491', '1312', 'Bonis sur travaux en associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1315, 'PCMN-BASE', 'INCOME', '75', '1357', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1316, 'PCMN-BASE', 'INCOME', '750', '1315', 'Produits des immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1317, 'PCMN-BASE', 'INCOME', '7500', '1316', 'Revenus des actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1318, 'PCMN-BASE', 'INCOME', '7501', '1316', 'Revenus des obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1319, 'PCMN-BASE', 'INCOME', '7502', '1316', 'Revenus des créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1320, 'PCMN-BASE', 'INCOME', '751', '1315', 'Produits des actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1321, 'PCMN-BASE', 'INCOME', '752', '1315', 'Plus-values sur réalisations d''actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1322, 'PCMN-BASE', 'INCOME', '753', '1315', 'Subsides en capital et en intérêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1323, 'PCMN-BASE', 'INCOME', '754', '1315', 'Différences de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1324, 'PCMN-BASE', 'INCOME', '755', '1315', 'Ecarts de conversion des devises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1326, 'PCMN-BASE', 'INCOME', '756', '1315', 'Produits des autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1327, 'PCMN-BASE', 'INCOME', '757', '1315', 'Escomptes obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1328, 'PCMN-BASE', 'INCOME', '76', '1357', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1329, 'PCMN-BASE', 'INCOME', '760', '1328', 'Reprises d''amortissements et de réductions de valeur',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1330, 'PCMN-BASE', 'INCOME', '7600', '1329', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1331, 'PCMN-BASE', 'INCOME', '7601', '1329', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1332, 'PCMN-BASE', 'INCOME', '761', '1328',
        'Reprises de réductions de valeur sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1333, 'PCMN-BASE', 'INCOME', '762', '1328',
        'Reprises de provisions pour risques et charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1334, 'PCMN-BASE', 'INCOME', '763', '1328', 'Plus-values sur réalisation d''actifs immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1335, 'PCMN-BASE', 'INCOME', '7630', '1334', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1336, 'PCMN-BASE', 'INCOME', '7631', '1334', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1337, 'PCMN-BASE', 'INCOME', '7632', '1334', 'Sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1338, 'PCMN-BASE', 'INCOME', '764', '1328', 'Autres produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1339, 'PCMN-BASE', 'INCOME', '77', '1357',
        'Régularisations d''impôts et reprises de provisions fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1340, 'PCMN-BASE', 'INCOME', '771', '1339', 'Impôts belges sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1341, 'PCMN-BASE', 'INCOME', '7710', '1340', 'Régularisations d''impôts dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1342, 'PCMN-BASE', 'INCOME', '7711', '1340', 'Régularisations d''impôts estimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1343, 'PCMN-BASE', 'INCOME', '7712', '1340', 'Reprises de provisions fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1344, 'PCMN-BASE', 'INCOME', '773', '1339', 'Impôts étrangers sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1345, 'PCMN-BASE', 'INCOME', '79', '1357', 'Affectation aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1346, 'PCMN-BASE', 'INCOME', '790', '1345', 'Bénéfice reporté de l''exercice précédent', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1347, 'PCMN-BASE', 'INCOME', '791', '1345', 'Prélèvement sur le capital et les primes d''émission',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1348, 'PCMN-BASE', 'INCOME', '792', '1345', 'Prélèvement sur les réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1349, 'PCMN-BASE', 'INCOME', '793', '1345', 'Perte à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1350, 'PCMN-BASE', 'INCOME', '794', '1345',
        'Intervention d''associés (ou du propriétaire) dans la perte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1351, 'PCMN-BASE', 'CAPIT', '1', '0',
        'Fonds propres, provisions pour risques et charges et dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1352, 'PCMN-BASE', 'IMMO', '2', '0',
        'Frais d''établissement. Actifs immobilisés et créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1353, 'PCMN-BASE', 'STOCK', '3', '0', 'Stock et commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1354, 'PCMN-BASE', 'THIRDPARTY', '4', '0', 'Créances et dettes à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1355, 'PCMN-BASE', 'FINAN', '5', '0', 'Placement de trésorerie et de valeurs disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1356, 'PCMN-BASE', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1357, 'PCMN-BASE', 'INCOME', '7', '0', 'Produits', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10439, 'MAR-VERKORT', 'CAPIT', '1', '0',
        'Eigen vermogen, voorzieningen voor risico''s en kosten en schulden op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10440, 'MAR-VERKORT', 'CAPIT', '10', '10439', 'Kapitaal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10441, 'MAR-VERKORT', 'CAPIT', '100', '10440', 'Geplaatst kapitaal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10442, 'MAR-VERKORT', 'CAPIT', '101', '10440', 'Niet-opgevraagd kapitaal (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10443, 'MAR-VERKORT', 'CAPIT', '11', '10439', 'Uitgiftepremies (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10444, 'MAR-VERKORT', 'CAPIT', '12', '10439', 'Herwaarderingsmeerwaarden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10445, 'MAR-VERKORT', 'CAPIT', '120', '10444',
        'Herwaarderingsmeerwaarden op immateriële vaste activa (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10446, 'MAR-VERKORT', 'CAPIT', '121', '10444',
        'Herwaarderingsmeerwaarden op materiële vaste activa (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10447, 'MAR-VERKORT', 'CAPIT', '122', '10444',
        'Herwaarderingsmeerwaarden op financiële vaste activa (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10448, 'MAR-VERKORT', 'CAPIT', '123', '10444', 'Herwaarderingsmeerwaarden op voorraden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10449, 'MAR-VERKORT', 'CAPIT', '124', '10444',
        'Terugneming van waardeverminderingen op geldbeleggingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10450, 'MAR-VERKORT', 'CAPIT', '13', '10439', 'Reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10451, 'MAR-VERKORT', 'CAPIT', '130', '10450', 'Wettelijke reserve', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10452, 'MAR-VERKORT', 'CAPIT', '131', '10450', 'Onbeschikbare reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10453, 'MAR-VERKORT', 'CAPIT', '1310', '10452', 'Reserve voor eigen aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10454, 'MAR-VERKORT', 'CAPIT', '1311', '10452', 'Andere onbeschikbare reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10455, 'MAR-VERKORT', 'CAPIT', '132', '10450', 'Belastingvrije reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10456, 'MAR-VERKORT', 'CAPIT', '133', '10450', 'Beschikbare reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10457, 'MAR-VERKORT', 'CAPIT', '14', '10439', 'Overgedragen Winst of Overgedragen verlies (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10458, 'MAR-VERKORT', 'CAPIT', '15', '10439', 'Kapitaalsubsidies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10459, 'MAR-VERKORT', 'CAPIT', '16', '10439', 'Voorzieningen en Uitgestelde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10460, 'MAR-VERKORT', 'CAPIT', '160', '10459',
        'Voorzieningen voor pensioenen en soortgelijke verplichtingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10461, 'MAR-VERKORT', 'CAPIT', '161', '10459', 'Voorzieningen voor belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10462, 'MAR-VERKORT', 'CAPIT', '162', '10459',
        'Voorzieningen voor grote herstellingswerken en grote onderhoudswerken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10463, 'MAR-VERKORT', 'CAPIT', '163', '10459', 'Voorzieningen voor milieuverplichtingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10464, 'MAR-VERKORT', 'CAPIT', '168', '10459', 'Uitgestelde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10465, 'MAR-VERKORT', 'CAPIT', '1680', '10464', 'Uitgestelde belastingen op kapitaalsubsidies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10466, 'MAR-VERKORT', 'CAPIT', '1681', '10464',
        'Uitgestelde belastingen op gerealiseerde meerwaarden op immateriële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10467, 'MAR-VERKORT', 'CAPIT', '1682', '10464',
        'Uitgestelde belastingen op gerealiseerde meerwaarden op materiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10468, 'MAR-VERKORT', 'CAPIT', '1687', '10464',
        'Uitgestelde belastingen op gerealiseerde meerwaarden op effecten die zijn uitgegeven door de Belgische openbare sector',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10469, 'MAR-VERKORT', 'CAPIT', '1688', '10464', 'Buitenlandse uitgestelde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10470, 'MAR-VERKORT', 'CAPIT', '17', '10439', 'Schulden op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10471, 'MAR-VERKORT', 'CAPIT', '170', '10470', 'Achtergestelde leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10472, 'MAR-VERKORT', 'CAPIT', '1700', '10471', 'Converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10473, 'MAR-VERKORT', 'CAPIT', '1701', '10471', 'Niet-converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10474, 'MAR-VERKORT', 'CAPIT', '171', '10470', 'Niet achtergestelde obligatieleningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10475, 'MAR-VERKORT', 'CAPIT', '1710', '10474', 'Converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10476, 'MAR-VERKORT', 'CAPIT', '1711', '10474', 'Niet-converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10477, 'MAR-VERKORT', 'CAPIT', '172', '10470', 'Leasingschulden en soortgelijke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10478, 'MAR-VERKORT', 'CAPIT', '173', '10470', 'Kredietinstellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10479, 'MAR-VERKORT', 'CAPIT', '1730', '10478', 'Schulden op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10480, 'MAR-VERKORT', 'CAPIT', '1731', '10478', 'Promessen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10481, 'MAR-VERKORT', 'CAPIT', '1732', '10478', 'Acceptkredieten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10482, 'MAR-VERKORT', 'CAPIT', '174', '10470', 'Overige leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10483, 'MAR-VERKORT', 'CAPIT', '175', '10470', 'Handelsschulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10484, 'MAR-VERKORT', 'CAPIT', '1750', '10483', 'Leveranciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10485, 'MAR-VERKORT', 'CAPIT', '1751', '10483', 'Te betalen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10486, 'MAR-VERKORT', 'CAPIT', '176', '10470', 'Vooruitbetalingen op bestellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10487, 'MAR-VERKORT', 'CAPIT', '178', '10470', 'Borgtochten ontvangen in contanten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10488, 'MAR-VERKORT', 'CAPIT', '179', '10470', 'Overige schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10489, 'MAR-VERKORT', 'CAPIT', '19', '10439',
        'Voorschot aan de vennoten op de verdeling van het nettoactief (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10490, 'MAR-VERKORT', 'IMMO', '2', '0',
        'Oprichtingskosten, vaste activa en vorderingen op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10491, 'MAR-VERKORT', 'IMMO', '20', '10490', 'Oprichtingskosten (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10492, 'MAR-VERKORT', 'IMMO', '200', '10491', 'Kosten voor oprichting en kapitaalsverhoging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10493, 'MAR-VERKORT', 'IMMO', '201', '10491', 'Kosten bij uitgifte van leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10494, 'MAR-VERKORT', 'IMMO', '202', '10491', 'Overige oprichtingskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10495, 'MAR-VERKORT', 'IMMO', '203', '10491', '', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10496, 'MAR-VERKORT', 'IMMO', '204', '10491', 'Herstructureringskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10497, 'MAR-VERKORT', 'IMMO', '21', '10490', 'Immateriële vaste activa  (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10498, 'MAR-VERKORT', 'IMMO', '210', '10497', 'Kosten voor onderzoek en ontwikkeling', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10499, 'MAR-VERKORT', 'IMMO', '211', '10497',
        'Concessies, octrooien, licenties, know how, merken en soorgelijke rechten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10500, 'MAR-VERKORT', 'IMMO', '212', '10497', 'Goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10501, 'MAR-VERKORT', 'IMMO', '213', '10497', 'Vooruitbetalingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10502, 'MAR-VERKORT', 'IMMO', '214', '10497', 'Software', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10503, 'MAR-VERKORT', 'IMMO', '215', '10497', 'Databanken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10504, 'MAR-VERKORT', 'IMMO', '216', '10497', 'Emissierechten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10505, 'MAR-VERKORT', 'IMMO', '219', '10497', 'Overige immateriële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10506, 'MAR-VERKORT', 'IMMO', '22', '10490', 'Terreinen en gebouwen (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10507, 'MAR-VERKORT', 'IMMO', '220', '10506', 'Terreinen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10508, 'MAR-VERKORT', 'IMMO', '221', '10506', 'Gebouwen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10509, 'MAR-VERKORT', 'IMMO', '222', '10506', 'Bebouwde terreinen (2)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10510, 'MAR-VERKORT', 'IMMO', '223', '10506', 'Overige zakelijke rechten op onroerende goederen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10511, 'MAR-VERKORT', 'IMMO', '224', '10506', 'Autosnelwegen, wegen en fietspaden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10512, 'MAR-VERKORT', 'IMMO', '225', '10506', 'Vliegvelden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10513, 'MAR-VERKORT', 'IMMO', '226', '10506', 'Waterbouwkundige werken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10514, 'MAR-VERKORT', 'IMMO', '227', '10506', 'Havens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10515, 'MAR-VERKORT', 'IMMO', '228', '10506', 'Openbaar vervoer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10516, 'MAR-VERKORT', 'IMMO', '229', '10506', 'Overige werken van burgelijke bouwkunde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10517, 'MAR-VERKORT', 'IMMO', '23', '10490', 'Installaties, machines en uitrusting (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10518, 'MAR-VERKORT', 'IMMO', '24', '10490', 'Meubilair en rollend materieel (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10519, 'MAR-VERKORT', 'IMMO', '240', '10518', 'Rollend materieel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10520, 'MAR-VERKORT', 'IMMO', '241', '10518', 'Varend materieel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10521, 'MAR-VERKORT', 'IMMO', '242', '10518', 'Vliegend materieel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10522, 'MAR-VERKORT', 'IMMO', '243', '10518', 'Informatica en telematica materieel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10523, 'MAR-VERKORT', 'IMMO', '244', '10518', 'Kantoormeubilair', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10524, 'MAR-VERKORT', 'IMMO', '245', '10518', 'Werken van bibliotheken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10525, 'MAR-VERKORT', 'IMMO', '246', '10518', 'Kunstvoorwerpen en -werken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10526, 'MAR-VERKORT', 'IMMO', '25', '10490',
        'Vaste activa in leasing of op grond van een soortgelijk recht (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10527, 'MAR-VERKORT', 'IMMO', '250', '10526', 'Terreinen en gebouwen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10528, 'MAR-VERKORT', 'IMMO', '251', '10526', 'Installaties, machines en uitrusting', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10529, 'MAR-VERKORT', 'IMMO', '252', '10526', 'Meubilair en rollend materieel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10530, 'MAR-VERKORT', 'IMMO', '26', '10490', 'Overige materiële vaste activa (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10531, 'MAR-VERKORT', 'IMMO', '27', '10490', 'Vaste activa in aanbouw en vooruitbetalingen (1)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10532, 'MAR-VERKORT', 'IMMO', '28', '10490', 'Financiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10533, 'MAR-VERKORT', 'IMMO', '280', '10532', 'Deelnemingen in verbonden ondernemingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10534, 'MAR-VERKORT', 'IMMO', '2800', '10533', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10535, 'MAR-VERKORT', 'IMMO', '2801', '10533', 'Nog te storten bedragen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10536, 'MAR-VERKORT', 'IMMO', '2808', '10533', 'Geboekte meerwaarden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10537, 'MAR-VERKORT', 'IMMO', '2809', '10533', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10538, 'MAR-VERKORT', 'IMMO', '281', '10532', 'Vorderingen op verbonden ondernemingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10539, 'MAR-VERKORT', 'IMMO', '2810', '10538', 'Vordering op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10540, 'MAR-VERKORT', 'IMMO', '2811', '10538', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10541, 'MAR-VERKORT', 'IMMO', '2812', '10538', 'Vastrentende effecten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10542, 'MAR-VERKORT', 'IMMO', '2817', '10538', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10543, 'MAR-VERKORT', 'IMMO', '2819', '10538', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10544, 'MAR-VERKORT', 'IMMO', '282', '10532',
        'Deelnemingen in ondernemingen waarmee een deelnemingsverhouding bestaat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10545, 'MAR-VERKORT', 'IMMO', '2820', '10544', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10546, 'MAR-VERKORT', 'IMMO', '2821', '10544', 'Nog te storten bedragen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10547, 'MAR-VERKORT', 'IMMO', '2828', '10544', 'Geboekte meerwaarden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10548, 'MAR-VERKORT', 'IMMO', '2829', '10544', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10549, 'MAR-VERKORT', 'IMMO', '283', '10532',
        'Vorderingen op ondernemingen waarmee een deelnemingsverhouding bestaat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10550, 'MAR-VERKORT', 'IMMO', '2830', '10549', 'Vordering op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10551, 'MAR-VERKORT', 'IMMO', '2831', '10549', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10552, 'MAR-VERKORT', 'IMMO', '2832', '10549', 'Vastrentende effecten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10553, 'MAR-VERKORT', 'IMMO', '2837', '10549', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10554, 'MAR-VERKORT', 'IMMO', '2839', '10549', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10555, 'MAR-VERKORT', 'IMMO', '284', '10532', 'Andere aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10556, 'MAR-VERKORT', 'IMMO', '2840', '10555', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10557, 'MAR-VERKORT', 'IMMO', '2841', '10555', 'Nog te storten bedragen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10558, 'MAR-VERKORT', 'IMMO', '2848', '10555', 'Geboekte meerwaarden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10559, 'MAR-VERKORT', 'IMMO', '2849', '10555', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10560, 'MAR-VERKORT', 'IMMO', '285', '10532', 'Overige vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10561, 'MAR-VERKORT', 'IMMO', '2850', '10560', 'Vordering op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10562, 'MAR-VERKORT', 'IMMO', '2851', '10560', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10563, 'MAR-VERKORT', 'IMMO', '2852', '10560', 'Vastrentende effecten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10564, 'MAR-VERKORT', 'IMMO', '2857', '10560', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10565, 'MAR-VERKORT', 'IMMO', '2859', '10560', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10566, 'MAR-VERKORT', 'IMMO', '288', '10532', 'Borgtochten betaald in contanten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10567, 'MAR-VERKORT', 'IMMO', '29', '10490', 'Vorderingen op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10568, 'MAR-VERKORT', 'IMMO', '290', '10567', 'Handelsvorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10569, 'MAR-VERKORT', 'IMMO', '2900', '10568', 'Handelsdebiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10570, 'MAR-VERKORT', 'IMMO', '2901', '10568', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10571, 'MAR-VERKORT', 'IMMO', '2906', '10568', 'Vooruitbetalingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10572, 'MAR-VERKORT', 'IMMO', '2907', '10568', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10573, 'MAR-VERKORT', 'IMMO', '2909', '10568', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10574, 'MAR-VERKORT', 'IMMO', '291', '10567', 'Overige vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10575, 'MAR-VERKORT', 'IMMO', '2910', '10574', 'Vordering op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10576, 'MAR-VERKORT', 'IMMO', '2911', '10574', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10577, 'MAR-VERKORT', 'IMMO', '2917', '10574', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10578, 'MAR-VERKORT', 'IMMO', '2919', '10574', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10579, 'MAR-VERKORT', 'STOCK', '3', '0', 'Voorraden en bestellingen in uitvoering', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10580, 'MAR-VERKORT', 'STOCK', '30', '10579', 'Grondstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10581, 'MAR-VERKORT', 'STOCK', '300', '10580', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10582, 'MAR-VERKORT', 'STOCK', '309', '10580', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10583, 'MAR-VERKORT', 'STOCK', '31', '10579', 'Hulpstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10584, 'MAR-VERKORT', 'STOCK', '310', '10583', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10585, 'MAR-VERKORT', 'STOCK', '319', '10583', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10586, 'MAR-VERKORT', 'STOCK', '32', '10579', 'Goederen in bewerking', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10587, 'MAR-VERKORT', 'STOCK', '320', '10586', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10588, 'MAR-VERKORT', 'STOCK', '329', '10586', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10589, 'MAR-VERKORT', 'STOCK', '33', '10579', 'Gereed product', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10590, 'MAR-VERKORT', 'STOCK', '330', '10589', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10591, 'MAR-VERKORT', 'STOCK', '339', '10589', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10592, 'MAR-VERKORT', 'STOCK', '34', '10579', 'Handelsgoederen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10593, 'MAR-VERKORT', 'STOCK', '340', '10592', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10594, 'MAR-VERKORT', 'STOCK', '349', '10592', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10595, 'MAR-VERKORT', 'STOCK', '35', '10579', 'Onroerende goederen bestemd voor verkoop', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10596, 'MAR-VERKORT', 'STOCK', '350', '10595', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10597, 'MAR-VERKORT', 'STOCK', '359', '10595', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10598, 'MAR-VERKORT', 'STOCK', '36', '10579', 'Vooruitbetalingen op voorraadinkopen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10599, 'MAR-VERKORT', 'STOCK', '360', '10598', 'Vooruitbetalingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10600, 'MAR-VERKORT', 'STOCK', '369', '10598', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10601, 'MAR-VERKORT', 'STOCK', '37', '10579', 'Bestellingen in uitvoering', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10602, 'MAR-VERKORT', 'STOCK', '370', '10601', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10603, 'MAR-VERKORT', 'STOCK', '371', '10601', 'Toegerekende winst', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10604, 'MAR-VERKORT', 'STOCK', '379', '10601', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10605, 'MAR-VERKORT', 'THIRDPARTY', '4', '0', 'Vorderingen en schulden op ten hoogste een jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10606, 'MAR-VERKORT', 'THIRDPARTY', '40', '10605', 'Handelsvorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10607, 'MAR-VERKORT', 'THIRDPARTY', '400', '10606', 'Handelsdebiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10608, 'MAR-VERKORT', 'THIRDPARTY', '401', '10606', 'Te innen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10609, 'MAR-VERKORT', 'THIRDPARTY', '404', '10606', 'Te innen opbrengsten (3)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10610, 'MAR-VERKORT', 'THIRDPARTY', '406', '10606', 'Vooruitbetalingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10611, 'MAR-VERKORT', 'THIRDPARTY', '407', '10606', 'Dubieuze debiteuren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10612, 'MAR-VERKORT', 'THIRDPARTY', '409', '10606', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10613, 'MAR-VERKORT', 'THIRDPARTY', '41', '10605', 'Overige vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10614, 'MAR-VERKORT', 'THIRDPARTY', '410', '10613', 'Opgevraagd, niet-gestort kapitaal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10615, 'MAR-VERKORT', 'THIRDPARTY', '411', '10613', 'Terug te vorderen BTW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10616, 'MAR-VERKORT', 'THIRDPARTY', '412', '10613',
        'Terug te vorderen belastingen en voorheffingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10617, 'MAR-VERKORT', 'THIRDPARTY', '4128', '10616', 'Buitenlandse belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10618, 'MAR-VERKORT', 'THIRDPARTY', '413', '10613', 'Overige vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10619, 'MAR-VERKORT', 'THIRDPARTY', '414', '10613', 'Te innen opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10620, 'MAR-VERKORT', 'THIRDPARTY', '416', '10613', 'Diverse vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10621, 'MAR-VERKORT', 'THIRDPARTY', '417', '10613', 'Dubieuze vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10622, 'MAR-VERKORT', 'THIRDPARTY', '418', '10613', 'Borgtochten betaald in contanten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10623, 'MAR-VERKORT', 'THIRDPARTY', '419', '10613', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10624, 'MAR-VERKORT', 'THIRDPARTY', '42', '10605',
        'Schulden op meer dan één jaar die binnen het jaar vervallen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10625, 'MAR-VERKORT', 'THIRDPARTY', '420', '10624', 'Achtergestelde leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10626, 'MAR-VERKORT', 'THIRDPARTY', '4200', '10625', 'Converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10627, 'MAR-VERKORT', 'THIRDPARTY', '4201', '10625', 'Niet-converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10628, 'MAR-VERKORT', 'THIRDPARTY', '421', '10624', 'Niet achtergestelde obligatieleningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10629, 'MAR-VERKORT', 'THIRDPARTY', '4210', '10628', 'Converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10630, 'MAR-VERKORT', 'THIRDPARTY', '4211', '10628', 'Niet-converteerbaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10631, 'MAR-VERKORT', 'THIRDPARTY', '422', '10624', 'Leasingschulden en soortgelijke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10632, 'MAR-VERKORT', 'THIRDPARTY', '423', '10624', 'Kredietinstellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10633, 'MAR-VERKORT', 'THIRDPARTY', '4230', '10632', 'Schulden op rekening', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10634, 'MAR-VERKORT', 'THIRDPARTY', '4231', '10632', 'Promessen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10635, 'MAR-VERKORT', 'THIRDPARTY', '4232', '10632', 'Acceptkredieten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10636, 'MAR-VERKORT', 'THIRDPARTY', '424', '10624', 'Overige leningen (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10637, 'MAR-VERKORT', 'THIRDPARTY', '425', '10624', 'Handelsschulden (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10638, 'MAR-VERKORT', 'THIRDPARTY', '4250', '10637', 'Leveranciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10639, 'MAR-VERKORT', 'THIRDPARTY', '4251', '10637', 'Te betalen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10640, 'MAR-VERKORT', 'THIRDPARTY', '426', '10624', 'Vooruitbetalingen op bestellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10641, 'MAR-VERKORT', 'THIRDPARTY', '428', '10624', 'Borgtochten ontvangen in contanten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10642, 'MAR-VERKORT', 'THIRDPARTY', '429', '10624', 'Overige schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10643, 'MAR-VERKORT', 'THIRDPARTY', '43', '10605', 'Financiële schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10644, 'MAR-VERKORT', 'THIRDPARTY', '430', '10643',
        'Kredietinstellingen – Leningen op rekeningen met vaste termijn', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10645, 'MAR-VERKORT', 'THIRDPARTY', '431', '10643', 'Kredietinstellingen – Promessen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10646, 'MAR-VERKORT', 'THIRDPARTY', '432', '10643', 'Kredietinstellingen – Acceptkrediet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10647, 'MAR-VERKORT', 'THIRDPARTY', '433', '10643',
        'Kredietinstellingen – Schulden in rekening courant (4)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10648, 'MAR-VERKORT', 'THIRDPARTY', '439', '10643', 'Overige leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10649, 'MAR-VERKORT', 'THIRDPARTY', '44', '10605', 'Handelsschulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10650, 'MAR-VERKORT', 'THIRDPARTY', '440', '10649', 'Leveranciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10651, 'MAR-VERKORT', 'THIRDPARTY', '441', '10649', 'Te betalen wissels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10652, 'MAR-VERKORT', 'THIRDPARTY', '444', '10649', 'Te ontvangen facturen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10653, 'MAR-VERKORT', 'THIRDPARTY', '45', '10605',
        'Schulden met betrekking tot belastingen, bezoldigingen en sociale lasten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10654, 'MAR-VERKORT', 'THIRDPARTY', '450', '10653', 'Geraamd bedrag van de belastingschulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10655, 'MAR-VERKORT', 'THIRDPARTY', '4508', '10654', 'Buitenlandse belastingen en taksen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10656, 'MAR-VERKORT', 'THIRDPARTY', '451', '10653', 'Te betalen BTW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10657, 'MAR-VERKORT', 'THIRDPARTY', '452', '10653', 'Te betalen belastingen en taksen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10658, 'MAR-VERKORT', 'THIRDPARTY', '4528', '10657', 'Buitenlandse belastingen en taksen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10659, 'MAR-VERKORT', 'THIRDPARTY', '453', '10653', 'Ingehouden voorheffingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10660, 'MAR-VERKORT', 'THIRDPARTY', '454', '10653', 'Rijksdienst voor Sociale Zekerheid', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10661, 'MAR-VERKORT', 'THIRDPARTY', '455', '10653', 'Bezoldigingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10662, 'MAR-VERKORT', 'THIRDPARTY', '456', '10653', 'Vakantiegeld', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10663, 'MAR-VERKORT', 'THIRDPARTY', '459', '10653', 'Andere sociale schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10664, 'MAR-VERKORT', 'THIRDPARTY', '46', '10605', 'Vooruitbetalingen op bestellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10665, 'MAR-VERKORT', 'THIRDPARTY', '47', '10605', 'Schulden uit de bestemming van het resultaat',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10666, 'MAR-VERKORT', 'THIRDPARTY', '470', '10665', 'Dividenden en tantièmes over vorige boekjaren',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10667, 'MAR-VERKORT', 'THIRDPARTY', '471', '10665', 'Dividenden over het boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10668, 'MAR-VERKORT', 'THIRDPARTY', '472', '10665', 'Tantièmes over het boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10669, 'MAR-VERKORT', 'THIRDPARTY', '473', '10665', 'Andere rechthebbenden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10670, 'MAR-VERKORT', 'THIRDPARTY', '48', '10605', 'Diverse schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10671, 'MAR-VERKORT', 'THIRDPARTY', '480', '10670', 'Vervallen obligaties en coupons', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10672, 'MAR-VERKORT', 'THIRDPARTY', '481', '10670',
        'Te betalen subsidies, dotaties, toelagen en soortgelijke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10673, 'MAR-VERKORT', 'THIRDPARTY', '488', '10670', 'Borgtochten ontvangen in contanten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10674, 'MAR-VERKORT', 'THIRDPARTY', '489', '10670', 'Andere diverse schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10675, 'MAR-VERKORT', 'THIRDPARTY', '49', '10605', 'Overlopende rekeningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10676, 'MAR-VERKORT', 'THIRDPARTY', '490', '10675', 'Over te dragen kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10677, 'MAR-VERKORT', 'THIRDPARTY', '491', '10675', 'Verkregen opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10678, 'MAR-VERKORT', 'THIRDPARTY', '492', '10675', 'Toe te rekenen kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10679, 'MAR-VERKORT', 'THIRDPARTY', '493', '10675', 'Over te dragen opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10680, 'MAR-VERKORT', 'THIRDPARTY', '499', '10675', 'Wachtrekeningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10681, 'MAR-VERKORT', 'FINAN', '5', '0', 'Geldbeleggingen en liquide middelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10682, 'MAR-VERKORT', 'FINAN', '50', '10681', 'Eigen aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10683, 'MAR-VERKORT', 'FINAN', '51', '10681',
        'Aandelen en geldbeleggingen andere dan vastrentende beleggingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10684, 'MAR-VERKORT', 'FINAN', '510', '10683', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10685, 'MAR-VERKORT', 'FINAN', '5100', '10684', 'Aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10686, 'MAR-VERKORT', 'FINAN', '5101', '10684', 'Geldbeleggingen andere dan vastrentende effecten',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10687, 'MAR-VERKORT', 'FINAN', '511', '10683', 'Niet-opgevraagde bedragen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10688, 'MAR-VERKORT', 'FINAN', '5110', '10687', 'Aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10689, 'MAR-VERKORT', 'FINAN', '519', '10683', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10690, 'MAR-VERKORT', 'FINAN', '5190', '10689', 'Aandelen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10691, 'MAR-VERKORT', 'FINAN', '5191', '10689', 'Geldbeleggingen andere dan vastrentende effecten',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10692, 'MAR-VERKORT', 'FINAN', '52', '10681', 'Vastrentende effecten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10693, 'MAR-VERKORT', 'FINAN', '520', '10692', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10694, 'MAR-VERKORT', 'FINAN', '529', '10692', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10695, 'MAR-VERKORT', 'FINAN', '53', '10681', 'Termijndeposito’s', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10696, 'MAR-VERKORT', 'FINAN', '530', '10695', 'Op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10697, 'MAR-VERKORT', 'FINAN', '531', '10695', 'Op meer dan een maand en op ten hoogste 1 jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10698, 'MAR-VERKORT', 'FINAN', '532', '10695', 'Op ten hoogste 1 maand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10699, 'MAR-VERKORT', 'FINAN', '539', '10695', 'Geboekte waardeverminderingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10700, 'MAR-VERKORT', 'FINAN', '54', '10681', 'Te incasseren vervallen waarden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10701, 'MAR-VERKORT', 'FINAN', '55', '10681', 'Kredietinstellingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10702, 'MAR-VERKORT', 'FINAN', '57', '10681', 'Kassen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10703, 'MAR-VERKORT', 'FINAN', '578', '10702', 'Kassen-zegels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10704, 'MAR-VERKORT', 'FINAN', '58', '10681', 'Interne overboekingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10705, 'MAR-VERKORT', 'EXPENSE', '6', '0', 'Kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10706, 'MAR-VERKORT', 'EXPENSE', '60', '10705', 'Handelsgoederen, grond- en hulpstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10707, 'MAR-VERKORT', 'EXPENSE', '600', '10706', 'Aankopen van grondstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10708, 'MAR-VERKORT', 'EXPENSE', '601', '10706', 'Aankopen van hulpstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10709, 'MAR-VERKORT', 'EXPENSE', '602', '10706', 'Aankopen van diensten, werken en studies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10710, 'MAR-VERKORT', 'EXPENSE', '603', '10706', 'Algemene onderaannemingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10711, 'MAR-VERKORT', 'EXPENSE', '604', '10706', 'Aankopen van handelsgoederen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10712, 'MAR-VERKORT', 'EXPENSE', '605', '10706',
        'Aankopen van onroerende goederen bestemd voor verkoop', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10713, 'MAR-VERKORT', 'EXPENSE', '609', '10706', 'Voorraadwijzigingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10714, 'MAR-VERKORT', 'EXPENSE', '6090', '10713', 'van grondstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10715, 'MAR-VERKORT', 'EXPENSE', '6091', '10713', 'van hulpstoffen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10716, 'MAR-VERKORT', 'EXPENSE', '6094', '10713', 'van handelsgoederen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10717, 'MAR-VERKORT', 'EXPENSE', '6095', '10713',
        'van gekochte onroerende goederen bestemd voor verkoop', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10718, 'MAR-VERKORT', 'EXPENSE', '61', '10705', 'Diensten en diverse goederen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10719, 'MAR-VERKORT', 'EXPENSE', '617', '10718',
        'Uitzendkrachten en personen ter beschikking gesteld van de onderneming', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10720, 'MAR-VERKORT', 'EXPENSE', '618', '10718',
        'Bezoldigingen, premies voor buitenwettelijke verzekeringen, ouderdoms- en overlevingspensioenen van bestuurders, zaakvoerders en werkende vennoten, die niet worden toegekend uit hoofde van een arbeidsovereenkomst',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10721, 'MAR-VERKORT', 'EXPENSE', '62', '10705', 'Bezoldigingen, sociale lasten en pensioenen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10722, 'MAR-VERKORT', 'EXPENSE', '620', '10721', 'Rechtstreekse sociale voordelen en bezoldigingen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10723, 'MAR-VERKORT', 'EXPENSE', '6200', '10722', 'Bestuurders of zaakvoerders', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10724, 'MAR-VERKORT', 'EXPENSE', '6201', '10722', 'Directiepersoneel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10725, 'MAR-VERKORT', 'EXPENSE', '6202', '10722', 'Bedienden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10726, 'MAR-VERKORT', 'EXPENSE', '6203', '10722', 'Arbeiders', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10727, 'MAR-VERKORT', 'EXPENSE', '6204', '10722', 'Andere personeelsleden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10728, 'MAR-VERKORT', 'EXPENSE', '621', '10721', 'Werkgeversbijdragen voor sociale verzekeringen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10729, 'MAR-VERKORT', 'EXPENSE', '622', '10721',
        'Werkgeverspremies voor bovenwettelijke verzekeringen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10730, 'MAR-VERKORT', 'EXPENSE', '623', '10721', 'Andere personeelskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10731, 'MAR-VERKORT', 'EXPENSE', '624', '10721', 'Ouderdoms- en overlevingspensioenen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10732, 'MAR-VERKORT', 'EXPENSE', '6240', '10731', 'Bestuurders of zaakvoerders', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10733, 'MAR-VERKORT', 'EXPENSE', '6241', '10731', 'Personeel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10734, 'MAR-VERKORT', 'EXPENSE', '63', '10705',
        'Afschrijvingen, waardeverminderingen en voorzieningen voor risico’s', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10735, 'MAR-VERKORT', 'EXPENSE', '630', '10734',
        'Afschrijvingen en waardeverminderingen op vaste activa (toevoeging)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10736, 'MAR-VERKORT', 'EXPENSE', '631', '10734', 'Waardeverminderingen op voorraden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10737, 'MAR-VERKORT', 'EXPENSE', '6310', '10736', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10738, 'MAR-VERKORT', 'EXPENSE', '6311', '10736', 'Terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10739, 'MAR-VERKORT', 'EXPENSE', '632', '10734',
        'Waardeverminderingen op bestellingen in uitvoering', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10740, 'MAR-VERKORT', 'EXPENSE', '6320', '10739', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10741, 'MAR-VERKORT', 'EXPENSE', '6321', '10739', 'Terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10742, 'MAR-VERKORT', 'EXPENSE', '633', '10734',
        'Waardeverminderingen op handelsvorderingen op meer dan één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10743, 'MAR-VERKORT', 'EXPENSE', '6330', '10742', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10744, 'MAR-VERKORT', 'EXPENSE', '6331', '10742', 'Terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10745, 'MAR-VERKORT', 'EXPENSE', '634', '10734',
        'Waardeverminderingen op handelsvorderingen op ten hoogste één jaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10746, 'MAR-VERKORT', 'EXPENSE', '6340', '10745', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10747, 'MAR-VERKORT', 'EXPENSE', '6341', '10745', 'Terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10748, 'MAR-VERKORT', 'EXPENSE', '635', '10734',
        'Voorzieningen voor pensioenen en soortgelijke verplichtingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10749, 'MAR-VERKORT', 'EXPENSE', '6350', '10748', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10750, 'MAR-VERKORT', 'EXPENSE', '6351', '10748', 'Besteding en terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10751, 'MAR-VERKORT', 'EXPENSE', '636', '10734',
        'Voorzieningen voor grote herstellingswerken en grote onderhoudswerken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10752, 'MAR-VERKORT', 'EXPENSE', '6360', '10751', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10753, 'MAR-VERKORT', 'EXPENSE', '6361', '10751', 'Besteding en terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10754, 'MAR-VERKORT', 'EXPENSE', '637', '10734', 'Voorzieningen voor milieuverplichtingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10755, 'MAR-VERKORT', 'EXPENSE', '6370', '10754', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10756, 'MAR-VERKORT', 'EXPENSE', '6371', '10754', 'Besteding en terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10757, 'MAR-VERKORT', 'EXPENSE', '638', '10734', 'Voorzieningen voor andere risico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10758, 'MAR-VERKORT', 'EXPENSE', '6380', '10757', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10759, 'MAR-VERKORT', 'EXPENSE', '6381', '10757', 'Besteding en terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10760, 'MAR-VERKORT', 'EXPENSE', '64', '10705', 'Andere bedrijfskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10761, 'MAR-VERKORT', 'EXPENSE', '640', '10760', 'Bedrijfsbelastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10762, 'MAR-VERKORT', 'EXPENSE', '641', '10760',
        'Minwaarden op de courante realisatie van vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10763, 'MAR-VERKORT', 'EXPENSE', '642', '10760',
        'Minderwaarden op de realisatie van handelsvorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10764, 'MAR-VERKORT', 'EXPENSE', '649', '10760',
        'Als herstructureringskosten geactiveerde bedrijfskosten (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10765, 'MAR-VERKORT', 'EXPENSE', '65', '10705', 'Financiële kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10766, 'MAR-VERKORT', 'EXPENSE', '650', '10765', 'Kosten van schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10767, 'MAR-VERKORT', 'EXPENSE', '6500', '10766',
        'Rente, commissies en kosten verbonden aan schulden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10768, 'MAR-VERKORT', 'EXPENSE', '6501', '10766',
        'Afschrijving van kosten bij uitgifte van leningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10769, 'MAR-VERKORT', 'EXPENSE', '6502', '10766', 'Geactiveerde intercalaire intresten (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10770, 'MAR-VERKORT', 'EXPENSE', '651', '10765', 'Waardeverminderingen op vlottende activa (6)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10771, 'MAR-VERKORT', 'EXPENSE', '6510', '10770', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10772, 'MAR-VERKORT', 'EXPENSE', '6511', '10770', 'Terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10773, 'MAR-VERKORT', 'EXPENSE', '652', '10765',
        'Minderwaarde op de realisatie van vlottende activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10774, 'MAR-VERKORT', 'EXPENSE', '653', '10765', 'Discontokost op vorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10775, 'MAR-VERKORT', 'EXPENSE', '654', '10765', 'Wisselresultaten (7)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10776, 'MAR-VERKORT', 'EXPENSE', '655', '10765',
        'Resultaten uit de omrekening van vreemde valuta (7)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10777, 'MAR-VERKORT', 'EXPENSE', '656', '10765', 'Voorzieningen met financieel karakter (+)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10778, 'MAR-VERKORT', 'EXPENSE', '6560', '10777', 'Toevoeging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10779, 'MAR-VERKORT', 'EXPENSE', '6561', '10777', 'Besteding en terugneming (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10780, 'MAR-VERKORT', 'EXPENSE', '659', '10765',
        'Als herstructureringskosten geactiveerde financiële kosten (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10781, 'MAR-VERKORT', 'EXPENSE', '66', '10705', 'Niet-recurrente bedrijfs- of financiële kosten',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10782, 'MAR-VERKORT', 'EXPENSE', '660', '10781',
        'Niet-recurrente afschrijvingen en waardeverminderingen (toevoeging)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10783, 'MAR-VERKORT', 'EXPENSE', '6600', '10782', 'op oprichtingskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10784, 'MAR-VERKORT', 'EXPENSE', '6601', '10782', 'op immateriële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10785, 'MAR-VERKORT', 'EXPENSE', '6602', '10782', 'op materiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10786, 'MAR-VERKORT', 'EXPENSE', '661', '10781',
        'Waardeverminderingen op financiële vaste activa (toevoeging)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10787, 'MAR-VERKORT', 'EXPENSE', '662', '10781',
        'Voorzieningen voor niet-recurrente risico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10788, 'MAR-VERKORT', 'EXPENSE', '6620', '10787',
        'Voorzieningen voor niet-recurrente bedrijfsrisico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10789, 'MAR-VERKORT', 'EXPENSE', '6621', '10787',
        'Voorzieningen voor niet-recurrente financiële risico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10790, 'MAR-VERKORT', 'EXPENSE', '663', '10781', 'Minderwaarden op realisatie van vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10791, 'MAR-VERKORT', 'EXPENSE', '668', '10781', 'Andere niet-recurrente financiële kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10792, 'MAR-VERKORT', 'EXPENSE', '67', '10705', 'Belastingen op het resultaat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10793, 'MAR-VERKORT', 'EXPENSE', '670', '10792',
        'Belgische belastingen op het resultaat van het boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10794, 'MAR-VERKORT', 'EXPENSE', '6700', '10793',
        'Verschuldigde of gestorte belastingen en voorheffingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10795, 'MAR-VERKORT', 'EXPENSE', '6701', '10793',
        'Geactiveerde overschotten van betaalde belastingen en voorheffingen (-)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10796, 'MAR-VERKORT', 'EXPENSE', '6702', '10793', 'Geraamde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10797, 'MAR-VERKORT', 'EXPENSE', '671', '10792',
        'Belgische belastingen op het resultaat van vorige boekjaren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10798, 'MAR-VERKORT', 'EXPENSE', '6710', '10797', 'Verschuldigde of gestorte belastingsupplementen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10799, 'MAR-VERKORT', 'EXPENSE', '6711', '10797', 'Geraamde belastingsupplementen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10800, 'MAR-VERKORT', 'EXPENSE', '6712', '10797', 'Gevormde fiscale voorzieningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10801, 'MAR-VERKORT', 'EXPENSE', '672', '10792',
        'Buitenlandse belastingen op het resultaat van het boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10802, 'MAR-VERKORT', 'EXPENSE', '673', '10792',
        'Buitenlandse belastingen op het resultaat van vorige boekjaren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10803, 'MAR-VERKORT', 'EXPENSE', '68', '10705',
        'Overboeking naar de uitgestelde belastingen en naar de belastingvrije reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10804, 'MAR-VERKORT', 'EXPENSE', '680', '10803', 'Overboeking naar de uitgestelde belastingen (-)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10805, 'MAR-VERKORT', 'EXPENSE', '689', '10803', 'Overboeking naar de belastingvrije reserves (-)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10806, 'MAR-VERKORT', 'EXPENSE', '69', '10705', 'Resultaatverwerking', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10807, 'MAR-VERKORT', 'EXPENSE', '690', '10806', 'Overgedragen verlies van het vorige boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10808, 'MAR-VERKORT', 'EXPENSE', '691', '10806',
        'Toevoeging aan het kapitaal en aan de uitgiftepremie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10809, 'MAR-VERKORT', 'EXPENSE', '692', '10806', 'Toevoeging aan de reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10810, 'MAR-VERKORT', 'EXPENSE', '6920', '10809', 'Toevoeging aan de wettelijke reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10811, 'MAR-VERKORT', 'EXPENSE', '6921', '10809', 'Toevoeging aan de overige reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10812, 'MAR-VERKORT', 'EXPENSE', '693', '10806', 'Over te dragen winst', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10813, 'MAR-VERKORT', 'EXPENSE', '694', '10806', 'Vergoeding van het kapitaal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10814, 'MAR-VERKORT', 'EXPENSE', '695', '10806', 'Bestuurders of zaakvoerders', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10815, 'MAR-VERKORT', 'EXPENSE', '696', '10806', 'Werknemers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10816, 'MAR-VERKORT', 'EXPENSE', '697', '10806', 'Andere rechthebbenden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10817, 'MAR-VERKORT', 'INCOME', '7', '0', 'Opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10818, 'MAR-VERKORT', 'INCOME', '70', '10817', 'Omzet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10819, 'MAR-VERKORT', 'INCOME', '708', '10818',
        'Toegekende kortingen, ristorno’s en rabatten (-) (8)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10820, 'MAR-VERKORT', 'INCOME', '71', '10817',
        'Wijzigingen in de voorraden en bestellingen in uitvoering', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10821, 'MAR-VERKORT', 'INCOME', '712', '10820', 'in de voorraad goederen in bewerking', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10822, 'MAR-VERKORT', 'INCOME', '713', '10820', 'in de voorraad gereed product', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10823, 'MAR-VERKORT', 'INCOME', '715', '10820',
        'in de voorraad onroerende goederen bestemd voor verkoop', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10824, 'MAR-VERKORT', 'INCOME', '717', '10820', 'in de bestellingen in uitvoering', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10825, 'MAR-VERKORT', 'INCOME', '7170', '10824', 'Aanschaffingswaarde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10826, 'MAR-VERKORT', 'INCOME', '7171', '10824', 'Toegerekende winst', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10827, 'MAR-VERKORT', 'INCOME', '72', '10817', 'Geproduceerde vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10828, 'MAR-VERKORT', 'INCOME', '74', '10817', 'Andere bedrijfsopbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10829, 'MAR-VERKORT', 'INCOME', '740', '10828', 'Bedrijfssubsidies en compenserende bedragen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10830, 'MAR-VERKORT', 'INCOME', '741', '10828',
        'Meerwaarde op de courante realisatie van materiële vast activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10831, 'MAR-VERKORT', 'INCOME', '742', '10828',
        'Meerwaarde op de realisatie van handelsvorderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10832, 'MAR-VERKORT', 'INCOME', '75', '10817', 'Financiële opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10833, 'MAR-VERKORT', 'INCOME', '750', '10832', 'Opbrengsten uit financiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10834, 'MAR-VERKORT', 'INCOME', '751', '10832', 'Opbrengsten uit vlottende activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10835, 'MAR-VERKORT', 'INCOME', '752', '10832',
        'Meerwaarde op de realisatie van vlottende activa (6)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10836, 'MAR-VERKORT', 'INCOME', '753', '10832', 'Kapitaal – en interestsubsidies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10837, 'MAR-VERKORT', 'INCOME', '754', '10832', 'Wisselresultaten (7)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10838, 'MAR-VERKORT', 'INCOME', '755', '10832',
        'Resultaten uit de omrekening van vreemde valuta (7)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10839, 'MAR-VERKORT', 'INCOME', '76', '10817',
        'Niet-recurrente bedrijfs- of financiële opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10840, 'MAR-VERKORT', 'INCOME', '760', '10839',
        'Terugneming van afschrijvingen en waardeverminderingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10841, 'MAR-VERKORT', 'INCOME', '7600', '10840', 'op immateriële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10842, 'MAR-VERKORT', 'INCOME', '7601', '10840', 'op materiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10843, 'MAR-VERKORT', 'INCOME', '761', '10839',
        'Terugneming van waardeverminderingen op financiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10844, 'MAR-VERKORT', 'INCOME', '762', '10839',
        'Terugneming van voorzieningen voor niet-recurrente risico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10845, 'MAR-VERKORT', 'INCOME', '7620', '10844',
        'Terugneming van voorzieningen voor niet-recurrente bedrijfsrisico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10846, 'MAR-VERKORT', 'INCOME', '7621', '10844',
        'Terugneming van voorzieningen voor niet-recurrente financiële risico’s en kosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10847, 'MAR-VERKORT', 'INCOME', '763', '10839', 'Meerwaarden op de realisatie van vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10848, 'MAR-VERKORT', 'INCOME', '7630', '10847',
        'Meerwaarde op de realisatie van immateriële en materiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10849, 'MAR-VERKORT', 'INCOME', '7631', '10847',
        'Meerwaarde op de realisatie van financiële vaste activa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10850, 'MAR-VERKORT', 'INCOME', '769', '10839', 'Andere niet-recurrente financiële opbrengsten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10851, 'MAR-VERKORT', 'INCOME', '77', '10817',
        'Regularisering van belastingen en terugneming van fiscale voorzieningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10852, 'MAR-VERKORT', 'INCOME', '771', '10851', 'Belgische belastingen op het resultaat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10853, 'MAR-VERKORT', 'INCOME', '7710', '10852',
        'Regularisering van verschuldigde of betaalde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10854, 'MAR-VERKORT', 'INCOME', '7711', '10852', 'Regularisering van geraamde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10855, 'MAR-VERKORT', 'INCOME', '7712', '10852', 'Terugneming van fiscale voorzieningen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10856, 'MAR-VERKORT', 'INCOME', '773', '10851', 'Buitenlandse belastingen op het resultaat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10857, 'MAR-VERKORT', 'INCOME', '78', '10817',
        'Onttrekking aan de belastingvrije reserves en de uitgestelde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10858, 'MAR-VERKORT', 'INCOME', '780', '10857', 'Onttrekkingen aan de uitgestelde belastingen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10859, 'MAR-VERKORT', 'INCOME', '789', '10857', 'Onttrekkingen aan de belastingvrije reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10860, 'MAR-VERKORT', 'INCOME', '79', '10817', 'Resultaatverwerking', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10861, 'MAR-VERKORT', 'INCOME', '790', '10860', 'Overgedragen winst van het vorige boekjaar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10862, 'MAR-VERKORT', 'INCOME', '791', '10860',
        'Onttrekking aan het kapitaal en aan de uitgiftepremies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10863, 'MAR-VERKORT', 'INCOME', '792', '10860', 'Onttrekking aan de reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10864, 'MAR-VERKORT', 'INCOME', '793', '10860', 'Over te dragen verlies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10865, 'MAR-VERKORT', 'INCOME', '794', '10860',
        'Tussenkomst van vennoten (of van de eigenaar) in het verlies', 1);

