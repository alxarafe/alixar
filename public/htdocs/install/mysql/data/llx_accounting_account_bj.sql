-- Copyright (C) 2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
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

-- Descriptif des plans comptables SYSCOHADA BJ
-- ID 15000 - 16999
-- ADD 4900000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15000, 'SYSCOHADA-BJ', 'CAPIT', '1', 0, 'Capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15001, 'SYSCOHADA-BJ', 'CAPIT', '101', 15000, 'Capital social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15002, 'SYSCOHADA-BJ', 'CAPIT', '1011', 15001, 'Capital souscrit, non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15003, 'SYSCOHADA-BJ', 'CAPIT', '1012', 15001, 'Capital souscrit, appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15004, 'SYSCOHADA-BJ', 'CAPIT', '1013', 15001, 'Capital souscrit, appelé, versé, non amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15005, 'SYSCOHADA-BJ', 'CAPIT', '1014', 15001, 'Capital souscrit, appelé, versé, amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15006, 'SYSCOHADA-BJ', 'CAPIT', '1018', 15001,
        'Capital souscrit, soumis à des conditions particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15007, 'SYSCOHADA-BJ', 'CAPIT', '102', 15000, 'Capital par dotation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15008, 'SYSCOHADA-BJ', 'CAPIT', '1021', 15007, 'Dotation initiale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15009, 'SYSCOHADA-BJ', 'CAPIT', '1022', 15007, 'Dotations complémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15010, 'SYSCOHADA-BJ', 'CAPIT', '1028', 15007, 'Autres dotations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15011, 'SYSCOHADA-BJ', 'CAPIT', '103', 15000, 'Capital personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15012, 'SYSCOHADA-BJ', 'CAPIT', '104', 15000, 'Compte de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15013, 'SYSCOHADA-BJ', 'CAPIT', '1041', 15012, 'Apports temporaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15014, 'SYSCOHADA-BJ', 'CAPIT', '1042', 15012, 'Opérations courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15015, 'SYSCOHADA-BJ', 'CAPIT', '1043', 15012,
        'Rémunérations, impôts et autres charges personnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15016, 'SYSCOHADA-BJ', 'CAPIT', '1047', 15012, 'Prélèvements d''autoconsommation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15017, 'SYSCOHADA-BJ', 'CAPIT', '1048', 15012, 'Autres prélèvements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15018, 'SYSCOHADA-BJ', 'CAPIT', '105', 15000, 'Primes liees aux capitaux propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15019, 'SYSCOHADA-BJ', 'CAPIT', '1051', 15018, 'Primes d''émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15020, 'SYSCOHADA-BJ', 'CAPIT', '1052', 15018, 'Primes d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15021, 'SYSCOHADA-BJ', 'CAPIT', '1053', 15018, 'Primes de fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15022, 'SYSCOHADA-BJ', 'CAPIT', '1054', 15018, 'Primes de conversion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15023, 'SYSCOHADA-BJ', 'CAPIT', '1058', 15018, 'Autres primes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15024, 'SYSCOHADA-BJ', 'CAPIT', '106', 15000, 'Ecarts de reevaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15025, 'SYSCOHADA-BJ', 'CAPIT', '1061', 15024, 'Ecarts de réévaluation légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15026, 'SYSCOHADA-BJ', 'CAPIT', '1062', 15024, 'Ecarts de réévaluation libre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15027, 'SYSCOHADA-BJ', 'CAPIT', '109', 15000, 'Actionnaires, capital souscrit, non appele', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15028, 'SYSCOHADA-BJ', 'CAPIT', '11', 15000, 'Reserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15029, 'SYSCOHADA-BJ', 'CAPIT', '111', 15028, 'Reserve legale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15030, 'SYSCOHADA-BJ', 'CAPIT', '1111', 15029, 'Réserves légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15031, 'SYSCOHADA-BJ', 'CAPIT', '112', 15028, 'Reserves statutaires ou contractuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15032, 'SYSCOHADA-BJ', 'CAPIT', '113', 15028, 'Reserves reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15033, 'SYSCOHADA-BJ', 'CAPIT', '1131', 15032, 'Réserves de plus-values nettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15034, 'SYSCOHADA-BJ', 'CAPIT', '1133', 15032,
        'Réserves consécutives à l''octroi de subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15035, 'SYSCOHADA-BJ', 'CAPIT', '1134', 15032, 'Réserves spéciales navires renouvelés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15036, 'SYSCOHADA-BJ', 'CAPIT', '1135', 15032,
        'Réserves spéciales matériels et outillage renouvelés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15037, 'SYSCOHADA-BJ', 'CAPIT', '1138', 15032, 'Autres réserves réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15038, 'SYSCOHADA-BJ', 'CAPIT', '118', 15028, 'Autres reserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15039, 'SYSCOHADA-BJ', 'CAPIT', '1181', 15038, 'Réserves facultatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15040, 'SYSCOHADA-BJ', 'CAPIT', '1188', 15038, 'Réserves diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15041, 'SYSCOHADA-BJ', 'CAPIT', '12', 15000, 'Report a nouveau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15042, 'SYSCOHADA-BJ', 'CAPIT', '121', 15041, 'Report a nouveau crediteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15043, 'SYSCOHADA-BJ', 'CAPIT', '1211', 15042, 'Report à nouveau crediteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15044, 'SYSCOHADA-BJ', 'CAPIT', '129', 15041, 'Report a nouveau debiteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15045, 'SYSCOHADA-BJ', 'CAPIT', '1291', 15044, 'Perte nette à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15046, 'SYSCOHADA-BJ', 'CAPIT', '1292', 15044, 'Perte - amortissements réputés différés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15047, 'SYSCOHADA-BJ', 'CAPIT', '13', 15000, 'Resultat net de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15048, 'SYSCOHADA-BJ', 'CAPIT', '1301', 15047, 'Résultat en instance d''affectation : bénéfice',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15049, 'SYSCOHADA-BJ', 'CAPIT', '1309', 15047, 'Résultat en instance d''affectation : perte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15050, 'SYSCOHADA-BJ', 'CAPIT', '131', 15047, 'Resultat net : benefice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15051, 'SYSCOHADA-BJ', 'CAPIT', '132', 15047, 'Marge brute (mb)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15052, 'SYSCOHADA-BJ', 'CAPIT', '1321', 15051, 'Marge brute sur marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15053, 'SYSCOHADA-BJ', 'CAPIT', '1322', 15051, 'Marge brute sur matières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15054, 'SYSCOHADA-BJ', 'CAPIT', '133', 15047, 'Valeur ajoutee (v.a.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15055, 'SYSCOHADA-BJ', 'CAPIT', '134', 15047, 'Excedent brut d''exploitation (e.b.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15056, 'SYSCOHADA-BJ', 'CAPIT', '135', 15047, 'Resultat d''exploitation (r.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15057, 'SYSCOHADA-BJ', 'CAPIT', '136', 15047, 'Resultat financier (r.f.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15058, 'SYSCOHADA-BJ', 'CAPIT', '137', 15047, 'Resultat des activites ordinaires (r.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15059, 'SYSCOHADA-BJ', 'CAPIT', '138', 15047, 'Resultat hors activites ordinaires (r.h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15060, 'SYSCOHADA-BJ', 'CAPIT', '139', 15047, 'Resultat net : perte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15061, 'SYSCOHADA-BJ', 'CAPIT', '14', 15000, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15062, 'SYSCOHADA-BJ', 'CAPIT', '141', 15061, 'Subventions d''equipement a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15063, 'SYSCOHADA-BJ', 'CAPIT', '1411', 15062, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15064, 'SYSCOHADA-BJ', 'CAPIT', '1412', 15062, 'Régions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15065, 'SYSCOHADA-BJ', 'CAPIT', '1413', 15062, 'Départements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15066, 'SYSCOHADA-BJ', 'CAPIT', '1414', 15062, 'Communes et collectivités publiques décentralisées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15067, 'SYSCOHADA-BJ', 'CAPIT', '1415', 15062, 'Entreprises publiques ou mixtes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15068, 'SYSCOHADA-BJ', 'CAPIT', '1416', 15062, 'Entreprises et organismes privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15069, 'SYSCOHADA-BJ', 'CAPIT', '1417', 15062, 'Organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15070, 'SYSCOHADA-BJ', 'CAPIT', '1418', 15062, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15071, 'SYSCOHADA-BJ', 'CAPIT', '142', 15061, 'Subventions d''equipement b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15072, 'SYSCOHADA-BJ', 'CAPIT', '1421', 15071, 'Subventions d''équipements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15073, 'SYSCOHADA-BJ', 'CAPIT', '148', 15061, 'Autres subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15074, 'SYSCOHADA-BJ', 'CAPIT', '15', 15000, 'Provisions reglementees et fonds assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15075, 'SYSCOHADA-BJ', 'CAPIT', '151', 15074, 'Amortissements derogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15076, 'SYSCOHADA-BJ', 'CAPIT', '152', 15074, 'Plus-values de cession a reinvestir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15077, 'SYSCOHADA-BJ', 'CAPIT', '1521', 15076, 'Plus-values de cession à réinvestir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15078, 'SYSCOHADA-BJ', 'CAPIT', '153', 15074, 'Fonds reglementes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15079, 'SYSCOHADA-BJ', 'CAPIT', '1531', 15078, 'Fonds national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15080, 'SYSCOHADA-BJ', 'CAPIT', '1532', 15078, 'Prélèvement pour le budget', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15081, 'SYSCOHADA-BJ', 'CAPIT', '154', 15074, 'Provision speciale de reevaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15082, 'SYSCOHADA-BJ', 'CAPIT', '155', 15074,
        'Provisions reglementees relatives aux immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15083, 'SYSCOHADA-BJ', 'CAPIT', '1551', 15082, 'Recontitution des gisements miniers et pétroliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15084, 'SYSCOHADA-BJ', 'CAPIT', '1552', 15082, 'Provisions de croissance des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15085, 'SYSCOHADA-BJ', 'CAPIT', '1553', 15082, 'Provisions de renouvellement du matériel naval',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15086, 'SYSCOHADA-BJ', 'CAPIT', '1554', 15082,
        'Provisions pourle renouvellement du matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15087, 'SYSCOHADA-BJ', 'CAPIT', '156', 15074, 'Provisions reglementees relatives aux stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15088, 'SYSCOHADA-BJ', 'CAPIT', '1561', 15087, 'Hausse de prix', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15089, 'SYSCOHADA-BJ', 'CAPIT', '1562', 15087, 'Fluctuation des cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15090, 'SYSCOHADA-BJ', 'CAPIT', '157', 15074, 'Provisions pour investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15091, 'SYSCOHADA-BJ', 'CAPIT', '158', 15074, 'Autres provisions et fonds reglementes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15092, 'SYSCOHADA-BJ', 'CAPIT', '16', 15000, 'Emprunts et dettes assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15093, 'SYSCOHADA-BJ', 'CAPIT', '161', 15092, 'Emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15094, 'SYSCOHADA-BJ', 'CAPIT', '1611', 15093, 'Emprunts obligataires ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15095, 'SYSCOHADA-BJ', 'CAPIT', '1612', 15093, 'Emprunts obligataires convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15096, 'SYSCOHADA-BJ', 'CAPIT', '1618', 15093, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15097, 'SYSCOHADA-BJ', 'CAPIT', '1619', 15093, 'Obligations à souscrire, à la souche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15098, 'SYSCOHADA-BJ', 'CAPIT', '162', 15092,
        'Emprunts et dettes aupres des etablissements de credit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15099, 'SYSCOHADA-BJ', 'CAPIT', '163', 15092, 'Avances recues de l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15100, 'SYSCOHADA-BJ', 'CAPIT', '164', 15092, 'Avances recues et comptes courants bloques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15101, 'SYSCOHADA-BJ', 'CAPIT', '165', 15092, 'Depots et cautionnements recus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15102, 'SYSCOHADA-BJ', 'CAPIT', '1651', 15101, 'Dépôts à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15103, 'SYSCOHADA-BJ', 'CAPIT', '1652', 15101, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15104, 'SYSCOHADA-BJ', 'CAPIT', '166', 15092, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15105, 'SYSCOHADA-BJ', 'CAPIT', '1661', 15104, 'Sur emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15106, 'SYSCOHADA-BJ', 'CAPIT', '1662', 15104,
        'Sur emprunts et dettes auprès des établissements de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15107, 'SYSCOHADA-BJ', 'CAPIT', '1663', 15104, 'Sur avances reçues de l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15108, 'SYSCOHADA-BJ', 'CAPIT', '1664', 15104, 'Sur avances reçues et comptes courants bloqués',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15109, 'SYSCOHADA-BJ', 'CAPIT', '1665', 15104, 'Sur dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15110, 'SYSCOHADA-BJ', 'CAPIT', '1667', 15104, 'Sur avances assorties de conditions particulières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15111, 'SYSCOHADA-BJ', 'CAPIT', '1668', 15104, 'Sur autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15112, 'SYSCOHADA-BJ', 'CAPIT', '167', 15092, 'Avances assorties de conditions particulieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15113, 'SYSCOHADA-BJ', 'CAPIT', '1671', 15112, 'Avances bloquées pour augmentation du capital',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15114, 'SYSCOHADA-BJ', 'CAPIT', '1672', 15112, 'Avances conditionnées par l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15115, 'SYSCOHADA-BJ', 'CAPIT', '1673', 15112,
        'Avances conditionnées par les autres organismes africains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15116, 'SYSCOHADA-BJ', 'CAPIT', '1674', 15112,
        'Avances conditionné par les autres organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15117, 'SYSCOHADA-BJ', 'CAPIT', '1676', 15112, 'Droits du concédant exigibles en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15118, 'SYSCOHADA-BJ', 'CAPIT', '168', 15092, 'Autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15119, 'SYSCOHADA-BJ', 'CAPIT', '1681', 15118, 'Rentes viagères capitalisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15120, 'SYSCOHADA-BJ', 'CAPIT', '1682', 15118, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15121, 'SYSCOHADA-BJ', 'CAPIT', '1683', 15118, 'Dettes consécutives à des titres emprunté', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15122, 'SYSCOHADA-BJ', 'CAPIT', '1684', 15118, 'Dettes du concédant exigibles en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15123, 'SYSCOHADA-BJ', 'CAPIT', '1685', 15118, 'Emprunts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15124, 'SYSCOHADA-BJ', 'CAPIT', '1686', 15118, 'Participation des travailleurs aux bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15125, 'SYSCOHADA-BJ', 'CAPIT', '17', 15000, 'Dettes de credit-bail et contrats assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15126, 'SYSCOHADA-BJ', 'CAPIT', '172', 15125, 'Emprunts equivalents de credit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15127, 'SYSCOHADA-BJ', 'CAPIT', '173', 15125, 'Emprunts equivalents de credit-bail mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15128, 'SYSCOHADA-BJ', 'CAPIT', '176', 15125, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15129, 'SYSCOHADA-BJ', 'CAPIT', '1762', 15128, 'Sur emprunts équivalents de crédit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15130, 'SYSCOHADA-BJ', 'CAPIT', '1763', 15128, 'Sur emprunts équivalents de crédit-bail mobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15131, 'SYSCOHADA-BJ', 'CAPIT', '1768', 15128, 'Sur emprunts équivalents d''autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15132, 'SYSCOHADA-BJ', 'CAPIT', '178', 15125, 'Emprunts equivalents d''autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15133, 'SYSCOHADA-BJ', 'CAPIT', '18', 15000,
        'Dettes liees a des participations et comptes de liaison des etablissements et societes en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15134, 'SYSCOHADA-BJ', 'CAPIT', '181', 15133, 'Dettes liees a des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15135, 'SYSCOHADA-BJ', 'CAPIT', '1811', 15134, 'Dettes liées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15136, 'SYSCOHADA-BJ', 'CAPIT', '1812', 15134, 'Dettes liées à des participations (hors groupe)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15137, 'SYSCOHADA-BJ', 'CAPIT', '182', 15133, 'Dettes liees a des societes en paticipation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15138, 'SYSCOHADA-BJ', 'CAPIT', '183', 15133,
        'Interets courus sur dettes liees a des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15139, 'SYSCOHADA-BJ', 'CAPIT', '184', 15133,
        'Comptes permanents bloques des etablissements et succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15140, 'SYSCOHADA-BJ', 'CAPIT', '185', 15133,
        'Comptes permanents non bloques des etablissements et succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15141, 'SYSCOHADA-BJ', 'CAPIT', '186', 15133, 'Comptes de liaison charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15142, 'SYSCOHADA-BJ', 'CAPIT', '187', 15133, 'Comptes de liaison produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15143, 'SYSCOHADA-BJ', 'CAPIT', '188', 15133, 'Comptes de liaison des societes en participation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15144, 'SYSCOHADA-BJ', 'CAPIT', '19', 15000, 'Provisions financieres pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15145, 'SYSCOHADA-BJ', 'CAPIT', '191', 15144, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15146, 'SYSCOHADA-BJ', 'CAPIT', '192', 15144, 'Provisions pour garanties donnees aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15147, 'SYSCOHADA-BJ', 'CAPIT', '193', 15144,
        'Provisions pour pertes sur marches a achevement futur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15148, 'SYSCOHADA-BJ', 'CAPIT', '194', 15144, 'Provisions pour pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15149, 'SYSCOHADA-BJ', 'CAPIT', '195', 15144, 'Provisions pour impots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15150, 'SYSCOHADA-BJ', 'CAPIT', '196', 15144, 'Provisions pour pensions et obligations similaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15151, 'SYSCOHADA-BJ', 'CAPIT', '197', 15144,
        'Provisions pour charges a repartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15152, 'SYSCOHADA-BJ', 'CAPIT', '1971', 15151, 'Provisions pour grosses réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15153, 'SYSCOHADA-BJ', 'CAPIT', '198', 15144,
        'Autres provisions financieres pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15154, 'SYSCOHADA-BJ', 'CAPIT', '1981', 15153, 'Provisions pour amendes et pénalités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15155, 'SYSCOHADA-BJ', 'CAPIT', '1982', 15153,
        'Provisions pour renouvellement des immobilisations (entreprises concessionnaires)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15156, 'SYSCOHADA-BJ', 'CAPIT', '1983', 15153, 'Provisions pour propres assureurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15157, 'SYSCOHADA-BJ', 'CAPIT', '1988', 15153,
        'Autres provisions financières pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15158, 'SYSCOHADA-BJ', 'IMMO', '2', 0, 'Charges immobilisees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15159, 'SYSCOHADA-BJ', 'IMMO', '201', 15158, 'Frais d''etablissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15160, 'SYSCOHADA-BJ', 'IMMO', '2011', 15159, 'Frais de constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15161, 'SYSCOHADA-BJ', 'IMMO', '2012', 15159, 'Frais de prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15162, 'SYSCOHADA-BJ', 'IMMO', '2013', 15159, 'Frais de publicité et de lancement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15163, 'SYSCOHADA-BJ', 'IMMO', '2014', 15159, 'Frais de fonctionnement antérieurs au démarrage',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15164, 'SYSCOHADA-BJ', 'IMMO', '2015', 15159,
        'Frais de modification du capital (fusions, scissions transformations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15165, 'SYSCOHADA-BJ', 'IMMO', '2016', 15159, 'Frais d''entrée à la bourse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15166, 'SYSCOHADA-BJ', 'IMMO', '2017', 15159, 'Frais de restructuration', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15167, 'SYSCOHADA-BJ', 'IMMO', '2018', 15159, 'Frais divers d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15168, 'SYSCOHADA-BJ', 'IMMO', '202', 15158, 'Charges a repartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15169, 'SYSCOHADA-BJ', 'IMMO', '2021', 15168, 'Charges différées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15170, 'SYSCOHADA-BJ', 'IMMO', '2022', 15168, 'Frais d''acquisition d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15171, 'SYSCOHADA-BJ', 'IMMO', '2026', 15168, 'Fais d''émission des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15172, 'SYSCOHADA-BJ', 'IMMO', '2028', 15168, 'Charges à étaler', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15173, 'SYSCOHADA-BJ', 'IMMO', '206', 15158, 'Primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15174, 'SYSCOHADA-BJ', 'IMMO', '2061', 15173, 'Obligations ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15175, 'SYSCOHADA-BJ', 'IMMO', '2062', 15173, 'Obligations convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15176, 'SYSCOHADA-BJ', 'IMMO', '2068', 15173, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15177, 'SYSCOHADA-BJ', 'IMMO', '21', 15158, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15178, 'SYSCOHADA-BJ', 'IMMO', '211', 15177, 'Frais de recherche et de developpement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15179, 'SYSCOHADA-BJ', 'IMMO', '212', 15177, 'Brevets, licences, concessions et droits similaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15180, 'SYSCOHADA-BJ', 'IMMO', '213', 15177, 'Logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15181, 'SYSCOHADA-BJ', 'IMMO', '214', 15177, 'Marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15182, 'SYSCOHADA-BJ', 'IMMO', '215', 15177, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15183, 'SYSCOHADA-BJ', 'IMMO', '216', 15177, 'Droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15184, 'SYSCOHADA-BJ', 'IMMO', '217', 15177, 'Investissements de creation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15185, 'SYSCOHADA-BJ', 'IMMO', '218', 15177, 'Autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15186, 'SYSCOHADA-BJ', 'IMMO', '219', 15177, 'Immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15187, 'SYSCOHADA-BJ', 'IMMO', '2191', 15186, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15188, 'SYSCOHADA-BJ', 'IMMO', '2193', 15186, 'Logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15189, 'SYSCOHADA-BJ', 'IMMO', '2198', 15186, 'Autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15190, 'SYSCOHADA-BJ', 'IMMO', '22', 15158, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15191, 'SYSCOHADA-BJ', 'IMMO', '221', 15190, 'Terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15192, 'SYSCOHADA-BJ', 'IMMO', '2211', 15191, 'Terrains d''exploitation agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15193, 'SYSCOHADA-BJ', 'IMMO', '2212', 15191, 'Terrains d''exploitation forestière', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15194, 'SYSCOHADA-BJ', 'IMMO', '2218', 15191, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15195, 'SYSCOHADA-BJ', 'IMMO', '222', 15190, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15196, 'SYSCOHADA-BJ', 'IMMO', '2221', 15195, 'Terrains à bâtir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15197, 'SYSCOHADA-BJ', 'IMMO', '2228', 15195, 'Autres terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15198, 'SYSCOHADA-BJ', 'IMMO', '223', 15190, 'Terrains batis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15199, 'SYSCOHADA-BJ', 'IMMO', '2231', 15198, 'Pour bâtiments industriels et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15200, 'SYSCOHADA-BJ', 'IMMO', '2232', 15198, 'Pour bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15201, 'SYSCOHADA-BJ', 'IMMO', '2234', 15198,
        'Pour bâtiments affectés aux autres opérations professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15202, 'SYSCOHADA-BJ', 'IMMO', '2235', 15198,
        'Pour bâtiments affectés aux autres opérations non professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15203, 'SYSCOHADA-BJ', 'IMMO', '2236', 15198, 'Autres terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15204, 'SYSCOHADA-BJ', 'IMMO', '224', 15190, 'Travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15205, 'SYSCOHADA-BJ', 'IMMO', '2241', 15204, 'Plantation d''arbres et d''arbustes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15206, 'SYSCOHADA-BJ', 'IMMO', '2248', 15204, 'Autres travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15207, 'SYSCOHADA-BJ', 'IMMO', '225', 15190, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15208, 'SYSCOHADA-BJ', 'IMMO', '2251', 15207, 'Carrières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15209, 'SYSCOHADA-BJ', 'IMMO', '226', 15190, 'Terrains amenages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15210, 'SYSCOHADA-BJ', 'IMMO', '2261', 15209, 'Parkings', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15211, 'SYSCOHADA-BJ', 'IMMO', '227', 15190, 'Terrains mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15212, 'SYSCOHADA-BJ', 'IMMO', '228', 15190, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15213, 'SYSCOHADA-BJ', 'IMMO', '2281', 15212, 'Terrains des immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15214, 'SYSCOHADA-BJ', 'IMMO', '2285', 15212, 'Terrains des logements affectés au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15215, 'SYSCOHADA-BJ', 'IMMO', '2288', 15212, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15216, 'SYSCOHADA-BJ', 'IMMO', '229', 15190, 'Amenagements des terrains en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15217, 'SYSCOHADA-BJ', 'IMMO', '2291', 15216, 'Terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15218, 'SYSCOHADA-BJ', 'IMMO', '2292', 15216, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15219, 'SYSCOHADA-BJ', 'IMMO', '2295', 15216, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15220, 'SYSCOHADA-BJ', 'IMMO', '2298', 15216, 'Autres travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15221, 'SYSCOHADA-BJ', 'IMMO', '23', 15158, 'Bâtiments, installations techniques et agencements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15222, 'SYSCOHADA-BJ', 'IMMO', '231', 15221,
        'Bâtiments industriels, agricoles, administratifs et commerciaux sur sol propre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15223, 'SYSCOHADA-BJ', 'IMMO', '2311', 15222, 'Bâtiments industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15224, 'SYSCOHADA-BJ', 'IMMO', '2312', 15222, 'Bâtiments agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15225, 'SYSCOHADA-BJ', 'IMMO', '2313', 15222, 'Bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15226, 'SYSCOHADA-BJ', 'IMMO', '2314', 15222, 'Bâtiments affectés au logement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15227, 'SYSCOHADA-BJ', 'IMMO', '2315', 15222, 'Immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15228, 'SYSCOHADA-BJ', 'IMMO', '232', 15221,
        'Bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15229, 'SYSCOHADA-BJ', 'IMMO', '2321', 15228, 'Bâtiments industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15230, 'SYSCOHADA-BJ', 'IMMO', '2322', 15228, 'Bâtiments agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15231, 'SYSCOHADA-BJ', 'IMMO', '2323', 15228, 'Bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15232, 'SYSCOHADA-BJ', 'IMMO', '2324', 15228, 'Bâtiments affectés au logement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15233, 'SYSCOHADA-BJ', 'IMMO', '2325', 15228, 'Immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15234, 'SYSCOHADA-BJ', 'IMMO', '233', 15221, 'Ouvrages d''infrastructures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15235, 'SYSCOHADA-BJ', 'IMMO', '2331', 15234, 'Voies de terre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15236, 'SYSCOHADA-BJ', 'IMMO', '2332', 15234, 'Voies de fer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15237, 'SYSCOHADA-BJ', 'IMMO', '2333', 15234, 'Voies d''eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15238, 'SYSCOHADA-BJ', 'IMMO', '2334', 15234, 'Barrages, digues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15239, 'SYSCOHADA-BJ', 'IMMO', '2335', 15234, 'Pistes d''aérodrome', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15240, 'SYSCOHADA-BJ', 'IMMO', '2338', 15234, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15241, 'SYSCOHADA-BJ', 'IMMO', '234', 15221, 'Installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15242, 'SYSCOHADA-BJ', 'IMMO', '2341', 15241, 'Installations complexes spécialisées sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15243, 'SYSCOHADA-BJ', 'IMMO', '2342', 15241,
        'Installations complexes spécialisées sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15244, 'SYSCOHADA-BJ', 'IMMO', '2343', 15241, 'Installations à caractère spécifique sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15245, 'SYSCOHADA-BJ', 'IMMO', '2344', 15241,
        'Installations à caractère spécifique sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15246, 'SYSCOHADA-BJ', 'IMMO', '235', 15221, 'Amenagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15247, 'SYSCOHADA-BJ', 'IMMO', '2351', 15246, 'Installations générales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15248, 'SYSCOHADA-BJ', 'IMMO', '2358', 15246, 'Autres installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15249, 'SYSCOHADA-BJ', 'IMMO', '237', 15221,
        'Batiments industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15250, 'SYSCOHADA-BJ', 'IMMO', '238', 15221, 'Autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15251, 'SYSCOHADA-BJ', 'IMMO', '239', 15221, 'Bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15252, 'SYSCOHADA-BJ', 'IMMO', '2391', 15251, 'Bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15253, 'SYSCOHADA-BJ', 'IMMO', '24', 15158, 'Materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15254, 'SYSCOHADA-BJ', 'IMMO', '241', 15253, 'Materiel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15255, 'SYSCOHADA-BJ', 'IMMO', '2411', 15254, 'Matériel industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15256, 'SYSCOHADA-BJ', 'IMMO', '2412', 15254, 'Outillage industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15257, 'SYSCOHADA-BJ', 'IMMO', '2413', 15254, 'Matériel commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15258, 'SYSCOHADA-BJ', 'IMMO', '2414', 15254, 'Outillage commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15259, 'SYSCOHADA-BJ', 'IMMO', '242', 15253, 'Materiel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15260, 'SYSCOHADA-BJ', 'IMMO', '2421', 15259, 'Matériel agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15261, 'SYSCOHADA-BJ', 'IMMO', '2422', 15259, 'Outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15262, 'SYSCOHADA-BJ', 'IMMO', '243', 15253, 'Materiel d''emballage recuperable et identifiable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15263, 'SYSCOHADA-BJ', 'IMMO', '244', 15253, 'Materiel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15264, 'SYSCOHADA-BJ', 'IMMO', '2441', 15263, 'Matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15265, 'SYSCOHADA-BJ', 'IMMO', '2442', 15263, 'Matériel informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15266, 'SYSCOHADA-BJ', 'IMMO', '2443', 15263, 'Matériel bureautique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15267, 'SYSCOHADA-BJ', 'IMMO', '2444', 15263, 'Mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15268, 'SYSCOHADA-BJ', 'IMMO', '2446', 15263, 'Matériel et mobilier des immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15269, 'SYSCOHADA-BJ', 'IMMO', '2447', 15263, 'Matériel et mobilier des logements du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15270, 'SYSCOHADA-BJ', 'IMMO', '245', 15253, 'Materiel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15271, 'SYSCOHADA-BJ', 'IMMO', '2451', 15270, 'Matériel automobile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15272, 'SYSCOHADA-BJ', 'IMMO', '2452', 15270, 'Matériel ferroviaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15273, 'SYSCOHADA-BJ', 'IMMO', '2453', 15270, 'Matériel fluvial, lagunaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15274, 'SYSCOHADA-BJ', 'IMMO', '2454', 15270, 'Matériel naval', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15275, 'SYSCOHADA-BJ', 'IMMO', '2455', 15270, 'Matériel aérien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15276, 'SYSCOHADA-BJ', 'IMMO', '2456', 15270, 'Matériel hippomobile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15277, 'SYSCOHADA-BJ', 'IMMO', '2458', 15270, 'Autres (vélo, mobylette, moto)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15278, 'SYSCOHADA-BJ', 'IMMO', '246', 15253, 'Immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15279, 'SYSCOHADA-BJ', 'IMMO', '2461', 15278, 'Cheptel, animaux de trait', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15280, 'SYSCOHADA-BJ', 'IMMO', '2462', 15278, 'Cheptel, animaux reproducteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15281, 'SYSCOHADA-BJ', 'IMMO', '2463', 15278, 'Animaux de garde', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15282, 'SYSCOHADA-BJ', 'IMMO', '2465', 15278, 'Plantations agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15283, 'SYSCOHADA-BJ', 'IMMO', '2468', 15278, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15284, 'SYSCOHADA-BJ', 'IMMO', '247', 15253, 'Agencements et amenagements du materiel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15285, 'SYSCOHADA-BJ', 'IMMO', '248', 15253, 'Autres materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15286, 'SYSCOHADA-BJ', 'IMMO', '2481', 15285, 'Collections et oeuvres d''art', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15287, 'SYSCOHADA-BJ', 'IMMO', '249', 15253, 'Materiel en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15288, 'SYSCOHADA-BJ', 'IMMO', '2491', 15287, 'Matériel et outillage industriel et commercial',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15289, 'SYSCOHADA-BJ', 'IMMO', '2492', 15287, 'Matériel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15290, 'SYSCOHADA-BJ', 'IMMO', '2493', 15287, 'Matériel d''emballage récupérable et identifiable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15291, 'SYSCOHADA-BJ', 'IMMO', '2494', 15287, 'Matériel et mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15292, 'SYSCOHADA-BJ', 'IMMO', '2495', 15287, 'Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15293, 'SYSCOHADA-BJ', 'IMMO', '2496', 15287, 'Immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15294, 'SYSCOHADA-BJ', 'IMMO', '2497', 15287, 'Agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15295, 'SYSCOHADA-BJ', 'IMMO', '2498', 15287, 'Autres matériels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15296, 'SYSCOHADA-BJ', 'IMMO', '25', 15158, 'Avances et acomptes verses sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15297, 'SYSCOHADA-BJ', 'IMMO', '251', 15296,
        'Avances et acomptes verses sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15298, 'SYSCOHADA-BJ', 'IMMO', '252', 15296,
        'Avances et acomptes verses sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15299, 'SYSCOHADA-BJ', 'IMMO', '26', 15158, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15300, 'SYSCOHADA-BJ', 'IMMO', '261', 15299,
        'Titres de participation dans des societes sous contrôle exclusif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15301, 'SYSCOHADA-BJ', 'IMMO', '262', 15299,
        'Titres de participation dans des societes sous contrôle conjoint', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15302, 'SYSCOHADA-BJ', 'IMMO', '263', 15299,
        'Titres de participation dans des societes conferant une influence notable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15303, 'SYSCOHADA-BJ', 'IMMO', '265', 15299, 'Participations dans des organismes professionnels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15304, 'SYSCOHADA-BJ', 'IMMO', '266', 15299,
        'Part dans des groupements d''interets economique (g.i.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15305, 'SYSCOHADA-BJ', 'IMMO', '268', 15299, 'Autres titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15306, 'SYSCOHADA-BJ', 'IMMO', '27', 15158, 'Autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15307, 'SYSCOHADA-BJ', 'IMMO', '271', 15306, 'Prêts et creances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15308, 'SYSCOHADA-BJ', 'IMMO', '2711', 15307, 'Prêts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15309, 'SYSCOHADA-BJ', 'IMMO', '2712', 15307, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15310, 'SYSCOHADA-BJ', 'IMMO', '2713', 15307, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15311, 'SYSCOHADA-BJ', 'IMMO', '2714', 15307, 'Titres prêtés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15312, 'SYSCOHADA-BJ', 'IMMO', '272', 15306, 'Prets au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15313, 'SYSCOHADA-BJ', 'IMMO', '2721', 15312, 'Prêts immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15314, 'SYSCOHADA-BJ', 'IMMO', '2722', 15312, 'Prêts mobiliers et d''intallation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15315, 'SYSCOHADA-BJ', 'IMMO', '2728', 15312, 'Autres prêts (frais d''étude...)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15316, 'SYSCOHADA-BJ', 'IMMO', '273', 15306, 'Creances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15317, 'SYSCOHADA-BJ', 'IMMO', '2731', 15316, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15318, 'SYSCOHADA-BJ', 'IMMO', '2733', 15316, 'Fonds reglementé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15319, 'SYSCOHADA-BJ', 'IMMO', '2738', 15316, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15320, 'SYSCOHADA-BJ', 'IMMO', '274', 15306, 'Titres immobilises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15321, 'SYSCOHADA-BJ', 'IMMO', '2741', 15320,
        'Titres immobilisés de l''activité de portefeuille (t.i.a.p.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15322, 'SYSCOHADA-BJ', 'IMMO', '2742', 15320, 'Titres participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15323, 'SYSCOHADA-BJ', 'IMMO', '2743', 15320, 'Certificats d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15324, 'SYSCOHADA-BJ', 'IMMO', '2744', 15320, 'Parts de fonds commun de placement (f.c.p.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15325, 'SYSCOHADA-BJ', 'IMMO', '2748', 15320, 'Autres titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15326, 'SYSCOHADA-BJ', 'IMMO', '275', 15306, 'Depots et cautionnements verses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15327, 'SYSCOHADA-BJ', 'IMMO', '2751', 15326, 'Dépôts pour loyers d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15328, 'SYSCOHADA-BJ', 'IMMO', '2752', 15326, 'Dépôts pour l''électricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15329, 'SYSCOHADA-BJ', 'IMMO', '2753', 15326, 'Dépôts pour l''eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15330, 'SYSCOHADA-BJ', 'IMMO', '2754', 15326, 'Dépôts pour le gaz', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15331, 'SYSCOHADA-BJ', 'IMMO', '2755', 15326, 'Dépôts pour le téléphone, le télex, la télécopie',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15332, 'SYSCOHADA-BJ', 'IMMO', '2756', 15326, 'Cautionnements sur les marchés publics', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15333, 'SYSCOHADA-BJ', 'IMMO', '2757', 15326, 'Cautionnements sur autres opérations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15334, 'SYSCOHADA-BJ', 'IMMO', '2758', 15326, 'Autres dépôts et cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15335, 'SYSCOHADA-BJ', 'IMMO', '276', 15306, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15336, 'SYSCOHADA-BJ', 'IMMO', '2761', 15335, 'Prêts et créances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15337, 'SYSCOHADA-BJ', 'IMMO', '2762', 15335, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15338, 'SYSCOHADA-BJ', 'IMMO', '2763', 15335, 'Créances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15339, 'SYSCOHADA-BJ', 'IMMO', '2764', 15335, 'Titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15340, 'SYSCOHADA-BJ', 'IMMO', '2765', 15335, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15341, 'SYSCOHADA-BJ', 'IMMO', '2767', 15335, 'Créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15342, 'SYSCOHADA-BJ', 'IMMO', '2768', 15335, 'Immobilisations financières diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15343, 'SYSCOHADA-BJ', 'IMMO', '277', 15306,
        'Créances rattachees a des participations et des avances a des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15344, 'SYSCOHADA-BJ', 'IMMO', '2771', 15343, 'Créances rattachées à des participations (groupe)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15345, 'SYSCOHADA-BJ', 'IMMO', '2772', 15343,
        'Créances rattachées à des participations (hors groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15346, 'SYSCOHADA-BJ', 'IMMO', '2773', 15343, 'Créances rattachées à des sociétés en participation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15347, 'SYSCOHADA-BJ', 'IMMO', '2774', 15343,
        'Avances à des groupements d''intérêt économique (g.i.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15348, 'SYSCOHADA-BJ', 'IMMO', '278', 15306, 'Immobilisations financieres diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15349, 'SYSCOHADA-BJ', 'IMMO', '2781', 15348, 'Créances diverses groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15350, 'SYSCOHADA-BJ', 'IMMO', '2782', 15348, 'Créances diverses hors groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15351, 'SYSCOHADA-BJ', 'IMMO', '2785', 15348, 'Or et métaux précieux (1)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15352, 'SYSCOHADA-BJ', 'IMMO', '28', 15158, 'Amortissemnts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15353, 'SYSCOHADA-BJ', 'IMMO', '281', 15352, 'Amortissements des immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15354, 'SYSCOHADA-BJ', 'IMMO', '2811', 15353,
        'Amortissements des frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15355, 'SYSCOHADA-BJ', 'IMMO', '2812', 15353,
        'Amortissements des brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15356, 'SYSCOHADA-BJ', 'IMMO', '2813', 15353, 'Amortissements des logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15357, 'SYSCOHADA-BJ', 'IMMO', '2814', 15353, 'Amortissements des marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15358, 'SYSCOHADA-BJ', 'IMMO', '2815', 15353, 'Amortissements du fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15359, 'SYSCOHADA-BJ', 'IMMO', '2816', 15353, 'Amortissements du droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15360, 'SYSCOHADA-BJ', 'IMMO', '2817', 15353, 'Amortissements des investissements de création',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15361, 'SYSCOHADA-BJ', 'IMMO', '2818', 15353,
        'Amortissements des autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15362, 'SYSCOHADA-BJ', 'IMMO', '282', 15352, 'Amortissements des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15363, 'SYSCOHADA-BJ', 'IMMO', '2821', 15362, 'Amortissements des terrains agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15364, 'SYSCOHADA-BJ', 'IMMO', '2824', 15362,
        'Amortissements des travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15365, 'SYSCOHADA-BJ', 'IMMO', '2825', 15362, 'Amortissements des terrains de gisements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15366, 'SYSCOHADA-BJ', 'IMMO', '283', 15352,
        'Amortissements des batiments, installations techniques et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15367, 'SYSCOHADA-BJ', 'IMMO', '2831', 15366,
        'Amortissements des bâtiments industriels, agricoles, administratifs et commerciaux sur sol propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15368, 'SYSCOHADA-BJ', 'IMMO', '2832', 15366,
        'Amortissements des bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15369, 'SYSCOHADA-BJ', 'IMMO', '2833', 15366, 'Amortissements des ouvrages d''infrastructure', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15370, 'SYSCOHADA-BJ', 'IMMO', '2834', 15366, 'Amortissements des installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15371, 'SYSCOHADA-BJ', 'IMMO', '2835', 15366, 'Amortissements des aménagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15372, 'SYSCOHADA-BJ', 'IMMO', '2837', 15366,
        'Amortissements des bâtiments  industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15373, 'SYSCOHADA-BJ', 'IMMO', '2838', 15366,
        'Amortissements des autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15374, 'SYSCOHADA-BJ', 'IMMO', '284', 15352, 'Amortissement du materiel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15375, 'SYSCOHADA-BJ', 'IMMO', '2841', 15374,
        'Amortissements du matériel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15376, 'SYSCOHADA-BJ', 'IMMO', '2842', 15374, 'Amortissements du matériel et outillage agricole',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15377, 'SYSCOHADA-BJ', 'IMMO', '2843', 15374,
        'Amortissements du matériel d''emballage récupérable et identifiable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15378, 'SYSCOHADA-BJ', 'IMMO', '2844', 15374, 'Amortissements du matériel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15379, 'SYSCOHADA-BJ', 'IMMO', '2845', 15374, 'Amortissements du materiel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15380, 'SYSCOHADA-BJ', 'IMMO', '2846', 15374,
        'Amortissements des immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15381, 'SYSCOHADA-BJ', 'IMMO', '2847', 15374,
        'Amortissements des agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15382, 'SYSCOHADA-BJ', 'IMMO', '2848', 15374, 'Amortissements des autres matériels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15383, 'SYSCOHADA-BJ', 'IMMO', '29', 15158, 'Provisions pour depreciation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15384, 'SYSCOHADA-BJ', 'IMMO', '291', 15383,
        'Provisions pour depreciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15385, 'SYSCOHADA-BJ', 'IMMO', '2912', 15384,
        'Provisions pour dépréciation des brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15386, 'SYSCOHADA-BJ', 'IMMO', '2913', 15384, 'Provisions pour dépréciation des logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15387, 'SYSCOHADA-BJ', 'IMMO', '2914', 15384, 'Provisions pour dépréciation des marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15388, 'SYSCOHADA-BJ', 'IMMO', '2915', 15384, 'Provisions pour dépréciation du fonds de commerce',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15389, 'SYSCOHADA-BJ', 'IMMO', '2916', 15384, 'Provisions pour dépréciation du droit de bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15390, 'SYSCOHADA-BJ', 'IMMO', '2917', 15384,
        'Provisions pour dépréciation des investissements de création', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15391, 'SYSCOHADA-BJ', 'IMMO', '2918', 15384,
        'Provisions pour dépréciation des autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15392, 'SYSCOHADA-BJ', 'IMMO', '2919', 15384,
        'Provisions pour dépréciation des immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15393, 'SYSCOHADA-BJ', 'IMMO', '292', 15383, 'Provisions pour depreciation des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15394, 'SYSCOHADA-BJ', 'IMMO', '2921', 15393,
        'Provisions pour dépréciations des terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15395, 'SYSCOHADA-BJ', 'IMMO', '2922', 15393, 'Provisions pour dépréciation des terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15396, 'SYSCOHADA-BJ', 'IMMO', '2923', 15393, 'Provisions pour dépréciation des terrains bâtis',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15397, 'SYSCOHADA-BJ', 'IMMO', '2924', 15393,
        'Provisions pour dépréciation des travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15398, 'SYSCOHADA-BJ', 'IMMO', '2925', 15393,
        'Provisions pour dépréciation des terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15399, 'SYSCOHADA-BJ', 'IMMO', '2926', 15393, 'Provisions pour dépréciation des terrains aménagés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15400, 'SYSCOHADA-BJ', 'IMMO', '2927', 15393,
        'Provisions pour dépréciation des terrains mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15401, 'SYSCOHADA-BJ', 'IMMO', '2928', 15393, 'Provisions pour dépréciation des autres terrains',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15402, 'SYSCOHADA-BJ', 'IMMO', '2929', 15393,
        'Provisions pour dépréciation des aménagements terrains en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15403, 'SYSCOHADA-BJ', 'IMMO', '293', 15383,
        'Provisions pour depreciation des batiments, installations techniques et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15404, 'SYSCOHADA-BJ', 'IMMO', '2931', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles, administratifs et commerciaux sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15405, 'SYSCOHADA-BJ', 'IMMO', '2932', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15406, 'SYSCOHADA-BJ', 'IMMO', '2933', 15403,
        'Provisions pour dépréciation des ouvrages d''infrastructures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15407, 'SYSCOHADA-BJ', 'IMMO', '2934', 15403,
        'Provisions pour dépréciation des installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15408, 'SYSCOHADA-BJ', 'IMMO', '2935', 15403,
        'Provisions pour dépréciation des aménagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15409, 'SYSCOHADA-BJ', 'IMMO', '2937', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15410, 'SYSCOHADA-BJ', 'IMMO', '2938', 15403,
        'Provisions pour dépréciation des autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15411, 'SYSCOHADA-BJ', 'IMMO', '2939', 15403,
        'Provisions pour dépréciation des bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15412, 'SYSCOHADA-BJ', 'IMMO', '294', 15383, 'Provisions pour depreciation des materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15413, 'SYSCOHADA-BJ', 'IMMO', '2941', 15412,
        'Provisions pour dépréciation du matériel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15414, 'SYSCOHADA-BJ', 'IMMO', '2942', 15412,
        'Provisions pour dépréciation du matériel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15415, 'SYSCOHADA-BJ', 'IMMO', '2943', 15412,
        'Provisions pour dépréciation du matériel d''emballage récupérable et identifiable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15416, 'SYSCOHADA-BJ', 'IMMO', '2944', 15412,
        'Provisions pour dépréciation du matériel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15417, 'SYSCOHADA-BJ', 'IMMO', '2945', 15412,
        'Provisions pour dépréciation du matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15418, 'SYSCOHADA-BJ', 'IMMO', '2946', 15412,
        'Provisions pour dépréciation des immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15419, 'SYSCOHADA-BJ', 'IMMO', '2947', 15412,
        'Provisions pour dépréciation des agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15420, 'SYSCOHADA-BJ', 'IMMO', '2948', 15412, 'Provisions pour dépréciation des autres matériels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15421, 'SYSCOHADA-BJ', 'IMMO', '2949', 15412, 'Provisions pour dépréciation des matériels en cours',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15422, 'SYSCOHADA-BJ', 'IMMO', '295', 15383,
        'Provisions pour depreciation des avances et acomptes verses sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15423, 'SYSCOHADA-BJ', 'IMMO', '2951', 15422,
        'Provisions pour dépréciation des avances et acomptes versés sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15424, 'SYSCOHADA-BJ', 'IMMO', '2952', 15422,
        'Provisions pour dépréciation des avances et acomptes versés sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15425, 'SYSCOHADA-BJ', 'IMMO', '296', 15383,
        'Provisions pour dépréciation des titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15426, 'SYSCOHADA-BJ', 'IMMO', '2961', 15425,
        'Provisions pour dépréciation des titres de participation dans des sociétés sous contrôle exclusif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15427, 'SYSCOHADA-BJ', 'IMMO', '2962', 15425,
        'Provisions pour dépréciation des titres de participations dans les sociétés sous contrôle conjoint', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15428, 'SYSCOHADA-BJ', 'IMMO', '2963', 15425,
        'Provisions pour dépréciation des titres de participations dans les sociétés confèrant une influence notable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15429, 'SYSCOHADA-BJ', 'IMMO', '2965', 15425,
        'Provisions pour dépréciation des participations dans les organismes professionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15430, 'SYSCOHADA-BJ', 'IMMO', '2966', 15425,
        'Provisions pour dépréciation des parts dans des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15431, 'SYSCOHADA-BJ', 'IMMO', '2968', 15425,
        'Provisions pour dépréciation des autres titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15432, 'SYSCOHADA-BJ', 'IMMO', '297', 15383,
        'Provisions pour dépréciation des autres immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15433, 'SYSCOHADA-BJ', 'IMMO', '2971', 15432,
        'Provisions pour dépréciation des prêts et créances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15434, 'SYSCOHADA-BJ', 'IMMO', '2972', 15432, 'Provisions pour dépréciation des prêts du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15435, 'SYSCOHADA-BJ', 'IMMO', '2973', 15432,
        'Provisions pour dépréciation des créances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15436, 'SYSCOHADA-BJ', 'IMMO', '2974', 15432, 'Provisions pour dépréciation des titres immobilisés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15437, 'SYSCOHADA-BJ', 'IMMO', '2975', 15432,
        'Provisions pour dépréciation des dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15438, 'SYSCOHADA-BJ', 'IMMO', '2977', 15432,
        'Provisions pour dépréciation des créances rattachées à des participations et avances à des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15439, 'SYSCOHADA-BJ', 'IMMO', '2978', 15432,
        'Provisions pour dépréciation des créances financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15440, 'SYSCOHADA-BJ', 'STOCK', '31', 0, 'Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15441, 'SYSCOHADA-BJ', 'STOCK', '311', 15440, 'Marchandises a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15442, 'SYSCOHADA-BJ', 'STOCK', '3111', 15441, 'Marchandises a1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15443, 'SYSCOHADA-BJ', 'STOCK', '3112', 15441, 'Marchandises a2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15444, 'SYSCOHADA-BJ', 'STOCK', '312', 15440, 'Marchandises b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15445, 'SYSCOHADA-BJ', 'STOCK', '3121', 15444, 'Marchandises b1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15446, 'SYSCOHADA-BJ', 'STOCK', '3122', 15444, 'Marchandises b2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15447, 'SYSCOHADA-BJ', 'STOCK', '318', 15440, 'Marchandises hors activites ordinaires (h.a.o.)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15448, 'SYSCOHADA-BJ', 'STOCK', '32', 0, 'Matieres premieres et fournitures liees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15449, 'SYSCOHADA-BJ', 'STOCK', '321', 15448, 'Matieres a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15450, 'SYSCOHADA-BJ', 'STOCK', '322', 15448, 'Matieres b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15451, 'SYSCOHADA-BJ', 'STOCK', '323', 15448, 'Fournitures (a,b)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15452, 'SYSCOHADA-BJ', 'STOCK', '33', 0, 'Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15453, 'SYSCOHADA-BJ', 'STOCK', '331', 15452, 'Matieres consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15454, 'SYSCOHADA-BJ', 'STOCK', '332', 15452, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15455, 'SYSCOHADA-BJ', 'STOCK', '333', 15452, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15456, 'SYSCOHADA-BJ', 'STOCK', '334', 15452, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15457, 'SYSCOHADA-BJ', 'STOCK', '335', 15452, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15458, 'SYSCOHADA-BJ', 'STOCK', '3351', 15457, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15459, 'SYSCOHADA-BJ', 'STOCK', '3352', 15457, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15460, 'SYSCOHADA-BJ', 'STOCK', '3353', 15457, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15461, 'SYSCOHADA-BJ', 'STOCK', '3358', 15457, 'Autres emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15462, 'SYSCOHADA-BJ', 'STOCK', '338', 15452, 'Autres matieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15463, 'SYSCOHADA-BJ', 'STOCK', '34', 0, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15464, 'SYSCOHADA-BJ', 'STOCK', '341', 15463, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15465, 'SYSCOHADA-BJ', 'STOCK', '3411', 15464, 'Produits en cours p1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15466, 'SYSCOHADA-BJ', 'STOCK', '3412', 15464, 'Produits en cours p2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15467, 'SYSCOHADA-BJ', 'STOCK', '342', 15463, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15468, 'SYSCOHADA-BJ', 'STOCK', '3421', 15467, 'Travaux en cours t1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15469, 'SYSCOHADA-BJ', 'STOCK', '3422', 15467, 'Travaux en cours t2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15470, 'SYSCOHADA-BJ', 'STOCK', '343', 15463, 'Produits intermediaires en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15471, 'SYSCOHADA-BJ', 'STOCK', '3431', 15470, 'Produits intermédiaires a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15472, 'SYSCOHADA-BJ', 'STOCK', '3432', 15470, 'Produits intermédiaires b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15473, 'SYSCOHADA-BJ', 'STOCK', '344', 15463, 'Produits residuels en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15474, 'SYSCOHADA-BJ', 'STOCK', '3441', 15473, 'Produits résiduels a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15475, 'SYSCOHADA-BJ', 'STOCK', '3442', 15473, 'Produits résiduels b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15476, 'SYSCOHADA-BJ', 'STOCK', '35', 0, 'Services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15477, 'SYSCOHADA-BJ', 'STOCK', '351', 15476, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15478, 'SYSCOHADA-BJ', 'STOCK', '3511', 15477, 'Etudes en cours e1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15479, 'SYSCOHADA-BJ', 'STOCK', '3512', 15477, 'Etudes en cours e2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15480, 'SYSCOHADA-BJ', 'STOCK', '352', 15476, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15481, 'SYSCOHADA-BJ', 'STOCK', '3521', 15480, 'Prestations de services s1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15482, 'SYSCOHADA-BJ', 'STOCK', '3522', 15480, 'Prestations de services s2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15483, 'SYSCOHADA-BJ', 'STOCK', '36', 0, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15484, 'SYSCOHADA-BJ', 'STOCK', '361', 15483, 'Produits a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15485, 'SYSCOHADA-BJ', 'STOCK', '362', 15483, 'Produits b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15486, 'SYSCOHADA-BJ', 'STOCK', '37', 0, 'Produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15487, 'SYSCOHADA-BJ', 'STOCK', '371', 15486, 'Produits intermediaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15488, 'SYSCOHADA-BJ', 'STOCK', '3711', 15487, 'Produits intermédiaires a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15489, 'SYSCOHADA-BJ', 'STOCK', '3712', 15487, 'Produits intermédiaires b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15490, 'SYSCOHADA-BJ', 'STOCK', '372', 15486, 'Produits residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15491, 'SYSCOHADA-BJ', 'STOCK', '3721', 15490, 'Déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15492, 'SYSCOHADA-BJ', 'STOCK', '3722', 15490, 'Rebuts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15493, 'SYSCOHADA-BJ', 'STOCK', '3723', 15490, 'Matières de récupération', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15494, 'SYSCOHADA-BJ', 'STOCK', '38', 0, 'Stocks en cours de route, en consignation ou en depot',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15495, 'SYSCOHADA-BJ', 'STOCK', '381', 15494, 'Marchandises en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15496, 'SYSCOHADA-BJ', 'STOCK', '382', 15494,
        'Matieres premieres et fournitures liees en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15497, 'SYSCOHADA-BJ', 'STOCK', '383', 15494, 'Autres approvisionnements en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15498, 'SYSCOHADA-BJ', 'STOCK', '386', 15494, 'Produits finis en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15499, 'SYSCOHADA-BJ', 'STOCK', '387', 15494, 'Stocks en consignation ou en depot', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15500, 'SYSCOHADA-BJ', 'STOCK', '3871', 15499, 'Stock en consignation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15501, 'SYSCOHADA-BJ', 'STOCK', '3872', 15499, 'Stock en dépôt', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15502, 'SYSCOHADA-BJ', 'STOCK', '388', 15494,
        'Stock provenant d''immobilisations mises hors service ou au rebut', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15503, 'SYSCOHADA-BJ', 'STOCK', '39', 0, 'Depreciation des stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15504, 'SYSCOHADA-BJ', 'STOCK', '391', 15503, 'Depreciation des stoks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15505, 'SYSCOHADA-BJ', 'STOCK', '392', 15503,
        'Depreciation des stoks de matieres premieres et fournitures liees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15506, 'SYSCOHADA-BJ', 'STOCK', '393', 15503,
        'Depreciation des stocks d''autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15507, 'SYSCOHADA-BJ', 'STOCK', '394', 15503, 'Depreciations des productions en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15508, 'SYSCOHADA-BJ', 'STOCK', '395', 15503, 'Depreciations des services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15509, 'SYSCOHADA-BJ', 'STOCK', '396', 15503, 'Depreciation des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15510, 'SYSCOHADA-BJ', 'STOCK', '397', 15503,
        'Depreciation des stocks de produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15511, 'SYSCOHADA-BJ', 'STOCK', '398', 15503,
        'Depreciation des stocks en cours de route, en consignation ou en depot', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15512, 'SYSCOHADA-BJ', 'THIRDPARTY', '4', 0, 'Fournisseurs et comptes rattaches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15513, 'SYSCOHADA-BJ', 'THIRDPARTY', '401', 15512, 'Fournisseurs,  dettes en comptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15514, 'SYSCOHADA-BJ', 'THIRDPARTY', '4011', 15513, 'Fournisseurs  locaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15515, 'SYSCOHADA-BJ', 'THIRDPARTY', '4012', 15513, 'Fournisseurs groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15516, 'SYSCOHADA-BJ', 'THIRDPARTY', '4013', 15513, 'Fournisseurs sous-traitants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15517, 'SYSCOHADA-BJ', 'THIRDPARTY', '4017', 15513, 'Fournisseurs retenue  de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15518, 'SYSCOHADA-BJ', 'THIRDPARTY', '402', 15512, 'Fournisseurs, effets a payer (e.a.p)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15519, 'SYSCOHADA-BJ', 'THIRDPARTY', '4021', 15518, 'Fournisseurs, effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15520, 'SYSCOHADA-BJ', 'THIRDPARTY', '4022', 15518, 'Fournisseurs-groupe, effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15521, 'SYSCOHADA-BJ', 'THIRDPARTY', '4023', 15518, 'Fournisseurs sous-traitants effets à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15522, 'SYSCOHADA-BJ', 'THIRDPARTY', '408', 15512, 'Fournisseurs, factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15523, 'SYSCOHADA-BJ', 'THIRDPARTY', '4081', 15522, 'Fournisseurs factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15524, 'SYSCOHADA-BJ', 'THIRDPARTY', '4082', 15522, 'Fournisseurs - groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15525, 'SYSCOHADA-BJ', 'THIRDPARTY', '4083', 15522, 'Fournisseurs sous-traitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15526, 'SYSCOHADA-BJ', 'THIRDPARTY', '4086', 15522, 'Fournisseurs, intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15527, 'SYSCOHADA-BJ', 'THIRDPARTY', '409', 15512, 'Fournisseurs debiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15528, 'SYSCOHADA-BJ', 'THIRDPARTY', '4091', 15527, 'Fournisseurs avances et acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15529, 'SYSCOHADA-BJ', 'THIRDPARTY', '4092', 15527,
        'Fournisseurs - groupe avances et acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15530, 'SYSCOHADA-BJ', 'THIRDPARTY', '4093', 15527,
        'Fournisseurs sous-traitants avances et acompte versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15531, 'SYSCOHADA-BJ', 'THIRDPARTY', '4094', 15527,
        'Fournisseurs créances pour emballages et matériels à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15532, 'SYSCOHADA-BJ', 'THIRDPARTY', '4098', 15527,
        'Rabais, remises, ristournes et autres avoirs à obtenir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15533, 'SYSCOHADA-BJ', 'THIRDPARTY', '41', 15512, 'Clients et compte rattaches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15534, 'SYSCOHADA-BJ', 'THIRDPARTY', '411', 15533, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15535, 'SYSCOHADA-BJ', 'THIRDPARTY', '4111', 15534, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15536, 'SYSCOHADA-BJ', 'THIRDPARTY', '4112', 15534, 'Clients-groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15537, 'SYSCOHADA-BJ', 'THIRDPARTY', '4114', 15534, 'Clients, état et collectivités publiques',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15538, 'SYSCOHADA-BJ', 'THIRDPARTY', '4115', 15534, 'Clients, organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15539, 'SYSCOHADA-BJ', 'THIRDPARTY', '4117', 15534, 'Clients, retenues de garanti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15540, 'SYSCOHADA-BJ', 'THIRDPARTY', '4118', 15534,
        'Clients, dégrèvement de taxes sur la valeur ajoutée (t.v.a.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15541, 'SYSCOHADA-BJ', 'THIRDPARTY', '412', 15533, 'Clients, effets a recevoir en portefeuille',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15542, 'SYSCOHADA-BJ', 'THIRDPARTY', '4121', 15541, 'Clients, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15543, 'SYSCOHADA-BJ', 'THIRDPARTY', '4122', 15541, 'Clients-groupe, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15544, 'SYSCOHADA-BJ', 'THIRDPARTY', '4124', 15541,
        'Etat et collectivités publiques, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15545, 'SYSCOHADA-BJ', 'THIRDPARTY', '4125', 15541, 'Oganismes internationaux, effets à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15546, 'SYSCOHADA-BJ', 'THIRDPARTY', '414', 15533, 'Créances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15547, 'SYSCOHADA-BJ', 'THIRDPARTY', '4141', 15546, 'Créances en compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15548, 'SYSCOHADA-BJ', 'THIRDPARTY', '4142', 15546, 'Effet à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15549, 'SYSCOHADA-BJ', 'THIRDPARTY', '415', 15533, 'Clients, effets escomptes non echus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15550, 'SYSCOHADA-BJ', 'THIRDPARTY', '416', 15533, 'Creances clients litigieuses ou douteuses',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15551, 'SYSCOHADA-BJ', 'THIRDPARTY', '4161', 15550, 'Créances litigieuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15552, 'SYSCOHADA-BJ', 'THIRDPARTY', '4162', 15550, 'Créances douteuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15553, 'SYSCOHADA-BJ', 'THIRDPARTY', '418', 15533, 'Clients, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15554, 'SYSCOHADA-BJ', 'THIRDPARTY', '4181', 15553, 'Clients, factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15555, 'SYSCOHADA-BJ', 'THIRDPARTY', '4186', 15553, 'Clients, intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15556, 'SYSCOHADA-BJ', 'THIRDPARTY', '419', 15533, 'Clients crediteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15557, 'SYSCOHADA-BJ', 'THIRDPARTY', '4191', 15556, 'Clients, avances et acompte reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15558, 'SYSCOHADA-BJ', 'THIRDPARTY', '4192', 15556, 'Client - groupe, avances et acomptes reçus',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15559, 'SYSCOHADA-BJ', 'THIRDPARTY', '4194', 15556,
        'Clients, dettes pour emballages et matériels consignés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15560, 'SYSCOHADA-BJ', 'THIRDPARTY', '4198', 15556,
        'Rabais, remises, ristournes et autres avoirs à accorder', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15561, 'SYSCOHADA-BJ', 'THIRDPARTY', '42', 15512, 'Personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15562, 'SYSCOHADA-BJ', 'THIRDPARTY', '421', 15561, 'Personnel, avanceqs et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15563, 'SYSCOHADA-BJ', 'THIRDPARTY', '4211', 15562, 'Personnel, avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15564, 'SYSCOHADA-BJ', 'THIRDPARTY', '4212', 15562, 'Personnel, acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15565, 'SYSCOHADA-BJ', 'THIRDPARTY', '4213', 15562, 'Frais avancés et fournitures au personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15566, 'SYSCOHADA-BJ', 'THIRDPARTY', '422', 15561, 'Personnel, remunerations due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15567, 'SYSCOHADA-BJ', 'THIRDPARTY', '4221', 15566, 'Personnel rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15568, 'SYSCOHADA-BJ', 'THIRDPARTY', '4222', 15566, 'Personnel arrondis de paie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15569, 'SYSCOHADA-BJ', 'THIRDPARTY', '423', 15561, 'Personnel, oppositions, saisie-arrets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15570, 'SYSCOHADA-BJ', 'THIRDPARTY', '4231', 15569, 'Personnel, oppositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15571, 'SYSCOHADA-BJ', 'THIRDPARTY', '4232', 15569, 'Personnel, saisie arrêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15572, 'SYSCOHADA-BJ', 'THIRDPARTY', '4233', 15569, 'Personnel, avis à tiers détenteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15573, 'SYSCOHADA-BJ', 'THIRDPARTY', '424', 15561, 'Personnel, oeuvres sociales internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15574, 'SYSCOHADA-BJ', 'THIRDPARTY', '4241', 15573, 'Assistance médicale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15575, 'SYSCOHADA-BJ', 'THIRDPARTY', '4242', 15573, 'Allocations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15576, 'SYSCOHADA-BJ', 'THIRDPARTY', '4245', 15573, 'Organisme sociaux rattachés à l''entreprise',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15577, 'SYSCOHADA-BJ', 'THIRDPARTY', '4248', 15573, 'Autres oeuvres sociales internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15578, 'SYSCOHADA-BJ', 'THIRDPARTY', '425', 15561, 'Representants du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15579, 'SYSCOHADA-BJ', 'THIRDPARTY', '4251', 15578, 'Délégués du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15580, 'SYSCOHADA-BJ', 'THIRDPARTY', '4252', 15578,
        'Syndicats et comités d''entreprises, d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15581, 'SYSCOHADA-BJ', 'THIRDPARTY', '4258', 15578, 'Autres représentatants du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15582, 'SYSCOHADA-BJ', 'THIRDPARTY', '426', 15561, 'Personnel, participation aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15583, 'SYSCOHADA-BJ', 'THIRDPARTY', '427', 15561, 'Personnel-depots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15584, 'SYSCOHADA-BJ', 'THIRDPARTY', '428', 15561,
        'Personnel, charges a payer et produits a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15585, 'SYSCOHADA-BJ', 'THIRDPARTY', '4281', 15584, 'Dettes provisionnées pour congés à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15586, 'SYSCOHADA-BJ', 'THIRDPARTY', '4286', 15584, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15587, 'SYSCOHADA-BJ', 'THIRDPARTY', '4287', 15584, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15588, 'SYSCOHADA-BJ', 'THIRDPARTY', '43', 15512, 'Organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15589, 'SYSCOHADA-BJ', 'THIRDPARTY', '431', 15588, 'Securite sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15590, 'SYSCOHADA-BJ', 'THIRDPARTY', '4311', 15589, 'Prestations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15591, 'SYSCOHADA-BJ', 'THIRDPARTY', '4312', 15589, 'Accidents de travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15592, 'SYSCOHADA-BJ', 'THIRDPARTY', '4313', 15589, 'Caisse de retraite obligatoire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15593, 'SYSCOHADA-BJ', 'THIRDPARTY', '4314', 15589, 'Caisse de retraite facultative', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15594, 'SYSCOHADA-BJ', 'THIRDPARTY', '4318', 15589, 'Autres cotisations sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15595, 'SYSCOHADA-BJ', 'THIRDPARTY', '432', 15588, 'Caisse de retraite complementaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15596, 'SYSCOHADA-BJ', 'THIRDPARTY', '433', 15588, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15597, 'SYSCOHADA-BJ', 'THIRDPARTY', '4331', 15596, 'Mutuelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15598, 'SYSCOHADA-BJ', 'THIRDPARTY', '438', 15588,
        'Organismes sociaux, charges a payer et produits a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15599, 'SYSCOHADA-BJ', 'THIRDPARTY', '4381', 15598, 'Charges sociales sur gratifications à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15600, 'SYSCOHADA-BJ', 'THIRDPARTY', '4382', 15598, 'Charges sociales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15601, 'SYSCOHADA-BJ', 'THIRDPARTY', '4386', 15598, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15602, 'SYSCOHADA-BJ', 'THIRDPARTY', '4387', 15598, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15603, 'SYSCOHADA-BJ', 'THIRDPARTY', '44', 15512, 'Etat et collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15604, 'SYSCOHADA-BJ', 'THIRDPARTY', '441', 15603, 'Etat,impot sur les benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15605, 'SYSCOHADA-BJ', 'THIRDPARTY', '442', 15603, 'Etat, autres impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15606, 'SYSCOHADA-BJ', 'THIRDPARTY', '4421', 15606, 'Impôts et taxes d''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15607, 'SYSCOHADA-BJ', 'THIRDPARTY', '4422', 15606,
        'Impôts et taxes sur les collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15608, 'SYSCOHADA-BJ', 'THIRDPARTY', '4423', 15606,
        'Impôts et taxes recouvrables sur des obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15609, 'SYSCOHADA-BJ', 'THIRDPARTY', '4424', 15606, 'Impôts et taxes recouvrables sur des associés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15610, 'SYSCOHADA-BJ', 'THIRDPARTY', '4426', 15606, 'Droits de douane', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15611, 'SYSCOHADA-BJ', 'THIRDPARTY', '4428', 15606, 'Autres impôts et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15612, 'SYSCOHADA-BJ', 'THIRDPARTY', '443', 15603, 'Etat, t.v.a. facturee', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15613, 'SYSCOHADA-BJ', 'THIRDPARTY', '4431', 15612, 'T.v.a. facturée sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15614, 'SYSCOHADA-BJ', 'THIRDPARTY', '4432', 15612, 'T.v.a. facturée sur prestations de service',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15615, 'SYSCOHADA-BJ', 'THIRDPARTY', '4433', 15612, 'T.v.a. facturée sur travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15616, 'SYSCOHADA-BJ', 'THIRDPARTY', '4434', 15612,
        'T.v.a. facturée sur production livrée à soi-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15617, 'SYSCOHADA-BJ', 'THIRDPARTY', '4435', 15612, 'T.v.a. sur factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15618, 'SYSCOHADA-BJ', 'THIRDPARTY', '444', 15603, 'Etat, t.v.a. due ou credit de t.v.a.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15619, 'SYSCOHADA-BJ', 'THIRDPARTY', '4441', 15618, 'Etat, t.v.a. due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15620, 'SYSCOHADA-BJ', 'THIRDPARTY', '4449', 15618, 'Etat, crédit de t.v.a. à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15621, 'SYSCOHADA-BJ', 'THIRDPARTY', '445', 15603, 'Etat, t.v.a. recuperable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15622, 'SYSCOHADA-BJ', 'THIRDPARTY', '4451', 15621, 'T.v.a. récupérable sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15623, 'SYSCOHADA-BJ', 'THIRDPARTY', '4452', 15621, 'T.v.a. récupérable sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15624, 'SYSCOHADA-BJ', 'THIRDPARTY', '4453', 15621, 'T.v.a. récupérable sur transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15625, 'SYSCOHADA-BJ', 'THIRDPARTY', '4454', 15621,
        'T.v.a. récupérable sur services extérieurs et autres charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15626, 'SYSCOHADA-BJ', 'THIRDPARTY', '4455', 15621, 'T.v.a. récupérable sur factures non parvenues',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15627, 'SYSCOHADA-BJ', 'THIRDPARTY', '4456', 15621, 'T.v.a. transférée par d''autres entreprises',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15628, 'SYSCOHADA-BJ', 'THIRDPARTY', '446', 15603, 'Etat, autres taxes sur le chiffre d''affaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15629, 'SYSCOHADA-BJ', 'THIRDPARTY', '447', 15603, 'Etat, impots retenus a la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15630, 'SYSCOHADA-BJ', 'THIRDPARTY', '4471', 15629, 'Impôt général sur le revenu', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15631, 'SYSCOHADA-BJ', 'THIRDPARTY', '4472', 15629, 'Impôts sur salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15632, 'SYSCOHADA-BJ', 'THIRDPARTY', '4473', 15629, 'Contribution nationale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15633, 'SYSCOHADA-BJ', 'THIRDPARTY', '4474', 15629, 'Contribution nationale de solidarité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15634, 'SYSCOHADA-BJ', 'THIRDPARTY', '4478', 15629, 'Autres impôts et contributions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15635, 'SYSCOHADA-BJ', 'THIRDPARTY', '448', 15603, 'Etat, charges a payer et produits a recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15636, 'SYSCOHADA-BJ', 'THIRDPARTY', '4486', 15635, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15637, 'SYSCOHADA-BJ', 'THIRDPARTY', '4487', 15635, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15638, 'SYSCOHADA-BJ', 'THIRDPARTY', '449', 15603, 'Etats, creances et dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15639, 'SYSCOHADA-BJ', 'THIRDPARTY', '4491', 15638, 'Etat, obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15640, 'SYSCOHADA-BJ', 'THIRDPARTY', '4492', 15638, 'Etat, avances et acomptes versés sur impôts',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15641, 'SYSCOHADA-BJ', 'THIRDPARTY', '4493', 15638, 'Etat, fonds de dotation à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15642, 'SYSCOHADA-BJ', 'THIRDPARTY', '4494', 15638, 'Etat, subventions d''équipement à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15643, 'SYSCOHADA-BJ', 'THIRDPARTY', '4495', 15638, 'Etat, subventions d''exploitation à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15644, 'SYSCOHADA-BJ', 'THIRDPARTY', '4496', 15638, 'Etat, subventions d''équilibre à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15645, 'SYSCOHADA-BJ', 'THIRDPARTY', '4499', 15638, 'Etat, fond réglementé provisionné', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15646, 'SYSCOHADA-BJ', 'THIRDPARTY', '45', 15512, 'Organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15647, 'SYSCOHADA-BJ', 'THIRDPARTY', '451', 15646, 'Operations avec les organismes africains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15648, 'SYSCOHADA-BJ', 'THIRDPARTY', '452', 15646,
        'Operations avec les autres organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15649, 'SYSCOHADA-BJ', 'THIRDPARTY', '458', 15646,
        'Organismes internationaux, fonds de dotation et subventions a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15650, 'SYSCOHADA-BJ', 'THIRDPARTY', '4581', 15649,
        'Organismes internationaux, fonds de dotation à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15651, 'SYSCOHADA-BJ', 'THIRDPARTY', '4582', 15649,
        'Organismes internationaux, subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15652, 'SYSCOHADA-BJ', 'THIRDPARTY', '46', 15512, 'Associes-groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15653, 'SYSCOHADA-BJ', 'THIRDPARTY', '461', 15652, 'Associes, operations sur le capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15654, 'SYSCOHADA-BJ', 'THIRDPARTY', '4611', 15653, 'Associés apport en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15655, 'SYSCOHADA-BJ', 'THIRDPARTY', '4612', 15653, 'Associés apport en numéraire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15656, 'SYSCOHADA-BJ', 'THIRDPARTY', '4613', 15653,
        'Actionnaires, capital souscrit appelé non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15657, 'SYSCOHADA-BJ', 'THIRDPARTY', '4614', 15653, 'Associés, capital appelé non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15658, 'SYSCOHADA-BJ', 'THIRDPARTY', '4615', 15653,
        'Associés, versements reçus sur augmentation de capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15659, 'SYSCOHADA-BJ', 'THIRDPARTY', '4616', 15653, 'Associés, versements anticipés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15660, 'SYSCOHADA-BJ', 'THIRDPARTY', '4617', 15653, 'Actionnaires défaillants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15661, 'SYSCOHADA-BJ', 'THIRDPARTY', '4618', 15653, 'Associés, autres apports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15662, 'SYSCOHADA-BJ', 'THIRDPARTY', '4619', 15653, 'Associés, capital à rembourser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15663, 'SYSCOHADA-BJ', 'THIRDPARTY', '462', 15652, 'Associes, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15664, 'SYSCOHADA-BJ', 'THIRDPARTY', '4621', 15663, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15665, 'SYSCOHADA-BJ', 'THIRDPARTY', '4626', 15663, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15666, 'SYSCOHADA-BJ', 'THIRDPARTY', '463', 15652, 'Associes, operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15667, 'SYSCOHADA-BJ', 'THIRDPARTY', '465', 15652, 'Associes, dividendes a payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15668, 'SYSCOHADA-BJ', 'THIRDPARTY', '466', 15652, 'Groupe, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15669, 'SYSCOHADA-BJ', 'THIRDPARTY', '467', 15652, 'Actionnaires, restant dû sur capital appele',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15670, 'SYSCOHADA-BJ', 'THIRDPARTY', '47', 15512, 'Debiteurs et crediteur divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15671, 'SYSCOHADA-BJ', 'THIRDPARTY', '471', 15670, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15672, 'SYSCOHADA-BJ', 'THIRDPARTY', '4711', 15671, 'Débiteurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15673, 'SYSCOHADA-BJ', 'THIRDPARTY', '4712', 15671, 'Créditeurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15674, 'SYSCOHADA-BJ', 'THIRDPARTY', '4713', 15671, 'Obligataires, comptes de souscription', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15675, 'SYSCOHADA-BJ', 'THIRDPARTY', '472', 15670,
        'Versements restant a effectuer sur titres non liberes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15676, 'SYSCOHADA-BJ', 'THIRDPARTY', '4726', 15675, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15677, 'SYSCOHADA-BJ', 'THIRDPARTY', '4727', 15675, 'Titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15678, 'SYSCOHADA-BJ', 'THIRDPARTY', '4728', 15675, 'Titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15679, 'SYSCOHADA-BJ', 'THIRDPARTY', '474', 15670,
        'Repartition periodique des charges et des produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15680, 'SYSCOHADA-BJ', 'THIRDPARTY', '4746', 15679, 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15681, 'SYSCOHADA-BJ', 'THIRDPARTY', '4747', 15679, 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15682, 'SYSCOHADA-BJ', 'THIRDPARTY', '475', 15670, 'Creances sur travaux non encore facturables',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15683, 'SYSCOHADA-BJ', 'THIRDPARTY', '476', 15670, 'Charges constatees d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15684, 'SYSCOHADA-BJ', 'THIRDPARTY', '477', 15670, 'Produits constates d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15685, 'SYSCOHADA-BJ', 'THIRDPARTY', '478', 15670, 'Ecarts de conversion actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15686, 'SYSCOHADA-BJ', 'THIRDPARTY', '4781', 15685, 'Diminution des créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15687, 'SYSCOHADA-BJ', 'THIRDPARTY', '4782', 15685, 'Augmentation des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15688, 'SYSCOHADA-BJ', 'THIRDPARTY', '4788', 15685,
        'Différences compensées par couverture de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15689, 'SYSCOHADA-BJ', 'THIRDPARTY', '479', 15670, 'Ecarts de conversion passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15690, 'SYSCOHADA-BJ', 'THIRDPARTY', '4791', 15689, 'Augmentation de créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15691, 'SYSCOHADA-BJ', 'THIRDPARTY', '4792', 15689, 'Diminution des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15692, 'SYSCOHADA-BJ', 'THIRDPARTY', '4798', 15689,
        'Différences compensées par couverture de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15693, 'SYSCOHADA-BJ', 'THIRDPARTY', '48', 15512,
        'Creances et dettes hors activites ordinaires (hao)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15694, 'SYSCOHADA-BJ', 'THIRDPARTY', '481', 15693, 'Fournisseurs d''investissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15695, 'SYSCOHADA-BJ', 'THIRDPARTY', '4811', 15694, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15696, 'SYSCOHADA-BJ', 'THIRDPARTY', '4812', 15694, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15697, 'SYSCOHADA-BJ', 'THIRDPARTY', '4817', 15694, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15698, 'SYSCOHADA-BJ', 'THIRDPARTY', '4818', 15694, 'Factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15699, 'SYSCOHADA-BJ', 'THIRDPARTY', '482', 15693,
        'Fournisseurs d''investissements, effets a payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15700, 'SYSCOHADA-BJ', 'THIRDPARTY', '483', 15693, 'Dettes sur acquisition de titres de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15701, 'SYSCOHADA-BJ', 'THIRDPARTY', '484', 15693,
        'Autres dettes hors activites ordinaires (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15702, 'SYSCOHADA-BJ', 'THIRDPARTY', '485', 15693, 'Creances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15703, 'SYSCOHADA-BJ', 'THIRDPARTY', '4851', 15702, 'En compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15704, 'SYSCOHADA-BJ', 'THIRDPARTY', '4852', 15702, 'Effet à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15705, 'SYSCOHADA-BJ', 'THIRDPARTY', '4855', 15702,
        'Créances sur cessions immobilisations effets escomptés et non échus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15706, 'SYSCOHADA-BJ', 'THIRDPARTY', '4857', 15702, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15707, 'SYSCOHADA-BJ', 'THIRDPARTY', '4858', 15702, 'Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15708, 'SYSCOHADA-BJ', 'THIRDPARTY', '486', 15693, 'Creances sur cessions de titre de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15709, 'SYSCOHADA-BJ', 'THIRDPARTY', '488', 15693,
        'Autres creances hors activites ordinaires (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15710, 'SYSCOHADA-BJ', 'THIRDPARTY', '49', 15512, 'Depreciations des comptes fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15711, 'SYSCOHADA-BJ', 'THIRDPARTY', '491', 15710, 'Depreciations des comptes clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15712, 'SYSCOHADA-BJ', 'THIRDPARTY', '4911', 15711, 'Créances litigieuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15713, 'SYSCOHADA-BJ', 'THIRDPARTY', '4912', 15711, 'Créances douteuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15714, 'SYSCOHADA-BJ', 'THIRDPARTY', '492', 15710, 'Depreciations des comptes personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15715, 'SYSCOHADA-BJ', 'THIRDPARTY', '493', 15710, 'Depreciations des comptes organismes sociaux',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15716, 'SYSCOHADA-BJ', 'THIRDPARTY', '494', 15710,
        'Depreciations des comptes etats et collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15717, 'SYSCOHADA-BJ', 'THIRDPARTY', '495', 15710,
        'Depreciations des comptes organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15718, 'SYSCOHADA-BJ', 'THIRDPARTY', '496', 15710, 'Depreciations des comptes associes et groupe',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15719, 'SYSCOHADA-BJ', 'THIRDPARTY', '4962', 15718, 'Associés, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15720, 'SYSCOHADA-BJ', 'THIRDPARTY', '4963', 15718, 'Associés, opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15721, 'SYSCOHADA-BJ', 'THIRDPARTY', '4966', 15718, 'Groupe, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15722, 'SYSCOHADA-BJ', 'THIRDPARTY', '497', 15710, 'Depreciations des comptes debiteurs divers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15723, 'SYSCOHADA-BJ', 'THIRDPARTY', '498', 15710, 'Depreciations des comptes de creances h.a.o.',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15724, 'SYSCOHADA-BJ', 'THIRDPARTY', '4981', 15723, 'Créances sur cessions d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15725, 'SYSCOHADA-BJ', 'THIRDPARTY', '4982', 15723, 'Créances sur cessions de titres de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15726, 'SYSCOHADA-BJ', 'THIRDPARTY', '4983', 15723, 'Autres créances (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15727, 'SYSCOHADA-BJ', 'THIRDPARTY', '499', 15710, 'Risques provisionnes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15728, 'SYSCOHADA-BJ', 'THIRDPARTY', '4991', 15727, 'Sur opérations d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15729, 'SYSCOHADA-BJ', 'THIRDPARTY', '4998', 15727, 'Sur opérations (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15730, 'SYSCOHADA-BJ', 'FINAN', '5', 0, 'Titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15731, 'SYSCOHADA-BJ', 'FINAN', '501', 15730, 'Titres du tresor et bon de caisse a court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15732, 'SYSCOHADA-BJ', 'FINAN', '5011', 15731, 'Titres du trésor à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15733, 'SYSCOHADA-BJ', 'FINAN', '5012', 15731, 'Titres d''organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15734, 'SYSCOHADA-BJ', 'FINAN', '5013', 15731, 'Bons de caisse à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15735, 'SYSCOHADA-BJ', 'FINAN', '502', 15730, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15736, 'SYSCOHADA-BJ', 'FINAN', '5021', 15735, 'Actions propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15737, 'SYSCOHADA-BJ', 'FINAN', '5022', 15735, 'Actions cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15738, 'SYSCOHADA-BJ', 'FINAN', '5023', 15735, 'Actions non cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15739, 'SYSCOHADA-BJ', 'FINAN', '5024', 15735,
        'Actions démembrées (certificats d''investissement; droits de vote)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15740, 'SYSCOHADA-BJ', 'FINAN', '5025', 15735, 'Autres titres conférant un droit de propriété',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15741, 'SYSCOHADA-BJ', 'FINAN', '503', 15730, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15742, 'SYSCOHADA-BJ', 'FINAN', '5031', 15741,
        'Obligations émises par la société et rachetées par elle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15743, 'SYSCOHADA-BJ', 'FINAN', '5032', 15741, 'Obligations cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15744, 'SYSCOHADA-BJ', 'FINAN', '5033', 15741, 'Obligations non cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15745, 'SYSCOHADA-BJ', 'FINAN', '5035', 15741, 'Autres titres conférant un droit de créance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15746, 'SYSCOHADA-BJ', 'FINAN', '504', 15730, 'Bon de souscription', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15747, 'SYSCOHADA-BJ', 'FINAN', '5042', 15746, 'Bons de souscription d''actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15748, 'SYSCOHADA-BJ', 'FINAN', '5043', 15746, 'Bon de souscription d''obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15749, 'SYSCOHADA-BJ', 'FINAN', '505', 15730, 'Titres negociables hors region', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15750, 'SYSCOHADA-BJ', 'FINAN', '506', 15730, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15751, 'SYSCOHADA-BJ', 'FINAN', '5061', 15750, 'Titres du trésor et bons de caisse à court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15752, 'SYSCOHADA-BJ', 'FINAN', '5062', 15750, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15753, 'SYSCOHADA-BJ', 'FINAN', '5063', 15750, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15754, 'SYSCOHADA-BJ', 'FINAN', '508', 15730, 'Autres valeurs assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15755, 'SYSCOHADA-BJ', 'FINAN', '51', 15730, 'Valeurs a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15756, 'SYSCOHADA-BJ', 'FINAN', '511', 15755, 'Effets a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15757, 'SYSCOHADA-BJ', 'FINAN', '512', 15755, 'Effets a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15758, 'SYSCOHADA-BJ', 'FINAN', '513', 15755, 'Cheques a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15759, 'SYSCOHADA-BJ', 'FINAN', '514', 15755, 'Cheques a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15760, 'SYSCOHADA-BJ', 'FINAN', '515', 15755, 'Cartes de credit a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15761, 'SYSCOHADA-BJ', 'FINAN', '518', 15755, 'Autres valeurs a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15762, 'SYSCOHADA-BJ', 'FINAN', '5181', 15761, 'Warrants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15763, 'SYSCOHADA-BJ', 'FINAN', '5182', 15761, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15764, 'SYSCOHADA-BJ', 'FINAN', '5185', 15761, 'Chèque de voyage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15765, 'SYSCOHADA-BJ', 'FINAN', '5186', 15761, 'Coupons échus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15766, 'SYSCOHADA-BJ', 'FINAN', '5187', 15761, 'Intérêts échus des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15767, 'SYSCOHADA-BJ', 'FINAN', '52', 15730, 'Banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15768, 'SYSCOHADA-BJ', 'FINAN', '521', 15767, 'Banques locales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15769, 'SYSCOHADA-BJ', 'FINAN', '5211', 15768, 'Banque x', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15770, 'SYSCOHADA-BJ', 'FINAN', '5212', 15768, 'Banque y', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15771, 'SYSCOHADA-BJ', 'FINAN', '522', 15767, 'Banques autres etats region', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15772, 'SYSCOHADA-BJ', 'FINAN', '523', 15767, 'Banques autres etats zone monetaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15773, 'SYSCOHADA-BJ', 'FINAN', '524', 15767, 'Banques hors zone monetaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15774, 'SYSCOHADA-BJ', 'FINAN', '526', 15767, 'Banques, interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15775, 'SYSCOHADA-BJ', 'FINAN', '5261', 15768, 'Banques, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15776, 'SYSCOHADA-BJ', 'FINAN', '5267', 15768, 'Banques, intérêts courus, produits à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15777, 'SYSCOHADA-BJ', 'FINAN', '53', 15730, 'Etablissements financiers et assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15778, 'SYSCOHADA-BJ', 'FINAN', '531', 15777, 'Cheques postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15779, 'SYSCOHADA-BJ', 'FINAN', '532', 15777, 'Tresor', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15780, 'SYSCOHADA-BJ', 'FINAN', '533', 15777, 'Societe de gestion et d''intermediation (s.g.i.)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15781, 'SYSCOHADA-BJ', 'FINAN', '536', 15777, 'Etablissements financiers, interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15782, 'SYSCOHADA-BJ', 'FINAN', '5361', 15781,
        'Etablissements financiers, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15783, 'SYSCOHADA-BJ', 'FINAN', '5362', 15781,
        'Etablissements financiers, intérêts courus, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15784, 'SYSCOHADA-BJ', 'FINAN', '538', 15777, 'Autres organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15785, 'SYSCOHADA-BJ', 'FINAN', '54', 15730, 'Instruments de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15786, 'SYSCOHADA-BJ', 'FINAN', '541', 15785, 'Options de taux d''interets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15787, 'SYSCOHADA-BJ', 'FINAN', '542', 15785, 'Options de taux de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15788, 'SYSCOHADA-BJ', 'FINAN', '543', 15785, 'Options de taux boursiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15789, 'SYSCOHADA-BJ', 'FINAN', '544', 15785, 'Instruments de marches  a terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15790, 'SYSCOHADA-BJ', 'FINAN', '545', 15785, 'Avoirs d''or et autres metaux precieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15791, 'SYSCOHADA-BJ', 'FINAN', '56', 15730, 'Banques, credits de tresorerie et d''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15792, 'SYSCOHADA-BJ', 'FINAN', '561', 15791, 'Credits de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15793, 'SYSCOHADA-BJ', 'FINAN', '564', 15791, 'Escompte de credits de campagne', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15794, 'SYSCOHADA-BJ', 'FINAN', '565', 15791, 'Escompte de credits ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15795, 'SYSCOHADA-BJ', 'FINAN', '566', 15791, 'Banques, credits de tresorerie, interets courus',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15796, 'SYSCOHADA-BJ', 'FINAN', '5661', 15795,
        'Banques, crédits de trésorerie, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15797, 'SYSCOHADA-BJ', 'FINAN', '5667', 15795,
        'Banques, crédits de trésorerie, intérêts courus, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15798, 'SYSCOHADA-BJ', 'FINAN', '57', 15730, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15799, 'SYSCOHADA-BJ', 'FINAN', '571', 15798, 'Caisse siege social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15800, 'SYSCOHADA-BJ', 'FINAN', '5711', 15799, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15801, 'SYSCOHADA-BJ', 'FINAN', '5712', 15799, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15802, 'SYSCOHADA-BJ', 'FINAN', '572', 15798, 'Caisse succursale a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15803, 'SYSCOHADA-BJ', 'FINAN', '5721', 15802, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15804, 'SYSCOHADA-BJ', 'FINAN', '5722', 15802, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15805, 'SYSCOHADA-BJ', 'FINAN', '573', 15798, 'Caisse succursale b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15806, 'SYSCOHADA-BJ', 'FINAN', '5731', 15805, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15807, 'SYSCOHADA-BJ', 'FINAN', '5732', 15805, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15808, 'SYSCOHADA-BJ', 'FINAN', '58', 15730, 'Regies d''avances, accreditifs et virements internes',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15809, 'SYSCOHADA-BJ', 'FINAN', '581', 15808, 'Regies d''avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15810, 'SYSCOHADA-BJ', 'FINAN', '582', 15808, 'Accreditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15811, 'SYSCOHADA-BJ', 'FINAN', '585', 15808, 'Virements de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15812, 'SYSCOHADA-BJ', 'FINAN', '588', 15808, 'Autres virements internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15813, 'SYSCOHADA-BJ', 'FINAN', '59', 15730, 'Depreciations des titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15814, 'SYSCOHADA-BJ', 'FINAN', '591', 15813, 'Depreciations des titres et valeurs a encaisser',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15815, 'SYSCOHADA-BJ', 'FINAN', '592', 15813, 'Depreciations des comptes banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15816, 'SYSCOHADA-BJ', 'FINAN', '593', 15813,
        'Depreciations des comptes etablissements financiers et assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15817, 'SYSCOHADA-BJ', 'FINAN', '594', 15813,
        'Depreciations des comptes d''instruments de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15818, 'SYSCOHADA-BJ', 'FINAN', '599', 15813, 'Risques provisionnes a caractere financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15819, 'SYSCOHADA-BJ', 'EXPENSE', '6', 0, 'Achats et variations de stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15820, 'SYSCOHADA-BJ', 'EXPENSE', '601', 15819, 'Achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15821, 'SYSCOHADA-BJ', 'EXPENSE', '6011', 16820, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15822, 'SYSCOHADA-BJ', 'EXPENSE', '6012', 16820, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15823, 'SYSCOHADA-BJ', 'EXPENSE', '6013', 16820, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15824, 'SYSCOHADA-BJ', 'EXPENSE', '6014', 16820, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15825, 'SYSCOHADA-BJ', 'EXPENSE', '6019', 16820,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15826, 'SYSCOHADA-BJ', 'EXPENSE', '602', 15819, 'Achats de matieres premieres et fournitures liees',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15827, 'SYSCOHADA-BJ', 'EXPENSE', '6021', 15826, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15828, 'SYSCOHADA-BJ', 'EXPENSE', '6022', 15826, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15829, 'SYSCOHADA-BJ', 'EXPENSE', '6023', 15826, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15830, 'SYSCOHADA-BJ', 'EXPENSE', '6024', 15826, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15831, 'SYSCOHADA-BJ', 'EXPENSE', '6029', 15826,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15832, 'SYSCOHADA-BJ', 'EXPENSE', '603', 15819, 'Variations des stocks et biens achetes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15833, 'SYSCOHADA-BJ', 'EXPENSE', '6031', 15832, 'Variations des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15834, 'SYSCOHADA-BJ', 'EXPENSE', '6032', 15832,
        'Variations des stocks de matiéres premiéres et fournitures liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15835, 'SYSCOHADA-BJ', 'EXPENSE', '6033', 15832,
        'Variations des stocks d''autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15836, 'SYSCOHADA-BJ', 'EXPENSE', '604', 15819,
        'Achats stockes de matieres et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15837, 'SYSCOHADA-BJ', 'EXPENSE', '6041', 15836, 'Matiéres consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15838, 'SYSCOHADA-BJ', 'EXPENSE', '6042', 15836, 'Matiéres combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15839, 'SYSCOHADA-BJ', 'EXPENSE', '6043', 15836, 'Produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15840, 'SYSCOHADA-BJ', 'EXPENSE', '6044', 15836, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15841, 'SYSCOHADA-BJ', 'EXPENSE', '6046', 15836, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15842, 'SYSCOHADA-BJ', 'EXPENSE', '6047', 15836, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15843, 'SYSCOHADA-BJ', 'EXPENSE', '6049', 15836,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15844, 'SYSCOHADA-BJ', 'EXPENSE', '605', 15819, 'Autres achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15845, 'SYSCOHADA-BJ', 'EXPENSE', '6051', 15844, 'Fournitures non stockables - eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15846, 'SYSCOHADA-BJ', 'EXPENSE', '6052', 15844, 'Fournitures non stockables - electricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15847, 'SYSCOHADA-BJ', 'EXPENSE', '6053', 15844, 'Fournitures non stockables - autres énergies',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15848, 'SYSCOHADA-BJ', 'EXPENSE', '6054', 15844, 'Fournitures d''entretien non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15849, 'SYSCOHADA-BJ', 'EXPENSE', '6055', 15844, 'Fournitures de bureau non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15850, 'SYSCOHADA-BJ', 'EXPENSE', '6056', 15844, 'Achats de petits matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15851, 'SYSCOHADA-BJ', 'EXPENSE', '6057', 15844, 'Achats d''études et de prestations de services',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15852, 'SYSCOHADA-BJ', 'EXPENSE', '6058', 15844, 'Achats de travaux, matériels et équipements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15853, 'SYSCOHADA-BJ', 'EXPENSE', '6059', 15844,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15854, 'SYSCOHADA-BJ', 'EXPENSE', '608', 15819, 'Achats d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15855, 'SYSCOHADA-BJ', 'EXPENSE', '6081', 15854, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15856, 'SYSCOHADA-BJ', 'EXPENSE', '6082', 15854, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15857, 'SYSCOHADA-BJ', 'EXPENSE', '6083', 15854, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15858, 'SYSCOHADA-BJ', 'EXPENSE', '6089', 15854,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15859, 'SYSCOHADA-BJ', 'EXPENSE', '61', 15819, 'Transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15860, 'SYSCOHADA-BJ', 'EXPENSE', '611', 15859, 'Transports sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15861, 'SYSCOHADA-BJ', 'EXPENSE', '612', 15859, 'Transport sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15862, 'SYSCOHADA-BJ', 'EXPENSE', '613', 15859, 'Transports pour le compte de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15863, 'SYSCOHADA-BJ', 'EXPENSE', '614', 15859, 'Transports du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15864, 'SYSCOHADA-BJ', 'EXPENSE', '616', 15859, 'Transports de plis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15865, 'SYSCOHADA-BJ', 'EXPENSE', '618', 15859, 'Autres frais de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15866, 'SYSCOHADA-BJ', 'EXPENSE', '6181', 15865, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15867, 'SYSCOHADA-BJ', 'EXPENSE', '6182', 15865, 'Transports entre établissements ou chantiers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15868, 'SYSCOHADA-BJ', 'EXPENSE', '6183', 15865, 'Transports administratifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15869, 'SYSCOHADA-BJ', 'EXPENSE', '62', 15819, 'Services exterieurs a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15870, 'SYSCOHADA-BJ', 'EXPENSE', '621', 15869, 'Sous traitance generale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15871, 'SYSCOHADA-BJ', 'EXPENSE', '622', 15869, 'Locations et charges locatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15872, 'SYSCOHADA-BJ', 'EXPENSE', '6221', 15871, 'Locations de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15873, 'SYSCOHADA-BJ', 'EXPENSE', '6222', 15871, 'Locations de bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15874, 'SYSCOHADA-BJ', 'EXPENSE', '6223', 15871, 'Location de matériels et outillages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15875, 'SYSCOHADA-BJ', 'EXPENSE', '6224', 15871, 'Malis sur emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15876, 'SYSCOHADA-BJ', 'EXPENSE', '6225', 15871, 'Locations d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15877, 'SYSCOHADA-BJ', 'EXPENSE', '6228', 15871, 'Locations et charges locatives diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15878, 'SYSCOHADA-BJ', 'EXPENSE', '623', 15869, 'Redevances de credit bail et contrats assimiles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15879, 'SYSCOHADA-BJ', 'EXPENSE', '6232', 15878, 'Crédits-bail immobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15880, 'SYSCOHADA-BJ', 'EXPENSE', '6233', 15878, 'Crédits-bail mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15881, 'SYSCOHADA-BJ', 'EXPENSE', '6235', 15878, 'Contrats assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15882, 'SYSCOHADA-BJ', 'EXPENSE', '624', 15869, 'Entretiens, reparations et maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15883, 'SYSCOHADA-BJ', 'EXPENSE', '6241', 15882, 'Entretien et réparation des biens immobiliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15884, 'SYSCOHADA-BJ', 'EXPENSE', '6242', 15882, 'Entretien et réparation des biens mobiliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15885, 'SYSCOHADA-BJ', 'EXPENSE', '6243', 15882, 'Maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15886, 'SYSCOHADA-BJ', 'EXPENSE', '6248', 15882, 'Autres entretiens et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15887, 'SYSCOHADA-BJ', 'EXPENSE', '625', 15869, 'Primes d''assurance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15888, 'SYSCOHADA-BJ', 'EXPENSE', '6251', 15887, 'Assurances multirisques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15889, 'SYSCOHADA-BJ', 'EXPENSE', '6252', 15887, 'Assurances matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15890, 'SYSCOHADA-BJ', 'EXPENSE', '6253', 15887, 'Assurances risques d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15891, 'SYSCOHADA-BJ', 'EXPENSE', '6254', 15887, 'Assurances responsabilité du producteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15892, 'SYSCOHADA-BJ', 'EXPENSE', '6255', 15887, 'Assurances insolvabilité clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15893, 'SYSCOHADA-BJ', 'EXPENSE', '6256', 15887, 'Assurances transport sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15894, 'SYSCOHADA-BJ', 'EXPENSE', '6257', 15887, 'Assurances transport sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15895, 'SYSCOHADA-BJ', 'EXPENSE', '6258', 15887, 'Autres primes d''assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15896, 'SYSCOHADA-BJ', 'EXPENSE', '626', 15869, 'Etudes, recherches et documentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15897, 'SYSCOHADA-BJ', 'EXPENSE', '6261', 15896, 'Etudes et recherches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15898, 'SYSCOHADA-BJ', 'EXPENSE', '6265', 15896, 'Documentation générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15899, 'SYSCOHADA-BJ', 'EXPENSE', '6266', 15896, 'Documentation technique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15900, 'SYSCOHADA-BJ', 'EXPENSE', '627', 15869, 'Publicite, publications, relations publiques',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15901, 'SYSCOHADA-BJ', 'EXPENSE', '6271', 15900, 'Annonces, insertions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15902, 'SYSCOHADA-BJ', 'EXPENSE', '6272', 15900, 'Catalogues, imprimés publicitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15903, 'SYSCOHADA-BJ', 'EXPENSE', '6273', 15900, 'Echantillons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15904, 'SYSCOHADA-BJ', 'EXPENSE', '6274', 15900, 'Foires et expositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15905, 'SYSCOHADA-BJ', 'EXPENSE', '6275', 15900, 'Publications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15906, 'SYSCOHADA-BJ', 'EXPENSE', '6276', 15900, 'Cadeaux à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15907, 'SYSCOHADA-BJ', 'EXPENSE', '6277', 15900, 'Frais de colloques, séminaires, conférences',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15908, 'SYSCOHADA-BJ', 'EXPENSE', '6278', 15900,
        'Autres charges de publicités et relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15909, 'SYSCOHADA-BJ', 'EXPENSE', '628', 15869, 'Frais de telecommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15910, 'SYSCOHADA-BJ', 'EXPENSE', '6281', 15909, 'Frais de téléphone', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15911, 'SYSCOHADA-BJ', 'EXPENSE', '6282', 15909, 'Frais de télex', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15912, 'SYSCOHADA-BJ', 'EXPENSE', '6283', 15909, 'Frais de télécopie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15913, 'SYSCOHADA-BJ', 'EXPENSE', '6288', 15909, 'Autres frais de télécommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15914, 'SYSCOHADA-BJ', 'EXPENSE', '63', 15819, 'Services exterieurs b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15915, 'SYSCOHADA-BJ', 'EXPENSE', '631', 15914, 'Frais bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15916, 'SYSCOHADA-BJ', 'EXPENSE', '6311', 15915, 'Frais sur titre (achats, vente, garde)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15917, 'SYSCOHADA-BJ', 'EXPENSE', '6312', 15915, 'Frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15918, 'SYSCOHADA-BJ', 'EXPENSE', '6313', 15915, 'Locations de coffres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15919, 'SYSCOHADA-BJ', 'EXPENSE', '6315', 15915, 'Commissions sur cartes de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15920, 'SYSCOHADA-BJ', 'EXPENSE', '6316', 15915, 'Frais d''émission d''emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15921, 'SYSCOHADA-BJ', 'EXPENSE', '6318', 15915, 'Autres frais bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15922, 'SYSCOHADA-BJ', 'EXPENSE', '632', 15914, 'Remunerations d''intermediaires et de conseils',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15923, 'SYSCOHADA-BJ', 'EXPENSE', '6321', 15922, 'Commissions et courtages sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15924, 'SYSCOHADA-BJ', 'EXPENSE', '6322', 15922, 'Commissions et courtages sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15925, 'SYSCOHADA-BJ', 'EXPENSE', '6323', 15922, 'Rémunérations des transitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15926, 'SYSCOHADA-BJ', 'EXPENSE', '6324', 15922, 'Honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15927, 'SYSCOHADA-BJ', 'EXPENSE', '6325', 15922, 'Frais d''actes et de contentieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15928, 'SYSCOHADA-BJ', 'EXPENSE', '6328', 15922, 'Divers frais', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15929, 'SYSCOHADA-BJ', 'EXPENSE', '633', 15914, 'Frais de formation du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15930, 'SYSCOHADA-BJ', 'EXPENSE', '634', 15914,
        'Redevances pour brevets, licences, logiciels et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15931, 'SYSCOHADA-BJ', 'EXPENSE', '6342', 15930,
        'Redevances pour brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15932, 'SYSCOHADA-BJ', 'EXPENSE', '6343', 15930, 'Redevances pour logiciel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15933, 'SYSCOHADA-BJ', 'EXPENSE', '6344', 15930, 'Redevances pour marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15934, 'SYSCOHADA-BJ', 'EXPENSE', '635', 15914, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15935, 'SYSCOHADA-BJ', 'EXPENSE', '6351', 15934, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15936, 'SYSCOHADA-BJ', 'EXPENSE', '6358', 15934, 'Concours divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15937, 'SYSCOHADA-BJ', 'EXPENSE', '636', 15914,
        'Redevances verses au concedant (concessions service public)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15938, 'SYSCOHADA-BJ', 'EXPENSE', '637', 15914,
        'Remunerations du personnel exterieur a l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15939, 'SYSCOHADA-BJ', 'EXPENSE', '6371', 15938, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15940, 'SYSCOHADA-BJ', 'EXPENSE', '6372', 15938, 'Personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15941, 'SYSCOHADA-BJ', 'EXPENSE', '638', 15914, 'Autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15942, 'SYSCOHADA-BJ', 'EXPENSE', '6381', 15941, 'Frais de recrutement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15943, 'SYSCOHADA-BJ', 'EXPENSE', '6382', 15941, 'Frais de déménagement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15944, 'SYSCOHADA-BJ', 'EXPENSE', '6383', 15941, 'Réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15945, 'SYSCOHADA-BJ', 'EXPENSE', '6384', 15941, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15946, 'SYSCOHADA-BJ', 'EXPENSE', '64', 15819, 'Impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15947, 'SYSCOHADA-BJ', 'EXPENSE', '641', 15946, 'Impots et taxes directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15948, 'SYSCOHADA-BJ', 'EXPENSE', '6411', 15947, 'Impots fonciers et taxes annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15949, 'SYSCOHADA-BJ', 'EXPENSE', '6412', 15947, 'Patentes, licences et taxes annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15950, 'SYSCOHADA-BJ', 'EXPENSE', '6413', 15947, 'Taxes sur appointements et salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15951, 'SYSCOHADA-BJ', 'EXPENSE', '6414', 15947, 'Taxes d''apprentissage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15952, 'SYSCOHADA-BJ', 'EXPENSE', '6415', 15947, 'Formation professionnelle continue', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15953, 'SYSCOHADA-BJ', 'EXPENSE', '6418', 15947, 'Autres impôts et taxes directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15954, 'SYSCOHADA-BJ', 'EXPENSE', '645', 15946, 'Impots et taxes indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15955, 'SYSCOHADA-BJ', 'EXPENSE', '646', 15946, 'Droits d''enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15956, 'SYSCOHADA-BJ', 'EXPENSE', '6461', 15955, 'Droits de mutation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15957, 'SYSCOHADA-BJ', 'EXPENSE', '6462', 15955, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15958, 'SYSCOHADA-BJ', 'EXPENSE', '6463', 15955, 'Taxes sur les véhicules de société', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15959, 'SYSCOHADA-BJ', 'EXPENSE', '6464', 15955, 'Vignettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15960, 'SYSCOHADA-BJ', 'EXPENSE', '6468', 15955, 'Autres droits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15961, 'SYSCOHADA-BJ', 'EXPENSE', '647', 15946, 'Penalites et amendes fiscales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15962, 'SYSCOHADA-BJ', 'EXPENSE', '6471', 15961, 'Pénalités d''assiette, impots directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15963, 'SYSCOHADA-BJ', 'EXPENSE', '6472', 15961, 'Pénalités d''assiette, impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15964, 'SYSCOHADA-BJ', 'EXPENSE', '6473', 15961, 'Pénalités de recouvrement, impôts directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15965, 'SYSCOHADA-BJ', 'EXPENSE', '6474', 15961, 'Pénalités de recouvrement, impôts indirects',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15966, 'SYSCOHADA-BJ', 'EXPENSE', '6478', 15961, 'Autres amendes pénales et fiscales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15967, 'SYSCOHADA-BJ', 'EXPENSE', '648', 15946, 'Autres impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15968, 'SYSCOHADA-BJ', 'EXPENSE', '65', 15819, 'Autres charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15969, 'SYSCOHADA-BJ', 'EXPENSE', '651', 15968, 'Pertes sur creances clients et autres debiteurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15970, 'SYSCOHADA-BJ', 'EXPENSE', '6511', 15969, 'Pertes sur clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15971, 'SYSCOHADA-BJ', 'EXPENSE', '6515', 15969, 'Autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15972, 'SYSCOHADA-BJ', 'EXPENSE', '652', 15968,
        'Quote-part de resultat sur operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15973, 'SYSCOHADA-BJ', 'EXPENSE', '6521', 15972,
        'Quote-part transféré de bénéfices (comptabilté du gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15974, 'SYSCOHADA-BJ', 'EXPENSE', '6525', 15972,
        'Pertes imputées par transfert (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15975, 'SYSCOHADA-BJ', 'EXPENSE', '653', 15968,
        'Quote-part de resultat annulee sur execution partielle de contrats pluri-exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15976, 'SYSCOHADA-BJ', 'EXPENSE', '654', 15968,
        'Valeur comptable des cessions courantes d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15977, 'SYSCOHADA-BJ', 'EXPENSE', '658', 15968, 'Charges diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15978, 'SYSCOHADA-BJ', 'EXPENSE', '6581', 15977,
        'Jetons de présence et autres rémunérations d''administrateurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15979, 'SYSCOHADA-BJ', 'EXPENSE', '6582', 15977, 'Dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15980, 'SYSCOHADA-BJ', 'EXPENSE', '6583', 15977, 'Mécénat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15981, 'SYSCOHADA-BJ', 'EXPENSE', '659', 15968, 'Charges provisionnees d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15982, 'SYSCOHADA-BJ', 'EXPENSE', '6591', 15981, 'Sur risque à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15983, 'SYSCOHADA-BJ', 'EXPENSE', '6593', 15981, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15984, 'SYSCOHADA-BJ', 'EXPENSE', '6594', 15981, 'Sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15985, 'SYSCOHADA-BJ', 'EXPENSE', '6598', 15981, 'Autres charges provisionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15986, 'SYSCOHADA-BJ', 'EXPENSE', '66', 15819, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15987, 'SYSCOHADA-BJ', 'EXPENSE', '661', 15986,
        'Remunerations directes versees au personnel national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15988, 'SYSCOHADA-BJ', 'EXPENSE', '6611', 15987, 'Appointements salaires et commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15989, 'SYSCOHADA-BJ', 'EXPENSE', '6612', 15987, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15990, 'SYSCOHADA-BJ', 'EXPENSE', '6613', 15987, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15991, 'SYSCOHADA-BJ', 'EXPENSE', '6614', 15987,
        'Indemnités de préavis, de licencement et de recherche d''embauche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15992, 'SYSCOHADA-BJ', 'EXPENSE', '6615', 15987, 'Indemnités de maladie versées aux travailleurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15993, 'SYSCOHADA-BJ', 'EXPENSE', '6616', 15987, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15994, 'SYSCOHADA-BJ', 'EXPENSE', '6617', 15987, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15995, 'SYSCOHADA-BJ', 'EXPENSE', '6618', 15987, 'Autres rémunérations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15996, 'SYSCOHADA-BJ', 'EXPENSE', '662', 15986,
        'Remunerations directes versees au personnel non national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15997, 'SYSCOHADA-BJ', 'EXPENSE', '6621', 15996, 'Appointements salaires et commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15998, 'SYSCOHADA-BJ', 'EXPENSE', '6622', 15996, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15999, 'SYSCOHADA-BJ', 'EXPENSE', '6623', 15996, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16000, 'SYSCOHADA-BJ', 'EXPENSE', '6624', 15996,
        'Indemnités de préavis, de licencement et de recherche d''embauche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16001, 'SYSCOHADA-BJ', 'EXPENSE', '6625', 15996, 'Indemnités de maladie versées aux travailleurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16002, 'SYSCOHADA-BJ', 'EXPENSE', '6626', 15996, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16003, 'SYSCOHADA-BJ', 'EXPENSE', '6627', 15996, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16004, 'SYSCOHADA-BJ', 'EXPENSE', '6628', 15996, 'Autres rémunérations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16005, 'SYSCOHADA-BJ', 'EXPENSE', '663', 15986, 'Indemnites forfaitaires versees au personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16006, 'SYSCOHADA-BJ', 'EXPENSE', '6631', 16005, 'Indemnités de logement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16007, 'SYSCOHADA-BJ', 'EXPENSE', '6632', 16005, 'Indemnités de représentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16008, 'SYSCOHADA-BJ', 'EXPENSE', '6633', 16005, 'Indemnités d''expatriation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16009, 'SYSCOHADA-BJ', 'EXPENSE', '6638', 16005, 'Autres indemnités et avantages divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16010, 'SYSCOHADA-BJ', 'EXPENSE', '664', 15986, 'Charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16011, 'SYSCOHADA-BJ', 'EXPENSE', '6641', 16010,
        'Charges sociales sur rémunération du personnel national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16012, 'SYSCOHADA-BJ', 'EXPENSE', '6642', 16010,
        'Charges sociales sur rémunération du personnel non national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16013, 'SYSCOHADA-BJ', 'EXPENSE', '666', 15986,
        'Remunerations et charges sociales de l''exploitant individuel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16014, 'SYSCOHADA-BJ', 'EXPENSE', '6661', 16013, 'Rémunérations du travail de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16015, 'SYSCOHADA-BJ', 'EXPENSE', '6662', 16013, 'Charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16016, 'SYSCOHADA-BJ', 'EXPENSE', '667', 15986, 'Remunerations transferee de personnel exterieur',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16017, 'SYSCOHADA-BJ', 'EXPENSE', '6671', 16016, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16018, 'SYSCOHADA-BJ', 'EXPENSE', '6672', 16016, 'Personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16019, 'SYSCOHADA-BJ', 'EXPENSE', '668', 15986, 'Autres charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16020, 'SYSCOHADA-BJ', 'EXPENSE', '6681', 16019,
        'Versements aux syndicats et comités d''entreprise, d''établisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16021, 'SYSCOHADA-BJ', 'EXPENSE', '6682', 16019, 'Versements aux comité d''hygiéne et de sécurité',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16022, 'SYSCOHADA-BJ', 'EXPENSE', '6683', 16019, 'Versements aux autres oeuvres sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16023, 'SYSCOHADA-BJ', 'EXPENSE', '6684', 16019, 'Médecine du travail et pharmacie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16024, 'SYSCOHADA-BJ', 'EXPENSE', '67', 15819, 'Frais financiers et charges assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16025, 'SYSCOHADA-BJ', 'EXPENSE', '671', 16024, 'Interets des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16026, 'SYSCOHADA-BJ', 'EXPENSE', '6711', 16025, 'Emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16027, 'SYSCOHADA-BJ', 'EXPENSE', '6712', 16025, 'Emprunts auprès des établissements de crédit',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16028, 'SYSCOHADA-BJ', 'EXPENSE', '6713', 16025, 'Dettes liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16029, 'SYSCOHADA-BJ', 'EXPENSE', '672', 16024,
        'Interets dans loyers de credit bail et contrats assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16030, 'SYSCOHADA-BJ', 'EXPENSE', '6721', 16029, 'Intérêts dans loyers de crédit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16031, 'SYSCOHADA-BJ', 'EXPENSE', '6722', 16029, 'Intérêts dans loyers de crédit-bail mobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16032, 'SYSCOHADA-BJ', 'EXPENSE', '6723', 16029, 'Intérêts dans loyers des autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16033, 'SYSCOHADA-BJ', 'EXPENSE', '673', 16024, 'Escomptes accordes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16034, 'SYSCOHADA-BJ', 'EXPENSE', '674', 16024, 'Autres interets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16035, 'SYSCOHADA-BJ', 'EXPENSE', '6741', 16034, 'Avances reçues et dépôts créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16036, 'SYSCOHADA-BJ', 'EXPENSE', '6742', 16034, 'Comptes courants bloqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16037, 'SYSCOHADA-BJ', 'EXPENSE', '6743', 16034, 'Intérêts sur obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16038, 'SYSCOHADA-BJ', 'EXPENSE', '6744', 16034, 'Intérêts sur dettes commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16039, 'SYSCOHADA-BJ', 'EXPENSE', '6745', 16034,
        'Intérêts bancaires et sur opérations de trésorerie et d''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16040, 'SYSCOHADA-BJ', 'EXPENSE', '6748', 16034, 'Intérêts sur dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16041, 'SYSCOHADA-BJ', 'EXPENSE', '675', 16024, 'Escomptes des effets de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16042, 'SYSCOHADA-BJ', 'EXPENSE', '676', 16024, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16043, 'SYSCOHADA-BJ', 'EXPENSE', '677', 16024, 'Pertes sur cessions de titres  de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16044, 'SYSCOHADA-BJ', 'EXPENSE', '678', 16024, 'Pertes sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16045, 'SYSCOHADA-BJ', 'EXPENSE', '6781', 16044, 'Sur rentes viagères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16046, 'SYSCOHADA-BJ', 'EXPENSE', '6782', 16044, 'Sur opérations fiancières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16047, 'SYSCOHADA-BJ', 'EXPENSE', '6783', 16044, 'Sur instruments de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16048, 'SYSCOHADA-BJ', 'EXPENSE', '679', 16024, 'Charges provisionnees financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16049, 'SYSCOHADA-BJ', 'EXPENSE', '6791', 16048, 'Sur risque financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16050, 'SYSCOHADA-BJ', 'EXPENSE', '6795', 16048, 'Sur titres de placements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16051, 'SYSCOHADA-BJ', 'EXPENSE', '6798', 16048, 'Autres charges provisionnées financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16052, 'SYSCOHADA-BJ', 'EXPENSE', '68', 15819, 'Dotations aus amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16053, 'SYSCOHADA-BJ', 'EXPENSE', '681', 16052, 'Dotations aux amortissements d''exploitation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16054, 'SYSCOHADA-BJ', 'EXPENSE', '6811', 16052,
        'Dotations aux amortissements des charges immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16055, 'SYSCOHADA-BJ', 'EXPENSE', '6812', 16052,
        'Dotations aux amortissements des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16056, 'SYSCOHADA-BJ', 'EXPENSE', '6813', 16052,
        'Dotations aux amortissements des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16057, 'SYSCOHADA-BJ', 'EXPENSE', '687', 16052,
        'Dotations aux amortissements a caractere financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16058, 'SYSCOHADA-BJ', 'EXPENSE', '6872', 16057,
        'Dotations aux amortissements des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16059, 'SYSCOHADA-BJ', 'EXPENSE', '6878', 16057,
        'Autres dotations aux amortissements à caractère financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16060, 'SYSCOHADA-BJ', 'EXPENSE', '69', 15819, 'Dotattions aux provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16061, 'SYSCOHADA-BJ', 'EXPENSE', '691', 16060, 'Dotation aux provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16062, 'SYSCOHADA-BJ', 'EXPENSE', '6911', 16061, 'Pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16063, 'SYSCOHADA-BJ', 'EXPENSE', '6912', 16061, 'Pour grosses réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16064, 'SYSCOHADA-BJ', 'EXPENSE', '6913', 16061,
        'Pour dépréciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16065, 'SYSCOHADA-BJ', 'EXPENSE', '6914', 16061,
        'Pour dépréciation des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16066, 'SYSCOHADA-BJ', 'EXPENSE', '697', 16060, 'Dotations aux provisions financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16067, 'SYSCOHADA-BJ', 'EXPENSE', '6971', 16066, 'Pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16068, 'SYSCOHADA-BJ', 'EXPENSE', '6972', 16066,
        'Pour dépréciation des immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16069, 'SYSCOHADA-BJ', 'INCOME', '7', 0, 'Ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16070, 'SYSCOHADA-BJ', 'INCOME', '701', 16069, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16071, 'SYSCOHADA-BJ', 'INCOME', '7011', 16070, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16072, 'SYSCOHADA-BJ', 'INCOME', '7012', 16070, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16073, 'SYSCOHADA-BJ', 'INCOME', '7013', 16070, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16074, 'SYSCOHADA-BJ', 'INCOME', '7014', 16070, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16075, 'SYSCOHADA-BJ', 'INCOME', '702', 16069, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16076, 'SYSCOHADA-BJ', 'INCOME', '7021', 16075, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16077, 'SYSCOHADA-BJ', 'INCOME', '7022', 16075, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16078, 'SYSCOHADA-BJ', 'INCOME', '7023', 16075, 'Aux entreprises de groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16079, 'SYSCOHADA-BJ', 'INCOME', '7024', 16075, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16080, 'SYSCOHADA-BJ', 'INCOME', '703', 16069, 'Ventes de produits intermediaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16081, 'SYSCOHADA-BJ', 'INCOME', '7031', 16080, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16082, 'SYSCOHADA-BJ', 'INCOME', '7032', 16080, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16083, 'SYSCOHADA-BJ', 'INCOME', '7033', 16080, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16084, 'SYSCOHADA-BJ', 'INCOME', '7034', 16080, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16085, 'SYSCOHADA-BJ', 'INCOME', '704', 16069, 'Ventes de produits residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16086, 'SYSCOHADA-BJ', 'INCOME', '7041', 16085, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16087, 'SYSCOHADA-BJ', 'INCOME', '7042', 16085, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16088, 'SYSCOHADA-BJ', 'INCOME', '7043', 16085, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16089, 'SYSCOHADA-BJ', 'INCOME', '7044', 16085, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16090, 'SYSCOHADA-BJ', 'INCOME', '705', 16069, 'Travaux factures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16091, 'SYSCOHADA-BJ', 'INCOME', '7051', 16090, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16092, 'SYSCOHADA-BJ', 'INCOME', '7052', 16090, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16093, 'SYSCOHADA-BJ', 'INCOME', '7053', 16090, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16094, 'SYSCOHADA-BJ', 'INCOME', '7054', 16090, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16095, 'SYSCOHADA-BJ', 'INCOME', '706', 16069, 'Services vendus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16096, 'SYSCOHADA-BJ', 'INCOME', '7061', 16095, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16097, 'SYSCOHADA-BJ', 'INCOME', '7062', 16095, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16098, 'SYSCOHADA-BJ', 'INCOME', '7063', 16095, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16099, 'SYSCOHADA-BJ', 'INCOME', '7064', 16095, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16100, 'SYSCOHADA-BJ', 'INCOME', '707', 16069, 'Produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16101, 'SYSCOHADA-BJ', 'INCOME', '7071', 16100, 'Port, emballages perdus et autres frais facturés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16102, 'SYSCOHADA-BJ', 'INCOME', '7072', 16100, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16103, 'SYSCOHADA-BJ', 'INCOME', '7073', 16100, 'Locations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16104, 'SYSCOHADA-BJ', 'INCOME', '7074', 16100, 'Bonis sur reprises et cessions d''emballages',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16105, 'SYSCOHADA-BJ', 'INCOME', '7075', 16100, 'Mise à disposition de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16106, 'SYSCOHADA-BJ', 'INCOME', '7076', 16100,
        'Redevances pour brevets, logiciels, marques et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16107, 'SYSCOHADA-BJ', 'INCOME', '7077', 16100, 'Services exploités dans l''intérêt du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16108, 'SYSCOHADA-BJ', 'INCOME', '7078', 16100, 'Autres produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16109, 'SYSCOHADA-BJ', 'INCOME', '71', 16069, 'Suvventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16110, 'SYSCOHADA-BJ', 'INCOME', '711', 16109, 'Sur produits a l''exportation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16111, 'SYSCOHADA-BJ', 'INCOME', '712', 16109, 'Sur produits a l''importation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16112, 'SYSCOHADA-BJ', 'INCOME', '713', 16109, 'Sur produits de perequation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16113, 'SYSCOHADA-BJ', 'INCOME', '718', 16109, 'Autres subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16114, 'SYSCOHADA-BJ', 'INCOME', '7181', 16113,
        'Versées par l''etat et les collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16115, 'SYSCOHADA-BJ', 'INCOME', '7182', 16113, 'Versées par les organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16116, 'SYSCOHADA-BJ', 'INCOME', '7183', 16113, 'Versées par des tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16117, 'SYSCOHADA-BJ', 'INCOME', '72', 16069, 'Production immobilisée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16118, 'SYSCOHADA-BJ', 'INCOME', '721', 16117, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16119, 'SYSCOHADA-BJ', 'INCOME', '722', 16117, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16120, 'SYSCOHADA-BJ', 'INCOME', '726', 16117, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16121, 'SYSCOHADA-BJ', 'INCOME', '73', 16069,
        'Variations des stocks de biens et de services produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16122, 'SYSCOHADA-BJ', 'INCOME', '734', 16121, 'Variations des stocks de produitsn en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16123, 'SYSCOHADA-BJ', 'INCOME', '7341', 16122, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16124, 'SYSCOHADA-BJ', 'INCOME', '7342', 16122, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16125, 'SYSCOHADA-BJ', 'INCOME', '735', 16121, 'Variations des en-cours de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16126, 'SYSCOHADA-BJ', 'INCOME', '7351', 16125, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16127, 'SYSCOHADA-BJ', 'INCOME', '7352', 16125, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16128, 'SYSCOHADA-BJ', 'INCOME', '736', 16121, 'Variations des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16129, 'SYSCOHADA-BJ', 'INCOME', '737', 16121,
        'Variations des stocks de produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16130, 'SYSCOHADA-BJ', 'INCOME', '7371', 16129, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16131, 'SYSCOHADA-BJ', 'INCOME', '7372', 16129, 'Produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16132, 'SYSCOHADA-BJ', 'INCOME', '75', 16069, 'Autres produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16133, 'SYSCOHADA-BJ', 'INCOME', '752', 16132,
        'Quote-part de resultat sur operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16134, 'SYSCOHADA-BJ', 'INCOME', '7521', 16133,
        'Quote-part trsnsférée de pertes (comptabilité de gérant)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16135, 'SYSCOHADA-BJ', 'INCOME', '7525', 16133,
        'Bénéfices attribués par transfert (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16136, 'SYSCOHADA-BJ', 'INCOME', '753', 16132,
        'Quote-part de resultat sue execution partielle de contrats pluri-ecercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16137, 'SYSCOHADA-BJ', 'INCOME', '754', 16132, 'Produits des cessions courantes d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16138, 'SYSCOHADA-BJ', 'INCOME', '758', 16132, 'Produits divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16139, 'SYSCOHADA-BJ', 'INCOME', '7581', 16138,
        'Jetons de présence et autres rémunérations d''administrateurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16140, 'SYSCOHADA-BJ', 'INCOME', '7582', 16138, 'Indemnités d''assurances reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16141, 'SYSCOHADA-BJ', 'INCOME', '759', 16132, 'Reprises de charges provisionnees d''exploitation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16142, 'SYSCOHADA-BJ', 'INCOME', '7591', 16141, 'Sur risques à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16143, 'SYSCOHADA-BJ', 'INCOME', '7593', 16141, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16144, 'SYSCOHADA-BJ', 'INCOME', '7594', 16141, 'Sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16145, 'SYSCOHADA-BJ', 'INCOME', '7598', 16141, 'Sur autres charges provisionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16146, 'SYSCOHADA-BJ', 'INCOME', '77', 16069, 'Revenus financiers et produits assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16147, 'SYSCOHADA-BJ', 'INCOME', '771', 16146, 'Interets de prets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16148, 'SYSCOHADA-BJ', 'INCOME', '772', 16146, 'Revenus de participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16149, 'SYSCOHADA-BJ', 'INCOME', '773', 16146, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16150, 'SYSCOHADA-BJ', 'INCOME', '774', 16146, 'Revenus de titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16151, 'SYSCOHADA-BJ', 'INCOME', '775', 16146, 'Revenus des creances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16152, 'SYSCOHADA-BJ', 'INCOME', '776', 16146, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16153, 'SYSCOHADA-BJ', 'INCOME', '777', 16146, 'Gains sur cessions de titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16154, 'SYSCOHADA-BJ', 'INCOME', '778', 16146, 'Gains sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16155, 'SYSCOHADA-BJ', 'INCOME', '7781', 16154, 'Gains sur rentes viagères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16156, 'SYSCOHADA-BJ', 'INCOME', '7782', 16154, 'Gains sur opérations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16157, 'SYSCOHADA-BJ', 'INCOME', '7784', 16154, 'Gains sur instruments de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16158, 'SYSCOHADA-BJ', 'INCOME', '779', 16146, 'Reprises de charges provisionnees financieres',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16159, 'SYSCOHADA-BJ', 'INCOME', '7791', 16158, 'Sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16160, 'SYSCOHADA-BJ', 'INCOME', '7795', 16158, 'Sur titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16161, 'SYSCOHADA-BJ', 'INCOME', '7798', 16158, 'Autres charges provisionnées financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16162, 'SYSCOHADA-BJ', 'INCOME', '78', 16069, 'Transfert de charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16163, 'SYSCOHADA-BJ', 'INCOME', '781', 16162, 'Transfert de charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16164, 'SYSCOHADA-BJ', 'INCOME', '787', 16162, 'Transfert de charges financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16165, 'SYSCOHADA-BJ', 'INCOME', '79', 16069, 'Reprises de provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16166, 'SYSCOHADA-BJ', 'INCOME', '791', 16165, 'Reprises de provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16167, 'SYSCOHADA-BJ', 'INCOME', '7911', 16166, 'Pour risques et charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16168, 'SYSCOHADA-BJ', 'INCOME', '7912', 16166, 'Pour grosses réparation d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16169, 'SYSCOHADA-BJ', 'INCOME', '7913', 16166,
        'Pour dépreciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16170, 'SYSCOHADA-BJ', 'INCOME', '7914', 16166, 'Pour dépreciation des immobilisations corporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16171, 'SYSCOHADA-BJ', 'INCOME', '797', 16165, 'Reprises de provisions financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16172, 'SYSCOHADA-BJ', 'INCOME', '7971', 16171, 'Pour risques et charges financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16173, 'SYSCOHADA-BJ', 'INCOME', '7972', 16171, 'Pour dépréciation des immobilisations financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16174, 'SYSCOHADA-BJ', 'INCOME', '798', 16165, 'Reprises d''amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16175, 'SYSCOHADA-BJ', 'AUTRES', '81', 0, 'Valeurs comptables des cessions d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16176, 'SYSCOHADA-BJ', 'AUTRES', '811', 16175, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16177, 'SYSCOHADA-BJ', 'AUTRES', '812', 16175, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16178, 'SYSCOHADA-BJ', 'AUTRES', '816', 16175, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16179, 'SYSCOHADA-BJ', 'AUTRES', '82', 0, 'Produits de cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16180, 'SYSCOHADA-BJ', 'AUTRES', '821', 16179, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16181, 'SYSCOHADA-BJ', 'AUTRES', '822', 16179, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16182, 'SYSCOHADA-BJ', 'AUTRES', '826', 16179, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16183, 'SYSCOHADA-BJ', 'AUTRES', '83', 0, 'Charges hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16184, 'SYSCOHADA-BJ', 'AUTRES', '831', 16183, 'Charges h.a.o constatées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16185, 'SYSCOHADA-BJ', 'AUTRES', '834', 16183, 'Pertes sur creances h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16186, 'SYSCOHADA-BJ', 'AUTRES', '835', 16183, 'Dons et liberalites accordes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16187, 'SYSCOHADA-BJ', 'AUTRES', '836', 16183, 'Abandons de creances consentis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16188, 'SYSCOHADA-BJ', 'AUTRES', '839', 16183, 'Charges provisionnees h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16189, 'SYSCOHADA-BJ', 'AUTRES', '84', 0, 'Produits hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16190, 'SYSCOHADA-BJ', 'AUTRES', '841', 16189, 'Produits h.a.o constates', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16191, 'SYSCOHADA-BJ', 'AUTRES', '845', 16189, 'Dons et liberalites obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16192, 'SYSCOHADA-BJ', 'AUTRES', '846', 16189, 'Abandons de creances obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16193, 'SYSCOHADA-BJ', 'AUTRES', '848', 16189, 'Transferts de charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16194, 'SYSCOHADA-BJ', 'AUTRES', '849', 16189, 'Reprises des charges provisionnees h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16195, 'SYSCOHADA-BJ', 'AUTRES', '85', 0, 'Dotations hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16196, 'SYSCOHADA-BJ', 'AUTRES', '851', 16195, 'Dotations aux provisions reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16197, 'SYSCOHADA-BJ', 'AUTRES', '852', 16195, 'Dotations aux amortissements h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16198, 'SYSCOHADA-BJ', 'AUTRES', '853', 16195, 'Dotations aux provisions pour depreciation h.a.o',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16199, 'SYSCOHADA-BJ', 'AUTRES', '854', 16195,
        'Dotations aux provisions pour risques et charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16200, 'SYSCOHADA-BJ', 'AUTRES', '858', 16195, 'Autres dotations h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16201, 'SYSCOHADA-BJ', 'AUTRES', '86', 0, 'Reprises hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16202, 'SYSCOHADA-BJ', 'AUTRES', '861', 16201, 'Reprises de provisions reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16203, 'SYSCOHADA-BJ', 'AUTRES', '862', 16201, 'Reprises d''amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16204, 'SYSCOHADA-BJ', 'AUTRES', '863', 16201, 'Reprises de provisions pour depreciation h.a.o',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16205, 'SYSCOHADA-BJ', 'AUTRES', '864', 16201,
        'Reprises de provisions pour risques et charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16206, 'SYSCOHADA-BJ', 'AUTRES', '865', 16201, 'Reprises de subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16207, 'SYSCOHADA-BJ', 'AUTRES', '868', 16201, 'Autres reprises h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16208, 'SYSCOHADA-BJ', 'AUTRES', '87', 0, 'Participations des travailleurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16209, 'SYSCOHADA-BJ', 'AUTRES', '871', 16208, 'Participation legale aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16210, 'SYSCOHADA-BJ', 'AUTRES', '874', 16208, 'Participation contractuelle aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16211, 'SYSCOHADA-BJ', 'AUTRES', '878', 16208, 'Autres participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16212, 'SYSCOHADA-BJ', 'AUTRES', '88', 0, 'Subventions d''equilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16213, 'SYSCOHADA-BJ', 'AUTRES', '881', 16212, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16214, 'SYSCOHADA-BJ', 'AUTRES', '884', 16212, 'Collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16215, 'SYSCOHADA-BJ', 'AUTRES', '886', 16212, 'Groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16216, 'SYSCOHADA-BJ', 'AUTRES', '888', 16212, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16217, 'SYSCOHADA-BJ', 'AUTRES', '89', 0, 'Impots sur le resultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16218, 'SYSCOHADA-BJ', 'AUTRES', '891', 16217, 'Impots sur les benefices de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16219, 'SYSCOHADA-BJ', 'AUTRES', '8911', 16218, 'Activités exercées dans l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16220, 'SYSCOHADA-BJ', 'AUTRES', '8912', 16218,
        'Activités exercées dans les autres etats de la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16221, 'SYSCOHADA-BJ', 'AUTRES', '8913', 16218, 'Activités exercées hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16222, 'SYSCOHADA-BJ', 'AUTRES', '892', 16217, 'Rappel d''impôts sur resultats anterieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16223, 'SYSCOHADA-BJ', 'AUTRES', '895', 16217, 'Impôts minimum forfaitaires (i.m.f)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16224, 'SYSCOHADA-BJ', 'AUTRES', '899', 16217,
        'Dégrèvements et annulations d''impots sur resultats antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16225, 'SYSCOHADA-BJ', 'AUTRES', '8991', 16224, 'Dégrèvements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16226, 'SYSCOHADA-BJ', 'AUTRES', '8994', 16224, 'Annulations pour pertes rétroactives', '1');
