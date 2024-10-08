-- Descriptif plan comptable TN PCT
-- ID 9000 - 9999
-- ADD 1000000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9000, 'PCT', 'CAPIT', '1', '', 'Comptes de Financement Permanent', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9001, 'PCT', 'CAPIT', '10', 9000, 'Capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9002, 'PCT', 'CAPIT', '101', 9001, 'Capital social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9003, 'PCT', 'CAPIT', '1011', 9002, 'Capital souscrit - non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9004, 'PCT', 'CAPIT', '1012', 9002, 'Capital souscrit - appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9005, 'PCT', 'CAPIT', '1013', 9002, 'Capital souscrit - appelé, versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9006, 'PCT', 'CAPIT', '10131', 9005, 'Capital non amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9007, 'PCT', 'CAPIT', '10132', 9005, 'Capital amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9008, 'PCT', 'CAPIT', '1018', 9002, 'Capital souscrit soumis à une réglementation particulière',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9009, 'PCT', 'CAPIT', '105', 9001, 'Fonds de dotation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9010, 'PCT', 'CAPIT', '108', 9001, 'Compte de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9011, 'PCT', 'CAPIT', '109', 9001, 'Actionnaires, capital souscrit - non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9012, 'PCT', 'CAPIT', '11', 9000, 'Réserves et primes liées au capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9013, 'PCT', 'CAPIT', '111', 9012, 'Réserve légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9014, 'PCT', 'CAPIT', '112', 9012, 'Réserves statutaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9015, 'PCT', 'CAPIT', '117', 9012, 'Primes liées au capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9016, 'PCT', 'CAPIT', '1171', 9015, 'Primes d''émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9017, 'PCT', 'CAPIT', '1172', 9015, 'Primes de fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9018, 'PCT', 'CAPIT', '1173', 9015, 'Primes d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9019, 'PCT', 'CAPIT', '1174', 9015, 'Primes de conversion d''obligation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9020, 'PCT', 'CAPIT', '1178', 9015, 'Autres compléments d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9021, 'PCT', 'CAPIT', '118', 9012, 'Autres réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9022, 'PCT', 'CAPIT', '1181', 9021, 'Réserves pour fonds social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9023, 'PCT', 'CAPIT', '119', 9012, 'Avoirs des actionnaires. i[i][1]', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9024, 'PCT', 'CAPIT', '12', 9000, 'Résultats reportés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9025, 'PCT', 'CAPIT', '121', 9024, 'Résultats reportés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9026, 'PCT', 'CAPIT', '128', 9024, 'Modifications comptables affectant les résultats reportés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9027, 'PCT', 'CAPIT', '13', 9000, 'Résultat de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9028, 'PCT', 'CAPIT', '131', 9027, 'Résultat bénéficiaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9029, 'PCT', 'CAPIT', '135', 9027, 'Résultat déficitaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9030, 'PCT', 'CAPIT', '14', 9000, 'Autres capitaux propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9031, 'PCT', 'CAPIT', '141', 9030, 'Titres soumis à des réglementations particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9032, 'PCT', 'CAPIT', '142', 9030,
        'Réserves réglementées & réserves soumises à un régime fiscal particulier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9033, 'PCT', 'CAPIT', '1421', 9032, 'Réserves indisponibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9034, 'PCT', 'CAPIT', '143', 9030, 'Amortissements dérogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9035, 'PCT', 'CAPIT', '144', 9030, 'Réserve spéciale de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9036, 'PCT', 'CAPIT', '145', 9030, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9037, 'PCT', 'CAPIT', '1451', 9036, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9038, 'PCT', 'CAPIT', '1458', 9036, 'Autres subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9039, 'PCT', 'CAPIT', '1459', 9036,
        'Subventions d''investissement inscrites aux comptes de résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9040, 'PCT', 'CAPIT', '147', 9030, 'Compte du concédant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9041, 'PCT', 'CAPIT', '15', 9000, 'Provisions pour risques & charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9042, 'PCT', 'CAPIT', '151', 9041, 'Provisions pour risques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9043, 'PCT', 'CAPIT', '1511', 9042, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9044, 'PCT', 'CAPIT', '1512', 9042, 'Provisions pour garanties données aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9045, 'PCT', 'CAPIT', '1513', 9042, 'Provisions pour pertes sur marchés à achèvement futur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9046, 'PCT', 'CAPIT', '1514', 9042, 'Provisions pour amendes & pénalités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9047, 'PCT', 'CAPIT', '1515', 9042, 'Provisions pour pertes de change. ii[ii][2]', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9048, 'PCT', 'CAPIT', '1518', 9042, 'Autres provisions pour risques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9049, 'PCT', 'CAPIT', '152', 9041, 'Provisions pour charges à répartir sur plusieurs exercices',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9050, 'PCT', 'CAPIT', '1522', 9049, 'Provisions pour grosses réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9051, 'PCT', 'CAPIT', '153', 9041, 'Provisions pour retraites et obligations similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9052, 'PCT', 'CAPIT', '154', 9041, 'Provisions d''origine réglementaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9053, 'PCT', 'CAPIT', '155', 9041, 'Provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9054, 'PCT', 'CAPIT', '156', 9041, 'Provisions pour renouvellement des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9055, 'PCT', 'CAPIT', '157', 9041, 'Provisions pour amortissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9056, 'PCT', 'CAPIT', '158', 9041, 'Autres provisions pour charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9057, 'PCT', 'CAPIT', '16', 9000, 'Emprunts & dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9058, 'PCT', 'CAPIT', '161', 9057, 'Emprunts obligataires (assorties de sûretés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9059, 'PCT', 'CAPIT', '1611', 9058, 'Emprunts obligataires convertibles en actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9060, 'PCT', 'CAPIT', '1618', 9058, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9061, 'PCT', 'CAPIT', '162', 9057,
        'Emprunts auprès des établissements financiers (assorties de sûretés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9062, 'PCT', 'CAPIT', '1621', 9061, 'Emprunts bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9063, 'PCT', 'CAPIT', '1626', 9061, 'Refinancements acquis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9064, 'PCT', 'CAPIT', '163', 9057,
        'Emprunts auprès d''autres établissements financiers (assorties de sûretés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9065, 'PCT', 'CAPIT', '164', 9057, 'Emprunts et dettes assorties de conditions particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9066, 'PCT', 'CAPIT', '1641', 9065, 'Avances bloquées pour augmentation du capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9067, 'PCT', 'CAPIT', '1642', 9065, 'Avances reçues et comptes courants des associés bloqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9068, 'PCT', 'CAPIT', '1644', 9065, 'Avances conditionnées de l''Etat & organismes internationaux',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9069, 'PCT', 'CAPIT', '165', 9057,
        'Emprunts non assorties de sûretés (à subdiviser selon l''ordre des comptes des emprunts)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9070, 'PCT', 'CAPIT', '166', 9057, 'Dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9071, 'PCT', 'CAPIT', '1661', 9070, 'Dettes rattachées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9072, 'PCT', 'CAPIT', '1662', 9070, 'Dettes rattachées à des participations (hors groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9073, 'PCT', 'CAPIT', '1663', 9070, 'Dettes rattachées à des sociétés en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9074, 'PCT', 'CAPIT', '167', 9057, 'Dépôts & cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9075, 'PCT', 'CAPIT', '168', 9057, 'Autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9076, 'PCT', 'CAPIT', '1681', 9075, 'Autres emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9077, 'PCT', 'CAPIT', '1685', 9075, 'Crédit fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9078, 'PCT', 'CAPIT', '1688', 9075, 'Autres dettes non courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9079, 'PCT', 'CAPIT', '17', 9000, 'Comptes de liaison des établissements & succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9080, 'PCT', 'CAPIT', '171', 9079, 'Comptes des liaison des établissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9081, 'PCT', 'CAPIT', '176', 9079,
        'Biens & prestations de services échangés entre établissements (charges)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9082, 'PCT', 'CAPIT', '177', 9079,
        'Biens & prestations de services échangés entre établissements (produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9083, 'PCT', 'CAPIT', '18', 9000, 'Autres passifs non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9084, 'PCT', 'CAPIT', '185', 9083, 'Écarts de conversion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9085, 'PCT', 'CAPIT', '188', 9083, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9086, 'PCT', 'IMMO', '2', '', 'Comptes d''Actif Immobilisé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9087, 'PCT', 'IMMO', '21', 9086, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9088, 'PCT', 'IMMO', '211', 9087, 'Investissements de recherche & de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9089, 'PCT', 'IMMO', '212', 9087,
        'Concessions de marques, brevets, licences, marques, procédés & valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9090, 'PCT', 'IMMO', '213', 9087, 'Logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9091, 'PCT', 'IMMO', '214', 9087, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9092, 'PCT', 'IMMO', '216', 9087, 'Droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9093, 'PCT', 'IMMO', '218', 9087, 'Autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9094, 'PCT', 'IMMO', '22', 9086, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9095, 'PCT', 'IMMO', '221', 9094, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9096, 'PCT', 'IMMO', '2213', 9095, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9097, 'PCT', 'IMMO', '2214', 9095, 'Terrains aménagés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9098, 'PCT', 'IMMO', '2215', 9095, 'Terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9099, 'PCT', 'IMMO', '2216', 9095, 'Agencements & aménagements des terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9100, 'PCT', 'IMMO', '222', 9094, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9101, 'PCT', 'IMMO', '2221', 9100, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9102, 'PCT', 'IMMO', '2225', 9100,
        'Installations générales, agencements & aménagements des constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9103, 'PCT', 'IMMO', '2226', 9100, 'Ouvrages d''infrastructure', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9104, 'PCT', 'IMMO', '2227', 9100, 'Constructions sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9105, 'PCT', 'IMMO', '223', 9094, 'Installations techniques, matériel et outillage industriels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9106, 'PCT', 'IMMO', '2231', 9105, 'Installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9107, 'PCT', 'IMMO', '2234', 9105, 'Matériel industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9108, 'PCT', 'IMMO', '2235', 9105, 'Outillage industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9109, 'PCT', 'IMMO', '2237', 9105, 'Agencements & aménagements du matériel & outillage industriels',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9110, 'PCT', 'IMMO', '224', 9094, 'Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9111, 'PCT', 'IMMO', '2241', 9110, 'Matériel de transport de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9112, 'PCT', 'IMMO', '2244', 9110, 'Matériel de transport de personnes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9113, 'PCT', 'IMMO', '228', 9094, 'Autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9114, 'PCT', 'IMMO', '2281', 9113, 'Installations générales, agencements et aménagements divers',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9115, 'PCT', 'IMMO', '2282', 9113, 'Équipement de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9116, 'PCT', 'IMMO', '2286', 9113, 'Emballages récupérables identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9117, 'PCT', 'IMMO', '23', 9086, 'Immobilisations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9118, 'PCT', 'IMMO', '231', 9117, 'Immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9119, 'PCT', 'IMMO', '232', 9117, 'Immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9120, 'PCT', 'IMMO', '237', 9117, 'Avances & acomptes versés sur immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9121, 'PCT', 'IMMO', '238', 9117,
        'Avances & acomptes versés sur commandes d''immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9122, 'PCT', 'IMMO', '24', 9086, 'Immobilisations à statut juridique particulier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9123, 'PCT', 'IMMO', '25', 9086, 'Participations & créances liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9124, 'PCT', 'IMMO', '251', 9123, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9125, 'PCT', 'IMMO', '2511', 9124, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9126, 'PCT', 'IMMO', '2518', 9124, 'Autres titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9127, 'PCT', 'IMMO', '256', 9123, 'Autres formes de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9128, 'PCT', 'IMMO', '257', 9123, 'Créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9129, 'PCT', 'IMMO', '2571', 9128, 'Créances rattachées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9130, 'PCT', 'IMMO', '2574', 9128, 'Créances rattachées à des participations (hors groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9131, 'PCT', 'IMMO', '2575', 9128,
        'Versements représentatifs d''apports non capitalisés (appel de fonds)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9132, 'PCT', 'IMMO', '2576', 9128, 'Avances consolidables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9133, 'PCT', 'IMMO', '2577', 9128, 'Autres créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9134, 'PCT', 'IMMO', '258', 9123, 'Créances rattachées à des sociétés en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9135, 'PCT', 'IMMO', '259', 9123,
        'Versements restant à effectuer sur titres de participation non libérés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9136, 'PCT', 'IMMO', '26', 9086, 'Autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9137, 'PCT', 'IMMO', '261', 9136, 'Titres immobilisés (droit de propriété)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9138, 'PCT', 'IMMO', '2611', 9137, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9139, 'PCT', 'IMMO', '2618', 9137, 'Autres titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9140, 'PCT', 'IMMO', '262', 9136, 'Titres immobilisés (droit de créance)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9141, 'PCT', 'IMMO', '2621', 9140, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9142, 'PCT', 'IMMO', '2622', 9140, 'Bons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9143, 'PCT', 'IMMO', '264', 9136, 'Prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9144, 'PCT', 'IMMO', '2641', 9143, 'Prêts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9145, 'PCT', 'IMMO', '2642', 9143, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9146, 'PCT', 'IMMO', '2643', 9143, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9147, 'PCT', 'IMMO', '2645', 9143, 'Prêts assortis de sûretés (à subdiviser)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9148, 'PCT', 'IMMO', '2648', 9143, 'Autres prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9149, 'PCT', 'IMMO', '265', 9136, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9150, 'PCT', 'IMMO', '2651', 9149, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9151, 'PCT', 'IMMO', '2655', 9149, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9152, 'PCT', 'IMMO', '2656', 9149, 'Dépôts bancaires non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9153, 'PCT', 'IMMO', '2658', 9149, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9154, 'PCT', 'IMMO', '266', 9136, 'Autres créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9155, 'PCT', 'IMMO', '2661', 9154, 'Créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9156, 'PCT', 'IMMO', '2667', 9154, 'Créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9157, 'PCT', 'IMMO', '2668', 9154, 'Autres créances non courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9158, 'PCT', 'IMMO', '269', 9136,
        'Versements restant à effectuer sur titres immobilisés non libérés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9159, 'PCT', 'IMMO', '27', 9086, 'Autres actifs non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9160, 'PCT', 'IMMO', '271', 9159, 'Frais préliminaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9161, 'PCT', 'IMMO', '272', 9159, 'Charges à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9162, 'PCT', 'IMMO', '273', 9159, 'Frais d''émission et primes de remboursement des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9163, 'PCT', 'IMMO', '275', 9159, 'Écarts de conversion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9164, 'PCT', 'IMMO', '278', 9159, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9165, 'PCT', 'IMMO', '28', 9086, 'Amortissements des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9166, 'PCT', 'IMMO', '281', 9165,
        'Amortissements des immobilisations incorporelles (même ventilation que celle du', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9167, 'PCT', 'IMMO', '282', 9165,
        'Amortissements des immobilisations corporelles (même ventilation que celle du compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9168, 'PCT', 'IMMO', '284', 9165,
        'Amortissements des immobilisations à statut juridique particulier.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9169, 'PCT', 'IMMO', '29', 9086, 'Provisions pour dépréciation des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9170, 'PCT', 'IMMO', '291', 9169, 'Provisions pour dépréciation des immobilisations incorporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9171, 'PCT', 'IMMO', '292', 9169, 'Provisions pour dépréciation des immobilisations corporelles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9172, 'PCT', 'IMMO', '293', 9169, 'Provisions pour dépréciation des immobilisations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9173, 'PCT', 'IMMO', '294', 9169,
        'Provisions pour dépréciation des immobilisations à statut juridique particulier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9174, 'PCT', 'IMMO', '295', 9169,
        'Provisions pour dépréciation des participations et des créances liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9175, 'PCT', 'STOCK', '3', '', 'Comptes d''actif Circulation (Hors Trésorerie)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9176, 'PCT', 'STOCK', '31', 9175, 'Matières premières & fournitures liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9177, 'PCT', 'STOCK', '311', 9176, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9178, 'PCT', 'STOCK', '313', 9176, 'Fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9179, 'PCT', 'STOCK', '317', 9176, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9180, 'PCT', 'STOCK', '32', 9175, 'Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9181, 'PCT', 'STOCK', '321', 9180, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9182, 'PCT', 'STOCK', '322', 9180, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9183, 'PCT', 'STOCK', '326', 9180, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9184, 'PCT', 'STOCK', '327', 9180, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9185, 'PCT', 'STOCK', '33', 9175, 'En-cours de production de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9186, 'PCT', 'STOCK', '331', 9185, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9187, 'PCT', 'STOCK', '335', 9185, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9188, 'PCT', 'STOCK', '34', 9175, 'En-cours de production de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9189, 'PCT', 'STOCK', '341', 9188, 'Études en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9190, 'PCT', 'STOCK', '345', 9188, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9191, 'PCT', 'STOCK', '35', 9175, 'Stocks de produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9192, 'PCT', 'STOCK', '351', 9191, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9193, 'PCT', 'STOCK', '355', 9191, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9194, 'PCT', 'STOCK', '357', 9191, 'Produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9195, 'PCT', 'STOCK', '37', 9175, 'Stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9196, 'PCT', 'STOCK', '39', 9175,
        'Provisions pour dépréciation des stocks (à ventiler selon la nomenclature de cette classe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9197, 'PCT', 'THIRDPARTY', '4', '', 'Comptes de passif circulant (Hors trésorerie)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9198, 'PCT', 'THIRDPARTY', '40', 9197, 'Fournisseurs & comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9199, 'PCT', 'THIRDPARTY', '401', 9198, 'Fournisseurs d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9200, 'PCT', 'THIRDPARTY', '4011', 9199,
        'Fournisseurs - achats de biens ou de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9201, 'PCT', 'THIRDPARTY', '4017', 9199, 'Fournisseurs - retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9202, 'PCT', 'THIRDPARTY', '403', 9198, 'Fournisseurs d''exploitation - effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9203, 'PCT', 'THIRDPARTY', '404', 9198, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9204, 'PCT', 'THIRDPARTY', '4041', 9203, 'Fournisseurs - achats d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9205, 'PCT', 'THIRDPARTY', '4047', 9203, 'Fournisseurs d''immobilisations - retenues de garantie',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9206, 'PCT', 'THIRDPARTY', '405', 9198, 'Fournisseurs d''immobilisations - effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9207, 'PCT', 'THIRDPARTY', '408', 9198, 'Fournisseurs - factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9208, 'PCT', 'THIRDPARTY', '4081', 9207, 'Fournisseurs d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9209, 'PCT', 'THIRDPARTY', '4084', 9207, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9210, 'PCT', 'THIRDPARTY', '4088', 9207, 'Fournisseurs - intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9211, 'PCT', 'THIRDPARTY', '409', 9198, 'Fournisseurs débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9212, 'PCT', 'THIRDPARTY', '4091', 9211, 'Fournisseurs - avances et acomptes versés sur commandes',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9213, 'PCT', 'THIRDPARTY', '4096', 9211,
        'Fournisseurs - créances pour emballages et matériel à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9214, 'PCT', 'THIRDPARTY', '4097', 9211, 'Fournisseurs - autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9215, 'PCT', 'THIRDPARTY', '40971', 9214, 'Fournisseurs d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9216, 'PCT', 'THIRDPARTY', '40974', 9214, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9217, 'PCT', 'THIRDPARTY', '4098', 9211,
        'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9218, 'PCT', 'THIRDPARTY', '41', 9197, 'Clients & comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9219, 'PCT', 'THIRDPARTY', '411', 9218, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9220, 'PCT', 'THIRDPARTY', '4111', 9219, 'Clients - ventes de biens ou de prestations de services',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9221, 'PCT', 'THIRDPARTY', '4117', 9219, 'Clients - retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9222, 'PCT', 'THIRDPARTY', '413', 9218, 'Clients - effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9223, 'PCT', 'THIRDPARTY', '416', 9218, 'Clients douteux ou litigieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9224, 'PCT', 'THIRDPARTY', '417', 9218, 'Créances sur travaux non encore facturables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9225, 'PCT', 'THIRDPARTY', '418', 9218,
        'Clients - produits non encore facturés (produits à recevoir)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9226, 'PCT', 'THIRDPARTY', '4181', 9225, 'Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9227, 'PCT', 'THIRDPARTY', '4188', 9225, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9228, 'PCT', 'THIRDPARTY', '419', 9218, 'Clients créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9229, 'PCT', 'THIRDPARTY', '4191', 9228, 'Clients - avances et acomptes reçus sur commandes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9230, 'PCT', 'THIRDPARTY', '4196', 9228, 'Clients - dettes pour emballages et matériel consignés',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9231, 'PCT', 'THIRDPARTY', '4197', 9228, 'Clients - autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9232, 'PCT', 'THIRDPARTY', '4198', 9228,
        'Rabais, remises, ristournes à accorder et autres avoirs à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9233, 'PCT', 'THIRDPARTY', '42', 9197, 'Personnel et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9234, 'PCT', 'THIRDPARTY', '421', 9233, 'Personnel - avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9235, 'PCT', 'THIRDPARTY', '422', 9233,
        'Comités d''entreprises et autres organes représentatifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9236, 'PCT', 'THIRDPARTY', '423', 9233, 'Personnel, œuvres sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9237, 'PCT', 'THIRDPARTY', '425', 9233, 'Personnel - rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9238, 'PCT', 'THIRDPARTY', '426', 9233, 'Personnel - dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9239, 'PCT', 'THIRDPARTY', '427', 9233, 'Personnel - oppositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9240, 'PCT', 'THIRDPARTY', '428', 9233, 'Personnel - charges à payer & produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9241, 'PCT', 'THIRDPARTY', '4282', 9240, 'Dettes provisionnées pour congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9242, 'PCT', 'THIRDPARTY', '4286', 9240, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9243, 'PCT', 'THIRDPARTY', '4287', 9240, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9244, 'PCT', 'THIRDPARTY', '43', 9197, 'Etat et collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9245, 'PCT', 'THIRDPARTY', '431', 9244, 'Etat - subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9246, 'PCT', 'THIRDPARTY', '432', 9244, 'Etat, impôts et taxes retenus à la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9247, 'PCT', 'THIRDPARTY', '433', 9244,
        'Opérations particulières avec l''Etat, les collectivités publiques, les organismes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9248, 'PCT', 'THIRDPARTY', '434', 9244, 'Etat - impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9249, 'PCT', 'THIRDPARTY', '4341', 9248, 'Retenue à la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9250, 'PCT', 'THIRDPARTY', '4342', 9248, 'Acomptes provisionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9251, 'PCT', 'THIRDPARTY', '4343', 9248, 'Impôt à liquider', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9252, 'PCT', 'THIRDPARTY', '4349', 9248, 'Impôts différés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9253, 'PCT', 'THIRDPARTY', '435', 9244, 'Obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9254, 'PCT', 'THIRDPARTY', '436', 9244, 'Etat - taxes sur le chiffre d''affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9255, 'PCT', 'THIRDPARTY', '4365', 9254, 'Taxes sur le chiffre d''affaires à décaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9256, 'PCT', 'THIRDPARTY', '43651', 9255, 'TVA à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9257, 'PCT', 'THIRDPARTY', '43658', 9255, 'Autres taxes sur le chiffre d''affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9258, 'PCT', 'THIRDPARTY', '4366', 9254, 'Taxes sur le chiffre d''affaires déductibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9259, 'PCT', 'THIRDPARTY', '43662', 9258, 'TVA sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9260, 'PCT', 'THIRDPARTY', '43663', 9258, 'TVA transférée par d''autres entreprises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9261, 'PCT', 'THIRDPARTY', '43666', 9258, 'TVA sur autres biens et services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9262, 'PCT', 'THIRDPARTY', '43667', 9258, 'Crédit de TVA à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9263, 'PCT', 'THIRDPARTY', '43668', 9258, 'Autres taxes sur le chiffre d''affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9264, 'PCT', 'THIRDPARTY', '4367', 9254,
        'Taxes sur le chiffre d''affaires collectées par l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9265, 'PCT', 'THIRDPARTY', '43671', 9264, 'TVA collectée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9266, 'PCT', 'THIRDPARTY', '436711', 9265, 'TVA collectée sur les débits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9267, 'PCT', 'THIRDPARTY', '436712', 9265, 'TVA collectée sur les encaissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9268, 'PCT', 'THIRDPARTY', '43678', 9264, 'Autres taxes sur le chiffre d''affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9269, 'PCT', 'THIRDPARTY', '4368', 9254,
        'Taxes sur le chiffre d''affaires à régulariser ou en attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9270, 'PCT', 'THIRDPARTY', '437', 9244, 'Autres impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9271, 'PCT', 'THIRDPARTY', '438', 9244, 'Etat - charges à payer et produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9272, 'PCT', 'THIRDPARTY', '4382', 9271, 'Charges fiscales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9273, 'PCT', 'THIRDPARTY', '4386', 9271, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9274, 'PCT', 'THIRDPARTY', '4387', 9271, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9275, 'PCT', 'THIRDPARTY', '44', 9197, 'Sociétés du groupe & associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9276, 'PCT', 'THIRDPARTY', '441', 9275, 'Groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9277, 'PCT', 'THIRDPARTY', '4411', 9276, 'Créances et intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9278, 'PCT', 'THIRDPARTY', '4412', 9276, 'Dettes et intérêts à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9279, 'PCT', 'THIRDPARTY', '442', 9275, 'Associés - comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9280, 'PCT', 'THIRDPARTY', '4421', 9279, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9281, 'PCT', 'THIRDPARTY', '4428', 9279, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9282, 'PCT', 'THIRDPARTY', '446', 9275, 'Associés - opérations sur le capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9283, 'PCT', 'THIRDPARTY', '447', 9275, 'Associés - dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9284, 'PCT', 'THIRDPARTY', '448', 9275, 'Associés - opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9285, 'PCT', 'THIRDPARTY', '4481', 9284, 'Opérations courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9286, 'PCT', 'THIRDPARTY', '4488', 9284, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9287, 'PCT', 'THIRDPARTY', '45', 9197, 'Débiteurs divers et Créditeurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9288, 'PCT', 'THIRDPARTY', '452', 9287, 'Créances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9289, 'PCT', 'THIRDPARTY', '453', 9287, 'Sécurité sociale et autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9290, 'PCT', 'THIRDPARTY', '4531', 9289, 'Organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9291, 'PCT', 'THIRDPARTY', '45311', 9290, 'CNSS', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9292, 'PCT', 'THIRDPARTY', '45318', 9290, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9293, 'PCT', 'THIRDPARTY', '4538', 9289,
        'Organismes sociaux - charges à payer et produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9294, 'PCT', 'THIRDPARTY', '45382', 9293, 'Charges sociales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9295, 'PCT', 'THIRDPARTY', '45386', 9293, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9296, 'PCT', 'THIRDPARTY', '45387', 9293, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9297, 'PCT', 'THIRDPARTY', '454', 9287,
        'Dettes sur acquisitions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9298, 'PCT', 'THIRDPARTY', '455', 9287, 'Créances sur cessions de valeurs mobilières de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9299, 'PCT', 'THIRDPARTY', '457', 9287, 'Autres comptes débiteurs ou créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9300, 'PCT', 'THIRDPARTY', '458', 9287, 'Diverses charges à payer et produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9301, 'PCT', 'THIRDPARTY', '4586', 9300, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9302, 'PCT', 'THIRDPARTY', '4587', 9300, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9303, 'PCT', 'THIRDPARTY', '46', 9197, 'Comptes transitoires ou d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9304, 'PCT', 'THIRDPARTY', '461', 9303, 'Compte d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9305, 'PCT', 'THIRDPARTY', '465', 9303, 'Différence de conversion sur éléments courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9306, 'PCT', 'THIRDPARTY', '4651', 9305, 'Différences de conversion actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9307, 'PCT', 'THIRDPARTY', '4652', 9305, 'Différences de conversion passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9308, 'PCT', 'THIRDPARTY', '468', 9303, 'Autres comptes transitoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9309, 'PCT', 'THIRDPARTY', '47', 9197, 'Comptes de régularisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9310, 'PCT', 'THIRDPARTY', '471', 9309, 'Charges constatées d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9311, 'PCT', 'THIRDPARTY', '472', 9309, 'Produits constatés d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9312, 'PCT', 'THIRDPARTY', '478', 9309, 'Comptes de répartition périodique de charges et produits',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9313, 'PCT', 'THIRDPARTY', '4786', 9312, 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9314, 'PCT', 'THIRDPARTY', '4787', 9312, 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9315, 'PCT', 'THIRDPARTY', '48', 9197, 'Provisions courantes pour risques et charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9316, 'PCT', 'THIRDPARTY', '49', 9197, 'Provisions pour dépréciation des comptes de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9317, 'PCT', 'THIRDPARTY', '491', 9316, 'Provisions pour dépréciation des comptes clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9318, 'PCT', 'THIRDPARTY', '494', 9316,
        'Provisions pour dépréciation des comptes de groupe et associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9319, 'PCT', 'THIRDPARTY', '4941', 9318, 'Comptes du groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9320, 'PCT', 'THIRDPARTY', '4942', 9318, 'Comptes courants des associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9321, 'PCT', 'THIRDPARTY', '4948', 9318, 'Opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9322, 'PCT', 'THIRDPARTY', '495', 9316,
        'Provisions pour dépréciation des comptes de débiteurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9323, 'PCT', 'THIRDPARTY', '4952', 9322, 'Créances sur cession d''immobilisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9324, 'PCT', 'THIRDPARTY', '4955', 9322, 'Créances sur cession des valeurs mobilières de placement',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9325, 'PCT', 'THIRDPARTY', '4957', 9322, 'Autres comptes débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9326, 'PCT', 'FINAN', '5', '', 'Comptes de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9327, 'PCT', 'FINAN', '50', 9326, 'Emprunts et autres dettes financières courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9328, 'PCT', 'FINAN', '501', 9327, 'Emprunts courants liés au cycle d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9329, 'PCT', 'FINAN', '505', 9327, 'Échéances à moins d''un an sur emprunts non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9330, 'PCT', 'FINAN', '506', 9327, 'Concours bancaires courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9331, 'PCT', 'FINAN', '5061', 9330, 'Crédit de mobilisation de créances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9332, 'PCT', 'FINAN', '5063', 9330, 'Mobilisation de créances nées à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9333, 'PCT', 'FINAN', '5067', 9330, 'Autres concours bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9334, 'PCT', 'FINAN', '507', 9327, 'Emprunts échus et impayés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9335, 'PCT', 'FINAN', '508', 9327,
        'Intérêts courus (à subdiviser selon la même ventilation que le compte 50)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9336, 'PCT', 'FINAN', '51', 9326, 'Prêts et autres créances financières courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9337, 'PCT', 'FINAN', '511', 9336, 'Prêts courants liés au cycle d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9338, 'PCT', 'FINAN', '516', 9336, 'Échéances à moins d''un an sur prêts non courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9339, 'PCT', 'FINAN', '517', 9336, 'Échéances à moins d''un an sur autres créances financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9340, 'PCT', 'FINAN', '518', 9336, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9341, 'PCT', 'FINAN', '52', 9326, 'Placements courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9342, 'PCT', 'FINAN', '523', 9341, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9343, 'PCT', 'FINAN', '5231', 9342, 'Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9344, 'PCT', 'FINAN', '5235', 9342, 'Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9345, 'PCT', 'FINAN', '524', 9341, 'Autres titres conférant un droit de propriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9346, 'PCT', 'FINAN', '525', 9341, 'Obligations et bons émis par la société et rachetés par elle',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9347, 'PCT', 'FINAN', '526', 9341, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9348, 'PCT', 'FINAN', '5261', 9347, 'Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9349, 'PCT', 'FINAN', '5265', 9347, 'Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9350, 'PCT', 'FINAN', '5266', 9347, 'Échéances à moins d''un an sur les obligations immobilisées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9351, 'PCT', 'FINAN', '527', 9341, 'Bons du trésor et bons de caisse à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9352, 'PCT', 'FINAN', '528', 9341, 'Autres placements courants et créances assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9353, 'PCT', 'FINAN', '5281', 9352, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9354, 'PCT', 'FINAN', '5288', 9352, 'Intérêts courus sur obligations, bons et valeurs assimilées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9355, 'PCT', 'FINAN', '529', 9341,
        'Versements restant à effectuer sur valeurs mobilières de placement non libérées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9356, 'PCT', 'FINAN', '53', 9326, 'Banques, établissements financiers et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9357, 'PCT', 'FINAN', '531', 9356, 'Valeurs à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9358, 'PCT', 'FINAN', '5311', 9357, 'Coupons échus à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9359, 'PCT', 'FINAN', '5312', 9357, 'Chèques à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9360, 'PCT', 'FINAN', '5313', 9357, 'Effets à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9361, 'PCT', 'FINAN', '5314', 9357, 'Effets à l''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9362, 'PCT', 'FINAN', '532', 9356, 'Banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9363, 'PCT', 'FINAN', '5321', 9362, 'Comptes en dinars', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9364, 'PCT', 'FINAN', '5324', 9362, 'Comptes en devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9365, 'PCT', 'FINAN', '534', 9356, 'C.C.P', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9366, 'PCT', 'FINAN', '535', 9356, 'Comptes au trésor', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9367, 'PCT', 'FINAN', '537', 9356, 'Autres organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9368, 'PCT', 'FINAN', '54', 9326, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9369, 'PCT', 'FINAN', '541', 9368, 'Caisse siège social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9370, 'PCT', 'FINAN', '5411', 9369, 'Caisse en dinars', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9371, 'PCT', 'FINAN', '5414', 9369, 'Caisse en devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9372, 'PCT', 'FINAN', '542', 9368, 'Caisses succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9373, 'PCT', 'FINAN', '55', 9326, 'Régies d''avances et accréditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9374, 'PCT', 'FINAN', '58', 9326, 'Virements internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9375, 'PCT', 'FINAN', '59', 9326, 'Provisions pour dépréciation des comptes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9376, 'PCT', 'EXPENSE', '6', '', 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9377, 'PCT', 'EXPENSE', '60', 9376, 'Achats (sauf 603)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9378, 'PCT', 'EXPENSE', '601', 9377, 'Achats stockés - Matières premières et fournitures liées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9379, 'PCT', 'EXPENSE', '602', 9377, 'Achats stockés - Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9380, 'PCT', 'EXPENSE', '6021', 9379, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9381, 'PCT', 'EXPENSE', '6022', 9379, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9382, 'PCT', 'EXPENSE', '6026', 9379, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9383, 'PCT', 'EXPENSE', '604', 9377,
        'Achats d’études et de prestations de services (y compris achat de sous-traitance de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9384, 'PCT', 'EXPENSE', '605', 9377, 'Achats de matériel, équipements et travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9385, 'PCT', 'EXPENSE', '606', 9377, 'Achats non stockés de matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9386, 'PCT', 'EXPENSE', '607', 9377, 'Achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9387, 'PCT', 'EXPENSE', '608', 9377,
        'Achats liés à une modification comptable à prendre en compte dans le résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9388, 'PCT', 'EXPENSE', '609', 9377, 'Rabais, remises et ristournes obtenus sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9389, 'PCT', 'EXPENSE', '6098', 9388,
        'Liés à une modification comptable à prendre en compte dans le résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9390, 'PCT', 'EXPENSE', '61', 9376, 'Services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9391, 'PCT', 'EXPENSE', '611', 9390, 'Sous-traitance générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9392, 'PCT', 'EXPENSE', '612', 9390, 'Redevances pour utilisation d''immobilisations concédées',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9393, 'PCT', 'EXPENSE', '613', 9390, 'Locations (y compris malis sur emballages)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9394, 'PCT', 'EXPENSE', '614', 9390, 'Charges locatives et de copropriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9395, 'PCT', 'EXPENSE', '615', 9390, 'Entretien et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9396, 'PCT', 'EXPENSE', '616', 9390, 'Primes d''assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9397, 'PCT', 'EXPENSE', '617', 9390, 'Études, recherches et divers services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9398, 'PCT', 'EXPENSE', '618', 9390,
        'Autres charges liées à une modification comptable à prendre en compte dans le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9399, 'PCT', 'EXPENSE', '619', 9390,
        'Rabais, remises et ristournes obtenus sur services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9400, 'PCT', 'EXPENSE', '62', 9376, 'Autres services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9401, 'PCT', 'EXPENSE', '621', 9400, 'Personnel extérieur à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9402, 'PCT', 'EXPENSE', '622', 9400, 'Rémunération d''intermédiaires et honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9403, 'PCT', 'EXPENSE', '623', 9400, 'Publicité, publications, relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9404, 'PCT', 'EXPENSE', '624', 9400, 'Transports de biens et transports collectifs du personnel',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9405, 'PCT', 'EXPENSE', '6241', 9404, 'Transports sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9406, 'PCT', 'EXPENSE', '6242', 9404, 'Transports sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9407, 'PCT', 'EXPENSE', '6244', 9404, 'Transports administratifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9408, 'PCT', 'EXPENSE', '6247', 9404, 'Transports collectifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9409, 'PCT', 'EXPENSE', '6248', 9404, 'Divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9410, 'PCT', 'EXPENSE', '625', 9400, 'Déplacements, missions et réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9411, 'PCT', 'EXPENSE', '6251', 9410, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9412, 'PCT', 'EXPENSE', '6255', 9410, 'Frais de déménagement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9413, 'PCT', 'EXPENSE', '6256', 9410, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9414, 'PCT', 'EXPENSE', '6257', 9410, 'Réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9415, 'PCT', 'EXPENSE', '626', 9400, 'Frais postaux et frais de télécommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9416, 'PCT', 'EXPENSE', '627', 9400, 'Services bancaires et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9417, 'PCT', 'EXPENSE', '6271', 9416, 'Frais sur titres (achats, vente, garde)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9418, 'PCT', 'EXPENSE', '6272', 9416, 'Commissions et frais sur émission d''emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9419, 'PCT', 'EXPENSE', '6275', 9416, 'Frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9420, 'PCT', 'EXPENSE', '6276', 9416, 'Location de coffres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9421, 'PCT', 'EXPENSE', '6278', 9416, 'Autres frais et commissions sur prestations de services',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9422, 'PCT', 'EXPENSE', '628', 9400,
        'Autres services extérieurs liés à une modification comptable à prendre en', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9423, 'PCT', 'EXPENSE', '629', 9400,
        'Rabais, remises et ristournes obtenus sur autres services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9424, 'PCT', 'EXPENSE', '63', 9376, 'Charges divers ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9425, 'PCT', 'EXPENSE', '631', 9424,
        'Redevances pour concessions de marques, brevets, licences, procédés, droits et valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9426, 'PCT', 'EXPENSE', '633', 9424, 'Jetons de présence', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9427, 'PCT', 'EXPENSE', '634', 9424, 'Pertes sur créances irrécouvrables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9428, 'PCT', 'EXPENSE', '6341', 9427, 'Créances de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9429, 'PCT', 'EXPENSE', '6344', 9427, 'Créances des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9430, 'PCT', 'EXPENSE', '635', 9424, 'Quotes-parts de résultat sur opérations faites en commun',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9431, 'PCT', 'EXPENSE', '6351', 9430, 'Quote-part de bénéfice transférée (comptabilité du gérant)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9432, 'PCT', 'EXPENSE', '6355', 9430,
        'Quote-part de perte supportée (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9433, 'PCT', 'EXPENSE', '636', 9424,
        'Charges nettes sur cessions d''immobilisations et autres pertes sur éléments non', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9434, 'PCT', 'EXPENSE', '637', 9424, 'Réduction de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9435, 'PCT', 'EXPENSE', '638', 9424,
        'Charges divers ordinaires liés à une modification comptable à prendre en compte dans le', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9436, 'PCT', 'EXPENSE', '64', 9376, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9437, 'PCT', 'EXPENSE', '640', 9436, 'Salaires et compléments de salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9438, 'PCT', 'EXPENSE', '6400', 9437, 'Salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9439, 'PCT', 'EXPENSE', '6401', 9437, 'Heures supplémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9440, 'PCT', 'EXPENSE', '6402', 9437, 'Primes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9441, 'PCT', 'EXPENSE', '6403', 9437, 'Gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9442, 'PCT', 'EXPENSE', '6404', 9437, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9443, 'PCT', 'EXPENSE', '6409', 9437, 'Autres compléments de salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9444, 'PCT', 'EXPENSE', '642', 9436, 'Appointements et compléments d''appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9445, 'PCT', 'EXPENSE', '6420', 9344, 'Appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9446, 'PCT', 'EXPENSE', '6421', 9344, 'Heures supplémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9447, 'PCT', 'EXPENSE', '6422', 9344, 'Primes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9448, 'PCT', 'EXPENSE', '6423', 9344, 'Gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9449, 'PCT', 'EXPENSE', '6424', 9344, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9450, 'PCT', 'EXPENSE', '6429', 9344, 'Autres compléments d''appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9451, 'PCT', 'EXPENSE', '643', 9436, 'Indemnités représentatives de frais', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9452, 'PCT', 'EXPENSE', '644', 9436, 'Commissions au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9453, 'PCT', 'EXPENSE', '6440', 9452, 'Commissions sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9454, 'PCT', 'EXPENSE', '6441', 9452, 'Commissions sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9455, 'PCT', 'EXPENSE', '645', 9436, 'Rémunérations des administrateurs, gérants et associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9456, 'PCT', 'EXPENSE', '646', 9436,
        'Charges connexes aux salaires, appointements, commissions et rémunérations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9457, 'PCT', 'EXPENSE', '6460', 9456, 'Charges connexes aux salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9458, 'PCT', 'EXPENSE', '64600', 9457, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9459, 'PCT', 'EXPENSE', '64602', 9457,
        'Indemnités de préavis et de licenciements (gratification de fin de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9460, 'PCT', 'EXPENSE', '64604', 9457, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9461, 'PCT', 'EXPENSE', '6462', 9456, 'Charges connexes aux appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9462, 'PCT', 'EXPENSE', '64620', 9461, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9463, 'PCT', 'EXPENSE', '64622', 9461,
        'Indemnités de préavis et de licenciement (gratification de fin de service)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9464, 'PCT', 'EXPENSE', '64624', 9461, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9465, 'PCT', 'EXPENSE', '6464', 9456, 'Charges connexes aux commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9466, 'PCT', 'EXPENSE', '64640', 9465, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9467, 'PCT', 'EXPENSE', '64642', 9465,
        'Indemnités de préavis et de licenciement (gratification de fin de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9468, 'PCT', 'EXPENSE', '64644', 9465, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9469, 'PCT', 'EXPENSE', '6465', 9456,
        'Charges connexes aux rémunérations des administrateurs et gérants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9470, 'PCT', 'EXPENSE', '64650', 9469, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9471, 'PCT', 'EXPENSE', '64652', 9469, 'Indemnités de préavis et de licenciement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9472, 'PCT', 'EXPENSE', '64654', 9469, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9473, 'PCT', 'EXPENSE', '647', 9436, 'Charges sociales légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9474, 'PCT', 'EXPENSE', '6470', 9473, 'Cotisations de sécurité sociale sur salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9475, 'PCT', 'EXPENSE', '6472', 9473, 'Cotisations de sécurité sociale sur appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9476, 'PCT', 'EXPENSE', '6474', 9473, 'Cotisations de sécurité sociale sur commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9477, 'PCT', 'EXPENSE', '6475', 9473,
        'Cotisations de sécurité sociale sur rémunérations des administrateurs et', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9478, 'PCT', 'EXPENSE', '6476', 9473, 'Prestations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9479, 'PCT', 'EXPENSE', '648', 9436,
        'Charges de personnel liées à une modification comptable à imputer au résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9480, 'PCT', 'EXPENSE', '649', 9436, 'Autres charges de personnelles et autres charges sociales',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9481, 'PCT', 'EXPENSE', '6490', 9480, 'Autres charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9482, 'PCT', 'EXPENSE', '6495', 9480, 'Au très charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9483, 'PCT', 'EXPENSE', '65', 9376, 'Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9484, 'PCT', 'EXPENSE', '651', 9483, 'Charges d''intérêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9485, 'PCT', 'EXPENSE', '6511', 9484, 'Intérêts des emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9486, 'PCT', 'EXPENSE', '65116', 9485, 'Des emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9487, 'PCT', 'EXPENSE', '65117', 9485, 'Des dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9488, 'PCT', 'EXPENSE', '6515', 9484, 'Intérêts des comptes courants et des dépôts créditeurs',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9489, 'PCT', 'EXPENSE', '6516', 9484, 'Intérêts bancaires et sur opérations de financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9490, 'PCT', 'EXPENSE', '6517', 9484, 'Intérêts des obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9491, 'PCT', 'EXPENSE', '6518', 9484,
        'Intérêts des autres dettes (y compris les pénalités et intérêts de retard sur emprunts)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9492, 'PCT', 'EXPENSE', '653', 9483, 'Pertes sur créances liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9493, 'PCT', 'EXPENSE', '654', 9483, 'Escomptes accordés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9494, 'PCT', 'EXPENSE', '655', 9483, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9495, 'PCT', 'EXPENSE', '656', 9483, 'Charges nettes sur cessions de valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9496, 'PCT', 'EXPENSE', '657', 9483, 'Autres charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9497, 'PCT', 'EXPENSE', '658', 9483,
        'Charges financières liées à une modification comptable à imputer au résultat de l''exercice ou à une activité abandonnée',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9498, 'PCT', 'EXPENSE', '66', 9376, 'Impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9499, 'PCT', 'EXPENSE', '661', 9498, 'Impôts, taxes et versements assimilés sur rémunérations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9500, 'PCT', 'EXPENSE', '6611', 9499, 'TFP', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9501, 'PCT', 'EXPENSE', '6612', 9499, 'FOPROLOS', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9502, 'PCT', 'EXPENSE', '6618', 9499, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9503, 'PCT', 'EXPENSE', '665', 9498, 'Autres impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9504, 'PCT', 'EXPENSE', '6651', 9503, 'Impôts et taxes divers (sauf impôts sur les bénéfices)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9505, 'PCT', 'EXPENSE', '6652', 9503, 'Taxes sur le chiffre d''affaires non récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9506, 'PCT', 'EXPENSE', '6654', 9503, 'Droits d''enregistrement et de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9507, 'PCT', 'EXPENSE', '6655', 9503, 'Taxes sur les véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9508, 'PCT', 'EXPENSE', '6658', 9503, 'Autres droits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9509, 'PCT', 'EXPENSE', '668', 9498,
        'Impôts et taxes liés à une modification comptable à imputer au résultat de l''exercice ou à', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9510, 'PCT', 'EXPENSE', '67', 9376, 'Pertes extraordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9511, 'PCT', 'EXPENSE', '68', 9376, 'Dotations aux amortissements et aux provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9512, 'PCT', 'EXPENSE', '681', 9511,
        'Dotations aux amortissements et aux provisions - charges ordinaires (autres que', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9513, 'PCT', 'EXPENSE', '6811', 9512,
        'Dotations aux amortissements des immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9514, 'PCT', 'EXPENSE', '68111', 9513, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9515, 'PCT', 'EXPENSE', '68112', 9513, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9516, 'PCT', 'EXPENSE', '6812', 9512, 'Dotations aux résorptions des charges reportées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9517, 'PCT', 'EXPENSE', '6815', 9512,
        'Dotations aux provisions pour risques et charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9518, 'PCT', 'EXPENSE', '6816', 9512,
        'Dotations aux provisions pour dépréciation des immobilisations incorporelles et', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9519, 'PCT', 'EXPENSE', '68161', 9518, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9520, 'PCT', 'EXPENSE', '68162', 9518, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9521, 'PCT', 'EXPENSE', '6817', 9512,
        'Dotations aux provisions pour dépréciation des actifs courants (autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9522, 'PCT', 'EXPENSE', '68173', 9521, 'Stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9523, 'PCT', 'EXPENSE', '68174', 9521, 'Créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9524, 'PCT', 'EXPENSE', '6818', 9512,
        'Dotations aux amortissements et aux provisions liées à une modification', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9525, 'PCT', 'EXPENSE', '686', 9511,
        'Dotations aux amortissements et aux provisions - charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9526, 'PCT', 'EXPENSE', '6861', 9525,
        'Dotations aux amortissements des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9527, 'PCT', 'EXPENSE', '6865', 9525,
        'Dotations aux provisions pour risques et charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9528, 'PCT', 'EXPENSE', '6866', 9525,
        'Dotations aux provisions pour dépréciation des éléments financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9529, 'PCT', 'EXPENSE', '68662', 9528, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9530, 'PCT', 'EXPENSE', '68665', 9528, 'Placements et prêts courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9531, 'PCT', 'EXPENSE', '6868', 9525,
        'Dotations aux amortissements et aux provisions liées à une modification', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9532, 'PCT', 'EXPENSE', '69', 9376, 'Impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9533, 'PCT', 'EXPENSE', '691', 9532,
        'Impôts sur les bénéfices calculés sur le résultat des activités ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9534, 'PCT', 'EXPENSE', '695', 9532, 'Autres impôts sur les bénéfices (régimes particuliers)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9535, 'PCT', 'EXPENSE', '697', 9532,
        'Impôts sur les bénéfices calculés sur les éléments extraordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9536, 'PCT', 'INCOME', '7', '', 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9537, 'PCT', 'INCOME', '70', 9536,
        'Ventes de produits fabriqués, prestations de services, marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9538, 'PCT', 'INCOME', '701', 9537, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9539, 'PCT', 'INCOME', '7011', '', 'Produits finis achevés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9540, 'PCT', 'INCOME', '7012', '', 'Produits finis non achevés (contrat de longue durée)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9541, 'PCT', 'INCOME', '702', 9537, 'Ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9542, 'PCT', 'INCOME', '703', 9537, 'Ventes de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9543, 'PCT', 'INCOME', '704', 9537, 'Travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9544, 'PCT', 'INCOME', '705', 9537, 'Études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9545, 'PCT', 'INCOME', '706', 9537, 'Produits des activités annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9546, 'PCT', 'INCOME', '707', 9537, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9547, 'PCT', 'INCOME', '708', 9537,
        'Ventes liées à une modification comptable à imputer au résultat de l''exercice ou à une', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9548, 'PCT', 'INCOME', '709', 9537, 'Rabais, remises et ristournes accordés par l''entreprise',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9549, 'PCT', 'INCOME', '7091', 9548, 'Sur ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9550, 'PCT', 'INCOME', '7092', 9548, 'Sur ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9551, 'PCT', 'INCOME', '7094', 9548, 'Sur travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9552, 'PCT', 'INCOME', '7095', 9548, 'Sur études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9553, 'PCT', 'INCOME', '7096', 9548, 'Sur activités annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9554, 'PCT', 'INCOME', '7097', 9548, 'Sur ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9555, 'PCT', 'INCOME', '7098', 9548,
        'Sur ventes liées à une modification comptable à imputer au résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9556, 'PCT', 'INCOME', '71', 9536, 'Production stockée (ou déstockage)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9557, 'PCT', 'INCOME', '713', 9556, 'Variation des stocks (en-cours de production, produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9558, 'PCT', 'INCOME', '7133', 9557, 'Variations des en-cours de production de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9559, 'PCT', 'INCOME', '7134', 9557, 'Variation des en-cours de production de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9560, 'PCT', 'INCOME', '7135', 9557, 'Variation des stocks de produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9561, 'PCT', 'INCOME', '72', 9536, 'Production immobilisée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9562, 'PCT', 'INCOME', '721', 9561, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9563, 'PCT', 'INCOME', '722', 9561, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9564, 'PCT', 'INCOME', '728', 9561,
        'Production immobilisée liée à une modification comptable à imputer au résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9565, 'PCT', 'INCOME', '73', 9536, 'Produits divers ordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9566, 'PCT', 'INCOME', '731', 9565,
        'Redevances pour concessions, brevets, licences, marques, procédés, droits et valeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9567, 'PCT', 'INCOME', '732', 9565,
        'Revenus des immeubles non affectés aux activités professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9568, 'PCT', 'INCOME', '733', 9565,
        'Jetons de présence et rémunérations d''administrateurs, gérants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9569, 'PCT', 'INCOME', '734', 9565, 'Ristournes perçues des coopératives (provenant des excédents)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9570, 'PCT', 'INCOME', '735', 9565, 'Quotes-parts de résultat sur opérations faites en commun',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9571, 'PCT', 'INCOME', '736', 9565,
        'Produits nets sur cessions d''immobilisations et autres gains sur éléments non', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9572, 'PCT', 'INCOME', '738', 9565,
        'Produits divers ordinaires liés à une modification comptable à imputer au résultat de', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9573, 'PCT', 'INCOME', '739', 9565,
        'Quotes-parts des subventions d''investissement inscrites au résultat de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9574, 'PCT', 'INCOME', '74', 9536, 'Subventions d''exploitation et d''équilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9575, 'PCT', 'INCOME', '741', 9574, 'Subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9576, 'PCT', 'INCOME', '745', 9574, 'Subventions d''équilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9577, 'PCT', 'INCOME', '748', 9574,
        'Subventions liées à une modification comptable à imputer au résultat de l''exercice ou à', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9578, 'PCT', 'INCOME', '75', 9536, 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9579, 'PCT', 'INCOME', '751', 9578, 'Produits des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9580, 'PCT', 'INCOME', '752', 9578, 'Produits des autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9581, 'PCT', 'INCOME', '753', 9578, 'Revenus des autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9582, 'PCT', 'INCOME', '754', 9578, 'Revenus des valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9583, 'PCT', 'INCOME', '755', 9578, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9584, 'PCT', 'INCOME', '756', 9578, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9585, 'PCT', 'INCOME', '757', 9578, 'Produits nets sur cessions de valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9586, 'PCT', 'INCOME', '758', 9578,
        'Produits financiers liés à une modification comptable à imputer au résultat de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9587, 'PCT', 'INCOME', '77', 9536, 'Gains extraordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9588, 'PCT', 'INCOME', '78', 9536, 'Reprises sur amortissements et provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9589, 'PCT', 'INCOME', '781', 9588,
        'Reprises sur amortissements et provisions (à inscrire dans les produits ordinaires)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9590, 'PCT', 'INCOME', '7811', 9589,
        'Reprises sur amortissements des immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9591, 'PCT', 'INCOME', '78111', 9590, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9592, 'PCT', 'INCOME', '78112', 9590, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9593, 'PCT', 'INCOME', '7815', 9589,
        'Reprises sur provisions pour risques et charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9594, 'PCT', 'INCOME', '7816', 9589,
        'Reprises sur provisions pour dépréciation des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9595, 'PCT', 'INCOME', '78161', 9594, ' Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9596, 'PCT', 'INCOME', '78162', 9594, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9597, 'PCT', 'INCOME', '7817', 9589,
        'Reprises sur provisions pour dépréciation des actifs courants (autres que', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9598, 'PCT', 'INCOME', '78173', 9597, 'Stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9599, 'PCT', 'INCOME', '78174', 9597, 'Créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9600, 'PCT', 'INCOME', '7818', 9589,
        'Reprises sur provisions liées à une modification comptable inscrite aux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9601, 'PCT', 'INCOME', '786', 9588,
        'Reprises sur provisions (à inscrire dans les produits financiers)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9602, 'PCT', 'INCOME', '7865', 9601, 'Reprises sur provisions pour risque et charges financières',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9603, 'PCT', 'INCOME', '7866', 9601,
        'Reprises sur provisions pour dépréciation des éléments financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9604, 'PCT', 'INCOME', '7868', 9601,
        'Reprises sur provisions (à inscrire dans les produits financiers) liées à une', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9605, 'PCT', 'INCOME', '79', 9536, 'Transferts de charges', '1');
