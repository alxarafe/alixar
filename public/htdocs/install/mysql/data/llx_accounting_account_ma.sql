-- Descriptif plan comptable fr_MA PCG
-- ID 7000 - 7999
-- ADD 1200000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7000, 'PCG', 'CAPIT', '1', '', 'Comptes de Financement Permanent', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7001, 'PCG', 'CAPIT', '11', 7000, 'Capitaux Propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7002, 'PCG', 'CAPIT', '1111', 7001, 'Capital Social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7003, 'PCG', 'CAPIT', '1112', 7001, 'Fonds de Dotation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7004, 'PCG', 'CAPIT', '1117', 7001, 'Capital Personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7005, 'PCG', 'CAPIT', '11171', 7004, 'Capital Individuel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7006, 'PCG', 'CAPIT', '11175', 7004, 'Compte de l''Exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7007, 'PCG', 'CAPIT', '1119', 7001, 'Actionnaires, Capital souscrit non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7008, 'PCG', 'CAPIT', '112', 7001, 'Primes d''émission, de fusion et d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7009, 'PCG', 'CAPIT', '1121', 7008, 'Primes d''émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7010, 'PCG', 'CAPIT', '1122', 7008, 'Primes de Fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7011, 'PCG', 'CAPIT', '1123', 7008, 'Primes d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7012, 'PCG', 'CAPIT', '113', 7001, 'Ecarts de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7013, 'PCG', 'CAPIT', '114', 7001, 'Réserve légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7014, 'PCG', 'CAPIT', '115', 7001, 'Autres réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7015, 'PCG', 'CAPIT', '1151', 7014, ' Réserves statutaires ou contractuelles ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7016, 'PCG', 'CAPIT', '1152', 7014, 'Réserves facultatives ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7017, 'PCG', 'CAPIT', '1155', 7014, 'Réserves réglementaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7018, 'PCG', 'CAPIT', '116', 7001, 'Report à nouveau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7019, 'PCG', 'CAPIT', '1161', 7018, 'Report à nouveau (solde créditeur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7020, 'PCG', 'CAPIT', '1169', 7018, 'Report à nouveau (solde débiteur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7021, 'PCG', 'CAPIT', '118', 7001, 'Résultat net en Instance d''Affectation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7022, 'PCG', 'CAPIT', '1181', 7021, 'Résultat net en Instance d''Affectation (Solde créditeur)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7023, 'PCG', 'CAPIT', '1189', 7021, 'Résultat net en Instance d''Affectation (Solde débiteur)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7024, 'PCG', 'CAPIT', '119', 7001, 'Résultat net de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7025, 'PCG', 'CAPIT', '1191', 7024, 'Résultat net de l''exercice (Solde créditeur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7026, 'PCG', 'CAPIT', '1199', 7024, 'Résultat net de l''exercice (Solde débiteur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7027, 'PCG', 'CAPIT', '13', 7000, 'Capitaux Propres et Assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7028, 'PCG', 'CAPIT', '131', 7027, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7029, 'PCG', 'CAPIT', '1311', 7028, 'Subvention d''investissement reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7030, 'PCG', 'CAPIT', '1319', 7028,
        'Subvention d''investissement inscrits au compte de produit et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7031, 'PCG', 'CAPIT', '135', 7027, 'Provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7032, 'PCG', 'CAPIT', '1351', 7031, 'Provisions pour amortissements dérogatoires ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7033, 'PCG', 'CAPIT', '1352', 7031, 'Provisions pour plus-values en instance d''imposition', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7034, 'PCG', 'CAPIT', '1354', 7031, 'Provisions Pour Investissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7035, 'PCG', 'CAPIT', '1355', 7031, 'Provisions pour reconstitution des gisements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7036, 'PCG', 'CAPIT', '1356', 7031, 'Provisions pour acquisition et construction de logements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7037, 'PCG', 'CAPIT', '1358', 7031, 'Autres provisions réglementées ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7038, 'PCG', 'CAPIT', '14', 7000, 'Dettes de Financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7039, 'PCG', 'CAPIT', '141', 7038, 'Emprunts Obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7040, 'PCG', 'CAPIT', '148', 7038, 'Autres dettes de Financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7041, 'PCG', 'CAPIT', '1481', 7040, 'Emprunts auprès des établissements de crédits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7042, 'PCG', 'CAPIT', '1482', 7040, 'Avance de l''Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7043, 'PCG', 'CAPIT', '1483', 7040, 'Dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7044, 'PCG', 'CAPIT', '1484', 7040, 'Billets de Fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7045, 'PCG', 'CAPIT', '1485', 7040, 'Avances reçus et comptes courants bloqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7046, 'PCG', 'CAPIT', '1486', 7040, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7047, 'PCG', 'CAPIT', '1487', 7040, 'Dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7048, 'PCG', 'CAPIT', '1488', 7040, 'Dettes de Financement diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7049, 'PCG', 'CAPIT', '15', 7000, 'Provisions Durables Pour Risques et Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7050, 'PCG', 'CAPIT', '151', 7049, 'Provisions pour Risques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7051, 'PCG', 'CAPIT', '1511', 7050, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7052, 'PCG', 'CAPIT', '1512', 7050, 'Provisions pour garanties données aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7053, 'PCG', 'CAPIT', '1513', 7050, 'Provisions pour propre assureur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7054, 'PCG', 'CAPIT', '1514', 7050, 'Provisions pour pertes sur marché à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7055, 'PCG', 'CAPIT', '1515', 7050, 'Provisions pour amendes, doubles droits, pénalités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7056, 'PCG', 'CAPIT', '1516', 7050, 'Provisions pour pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7057, 'PCG', 'CAPIT', '1518', 7050, 'Autres provisions pour risque', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7058, 'PCG', 'CAPIT', '155', 7049, 'Provisions pour charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7059, 'PCG', 'CAPIT', '1551', 7058, 'Provisions Pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7060, 'PCG', 'CAPIT', '1552', 7058, 'Provisions, pensions de retraite et obligations similaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7061, 'PCG', 'CAPIT', '1555', 7058, 'Provisions pour charges à répartir sur plusieurs exercices',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7062, 'PCG', 'CAPIT', '1558', 7058, 'Autres provisions pour charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7063, 'PCG', 'CAPIT', '16', 7000, 'Comptes de liaison des établissements et succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7064, 'PCG', 'CAPIT', '1601', 7063, 'Comptes de liaison de siéges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7065, 'PCG', 'CAPIT', '1605', 7063, 'Comptes de liaison des établissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7066, 'PCG', 'CAPIT', '17', 7000, 'Ecarts de conversion - Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7067, 'PCG', 'CAPIT', '171', 7066, 'Augmentation des créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7068, 'PCG', 'CAPIT', '172', 7066, 'Diminution des dettes de Financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7069, 'PCG', 'IMMO', '2', '', 'Comptes d''Actif Immobilisé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7070, 'PCG', 'IMMO', '21', 7069, 'Immobilisation en non-valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7071, 'PCG', 'IMMO', '211', 7070, 'Frais Préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7072, 'PCG', 'IMMO', '2111', 7071, 'Frais de Constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7073, 'PCG', 'IMMO', '2112', 7071, 'Frais préalables au démarrage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7074, 'PCG', 'IMMO', '2113', 7071, 'Frais d''augmentation du capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7075, 'PCG', 'IMMO', '2114', 7071, 'Frais sur opérations de Fusion, scissions et transformations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7076, 'PCG', 'IMMO', '2116', 7071, 'Frais de prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7077, 'PCG', 'IMMO', '2117', 7071, 'Frais de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7078, 'PCG', 'IMMO', '2118', 7071, 'Autres frais préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7079, 'PCG', 'IMMO', '212', 7070, 'Charges à répartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7080, 'PCG', 'IMMO', '2121', 7079, 'Frais d''acquisition des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7081, 'PCG', 'IMMO', '2125', 7079, 'Frais d''émission des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7082, 'PCG', 'IMMO', '2128', 7079, 'Autres charges à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7083, 'PCG', 'IMMO', '213', 7070, 'Primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7084, 'PCG', 'IMMO', '22', 7069, 'Immobilisation Incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7085, 'PCG', 'IMMO', '221', 7084, 'Immobilisations en recherche et Développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7086, 'PCG', 'IMMO', '222', 7084, 'Brevets, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7087, 'PCG', 'IMMO', '223', 7084, 'Fonds Commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7088, 'PCG', 'IMMO', '228', 7084, ' Autres immobilisations Incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7089, 'PCG', 'IMMO', '2285', 7088, ' Autres immobilisations Incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7090, 'PCG', 'IMMO', '23', 7069, 'Immobilisations Corporelles ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7091, 'PCG', 'IMMO', '231', 7090, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7092, 'PCG', 'IMMO', '2311', 7091, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7093, 'PCG', 'IMMO', '2312', 7091, 'Terrains aménagés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7094, 'PCG', 'IMMO', '2313', 7091, 'Terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7095, 'PCG', 'IMMO', '2314', 7091, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7096, 'PCG', 'IMMO', '2316', 7091, 'Agencement et aménagements de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7097, 'PCG', 'IMMO', '2318', 7091, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7098, 'PCG', 'IMMO', '232', 7090, 'Construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7099, 'PCG', 'IMMO', '2321', 7098, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7100, 'PCG', 'IMMO', '23211', 7099, 'Bâtiments industriels (A, B...)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7101, 'PCG', 'IMMO', '23214', 7099, 'Bâtiments administratifs et commerciaux (A, B, etc)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7102, 'PCG', 'IMMO', '23218', 7099, 'Autres bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7103, 'PCG', 'IMMO', '2323', 7098, 'Construction sur terrains d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7104, 'PCG', 'IMMO', '2325', 7098, 'Ouvrages d''infrastructures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7105, 'PCG', 'IMMO', '2327', 7098, 'Agencement et aménagements des constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7106, 'PCG', 'IMMO', '2328', 7098, 'Autres constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7107, 'PCG', 'IMMO', '233', 7090, 'Installations Techniques, matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7108, 'PCG', 'IMMO', '2331', 7107, 'Installations Techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7109, 'PCG', 'IMMO', '2332', 7107, 'Matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7110, 'PCG', 'IMMO', '23321', 7109, 'Matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7111, 'PCG', 'IMMO', '23324', 7109, 'Outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7112, 'PCG', 'IMMO', '2333', 7107, 'Emballages récupérables identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7113, 'PCG', 'IMMO', '2338', 7107, 'Autres Installations techniques, matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7114, 'PCG', 'IMMO', '234', 7090, 'Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7115, 'PCG', 'IMMO', '235', 7090, 'Mobilier, matériel de bureau et aménagements divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7116, 'PCG', 'IMMO', '2351', 7115, 'Mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7117, 'PCG', 'IMMO', '2352', 7115, 'Matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7118, 'PCG', 'IMMO', '2355', 7115, 'Matériel Informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7119, 'PCG', 'IMMO', '2356', 7115,
        'Agencement, installations et aménagements divers (de biens n''appartenant pas à l''entreprise)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7120, 'PCG', 'IMMO', '2358', 7115, 'Autres mobiliers, matériel de bureau et aménagements divers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7121, 'PCG', 'IMMO', '238', 7090, 'Autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7122, 'PCG', 'IMMO', '239', 7090, 'Immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7123, 'PCG', 'IMMO', '2392', 7122,
        'immobilisations Corporelles en cours et terrains de constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7124, 'PCG', 'IMMO', '2393', 7122,
        'immobilisations Corporelles en cours et terrains des installations techniques, matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7125, 'PCG', 'IMMO', '2394', 7122, 'Immobilisations corporelles en cours de matériel de transports',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7126, 'PCG', 'IMMO', '2395', 7122,
        'Immobilisations corporelles en cours de mobilier, matériel de bureau et aménagement divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7127, 'PCG', 'IMMO', '2397', 7122,
        'Avances et acomptes versés sur commandes d''immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7128, 'PCG', 'IMMO', '2398', 7122, 'Autres immobilisations corporelles en cours ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7129, 'PCG', 'IMMO', '24', 7069, 'Immobilisations Financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7130, 'PCG', 'IMMO', '241', 7129, 'Prêts immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7131, 'PCG', 'IMMO', '2411', 7130, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7132, 'PCG', 'IMMO', '2415', 7130, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7133, 'PCG', 'IMMO', '2416', 7130, 'Billets de Fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7134, 'PCG', 'IMMO', '2418', 7130, 'Autres prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7135, 'PCG', 'IMMO', '248', 7129, 'Autres créances financières ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7136, 'PCG', 'IMMO', '2481', 7135, 'Titres immobilisés (Droits de créance)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7137, 'PCG', 'IMMO', '24811', 7136, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7138, 'PCG', 'IMMO', '24813', 7136, 'Bons d''équipements ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7139, 'PCG', 'IMMO', '24818', 7136, 'Bons divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7140, 'PCG', 'IMMO', '2483', 7135, 'Créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7141, 'PCG', 'IMMO', '2486', 7135, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7142, 'PCG', 'IMMO', '24861', 7141, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7143, 'PCG', 'IMMO', '24864', 7141, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7144, 'PCG', 'IMMO', '2487', 7135, 'Créances Immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7145, 'PCG', 'IMMO', '2488', 7135, 'Créances financières diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7146, 'PCG', 'IMMO', '25', 7069, 'Immobilisations Financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7147, 'PCG', 'IMMO', '251', 7146, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7148, 'PCG', 'IMMO', '258', 7146, 'Autres titres immobilisés (Titres de propriété)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7149, 'PCG', 'IMMO', '2581', 7148, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7150, 'PCG', 'IMMO', '2588', 7148, 'Titres divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7151, 'PCG', 'IMMO', '27', 7069, 'Ecarts de conversion Actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7152, 'PCG', 'IMMO', '271', 7151, 'Diminution des créances Immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7153, 'PCG', 'IMMO', '272', 7151, 'Augmentation des dettes de financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7154, 'PCG', 'IMMO', '28', 7069, 'Amortissements des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7155, 'PCG', 'IMMO', '281', 7154, 'Amortissements des en non-valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7156, 'PCG', 'IMMO', '2811', 7155, 'Amortissements des frais préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7157, 'PCG', 'IMMO', '28111', 7156, 'Amortissements des Faris de constitution ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7158, 'PCG', 'IMMO', '28112', 7156, 'Amortissement des frais préliminaires au démarrage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7159, 'PCG', 'IMMO', '28113', 7156, 'Amortissements des frais d''augmentation de capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7160, 'PCG', 'IMMO', '28114', 7156,
        'Amortissements des frais sur opérations des fusions scissions et transformations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7161, 'PCG', 'IMMO', '28116', 7156, 'Amortissements des frais d prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7162, 'PCG', 'IMMO', '28117', 7156, 'Amortissements des frais de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7163, 'PCG', 'IMMO', '28118', 7156, 'Amortissements des autres frais préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7164, 'PCG', 'IMMO', '2812', 7155, 'Amortissements des charges à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7165, 'PCG', 'IMMO', '28121', 7164, 'Amortissements des frais d''acquisition des immobilisations ',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7166, 'PCG', 'IMMO', '28125', 7164, 'Amortissements des frais d''émission des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7167, 'PCG', 'IMMO', '28128', 7164, 'Amortissements des autres charges à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7168, 'PCG', 'IMMO', '28813', 7164, 'Amortissements, primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7169, 'PCG', 'IMMO', '282', 7154, 'Amortissements des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7170, 'PCG', 'IMMO', '2821', 7169,
        'Amortissement de l''immobilisation en recherche et développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7171, 'PCG', 'IMMO', '2822', 7169,
        'Amortissement des brevets, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7172, 'PCG', 'IMMO', '2823', 7169, 'Amortissement du fond commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7173, 'PCG', 'IMMO', '2828', 7169, 'Amortissement des autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7174, 'PCG', 'IMMO', '283', 7154, 'Amortissements des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7175, 'PCG', 'IMMO', '2831', 7174, 'Amortissement des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7176, 'PCG', 'IMMO', '28311', 7175, 'Amortissement des terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7177, 'PCG', 'IMMO', '28312', 7175, 'Amortissement des terrains aménagés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7178, 'PCG', 'IMMO', '28313', 7175, 'Amortissement des terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7179, 'PCG', 'IMMO', '28314', 7175, 'Amortissement des  terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7180, 'PCG', 'IMMO', '28316', 7175, 'Amortissement des agencements et aménagements des terrains',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7181, 'PCG', 'IMMO', '28318', 7175, 'Amortissement des autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7182, 'PCG', 'IMMO', '2832', 7174, 'Amortissement des autres construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7183, 'PCG', 'IMMO', '28321', 7182, 'Amortissement des bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7184, 'PCG', 'IMMO', '28323', 7182, 'Amortissement des construction sur terrains d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7185, 'PCG', 'IMMO', '28325', 7182, 'Amortissement des ouvrages d''infrastructure', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7186, 'PCG', 'IMMO', '28327', 7182,
        'Amortissement des installations, agencements et aménagements des constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7187, 'PCG', 'IMMO', '28328', 7182, 'Amortissement des autres constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7188, 'PCG', 'IMMO', '2833', 7174,
        'Amortissement des Installations techniques, matériels et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7189, 'PCG', 'IMMO', '28331', 7188, 'Amortissement des installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7190, 'PCG', 'IMMO', '28332', 7188, 'Amortissement du matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7191, 'PCG', 'IMMO', '28333', 7188, 'Amortissement des emballages récupérables identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7192, 'PCG', 'IMMO', '28338', 7188, 'Amortissement des autres installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7193, 'PCG', 'IMMO', '2834', 7174, 'Amortissement du matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7194, 'PCG', 'IMMO', '2835', 7174, 'Amortissement du mobilier, matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7195, 'PCG', 'IMMO', '28351', 7194, 'Amortissement du mobilier de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7196, 'PCG', 'IMMO', '28352', 7194, 'Amortissement du matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7197, 'PCG', 'IMMO', '28355', 7194, 'Amortissement du matériel informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7198, 'PCG', 'IMMO', '28356', 7194,
        'Amortissement des agencements, installations et aménagements divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7199, 'PCG', 'IMMO', '28358', 7194,
        'Amortissement des autres mobilier, matériel de bureau et aménagements divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7200, 'PCG', 'IMMO', '2838', 7174, 'Amortissement des autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7201, 'PCG', 'IMMO', '29', 7069, 'Provisions pour dépréciation des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7202, 'PCG', 'IMMO', '292', 7201, 'Provisions pour dépréciation des immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7203, 'PCG', 'IMMO', '293', 7201, 'Provisions pour dépréciation des immobilisations corporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7204, 'PCG', 'IMMO', '294', 7201, 'Provisions pour dépréciation des immobilisations financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7205, 'PCG', 'IMMO', '2941', 7204, 'Provisions pour dépréciation des prêts immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7206, 'PCG', 'IMMO', '2948', 7204, 'Provisions pour dépréciation des autres créances financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7207, 'PCG', 'IMMO', '295', 7201, 'Provisions pour dépréciation des immobilisations financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7208, 'PCG', 'IMMO', '2951', 7207, 'Provisions pour dépréciation des titres de participations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7209, 'PCG', 'IMMO', '2958', 7207, 'Provisions pour dépréciation des autres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7210, 'PCG', 'STOCK', '3', '', 'Comptes d''actif Circulation (Hors Trésorerie)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7211, 'PCG', 'STOCK', '31', 7210, 'Stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7212, 'PCG', 'STOCK', '311', 7211, 'Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7213, 'PCG', 'STOCK', '3111', 7212, 'Marchandises (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7214, 'PCG', 'STOCK', '3112', 7212, 'Marchandises (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7215, 'PCG', 'STOCK', '3116', 7212, 'Marchandises en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7216, 'PCG', 'STOCK', '3118', 7212, 'Autres marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7217, 'PCG', 'STOCK', '312', 7211, 'Matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7218, 'PCG', 'STOCK', '3121', 7217, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7219, 'PCG', 'STOCK', '31211', 7218, 'Matières premières (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7220, 'PCG', 'STOCK', '31212', 7218, 'Matières premières (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7221, 'PCG', 'STOCK', '3122', 7217, 'Matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7222, 'PCG', 'STOCK', '31221', 7221, 'Matières consommables (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7223, 'PCG', 'STOCK', '31222', 7221, 'Matières consommables (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7224, 'PCG', 'STOCK', '31223', 7221, 'Combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7225, 'PCG', 'STOCK', '31224', 7221, 'Produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7226, 'PCG', 'STOCK', '31225', 7221, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7227, 'PCG', 'STOCK', '31226', 7221, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7228, 'PCG', 'STOCK', '31227', 7221, 'Fournitures de Bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7229, 'PCG', 'STOCK', '3123', 7217, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7230, 'PCG', 'STOCK', '31231', 7229, 'Emballages Perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7231, 'PCG', 'STOCK', '31232', 7229, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7232, 'PCG', 'STOCK', '31233', 7229, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7233, 'PCG', 'STOCK', '3126', 7217, 'Matières et fournitures consommables en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7234, 'PCG', 'STOCK', '3128', 7217, 'Autres matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7235, 'PCG', 'STOCK', '313', 7211, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7236, 'PCG', 'STOCK', '3131', 7235, 'Biens en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7237, 'PCG', 'STOCK', '31311', 7236, 'Biens produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7238, 'PCG', 'STOCK', '31312', 7236, 'Biens intermédiaires en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7239, 'PCG', 'STOCK', '31317', 7236, 'Biens résiduels en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7240, 'PCG', 'STOCK', '3134', 7235, 'Services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7241, 'PCG', 'STOCK', '31341', 7240, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7242, 'PCG', 'STOCK', '31342', 7240, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7243, 'PCG', 'STOCK', '31343', 7240, 'Prestations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7244, 'PCG', 'STOCK', '3138', 7235, 'Autres produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7245, 'PCG', 'STOCK', '314', 7211, 'Produits intermédiaires et produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7246, 'PCG', 'STOCK', '3141', 7245, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7247, 'PCG', 'STOCK', '31411', 7246, 'Produits intermédiaires (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7248, 'PCG', 'STOCK', '31412', 7246, 'Produits intermédiaires (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7249, 'PCG', 'STOCK', '3145', 7245, 'Produits résiduels (ou matières de récupération)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7250, 'PCG', 'STOCK', '31451', 7249, 'Déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7251, 'PCG', 'STOCK', '31452', 7249, 'Rebuts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7252, 'PCG', 'STOCK', '31453', 7249, 'Matières de récupération', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7253, 'PCG', 'STOCK', '3148', 7245, 'Autres produits intermédiaires et produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7254, 'PCG', 'STOCK', '315', 7211, 'Produits Finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7255, 'PCG', 'STOCK', '3151', 7254, 'Produits Finis (groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7256, 'PCG', 'STOCK', '3152', 7254, 'Produits Finis (groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7257, 'PCG', 'STOCK', '3156', 7254, 'Produits finis en cours de route', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7258, 'PCG', 'STOCK', '3158', 7254, 'Autres produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7259, 'PCG', 'STOCK', '34', 7210, 'Créances de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7260, 'PCG', 'STOCK', '341', 7259, 'Fournisseurs débiteur, avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7261, 'PCG', 'STOCK', '3411', 7260,
        'Fournisseurs - avances et acomptes versés sur commandes d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7262, 'PCG', 'STOCK', '3413', 7260, 'Fournisseurs - créances pour emballages et matériels à rendre',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7263, 'PCG', 'STOCK', '3417', 7260,
        'Rabais, remises et ristournes à obtenir - avoirs non encoure reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7264, 'PCG', 'STOCK', '3418', 7260, 'Autres fournisseurs débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7265, 'PCG', 'STOCK', '342', 7259, 'Clients et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7266, 'PCG', 'STOCK', '3421', 7265, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7267, 'PCG', 'STOCK', '34211', 7266, 'Clients (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7268, 'PCG', 'STOCK', '34212', 7266, 'Clients (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7269, 'PCG', 'STOCK', '3423', 7265, 'Clients - retenues de garanties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7270, 'PCG', 'STOCK', '3424', 7265, 'Clients douteux ou litigieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7271, 'PCG', 'STOCK', '3425', 7265, 'Clients - effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7272, 'PCG', 'STOCK', '3427', 7265,
        'Clients - factures à établir et créances sur travaux non encore facturables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7273, 'PCG', 'STOCK', '34271', 7272, 'Clients - factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7274, 'PCG', 'STOCK', '34272', 7272, 'Créances sur travaux non encore facturables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7275, 'PCG', 'STOCK', '3428', 7265, 'Autres clients et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7276, 'PCG', 'STOCK', '343', 7259, 'Personnel - débiteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7277, 'PCG', 'STOCK', '3431', 7276, 'Avances et acomptes au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7278, 'PCG', 'STOCK', '3438', 7276, 'Personnel - autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7279, 'PCG', 'STOCK', '345', 7259, 'Etat - débiteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7280, 'PCG', 'STOCK', '3451', 7279, 'Subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7281, 'PCG', 'STOCK', '34511', 7280, 'Subventions d''investissements à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7282, 'PCG', 'STOCK', '34512', 7280, 'subventions d''exploitation à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7283, 'PCG', 'STOCK', '34513', 7280, 'Subventions d''équilibre à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7284, 'PCG', 'STOCK', '3453', 7279, 'Acomptes sur impôts sur les résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7285, 'PCG', 'STOCK', '3455', 7279, 'Etat - TVA récupérable', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7286, 'PCG', 'STOCK', '34551', 7285, 'Etat - TVA récupérable sur Immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7287, 'PCG', 'STOCK', '34552', 7285, 'Etat - TVA récupérable sur charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7288, 'PCG', 'STOCK', '3456', 7279, 'Etat - crédit de TVA (suivant déclarations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7289, 'PCG', 'STOCK', '3458', 7279, 'Etat - autres comptes débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7290, 'PCG', 'STOCK', '346', 7259, 'Comptes d''associés - débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7291, 'PCG', 'STOCK', '3461', 7290, 'Associés - comptes d''apport en société', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7292, 'PCG', 'STOCK', '3462', 7290, 'Actionnaires - capital souscrit et appelé non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7293, 'PCG', 'STOCK', '3463', 7290, 'Comptes courants des associés - débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7294, 'PCG', 'STOCK', '3464', 7290, 'Associés - opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7295, 'PCG', 'STOCK', '3467', 7290, 'Créances rattachées aux comptes d''associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7296, 'PCG', 'STOCK', '3468', 7290, 'Autres comptes d''associés - débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7297, 'PCG', 'STOCK', '348', 7259, 'Autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7298, 'PCG', 'STOCK', '3481', 7297, 'Créances sur cession d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7299, 'PCG', 'STOCK', '3482', 7297, 'Créances sur cession d''éléments d''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7300, 'PCG', 'STOCK', '3487', 7297, 'Créances rattachées aux autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7301, 'PCG', 'STOCK', '3488', 7297, 'Divers débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7302, 'PCG', 'STOCK', '349', 7259, 'Comptes de régularisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7303, 'PCG', 'STOCK', '3491', 7302, 'Charges constatées d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7304, 'PCG', 'STOCK', '3493', 7302, 'Intérêts courus et non échus à percevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7305, 'PCG', 'STOCK', '3495', 7302, 'Comptes de participations périodique des charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7306, 'PCG', 'STOCK', '3497', 7302, 'Comptes transitoires ou d''attente - débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7307, 'PCG', 'STOCK', '35', 7210, 'Titres te valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7308, 'PCG', 'STOCK', '3502', 7307, 'Actions, partie non libérée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7309, 'PCG', 'STOCK', '3504', 7307, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7310, 'PCG', 'STOCK', '3506', 7307, 'Bons de caisse et bons de trésor', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7311, 'PCG', 'STOCK', '35061', 7310, 'Bons de caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7312, 'PCG', 'STOCK', '35062', 7310, 'Bons de trésor', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7313, 'PCG', 'STOCK', '3508', 7307, 'Autres titres et valeurs de placement similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7314, 'PCG', 'STOCK', '37', 7210, 'Ecarts de conversion-actif (éléments circulants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7315, 'PCG', 'STOCK', '3701', 7314, 'Diminution des créances circulantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7316, 'PCG', 'STOCK', '3702', 7314, 'Diminution des dettes circulantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7317, 'PCG', 'STOCK', '39', 7210, 'Provision pour dépréciation des comptes de l''actif circulant',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7318, 'PCG', 'STOCK', '391', 7317, 'Provisions pour dépréciation des stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7319, 'PCG', 'STOCK', '3911', 7318, 'Provisions pour dépréciation des Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7320, 'PCG', 'STOCK', '3912', 7318, 'Provisions pour dépréciation des matières et fournitures',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7321, 'PCG', 'STOCK', '3913', 7318, 'Provisions pour dépréciation des produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7322, 'PCG', 'STOCK', '3914', 7318, 'Provisions pour dépréciation des produits intermédiaires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7323, 'PCG', 'STOCK', '3915', 7318, 'Provisions pour dépréciation des produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7324, 'PCG', 'STOCK', '394', 7317,
        'Provisions pour dépréciation des créances de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7325, 'PCG', 'STOCK', '3941', 7324,
        'Provisions pour dépréciation - fournisseurs débiteurs, avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7326, 'PCG', 'STOCK', '3942', 7324, 'Provisions pour dépréciation des clients et comptes rattachés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7327, 'PCG', 'STOCK', '3943', 7324, 'Provisions pour dépréciation du personnel - débiteur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7328, 'PCG', 'STOCK', '3946', 7324,
        'Provisions pour dépréciation des comptes d''associés débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7329, 'PCG', 'STOCK', '3948', 7324, 'Provisions pour dépréciation des autres débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7330, 'PCG', 'STOCK', '395', 7317, 'Provisions pour dépréciation des titres et valeur de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7331, 'PCG', 'THIRDPARTY', '4', '', 'Comptes de passif circulant (Hors trésorerie)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7332, 'PCG', 'THIRDPARTY', '44', 7331, 'Dettes du passif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7333, 'PCG', 'THIRDPARTY', '441', 7332, 'Fournisseurs et comptes rattachés ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7334, 'PCG', 'THIRDPARTY', '4411', 7333, 'Fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7335, 'PCG', 'THIRDPARTY', '44111', 7334, 'Fournisseurs - catégorie A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7336, 'PCG', 'THIRDPARTY', '44112', 7334, 'Fournisseurs - catégorie B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7337, 'PCG', 'THIRDPARTY', '4413', 7333, 'Fournisseurs - retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7338, 'PCG', 'THIRDPARTY', '4415', 7333, 'Fournisseurs - effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7339, 'PCG', 'THIRDPARTY', '4417', 7333, 'Fournisseurs - factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7340, 'PCG', 'THIRDPARTY', '4418', 7333, 'Autres fournisseurs et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7341, 'PCG', 'THIRDPARTY', '442', 7332, 'Clients créditeurs, avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7342, 'PCG', 'THIRDPARTY', '4421', 7341,
        'Clients - avances et acomptes reçus sur commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7343, 'PCG', 'THIRDPARTY', '4425', 7341, 'Clients - dettes pour emballages et matériel consignés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7344, 'PCG', 'THIRDPARTY', '4427', 7341,
        'Rabais, remises et ristournes à accorder - avoirs à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7345, 'PCG', 'THIRDPARTY', '4428', 7341, 'Autres clients créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7346, 'PCG', 'THIRDPARTY', '443', 7332, 'Personnel - créditeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7347, 'PCG', 'THIRDPARTY', '4432', 7346, 'Rémunérations dues au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7348, 'PCG', 'THIRDPARTY', '4433', 7346, 'Dépôts du personnel créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7349, 'PCG', 'THIRDPARTY', '4434', 7346, 'Oppositions sur salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7350, 'PCG', 'THIRDPARTY', '4437', 7346, 'Charges de personnel à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7351, 'PCG', 'THIRDPARTY', '4438', 7346, 'Personnel - autres créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7352, 'PCG', 'THIRDPARTY', '444', 7332, 'Organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7353, 'PCG', 'THIRDPARTY', '4441', 7352, 'Caisse nationale de la sécurité sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7354, 'PCG', 'THIRDPARTY', '4443', 7352, 'Caisses de retraite', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7355, 'PCG', 'THIRDPARTY', '4445', 7352, 'Mutuelles ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7356, 'PCG', 'THIRDPARTY', '4447', 7352, 'charges sociales à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7357, 'PCG', 'THIRDPARTY', '4448', 7352, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7358, 'PCG', 'THIRDPARTY', '445', 7332, 'Etat - créditeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7359, 'PCG', 'THIRDPARTY', '4452', 7358, 'Etat, impôts, taxes et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7360, 'PCG', 'THIRDPARTY', '44521', 7359, 'Etat, taxe urbaine et taxe d''édilité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7361, 'PCG', 'THIRDPARTY', '44522', 7359, 'Etat, patente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7362, 'PCG', 'THIRDPARTY', '44525', 7358, 'Etat, PTS et PSN', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7363, 'PCG', 'THIRDPARTY', '4453', 7358, 'Etat, impôts sur les résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7364, 'PCG', 'THIRDPARTY', '4455', 7358, 'Etat, TVA facturée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7365, 'PCG', 'THIRDPARTY', '4456', 7358, 'Etat, TVA due (suivant déclarations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7366, 'PCG', 'THIRDPARTY', '4457', 7358, 'Etat, impôts et taxes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7367, 'PCG', 'THIRDPARTY', '4458', 7358, 'Etat, autres comptes créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7368, 'PCG', 'THIRDPARTY', '446', 7332, 'Comptes d''associés - créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7369, 'PCG', 'THIRDPARTY', '4461', 7368, 'Associés - capital à rembourser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7370, 'PCG', 'THIRDPARTY', '4462', 7368, 'Associés - versements reçus sur augmentation de capital',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7371, 'PCG', 'THIRDPARTY', '4463', 7368, 'Comptes courants des associés - créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7372, 'PCG', 'THIRDPARTY', '4464', 7368, 'Associés - opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7373, 'PCG', 'THIRDPARTY', '4465', 7368, 'Associés - dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7374, 'PCG', 'THIRDPARTY', '4468', 7368, 'Autres comptes d''associés créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7375, 'PCG', 'THIRDPARTY', '448', 7332, 'Autres créanciers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7376, 'PCG', 'THIRDPARTY', '4481', 7375, 'Dettes sur acquisition des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7377, 'PCG', 'THIRDPARTY', '4483', 7375,
        'Dettes sur acquisition des titres et valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7378, 'PCG', 'THIRDPARTY', '4484', 7375, 'Obligations échus à rembourser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7379, 'PCG', 'THIRDPARTY', '4485', 7375, 'Obligations, coupons à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7380, 'PCG', 'THIRDPARTY', '4487', 7375, 'Dettes rattachées aux autres créanciers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7381, 'PCG', 'THIRDPARTY', '4488', 7375, 'Divers créanciers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7382, 'PCG', 'THIRDPARTY', '449', 7332, 'Comptes de régularisation - passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7383, 'PCG', 'THIRDPARTY', '4491', 7382, 'Produits constatés d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7384, 'PCG', 'THIRDPARTY', '4493', 7382, 'Intérêts courus et non échus à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7385, 'PCG', 'THIRDPARTY', '4495', 7382, 'Comptes de répartition périodique des produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7386, 'PCG', 'THIRDPARTY', '4497', 7382, 'Comptes transitoires ou d''attente - créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7387, 'PCG', 'THIRDPARTY', '45', 7331, 'Autres provisions pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7388, 'PCG', 'THIRDPARTY', '4501', 7387, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7389, 'PCG', 'THIRDPARTY', '4502', 7387, 'Provisions pour garanties données aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7390, 'PCG', 'THIRDPARTY', '4505', 7387, 'Provisions pour amendes, doubles droits et pénalités',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7391, 'PCG', 'THIRDPARTY', '4506', 7387, 'Provisions pour pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7392, 'PCG', 'THIRDPARTY', '4507', 7387, 'Provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7393, 'PCG', 'THIRDPARTY', '4508', 7387, 'Autres provisions pour risque et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7394, 'PCG', 'THIRDPARTY', '47', 7331, 'Ecarts de conversion - Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7395, 'PCG', 'THIRDPARTY', '4701', 7394, 'Augmentation des créances circulantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7396, 'PCG', 'THIRDPARTY', '4702', 7394, 'Diminution des dettes circulantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7397, 'PCG', 'FINAN', '5', '', 'Comptes de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7398, 'PCG', 'FINAN', '51', 7397, 'Trésorerie - actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7399, 'PCG', 'FINAN', '511', 7398, 'Chèques et valeurs à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7400, 'PCG', 'FINAN', '5111', 7399, 'Chèques à encaisser ou à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7401, 'PCG', 'FINAN', '51111', 7400, 'Chèques en portefeuille', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7402, 'PCG', 'FINAN', '51112', 7400, 'Chèques à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7403, 'PCG', 'FINAN', '5113', 7399, 'Effets à encaisser ou à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7404, 'PCG', 'FINAN', '51131', 7403, 'Effets échus à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7405, 'PCG', 'FINAN', '51132', 7403, 'Effets à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7406, 'PCG', 'FINAN', '5115', 7399, 'Virements de fonds', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7407, 'PCG', 'FINAN', '5118', 7399, 'Autres valeurs à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7408, 'PCG', 'FINAN', '514', 7398, 'Banques, Trésorerie Générale et Chèques Postaux débiteurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7409, 'PCG', 'FINAN', '5141', 7408, 'Banques (soldes débiteurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7410, 'PCG', 'FINAN', '5143', 7408, 'Trésorerie Générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7411, 'PCG', 'FINAN', '5146', 7408, 'Chèques postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7412, 'PCG', 'FINAN', '5148', 7408,
        'Autres établissements financiers et assimilés (soldes débiteurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7413, 'PCG', 'FINAN', '516', 7398, 'Caisses, régies d''avances et accréditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7414, 'PCG', 'FINAN', '5161', 7413, 'Caisses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7415, 'PCG', 'FINAN', '51611', 7414, 'Caisse Centrale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7416, 'PCG', 'FINAN', '51613', 7414, 'Caisse (Succursale ou agence A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7417, 'PCG', 'FINAN', '51614', 7414, 'Caisse (Succursale ou agence B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7418, 'PCG', 'FINAN', '5165', 7413, 'Régies d''avances et accréditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7419, 'PCG', 'FINAN', '55', 7397, 'Trésorerie - Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7420, 'PCG', 'FINAN', '552', 7419, 'Crédits d''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7421, 'PCG', 'FINAN', '553', 7419, 'Crédits de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7422, 'PCG', 'FINAN', '554', 7419, 'Banques (soldes créditeurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7423, 'PCG', 'FINAN', '5541', 7422, 'Banques (soldes créditeurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7424, 'PCG', 'FINAN', '5548', 7422,
        'Autres établissements financiers et assimilés (soldes créditeurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7425, 'PCG', 'FINAN', '59', 7397, 'Provisions pour dépréciation des comptes de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7426, 'PCG', 'EXPENSE', '6', '', 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7427, 'PCG', 'EXPENSE', '61', 7426, 'Charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7428, 'PCG', 'EXPENSE', '611', 7427, 'Achats revendus de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7429, 'PCG', 'EXPENSE', '6111', 7428, 'Achats de marchandises (Groupe A)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7430, 'PCG', 'EXPENSE', '6112', 7428, 'Achats de marchandises (Groupe B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7431, 'PCG', 'EXPENSE', '6114', 7428, 'Variation des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7432, 'PCG', 'EXPENSE', '6118', 7428, 'Achats revendus de marchandises des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7433, 'PCG', 'EXPENSE', '6119', 7428,
        'Rabais, remises, et ristournes obtenus sur achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7434, 'PCG', 'EXPENSE', '612', 7427, 'Achats consommés de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7435, 'PCG', 'EXPENSE', '6121', 7434, 'Achats de matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7436, 'PCG', 'EXPENSE', '61211', 7435, 'Achats de matières premières A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7437, 'PCG', 'EXPENSE', '61212', 7435, 'Achats de matières premières B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7438, 'PCG', 'EXPENSE', '6122', 7434, 'Achats de matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7439, 'PCG', 'EXPENSE', '61221', 7438, 'Achats de matières et fournitures A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7440, 'PCG', 'EXPENSE', '61222', 7438, 'Achats de matières et fournitures B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7441, 'PCG', 'EXPENSE', '61223', 7438, 'Achats de combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7442, 'PCG', 'EXPENSE', '61224', 7438, 'Achats de produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7443, 'PCG', 'EXPENSE', '61225', 7438, 'Achats de fournitures d''atelier d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7444, 'PCG', 'EXPENSE', '61226', 7438, 'Achats de fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7445, 'PCG', 'EXPENSE', '61227', 7438, 'Achats de fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7446, 'PCG', 'EXPENSE', '6123', 7434, 'Achats d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7447, 'PCG', 'EXPENSE', '61231', 7446, 'Achats d''emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7448, 'PCG', 'EXPENSE', '61232', 7446, 'Achats d''emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7449, 'PCG', 'EXPENSE', '61233', 7446, 'Achats d''emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7450, 'PCG', 'EXPENSE', '6124', 7434, 'Variation des stocks de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7451, 'PCG', 'EXPENSE', '61241', 7450, 'Variation des stocks de matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7452, 'PCG', 'EXPENSE', '61242', 7450,
        'Variation des stocks de matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7453, 'PCG', 'EXPENSE', '61243', 7450, 'Variation des stocks d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7454, 'PCG', 'EXPENSE', '6125', 7434, 'Achats non stockés de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7455, 'PCG', 'EXPENSE', '61251', 7454, 'Achats de fournitures non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7456, 'PCG', 'EXPENSE', '61252', 7454, 'Achats de fournitures d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7457, 'PCG', 'EXPENSE', '61253', 7454, 'Achats de petit outillage et de petit équipement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7458, 'PCG', 'EXPENSE', '61254', 7454, 'Achats de fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7459, 'PCG', 'EXPENSE', '6126', 7434, 'Achats de travaux, études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7460, 'PCG', 'EXPENSE', '61261', 7459, 'Achats de travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7461, 'PCG', 'EXPENSE', '61262', 7459, 'Achats d''études', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7462, 'PCG', 'EXPENSE', '61263', 7459, 'Achats des prestations de service', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7463, 'PCG', 'EXPENSE', '6128', 7434,
        'Achats des matières et des fournitures des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7464, 'PCG', 'EXPENSE', '6129', 7434,
        'Rabais, remises, et ristournes obtenus sur achats consommés de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7465, 'PCG', 'EXPENSE', '61291', 7464,
        'Rabais, remises, et ristournes obtenus sur achats de matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7466, 'PCG', 'EXPENSE', '61292', 7464,
        'Rabais, remises, et ristournes obtenus sur achats de matières et fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7467, 'PCG', 'EXPENSE', '61293', 7464,
        'Rabais, remises, et ristournes obtenus sur achats d''emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7468, 'PCG', 'EXPENSE', '61295', 7464,
        'Rabais, remises, et ristournes obtenus sur achats non stockés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7469, 'PCG', 'EXPENSE', '61296', 7464,
        'Rabais, remises, et ristournes obtenus sur achats de travaux, études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7470, 'PCG', 'EXPENSE', '61298', 7464,
        'Rabais, remises, et ristournes obtenus sur achats de matières et fournitures des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7471, 'PCG', 'EXPENSE', '613', 7427, 'Autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7472, 'PCG', 'EXPENSE', '6131', 7471, 'Locations et charges locatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7473, 'PCG', 'EXPENSE', '61311', 7472, 'Location de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7474, 'PCG', 'EXPENSE', '61312', 7472, 'Location de constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7475, 'PCG', 'EXPENSE', '61313', 7472, 'Location de matériel et d''outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7476, 'PCG', 'EXPENSE', '61314', 7472, 'Location de matériel et matériel de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7477, 'PCG', 'EXPENSE', '61315', 7472, 'Location de matériel informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7478, 'PCG', 'EXPENSE', '61316', 7472, 'Location de matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7479, 'PCG', 'EXPENSE', '61317', 7472, 'Malis sur emballages rendus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7480, 'PCG', 'EXPENSE', '61318', 7472, 'Location et charges locatives diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7481, 'PCG', 'EXPENSE', '6132', 7471, 'Redevances de crédit bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7482, 'PCG', 'EXPENSE', '61321', 7481, 'Redevances de crédit bail, mobilier et matériel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7483, 'PCG', 'EXPENSE', '6133', 7471, 'Entretien et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7484, 'PCG', 'EXPENSE', '61331', 7483, 'Entretien et réparations des biens immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7485, 'PCG', 'EXPENSE', '61332', 7483, 'Entretien et réparations des biens mobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7486, 'PCG', 'EXPENSE', '61335', 7483, 'Maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7487, 'PCG', 'EXPENSE', '6134', 7471, 'Primes d''assurance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7488, 'PCG', 'EXPENSE', '61341', 7487,
        'Assurances multirisques (vol, incendie, responsabilité civile, etc.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7489, 'PCG', 'EXPENSE', '61343', 7487, 'Assurances - Risques d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7490, 'PCG', 'EXPENSE', '61345', 7487, 'Assurances - Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7491, 'PCG', 'EXPENSE', '61348', 7487, 'Autres assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7492, 'PCG', 'EXPENSE', '6135', 7471, 'Rémunérations du personnel extérieurs à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7493, 'PCG', 'EXPENSE', '61351', 7492, 'Rémunérations du personnel occasionnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7494, 'PCG', 'EXPENSE', '61352', 7492, 'Rémunérations du personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7495, 'PCG', 'EXPENSE', '61353', 7492,
        'Rémunérations du personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7496, 'PCG', 'EXPENSE', '6136', 7471, 'Rémunérations d''intermédiaires et honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7497, 'PCG', 'EXPENSE', '61361', 7496, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7498, 'PCG', 'EXPENSE', '61365', 7496, 'honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7499, 'PCG', 'EXPENSE', '61367', 7496, 'Frais d''actes et de contentieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7500, 'PCG', 'EXPENSE', '6137', 7471,
        'Redevances pour brevets, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7501, 'PCG', 'EXPENSE', '61371', 7500, 'Redevances pour brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7502, 'PCG', 'EXPENSE', '61378', 7500, 'Autres redevances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7503, 'PCG', 'EXPENSE', '614', 7427, 'Autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7504, 'PCG', 'EXPENSE', '6141', 7503, 'Etudes, recherches et documentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7505, 'PCG', 'EXPENSE', '61411', 7504, 'Etudes générales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7506, 'PCG', 'EXPENSE', '61413', 7504, 'Recherches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7507, 'PCG', 'EXPENSE', '61415', 7504, 'Documentation générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7508, 'PCG', 'EXPENSE', '61416', 7504, 'Documentation technique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7509, 'PCG', 'EXPENSE', '6142', 7503, 'Transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7510, 'PCG', 'EXPENSE', '61421', 7509, 'Transport du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7511, 'PCG', 'EXPENSE', '61425', 7509, 'Transport sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7512, 'PCG', 'EXPENSE', '61426', 7509, 'Transport sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7513, 'PCG', 'EXPENSE', '61428', 7509, 'Autres transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7514, 'PCG', 'EXPENSE', '6143', 7503, 'Déplacements, missions et réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7515, 'PCG', 'EXPENSE', '61431', 7514, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7516, 'PCG', 'EXPENSE', '61433', 7514, 'Frais de déménagement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7517, 'PCG', 'EXPENSE', '61435', 7514, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7518, 'PCG', 'EXPENSE', '61436', 7514, 'Réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7519, 'PCG', 'EXPENSE', '6144', 7503, 'Publicité, publications et relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7520, 'PCG', 'EXPENSE', '61441', 7519, 'Annonces et insertions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7521, 'PCG', 'EXPENSE', '61442', 7519, 'Echantillons, catalogues et imprimés publicitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7522, 'PCG', 'EXPENSE', '61443', 7519, 'Foires et expositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7523, 'PCG', 'EXPENSE', '61444', 7519, 'Primes de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7524, 'PCG', 'EXPENSE', '61446', 7519, 'Publications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7525, 'PCG', 'EXPENSE', '61447', 7519, 'Cadeaux à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7526, 'PCG', 'EXPENSE', '61448', 7519, 'Autres charges de publicité et relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7527, 'PCG', 'EXPENSE', '6145', 7503, 'Frais postaux et frais de télécommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7528, 'PCG', 'EXPENSE', '61451', 7527, 'Frais postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7529, 'PCG', 'EXPENSE', '61455', 7527, 'Frais de téléphone', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7530, 'PCG', 'EXPENSE', '61456', 7527, 'Frais de télex et de télégrammes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7531, 'PCG', 'EXPENSE', '6146', 7503, 'Cotisations et dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7532, 'PCG', 'EXPENSE', '61461', 7531, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7533, 'PCG', 'EXPENSE', '61462', 7531, 'Dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7534, 'PCG', 'EXPENSE', '6147', 7503, 'Services bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7535, 'PCG', 'EXPENSE', '61471', 7534, 'Frais d''achat et de vente des titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7536, 'PCG', 'EXPENSE', '61472', 7534, 'Frais sur effet de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7537, 'PCG', 'EXPENSE', '61473', 7534, 'Frais et commissions sur services bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7538, 'PCG', 'EXPENSE', '6148', 7503, 'Autres charges externes des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7539, 'PCG', 'EXPENSE', '6149', 7503,
        'Rabais, remises et ristournes obtenus sur autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7540, 'PCG', 'EXPENSE', '616', 7427, 'Impôts et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7541, 'PCG', 'EXPENSE', '6161', 7540, 'Impôts et taxes directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7542, 'PCG', 'EXPENSE', '61611', 7541, 'Taxe urbaine et taxe d''édilité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7543, 'PCG', 'EXPENSE', '61612', 7541, 'Patente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7544, 'PCG', 'EXPENSE', '61615', 7541, 'Taxes locales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7545, 'PCG', 'EXPENSE', '6165', 7540, 'Impôts et taxes indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7546, 'PCG', 'EXPENSE', '6167', 7540, 'Impôts, taxes et droits assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7547, 'PCG', 'EXPENSE', '61671', 7546, 'Droits d''enregistrement et timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7548, 'PCG', 'EXPENSE', '61673', 7546, 'Taxes sur les véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7549, 'PCG', 'EXPENSE', '61678', 7546, 'Autres impôts, taxes et droits assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7550, 'PCG', 'EXPENSE', '6168', 7540, 'Impôts et taxes des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7551, 'PCG', 'EXPENSE', '617', 7427, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7552, 'PCG', 'EXPENSE', '6171', 7551, 'Rémunération du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7553, 'PCG', 'EXPENSE', '61711', 7552, 'Appointements et salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7554, 'PCG', 'EXPENSE', '61712', 7552, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7555, 'PCG', 'EXPENSE', '61713', 7552, 'Indemnités et avantages divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7556, 'PCG', 'EXPENSE', '61714', 7552, 'Commissions au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7557, 'PCG', 'EXPENSE', '61715', 7552, 'Rémunération des administrateurs, gérants et associés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7558, 'PCG', 'EXPENSE', '6174', 7551, 'charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7559, 'PCG', 'EXPENSE', '61741', 7559, 'Cotisations de sécurité sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7560, 'PCG', 'EXPENSE', '61742', 7559, 'Cotisations aux caisses de retraite', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7561, 'PCG', 'EXPENSE', '61743', 7559, 'Cotisations aux mutuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7562, 'PCG', 'EXPENSE', '61744', 7559, 'Prestations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7563, 'PCG', 'EXPENSE', '61745', 7559, 'Assurances accidents de travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7564, 'PCG', 'EXPENSE', '6176', 7551, 'Charges sociales diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7565, 'PCG', 'EXPENSE', '61761', 7564, 'Assurances groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7566, 'PCG', 'EXPENSE', '61762', 7564, 'Prestations de retraites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7567, 'PCG', 'EXPENSE', '61763', 7564, 'Allocations aux oeuvres sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7568, 'PCG', 'EXPENSE', '61764', 7564, 'Habillement et vêtements de travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7569, 'PCG', 'EXPENSE', '61765', 7564, 'Indemnités de préavis et de licenciement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7570, 'PCG', 'EXPENSE', '61766', 7564, 'Médecine du travail, pharmacie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7571, 'PCG', 'EXPENSE', '61768', 7564, 'Autres charges sociales diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7572, 'PCG', 'EXPENSE', '6177', 7551, 'Rémunération de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7573, 'PCG', 'EXPENSE', '61771', 7573, 'Appointements et salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7574, 'PCG', 'EXPENSE', '61774', 7573,
        'Charges sociales sur appointements et salaires de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7575, 'PCG', 'EXPENSE', '6178', 7551, 'Charges de personnel des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7576, 'PCG', 'EXPENSE', '618', 7427, 'Autres charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7577, 'PCG', 'EXPENSE', '6181', 7576, 'Jetons de présence', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7578, 'PCG', 'EXPENSE', '6182', 7576, 'Pertes sur créances irrécouvrables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7579, 'PCG', 'EXPENSE', '6185', 7576, 'Pertes sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7580, 'PCG', 'EXPENSE', '6186', 7576, 'Transferts de profits sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7581, 'PCG', 'EXPENSE', '6188', 7576, 'Autres charges d''exploitation des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7582, 'PCG', 'EXPENSE', '619', 7427, 'Dotation d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7583, 'PCG', 'EXPENSE', '6191', 7582,
        'Dotations d''exploitation aux amortissements de l''immobilisation en non-valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7584, 'PCG', 'EXPENSE', '61911', 7583,
        'Dotations d''exploitation aux amortissements des frais préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7585, 'PCG', 'EXPENSE', '61912', 7583,
        'Dotations d''exploitation aux amortissements des charges à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7586, 'PCG', 'EXPENSE', '6192', 7582,
        'Dotations d''exploitation aux amortissements de l''immobilisation incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7587, 'PCG', 'EXPENSE', '61921', 7586,
        'Dotations d''exploitation aux amortissements de l''immobilisation en recherche et développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7588, 'PCG', 'EXPENSE', '61922', 7586,
        'Dotations d''exploitation aux amortissements des brevets, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7589, 'PCG', 'EXPENSE', '61923', 7586,
        'Dotations d''exploitation aux amortissements du fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7590, 'PCG', 'EXPENSE', '61928', 7586,
        'Dotations d''exploitation aux amortissements des autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7591, 'PCG', 'EXPENSE', '6193', 7582,
        'Dotations d''exploitation aux amortissements des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7592, 'PCG', 'EXPENSE', '61931', 7591, 'Dotations d''exploitation aux amortissements des terrains',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7593, 'PCG', 'EXPENSE', '61932', 7591,
        'Dotations d''exploitation aux amortissements des constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7594, 'PCG', 'EXPENSE', '61933', 7591,
        'Dotations d''exploitation aux amortissements des installations techniques, matériel et outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7595, 'PCG', 'EXPENSE', '61934', 7591,
        'Dotations d''exploitation aux amortissements du matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7596, 'PCG', 'EXPENSE', '61935', 7591,
        'Dotations d''exploitation aux amortissements des mobilier, matériel de bureau et aménagement divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7597, 'PCG', 'EXPENSE', '61938', 7591,
        'Dotations d''exploitation aux amortissements des autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7598, 'PCG', 'EXPENSE', '6194', 7582,
        'Dotations d''exploitation aux provisions pour dépréciation des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7599, 'PCG', 'EXPENSE', '61942', 7598,
        'Dotations d''exploitation aux provisions pour dépréciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7600, 'PCG', 'EXPENSE', '61943', 7598,
        'Dotations d''exploitation aux provisions pour dépréciation des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7601, 'PCG', 'EXPENSE', '6195', 7582,
        'Dotations d''exploitation aux provisions pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7602, 'PCG', 'EXPENSE', '61955', 7601,
        'Dotations d''exploitation aux provisions pour risques et charges durables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7603, 'PCG', 'EXPENSE', '61957', 7601,
        'Dotations d''exploitation aux provisions pour risques et charges momentanés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7604, 'PCG', 'EXPENSE', '6196', 7582,
        'Dotations d''exploitation aux provisions pour dépréciation de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7605, 'PCG', 'EXPENSE', '61961', 7604,
        'Dotations d''exploitation aux provisions pour dépréciation des stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7606, 'PCG', 'EXPENSE', '61964', 7604,
        'Dotations d''exploitation aux provisions pour dépréciation des créances de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7607, 'PCG', 'EXPENSE', '6198', 7582, 'Dotations d''exploitation des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7608, 'PCG', 'EXPENSE', '61981', 7607,
        'Dotations d''exploitation aux amortissements des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7609, 'PCG', 'EXPENSE', '61984', 7607,
        'Dotations d''exploitation aux provisions des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7610, 'PCG', 'EXPENSE', '63', 7426, 'Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7611, 'PCG', 'EXPENSE', '631', 7610, 'Charges d''intérêt', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7612, 'PCG', 'EXPENSE', '6311', 7611, 'Intérêts des emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7613, 'PCG', 'EXPENSE', '63111', 7612, 'Intérêts des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7614, 'PCG', 'EXPENSE', '63113', 7612, 'Intérêts des dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7615, 'PCG', 'EXPENSE', '63114', 7612, 'Intérêts des comptes courants et dépôts créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7616, 'PCG', 'EXPENSE', '63115', 7612, 'Intérêts bancaires et sur opérations de financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7617, 'PCG', 'EXPENSE', '63118', 7612, 'Autres intérêts des emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7618, 'PCG', 'EXPENSE', '6318', 7611, 'Charges d''intérêt des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7619, 'PCG', 'EXPENSE', '633', 7610, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7620, 'PCG', 'EXPENSE', '6331', 7619, 'Pertes de change propres à l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7621, 'PCG', 'EXPENSE', '6338', 7619, 'Pertes de change des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7622, 'PCG', 'EXPENSE', '638', 7610, 'Autres charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7623, 'PCG', 'EXPENSE', '6382', 7622, 'Pertes sur créances liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7624, 'PCG', 'EXPENSE', '6385', 7622,
        'Charges nettes sur cessions de titres et valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7625, 'PCG', 'EXPENSE', '6386', 7622, 'Escomptes accordés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7626, 'PCG', 'EXPENSE', '6388', 7622, 'Autres charges financières des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7627, 'PCG', 'EXPENSE', '639', 7610, 'Dotations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7628, 'PCG', 'EXPENSE', '6391', 7627,
        'Dotations aux amortissements des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7629, 'PCG', 'EXPENSE', '6392', 7627,
        'Dotations aux provisions pour dépréciation des immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7630, 'PCG', 'EXPENSE', '6393', 7627,
        'Dotations aux provisions pour risques et charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7631, 'PCG', 'EXPENSE', '6394', 7627,
        'Dotations aux provisions pour dépréciation des titres et valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7632, 'PCG', 'EXPENSE', '6396', 7627,
        'Dotations aux provisions pour dépréciation des comptes de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7633, 'PCG', 'EXPENSE', '6398', 7627, 'Dotations financières des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7634, 'PCG', 'EXPENSE', '65', 7426, 'Charges non courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7635, 'PCG', 'EXPENSE', '651', 7634, 'Valeurs nettes d''amortissements des immobilisations cédées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7636, 'PCG', 'EXPENSE', '6512', 7635,
        'Valeurs nettes d''amortissement des immobilisations incorporelles cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7637, 'PCG', 'EXPENSE', '6513', 7635,
        'Valeurs nettes d''amortissement des immobilisations corporelles cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7638, 'PCG', 'EXPENSE', '6514', 7635,
        'Valeurs nettes d''amortissement des immobilisations financières cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7639, 'PCG', 'EXPENSE', '6518', 7635,
        'Valeurs nettes d''amortissement des immobilisations cédées des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7640, 'PCG', 'EXPENSE', '656', 7634, 'Subventions accordées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7641, 'PCG', 'EXPENSE', '6561', 7640, 'Subventions accordées de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7642, 'PCG', 'EXPENSE', '6568', 7640, 'Subventions accordées des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7643, 'PCG', 'EXPENSE', '658', 7634, 'Autres charges non courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7644, 'PCG', 'EXPENSE', '6581', 7643, 'Pénalités sur marchés et dédits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7645, 'PCG', 'EXPENSE', '65811', 7644, 'Pénalités sur marchés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7646, 'PCG', 'EXPENSE', '65812', 7644, 'Dédits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7647, 'PCG', 'EXPENSE', '6582', 7643, 'Rappels d''impôts (autres qu''impôts sur les résultats)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7648, 'PCG', 'EXPENSE', '6583', 7643, 'Pénalités et amendes fiscales ou pénales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7649, 'PCG', 'EXPENSE', '65831', 7648, 'Pénalités et amendes fiscales ou pénales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7650, 'PCG', 'EXPENSE', '65833', 7648, 'Pénalités et amendes pénales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7651, 'PCG', 'EXPENSE', '6585', 7643, 'Créances devenues irrécouvrables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7652, 'PCG', 'EXPENSE', '6586', 7643, 'Dons, libéralités et lots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7653, 'PCG', 'EXPENSE', '65861', 7652, 'Dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7654, 'PCG', 'EXPENSE', '65862', 7652, 'Libéralités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7655, 'PCG', 'EXPENSE', '65863', 7652, 'Lots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7656, 'PCG', 'EXPENSE', '6588', 7643, 'Autres charges non courantes des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7657, 'PCG', 'EXPENSE', '659', 7634, 'Dotations pour courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7658, 'PCG', 'EXPENSE', '6591', 7657,
        'Dotations aux amortissements exceptionnels des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7659, 'PCG', 'EXPENSE', '65911', 7658,
        'Dotations aux amortissements exceptionnels de l''immobilisation en non valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7660, 'PCG', 'EXPENSE', '65912', 7658,
        'Dotations aux amortissements exceptionnels des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7661, 'PCG', 'EXPENSE', '65913', 7658,
        'Dotations aux amortissements exceptionnels des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7662, 'PCG', 'EXPENSE', '6594', 7657, 'Dotations non courantes aux provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7663, 'PCG', 'EXPENSE', '65941', 7662, 'Dotations non courantes aux amortissements dérogatoires',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7664, 'PCG', 'EXPENSE', '65942', 7662,
        'Dotations non courantes pour plus-values en instance d''imposition', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7665, 'PCG', 'EXPENSE', '65944', 7662, 'Dotations non courantes pour investissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7666, 'PCG', 'EXPENSE', '65945', 7662, 'Dotations non courantes pour reconstitution de gisements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7667, 'PCG', 'EXPENSE', '65946', 7662,
        'Dotations non courantes pour acquisition et construction de logement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7668, 'PCG', 'EXPENSE', '6595', 7657,
        'Dotations non courantes aux provisions pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7669, 'PCG', 'EXPENSE', '65955', 7668,
        'Dotations non courantes aux provisions pour risques et charges durables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7670, 'PCG', 'EXPENSE', '65957', 7668,
        'Dotations non courantes aux provisions pour risques et charges momentanés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7671, 'PCG', 'EXPENSE', '6596', 7657, 'Dotations non courantes aux provisions pour dépréciation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7672, 'PCG', 'EXPENSE', '65962', 7671,
        'Dotations non courantes aux provisions pour dépréciation de l''actif immobilisé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7673, 'PCG', 'EXPENSE', '65963', 7671,
        'Dotations non courantes aux provisions pour dépréciation de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7674, 'PCG', 'EXPENSE', '6598', 7671, 'Dotations non courantes des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7675, 'PCG', 'EXPENSE', '67', 7426, 'Impôts sur le résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7676, 'PCG', 'EXPENSE', '6701', 7675, 'Impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7677, 'PCG', 'EXPENSE', '6705', 7675, 'Imposition minimale annuelle des sociétés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7678, 'PCG', 'EXPENSE', '6708', 7675, 'Rappels et dégrèvements des impôts sur les résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7679, 'PCG', 'INCOME', '7', '', 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7680, 'PCG', 'INCOME', '71', 7679, 'Produits d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7681, 'PCG', 'INCOME', '711', 7680, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7682, 'PCG', 'INCOME', '7111', 7681, 'Ventes de marchandises au Maroc', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7683, 'PCG', 'INCOME', '7113', 7681, 'Ventes de marchandises à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7684, 'PCG', 'INCOME', '7118', 7681, 'Ventes de marchandises des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7685, 'PCG', 'INCOME', '7119', 7681, 'Rabais, remises et ristournes accordés par l''entreprise',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7686, 'PCG', 'INCOME', '712', 7680, 'Ventes de biens et services produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7687, 'PCG', 'INCOME', '7121', 7686, 'Ventes de biens et services produits au Maroc', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7688, 'PCG', 'INCOME', '71211', 7687, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7689, 'PCG', 'INCOME', '71212', 7687, 'Ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7690, 'PCG', 'INCOME', '71217', 7687, 'Ventes de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7691, 'PCG', 'INCOME', '7122', 7686, 'Ventes de biens produits à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7692, 'PCG', 'INCOME', '71221', 7691, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7693, 'PCG', 'INCOME', '71222', 7691, 'Ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7694, 'PCG', 'INCOME', '7124', 7686, 'Ventes de services produits au Maroc', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7695, 'PCG', 'INCOME', '71241', 7694, 'Travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7696, 'PCG', 'INCOME', '71242', 7694, 'Etudes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7697, 'PCG', 'INCOME', '71243', 7694, 'Prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7698, 'PCG', 'INCOME', '7125', 7686, 'Ventes de services produits à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7699, 'PCG', 'INCOME', '71251', 7698, 'Travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7700, 'PCG', 'INCOME', '71252', 7698, 'Etudes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7701, 'PCG', 'INCOME', '71253', 7698, 'Prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7702, 'PCG', 'INCOME', '7126', 7686,
        'Redevances pour brevets, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7703, 'PCG', 'INCOME', '7127', 7686, 'Ventes de produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7704, 'PCG', 'INCOME', '71271', 7703, 'Locations diverses reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7705, 'PCG', 'INCOME', '71272', 7703, 'Commissions et courtages reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7706, 'PCG', 'INCOME', '71273', 7703, 'Produits de services exploités dans l''intérêt du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7707, 'PCG', 'INCOME', '71275', 7703, 'Bonis sur reprises d''emballages consignés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7708, 'PCG', 'INCOME', '71276', 7703, 'Ports et frais accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7709, 'PCG', 'INCOME', '71278', 7703, 'Autres ventes de produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7710, 'PCG', 'INCOME', '7128', 7686,
        'Ventes de biens set services produits des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7711, 'PCG', 'INCOME', '7129', 7686, 'Rabais, remises et ristournes accordés par l''entreprise',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7712, 'PCG', 'INCOME', '71291', 7711,
        'Rabais, remises et ristournes accordés sur ventes au Maroc des biens produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7713, 'PCG', 'INCOME', '71292', 7711,
        'Rabais, remises et ristournes accordés sur ventes à l''étranger des biens produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7714, 'PCG', 'INCOME', '71294', 7711,
        'Rabais, remises et ristournes accordés sur ventes au Maroc des services produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7715, 'PCG', 'INCOME', '71295', 7711,
        'Rabais, remises et ristournes accordés sur ventes à l''étranger des services produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7716, 'PCG', 'INCOME', '71298', 7711,
        'Rabais, remises et ristournes accordés sur ventes des biens et services produits des exercices antérieurs ',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7717, 'PCG', 'INCOME', '713', 7680, 'Variations des stocks des produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7718, 'PCG', 'INCOME', '7131', 7717, 'Variations des stocks des produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7719, 'PCG', 'INCOME', '71311', 7718, 'Variations des stocks de biens produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7720, 'PCG', 'INCOME', '71312', 7718, 'Variations des stocks de produits intermédiaires en cours ',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7721, 'PCG', 'INCOME', '71317', 7718, 'Variations des stocks de produits résiduels en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7722, 'PCG', 'INCOME', '7132', 7717, 'Variations des stocks de biens produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7723, 'PCG', 'INCOME', '71321', 7722, 'Variations des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7724, 'PCG', 'INCOME', '71322', 7722, 'Variations des stocks de produits intermédiaires ', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7725, 'PCG', 'INCOME', '71327', 7722, 'Variations des stocks de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7726, 'PCG', 'INCOME', '7134', 7717, 'Variations des stocks de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7727, 'PCG', 'INCOME', '71341', 7726, 'Variations des stocks de travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7728, 'PCG', 'INCOME', '71342', 7726, 'Variations des stocks d''études en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7729, 'PCG', 'INCOME', '71343', 7726, 'Variations des stocks de prestations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7730, 'PCG', 'INCOME', '714', 7680, 'Immobilisations produits par l''entreprise pour elle-même',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7731, 'PCG', 'INCOME', '7141', 7730, 'Immobilisations en non-valeurs produites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7732, 'PCG', 'INCOME', '7142', 7730, 'Immobilisations incorporelles produites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7733, 'PCG', 'INCOME', '7143', 7730, 'Immobilisations corporelles produites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7734, 'PCG', 'INCOME', '7148', 7730, 'Immobilisations produites des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7735, 'PCG', 'INCOME', '716', 7680, 'Subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7736, 'PCG', 'INCOME', '7161', 7735, 'Subventions d''exploitation reçues de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7737, 'PCG', 'INCOME', '7168', 7735, 'Subventions d''exploitation reçues des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7738, 'PCG', 'INCOME', '718', 7680, 'Autres produits d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7739, 'PCG', 'INCOME', '7181', 7738, 'Jetons de présence reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7740, 'PCG', 'INCOME', '7182', 7738, 'Revenus des immeubles non affectées à l''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7741, 'PCG', 'INCOME', '7185', 7738, 'Profits sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7742, 'PCG', 'INCOME', '7186', 7738, 'Transferts de profits sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7743, 'PCG', 'INCOME', '7188', 7738, 'Autres produits d''exploitation des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7744, 'PCG', 'INCOME', '719', 7680, 'Reprises d''exploitation ; Transfert de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7745, 'PCG', 'INCOME', '7191', 7744,
        'Reprises sur amortissements de l''immobilisation en non-valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7746, 'PCG', 'INCOME', '7192', 7744,
        'Reprises sur amortissements des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7747, 'PCG', 'INCOME', '7193', 7744, 'Reprises sur amortissements des immobilisations corporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7748, 'PCG', 'INCOME', '7194', 7744,
        'Reprises sur provisions pour dépréciation des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7749, 'PCG', 'INCOME', '7195', 7744, 'Reprises sur provisions pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7750, 'PCG', 'INCOME', '7196', 7744,
        'Reprises sur provisions pour dépréciation de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7751, 'PCG', 'INCOME', '7197', 7744, 'Transfert de charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7752, 'PCG', 'INCOME', '71971', 7751,
        'Transfert de charges d''exploitation - achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7753, 'PCG', 'INCOME', '71972', 7751,
        'Transfert de charges d''exploitation - achats consommés de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7754, 'PCG', 'INCOME', '71973', 7751,
        'Transfert de charges d''exploitation - autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7755, 'PCG', 'INCOME', '71975', 7751, 'Transfert de charges d''exploitation - impôts et taxes',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7756, 'PCG', 'INCOME', '71976', 7751, 'Transfert de charges d''exploitation - charges de personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7757, 'PCG', 'INCOME', '71978', 7751,
        'Transfert de charges d''exploitation - autres charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7758, 'PCG', 'INCOME', '7198', 7744,
        'Reprises sur amortissements et provisions des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7759, 'PCG', 'INCOME', '71981', 7758, 'Reprises sur amortissements des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7760, 'PCG', 'INCOME', '71984', 7758, 'Reprises sur Provisions des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7761, 'PCG', 'INCOME', '73', 7679, 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7762, 'PCG', 'INCOME', '732', 7761,
        'Produits des titres de participation et des autres titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7763, 'PCG', 'INCOME', '7321', 7762, 'Revenus des titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7764, 'PCG', 'INCOME', '7325', 7762, 'Revenus des titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7765, 'PCG', 'INCOME', '7328', 7762,
        'Produits des titres de participation et des autres titres immobilisés des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7766, 'PCG', 'INCOME', '733', 7761, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7767, 'PCG', 'INCOME', '7331', 7766, 'Gains de change propres à l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7768, 'PCG', 'INCOME', '7338', 7766, 'Gains de change des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7769, 'PCG', 'INCOME', '738', 7761, 'Intérêts et autres produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7770, 'PCG', 'INCOME', '7381', 7769, 'Intérêts et produits assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7771, 'PCG', 'INCOME', '73811', 7770, 'Intérêts des prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7772, 'PCG', 'INCOME', '73813', 7770, 'Revenus des autres créances financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7773, 'PCG', 'INCOME', '7383', 7769, 'Revenus des créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7774, 'PCG', 'INCOME', '7384', 7769, 'Revenus des titres et valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7775, 'PCG', 'INCOME', '7385', 7769, 'Produits nets sur cessions de titres et valeurs de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7776, 'PCG', 'INCOME', '7386', 7769, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7777, 'PCG', 'INCOME', '7388', 7769,
        'Intérêts et autres produits financiers des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7778, 'PCG', 'INCOME', '739', 7761, 'Reprises financières ; Transfert de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7779, 'PCG', 'INCOME', '7391', 7778,
        'Reprises sur amortissement des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7780, 'PCG', 'INCOME', '7392', 7778,
        'Reprises sur provisions pour dépréciation des immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7781, 'PCG', 'INCOME', '7393', 7778, 'Reprises sur provisions pour risques et charges financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7782, 'PCG', 'INCOME', '7394', 7778,
        'Reprises sur provisions pour dépréciation des titres et valeurs de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7783, 'PCG', 'INCOME', '7396', 7778,
        'Reprises sur provisions pour dépréciation des comptes de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7784, 'PCG', 'INCOME', '7397', 7778, 'Transfert de charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7785, 'PCG', 'INCOME', '73971', 7784, 'Transferts - charges d''intérêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7786, 'PCG', 'INCOME', '73973', 7784, 'Transferts - pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7787, 'PCG', 'INCOME', '73978', 7784, 'Transferts - autres charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7788, 'PCG', 'INCOME', '7398', 7778, 'Reprises sur dotations financières des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7789, 'PCG', 'INCOME', '75', 7679, 'Produits non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7790, 'PCG', 'INCOME', '751', 7789, 'Produits des cessions des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7791, 'PCG', 'INCOME', '7512', 7790, 'Produits des cessions des immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7792, 'PCG', 'INCOME', '7513', 7790, 'Produits des cessions des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7793, 'PCG', 'INCOME', '7514', 7790,
        'Produits des cessions des immobilisations financières (droits de propriété)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7794, 'PCG', 'INCOME', '7518', 7790,
        'Produits des cessions des immobilisations des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7795, 'PCG', 'INCOME', '756', 7789, 'Subventions d''équilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7796, 'PCG', 'INCOME', '7561', 7795, 'Subventions d''équilibre reçues de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7797, 'PCG', 'INCOME', '7568', 7795, 'Subventions d''équilibre reçues des exercices antérieurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7798, 'PCG', 'INCOME', '757', 7789, 'Reprises sur subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7799, 'PCG', 'INCOME', '7577', 7798, 'Reprises sur subventions d''investissement de l''exercice',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7800, 'PCG', 'INCOME', '7578', 7798,
        'Reprises sur subventions d''investissement des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7801, 'PCG', 'INCOME', '758', 7789, 'Autres produits non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7802, 'PCG', 'INCOME', '7581', 7801, 'Pénalités et dédits reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7803, 'PCG', 'INCOME', '75811', 7802, 'Pénalités reçus sur marché', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7804, 'PCG', 'INCOME', '75812', 7802, 'Dédits reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7805, 'PCG', 'INCOME', '7582', 7801, 'Dégrèvements d''impôts (autres qu''impôts sur résultat)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7806, 'PCG', 'INCOME', '7585', 7801, 'Rentrées sur créances soldées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7807, 'PCG', 'INCOME', '7586', 7801, 'Dons, libéralités et lots reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7808, 'PCG', 'INCOME', '75861', 7807, 'Dons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7809, 'PCG', 'INCOME', '75862', 7807, 'Libéralités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7810, 'PCG', 'INCOME', '75863', 7807, 'Lots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7811, 'PCG', 'INCOME', '7588', 7801, 'Autres produits non courants des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7812, 'PCG', 'INCOME', '759', 7789, 'Reprises non courantes ; Transfert de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7813, 'PCG', 'INCOME', '7591', 7812,
        'Reprises non courantes sur amortissements exceptionnelles des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7814, 'PCG', 'INCOME', '75911', 7813,
        'Reprises non courantes sur amortissements exceptionnelles des immobilisations en non-valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7815, 'PCG', 'INCOME', '75912', 7813,
        'Reprises non courantes sur amortissements exceptionnelles des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7816, 'PCG', 'INCOME', '75913', 7813,
        'Reprises non courantes sur amortissements exceptionnelles des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7817, 'PCG', 'INCOME', '7594', 7812, 'Reprises non courantes sur provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7818, 'PCG', 'INCOME', '75941', 7817, 'Reprises sur amortissements dérogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7819, 'PCG', 'INCOME', '75942', 7817, 'Reprises sur plus values en instance d''imposition', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7820, 'PCG', 'INCOME', '75944', 7817, 'Reprises sur provisions pour investissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7821, 'PCG', 'INCOME', '75945', 7817, 'Reprises sur provisions pour reconstitution de gisements',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7822, 'PCG', 'INCOME', '75946', 7817,
        'Reprises sur provisions pour acquisition et construction de logements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7823, 'PCG', 'INCOME', '7595', 7812,
        'Reprises non courantes sur provisions pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7824, 'PCG', 'INCOME', '75955', 7823,
        'Reprises non courantes sur provisions pour risques et charges durables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7825, 'PCG', 'INCOME', '75957', 7823,
        'Reprises non courantes sur provisions pour risques et charges momentanés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7826, 'PCG', 'INCOME', '7596', 7812, 'Reprises non courantes sur provisions pour dépréciation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7827, 'PCG', 'INCOME', '75962', 7826,
        'Reprises non courantes sur provisions pour dépréciation de l''actif immobilisé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7828, 'PCG', 'INCOME', '75963', 7826,
        'Reprises non courantes sur provisions pour dépréciation de l''actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7829, 'PCG', 'INCOME', '7597', 7812, 'Transfert de charges non courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7830, 'PCG', 'INCOME', '7598', 7812, 'Reprises non courantes des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7831, 'PCG', 'RESU', '8', '', 'Comptes de résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7832, 'PCG', 'RESU', '81', 7831, 'Résultat d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7833, 'PCG', 'RESU', '811', 7832, 'Marge brute', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7834, 'PCG', 'RESU', '814', 7832, 'Valeur ajoutée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7835, 'PCG', 'RESU', '817', 7832, 'Excédent brut d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7836, 'PCG', 'RESU', '8171', 7835, 'Excédent brut d''exploitation (créditeur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7837, 'PCG', 'RESU', '8179', 7835, 'Insuffusance brute d''exploitation (débiteur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7838, 'PCG', 'RESU', '83', 7831, 'Résultat financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7839, 'PCG', 'RESU', '84', 7831, 'Résultat courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7840, 'PCG', 'RESU', '85', 7831, 'Résultat non courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7841, 'PCG', 'RESU', '86', 7831, 'Résultat avant impôt', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7842, 'PCG', 'RESU', '88', 7831, 'Résultat après impôt', '1');

