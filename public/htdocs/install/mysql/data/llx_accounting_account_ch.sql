-- Descriptif plan comptable Suisse
-- ID 13000 - 13299
-- ADD 600000 to rowid # Do no remove this comment --

INSERT INTO llx_const (name, value, type, note, visible, entity)
values ('ACCOUNTING_MANAGE_ZERO', '1', 'chaine', 'Manage the  0 for the accountancy account', 1, 0);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13000, 'PCG_SUISSE', 'XXXXXX', '1', 0, 'Actifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13001, 'PCG_SUISSE', 'XXXXXX', '10', 13000, 'Actifs circulants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13002, 'PCG_SUISSE', 'XXXXXX', '100', 13001, 'Liquidités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13003, 'PCG_SUISSE', 'XXXXXX', '1000', 13002, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13004, 'PCG_SUISSE', 'XXXXXX', '1020', 13002, 'Banque (Avoir)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13005, 'PCG_SUISSE', 'XXXXXX', '106', 13001, 'Avoirs à courts terme côtés en bourse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13006, 'PCG_SUISSE', 'XXXXXX', '1060', 13005, 'Titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13007, 'PCG_SUISSE', 'XXXXXX', '1069', 13005, 'Ajustement de la valeur des titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13008, 'PCG_SUISSE', 'XXXXXX', '110', 13001, 'Créances résultant de livraisons et prestations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13009, 'PCG_SUISSE', 'XXXXXX', '1100', 13008,
        'Créances provenant de livraisons et de prestations (Débiteurs)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13010, 'PCG_SUISSE', 'XXXXXX', '1109', 13008, 'Ducroire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13011, 'PCG_SUISSE', 'XXXXXX', '1110', 13008,
        'Créances résultant de livr. et prest. envers les sociétés du groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13012, 'PCG_SUISSE', 'XXXXXX', '114', 13001, 'Autres créances à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13013, 'PCG_SUISSE', 'XXXXXX', '1140', 13012, 'Avances et prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13014, 'PCG_SUISSE', 'XXXXXX', '1149', 13012, 'Ajustement de la valeur des avances et des prêts',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13015, 'PCG_SUISSE', 'XXXXXX', '1170', 13008,
        'Impôt préalable: TVA s/matériel, marchandises, prestations et énergie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13016, 'PCG_SUISSE', 'XXXXXX', '1171', 13008,
        'Impôt préalable: TVA s/investissements et autres charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13017, 'PCG_SUISSE', 'XXXXXX', '1176', 13008, 'Impôt anticipé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13018, 'PCG_SUISSE', 'XXXXXX', '1180', 13008,
        'Créance envers les assurances sociales et institutions de prévoyance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13019, 'PCG_SUISSE', 'XXXXXX', '1189', 13008, 'Impôt à la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13020, 'PCG_SUISSE', 'XXXXXX', '1190', 13008, 'Autres créances à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13021, 'PCG_SUISSE', 'XXXXXX', '1199', 13008, 'Ajustement de la valeur des créances à court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13022, 'PCG_SUISSE', 'XXXXXX', '120', 13001, 'Stocks et prestations non facturées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13023, 'PCG_SUISSE', 'XXXXXX', '1200', 13022, 'Marchandises commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13024, 'PCG_SUISSE', 'XXXXXX', '1210', 13022, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13025, 'PCG_SUISSE', 'XXXXXX', '1220', 13022, 'Matières auxiliaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13026, 'PCG_SUISSE', 'XXXXXX', '1230', 13022, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13027, 'PCG_SUISSE', 'XXXXXX', '1250', 13022, 'Marchandises en consignation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13028, 'PCG_SUISSE', 'XXXXXX', '1260', 13022, 'Stocks de produits fnis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13029, 'PCG_SUISSE', 'XXXXXX', '1280', 13022, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13030, 'PCG_SUISSE', 'XXXXXX', '130', 13001, 'Compte de régularisation de l''actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13031, 'PCG_SUISSE', 'XXXXXX', '1300', 13030, 'Charges payées d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13032, 'PCG_SUISSE', 'XXXXXX', '1301', 13030, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13033, 'PCG_SUISSE', 'XXXXXX', '14', 13000, 'Actifs immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13034, 'PCG_SUISSE', 'XXXXXX', '140', 13033, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13035, 'PCG_SUISSE', 'XXXXXX', '1400', 13034, 'Titres à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13036, 'PCG_SUISSE', 'XXXXXX', '1409', 13034, 'Ajustement de la valeur des titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13037, 'PCG_SUISSE', 'XXXXXX', '1440', 13034, 'Prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13038, 'PCG_SUISSE', 'XXXXXX', '1441', 13034, 'Hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13039, 'PCG_SUISSE', 'XXXXXX', '1449', 13034, 'Ajustement de la valeur des créances à long terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13040, 'PCG_SUISSE', 'XXXXXX', '148', 13033, 'Participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13041, 'PCG_SUISSE', 'XXXXXX', '1480', 13040, 'Participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13042, 'PCG_SUISSE', 'XXXXXX', '1489', 13040, 'Ajustement de la valeur des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13043, 'PCG_SUISSE', 'XXXXXX', '150', 13000, 'Immobilisations corporelles meublés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13044, 'PCG_SUISSE', 'XXXXXX', '1500', 13043, 'Machines et appareils', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13045, 'PCG_SUISSE', 'XXXXXX', '1509', 13043, 'Ajustement de la valeur des machines et appareils',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13046, 'PCG_SUISSE', 'XXXXXX', '1510', 13043, 'Mobilier et installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13047, 'PCG_SUISSE', 'XXXXXX', '1519', 13043,
        'Ajustement de la valeur du mobilier et des installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13048, 'PCG_SUISSE', 'XXXXXX', '1520', 13043,
        'Machines de bureau, informatique, système de communication', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13049, 'PCG_SUISSE', 'XXXXXX', '1529', 13043,
        'Ajustement de la valeur des machines de bureau, inf. et syst. comm.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13050, 'PCG_SUISSE', 'XXXXXX', '1530', 13043, 'Véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13051, 'PCG_SUISSE', 'XXXXXX', '1539', 13043, 'Ajustement de la valeur des véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13052, 'PCG_SUISSE', 'XXXXXX', '1540', 13043, 'Outillages et appareils', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13053, 'PCG_SUISSE', 'XXXXXX', '1549', 13043, 'Ajustement de la valeur des outillages et appareils',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13054, 'PCG_SUISSE', 'XXXXXX', '160', 13000, 'Immobilisations corporelles Immeubles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13055, 'PCG_SUISSE', 'XXXXXX', '1600', 13054, 'Immeubles d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13056, 'PCG_SUISSE', 'XXXXXX', '1609', 13054,
        'Ajustements de la valeur des immeubles d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13057, 'PCG_SUISSE', 'XXXXXX', '170', 13000, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13058, 'PCG_SUISSE', 'XXXXXX', '1700', 13057, 'Brevets, know-how, licences, droits, dév.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13059, 'PCG_SUISSE', 'XXXXXX', '1709', 13057,
        'Ajustement de la valeur des brevets, know-how, licences, droits, dév.', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13060, 'PCG_SUISSE', 'XXXXXX', '1770', 13057, 'Goodwill', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13061, 'PCG_SUISSE', 'XXXXXX', '1779', 13057, 'Ajustement de la valeur du goodwill', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13062, 'PCG_SUISSE', 'XXXXXX', '180', 13000,
        'Capital non versé : capital social, capital de fondation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13063, 'PCG_SUISSE', 'XXXXXX', '1850', 13062,
        'Capital actions, capital social, droits de participations ou capital de fondation non versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13064, 'PCG_SUISSE', 'XXXXXX', '2', 0, 'Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13065, 'PCG_SUISSE', 'XXXXXX', '20', 13064, 'Dettes à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13066, 'PCG_SUISSE', 'XXXXXX', '200', 13065,
        'Dettes à court terme résultant d''achats et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13067, 'PCG_SUISSE', 'XXXXXX', '2000', 13066,
        'Dettes résultant d''achats et des prestations de services (créanciers)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13068, 'PCG_SUISSE', 'XXXXXX', '2030', 13066, 'Acomptes de clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13069, 'PCG_SUISSE', 'XXXXXX', '2050', 13066,
        'Dettes résultant d''achats et de prestations de services envers des sociétés du groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13070, 'PCG_SUISSE', 'XXXXXX', '210', 13065, 'Dettes à court terme rémunérés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13071, 'PCG_SUISSE', 'XXXXXX', '2100', 13070, 'Dettes bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13072, 'PCG_SUISSE', 'XXXXXX', '2120', 13070, 'Engagements de financement par leasing', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13073, 'PCG_SUISSE', 'XXXXXX', '2140', 13070, 'Autres dettes à court terme rémunérées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13074, 'PCG_SUISSE', 'XXXXXX', '2151', 13070, 'Salaires à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13075, 'PCG_SUISSE', 'XXXXXX', '2152', 13070, 'Charges sociales à payer (AVS/AC/ALFA)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13076, 'PCG_SUISSE', 'XXXXXX', '21521', 13075, 'Créancier AVS/AI/APG/AC', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13077, 'PCG_SUISSE', 'XXXXXX', '21522', 13075, 'Créancier Allocations Familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13078, 'PCG_SUISSE', 'XXXXXX', '2153', 13070, 'Assurances sociales à payer (LAA, IJM, FT, LPP)',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13079, 'PCG_SUISSE', 'XXXXXX', '21531', 13078, 'Créancier Assurance Accidents', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13080, 'PCG_SUISSE', 'XXXXXX', '21532', 13078, 'Créancier Assurance Accidents complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13081, 'PCG_SUISSE', 'XXXXXX', '21533', 13078, 'Créancier Prévoyance Professionnelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13082, 'PCG_SUISSE', 'XXXXXX', '21534', 13078,
        'Créancier Prévoyance Professionnelle complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13083, 'PCG_SUISSE', 'XXXXXX', '21535', 13078,
        'Créancier Assurance Indemnités Journalières Maladie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13084, 'PCG_SUISSE', 'XXXXXX', '21536', 13078,
        'Créancier Assurance Indemnités Journalières Maladie complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13085, 'PCG_SUISSE', 'XXXXXX', '21539', 13078, 'Créancier autres caisses et assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13086, 'PCG_SUISSE', 'XXXXXX', '2154', 13070, 'Impôt source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13087, 'PCG_SUISSE', 'XXXXXX', '2155', 13070, 'Autres charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13088, 'PCG_SUISSE', 'XXXXXX', '21551', 13087, 'Taxe réfugiés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13089, 'PCG_SUISSE', 'XXXXXX', '21552', 13087, 'Office des Poursuites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13090, 'PCG_SUISSE', 'XXXXXX', '21553', 13087, 'Retraite anticipée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13091, 'PCG_SUISSE', 'XXXXXX', '21554', 13087, 'Caisse professionnelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13092, 'PCG_SUISSE', 'XXXXXX', '21559', 13087, 'Autres retenues employé à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13093, 'PCG_SUISSE', 'XXXXXX', '2158', 13070, 'Provisions 13ème et vacances à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13094, 'PCG_SUISSE', 'XXXXXX', '2160', 13070, 'Indemnités d''assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13095, 'PCG_SUISSE', 'XXXXXX', '21601', 13094, 'Indemnités d''assurance accidents', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13096, 'PCG_SUISSE', 'XXXXXX', '21602', 13094, 'Indemnités d''assurance maladie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13097, 'PCG_SUISSE', 'XXXXXX', '21603', 13094, 'Indemnités d''assurance maternité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13098, 'PCG_SUISSE', 'XXXXXX', '21604', 13094, 'Indemnités d''assurance maternité complémentaire',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13099, 'PCG_SUISSE', 'XXXXXX', '21605', 13094, 'Indemnités d''assurance APG militaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13100, 'PCG_SUISSE', 'XXXXXX', '21606', 13094, 'Indemnités d''assurance militaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13101, 'PCG_SUISSE', 'XXXXXX', '21607', 13094, 'Indemnités d''assurance chômage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13102, 'PCG_SUISSE', 'XXXXXX', '21608', 13094, 'Indemnités d''assurance AI', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13103, 'PCG_SUISSE', 'XXXXXX', '21609', 13094, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13104, 'PCG_SUISSE', 'XXXXXX', '220', 13065, 'Autres dettes à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13105, 'PCG_SUISSE', 'XXXXXX', '2200', 13104, 'TVA due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13106, 'PCG_SUISSE', 'XXXXXX', '2201', 13104, 'Décompte TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13107, 'PCG_SUISSE', 'XXXXXX', '2206', 13104, 'Impôt anticipé dû', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13108, 'PCG_SUISSE', 'XXXXXX', '2208', 13104, 'Impôts directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13109, 'PCG_SUISSE', 'XXXXXX', '2210', 13104, 'Autres dettes à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13110, 'PCG_SUISSE', 'XXXXXX', '2261', 13104, 'Dividendes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13111, 'PCG_SUISSE', 'XXXXXX', '2270', 13104, 'Assurances sociales et institutions de prévoyance',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13112, 'PCG_SUISSE', 'XXXXXX', '2279', 13104, 'Impôt à la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13113, 'PCG_SUISSE', 'XXXXXX', '230', 13065, 'Passifs de régularisation et provision à court terme',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13114, 'PCG_SUISSE', 'XXXXXX', '2300', 13113, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13115, 'PCG_SUISSE', 'XXXXXX', '2301', 13113, 'Produits constatés d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13116, 'PCG_SUISSE', 'XXXXXX', '2330', 13113, 'Provisions à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13117, 'PCG_SUISSE', 'XXXXXX', '24', 13064, 'Dettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13118, 'PCG_SUISSE', 'XXXXXX', '240', 13117, 'Dettes à long terme rémunérées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13119, 'PCG_SUISSE', 'XXXXXX', '2400', 13118, 'Dettes bancaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13120, 'PCG_SUISSE', 'XXXXXX', '2420', 13118, 'Engagements de financement par leasing', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13121, 'PCG_SUISSE', 'XXXXXX', '2430', 13118, 'Emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13122, 'PCG_SUISSE', 'XXXXXX', '2450', 13118, 'Emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13123, 'PCG_SUISSE', 'XXXXXX', '2451', 13118, 'Hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13124, 'PCG_SUISSE', 'XXXXXX', '250', 13117, 'Autres dettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13125, 'PCG_SUISSE', 'XXXXXX', '2500', 13124, 'Autres dettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13126, 'PCG_SUISSE', 'XXXXXX', '260', 13117, 'Provisions à long terme et provisions légales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13127, 'PCG_SUISSE', 'XXXXXX', '2600', 13126, 'Provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13128, 'PCG_SUISSE', 'XXXXXX', '28', 13064, 'Fonds propres (personnes morales)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13129, 'PCG_SUISSE', 'XXXXXX', '280', 13128, 'Capital social ou capital de fondation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13130, 'PCG_SUISSE', 'XXXXXX', '2800', 13129,
        'Capital-actions, capital social, capital de fondation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13131, 'PCG_SUISSE', 'XXXXXX', '290', 13064, 'Réserves / bénéfices et pertes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13132, 'PCG_SUISSE', 'XXXXXX', '2900', 13131, 'Réserves légales issues du capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13133, 'PCG_SUISSE', 'XXXXXX', '2930', 13131, 'Réserves sur participations propres au capital',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13134, 'PCG_SUISSE', 'XXXXXX', '2940', 13131, 'Réserves d''évaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13135, 'PCG_SUISSE', 'XXXXXX', '2950', 13131, 'Réserves légales issues du bénéfice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13136, 'PCG_SUISSE', 'XXXXXX', '2960', 13131, 'Réserves libres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13137, 'PCG_SUISSE', 'XXXXXX', '2970', 13131, 'Bénéfice / perte reporté', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13138, 'PCG_SUISSE', 'XXXXXX', '2979', 13131, 'Bénéfice / perte de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13139, 'PCG_SUISSE', 'XXXXXX', '2980', 13131,
        'Propres actions, parts sociales, droits de participations (poste négatif)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13140, 'PCG_SUISSE', 'XXXXXX', '3', 0,
        'Chiffre d''affaires résultant des ventes et des prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13141, 'PCG_SUISSE', 'XXXXXX', '3000', 13140, 'Ventes de produits fabriqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13142, 'PCG_SUISSE', 'XXXXXX', '3200', 13140, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13143, 'PCG_SUISSE', 'XXXXXX', '3400', 13140, 'Ventes de prestations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13144, 'PCG_SUISSE', 'XXXXXX', '3600', 13140, 'Autres ventes et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13145, 'PCG_SUISSE', 'XXXXXX', '3700', 13140, 'Prestations propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13146, 'PCG_SUISSE', 'XXXXXX', '3710', 13140, 'Consommations propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13147, 'PCG_SUISSE', 'XXXXXX', '3800', 13140, 'Déductions sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13148, 'PCG_SUISSE', 'XXXXXX', '3805', 13140, 'Pertes sur clients, variations du ducroire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13149, 'PCG_SUISSE', 'XXXXXX', '3900', 13140, 'Variation des stocks de produits semis-finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13150, 'PCG_SUISSE', 'XXXXXX', '3901', 13140, 'Variation des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13151, 'PCG_SUISSE', 'XXXXXX', '3904', 13140,
        'Variation de la valeur des prestations non facturées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13152, 'PCG_SUISSE', 'XXXXXX', '4', 0,
        'Charges de matériel, de marchandises et de prestations de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13153, 'PCG_SUISSE', 'XXXXXX', '4000', 13152, 'Charges de matériel de l''atelier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13154, 'PCG_SUISSE', 'XXXXXX', '4200', 13152, 'Achats de marchandises destinées à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13155, 'PCG_SUISSE', 'XXXXXX', '4400', 13152, 'Prestations / travaux de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13156, 'PCG_SUISSE', 'XXXXXX', '4500', 13152, 'Charges d''énergie pour l''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13157, 'PCG_SUISSE', 'XXXXXX', '4900', 13152, 'Déductions sur les charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13158, 'PCG_SUISSE', 'XXXXXX', '5', 0, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13159, 'PCG_SUISSE', 'XXXXXX', '5000', 13158, 'Salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13160, 'PCG_SUISSE', 'XXXXXX', '5200', 13158, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13161, 'PCG_SUISSE', 'XXXXXX', '5201', 13158,
        'Salaires variables, commissions et primes régulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13162, 'PCG_SUISSE', 'XXXXXX', '5202', 13158, 'Primes occasionnelles et participations au bénéfice',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13163, 'PCG_SUISSE', 'XXXXXX', '5203', 13158, 'Divers soumis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13164, 'PCG_SUISSE', 'XXXXXX', '5204', 13158, 'Divers non soumis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13165, 'PCG_SUISSE', 'XXXXXX', '5210', 13158, 'Honoraires et indemnités CA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13166, 'PCG_SUISSE', 'XXXXXX', '5270', 13158, 'AVS, AI, APG, assurance-chômage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13167, 'PCG_SUISSE', 'XXXXXX', '5271', 13158, 'Caisse d''allocations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13168, 'PCG_SUISSE', 'XXXXXX', '52721', 13167, 'Prévoyance professionnelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13169, 'PCG_SUISSE', 'XXXXXX', '52722', 13167, 'Prévoyance professionnelle complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13170, 'PCG_SUISSE', 'XXXXXX', '52731', 13167, 'Assurance-accidents', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13171, 'PCG_SUISSE', 'XXXXXX', '52732', 13167, 'Assurance-accidents complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13172, 'PCG_SUISSE', 'XXXXXX', '52741', 13167, 'Assurance IJM', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13173, 'PCG_SUISSE', 'XXXXXX', '52742', 13167, 'Assurance IJM complémentaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13174, 'PCG_SUISSE', 'XXXXXX', '5275', 13158, 'Autres assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13175, 'PCG_SUISSE', 'XXXXXX', '5276', 13158, 'Impôts à la source payé par employeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13176, 'PCG_SUISSE', 'XXXXXX', '5278', 13158, 'Caisse professionnelle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13177, 'PCG_SUISSE', 'XXXXXX', '5279', 13158, 'Arrondis sur charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13178, 'PCG_SUISSE', 'XXXXXX', '5280', 13158, 'Autres charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13179, 'PCG_SUISSE', 'XXXXXX', '5281', 13158, 'Frais de voyages/transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13180, 'PCG_SUISSE', 'XXXXXX', '5282', 13158, 'Frais de repas/hébergement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13181, 'PCG_SUISSE', 'XXXXXX', '5283', 13158, 'Frais forfaitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13182, 'PCG_SUISSE', 'XXXXXX', '5284', 13158, 'Frais de représentation, téléphones, divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13183, 'PCG_SUISSE', 'XXXXXX', '5288', 13158, 'Frais de formation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13184, 'PCG_SUISSE', 'XXXXXX', '5289', 13158, 'Autres frais de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13185, 'PCG_SUISSE', 'XXXXXX', '5290', 13158, 'Prestations de travail de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13186, 'PCG_SUISSE', 'XXXXXX', '5700', 13158, 'Charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13187, 'PCG_SUISSE', 'XXXXXX', '5800', 13158, 'Autres charges du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13188, 'PCG_SUISSE', 'XXXXXX', '5900', 13158, 'Charges de personnels temporaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13189, 'PCG_SUISSE', 'XXXXXX', '6', 0,
        'Autres charges d''exploitation, amortissements et ajustement de valeur, résultat financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13190, 'PCG_SUISSE', 'XXXXXX', '6000', 13189, 'Charges de locaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13191, 'PCG_SUISSE', 'XXXXXX', '6100', 13189,
        'Entretien, réparations et remplacement des inst. servant à l''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13192, 'PCG_SUISSE', 'XXXXXX', '6105', 13189, 'Leasing immobilisations corporelles meubles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13193, 'PCG_SUISSE', 'XXXXXX', '6200', 13189, 'Charges de véhicules et de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13194, 'PCG_SUISSE', 'XXXXXX', '6260', 13189, 'Leasing et location de véhicule', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13195, 'PCG_SUISSE', 'XXXXXX', '6300', 13189, 'Assurances-choses, droits, taxes, autorisations',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13196, 'PCG_SUISSE', 'XXXXXX', '6400', 13189, 'Charges d''énergie et évacuation des déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13197, 'PCG_SUISSE', 'XXXXXX', '6500', 13189, 'Charges d''administration', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13198, 'PCG_SUISSE', 'XXXXXX', '6510', 13189, 'Téléphone', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13199, 'PCG_SUISSE', 'XXXXXX', '6511', 13189, 'Internet', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13200, 'PCG_SUISSE', 'XXXXXX', '6512', 13189, 'Frais de port', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13201, 'PCG_SUISSE', 'XXXXXX', '6560', 13189, 'Informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13202, 'PCG_SUISSE', 'XXXXXX', '6570', 13189, 'Charges et leasing d''informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13203, 'PCG_SUISSE', 'XXXXXX', '6571', 13189, 'Entretien/Hotline Hardware', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13204, 'PCG_SUISSE', 'XXXXXX', '6573', 13189, 'Disquettes, CD-Rom, etc. Fourniture d''exploitation',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13205, 'PCG_SUISSE', 'XXXXXX', '6600', 13189, 'Publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13206, 'PCG_SUISSE', 'XXXXXX', '6610', 13189, 'Imprimés publicitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13207, 'PCG_SUISSE', 'XXXXXX', '6640', 13189, 'Frais de voyage et conseils à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13208, 'PCG_SUISSE', 'XXXXXX', '6641', 13189, 'Frais de représentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13209, 'PCG_SUISSE', 'XXXXXX', '6700', 13189, 'Autres charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13210, 'PCG_SUISSE', 'XXXXXX', '6800', 13189,
        'Amortissement et ajustement de valeur des postes sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13211, 'PCG_SUISSE', 'XXXXXX', '6801', 13189, 'Intérêts pour emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13212, 'PCG_SUISSE', 'XXXXXX', '6840', 13189, 'Frais de banque et des chèques postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13213, 'PCG_SUISSE', 'XXXXXX', '6850', 13189, 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13214, 'PCG_SUISSE', 'XXXXXX', '6900', 13189, 'Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13215, 'PCG_SUISSE', 'XXXXXX', '6920', 13189, 'Amortissement s/immobilisé. corporelles meubles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13216, 'PCG_SUISSE', 'XXXXXX', '6930', 13189, 'Amortissement s/immobilisé. corporelles immeubles',
        '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13217, 'PCG_SUISSE', 'XXXXXX', '6940', 13189, 'Amortissement s/immobilisé. incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13218, 'PCG_SUISSE', 'XXXXXX', '6950', 13189, 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13219, 'PCG_SUISSE', 'XXXXXX', '7', 0, 'Résultat des activités annexes d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13220, 'PCG_SUISSE', 'XXXXXX', '7000', 13219, 'Produits accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13221, 'PCG_SUISSE', 'XXXXXX', '7010', 13219, 'Charges accessoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13222, 'PCG_SUISSE', 'XXXXXX', '7400', 13219, 'Produits sur placements financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13223, 'PCG_SUISSE', 'XXXXXX', '7410', 13219, 'Charges sur placements financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13224, 'PCG_SUISSE', 'XXXXXX', '7500', 13219, 'Produits des immeubles d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13225, 'PCG_SUISSE', 'XXXXXX', '7510', 13219, 'Charges des immeubles d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13226, 'PCG_SUISSE', 'XXXXXX', '8', 0, 'Charges hors exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13227, 'PCG_SUISSE', 'XXXXXX', '8000', 13226, 'Charges hors exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13228, 'PCG_SUISSE', 'XXXXXX', '8100', 13226, 'Produits hors exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13229, 'PCG_SUISSE', 'XXXXXX', '8500', 13226,
        'Charges extraordinaires, exceptionnelles ou hors période', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13230, 'PCG_SUISSE', 'XXXXXX', '8510', 13226,
        'Produits extraordinaires, exceptionnels ou hors période', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13231, 'PCG_SUISSE', 'XXXXXX', '8900', 13226, 'Impôts directs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13232, 'PCG_SUISSE', 'XXXXXX', '9', 0, 'Produits de vente et de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13233, 'PCG_SUISSE', 'XXXXXX', '9001', 13232, 'Charges de vente et de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13234, 'PCG_SUISSE', 'XXXXXX', '9002', 13232, 'Résultat brut 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13235, 'PCG_SUISSE', 'XXXXXX', '9006', 13232, 'Charges de personnel de production', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13236, 'PCG_SUISSE', 'XXXXXX', '9007', 13232, 'Résultat brut 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13237, 'PCG_SUISSE', 'XXXXXX', '9008', 13232, 'Autres charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13238, 'PCG_SUISSE', 'XXXXXX', '9009', 13232, 'Résultat brut 3', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13239, 'PCG_SUISSE', 'XXXXXX', '9010', 13232, 'Autres charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13240, 'PCG_SUISSE', 'XXXXXX', '9011', 13232, 'Résultat d''exploitation 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13241, 'PCG_SUISSE', 'XXXXXX', '9012', 13232, 'Résultat financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13242, 'PCG_SUISSE', 'XXXXXX', '9013', 13232, 'Résultat d''exploitation 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13243, 'PCG_SUISSE', 'XXXXXX', '9014', 13232, 'Amortissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13244, 'PCG_SUISSE', 'XXXXXX', '9015', 13232, 'Résultat d''exploitation 3', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13245, 'PCG_SUISSE', 'XXXXXX', '9016', 13232, 'Résultat activités annexes exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13246, 'PCG_SUISSE', 'XXXXXX', '9017', 13232, 'Résultat d''exploitation 4', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13247, 'PCG_SUISSE', 'XXXXXX', '9018', 13232, 'Résultats extraordinaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13248, 'PCG_SUISSE', 'XXXXXX', '9019', 13232, 'Résultat d''entreprise avant impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13249, 'PCG_SUISSE', 'XXXXXX', '9020', 13232, 'Charges d''impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13250, 'PCG_SUISSE', 'XXXXXX', '9090', 13232, 'Résultat d''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13251, 'PCG_SUISSE', 'XXXXXX', '9100', 13232, 'Bilan d''ouverture', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13252, 'PCG_SUISSE', 'XXXXXX', '9101', 13232, 'Bilan de clôture', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13253, 'PCG_SUISSE', 'XXXXXX', '9200', 13232, 'Bénéfice / perte de l''exercice', '1');
