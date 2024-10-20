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
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Descriptif des plans comptables SYSCOHADA CI
-- ID 15000 - 16999
-- ADD 2100000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15000, 'SYSCOHADA-CI', 'CAPIT', '1', 0, 'Capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15001, 'SYSCOHADA-CI', 'CAPIT', '101', 15000, 'Capital social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15002, 'SYSCOHADA-CI', 'CAPIT', '1011', 15001, 'Capital souscrit, non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15003, 'SYSCOHADA-CI', 'CAPIT', '1012', 15001, 'Capital souscrit, appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15004, 'SYSCOHADA-CI', 'CAPIT', '1013', 15001, 'Capital souscrit, appelé, versé, non amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15005, 'SYSCOHADA-CI', 'CAPIT', '1014', 15001, 'Capital souscrit, appelé, versé, amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15006, 'SYSCOHADA-CI', 'CAPIT', '1018', 15001,
        'Capital souscrit, soumis à des conditions particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15007, 'SYSCOHADA-CI', 'CAPIT', '102', 15000, 'Capital par dotation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15008, 'SYSCOHADA-CI', 'CAPIT', '1021', 15007, 'Dotation initiale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15009, 'SYSCOHADA-CI', 'CAPIT', '1022', 15007, 'Dotations complémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15010, 'SYSCOHADA-CI', 'CAPIT', '1028', 15007, 'Autres dotations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15011, 'SYSCOHADA-CI', 'CAPIT', '103', 15000, 'Capital personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15012, 'SYSCOHADA-CI', 'CAPIT', '104', 15000, 'Compte de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15013, 'SYSCOHADA-CI', 'CAPIT', '1041', 15012, 'Apports temporaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15014, 'SYSCOHADA-CI', 'CAPIT', '1042', 15012, 'Opérations courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15015, 'SYSCOHADA-CI', 'CAPIT', '1043', 15012,
        'Rémunérations, impôts et autres charges personnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15016, 'SYSCOHADA-CI', 'CAPIT', '1047', 15012, 'Prélèvements d''autoconsommation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15017, 'SYSCOHADA-CI', 'CAPIT', '1048', 15012, 'Autres prélèvements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15018, 'SYSCOHADA-CI', 'CAPIT', '105', 15000, 'Primes liees aux capitaux propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15019, 'SYSCOHADA-CI', 'CAPIT', '1051', 15018, 'Primes d''émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15020, 'SYSCOHADA-CI', 'CAPIT', '1052', 15018, 'Primes d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15021, 'SYSCOHADA-CI', 'CAPIT', '1053', 15018, 'Primes de fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15022, 'SYSCOHADA-CI', 'CAPIT', '1054', 15018, 'Primes de conversion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15023, 'SYSCOHADA-CI', 'CAPIT', '1058', 15018, 'Autres primes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15024, 'SYSCOHADA-CI', 'CAPIT', '106', 15000, 'Ecarts de reevaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15025, 'SYSCOHADA-CI', 'CAPIT', '1061', 15024, 'Ecarts de réévaluation légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15026, 'SYSCOHADA-CI', 'CAPIT', '1062', 15024, 'Ecarts de réévaluation libre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15027, 'SYSCOHADA-CI', 'CAPIT', '109', 15000, 'Actionnaires, capital souscrit, non appele', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15028, 'SYSCOHADA-CI', 'CAPIT', '11', 15000, 'Reserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15029, 'SYSCOHADA-CI', 'CAPIT', '111', 15028, 'Reserve legale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15030, 'SYSCOHADA-CI', 'CAPIT', '1111', 15029, 'Réserves légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15031, 'SYSCOHADA-CI', 'CAPIT', '112', 15028, 'Reserves statutaires ou contractuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15032, 'SYSCOHADA-CI', 'CAPIT', '113', 15028, 'Reserves reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15033, 'SYSCOHADA-CI', 'CAPIT', '1131', 15032, 'Réserves de plus-values nettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15034, 'SYSCOHADA-CI', 'CAPIT', '1133', 15032,
        'Réserves consécutives à l''octroi de subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15035, 'SYSCOHADA-CI', 'CAPIT', '1134', 15032, 'Réserves spéciales navires renouvelés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15036, 'SYSCOHADA-CI', 'CAPIT', '1135', 15032,
        'Réserves spéciales matériels et outillage renouvelés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15037, 'SYSCOHADA-CI', 'CAPIT', '1138', 15032, 'Autres réserves réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15038, 'SYSCOHADA-CI', 'CAPIT', '118', 15028, 'Autres reserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15039, 'SYSCOHADA-CI', 'CAPIT', '1181', 15038, 'Réserves facultatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15040, 'SYSCOHADA-CI', 'CAPIT', '1188', 15038, 'Réserves diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15041, 'SYSCOHADA-CI', 'CAPIT', '12', 15000, 'Report a nouveau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15042, 'SYSCOHADA-CI', 'CAPIT', '121', 15041, 'Report a nouveau crediteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15043, 'SYSCOHADA-CI', 'CAPIT', '1211', 15042, 'Report à nouveau crediteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15044, 'SYSCOHADA-CI', 'CAPIT', '129', 15041, 'Report a nouveau debiteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15045, 'SYSCOHADA-CI', 'CAPIT', '1291', 15044, 'Perte nette à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15046, 'SYSCOHADA-CI', 'CAPIT', '1292', 15044, 'Perte - amortissements réputés différés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15047, 'SYSCOHADA-CI', 'CAPIT', '13', 15000, 'Resultat net de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15048, 'SYSCOHADA-CI', 'CAPIT', '1301', 15047, 'Résultat en instance d''affectation : bénéfice',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15049, 'SYSCOHADA-CI', 'CAPIT', '1309', 15047, 'Résultat en instance d''affectation : perte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15050, 'SYSCOHADA-CI', 'CAPIT', '131', 15047, 'Resultat net : benefice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15051, 'SYSCOHADA-CI', 'CAPIT', '132', 15047, 'Marge brute (mb)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15052, 'SYSCOHADA-CI', 'CAPIT', '1321', 15051, 'Marge brute sur marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15053, 'SYSCOHADA-CI', 'CAPIT', '1322', 15051, 'Marge brute sur matières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15054, 'SYSCOHADA-CI', 'CAPIT', '133', 15047, 'Valeur ajoutee (v.a.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15055, 'SYSCOHADA-CI', 'CAPIT', '134', 15047, 'Excedent brut d''exploitation (e.b.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15056, 'SYSCOHADA-CI', 'CAPIT', '135', 15047, 'Resultat d''exploitation (r.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15057, 'SYSCOHADA-CI', 'CAPIT', '136', 15047, 'Resultat financier (r.f.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15058, 'SYSCOHADA-CI', 'CAPIT', '137', 15047, 'Resultat des activites ordinaires (r.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15059, 'SYSCOHADA-CI', 'CAPIT', '138', 15047, 'Resultat hors activites ordinaires (r.h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15060, 'SYSCOHADA-CI', 'CAPIT', '139', 15047, 'Resultat net : perte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15061, 'SYSCOHADA-CI', 'CAPIT', '14', 15000, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15062, 'SYSCOHADA-CI', 'CAPIT', '141', 15061, 'Subventions d''equipement a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15063, 'SYSCOHADA-CI', 'CAPIT', '1411', 15062, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15064, 'SYSCOHADA-CI', 'CAPIT', '1412', 15062, 'Régions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15065, 'SYSCOHADA-CI', 'CAPIT', '1413', 15062, 'Départements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15066, 'SYSCOHADA-CI', 'CAPIT', '1414', 15062, 'Communes et collectivités publiques décentralisées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15067, 'SYSCOHADA-CI', 'CAPIT', '1415', 15062, 'Entreprises publiques ou mixtes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15068, 'SYSCOHADA-CI', 'CAPIT', '1416', 15062, 'Entreprises et organismes privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15069, 'SYSCOHADA-CI', 'CAPIT', '1417', 15062, 'Organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15070, 'SYSCOHADA-CI', 'CAPIT', '1418', 15062, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15071, 'SYSCOHADA-CI', 'CAPIT', '142', 15061, 'Subventions d''equipement b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15072, 'SYSCOHADA-CI', 'CAPIT', '1421', 15071, 'Subventions d''équipements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15073, 'SYSCOHADA-CI', 'CAPIT', '148', 15061, 'Autres subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15074, 'SYSCOHADA-CI', 'CAPIT', '15', 15000, 'Provisions reglementees et fonds assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15075, 'SYSCOHADA-CI', 'CAPIT', '151', 15074, 'Amortissements derogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15076, 'SYSCOHADA-CI', 'CAPIT', '152', 15074, 'Plus-values de cession a reinvestir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15077, 'SYSCOHADA-CI', 'CAPIT', '1521', 15076, 'Plus-values de cession à réinvestir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15078, 'SYSCOHADA-CI', 'CAPIT', '153', 15074, 'Fonds reglementes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15079, 'SYSCOHADA-CI', 'CAPIT', '1531', 15078, 'Fonds national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15080, 'SYSCOHADA-CI', 'CAPIT', '1532', 15078, 'Prélèvement pour le budget', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15081, 'SYSCOHADA-CI', 'CAPIT', '154', 15074, 'Provision speciale de reevaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15082, 'SYSCOHADA-CI', 'CAPIT', '155', 15074,
        'Provisions reglementees relatives aux immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15083, 'SYSCOHADA-CI', 'CAPIT', '1551', 15082, 'Recontitution des gisements miniers et pétroliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15084, 'SYSCOHADA-CI', 'CAPIT', '1552', 15082, 'Provisions de croissance des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15085, 'SYSCOHADA-CI', 'CAPIT', '1553', 15082, 'Provisions de renouvellement du matériel naval',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15086, 'SYSCOHADA-CI', 'CAPIT', '1554', 15082,
        'Provisions pourle renouvellement du matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15087, 'SYSCOHADA-CI', 'CAPIT', '156', 15074, 'Provisions reglementees relatives aux stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15088, 'SYSCOHADA-CI', 'CAPIT', '1561', 15087, 'Hausse de prix', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15089, 'SYSCOHADA-CI', 'CAPIT', '1562', 15087, 'Fluctuation des cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15090, 'SYSCOHADA-CI', 'CAPIT', '157', 15074, 'Provisions pour investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15091, 'SYSCOHADA-CI', 'CAPIT', '158', 15074, 'Autres provisions et fonds reglementes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15092, 'SYSCOHADA-CI', 'CAPIT', '16', 15000, 'Emprunts et dettes assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15093, 'SYSCOHADA-CI', 'CAPIT', '161', 15092, 'Emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15094, 'SYSCOHADA-CI', 'CAPIT', '1611', 15093, 'Emprunts obligataires ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15095, 'SYSCOHADA-CI', 'CAPIT', '1612', 15093, 'Emprunts obligataires convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15096, 'SYSCOHADA-CI', 'CAPIT', '1618', 15093, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15097, 'SYSCOHADA-CI', 'CAPIT', '1619', 15093, 'Obligations à souscrire, à la souche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15098, 'SYSCOHADA-CI', 'CAPIT', '162', 15092,
        'Emprunts et dettes aupres des etablissements de credit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15099, 'SYSCOHADA-CI', 'CAPIT', '163', 15092, 'Avances recues de l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15100, 'SYSCOHADA-CI', 'CAPIT', '164', 15092, 'Avances recues et comptes courants bloques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15101, 'SYSCOHADA-CI', 'CAPIT', '165', 15092, 'Depots et cautionnements recus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15102, 'SYSCOHADA-CI', 'CAPIT', '1651', 15101, 'Dépôts à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15103, 'SYSCOHADA-CI', 'CAPIT', '1652', 15101, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15104, 'SYSCOHADA-CI', 'CAPIT', '166', 15092, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15105, 'SYSCOHADA-CI', 'CAPIT', '1661', 15104, 'Sur emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15106, 'SYSCOHADA-CI', 'CAPIT', '1662', 15104,
        'Sur emprunts et dettes auprès des établissements de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15107, 'SYSCOHADA-CI', 'CAPIT', '1663', 15104, 'Sur avances reçues de l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15108, 'SYSCOHADA-CI', 'CAPIT', '1664', 15104, 'Sur avances reçues et comptes courants bloqués',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15109, 'SYSCOHADA-CI', 'CAPIT', '1665', 15104, 'Sur dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15110, 'SYSCOHADA-CI', 'CAPIT', '1667', 15104, 'Sur avances assorties de conditions particulières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15111, 'SYSCOHADA-CI', 'CAPIT', '1668', 15104, 'Sur autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15112, 'SYSCOHADA-CI', 'CAPIT', '167', 15092, 'Avances assorties de conditions particulieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15113, 'SYSCOHADA-CI', 'CAPIT', '1671', 15112, 'Avances bloquées pour augmentation du capital',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15114, 'SYSCOHADA-CI', 'CAPIT', '1672', 15112, 'Avances conditionnées par l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15115, 'SYSCOHADA-CI', 'CAPIT', '1673', 15112,
        'Avances conditionnées par les autres organismes africains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15116, 'SYSCOHADA-CI', 'CAPIT', '1674', 15112,
        'Avances conditionné par les autres organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15117, 'SYSCOHADA-CI', 'CAPIT', '1676', 15112, 'Droits du concédant exigibles en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15118, 'SYSCOHADA-CI', 'CAPIT', '168', 15092, 'Autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15119, 'SYSCOHADA-CI', 'CAPIT', '1681', 15118, 'Rentes viagères capitalisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15120, 'SYSCOHADA-CI', 'CAPIT', '1682', 15118, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15121, 'SYSCOHADA-CI', 'CAPIT', '1683', 15118, 'Dettes consécutives à des titres emprunté', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15122, 'SYSCOHADA-CI', 'CAPIT', '1684', 15118, 'Dettes du concédant exigibles en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15123, 'SYSCOHADA-CI', 'CAPIT', '1685', 15118, 'Emprunts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15124, 'SYSCOHADA-CI', 'CAPIT', '1686', 15118, 'Participation des travailleurs aux bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15125, 'SYSCOHADA-CI', 'CAPIT', '17', 15000, 'Dettes de credit-bail et contrats assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15126, 'SYSCOHADA-CI', 'CAPIT', '172', 15125, 'Emprunts equivalents de credit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15127, 'SYSCOHADA-CI', 'CAPIT', '173', 15125, 'Emprunts equivalents de credit-bail mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15128, 'SYSCOHADA-CI', 'CAPIT', '176', 15125, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15129, 'SYSCOHADA-CI', 'CAPIT', '1762', 15128, 'Sur emprunts équivalents de crédit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15130, 'SYSCOHADA-CI', 'CAPIT', '1763', 15128, 'Sur emprunts équivalents de crédit-bail mobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15131, 'SYSCOHADA-CI', 'CAPIT', '1768', 15128, 'Sur emprunts équivalents d''autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15132, 'SYSCOHADA-CI', 'CAPIT', '178', 15125, 'Emprunts equivalents d''autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15133, 'SYSCOHADA-CI', 'CAPIT', '18', 15000,
        'Dettes liees a des participations et comptes de liaison des etablissements et societes en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15134, 'SYSCOHADA-CI', 'CAPIT', '181', 15133, 'Dettes liees a des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15135, 'SYSCOHADA-CI', 'CAPIT', '1811', 15134, 'Dettes liées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15136, 'SYSCOHADA-CI', 'CAPIT', '1812', 15134, 'Dettes liées à des participations (hors groupe)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15137, 'SYSCOHADA-CI', 'CAPIT', '182', 15133, 'Dettes liees a des societes en paticipation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15138, 'SYSCOHADA-CI', 'CAPIT', '183', 15133,
        'Interets courus sur dettes liees a des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15139, 'SYSCOHADA-CI', 'CAPIT', '184', 15133,
        'Comptes permanents bloques des etablissements et succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15140, 'SYSCOHADA-CI', 'CAPIT', '185', 15133,
        'Comptes permanents non bloques des etablissements et succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15141, 'SYSCOHADA-CI', 'CAPIT', '186', 15133, 'Comptes de liaison charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15142, 'SYSCOHADA-CI', 'CAPIT', '187', 15133, 'Comptes de liaison produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15143, 'SYSCOHADA-CI', 'CAPIT', '188', 15133, 'Comptes de liaison des societes en participation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15144, 'SYSCOHADA-CI', 'CAPIT', '19', 15000, 'Provisions financieres pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15145, 'SYSCOHADA-CI', 'CAPIT', '191', 15144, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15146, 'SYSCOHADA-CI', 'CAPIT', '192', 15144, 'Provisions pour garanties donnees aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15147, 'SYSCOHADA-CI', 'CAPIT', '193', 15144,
        'Provisions pour pertes sur marches a achevement futur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15148, 'SYSCOHADA-CI', 'CAPIT', '194', 15144, 'Provisions pour pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15149, 'SYSCOHADA-CI', 'CAPIT', '195', 15144, 'Provisions pour impots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15150, 'SYSCOHADA-CI', 'CAPIT', '196', 15144, 'Provisions pour pensions et obligations similaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15151, 'SYSCOHADA-CI', 'CAPIT', '197', 15144,
        'Provisions pour charges a repartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15152, 'SYSCOHADA-CI', 'CAPIT', '1971', 15151, 'Provisions pour grosses réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15153, 'SYSCOHADA-CI', 'CAPIT', '198', 15144,
        'Autres provisions financieres pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15154, 'SYSCOHADA-CI', 'CAPIT', '1981', 15153, 'Provisions pour amendes et pénalités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15155, 'SYSCOHADA-CI', 'CAPIT', '1982', 15153,
        'Provisions pour renouvellement des immobilisations (entreprises concessionnaires)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15156, 'SYSCOHADA-CI', 'CAPIT', '1983', 15153, 'Provisions pour propres assureurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15157, 'SYSCOHADA-CI', 'CAPIT', '1988', 15153,
        'Autres provisions financières pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15158, 'SYSCOHADA-CI', 'IMMO', '2', 0, 'Charges immobilisees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15159, 'SYSCOHADA-CI', 'IMMO', '201', 15158, 'Frais d''etablissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15160, 'SYSCOHADA-CI', 'IMMO', '2011', 15159, 'Frais de constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15161, 'SYSCOHADA-CI', 'IMMO', '2012', 15159, 'Frais de prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15162, 'SYSCOHADA-CI', 'IMMO', '2013', 15159, 'Frais de publicité et de lancement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15163, 'SYSCOHADA-CI', 'IMMO', '2014', 15159, 'Frais de fonctionnement antérieurs au démarrage',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15164, 'SYSCOHADA-CI', 'IMMO', '2015', 15159,
        'Frais de modification du capital (fusions, scissions transformations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15165, 'SYSCOHADA-CI', 'IMMO', '2016', 15159, 'Frais d''entrée à la bourse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15166, 'SYSCOHADA-CI', 'IMMO', '2017', 15159, 'Frais de restructuration', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15167, 'SYSCOHADA-CI', 'IMMO', '2018', 15159, 'Frais divers d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15168, 'SYSCOHADA-CI', 'IMMO', '202', 15158, 'Charges a repartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15169, 'SYSCOHADA-CI', 'IMMO', '2021', 15168, 'Charges différées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15170, 'SYSCOHADA-CI', 'IMMO', '2022', 15168, 'Frais d''acquisition d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15171, 'SYSCOHADA-CI', 'IMMO', '2026', 15168, 'Fais d''émission des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15172, 'SYSCOHADA-CI', 'IMMO', '2028', 15168, 'Charges à étaler', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15173, 'SYSCOHADA-CI', 'IMMO', '206', 15158, 'Primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15174, 'SYSCOHADA-CI', 'IMMO', '2061', 15173, 'Obligations ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15175, 'SYSCOHADA-CI', 'IMMO', '2062', 15173, 'Obligations convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15176, 'SYSCOHADA-CI', 'IMMO', '2068', 15173, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15177, 'SYSCOHADA-CI', 'IMMO', '21', 15158, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15178, 'SYSCOHADA-CI', 'IMMO', '211', 15177, 'Frais de recherche et de developpement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15179, 'SYSCOHADA-CI', 'IMMO', '212', 15177, 'Brevets, licences, concessions et droits similaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15180, 'SYSCOHADA-CI', 'IMMO', '213', 15177, 'Logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15181, 'SYSCOHADA-CI', 'IMMO', '214', 15177, 'Marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15182, 'SYSCOHADA-CI', 'IMMO', '215', 15177, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15183, 'SYSCOHADA-CI', 'IMMO', '216', 15177, 'Droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15184, 'SYSCOHADA-CI', 'IMMO', '217', 15177, 'Investissements de creation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15185, 'SYSCOHADA-CI', 'IMMO', '218', 15177, 'Autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15186, 'SYSCOHADA-CI', 'IMMO', '219', 15177, 'Immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15187, 'SYSCOHADA-CI', 'IMMO', '2191', 15186, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15188, 'SYSCOHADA-CI', 'IMMO', '2193', 15186, 'Logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15189, 'SYSCOHADA-CI', 'IMMO', '2198', 15186, 'Autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15190, 'SYSCOHADA-CI', 'IMMO', '22', 15158, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15191, 'SYSCOHADA-CI', 'IMMO', '221', 15190, 'Terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15192, 'SYSCOHADA-CI', 'IMMO', '2211', 15191, 'Terrains d''exploitation agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15193, 'SYSCOHADA-CI', 'IMMO', '2212', 15191, 'Terrains d''exploitation forestière', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15194, 'SYSCOHADA-CI', 'IMMO', '2218', 15191, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15195, 'SYSCOHADA-CI', 'IMMO', '222', 15190, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15196, 'SYSCOHADA-CI', 'IMMO', '2221', 15195, 'Terrains à bâtir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15197, 'SYSCOHADA-CI', 'IMMO', '2228', 15195, 'Autres terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15198, 'SYSCOHADA-CI', 'IMMO', '223', 15190, 'Terrains batis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15199, 'SYSCOHADA-CI', 'IMMO', '2231', 15198, 'Pour bâtiments industriels et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15200, 'SYSCOHADA-CI', 'IMMO', '2232', 15198, 'Pour bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15201, 'SYSCOHADA-CI', 'IMMO', '2234', 15198,
        'Pour bâtiments affectés aux autres opérations professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15202, 'SYSCOHADA-CI', 'IMMO', '2235', 15198,
        'Pour bâtiments affectés aux autres opérations non professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15203, 'SYSCOHADA-CI', 'IMMO', '2236', 15198, 'Autres terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15204, 'SYSCOHADA-CI', 'IMMO', '224', 15190, 'Travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15205, 'SYSCOHADA-CI', 'IMMO', '2241', 15204, 'Plantation d''arbres et d''arbustes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15206, 'SYSCOHADA-CI', 'IMMO', '2248', 15204, 'Autres travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15207, 'SYSCOHADA-CI', 'IMMO', '225', 15190, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15208, 'SYSCOHADA-CI', 'IMMO', '2251', 15207, 'Carrières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15209, 'SYSCOHADA-CI', 'IMMO', '226', 15190, 'Terrains amenages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15210, 'SYSCOHADA-CI', 'IMMO', '2261', 15209, 'Parkings', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15211, 'SYSCOHADA-CI', 'IMMO', '227', 15190, 'Terrains mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15212, 'SYSCOHADA-CI', 'IMMO', '228', 15190, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15213, 'SYSCOHADA-CI', 'IMMO', '2281', 15212, 'Terrains des immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15214, 'SYSCOHADA-CI', 'IMMO', '2285', 15212, 'Terrains des logements affectés au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15215, 'SYSCOHADA-CI', 'IMMO', '2288', 15212, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15216, 'SYSCOHADA-CI', 'IMMO', '229', 15190, 'Amenagements des terrains en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15217, 'SYSCOHADA-CI', 'IMMO', '2291', 15216, 'Terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15218, 'SYSCOHADA-CI', 'IMMO', '2292', 15216, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15219, 'SYSCOHADA-CI', 'IMMO', '2295', 15216, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15220, 'SYSCOHADA-CI', 'IMMO', '2298', 15216, 'Autres travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15221, 'SYSCOHADA-CI', 'IMMO', '23', 15158, 'Bâtiments, installations techniques et agencements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15222, 'SYSCOHADA-CI', 'IMMO', '231', 15221,
        'Bâtiments industriels, agricoles, administratifs et commerciaux sur sol propre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15223, 'SYSCOHADA-CI', 'IMMO', '2311', 15222, 'Bâtiments industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15224, 'SYSCOHADA-CI', 'IMMO', '2312', 15222, 'Bâtiments agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15225, 'SYSCOHADA-CI', 'IMMO', '2313', 15222, 'Bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15226, 'SYSCOHADA-CI', 'IMMO', '2314', 15222, 'Bâtiments affectés au logement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15227, 'SYSCOHADA-CI', 'IMMO', '2315', 15222, 'Immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15228, 'SYSCOHADA-CI', 'IMMO', '232', 15221,
        'Bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15229, 'SYSCOHADA-CI', 'IMMO', '2321', 15228, 'Bâtiments industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15230, 'SYSCOHADA-CI', 'IMMO', '2322', 15228, 'Bâtiments agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15231, 'SYSCOHADA-CI', 'IMMO', '2323', 15228, 'Bâtiments administratifs et commerciaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15232, 'SYSCOHADA-CI', 'IMMO', '2324', 15228, 'Bâtiments affectés au logement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15233, 'SYSCOHADA-CI', 'IMMO', '2325', 15228, 'Immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15234, 'SYSCOHADA-CI', 'IMMO', '233', 15221, 'Ouvrages d''infrastructures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15235, 'SYSCOHADA-CI', 'IMMO', '2331', 15234, 'Voies de terre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15236, 'SYSCOHADA-CI', 'IMMO', '2332', 15234, 'Voies de fer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15237, 'SYSCOHADA-CI', 'IMMO', '2333', 15234, 'Voies d''eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15238, 'SYSCOHADA-CI', 'IMMO', '2334', 15234, 'Barrages, digues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15239, 'SYSCOHADA-CI', 'IMMO', '2335', 15234, 'Pistes d''aérodrome', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15240, 'SYSCOHADA-CI', 'IMMO', '2338', 15234, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15241, 'SYSCOHADA-CI', 'IMMO', '234', 15221, 'Installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15242, 'SYSCOHADA-CI', 'IMMO', '2341', 15241, 'Installations complexes spécialisées sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15243, 'SYSCOHADA-CI', 'IMMO', '2342', 15241,
        'Installations complexes spécialisées sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15244, 'SYSCOHADA-CI', 'IMMO', '2343', 15241, 'Installations à caractère spécifique sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15245, 'SYSCOHADA-CI', 'IMMO', '2344', 15241,
        'Installations à caractère spécifique sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15246, 'SYSCOHADA-CI', 'IMMO', '235', 15221, 'Amenagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15247, 'SYSCOHADA-CI', 'IMMO', '2351', 15246, 'Installations générales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15248, 'SYSCOHADA-CI', 'IMMO', '2358', 15246, 'Autres installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15249, 'SYSCOHADA-CI', 'IMMO', '237', 15221,
        'Batiments industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15250, 'SYSCOHADA-CI', 'IMMO', '238', 15221, 'Autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15251, 'SYSCOHADA-CI', 'IMMO', '239', 15221, 'Bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15252, 'SYSCOHADA-CI', 'IMMO', '2391', 15251, 'Bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15253, 'SYSCOHADA-CI', 'IMMO', '24', 15158, 'Materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15254, 'SYSCOHADA-CI', 'IMMO', '241', 15253, 'Materiel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15255, 'SYSCOHADA-CI', 'IMMO', '2411', 15254, 'Matériel industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15256, 'SYSCOHADA-CI', 'IMMO', '2412', 15254, 'Outillage industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15257, 'SYSCOHADA-CI', 'IMMO', '2413', 15254, 'Matériel commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15258, 'SYSCOHADA-CI', 'IMMO', '2414', 15254, 'Outillage commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15259, 'SYSCOHADA-CI', 'IMMO', '242', 15253, 'Materiel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15260, 'SYSCOHADA-CI', 'IMMO', '2421', 15259, 'Matériel agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15261, 'SYSCOHADA-CI', 'IMMO', '2422', 15259, 'Outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15262, 'SYSCOHADA-CI', 'IMMO', '243', 15253, 'Materiel d''emballage recuperable et identifiable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15263, 'SYSCOHADA-CI', 'IMMO', '244', 15253, 'Materiel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15264, 'SYSCOHADA-CI', 'IMMO', '2441', 15263, 'Matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15265, 'SYSCOHADA-CI', 'IMMO', '2442', 15263, 'Matériel informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15266, 'SYSCOHADA-CI', 'IMMO', '2443', 15263, 'Matériel bureautique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15267, 'SYSCOHADA-CI', 'IMMO', '2444', 15263, 'Mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15268, 'SYSCOHADA-CI', 'IMMO', '2446', 15263, 'Matériel et mobilier des immeubles de rapport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15269, 'SYSCOHADA-CI', 'IMMO', '2447', 15263, 'Matériel et mobilier des logements du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15270, 'SYSCOHADA-CI', 'IMMO', '245', 15253, 'Materiel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15271, 'SYSCOHADA-CI', 'IMMO', '2451', 15270, 'Matériel automobile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15272, 'SYSCOHADA-CI', 'IMMO', '2452', 15270, 'Matériel ferroviaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15273, 'SYSCOHADA-CI', 'IMMO', '2453', 15270, 'Matériel fluvial, lagunaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15274, 'SYSCOHADA-CI', 'IMMO', '2454', 15270, 'Matériel naval', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15275, 'SYSCOHADA-CI', 'IMMO', '2455', 15270, 'Matériel aérien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15276, 'SYSCOHADA-CI', 'IMMO', '2456', 15270, 'Matériel hippomobile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15277, 'SYSCOHADA-CI', 'IMMO', '2458', 15270, 'Autres (vélo, mobylette, moto)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15278, 'SYSCOHADA-CI', 'IMMO', '246', 15253, 'Immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15279, 'SYSCOHADA-CI', 'IMMO', '2461', 15278, 'Cheptel, animaux de trait', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15280, 'SYSCOHADA-CI', 'IMMO', '2462', 15278, 'Cheptel, animaux reproducteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15281, 'SYSCOHADA-CI', 'IMMO', '2463', 15278, 'Animaux de garde', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15282, 'SYSCOHADA-CI', 'IMMO', '2465', 15278, 'Plantations agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15283, 'SYSCOHADA-CI', 'IMMO', '2468', 15278, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15284, 'SYSCOHADA-CI', 'IMMO', '247', 15253, 'Agencements et amenagements du materiel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15285, 'SYSCOHADA-CI', 'IMMO', '248', 15253, 'Autres materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15286, 'SYSCOHADA-CI', 'IMMO', '2481', 15285, 'Collections et oeuvres d''art', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15287, 'SYSCOHADA-CI', 'IMMO', '249', 15253, 'Materiel en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15288, 'SYSCOHADA-CI', 'IMMO', '2491', 15287, 'Matériel et outillage industriel et commercial',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15289, 'SYSCOHADA-CI', 'IMMO', '2492', 15287, 'Matériel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15290, 'SYSCOHADA-CI', 'IMMO', '2493', 15287, 'Matériel d''emballage récupérable et identifiable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15291, 'SYSCOHADA-CI', 'IMMO', '2494', 15287, 'Matériel et mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15292, 'SYSCOHADA-CI', 'IMMO', '2495', 15287, 'Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15293, 'SYSCOHADA-CI', 'IMMO', '2496', 15287, 'Immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15294, 'SYSCOHADA-CI', 'IMMO', '2497', 15287, 'Agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15295, 'SYSCOHADA-CI', 'IMMO', '2498', 15287, 'Autres matériels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15296, 'SYSCOHADA-CI', 'IMMO', '25', 15158, 'Avances et acomptes verses sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15297, 'SYSCOHADA-CI', 'IMMO', '251', 15296,
        'Avances et acomptes verses sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15298, 'SYSCOHADA-CI', 'IMMO', '252', 15296,
        'Avances et acomptes verses sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15299, 'SYSCOHADA-CI', 'IMMO', '26', 15158, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15300, 'SYSCOHADA-CI', 'IMMO', '261', 15299,
        'Titres de participation dans des societes sous contrôle exclusif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15301, 'SYSCOHADA-CI', 'IMMO', '262', 15299,
        'Titres de participation dans des societes sous contrôle conjoint', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15302, 'SYSCOHADA-CI', 'IMMO', '263', 15299,
        'Titres de participation dans des societes conferant une influence notable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15303, 'SYSCOHADA-CI', 'IMMO', '265', 15299, 'Participations dans des organismes professionnels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15304, 'SYSCOHADA-CI', 'IMMO', '266', 15299,
        'Part dans des groupements d''interets economique (g.i.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15305, 'SYSCOHADA-CI', 'IMMO', '268', 15299, 'Autres titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15306, 'SYSCOHADA-CI', 'IMMO', '27', 15158, 'Autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15307, 'SYSCOHADA-CI', 'IMMO', '271', 15306, 'Prêts et creances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15308, 'SYSCOHADA-CI', 'IMMO', '2711', 15307, 'Prêts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15309, 'SYSCOHADA-CI', 'IMMO', '2712', 15307, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15310, 'SYSCOHADA-CI', 'IMMO', '2713', 15307, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15311, 'SYSCOHADA-CI', 'IMMO', '2714', 15307, 'Titres prêtés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15312, 'SYSCOHADA-CI', 'IMMO', '272', 15306, 'Prets au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15313, 'SYSCOHADA-CI', 'IMMO', '2721', 15312, 'Prêts immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15314, 'SYSCOHADA-CI', 'IMMO', '2722', 15312, 'Prêts mobiliers et d''intallation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15315, 'SYSCOHADA-CI', 'IMMO', '2728', 15312, 'Autres prêts (frais d''étude...)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15316, 'SYSCOHADA-CI', 'IMMO', '273', 15306, 'Creances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15317, 'SYSCOHADA-CI', 'IMMO', '2731', 15316, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15318, 'SYSCOHADA-CI', 'IMMO', '2733', 15316, 'Fonds reglementé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15319, 'SYSCOHADA-CI', 'IMMO', '2738', 15316, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15320, 'SYSCOHADA-CI', 'IMMO', '274', 15306, 'Titres immobilises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15321, 'SYSCOHADA-CI', 'IMMO', '2741', 15320,
        'Titres immobilisés de l''activité de portefeuille (t.i.a.p.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15322, 'SYSCOHADA-CI', 'IMMO', '2742', 15320, 'Titres participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15323, 'SYSCOHADA-CI', 'IMMO', '2743', 15320, 'Certificats d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15324, 'SYSCOHADA-CI', 'IMMO', '2744', 15320, 'Parts de fonds commun de placement (f.c.p.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15325, 'SYSCOHADA-CI', 'IMMO', '2748', 15320, 'Autres titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15326, 'SYSCOHADA-CI', 'IMMO', '275', 15306, 'Depots et cautionnements verses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15327, 'SYSCOHADA-CI', 'IMMO', '2751', 15326, 'Dépôts pour loyers d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15328, 'SYSCOHADA-CI', 'IMMO', '2752', 15326, 'Dépôts pour l''électricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15329, 'SYSCOHADA-CI', 'IMMO', '2753', 15326, 'Dépôts pour l''eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15330, 'SYSCOHADA-CI', 'IMMO', '2754', 15326, 'Dépôts pour le gaz', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15331, 'SYSCOHADA-CI', 'IMMO', '2755', 15326, 'Dépôts pour le téléphone, le télex, la télécopie',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15332, 'SYSCOHADA-CI', 'IMMO', '2756', 15326, 'Cautionnements sur les marchés publics', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15333, 'SYSCOHADA-CI', 'IMMO', '2757', 15326, 'Cautionnements sur autres opérations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15334, 'SYSCOHADA-CI', 'IMMO', '2758', 15326, 'Autres dépôts et cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15335, 'SYSCOHADA-CI', 'IMMO', '276', 15306, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15336, 'SYSCOHADA-CI', 'IMMO', '2761', 15335, 'Prêts et créances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15337, 'SYSCOHADA-CI', 'IMMO', '2762', 15335, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15338, 'SYSCOHADA-CI', 'IMMO', '2763', 15335, 'Créances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15339, 'SYSCOHADA-CI', 'IMMO', '2764', 15335, 'Titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15340, 'SYSCOHADA-CI', 'IMMO', '2765', 15335, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15341, 'SYSCOHADA-CI', 'IMMO', '2767', 15335, 'Créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15342, 'SYSCOHADA-CI', 'IMMO', '2768', 15335, 'Immobilisations financières diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15343, 'SYSCOHADA-CI', 'IMMO', '277', 15306,
        'Créances rattachees a des participations et des avances a des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15344, 'SYSCOHADA-CI', 'IMMO', '2771', 15343, 'Créances rattachées à des participations (groupe)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15345, 'SYSCOHADA-CI', 'IMMO', '2772', 15343,
        'Créances rattachées à des participations (hors groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15346, 'SYSCOHADA-CI', 'IMMO', '2773', 15343, 'Créances rattachées à des sociétés en participation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15347, 'SYSCOHADA-CI', 'IMMO', '2774', 15343,
        'Avances à des groupements d''intérêt économique (g.i.e.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15348, 'SYSCOHADA-CI', 'IMMO', '278', 15306, 'Immobilisations financieres diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15349, 'SYSCOHADA-CI', 'IMMO', '2781', 15348, 'Créances diverses groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15350, 'SYSCOHADA-CI', 'IMMO', '2782', 15348, 'Créances diverses hors groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15351, 'SYSCOHADA-CI', 'IMMO', '2785', 15348, 'Or et métaux précieux (1)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15352, 'SYSCOHADA-CI', 'IMMO', '28', 15158, 'Amortissemnts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15353, 'SYSCOHADA-CI', 'IMMO', '281', 15352, 'Amortissements des immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15354, 'SYSCOHADA-CI', 'IMMO', '2811', 15353,
        'Amortissements des frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15355, 'SYSCOHADA-CI', 'IMMO', '2812', 15353,
        'Amortissements des brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15356, 'SYSCOHADA-CI', 'IMMO', '2813', 15353, 'Amortissements des logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15357, 'SYSCOHADA-CI', 'IMMO', '2814', 15353, 'Amortissements des marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15358, 'SYSCOHADA-CI', 'IMMO', '2815', 15353, 'Amortissements du fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15359, 'SYSCOHADA-CI', 'IMMO', '2816', 15353, 'Amortissements du droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15360, 'SYSCOHADA-CI', 'IMMO', '2817', 15353, 'Amortissements des investissements de création',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15361, 'SYSCOHADA-CI', 'IMMO', '2818', 15353,
        'Amortissements des autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15362, 'SYSCOHADA-CI', 'IMMO', '282', 15352, 'Amortissements des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15363, 'SYSCOHADA-CI', 'IMMO', '2821', 15362, 'Amortissements des terrains agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15364, 'SYSCOHADA-CI', 'IMMO', '2824', 15362,
        'Amortissements des travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15365, 'SYSCOHADA-CI', 'IMMO', '2825', 15362, 'Amortissements des terrains de gisements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15366, 'SYSCOHADA-CI', 'IMMO', '283', 15352,
        'Amortissements des batiments, installations techniques et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15367, 'SYSCOHADA-CI', 'IMMO', '2831', 15366,
        'Amortissements des bâtiments industriels, agricoles, administratifs et commerciaux sur sol propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15368, 'SYSCOHADA-CI', 'IMMO', '2832', 15366,
        'Amortissements des bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15369, 'SYSCOHADA-CI', 'IMMO', '2833', 15366, 'Amortissements des ouvrages d''infrastructure', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15370, 'SYSCOHADA-CI', 'IMMO', '2834', 15366, 'Amortissements des installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15371, 'SYSCOHADA-CI', 'IMMO', '2835', 15366, 'Amortissements des aménagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15372, 'SYSCOHADA-CI', 'IMMO', '2837', 15366,
        'Amortissements des bâtiments  industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15373, 'SYSCOHADA-CI', 'IMMO', '2838', 15366,
        'Amortissements des autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15374, 'SYSCOHADA-CI', 'IMMO', '284', 15352, 'Amortissement du materiel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15375, 'SYSCOHADA-CI', 'IMMO', '2841', 15374,
        'Amortissements du matériel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15376, 'SYSCOHADA-CI', 'IMMO', '2842', 15374, 'Amortissements du matériel et outillage agricole',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15377, 'SYSCOHADA-CI', 'IMMO', '2843', 15374,
        'Amortissements du matériel d''emballage récupérable et identifiable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15378, 'SYSCOHADA-CI', 'IMMO', '2844', 15374, 'Amortissements du matériel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15379, 'SYSCOHADA-CI', 'IMMO', '2845', 15374, 'Amortissements du materiel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15380, 'SYSCOHADA-CI', 'IMMO', '2846', 15374,
        'Amortissements des immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15381, 'SYSCOHADA-CI', 'IMMO', '2847', 15374,
        'Amortissements des agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15382, 'SYSCOHADA-CI', 'IMMO', '2848', 15374, 'Amortissements des autres matériels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15383, 'SYSCOHADA-CI', 'IMMO', '29', 15158, 'Provisions pour depreciation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15384, 'SYSCOHADA-CI', 'IMMO', '291', 15383,
        'Provisions pour depreciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15385, 'SYSCOHADA-CI', 'IMMO', '2912', 15384,
        'Provisions pour dépréciation des brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15386, 'SYSCOHADA-CI', 'IMMO', '2913', 15384, 'Provisions pour dépréciation des logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15387, 'SYSCOHADA-CI', 'IMMO', '2914', 15384, 'Provisions pour dépréciation des marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15388, 'SYSCOHADA-CI', 'IMMO', '2915', 15384, 'Provisions pour dépréciation du fonds de commerce',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15389, 'SYSCOHADA-CI', 'IMMO', '2916', 15384, 'Provisions pour dépréciation du droit de bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15390, 'SYSCOHADA-CI', 'IMMO', '2917', 15384,
        'Provisions pour dépréciation des investissements de création', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15391, 'SYSCOHADA-CI', 'IMMO', '2918', 15384,
        'Provisions pour dépréciation des autres droits et valeurs incorporels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15392, 'SYSCOHADA-CI', 'IMMO', '2919', 15384,
        'Provisions pour dépréciation des immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15393, 'SYSCOHADA-CI', 'IMMO', '292', 15383, 'Provisions pour depreciation des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15394, 'SYSCOHADA-CI', 'IMMO', '2921', 15393,
        'Provisions pour dépréciations des terrains agricoles et forestiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15395, 'SYSCOHADA-CI', 'IMMO', '2922', 15393, 'Provisions pour dépréciation des terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15396, 'SYSCOHADA-CI', 'IMMO', '2923', 15393, 'Provisions pour dépréciation des terrains bâtis',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15397, 'SYSCOHADA-CI', 'IMMO', '2924', 15393,
        'Provisions pour dépréciation des travaux de mise en valeur des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15398, 'SYSCOHADA-CI', 'IMMO', '2925', 15393,
        'Provisions pour dépréciation des terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15399, 'SYSCOHADA-CI', 'IMMO', '2926', 15393, 'Provisions pour dépréciation des terrains aménagés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15400, 'SYSCOHADA-CI', 'IMMO', '2927', 15393,
        'Provisions pour dépréciation des terrains mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15401, 'SYSCOHADA-CI', 'IMMO', '2928', 15393, 'Provisions pour dépréciation des autres terrains',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15402, 'SYSCOHADA-CI', 'IMMO', '2929', 15393,
        'Provisions pour dépréciation des aménagements terrains en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15403, 'SYSCOHADA-CI', 'IMMO', '293', 15383,
        'Provisions pour depreciation des batiments, installations techniques et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15404, 'SYSCOHADA-CI', 'IMMO', '2931', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles, administratifs et commerciaux sur sol propre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15405, 'SYSCOHADA-CI', 'IMMO', '2932', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles, administratifs et commerciaux sur sol d''autrui',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15406, 'SYSCOHADA-CI', 'IMMO', '2933', 15403,
        'Provisions pour dépréciation des ouvrages d''infrastructures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15407, 'SYSCOHADA-CI', 'IMMO', '2934', 15403,
        'Provisions pour dépréciation des installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15408, 'SYSCOHADA-CI', 'IMMO', '2935', 15403,
        'Provisions pour dépréciation des aménagements de bureaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15409, 'SYSCOHADA-CI', 'IMMO', '2937', 15403,
        'Provisions pour dépréciation des bâtiments industriels, agricoles et commerciaux mis en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15410, 'SYSCOHADA-CI', 'IMMO', '2938', 15403,
        'Provisions pour dépréciation des autres installations et agencements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15411, 'SYSCOHADA-CI', 'IMMO', '2939', 15403,
        'Provisions pour dépréciation des bâtiments et installations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15412, 'SYSCOHADA-CI', 'IMMO', '294', 15383, 'Provisions pour depreciation des materiels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15413, 'SYSCOHADA-CI', 'IMMO', '2941', 15412,
        'Provisions pour dépréciation du matériel et outillage industriel et commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15414, 'SYSCOHADA-CI', 'IMMO', '2942', 15412,
        'Provisions pour dépréciation du matériel et outillage agricole', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15415, 'SYSCOHADA-CI', 'IMMO', '2943', 15412,
        'Provisions pour dépréciation du matériel d''emballage récupérable et identifiable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15416, 'SYSCOHADA-CI', 'IMMO', '2944', 15412,
        'Provisions pour dépréciation du matériel et mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15417, 'SYSCOHADA-CI', 'IMMO', '2945', 15412,
        'Provisions pour dépréciation du matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15418, 'SYSCOHADA-CI', 'IMMO', '2946', 15412,
        'Provisions pour dépréciation des immobilisations animales et agricoles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15419, 'SYSCOHADA-CI', 'IMMO', '2947', 15412,
        'Provisions pour dépréciation des agencements et aménagements du matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15420, 'SYSCOHADA-CI', 'IMMO', '2948', 15412, 'Provisions pour dépréciation des autres matériels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15421, 'SYSCOHADA-CI', 'IMMO', '2949', 15412, 'Provisions pour dépréciation des matériels en cours',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15422, 'SYSCOHADA-CI', 'IMMO', '295', 15383,
        'Provisions pour depreciation des avances et acomptes verses sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15423, 'SYSCOHADA-CI', 'IMMO', '2951', 15422,
        'Provisions pour dépréciation des avances et acomptes versés sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15424, 'SYSCOHADA-CI', 'IMMO', '2952', 15422,
        'Provisions pour dépréciation des avances et acomptes versés sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15425, 'SYSCOHADA-CI', 'IMMO', '296', 15383,
        'Provisions pour dépréciation des titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15426, 'SYSCOHADA-CI', 'IMMO', '2961', 15425,
        'Provisions pour dépréciation des titres de participation dans des sociétés sous contrôle exclusif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15427, 'SYSCOHADA-CI', 'IMMO', '2962', 15425,
        'Provisions pour dépréciation des titres de participations dans les sociétés sous contrôle conjoint', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15428, 'SYSCOHADA-CI', 'IMMO', '2963', 15425,
        'Provisions pour dépréciation des titres de participations dans les sociétés confèrant une influence notable',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15429, 'SYSCOHADA-CI', 'IMMO', '2965', 15425,
        'Provisions pour dépréciation des participations dans les organismes professionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15430, 'SYSCOHADA-CI', 'IMMO', '2966', 15425,
        'Provisions pour dépréciation des parts dans des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15431, 'SYSCOHADA-CI', 'IMMO', '2968', 15425,
        'Provisions pour dépréciation des autres titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15432, 'SYSCOHADA-CI', 'IMMO', '297', 15383,
        'Provisions pour dépréciation des autres immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15433, 'SYSCOHADA-CI', 'IMMO', '2971', 15432,
        'Provisions pour dépréciation des prêts et créances non commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15434, 'SYSCOHADA-CI', 'IMMO', '2972', 15432, 'Provisions pour dépréciation des prêts du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15435, 'SYSCOHADA-CI', 'IMMO', '2973', 15432,
        'Provisions pour dépréciation des créances sur l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15436, 'SYSCOHADA-CI', 'IMMO', '2974', 15432, 'Provisions pour dépréciation des titres immobilisés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15437, 'SYSCOHADA-CI', 'IMMO', '2975', 15432,
        'Provisions pour dépréciation des dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15438, 'SYSCOHADA-CI', 'IMMO', '2977', 15432,
        'Provisions pour dépréciation des créances rattachées à des participations et avances à des g.i.e.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15439, 'SYSCOHADA-CI', 'IMMO', '2978', 15432,
        'Provisions pour dépréciation des créances financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15440, 'SYSCOHADA-CI', 'STOCK', '31', 0, 'Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15441, 'SYSCOHADA-CI', 'STOCK', '311', 15440, 'Marchandises a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15442, 'SYSCOHADA-CI', 'STOCK', '3111', 15441, 'Marchandises a1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15443, 'SYSCOHADA-CI', 'STOCK', '3112', 15441, 'Marchandises a2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15444, 'SYSCOHADA-CI', 'STOCK', '312', 15440, 'Marchandises b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15445, 'SYSCOHADA-CI', 'STOCK', '3121', 15444, 'Marchandises b1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15446, 'SYSCOHADA-CI', 'STOCK', '3122', 15444, 'Marchandises b2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15447, 'SYSCOHADA-CI', 'STOCK', '318', 15440, 'Marchandises hors activites ordinaires (h.a.o.)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15448, 'SYSCOHADA-CI', 'STOCK', '32', 0, 'Matieres premieres et fournitures liees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15449, 'SYSCOHADA-CI', 'STOCK', '321', 15448, 'Matieres a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15450, 'SYSCOHADA-CI', 'STOCK', '322', 15448, 'Matieres b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15451, 'SYSCOHADA-CI', 'STOCK', '323', 15448, 'Fournitures (a,b)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15452, 'SYSCOHADA-CI', 'STOCK', '33', 0, 'Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15453, 'SYSCOHADA-CI', 'STOCK', '331', 15452, 'Matieres consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15454, 'SYSCOHADA-CI', 'STOCK', '332', 15452, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15455, 'SYSCOHADA-CI', 'STOCK', '333', 15452, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15456, 'SYSCOHADA-CI', 'STOCK', '334', 15452, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15457, 'SYSCOHADA-CI', 'STOCK', '335', 15452, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15458, 'SYSCOHADA-CI', 'STOCK', '3351', 15457, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15459, 'SYSCOHADA-CI', 'STOCK', '3352', 15457, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15460, 'SYSCOHADA-CI', 'STOCK', '3353', 15457, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15461, 'SYSCOHADA-CI', 'STOCK', '3358', 15457, 'Autres emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15462, 'SYSCOHADA-CI', 'STOCK', '338', 15452, 'Autres matieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15463, 'SYSCOHADA-CI', 'STOCK', '34', 0, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15464, 'SYSCOHADA-CI', 'STOCK', '341', 15463, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15465, 'SYSCOHADA-CI', 'STOCK', '3411', 15464, 'Produits en cours p1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15466, 'SYSCOHADA-CI', 'STOCK', '3412', 15464, 'Produits en cours p2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15467, 'SYSCOHADA-CI', 'STOCK', '342', 15463, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15468, 'SYSCOHADA-CI', 'STOCK', '3421', 15467, 'Travaux en cours t1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15469, 'SYSCOHADA-CI', 'STOCK', '3422', 15467, 'Travaux en cours t2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15470, 'SYSCOHADA-CI', 'STOCK', '343', 15463, 'Produits intermediaires en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15471, 'SYSCOHADA-CI', 'STOCK', '3431', 15470, 'Produits intermédiaires a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15472, 'SYSCOHADA-CI', 'STOCK', '3432', 15470, 'Produits intermédiaires b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15473, 'SYSCOHADA-CI', 'STOCK', '344', 15463, 'Produits residuels en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15474, 'SYSCOHADA-CI', 'STOCK', '3441', 15473, 'Produits résiduels a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15475, 'SYSCOHADA-CI', 'STOCK', '3442', 15473, 'Produits résiduels b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15476, 'SYSCOHADA-CI', 'STOCK', '35', 0, 'Services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15477, 'SYSCOHADA-CI', 'STOCK', '351', 15476, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15478, 'SYSCOHADA-CI', 'STOCK', '3511', 15477, 'Etudes en cours e1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15479, 'SYSCOHADA-CI', 'STOCK', '3512', 15477, 'Etudes en cours e2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15480, 'SYSCOHADA-CI', 'STOCK', '352', 15476, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15481, 'SYSCOHADA-CI', 'STOCK', '3521', 15480, 'Prestations de services s1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15482, 'SYSCOHADA-CI', 'STOCK', '3522', 15480, 'Prestations de services s2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15483, 'SYSCOHADA-CI', 'STOCK', '36', 0, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15484, 'SYSCOHADA-CI', 'STOCK', '361', 15483, 'Produits a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15485, 'SYSCOHADA-CI', 'STOCK', '362', 15483, 'Produits b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15486, 'SYSCOHADA-CI', 'STOCK', '37', 0, 'Produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15487, 'SYSCOHADA-CI', 'STOCK', '371', 15486, 'Produits intermediaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15488, 'SYSCOHADA-CI', 'STOCK', '3711', 15487, 'Produits intermédiaires a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15489, 'SYSCOHADA-CI', 'STOCK', '3712', 15487, 'Produits intermédiaires b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15490, 'SYSCOHADA-CI', 'STOCK', '372', 15486, 'Produits residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15491, 'SYSCOHADA-CI', 'STOCK', '3721', 15490, 'Déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15492, 'SYSCOHADA-CI', 'STOCK', '3722', 15490, 'Rebuts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15493, 'SYSCOHADA-CI', 'STOCK', '3723', 15490, 'Matières de récupération', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15494, 'SYSCOHADA-CI', 'STOCK', '38', 0, 'Stocks en cours de route, en consignation ou en depot',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15495, 'SYSCOHADA-CI', 'STOCK', '381', 15494, 'Marchandises en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15496, 'SYSCOHADA-CI', 'STOCK', '382', 15494,
        'Matieres premieres et fournitures liees en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15497, 'SYSCOHADA-CI', 'STOCK', '383', 15494, 'Autres approvisionnements en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15498, 'SYSCOHADA-CI', 'STOCK', '386', 15494, 'Produits finis en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15499, 'SYSCOHADA-CI', 'STOCK', '387', 15494, 'Stocks en consignation ou en depot', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15500, 'SYSCOHADA-CI', 'STOCK', '3871', 15499, 'Stock en consignation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15501, 'SYSCOHADA-CI', 'STOCK', '3872', 15499, 'Stock en dépôt', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15502, 'SYSCOHADA-CI', 'STOCK', '388', 15494,
        'Stock provenant d''immobilisations mises hors service ou au rebut', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15503, 'SYSCOHADA-CI', 'STOCK', '39', 0, 'Depreciation des stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15504, 'SYSCOHADA-CI', 'STOCK', '391', 15503, 'Depreciation des stoks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15505, 'SYSCOHADA-CI', 'STOCK', '392', 15503,
        'Depreciation des stoks de matieres premieres et fournitures liees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15506, 'SYSCOHADA-CI', 'STOCK', '393', 15503,
        'Depreciation des stocks d''autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15507, 'SYSCOHADA-CI', 'STOCK', '394', 15503, 'Depreciations des productions en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15508, 'SYSCOHADA-CI', 'STOCK', '395', 15503, 'Depreciations des services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15509, 'SYSCOHADA-CI', 'STOCK', '396', 15503, 'Depreciation des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15510, 'SYSCOHADA-CI', 'STOCK', '397', 15503,
        'Depreciation des stocks de produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15511, 'SYSCOHADA-CI', 'STOCK', '398', 15503,
        'Depreciation des stocks en cours de route, en consignation ou en depot', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15512, 'SYSCOHADA-CI', 'THIRDPARTY', '4', 0, 'Fournisseurs et comptes rattaches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15513, 'SYSCOHADA-CI', 'THIRDPARTY', '401', 15512, 'Fournisseurs,  dettes en comptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15514, 'SYSCOHADA-CI', 'THIRDPARTY', '4011', 15513, 'Fournisseurs  locaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15515, 'SYSCOHADA-CI', 'THIRDPARTY', '4012', 15513, 'Fournisseurs groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15516, 'SYSCOHADA-CI', 'THIRDPARTY', '4013', 15513, 'Fournisseurs sous-traitants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15517, 'SYSCOHADA-CI', 'THIRDPARTY', '4017', 15513, 'Fournisseurs retenue  de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15518, 'SYSCOHADA-CI', 'THIRDPARTY', '402', 15512, 'Fournisseurs, effets a payer (e.a.p)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15519, 'SYSCOHADA-CI', 'THIRDPARTY', '4021', 15518, 'Fournisseurs, effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15520, 'SYSCOHADA-CI', 'THIRDPARTY', '4022', 15518, 'Fournisseurs-groupe, effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15521, 'SYSCOHADA-CI', 'THIRDPARTY', '4023', 15518, 'Fournisseurs sous-traitants effets à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15522, 'SYSCOHADA-CI', 'THIRDPARTY', '408', 15512, 'Fournisseurs, factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15523, 'SYSCOHADA-CI', 'THIRDPARTY', '4081', 15522, 'Fournisseurs factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15524, 'SYSCOHADA-CI', 'THIRDPARTY', '4082', 15522, 'Fournisseurs - groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15525, 'SYSCOHADA-CI', 'THIRDPARTY', '4083', 15522, 'Fournisseurs sous-traitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15526, 'SYSCOHADA-CI', 'THIRDPARTY', '4086', 15522, 'Fournisseurs, intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15527, 'SYSCOHADA-CI', 'THIRDPARTY', '409', 15512, 'Fournisseurs debiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15528, 'SYSCOHADA-CI', 'THIRDPARTY', '4091', 15527, 'Fournisseurs avances et acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15529, 'SYSCOHADA-CI', 'THIRDPARTY', '4092', 15527,
        'Fournisseurs - groupe avances et acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15530, 'SYSCOHADA-CI', 'THIRDPARTY', '4093', 15527,
        'Fournisseurs sous-traitants avances et acompte versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15531, 'SYSCOHADA-CI', 'THIRDPARTY', '4094', 15527,
        'Fournisseurs créances pour emballages et matériels à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15532, 'SYSCOHADA-CI', 'THIRDPARTY', '4098', 15527,
        'Rabais, remises, ristournes et autres avoirs à obtenir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15533, 'SYSCOHADA-CI', 'THIRDPARTY', '41', 15512, 'Clients et compte rattaches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15534, 'SYSCOHADA-CI', 'THIRDPARTY', '411', 15533, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15535, 'SYSCOHADA-CI', 'THIRDPARTY', '4111', 15534, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15536, 'SYSCOHADA-CI', 'THIRDPARTY', '4112', 15534, 'Clients-groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15537, 'SYSCOHADA-CI', 'THIRDPARTY', '4114', 15534, 'Clients, état et collectivités publiques',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15538, 'SYSCOHADA-CI', 'THIRDPARTY', '4115', 15534, 'Clients, organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15539, 'SYSCOHADA-CI', 'THIRDPARTY', '4117', 15534, 'Clients, retenues de garanti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15540, 'SYSCOHADA-CI', 'THIRDPARTY', '4118', 15534,
        'Clients, dégrèvement de taxes sur la valeur ajoutée (t.v.a.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15541, 'SYSCOHADA-CI', 'THIRDPARTY', '412', 15533, 'Clients, effets a recevoir en portefeuille',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15542, 'SYSCOHADA-CI', 'THIRDPARTY', '4121', 15541, 'Clients, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15543, 'SYSCOHADA-CI', 'THIRDPARTY', '4122', 15541, 'Clients-groupe, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15544, 'SYSCOHADA-CI', 'THIRDPARTY', '4124', 15541,
        'Etat et collectivités publiques, effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15545, 'SYSCOHADA-CI', 'THIRDPARTY', '4125', 15541, 'Oganismes internationaux, effets à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15546, 'SYSCOHADA-CI', 'THIRDPARTY', '414', 15533, 'Créances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15547, 'SYSCOHADA-CI', 'THIRDPARTY', '4141', 15546, 'Créances en compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15548, 'SYSCOHADA-CI', 'THIRDPARTY', '4142', 15546, 'Effet à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15549, 'SYSCOHADA-CI', 'THIRDPARTY', '415', 15533, 'Clients, effets escomptes non echus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15550, 'SYSCOHADA-CI', 'THIRDPARTY', '416', 15533, 'Creances clients litigieuses ou douteuses',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15551, 'SYSCOHADA-CI', 'THIRDPARTY', '4161', 15550, 'Créances litigieuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15552, 'SYSCOHADA-CI', 'THIRDPARTY', '4162', 15550, 'Créances douteuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15553, 'SYSCOHADA-CI', 'THIRDPARTY', '418', 15533, 'Clients, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15554, 'SYSCOHADA-CI', 'THIRDPARTY', '4181', 15553, 'Clients, factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15555, 'SYSCOHADA-CI', 'THIRDPARTY', '4186', 15553, 'Clients, intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15556, 'SYSCOHADA-CI', 'THIRDPARTY', '419', 15533, 'Clients crediteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15557, 'SYSCOHADA-CI', 'THIRDPARTY', '4191', 15556, 'Clients, avances et acompte reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15558, 'SYSCOHADA-CI', 'THIRDPARTY', '4192', 15556, 'Client - groupe, avances et acomptes reçus',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15559, 'SYSCOHADA-CI', 'THIRDPARTY', '4194', 15556,
        'Clients, dettes pour emballages et matériels consignés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15560, 'SYSCOHADA-CI', 'THIRDPARTY', '4198', 15556,
        'Rabais, remises, ristournes et autres avoirs à accorder', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15561, 'SYSCOHADA-CI', 'THIRDPARTY', '42', 15512, 'Personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15562, 'SYSCOHADA-CI', 'THIRDPARTY', '421', 15561, 'Personnel, avanceqs et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15563, 'SYSCOHADA-CI', 'THIRDPARTY', '4211', 15562, 'Personnel, avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15564, 'SYSCOHADA-CI', 'THIRDPARTY', '4212', 15562, 'Personnel, acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15565, 'SYSCOHADA-CI', 'THIRDPARTY', '4213', 15562, 'Frais avancés et fournitures au personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15566, 'SYSCOHADA-CI', 'THIRDPARTY', '422', 15561, 'Personnel, remunerations due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15567, 'SYSCOHADA-CI', 'THIRDPARTY', '4221', 15566, 'Personnel rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15568, 'SYSCOHADA-CI', 'THIRDPARTY', '4222', 15566, 'Personnel arrondis de paie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15569, 'SYSCOHADA-CI', 'THIRDPARTY', '423', 15561, 'Personnel, oppositions, saisie-arrets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15570, 'SYSCOHADA-CI', 'THIRDPARTY', '4231', 15569, 'Personnel, oppositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15571, 'SYSCOHADA-CI', 'THIRDPARTY', '4232', 15569, 'Personnel, saisie arrêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15572, 'SYSCOHADA-CI', 'THIRDPARTY', '4233', 15569, 'Personnel, avis à tiers détenteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15573, 'SYSCOHADA-CI', 'THIRDPARTY', '424', 15561, 'Personnel, oeuvres sociales internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15574, 'SYSCOHADA-CI', 'THIRDPARTY', '4241', 15573, 'Assistance médicale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15575, 'SYSCOHADA-CI', 'THIRDPARTY', '4242', 15573, 'Allocations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15576, 'SYSCOHADA-CI', 'THIRDPARTY', '4245', 15573, 'Organisme sociaux rattachés à l''entreprise',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15577, 'SYSCOHADA-CI', 'THIRDPARTY', '4248', 15573, 'Autres oeuvres sociales internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15578, 'SYSCOHADA-CI', 'THIRDPARTY', '425', 15561, 'Representants du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15579, 'SYSCOHADA-CI', 'THIRDPARTY', '4251', 15578, 'Délégués du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15580, 'SYSCOHADA-CI', 'THIRDPARTY', '4252', 15578,
        'Syndicats et comités d''entreprises, d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15581, 'SYSCOHADA-CI', 'THIRDPARTY', '4258', 15578, 'Autres représentatants du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15582, 'SYSCOHADA-CI', 'THIRDPARTY', '426', 15561, 'Personnel, participation aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15583, 'SYSCOHADA-CI', 'THIRDPARTY', '427', 15561, 'Personnel-depots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15584, 'SYSCOHADA-CI', 'THIRDPARTY', '428', 15561,
        'Personnel, charges a payer et produits a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15585, 'SYSCOHADA-CI', 'THIRDPARTY', '4281', 15584, 'Dettes provisionnées pour congés à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15586, 'SYSCOHADA-CI', 'THIRDPARTY', '4286', 15584, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15587, 'SYSCOHADA-CI', 'THIRDPARTY', '4287', 15584, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15588, 'SYSCOHADA-CI', 'THIRDPARTY', '43', 15512, 'Organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15589, 'SYSCOHADA-CI', 'THIRDPARTY', '431', 15588, 'Securite sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15590, 'SYSCOHADA-CI', 'THIRDPARTY', '4311', 15589, 'Prestations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15591, 'SYSCOHADA-CI', 'THIRDPARTY', '4312', 15589, 'Accidents de travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15592, 'SYSCOHADA-CI', 'THIRDPARTY', '4313', 15589, 'Caisse de retraite obligatoire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15593, 'SYSCOHADA-CI', 'THIRDPARTY', '4314', 15589, 'Caisse de retraite facultative', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15594, 'SYSCOHADA-CI', 'THIRDPARTY', '4318', 15589, 'Autres cotisations sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15595, 'SYSCOHADA-CI', 'THIRDPARTY', '432', 15588, 'Caisse de retraite complementaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15596, 'SYSCOHADA-CI', 'THIRDPARTY', '433', 15588, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15597, 'SYSCOHADA-CI', 'THIRDPARTY', '4331', 15596, 'Mutuelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15598, 'SYSCOHADA-CI', 'THIRDPARTY', '438', 15588,
        'Organismes sociaux, charges a payer et produits a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15599, 'SYSCOHADA-CI', 'THIRDPARTY', '4381', 15598, 'Charges sociales sur gratifications à payer',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15600, 'SYSCOHADA-CI', 'THIRDPARTY', '4382', 15598, 'Charges sociales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15601, 'SYSCOHADA-CI', 'THIRDPARTY', '4386', 15598, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15602, 'SYSCOHADA-CI', 'THIRDPARTY', '4387', 15598, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15603, 'SYSCOHADA-CI', 'THIRDPARTY', '44', 15512, 'Etat et collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15604, 'SYSCOHADA-CI', 'THIRDPARTY', '441', 15603, 'Etat,impot sur les benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15605, 'SYSCOHADA-CI', 'THIRDPARTY', '442', 15603, 'Etat, autres impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15606, 'SYSCOHADA-CI', 'THIRDPARTY', '4421', 15606, 'Impôts et taxes d''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15607, 'SYSCOHADA-CI', 'THIRDPARTY', '4422', 15606,
        'Impôts et taxes sur les collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15608, 'SYSCOHADA-CI', 'THIRDPARTY', '4423', 15606,
        'Impôts et taxes recouvrables sur des obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15609, 'SYSCOHADA-CI', 'THIRDPARTY', '4424', 15606, 'Impôts et taxes recouvrables sur des associés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15610, 'SYSCOHADA-CI', 'THIRDPARTY', '4426', 15606, 'Droits de douane', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15611, 'SYSCOHADA-CI', 'THIRDPARTY', '4428', 15606, 'Autres impôts et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15612, 'SYSCOHADA-CI', 'THIRDPARTY', '443', 15603, 'Etat, t.v.a. facturee', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15613, 'SYSCOHADA-CI', 'THIRDPARTY', '4431', 15612, 'T.v.a. facturée sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15614, 'SYSCOHADA-CI', 'THIRDPARTY', '4432', 15612, 'T.v.a. facturée sur prestations de service',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15615, 'SYSCOHADA-CI', 'THIRDPARTY', '4433', 15612, 'T.v.a. facturée sur travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15616, 'SYSCOHADA-CI', 'THIRDPARTY', '4434', 15612,
        'T.v.a. facturée sur production livrée à soi-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15617, 'SYSCOHADA-CI', 'THIRDPARTY', '4435', 15612, 'T.v.a. sur factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15618, 'SYSCOHADA-CI', 'THIRDPARTY', '444', 15603, 'Etat, t.v.a. due ou credit de t.v.a.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15619, 'SYSCOHADA-CI', 'THIRDPARTY', '4441', 15618, 'Etat, t.v.a. due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15620, 'SYSCOHADA-CI', 'THIRDPARTY', '4449', 15618, 'Etat, crédit de t.v.a. à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15621, 'SYSCOHADA-CI', 'THIRDPARTY', '445', 15603, 'Etat, t.v.a. recuperable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15622, 'SYSCOHADA-CI', 'THIRDPARTY', '4451', 15621, 'T.v.a. récupérable sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15623, 'SYSCOHADA-CI', 'THIRDPARTY', '4452', 15621, 'T.v.a. récupérable sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15624, 'SYSCOHADA-CI', 'THIRDPARTY', '4453', 15621, 'T.v.a. récupérable sur transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15625, 'SYSCOHADA-CI', 'THIRDPARTY', '4454', 15621,
        'T.v.a. récupérable sur services extérieurs et autres charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15626, 'SYSCOHADA-CI', 'THIRDPARTY', '4455', 15621, 'T.v.a. récupérable sur factures non parvenues',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15627, 'SYSCOHADA-CI', 'THIRDPARTY', '4456', 15621, 'T.v.a. transférée par d''autres entreprises',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15628, 'SYSCOHADA-CI', 'THIRDPARTY', '446', 15603, 'Etat, autres taxes sur le chiffre d''affaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15629, 'SYSCOHADA-CI', 'THIRDPARTY', '447', 15603, 'Etat, impots retenus a la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15630, 'SYSCOHADA-CI', 'THIRDPARTY', '4471', 15629, 'Impôt général sur le revenu', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15631, 'SYSCOHADA-CI', 'THIRDPARTY', '4472', 15629, 'Impôts sur salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15632, 'SYSCOHADA-CI', 'THIRDPARTY', '4473', 15629, 'Contribution nationale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15633, 'SYSCOHADA-CI', 'THIRDPARTY', '4474', 15629, 'Contribution nationale de solidarité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15634, 'SYSCOHADA-CI', 'THIRDPARTY', '4478', 15629, 'Autres impôts et contributions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15635, 'SYSCOHADA-CI', 'THIRDPARTY', '448', 15603, 'Etat, charges a payer et produits a recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15636, 'SYSCOHADA-CI', 'THIRDPARTY', '4486', 15635, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15637, 'SYSCOHADA-CI', 'THIRDPARTY', '4487', 15635, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15638, 'SYSCOHADA-CI', 'THIRDPARTY', '449', 15603, 'Etats, creances et dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15639, 'SYSCOHADA-CI', 'THIRDPARTY', '4491', 15638, 'Etat, obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15640, 'SYSCOHADA-CI', 'THIRDPARTY', '4492', 15638, 'Etat, avances et acomptes versés sur impôts',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15641, 'SYSCOHADA-CI', 'THIRDPARTY', '4493', 15638, 'Etat, fonds de dotation à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15642, 'SYSCOHADA-CI', 'THIRDPARTY', '4494', 15638, 'Etat, subventions d''équipement à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15643, 'SYSCOHADA-CI', 'THIRDPARTY', '4495', 15638, 'Etat, subventions d''exploitation à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15644, 'SYSCOHADA-CI', 'THIRDPARTY', '4496', 15638, 'Etat, subventions d''équilibre à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15645, 'SYSCOHADA-CI', 'THIRDPARTY', '4499', 15638, 'Etat, fond réglementé provisionné', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15646, 'SYSCOHADA-CI', 'THIRDPARTY', '45', 15512, 'Organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15647, 'SYSCOHADA-CI', 'THIRDPARTY', '451', 15646, 'Operations avec les organismes africains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15648, 'SYSCOHADA-CI', 'THIRDPARTY', '452', 15646,
        'Operations avec les autres organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15649, 'SYSCOHADA-CI', 'THIRDPARTY', '458', 15646,
        'Organismes internationaux, fonds de dotation et subventions a recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15650, 'SYSCOHADA-CI', 'THIRDPARTY', '4581', 15649,
        'Organismes internationaux, fonds de dotation à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15651, 'SYSCOHADA-CI', 'THIRDPARTY', '4582', 15649,
        'Organismes internationaux, subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15652, 'SYSCOHADA-CI', 'THIRDPARTY', '46', 15512, 'Associes-groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15653, 'SYSCOHADA-CI', 'THIRDPARTY', '461', 15652, 'Associes, operations sur le capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15654, 'SYSCOHADA-CI', 'THIRDPARTY', '4611', 15653, 'Associés apport en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15655, 'SYSCOHADA-CI', 'THIRDPARTY', '4612', 15653, 'Associés apport en numéraire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15656, 'SYSCOHADA-CI', 'THIRDPARTY', '4613', 15653,
        'Actionnaires, capital souscrit appelé non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15657, 'SYSCOHADA-CI', 'THIRDPARTY', '4614', 15653, 'Associés, capital appelé non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15658, 'SYSCOHADA-CI', 'THIRDPARTY', '4615', 15653,
        'Associés, versements reçus sur augmentation de capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15659, 'SYSCOHADA-CI', 'THIRDPARTY', '4616', 15653, 'Associés, versements anticipés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15660, 'SYSCOHADA-CI', 'THIRDPARTY', '4617', 15653, 'Actionnaires défaillants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15661, 'SYSCOHADA-CI', 'THIRDPARTY', '4618', 15653, 'Associés, autres apports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15662, 'SYSCOHADA-CI', 'THIRDPARTY', '4619', 15653, 'Associés, capital à rembourser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15663, 'SYSCOHADA-CI', 'THIRDPARTY', '462', 15652, 'Associes, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15664, 'SYSCOHADA-CI', 'THIRDPARTY', '4621', 15663, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15665, 'SYSCOHADA-CI', 'THIRDPARTY', '4626', 15663, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15666, 'SYSCOHADA-CI', 'THIRDPARTY', '463', 15652, 'Associes, operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15667, 'SYSCOHADA-CI', 'THIRDPARTY', '465', 15652, 'Associes, dividendes a payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15668, 'SYSCOHADA-CI', 'THIRDPARTY', '466', 15652, 'Groupe, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15669, 'SYSCOHADA-CI', 'THIRDPARTY', '467', 15652, 'Actionnaires, restant dû sur capital appele',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15670, 'SYSCOHADA-CI', 'THIRDPARTY', '47', 15512, 'Debiteurs et crediteur divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15671, 'SYSCOHADA-CI', 'THIRDPARTY', '471', 15670, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15672, 'SYSCOHADA-CI', 'THIRDPARTY', '4711', 15671, 'Débiteurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15673, 'SYSCOHADA-CI', 'THIRDPARTY', '4712', 15671, 'Créditeurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15674, 'SYSCOHADA-CI', 'THIRDPARTY', '4713', 15671, 'Obligataires, comptes de souscription', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15675, 'SYSCOHADA-CI', 'THIRDPARTY', '472', 15670,
        'Versements restant a effectuer sur titres non liberes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15676, 'SYSCOHADA-CI', 'THIRDPARTY', '4726', 15675, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15677, 'SYSCOHADA-CI', 'THIRDPARTY', '4727', 15675, 'Titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15678, 'SYSCOHADA-CI', 'THIRDPARTY', '4728', 15675, 'Titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15679, 'SYSCOHADA-CI', 'THIRDPARTY', '474', 15670,
        'Repartition periodique des charges et des produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15680, 'SYSCOHADA-CI', 'THIRDPARTY', '4746', 15679, 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15681, 'SYSCOHADA-CI', 'THIRDPARTY', '4747', 15679, 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15682, 'SYSCOHADA-CI', 'THIRDPARTY', '475', 15670, 'Creances sur travaux non encore facturables',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15683, 'SYSCOHADA-CI', 'THIRDPARTY', '476', 15670, 'Charges constatees d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15684, 'SYSCOHADA-CI', 'THIRDPARTY', '477', 15670, 'Produits constates d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15685, 'SYSCOHADA-CI', 'THIRDPARTY', '478', 15670, 'Ecarts de conversion actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15686, 'SYSCOHADA-CI', 'THIRDPARTY', '4781', 15685, 'Diminution des créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15687, 'SYSCOHADA-CI', 'THIRDPARTY', '4782', 15685, 'Augmentation des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15688, 'SYSCOHADA-CI', 'THIRDPARTY', '4788', 15685,
        'Différences compensées par couverture de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15689, 'SYSCOHADA-CI', 'THIRDPARTY', '479', 15670, 'Ecarts de conversion passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15690, 'SYSCOHADA-CI', 'THIRDPARTY', '4791', 15689, 'Augmentation de créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15691, 'SYSCOHADA-CI', 'THIRDPARTY', '4792', 15689, 'Diminution des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15692, 'SYSCOHADA-CI', 'THIRDPARTY', '4798', 15689,
        'Différences compensées par couverture de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15693, 'SYSCOHADA-CI', 'THIRDPARTY', '48', 15512,
        'Creances et dettes hors activites ordinaires (hao)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15694, 'SYSCOHADA-CI', 'THIRDPARTY', '481', 15693, 'Fournisseurs d''investissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15695, 'SYSCOHADA-CI', 'THIRDPARTY', '4811', 15694, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15696, 'SYSCOHADA-CI', 'THIRDPARTY', '4812', 15694, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15697, 'SYSCOHADA-CI', 'THIRDPARTY', '4817', 15694, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15698, 'SYSCOHADA-CI', 'THIRDPARTY', '4818', 15694, 'Factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15699, 'SYSCOHADA-CI', 'THIRDPARTY', '482', 15693,
        'Fournisseurs d''investissements, effets a payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15700, 'SYSCOHADA-CI', 'THIRDPARTY', '483', 15693, 'Dettes sur acquisition de titres de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15701, 'SYSCOHADA-CI', 'THIRDPARTY', '484', 15693,
        'Autres dettes hors activites ordinaires (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15702, 'SYSCOHADA-CI', 'THIRDPARTY', '485', 15693, 'Creances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15703, 'SYSCOHADA-CI', 'THIRDPARTY', '4851', 15702, 'En compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15704, 'SYSCOHADA-CI', 'THIRDPARTY', '4852', 15702, 'Effet à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15705, 'SYSCOHADA-CI', 'THIRDPARTY', '4855', 15702,
        'Créances sur cessions immobilisations effets escomptés et non échus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15706, 'SYSCOHADA-CI', 'THIRDPARTY', '4857', 15702, 'Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15707, 'SYSCOHADA-CI', 'THIRDPARTY', '4858', 15702, 'Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15708, 'SYSCOHADA-CI', 'THIRDPARTY', '486', 15693, 'Creances sur cessions de titre de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15709, 'SYSCOHADA-CI', 'THIRDPARTY', '488', 15693,
        'Autres creances hors activites ordinaires (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15710, 'SYSCOHADA-CI', 'THIRDPARTY', '49', 15512, 'Depreciations des comptes fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15711, 'SYSCOHADA-CI', 'THIRDPARTY', '491', 15710, 'Depreciations des comptes clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15712, 'SYSCOHADA-CI', 'THIRDPARTY', '4911', 15711, 'Créances litigieuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15713, 'SYSCOHADA-CI', 'THIRDPARTY', '4912', 15711, 'Créances douteuses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15714, 'SYSCOHADA-CI', 'THIRDPARTY', '492', 15710, 'Depreciations des comptes personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15715, 'SYSCOHADA-CI', 'THIRDPARTY', '493', 15710, 'Depreciations des comptes organismes sociaux',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15716, 'SYSCOHADA-CI', 'THIRDPARTY', '494', 15710,
        'Depreciations des comptes etats et collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15717, 'SYSCOHADA-CI', 'THIRDPARTY', '495', 15710,
        'Depreciations des comptes organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15718, 'SYSCOHADA-CI', 'THIRDPARTY', '496', 15710, 'Depreciations des comptes associes et groupe',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15719, 'SYSCOHADA-CI', 'THIRDPARTY', '4962', 15718, 'Associés, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15720, 'SYSCOHADA-CI', 'THIRDPARTY', '4963', 15718, 'Associés, opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15721, 'SYSCOHADA-CI', 'THIRDPARTY', '4966', 15718, 'Groupe, comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15722, 'SYSCOHADA-CI', 'THIRDPARTY', '497', 15710, 'Depreciations des comptes debiteurs divers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15723, 'SYSCOHADA-CI', 'THIRDPARTY', '498', 15710, 'Depreciations des comptes de creances h.a.o.',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15724, 'SYSCOHADA-CI', 'THIRDPARTY', '4981', 15723, 'Créances sur cessions d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15725, 'SYSCOHADA-CI', 'THIRDPARTY', '4982', 15723, 'Créances sur cessions de titres de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15726, 'SYSCOHADA-CI', 'THIRDPARTY', '4983', 15723, 'Autres créances (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15727, 'SYSCOHADA-CI', 'THIRDPARTY', '499', 15710, 'Risques provisionnes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15728, 'SYSCOHADA-CI', 'THIRDPARTY', '4991', 15727, 'Sur opérations d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15729, 'SYSCOHADA-CI', 'THIRDPARTY', '4998', 15727, 'Sur opérations (h.a.o.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15730, 'SYSCOHADA-CI', 'FINAN', '5', 0, 'Titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15731, 'SYSCOHADA-CI', 'FINAN', '501', 15730, 'Titres du tresor et bon de caisse a court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15732, 'SYSCOHADA-CI', 'FINAN', '5011', 15731, 'Titres du trésor à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15733, 'SYSCOHADA-CI', 'FINAN', '5012', 15731, 'Titres d''organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15734, 'SYSCOHADA-CI', 'FINAN', '5013', 15731, 'Bons de caisse à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15735, 'SYSCOHADA-CI', 'FINAN', '502', 15730, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15736, 'SYSCOHADA-CI', 'FINAN', '5021', 15735, 'Actions propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15737, 'SYSCOHADA-CI', 'FINAN', '5022', 15735, 'Actions cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15738, 'SYSCOHADA-CI', 'FINAN', '5023', 15735, 'Actions non cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15739, 'SYSCOHADA-CI', 'FINAN', '5024', 15735,
        'Actions démembrées (certificats d''investissement; droits de vote)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15740, 'SYSCOHADA-CI', 'FINAN', '5025', 15735, 'Autres titres conférant un droit de propriété',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15741, 'SYSCOHADA-CI', 'FINAN', '503', 15730, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15742, 'SYSCOHADA-CI', 'FINAN', '5031', 15741,
        'Obligations émises par la société et rachetées par elle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15743, 'SYSCOHADA-CI', 'FINAN', '5032', 15741, 'Obligations cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15744, 'SYSCOHADA-CI', 'FINAN', '5033', 15741, 'Obligations non cotées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15745, 'SYSCOHADA-CI', 'FINAN', '5035', 15741, 'Autres titres conférant un droit de créance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15746, 'SYSCOHADA-CI', 'FINAN', '504', 15730, 'Bon de souscription', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15747, 'SYSCOHADA-CI', 'FINAN', '5042', 15746, 'Bons de souscription d''actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15748, 'SYSCOHADA-CI', 'FINAN', '5043', 15746, 'Bon de souscription d''obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15749, 'SYSCOHADA-CI', 'FINAN', '505', 15730, 'Titres negociables hors region', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15750, 'SYSCOHADA-CI', 'FINAN', '506', 15730, 'Interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15751, 'SYSCOHADA-CI', 'FINAN', '5061', 15750, 'Titres du trésor et bons de caisse à court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15752, 'SYSCOHADA-CI', 'FINAN', '5062', 15750, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15753, 'SYSCOHADA-CI', 'FINAN', '5063', 15750, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15754, 'SYSCOHADA-CI', 'FINAN', '508', 15730, 'Autres valeurs assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15755, 'SYSCOHADA-CI', 'FINAN', '51', 15730, 'Valeurs a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15756, 'SYSCOHADA-CI', 'FINAN', '511', 15755, 'Effets a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15757, 'SYSCOHADA-CI', 'FINAN', '512', 15755, 'Effets a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15758, 'SYSCOHADA-CI', 'FINAN', '513', 15755, 'Cheques a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15759, 'SYSCOHADA-CI', 'FINAN', '514', 15755, 'Cheques a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15760, 'SYSCOHADA-CI', 'FINAN', '515', 15755, 'Cartes de credit a encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15761, 'SYSCOHADA-CI', 'FINAN', '518', 15755, 'Autres valeurs a l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15762, 'SYSCOHADA-CI', 'FINAN', '5181', 15761, 'Warrants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15763, 'SYSCOHADA-CI', 'FINAN', '5182', 15761, 'Billets de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15764, 'SYSCOHADA-CI', 'FINAN', '5185', 15761, 'Chèque de voyage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15765, 'SYSCOHADA-CI', 'FINAN', '5186', 15761, 'Coupons échus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15766, 'SYSCOHADA-CI', 'FINAN', '5187', 15761, 'Intérêts échus des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15767, 'SYSCOHADA-CI', 'FINAN', '52', 15730, 'Banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15768, 'SYSCOHADA-CI', 'FINAN', '521', 15767, 'Banques locales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15769, 'SYSCOHADA-CI', 'FINAN', '5211', 15768, 'Banque x', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15770, 'SYSCOHADA-CI', 'FINAN', '5212', 15768, 'Banque y', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15771, 'SYSCOHADA-CI', 'FINAN', '522', 15767, 'Banques autres etats region', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15772, 'SYSCOHADA-CI', 'FINAN', '523', 15767, 'Banques autres etats zone monetaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15773, 'SYSCOHADA-CI', 'FINAN', '524', 15767, 'Banques hors zone monetaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15774, 'SYSCOHADA-CI', 'FINAN', '526', 15767, 'Banques, interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15775, 'SYSCOHADA-CI', 'FINAN', '5261', 15768, 'Banques, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15776, 'SYSCOHADA-CI', 'FINAN', '5267', 15768, 'Banques, intérêts courus, produits à recevoir',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15777, 'SYSCOHADA-CI', 'FINAN', '53', 15730, 'Etablissements financiers et assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15778, 'SYSCOHADA-CI', 'FINAN', '531', 15777, 'Cheques postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15779, 'SYSCOHADA-CI', 'FINAN', '532', 15777, 'Tresor', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15780, 'SYSCOHADA-CI', 'FINAN', '533', 15777, 'Societe de gestion et d''intermediation (s.g.i.)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15781, 'SYSCOHADA-CI', 'FINAN', '536', 15777, 'Etablissements financiers, interets courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15782, 'SYSCOHADA-CI', 'FINAN', '5361', 15781,
        'Etablissements financiers, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15783, 'SYSCOHADA-CI', 'FINAN', '5362', 15781,
        'Etablissements financiers, intérêts courus, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15784, 'SYSCOHADA-CI', 'FINAN', '538', 15777, 'Autres organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15785, 'SYSCOHADA-CI', 'FINAN', '54', 15730, 'Instruments de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15786, 'SYSCOHADA-CI', 'FINAN', '541', 15785, 'Options de taux d''interets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15787, 'SYSCOHADA-CI', 'FINAN', '542', 15785, 'Options de taux de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15788, 'SYSCOHADA-CI', 'FINAN', '543', 15785, 'Options de taux boursiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15789, 'SYSCOHADA-CI', 'FINAN', '544', 15785, 'Instruments de marches  a terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15790, 'SYSCOHADA-CI', 'FINAN', '545', 15785, 'Avoirs d''or et autres metaux precieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15791, 'SYSCOHADA-CI', 'FINAN', '56', 15730, 'Banques, credits de tresorerie et d''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15792, 'SYSCOHADA-CI', 'FINAN', '561', 15791, 'Credits de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15793, 'SYSCOHADA-CI', 'FINAN', '564', 15791, 'Escompte de credits de campagne', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15794, 'SYSCOHADA-CI', 'FINAN', '565', 15791, 'Escompte de credits ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15795, 'SYSCOHADA-CI', 'FINAN', '566', 15791, 'Banques, credits de tresorerie, interets courus',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15796, 'SYSCOHADA-CI', 'FINAN', '5661', 15795,
        'Banques, crédits de trésorerie, intérêts courus, charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15797, 'SYSCOHADA-CI', 'FINAN', '5667', 15795,
        'Banques, crédits de trésorerie, intérêts courus, produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15798, 'SYSCOHADA-CI', 'FINAN', '57', 15730, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15799, 'SYSCOHADA-CI', 'FINAN', '571', 15798, 'Caisse siege social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15800, 'SYSCOHADA-CI', 'FINAN', '5711', 15799, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15801, 'SYSCOHADA-CI', 'FINAN', '5712', 15799, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15802, 'SYSCOHADA-CI', 'FINAN', '572', 15798, 'Caisse succursale a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15803, 'SYSCOHADA-CI', 'FINAN', '5721', 15802, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15804, 'SYSCOHADA-CI', 'FINAN', '5722', 15802, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15805, 'SYSCOHADA-CI', 'FINAN', '573', 15798, 'Caisse succursale b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15806, 'SYSCOHADA-CI', 'FINAN', '5731', 15805, 'En unités monétaires légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15807, 'SYSCOHADA-CI', 'FINAN', '5732', 15805, 'En devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15808, 'SYSCOHADA-CI', 'FINAN', '58', 15730, 'Regies d''avances, accreditifs et virements internes',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15809, 'SYSCOHADA-CI', 'FINAN', '581', 15808, 'Regies d''avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15810, 'SYSCOHADA-CI', 'FINAN', '582', 15808, 'Accreditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15811, 'SYSCOHADA-CI', 'FINAN', '585', 15808, 'Virements de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15812, 'SYSCOHADA-CI', 'FINAN', '588', 15808, 'Autres virements internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15813, 'SYSCOHADA-CI', 'FINAN', '59', 15730, 'Depreciations des titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15814, 'SYSCOHADA-CI', 'FINAN', '591', 15813, 'Depreciations des titres et valeurs a encaisser',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15815, 'SYSCOHADA-CI', 'FINAN', '592', 15813, 'Depreciations des comptes banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15816, 'SYSCOHADA-CI', 'FINAN', '593', 15813,
        'Depreciations des comptes etablissements financiers et assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15817, 'SYSCOHADA-CI', 'FINAN', '594', 15813,
        'Depreciations des comptes d''instruments de tresorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15818, 'SYSCOHADA-CI', 'FINAN', '599', 15813, 'Risques provisionnes a caractere financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15819, 'SYSCOHADA-CI', 'EXPENSE', '6', 0, 'Achats et variations de stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15820, 'SYSCOHADA-CI', 'EXPENSE', '601', 15819, 'Achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15821, 'SYSCOHADA-CI', 'EXPENSE', '6011', 16820, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15822, 'SYSCOHADA-CI', 'EXPENSE', '6012', 16820, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15823, 'SYSCOHADA-CI', 'EXPENSE', '6013', 16820, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15824, 'SYSCOHADA-CI', 'EXPENSE', '6014', 16820, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15825, 'SYSCOHADA-CI', 'EXPENSE', '6019', 16820,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15826, 'SYSCOHADA-CI', 'EXPENSE', '602', 15819, 'Achats de matieres premieres et fournitures liees',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15827, 'SYSCOHADA-CI', 'EXPENSE', '6021', 15826, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15828, 'SYSCOHADA-CI', 'EXPENSE', '6022', 15826, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15829, 'SYSCOHADA-CI', 'EXPENSE', '6023', 15826, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15830, 'SYSCOHADA-CI', 'EXPENSE', '6024', 15826, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15831, 'SYSCOHADA-CI', 'EXPENSE', '6029', 15826,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15832, 'SYSCOHADA-CI', 'EXPENSE', '603', 15819, 'Variations des stocks et biens achetes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15833, 'SYSCOHADA-CI', 'EXPENSE', '6031', 15832, 'Variations des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15834, 'SYSCOHADA-CI', 'EXPENSE', '6032', 15832,
        'Variations des stocks de matiéres premiéres et fournitures liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15835, 'SYSCOHADA-CI', 'EXPENSE', '6033', 15832,
        'Variations des stocks d''autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15836, 'SYSCOHADA-CI', 'EXPENSE', '604', 15819,
        'Achats stockes de matieres et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15837, 'SYSCOHADA-CI', 'EXPENSE', '6041', 15836, 'Matiéres consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15838, 'SYSCOHADA-CI', 'EXPENSE', '6042', 15836, 'Matiéres combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15839, 'SYSCOHADA-CI', 'EXPENSE', '6043', 15836, 'Produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15840, 'SYSCOHADA-CI', 'EXPENSE', '6044', 15836, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15841, 'SYSCOHADA-CI', 'EXPENSE', '6046', 15836, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15842, 'SYSCOHADA-CI', 'EXPENSE', '6047', 15836, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15843, 'SYSCOHADA-CI', 'EXPENSE', '6049', 15836,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15844, 'SYSCOHADA-CI', 'EXPENSE', '605', 15819, 'Autres achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15845, 'SYSCOHADA-CI', 'EXPENSE', '6051', 15844, 'Fournitures non stockables - eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15846, 'SYSCOHADA-CI', 'EXPENSE', '6052', 15844, 'Fournitures non stockables - electricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15847, 'SYSCOHADA-CI', 'EXPENSE', '6053', 15844, 'Fournitures non stockables - autres énergies',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15848, 'SYSCOHADA-CI', 'EXPENSE', '6054', 15844, 'Fournitures d''entretien non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15849, 'SYSCOHADA-CI', 'EXPENSE', '6055', 15844, 'Fournitures de bureau non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15850, 'SYSCOHADA-CI', 'EXPENSE', '6056', 15844, 'Achats de petits matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15851, 'SYSCOHADA-CI', 'EXPENSE', '6057', 15844, 'Achats d''études et de prestations de services',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15852, 'SYSCOHADA-CI', 'EXPENSE', '6058', 15844, 'Achats de travaux, matériels et équipements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15853, 'SYSCOHADA-CI', 'EXPENSE', '6059', 15844,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15854, 'SYSCOHADA-CI', 'EXPENSE', '608', 15819, 'Achats d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15855, 'SYSCOHADA-CI', 'EXPENSE', '6081', 15854, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15856, 'SYSCOHADA-CI', 'EXPENSE', '6082', 15854, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15857, 'SYSCOHADA-CI', 'EXPENSE', '6083', 15854, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15858, 'SYSCOHADA-CI', 'EXPENSE', '6089', 15854,
        'Rabais, remises et ristournes obtenus (non ventilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15859, 'SYSCOHADA-CI', 'EXPENSE', '61', 15819, 'Transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15860, 'SYSCOHADA-CI', 'EXPENSE', '611', 15859, 'Transports sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15861, 'SYSCOHADA-CI', 'EXPENSE', '612', 15859, 'Transport sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15862, 'SYSCOHADA-CI', 'EXPENSE', '613', 15859, 'Transports pour le compte de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15863, 'SYSCOHADA-CI', 'EXPENSE', '614', 15859, 'Transports du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15864, 'SYSCOHADA-CI', 'EXPENSE', '616', 15859, 'Transports de plis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15865, 'SYSCOHADA-CI', 'EXPENSE', '618', 15859, 'Autres frais de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15866, 'SYSCOHADA-CI', 'EXPENSE', '6181', 15865, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15867, 'SYSCOHADA-CI', 'EXPENSE', '6182', 15865, 'Transports entre établissements ou chantiers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15868, 'SYSCOHADA-CI', 'EXPENSE', '6183', 15865, 'Transports administratifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15869, 'SYSCOHADA-CI', 'EXPENSE', '62', 15819, 'Services exterieurs a', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15870, 'SYSCOHADA-CI', 'EXPENSE', '621', 15869, 'Sous traitance generale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15871, 'SYSCOHADA-CI', 'EXPENSE', '622', 15869, 'Locations et charges locatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15872, 'SYSCOHADA-CI', 'EXPENSE', '6221', 15871, 'Locations de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15873, 'SYSCOHADA-CI', 'EXPENSE', '6222', 15871, 'Locations de bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15874, 'SYSCOHADA-CI', 'EXPENSE', '6223', 15871, 'Location de matériels et outillages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15875, 'SYSCOHADA-CI', 'EXPENSE', '6224', 15871, 'Malis sur emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15876, 'SYSCOHADA-CI', 'EXPENSE', '6225', 15871, 'Locations d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15877, 'SYSCOHADA-CI', 'EXPENSE', '6228', 15871, 'Locations et charges locatives diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15878, 'SYSCOHADA-CI', 'EXPENSE', '623', 15869, 'Redevances de credit bail et contrats assimiles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15879, 'SYSCOHADA-CI', 'EXPENSE', '6232', 15878, 'Crédits-bail immobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15880, 'SYSCOHADA-CI', 'EXPENSE', '6233', 15878, 'Crédits-bail mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15881, 'SYSCOHADA-CI', 'EXPENSE', '6235', 15878, 'Contrats assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15882, 'SYSCOHADA-CI', 'EXPENSE', '624', 15869, 'Entretiens, reparations et maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15883, 'SYSCOHADA-CI', 'EXPENSE', '6241', 15882, 'Entretien et réparation des biens immobiliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15884, 'SYSCOHADA-CI', 'EXPENSE', '6242', 15882, 'Entretien et réparation des biens mobiliers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15885, 'SYSCOHADA-CI', 'EXPENSE', '6243', 15882, 'Maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15886, 'SYSCOHADA-CI', 'EXPENSE', '6248', 15882, 'Autres entretiens et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15887, 'SYSCOHADA-CI', 'EXPENSE', '625', 15869, 'Primes d''assurance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15888, 'SYSCOHADA-CI', 'EXPENSE', '6251', 15887, 'Assurances multirisques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15889, 'SYSCOHADA-CI', 'EXPENSE', '6252', 15887, 'Assurances matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15890, 'SYSCOHADA-CI', 'EXPENSE', '6253', 15887, 'Assurances risques d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15891, 'SYSCOHADA-CI', 'EXPENSE', '6254', 15887, 'Assurances responsabilité du producteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15892, 'SYSCOHADA-CI', 'EXPENSE', '6255', 15887, 'Assurances insolvabilité clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15893, 'SYSCOHADA-CI', 'EXPENSE', '6256', 15887, 'Assurances transport sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15894, 'SYSCOHADA-CI', 'EXPENSE', '6257', 15887, 'Assurances transport sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15895, 'SYSCOHADA-CI', 'EXPENSE', '6258', 15887, 'Autres primes d''assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15896, 'SYSCOHADA-CI', 'EXPENSE', '626', 15869, 'Etudes, recherches et documentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15897, 'SYSCOHADA-CI', 'EXPENSE', '6261', 15896, 'Etudes et recherches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15898, 'SYSCOHADA-CI', 'EXPENSE', '6265', 15896, 'Documentation générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15899, 'SYSCOHADA-CI', 'EXPENSE', '6266', 15896, 'Documentation technique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15900, 'SYSCOHADA-CI', 'EXPENSE', '627', 15869, 'Publicite, publications, relations publiques',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15901, 'SYSCOHADA-CI', 'EXPENSE', '6271', 15900, 'Annonces, insertions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15902, 'SYSCOHADA-CI', 'EXPENSE', '6272', 15900, 'Catalogues, imprimés publicitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15903, 'SYSCOHADA-CI', 'EXPENSE', '6273', 15900, 'Echantillons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15904, 'SYSCOHADA-CI', 'EXPENSE', '6274', 15900, 'Foires et expositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15905, 'SYSCOHADA-CI', 'EXPENSE', '6275', 15900, 'Publications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15906, 'SYSCOHADA-CI', 'EXPENSE', '6276', 15900, 'Cadeaux à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15907, 'SYSCOHADA-CI', 'EXPENSE', '6277', 15900, 'Frais de colloques, séminaires, conférences',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15908, 'SYSCOHADA-CI', 'EXPENSE', '6278', 15900,
        'Autres charges de publicités et relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15909, 'SYSCOHADA-CI', 'EXPENSE', '628', 15869, 'Frais de telecommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15910, 'SYSCOHADA-CI', 'EXPENSE', '6281', 15909, 'Frais de téléphone', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15911, 'SYSCOHADA-CI', 'EXPENSE', '6282', 15909, 'Frais de télex', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15912, 'SYSCOHADA-CI', 'EXPENSE', '6283', 15909, 'Frais de télécopie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15913, 'SYSCOHADA-CI', 'EXPENSE', '6288', 15909, 'Autres frais de télécommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15914, 'SYSCOHADA-CI', 'EXPENSE', '63', 15819, 'Services exterieurs b', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15915, 'SYSCOHADA-CI', 'EXPENSE', '631', 15914, 'Frais bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15916, 'SYSCOHADA-CI', 'EXPENSE', '6311', 15915, 'Frais sur titre (achats, vente, garde)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15917, 'SYSCOHADA-CI', 'EXPENSE', '6312', 15915, 'Frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15918, 'SYSCOHADA-CI', 'EXPENSE', '6313', 15915, 'Locations de coffres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15919, 'SYSCOHADA-CI', 'EXPENSE', '6315', 15915, 'Commissions sur cartes de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15920, 'SYSCOHADA-CI', 'EXPENSE', '6316', 15915, 'Frais d''émission d''emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15921, 'SYSCOHADA-CI', 'EXPENSE', '6318', 15915, 'Autres frais bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15922, 'SYSCOHADA-CI', 'EXPENSE', '632', 15914, 'Remunerations d''intermediaires et de conseils',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15923, 'SYSCOHADA-CI', 'EXPENSE', '6321', 15922, 'Commissions et courtages sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15924, 'SYSCOHADA-CI', 'EXPENSE', '6322', 15922, 'Commissions et courtages sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15925, 'SYSCOHADA-CI', 'EXPENSE', '6323', 15922, 'Rémunérations des transitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15926, 'SYSCOHADA-CI', 'EXPENSE', '6324', 15922, 'Honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15927, 'SYSCOHADA-CI', 'EXPENSE', '6325', 15922, 'Frais d''actes et de contentieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15928, 'SYSCOHADA-CI', 'EXPENSE', '6328', 15922, 'Divers frais', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15929, 'SYSCOHADA-CI', 'EXPENSE', '633', 15914, 'Frais de formation du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15930, 'SYSCOHADA-CI', 'EXPENSE', '634', 15914,
        'Redevances pour brevets, licences, logiciels et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15931, 'SYSCOHADA-CI', 'EXPENSE', '6342', 15930,
        'Redevances pour brevets, licences, concessions et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15932, 'SYSCOHADA-CI', 'EXPENSE', '6343', 15930, 'Redevances pour logiciel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15933, 'SYSCOHADA-CI', 'EXPENSE', '6344', 15930, 'Redevances pour marques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15934, 'SYSCOHADA-CI', 'EXPENSE', '635', 15914, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15935, 'SYSCOHADA-CI', 'EXPENSE', '6351', 15934, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15936, 'SYSCOHADA-CI', 'EXPENSE', '6358', 15934, 'Concours divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15937, 'SYSCOHADA-CI', 'EXPENSE', '636', 15914,
        'Redevances verses au concedant (concessions service public)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15938, 'SYSCOHADA-CI', 'EXPENSE', '637', 15914,
        'Remunerations du personnel exterieur a l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15939, 'SYSCOHADA-CI', 'EXPENSE', '6371', 15938, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15940, 'SYSCOHADA-CI', 'EXPENSE', '6372', 15938, 'Personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15941, 'SYSCOHADA-CI', 'EXPENSE', '638', 15914, 'Autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15942, 'SYSCOHADA-CI', 'EXPENSE', '6381', 15941, 'Frais de recrutement du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15943, 'SYSCOHADA-CI', 'EXPENSE', '6382', 15941, 'Frais de déménagement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15944, 'SYSCOHADA-CI', 'EXPENSE', '6383', 15941, 'Réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15945, 'SYSCOHADA-CI', 'EXPENSE', '6384', 15941, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15946, 'SYSCOHADA-CI', 'EXPENSE', '64', 15819, 'Impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15947, 'SYSCOHADA-CI', 'EXPENSE', '641', 15946, 'Impots et taxes directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15948, 'SYSCOHADA-CI', 'EXPENSE', '6411', 15947, 'Impots fonciers et taxes annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15949, 'SYSCOHADA-CI', 'EXPENSE', '6412', 15947, 'Patentes, licences et taxes annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15950, 'SYSCOHADA-CI', 'EXPENSE', '6413', 15947, 'Taxes sur appointements et salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15951, 'SYSCOHADA-CI', 'EXPENSE', '6414', 15947, 'Taxes d''apprentissage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15952, 'SYSCOHADA-CI', 'EXPENSE', '6415', 15947, 'Formation professionnelle continue', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15953, 'SYSCOHADA-CI', 'EXPENSE', '6418', 15947, 'Autres impôts et taxes directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15954, 'SYSCOHADA-CI', 'EXPENSE', '645', 15946, 'Impots et taxes indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15955, 'SYSCOHADA-CI', 'EXPENSE', '646', 15946, 'Droits d''enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15956, 'SYSCOHADA-CI', 'EXPENSE', '6461', 15955, 'Droits de mutation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15957, 'SYSCOHADA-CI', 'EXPENSE', '6462', 15955, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15958, 'SYSCOHADA-CI', 'EXPENSE', '6463', 15955, 'Taxes sur les véhicules de société', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15959, 'SYSCOHADA-CI', 'EXPENSE', '6464', 15955, 'Vignettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15960, 'SYSCOHADA-CI', 'EXPENSE', '6468', 15955, 'Autres droits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15961, 'SYSCOHADA-CI', 'EXPENSE', '647', 15946, 'Penalites et amendes fiscales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15962, 'SYSCOHADA-CI', 'EXPENSE', '6471', 15961, 'Pénalités d''assiette, impots directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15963, 'SYSCOHADA-CI', 'EXPENSE', '6472', 15961, 'Pénalités d''assiette, impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15964, 'SYSCOHADA-CI', 'EXPENSE', '6473', 15961, 'Pénalités de recouvrement, impôts directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15965, 'SYSCOHADA-CI', 'EXPENSE', '6474', 15961, 'Pénalités de recouvrement, impôts indirects',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15966, 'SYSCOHADA-CI', 'EXPENSE', '6478', 15961, 'Autres amendes pénales et fiscales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15967, 'SYSCOHADA-CI', 'EXPENSE', '648', 15946, 'Autres impots et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15968, 'SYSCOHADA-CI', 'EXPENSE', '65', 15819, 'Autres charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15969, 'SYSCOHADA-CI', 'EXPENSE', '651', 15968, 'Pertes sur creances clients et autres debiteurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15970, 'SYSCOHADA-CI', 'EXPENSE', '6511', 15969, 'Pertes sur clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15971, 'SYSCOHADA-CI', 'EXPENSE', '6515', 15969, 'Autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15972, 'SYSCOHADA-CI', 'EXPENSE', '652', 15968,
        'Quote-part de resultat sur operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15973, 'SYSCOHADA-CI', 'EXPENSE', '6521', 15972,
        'Quote-part transféré de bénéfices (comptabilté du gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15974, 'SYSCOHADA-CI', 'EXPENSE', '6525', 15972,
        'Pertes imputées par transfert (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15975, 'SYSCOHADA-CI', 'EXPENSE', '653', 15968,
        'Quote-part de resultat annulee sur execution partielle de contrats pluri-exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15976, 'SYSCOHADA-CI', 'EXPENSE', '654', 15968,
        'Valeur comptable des cessions courantes d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15977, 'SYSCOHADA-CI', 'EXPENSE', '658', 15968, 'Charges diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15978, 'SYSCOHADA-CI', 'EXPENSE', '6581', 15977,
        'Jetons de présence et autres rémunérations d''administrateurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15979, 'SYSCOHADA-CI', 'EXPENSE', '6582', 15977, 'Dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15980, 'SYSCOHADA-CI', 'EXPENSE', '6583', 15977, 'Mécénat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15981, 'SYSCOHADA-CI', 'EXPENSE', '659', 15968, 'Charges provisionnees d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15982, 'SYSCOHADA-CI', 'EXPENSE', '6591', 15981, 'Sur risque à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15983, 'SYSCOHADA-CI', 'EXPENSE', '6593', 15981, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15984, 'SYSCOHADA-CI', 'EXPENSE', '6594', 15981, 'Sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15985, 'SYSCOHADA-CI', 'EXPENSE', '6598', 15981, 'Autres charges provisionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15986, 'SYSCOHADA-CI', 'EXPENSE', '66', 15819, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15987, 'SYSCOHADA-CI', 'EXPENSE', '661', 15986,
        'Remunerations directes versees au personnel national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15988, 'SYSCOHADA-CI', 'EXPENSE', '6611', 15987, 'Appointements salaires et commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15989, 'SYSCOHADA-CI', 'EXPENSE', '6612', 15987, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15990, 'SYSCOHADA-CI', 'EXPENSE', '6613', 15987, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15991, 'SYSCOHADA-CI', 'EXPENSE', '6614', 15987,
        'Indemnités de préavis, de licencement et de recherche d''embauche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15992, 'SYSCOHADA-CI', 'EXPENSE', '6615', 15987, 'Indemnités de maladie versées aux travailleurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15993, 'SYSCOHADA-CI', 'EXPENSE', '6616', 15987, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15994, 'SYSCOHADA-CI', 'EXPENSE', '6617', 15987, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15995, 'SYSCOHADA-CI', 'EXPENSE', '6618', 15987, 'Autres rémunérations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15996, 'SYSCOHADA-CI', 'EXPENSE', '662', 15986,
        'Remunerations directes versees au personnel non national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15997, 'SYSCOHADA-CI', 'EXPENSE', '6621', 15996, 'Appointements salaires et commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15998, 'SYSCOHADA-CI', 'EXPENSE', '6622', 15996, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15999, 'SYSCOHADA-CI', 'EXPENSE', '6623', 15996, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16000, 'SYSCOHADA-CI', 'EXPENSE', '6624', 15996,
        'Indemnités de préavis, de licencement et de recherche d''embauche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16001, 'SYSCOHADA-CI', 'EXPENSE', '6625', 15996, 'Indemnités de maladie versées aux travailleurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16002, 'SYSCOHADA-CI', 'EXPENSE', '6626', 15996, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16003, 'SYSCOHADA-CI', 'EXPENSE', '6627', 15996, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16004, 'SYSCOHADA-CI', 'EXPENSE', '6628', 15996, 'Autres rémunérations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16005, 'SYSCOHADA-CI', 'EXPENSE', '663', 15986, 'Indemnites forfaitaires versees au personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16006, 'SYSCOHADA-CI', 'EXPENSE', '6631', 16005, 'Indemnités de logement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16007, 'SYSCOHADA-CI', 'EXPENSE', '6632', 16005, 'Indemnités de représentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16008, 'SYSCOHADA-CI', 'EXPENSE', '6633', 16005, 'Indemnités d''expatriation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16009, 'SYSCOHADA-CI', 'EXPENSE', '6638', 16005, 'Autres indemnités et avantages divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16010, 'SYSCOHADA-CI', 'EXPENSE', '664', 15986, 'Charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16011, 'SYSCOHADA-CI', 'EXPENSE', '6641', 16010,
        'Charges sociales sur rémunération du personnel national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16012, 'SYSCOHADA-CI', 'EXPENSE', '6642', 16010,
        'Charges sociales sur rémunération du personnel non national', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16013, 'SYSCOHADA-CI', 'EXPENSE', '666', 15986,
        'Remunerations et charges sociales de l''exploitant individuel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16014, 'SYSCOHADA-CI', 'EXPENSE', '6661', 16013, 'Rémunérations du travail de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16015, 'SYSCOHADA-CI', 'EXPENSE', '6662', 16013, 'Charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16016, 'SYSCOHADA-CI', 'EXPENSE', '667', 15986, 'Remunerations transferee de personnel exterieur',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16017, 'SYSCOHADA-CI', 'EXPENSE', '6671', 16016, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16018, 'SYSCOHADA-CI', 'EXPENSE', '6672', 16016, 'Personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16019, 'SYSCOHADA-CI', 'EXPENSE', '668', 15986, 'Autres charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16020, 'SYSCOHADA-CI', 'EXPENSE', '6681', 16019,
        'Versements aux syndicats et comités d''entreprise, d''établisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16021, 'SYSCOHADA-CI', 'EXPENSE', '6682', 16019, 'Versements aux comité d''hygiéne et de sécurité',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16022, 'SYSCOHADA-CI', 'EXPENSE', '6683', 16019, 'Versements aux autres oeuvres sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16023, 'SYSCOHADA-CI', 'EXPENSE', '6684', 16019, 'Médecine du travail et pharmacie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16024, 'SYSCOHADA-CI', 'EXPENSE', '67', 15819, 'Frais financiers et charges assimilees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16025, 'SYSCOHADA-CI', 'EXPENSE', '671', 16024, 'Interets des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16026, 'SYSCOHADA-CI', 'EXPENSE', '6711', 16025, 'Emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16027, 'SYSCOHADA-CI', 'EXPENSE', '6712', 16025, 'Emprunts auprès des établissements de crédit',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16028, 'SYSCOHADA-CI', 'EXPENSE', '6713', 16025, 'Dettes liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16029, 'SYSCOHADA-CI', 'EXPENSE', '672', 16024,
        'Interets dans loyers de credit bail et contrats assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16030, 'SYSCOHADA-CI', 'EXPENSE', '6721', 16029, 'Intérêts dans loyers de crédit-bail immobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16031, 'SYSCOHADA-CI', 'EXPENSE', '6722', 16029, 'Intérêts dans loyers de crédit-bail mobilier',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16032, 'SYSCOHADA-CI', 'EXPENSE', '6723', 16029, 'Intérêts dans loyers des autres contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16033, 'SYSCOHADA-CI', 'EXPENSE', '673', 16024, 'Escomptes accordes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16034, 'SYSCOHADA-CI', 'EXPENSE', '674', 16024, 'Autres interets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16035, 'SYSCOHADA-CI', 'EXPENSE', '6741', 16034, 'Avances reçues et dépôts créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16036, 'SYSCOHADA-CI', 'EXPENSE', '6742', 16034, 'Comptes courants bloqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16037, 'SYSCOHADA-CI', 'EXPENSE', '6743', 16034, 'Intérêts sur obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16038, 'SYSCOHADA-CI', 'EXPENSE', '6744', 16034, 'Intérêts sur dettes commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16039, 'SYSCOHADA-CI', 'EXPENSE', '6745', 16034,
        'Intérêts bancaires et sur opérations de trésorerie et d''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16040, 'SYSCOHADA-CI', 'EXPENSE', '6748', 16034, 'Intérêts sur dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16041, 'SYSCOHADA-CI', 'EXPENSE', '675', 16024, 'Escomptes des effets de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16042, 'SYSCOHADA-CI', 'EXPENSE', '676', 16024, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16043, 'SYSCOHADA-CI', 'EXPENSE', '677', 16024, 'Pertes sur cessions de titres  de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16044, 'SYSCOHADA-CI', 'EXPENSE', '678', 16024, 'Pertes sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16045, 'SYSCOHADA-CI', 'EXPENSE', '6781', 16044, 'Sur rentes viagères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16046, 'SYSCOHADA-CI', 'EXPENSE', '6782', 16044, 'Sur opérations fiancières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16047, 'SYSCOHADA-CI', 'EXPENSE', '6783', 16044, 'Sur instruments de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16048, 'SYSCOHADA-CI', 'EXPENSE', '679', 16024, 'Charges provisionnees financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16049, 'SYSCOHADA-CI', 'EXPENSE', '6791', 16048, 'Sur risque financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16050, 'SYSCOHADA-CI', 'EXPENSE', '6795', 16048, 'Sur titres de placements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16051, 'SYSCOHADA-CI', 'EXPENSE', '6798', 16048, 'Autres charges provisionnées financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16052, 'SYSCOHADA-CI', 'EXPENSE', '68', 15819, 'Dotations aus amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16053, 'SYSCOHADA-CI', 'EXPENSE', '681', 16052, 'Dotations aux amortissements d''exploitation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16054, 'SYSCOHADA-CI', 'EXPENSE', '6811', 16052,
        'Dotations aux amortissements des charges immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16055, 'SYSCOHADA-CI', 'EXPENSE', '6812', 16052,
        'Dotations aux amortissements des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16056, 'SYSCOHADA-CI', 'EXPENSE', '6813', 16052,
        'Dotations aux amortissements des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16057, 'SYSCOHADA-CI', 'EXPENSE', '687', 16052,
        'Dotations aux amortissements a caractere financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16058, 'SYSCOHADA-CI', 'EXPENSE', '6872', 16057,
        'Dotations aux amortissements des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16059, 'SYSCOHADA-CI', 'EXPENSE', '6878', 16057,
        'Autres dotations aux amortissements à caractère financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16060, 'SYSCOHADA-CI', 'EXPENSE', '69', 15819, 'Dotattions aux provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16061, 'SYSCOHADA-CI', 'EXPENSE', '691', 16060, 'Dotation aux provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16062, 'SYSCOHADA-CI', 'EXPENSE', '6911', 16061, 'Pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16063, 'SYSCOHADA-CI', 'EXPENSE', '6912', 16061, 'Pour grosses réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16064, 'SYSCOHADA-CI', 'EXPENSE', '6913', 16061,
        'Pour dépréciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16065, 'SYSCOHADA-CI', 'EXPENSE', '6914', 16061,
        'Pour dépréciation des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16066, 'SYSCOHADA-CI', 'EXPENSE', '697', 16060, 'Dotations aux provisions financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16067, 'SYSCOHADA-CI', 'EXPENSE', '6971', 16066, 'Pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16068, 'SYSCOHADA-CI', 'EXPENSE', '6972', 16066,
        'Pour dépréciation des immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16069, 'SYSCOHADA-CI', 'INCOME', '7', 0, 'Ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16070, 'SYSCOHADA-CI', 'INCOME', '701', 16069, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16071, 'SYSCOHADA-CI', 'INCOME', '7011', 16070, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16072, 'SYSCOHADA-CI', 'INCOME', '7012', 16070, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16073, 'SYSCOHADA-CI', 'INCOME', '7013', 16070, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16074, 'SYSCOHADA-CI', 'INCOME', '7014', 16070, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16075, 'SYSCOHADA-CI', 'INCOME', '702', 16069, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16076, 'SYSCOHADA-CI', 'INCOME', '7021', 16075, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16077, 'SYSCOHADA-CI', 'INCOME', '7022', 16075, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16078, 'SYSCOHADA-CI', 'INCOME', '7023', 16075, 'Aux entreprises de groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16079, 'SYSCOHADA-CI', 'INCOME', '7024', 16075, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16080, 'SYSCOHADA-CI', 'INCOME', '703', 16069, 'Ventes de produits intermediaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16081, 'SYSCOHADA-CI', 'INCOME', '7031', 16080, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16082, 'SYSCOHADA-CI', 'INCOME', '7032', 16080, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16083, 'SYSCOHADA-CI', 'INCOME', '7033', 16080, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16084, 'SYSCOHADA-CI', 'INCOME', '7034', 16080, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16085, 'SYSCOHADA-CI', 'INCOME', '704', 16069, 'Ventes de produits residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16086, 'SYSCOHADA-CI', 'INCOME', '7041', 16085, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16087, 'SYSCOHADA-CI', 'INCOME', '7042', 16085, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16088, 'SYSCOHADA-CI', 'INCOME', '7043', 16085, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16089, 'SYSCOHADA-CI', 'INCOME', '7044', 16085, 'Aux entreprises du groupe hors  région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16090, 'SYSCOHADA-CI', 'INCOME', '705', 16069, 'Travaux factures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16091, 'SYSCOHADA-CI', 'INCOME', '7051', 16090, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16092, 'SYSCOHADA-CI', 'INCOME', '7052', 16090, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16093, 'SYSCOHADA-CI', 'INCOME', '7053', 16090, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16094, 'SYSCOHADA-CI', 'INCOME', '7054', 16090, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16095, 'SYSCOHADA-CI', 'INCOME', '706', 16069, 'Services vendus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16096, 'SYSCOHADA-CI', 'INCOME', '7061', 16095, 'Dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16097, 'SYSCOHADA-CI', 'INCOME', '7062', 16095, 'Hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16098, 'SYSCOHADA-CI', 'INCOME', '7063', 16095, 'Aux entreprises du groupe dans la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16099, 'SYSCOHADA-CI', 'INCOME', '7064', 16095, 'Aux entreprises du groupe hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16100, 'SYSCOHADA-CI', 'INCOME', '707', 16069, 'Produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16101, 'SYSCOHADA-CI', 'INCOME', '7071', 16100, 'Port, emballages perdus et autres frais facturés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16102, 'SYSCOHADA-CI', 'INCOME', '7072', 16100, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16103, 'SYSCOHADA-CI', 'INCOME', '7073', 16100, 'Locations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16104, 'SYSCOHADA-CI', 'INCOME', '7074', 16100, 'Bonis sur reprises et cessions d''emballages',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16105, 'SYSCOHADA-CI', 'INCOME', '7075', 16100, 'Mise à disposition de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16106, 'SYSCOHADA-CI', 'INCOME', '7076', 16100,
        'Redevances pour brevets, logiciels, marques et droits similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16107, 'SYSCOHADA-CI', 'INCOME', '7077', 16100, 'Services exploités dans l''intérêt du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16108, 'SYSCOHADA-CI', 'INCOME', '7078', 16100, 'Autres produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16109, 'SYSCOHADA-CI', 'INCOME', '71', 16069, 'Suvventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16110, 'SYSCOHADA-CI', 'INCOME', '711', 16109, 'Sur produits a l''exportation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16111, 'SYSCOHADA-CI', 'INCOME', '712', 16109, 'Sur produits a l''importation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16112, 'SYSCOHADA-CI', 'INCOME', '713', 16109, 'Sur produits de perequation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16113, 'SYSCOHADA-CI', 'INCOME', '718', 16109, 'Autres subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16114, 'SYSCOHADA-CI', 'INCOME', '7181', 16113,
        'Versées par l''etat et les collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16115, 'SYSCOHADA-CI', 'INCOME', '7182', 16113, 'Versées par les organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16116, 'SYSCOHADA-CI', 'INCOME', '7183', 16113, 'Versées par des tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16117, 'SYSCOHADA-CI', 'INCOME', '72', 16069, 'Production immobilisée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16118, 'SYSCOHADA-CI', 'INCOME', '721', 16117, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16119, 'SYSCOHADA-CI', 'INCOME', '722', 16117, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16120, 'SYSCOHADA-CI', 'INCOME', '726', 16117, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16121, 'SYSCOHADA-CI', 'INCOME', '73', 16069,
        'Variations des stocks de biens et de services produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16122, 'SYSCOHADA-CI', 'INCOME', '734', 16121, 'Variations des stocks de produitsn en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16123, 'SYSCOHADA-CI', 'INCOME', '7341', 16122, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16124, 'SYSCOHADA-CI', 'INCOME', '7342', 16122, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16125, 'SYSCOHADA-CI', 'INCOME', '735', 16121, 'Variations des en-cours de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16126, 'SYSCOHADA-CI', 'INCOME', '7351', 16125, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16127, 'SYSCOHADA-CI', 'INCOME', '7352', 16125, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16128, 'SYSCOHADA-CI', 'INCOME', '736', 16121, 'Variations des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16129, 'SYSCOHADA-CI', 'INCOME', '737', 16121,
        'Variations des stocks de produits intermediaires et residuels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16130, 'SYSCOHADA-CI', 'INCOME', '7371', 16129, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16131, 'SYSCOHADA-CI', 'INCOME', '7372', 16129, 'Produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16132, 'SYSCOHADA-CI', 'INCOME', '75', 16069, 'Autres produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16133, 'SYSCOHADA-CI', 'INCOME', '752', 16132,
        'Quote-part de resultat sur operations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16134, 'SYSCOHADA-CI', 'INCOME', '7521', 16133,
        'Quote-part trsnsférée de pertes (comptabilité de gérant)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16135, 'SYSCOHADA-CI', 'INCOME', '7525', 16133,
        'Bénéfices attribués par transfert (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16136, 'SYSCOHADA-CI', 'INCOME', '753', 16132,
        'Quote-part de resultat sue execution partielle de contrats pluri-ecercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16137, 'SYSCOHADA-CI', 'INCOME', '754', 16132, 'Produits des cessions courantes d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16138, 'SYSCOHADA-CI', 'INCOME', '758', 16132, 'Produits divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16139, 'SYSCOHADA-CI', 'INCOME', '7581', 16138,
        'Jetons de présence et autres rémunérations d''administrateurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16140, 'SYSCOHADA-CI', 'INCOME', '7582', 16138, 'Indemnités d''assurances reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16141, 'SYSCOHADA-CI', 'INCOME', '759', 16132, 'Reprises de charges provisionnees d''exploitation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16142, 'SYSCOHADA-CI', 'INCOME', '7591', 16141, 'Sur risques à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16143, 'SYSCOHADA-CI', 'INCOME', '7593', 16141, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16144, 'SYSCOHADA-CI', 'INCOME', '7594', 16141, 'Sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16145, 'SYSCOHADA-CI', 'INCOME', '7598', 16141, 'Sur autres charges provisionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16146, 'SYSCOHADA-CI', 'INCOME', '77', 16069, 'Revenus financiers et produits assimiles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16147, 'SYSCOHADA-CI', 'INCOME', '771', 16146, 'Interets de prets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16148, 'SYSCOHADA-CI', 'INCOME', '772', 16146, 'Revenus de participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16149, 'SYSCOHADA-CI', 'INCOME', '773', 16146, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16150, 'SYSCOHADA-CI', 'INCOME', '774', 16146, 'Revenus de titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16151, 'SYSCOHADA-CI', 'INCOME', '775', 16146, 'Revenus des creances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16152, 'SYSCOHADA-CI', 'INCOME', '776', 16146, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16153, 'SYSCOHADA-CI', 'INCOME', '777', 16146, 'Gains sur cessions de titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16154, 'SYSCOHADA-CI', 'INCOME', '778', 16146, 'Gains sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16155, 'SYSCOHADA-CI', 'INCOME', '7781', 16154, 'Gains sur rentes viagères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16156, 'SYSCOHADA-CI', 'INCOME', '7782', 16154, 'Gains sur opérations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16157, 'SYSCOHADA-CI', 'INCOME', '7784', 16154, 'Gains sur instruments de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16158, 'SYSCOHADA-CI', 'INCOME', '779', 16146, 'Reprises de charges provisionnees financieres',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16159, 'SYSCOHADA-CI', 'INCOME', '7791', 16158, 'Sur risques financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16160, 'SYSCOHADA-CI', 'INCOME', '7795', 16158, 'Sur titres de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16161, 'SYSCOHADA-CI', 'INCOME', '7798', 16158, 'Autres charges provisionnées financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16162, 'SYSCOHADA-CI', 'INCOME', '78', 16069, 'Transfert de charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16163, 'SYSCOHADA-CI', 'INCOME', '781', 16162, 'Transfert de charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16164, 'SYSCOHADA-CI', 'INCOME', '787', 16162, 'Transfert de charges financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16165, 'SYSCOHADA-CI', 'INCOME', '79', 16069, 'Reprises de provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16166, 'SYSCOHADA-CI', 'INCOME', '791', 16165, 'Reprises de provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16167, 'SYSCOHADA-CI', 'INCOME', '7911', 16166, 'Pour risques et charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16168, 'SYSCOHADA-CI', 'INCOME', '7912', 16166, 'Pour grosses réparation d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16169, 'SYSCOHADA-CI', 'INCOME', '7913', 16166,
        'Pour dépreciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16170, 'SYSCOHADA-CI', 'INCOME', '7914', 16166, 'Pour dépreciation des immobilisations corporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16171, 'SYSCOHADA-CI', 'INCOME', '797', 16165, 'Reprises de provisions financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16172, 'SYSCOHADA-CI', 'INCOME', '7971', 16171, 'Pour risques et charges financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16173, 'SYSCOHADA-CI', 'INCOME', '7972', 16171, 'Pour dépréciation des immobilisations financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16174, 'SYSCOHADA-CI', 'INCOME', '798', 16165, 'Reprises d''amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16175, 'SYSCOHADA-CI', 'AUTRES', '81', 0, 'Valeurs comptables des cessions d''immobilisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16176, 'SYSCOHADA-CI', 'AUTRES', '811', 16175, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16177, 'SYSCOHADA-CI', 'AUTRES', '812', 16175, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16178, 'SYSCOHADA-CI', 'AUTRES', '816', 16175, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16179, 'SYSCOHADA-CI', 'AUTRES', '82', 0, 'Produits de cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16180, 'SYSCOHADA-CI', 'AUTRES', '821', 16179, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16181, 'SYSCOHADA-CI', 'AUTRES', '822', 16179, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16182, 'SYSCOHADA-CI', 'AUTRES', '826', 16179, 'Immobilisations financieres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16183, 'SYSCOHADA-CI', 'AUTRES', '83', 0, 'Charges hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16184, 'SYSCOHADA-CI', 'AUTRES', '831', 16183, 'Charges h.a.o constatées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16185, 'SYSCOHADA-CI', 'AUTRES', '834', 16183, 'Pertes sur creances h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16186, 'SYSCOHADA-CI', 'AUTRES', '835', 16183, 'Dons et liberalites accordes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16187, 'SYSCOHADA-CI', 'AUTRES', '836', 16183, 'Abandons de creances consentis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16188, 'SYSCOHADA-CI', 'AUTRES', '839', 16183, 'Charges provisionnees h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16189, 'SYSCOHADA-CI', 'AUTRES', '84', 0, 'Produits hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16190, 'SYSCOHADA-CI', 'AUTRES', '841', 16189, 'Produits h.a.o constates', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16191, 'SYSCOHADA-CI', 'AUTRES', '845', 16189, 'Dons et liberalites obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16192, 'SYSCOHADA-CI', 'AUTRES', '846', 16189, 'Abandons de creances obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16193, 'SYSCOHADA-CI', 'AUTRES', '848', 16189, 'Transferts de charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16194, 'SYSCOHADA-CI', 'AUTRES', '849', 16189, 'Reprises des charges provisionnees h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16195, 'SYSCOHADA-CI', 'AUTRES', '85', 0, 'Dotations hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16196, 'SYSCOHADA-CI', 'AUTRES', '851', 16195, 'Dotations aux provisions reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16197, 'SYSCOHADA-CI', 'AUTRES', '852', 16195, 'Dotations aux amortissements h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16198, 'SYSCOHADA-CI', 'AUTRES', '853', 16195, 'Dotations aux provisions pour depreciation h.a.o',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16199, 'SYSCOHADA-CI', 'AUTRES', '854', 16195,
        'Dotations aux provisions pour risques et charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16200, 'SYSCOHADA-CI', 'AUTRES', '858', 16195, 'Autres dotations h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16201, 'SYSCOHADA-CI', 'AUTRES', '86', 0, 'Reprises hors activites ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16202, 'SYSCOHADA-CI', 'AUTRES', '861', 16201, 'Reprises de provisions reglementees', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16203, 'SYSCOHADA-CI', 'AUTRES', '862', 16201, 'Reprises d''amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16204, 'SYSCOHADA-CI', 'AUTRES', '863', 16201, 'Reprises de provisions pour depreciation h.a.o',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16205, 'SYSCOHADA-CI', 'AUTRES', '864', 16201,
        'Reprises de provisions pour risques et charges h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16206, 'SYSCOHADA-CI', 'AUTRES', '865', 16201, 'Reprises de subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16207, 'SYSCOHADA-CI', 'AUTRES', '868', 16201, 'Autres reprises h.a.o', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16208, 'SYSCOHADA-CI', 'AUTRES', '87', 0, 'Participations des travailleurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16209, 'SYSCOHADA-CI', 'AUTRES', '871', 16208, 'Participation legale aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16210, 'SYSCOHADA-CI', 'AUTRES', '874', 16208, 'Participation contractuelle aux benefices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16211, 'SYSCOHADA-CI', 'AUTRES', '878', 16208, 'Autres participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16212, 'SYSCOHADA-CI', 'AUTRES', '88', 0, 'Subventions d''equilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16213, 'SYSCOHADA-CI', 'AUTRES', '881', 16212, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16214, 'SYSCOHADA-CI', 'AUTRES', '884', 16212, 'Collectivites publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16215, 'SYSCOHADA-CI', 'AUTRES', '886', 16212, 'Groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16216, 'SYSCOHADA-CI', 'AUTRES', '888', 16212, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16217, 'SYSCOHADA-CI', 'AUTRES', '89', 0, 'Impots sur le resultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16218, 'SYSCOHADA-CI', 'AUTRES', '891', 16217, 'Impots sur les benefices de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16219, 'SYSCOHADA-CI', 'AUTRES', '8911', 16218, 'Activités exercées dans l''etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16220, 'SYSCOHADA-CI', 'AUTRES', '8912', 16218,
        'Activités exercées dans les autres etats de la région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16221, 'SYSCOHADA-CI', 'AUTRES', '8913', 16218, 'Activités exercées hors région', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16222, 'SYSCOHADA-CI', 'AUTRES', '892', 16217, 'Rappel d''impôts sur resultats anterieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16223, 'SYSCOHADA-CI', 'AUTRES', '895', 16217, 'Impôts minimum forfaitaires (i.m.f)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16224, 'SYSCOHADA-CI', 'AUTRES', '899', 16217,
        'Dégrèvements et annulations d''impots sur resultats antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16225, 'SYSCOHADA-CI', 'AUTRES', '8991', 16224, 'Dégrèvements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16226, 'SYSCOHADA-CI', 'AUTRES', '8994', 16224, 'Annulations pour pertes rétroactives', '1');
