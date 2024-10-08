-- Copyright (C) 2017 Laurent Destailleur  <eldy@users.sourceforge.net>
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

-- Descriptif des plans comptables UK ENG-BASE 
-- ID 70000 - 79999
-- ADD 700000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71501, 'ENG-BASE', 'CAPIT', '1', '0',
        'Equity, provisions for liabilities and charges and liabilities at more than one year', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71502, 'ENG-BASE', 'IMMO', '2', '0',
        'Administration fees.Fixed assets and receivables over one year', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71503, 'ENG-BASE', 'STOCK', '3', '0', 'Stock and orders running', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71504, 'ENG-BASE', 'THIRDPARTY', '4', '0', 'Amounts receivable and payable within one year', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71505, 'ENG-BASE', 'FINAN', '5', '0', 'Placing of cash and cash equivalents', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71506, 'ENG-BASE', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71507, 'ENG-BASE', 'INCOME', '7', '0', 'Products', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70103, 'ENG-BASE', 'CAPIT', '10', '71501', 'Capital and reserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70104, 'ENG-BASE', 'CAPIT', '101', '70103', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70105, 'ENG-BASE', 'CAPIT', '104', '70103', 'Share capital premiums', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70106, 'ENG-BASE', 'CAPIT', '105', '70103', 'Revaluation differences', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70107, 'ENG-BASE', 'CAPIT', '106', '70103', 'Stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70108, 'ENG-BASE', 'CAPIT', '107', '70103', 'Equivalence difference', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70109, 'ENG-BASE', 'CAPIT', '108', '70103', 'Exploiting account', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70110, 'ENG-BASE', 'CAPIT', '109', '70103', 'Shareholders: subscribed capital - not called', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70111, 'ENG-BASE', 'CAPIT', '11', '71501', 'Retained balance (credit balance or debit)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70112, 'ENG-BASE', 'CAPIT', '110', '70111', 'Retained earnings (credit balance)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70113, 'ENG-BASE', 'CAPIT', '119', '70111', 'Retained earnings (debit balance)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70114, 'ENG-BASE', 'CAPIT', '12', '71501', 'YEAR PROFIT (profit or loss)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70115, 'ENG-BASE', 'CAPIT', '120', '70114', 'Profit for the year (profit)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70116, 'ENG-BASE', 'CAPIT', '129', '70114', 'Profit for the year (loss)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70117, 'ENG-BASE', 'CAPIT', '13', '71501', 'Investment grants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70118, 'ENG-BASE', 'CAPIT', '131', '70117', 'Equipment Grants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70119, 'ENG-BASE', 'CAPIT', '138', '70117', 'Other investment grants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70120, 'ENG-BASE', 'CAPIT', '139', '70117', 'Investment subsidies entered in the income statement',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70121, 'ENG-BASE', 'CAPIT', '14', '71501', 'Regulated provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70122, 'ENG-BASE', 'CAPIT', '142', '70121', 'Regulated Provisions for Capital Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70123, 'ENG-BASE', 'CAPIT', '143', '70121', 'Regulated inventory provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70124, 'ENG-BASE', 'CAPIT', '144', '70121', 'Regulated provisions for other assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70125, 'ENG-BASE', 'CAPIT', '145', '70121', 'Accelerated depreciation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70126, 'ENG-BASE', 'CAPIT', '146', '70121', 'Special Revaluation Provision', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70127, 'ENG-BASE', 'CAPIT', '147', '70121', 'Reinvested capital gains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70128, 'ENG-BASE', 'CAPIT', '148', '70121', 'Other regulated provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70129, 'ENG-BASE', 'CAPIT', '15', '71501', 'Provisions for risks and charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70130, 'ENG-BASE', 'CAPIT', '151', '70129', 'Risk provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70131, 'ENG-BASE', 'CAPIT', '153', '70129', 'Provisions for pensions and similar obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70132, 'ENG-BASE', 'CAPIT', '154', '70129', 'Provisions for restructuring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70133, 'ENG-BASE', 'CAPIT', '155', '70129', 'Provisions for taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70134, 'ENG-BASE', 'CAPIT', '156', '70129',
        'Provisions for renewal of fixed assets (concessionary companies)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70135, 'ENG-BASE', 'CAPIT', '157', '70129',
        'Provisions for expenses to be allocated over several financial years', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70136, 'ENG-BASE', 'CAPIT', '158', '70129', 'Other provisions for charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70137, 'ENG-BASE', 'CAPIT', '16', '71501', 'Borrowings and similar liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70138, 'ENG-BASE', 'CAPIT', '161', '70137', 'Convertible bonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70139, 'ENG-BASE', 'CAPIT', '163', '70137', 'Other bonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70140, 'ENG-BASE', 'CAPIT', '164', '70137', 'Borrowings from credit institutions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70141, 'ENG-BASE', 'CAPIT', '165', '70137', 'Deposits and surety bonds received', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70142, 'ENG-BASE', 'CAPIT', '166', '70137', 'Employee participation in results', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70143, 'ENG-BASE', 'CAPIT', '167', '70137', 'Borrowings and debts with special conditions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70144, 'ENG-BASE', 'CAPIT', '168', '70137', 'Other borrowings and similar liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70145, 'ENG-BASE', 'CAPIT', '169', '70137', 'Bond redemption premiums', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70146, 'ENG-BASE', 'CAPIT', '17', '71501', 'Debts related to participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70147, 'ENG-BASE', 'CAPIT', '171', '70146', 'Debts related to investments (group)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70148, 'ENG-BASE', 'CAPIT', '174', '70146', 'Debt related to participations (excluding group)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70149, 'ENG-BASE', 'CAPIT', '178', '70146', 'Debts related to joint ventures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70150, 'ENG-BASE', 'CAPIT', '18', '71501', 'Liaison accounts of establishments and joint ventures',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70151, 'ENG-BASE', 'CAPIT', '181', '70150', 'Liaison Accounts of Establishments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70152, 'ENG-BASE', 'CAPIT', '186', '70150',
        'Goods and services exchanged between establishments (charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70153, 'ENG-BASE', 'CAPIT', '187', '70150',
        'Goods and services exchanged between establishments (products)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70154, 'ENG-BASE', 'CAPIT', '188', '70150', 'Joint-venture Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70155, 'ENG-BASE', 'IMMO', '20', '71502', 'Intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70156, 'ENG-BASE', 'IMMO', '201', '70155', 'Administration fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70157, 'ENG-BASE', 'IMMO', '203', '70155', 'Research and development costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70158, 'ENG-BASE', 'IMMO', '205', '70155',
        'Concessions and similar rights, patents, licenses, trademarks, processes, software, rights and similar values',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70159, 'ENG-BASE', 'IMMO', '206', '70155', 'Right to lease', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70160, 'ENG-BASE', 'IMMO', '207', '70155', 'Commercial funds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70161, 'ENG-BASE', 'IMMO', '208', '70155', 'Other intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70162, 'ENG-BASE', 'IMMO', '21', '71502', 'Property, plant and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70163, 'ENG-BASE', 'IMMO', '211', '70162', 'Grounds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70164, 'ENG-BASE', 'IMMO', '212', '70162', 'Fittings and landscaping', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70165, 'ENG-BASE', 'IMMO', '213', '70162', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70166, 'ENG-BASE', 'IMMO', '214', '70162', 'Constructions on the ground of others', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70167, 'ENG-BASE', 'IMMO', '215', '70162', 'Industrial installations, equipment and tools', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70168, 'ENG-BASE', 'IMMO', '218', '70162', 'Other tangible fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70169, 'ENG-BASE', 'IMMO', '22', '71502', 'Assets under concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70170, 'ENG-BASE', 'IMMO', '23', '71502', 'Assets in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70171, 'ENG-BASE', 'IMMO', '231', '70170', 'investments in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70172, 'ENG-BASE', 'IMMO', '232', '70170', 'Intangible assets in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70173, 'ENG-BASE', 'IMMO', '237', '70170', 'Advances and advances paid on intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70174, 'ENG-BASE', 'IMMO', '238', '70170',
        'Advances and payments on orders for property, plant and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70175, 'ENG-BASE', 'IMMO', '25', '71502',
        'Shares in affiliated undertakings and claims on affiliated undertakings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70176, 'ENG-BASE', 'IMMO', '26', '71502', 'Investments and receivables from investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70177, 'ENG-BASE', 'IMMO', '261', '70176', 'Equity securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70178, 'ENG-BASE', 'IMMO', '266', '70176', 'Other forms of participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70179, 'ENG-BASE', 'IMMO', '267', '70176', 'Receivables related to equity investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70180, 'ENG-BASE', 'IMMO', '268', '70176', 'Receivables from joint ventures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70181, 'ENG-BASE', 'IMMO', '269', '70176',
        'Payments still to be made on non-paid equity securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70182, 'ENG-BASE', 'IMMO', '27', '71502', 'Other financial assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70183, 'ENG-BASE', 'IMMO', '271', '70183',
        'Fixed assets other than fixed assets of the portfolio business (ownership)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70184, 'ENG-BASE', 'IMMO', '272', '70183', 'Locked-in securities (debt)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70185, 'ENG-BASE', 'IMMO', '273', '70183', 'Fixed assets from portfolio activity', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70186, 'ENG-BASE', 'IMMO', '274', '70183', 'Loans', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70187, 'ENG-BASE', 'IMMO', '275', '70183', 'Deposits paid', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70188, 'ENG-BASE', 'IMMO', '276', '70183', 'Other receivables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70189, 'ENG-BASE', 'IMMO', '277', '70183', 'Treasury shares or own shares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70190, 'ENG-BASE', 'IMMO', '279', '70183',
        'Payments still to be made on non-paid-up capital securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70191, 'ENG-BASE', 'IMMO', '28', '71502', 'Amortization of fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70192, 'ENG-BASE', 'IMMO', '280', '70191', 'Amortization of intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70193, 'ENG-BASE', 'IMMO', '281', '70191', 'Amortization of property, plant and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70194, 'ENG-BASE', 'IMMO', '282', '70191', 'Amortization of concession assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70195, 'ENG-BASE', 'IMMO', '29', '71502', 'Impairment of fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70196, 'ENG-BASE', 'IMMO', '290', '70195', 'Impairment of intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70197, 'ENG-BASE', 'IMMO', '291', '70195', 'Impairment of property, plant and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70198, 'ENG-BASE', 'IMMO', '292', '70195', 'Impairment of fixed assets under concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70199, 'ENG-BASE', 'IMMO', '293', '70195', 'Impairment of fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70200, 'ENG-BASE', 'IMMO', '296', '70195',
        'Provisions for impairment of investments and receivables from investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70201, 'ENG-BASE', 'IMMO', '297', '70195',
        'Provisions for impairment of other long-term investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70202, 'ENG-BASE', 'STOCK', '31', '71503', 'Raw materials (and supplies)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70203, 'ENG-BASE', 'STOCK', '311', '70202', 'Subjects (or group) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70204, 'ENG-BASE', 'STOCK', '312', '70202', 'Subjects (or group) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70205, 'ENG-BASE', 'STOCK', '317', '70202', 'Supplies A, B, C,', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70206, 'ENG-BASE', 'STOCK', '32', '71503', 'Other supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70207, 'ENG-BASE', 'STOCK', '321', '70206', 'Consumable Materials', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70208, 'ENG-BASE', 'STOCK', '322', '70206', 'Supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70209, 'ENG-BASE', 'STOCK', '326', '70206', 'Packaging', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70210, 'ENG-BASE', 'STOCK', '33', '71503', 'Ongoing production of goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70211, 'ENG-BASE', 'STOCK', '331', '70210', 'Products in Progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70212, 'ENG-BASE', 'STOCK', '335', '70210', 'Work in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70213, 'ENG-BASE', 'STOCK', '34', '71503', 'On-going production of services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70214, 'ENG-BASE', 'STOCK', '341', '70213', 'Ongoing studies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70215, 'ENG-BASE', 'STOCK', '345', '70213', 'Ongoing services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70216, 'ENG-BASE', 'STOCK', '35', '71503', 'Stocks of products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70217, 'ENG-BASE', 'STOCK', '351', '70216', 'Intermediate products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70218, 'ENG-BASE', 'STOCK', '355', '70216', 'Finished products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70219, 'ENG-BASE', 'STOCK', '358', '70216', 'Residual products (or recovered materials)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70220, 'ENG-BASE', 'STOCK', '37', '71503', 'Stocks of goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70221, 'ENG-BASE', 'STOCK', '371', '70220', 'Goods (or group) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70222, 'ENG-BASE', 'STOCK', '372', '70220', 'Goods (or group) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70223, 'ENG-BASE', 'STOCK', '39', '1503',
        'Provisions for depreciation of inventories and work in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70224, 'ENG-BASE', 'STOCK', '391', '70223', 'Provisions for depreciation of raw materials', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70225, 'ENG-BASE', 'STOCK', '392', '70223', 'Provisions for depreciation of other supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70226, 'ENG-BASE', 'STOCK', '393', '70223', 'Provisions for depreciation of work in progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70227, 'ENG-BASE', 'STOCK', '394', '70223', 'Provisions for depreciation of work in process', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70228, 'ENG-BASE', 'STOCK', '395', '70223',
        'Provisions for depreciation of inventories of products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70229, 'ENG-BASE', 'STOCK', '397', '70223', 'Provisions for depreciation of inventories of goods',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70230, 'ENG-BASE', 'THIRDPARTY', '40', '71504', 'Accounts payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70231, 'ENG-BASE', 'THIRDPARTY', '400', '70230', 'Accounts payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70232, 'ENG-BASE', 'THIRDPARTY', '401', '70230', 'Suppliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70233, 'ENG-BASE', 'THIRDPARTY', '403', '70230', 'Suppliers - Payables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70234, 'ENG-BASE', 'THIRDPARTY', '404', '70230', 'Suppliers of fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70235, 'ENG-BASE', 'THIRDPARTY', '405', '70230', 'Capital Suppliers - Payables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70236, 'ENG-BASE', 'THIRDPARTY', '408', '70230', 'Supplier invoices not yet received', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70237, 'ENG-BASE', 'THIRDPARTY', '409', '70230', 'Debtors suppliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70238, 'ENG-BASE', 'THIRDPARTY', '41', '71504', 'Accounts receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70239, 'ENG-BASE', 'THIRDPARTY', '410', '70238', 'Customers and Related Accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70240, 'ENG-BASE', 'THIRDPARTY', '411', '70238', 'Customers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70241, 'ENG-BASE', 'THIRDPARTY', '413', '70238', 'Accounts Receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70242, 'ENG-BASE', 'THIRDPARTY', '416', '70238', 'Doubtful or contentious customers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70243, 'ENG-BASE', 'THIRDPARTY', '418', '70238', 'Customers - Products not yet billed', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70244, 'ENG-BASE', 'THIRDPARTY', '419', '70238', 'Accounts payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70245, 'ENG-BASE', 'THIRDPARTY', '42', '71504', 'Personnel and related accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70246, 'ENG-BASE', 'THIRDPARTY', '421', '70245', 'Staff - Remuneration due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70247, 'ENG-BASE', 'THIRDPARTY', '422', '70245', 'Works councils, establishment, ...', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70248, 'ENG-BASE', 'THIRDPARTY', '424', '70245', 'Employee participation in results', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70249, 'ENG-BASE', 'THIRDPARTY', '425', '70245', 'Staff - Advances and Advances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70250, 'ENG-BASE', 'THIRDPARTY', '426', '70245', 'Staff - Deposits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70251, 'ENG-BASE', 'THIRDPARTY', '427', '70245', 'Staff - Oppositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70252, 'ENG-BASE', 'THIRDPARTY', '428', '70245', 'Personnel - Accrued expenses and accrued income',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70253, 'ENG-BASE', 'THIRDPARTY', '43', '71504', 'Social security and other social organizations',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70254, 'ENG-BASE', 'THIRDPARTY', '431', '70253', 'Social Security', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70255, 'ENG-BASE', 'THIRDPARTY', '437', '70253', 'Other social organizations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70256, 'ENG-BASE', 'THIRDPARTY', '438', '70253',
        'Social organizations - Accrued expenses and accrued income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70257, 'ENG-BASE', 'THIRDPARTY', '44', '71504', 'State and other public authorities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70258, 'ENG-BASE', 'THIRDPARTY', '441', '70257', 'Status - Grants Receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70259, 'ENG-BASE', 'THIRDPARTY', '442', '70257',
        'Statement - Taxes and taxes recoverable on third parties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70260, 'ENG-BASE', 'THIRDPARTY', '443', '70257',
        'Special operations with the State, public authorities, international organizations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70261, 'ENG-BASE', 'THIRDPARTY', '444', '70257', 'State - Income taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70262, 'ENG-BASE', 'THIRDPARTY', '445', '70257', 'State - Taxes on turnover', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70263, 'ENG-BASE', 'THIRDPARTY', '446', '70257', 'Bonded Bonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70264, 'ENG-BASE', 'THIRDPARTY', '447', '70257', 'Other taxes, duties and similar payments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70265, 'ENG-BASE', 'THIRDPARTY', '448', '70257', 'Statement of Accounts Payable and Accrued Income',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70266, 'ENG-BASE', 'THIRDPARTY', '449', '70257', 'Emission quotas to be returned to the State', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70267, 'ENG-BASE', 'THIRDPARTY', '45', '71504', 'Group and Associates', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70268, 'ENG-BASE', 'THIRDPARTY', '451', '70267', 'Group', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70269, 'ENG-BASE', 'THIRDPARTY', '455', '70267', 'Associates - Current Accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70270, 'ENG-BASE', 'THIRDPARTY', '456', '70267', 'Associates - Capital transactions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70271, 'ENG-BASE', 'THIRDPARTY', '457', '70267', 'Associates - Dividends payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70272, 'ENG-BASE', 'THIRDPARTY', '458', '70267', 'Associates- Joint and EIG Operations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70273, 'ENG-BASE', 'THIRDPARTY', '46', '71504', 'Miscellaneous receivables and creditors', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70274, 'ENG-BASE', 'THIRDPARTY', '462', '70273', 'Receivables on disposals of fixed assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70275, 'ENG-BASE', 'THIRDPARTY', '464', '70273', 'Debts on acquisitions of marketable securities',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70276, 'ENG-BASE', 'THIRDPARTY', '465', '70273',
        'Receivables on disposals of marketable securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70277, 'ENG-BASE', 'THIRDPARTY', '467', '70273', 'Other accounts receivable or payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70278, 'ENG-BASE', 'THIRDPARTY', '468', '70273',
        'Miscellaneous - Accrued expenses and accrued income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70279, 'ENG-BASE', 'THIRDPARTY', '47', '71504', 'Transition or suspense accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70280, 'ENG-BASE', 'THIRDPARTY', '471', '70279', 'Waiting Accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70281, 'ENG-BASE', 'THIRDPARTY', '476', '70279', 'Conversion Difference - Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70282, 'ENG-BASE', 'THIRDPARTY', '477', '70279', 'Translation differences - Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70283, 'ENG-BASE', 'THIRDPARTY', '478', '70279', 'Other transitional accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70284, 'ENG-BASE', 'THIRDPARTY', '48', '71504', 'regularisation account', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70285, 'ENG-BASE', 'THIRDPARTY', '481', '70284',
        'Expenses to be spread over several financial years', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70286, 'ENG-BASE', 'THIRDPARTY', '486', '70284', 'Prepaid expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70287, 'ENG-BASE', 'THIRDPARTY', '487', '70284', 'Deferred income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70288, 'ENG-BASE', 'THIRDPARTY', '488', '70284',
        'Accounts for the periodic distribution of expenses and revenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70289, 'ENG-BASE', 'THIRDPARTY', '489', '70284', 'Emission allowances allocated by the State', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70290, 'ENG-BASE', 'THIRDPARTY', '49', '71504',
        'Provisions for depreciation of third party accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70291, 'ENG-BASE', 'THIRDPARTY', '491', '70290', 'Provisions for depreciation of customer accounts',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70292, 'ENG-BASE', 'THIRDPARTY', '495', '70290',
        'Provisions for impairment of group and associate accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70293, 'ENG-BASE', 'THIRDPARTY', '496', '70290',
        'Provisions for depreciation of accounts receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70294, 'ENG-BASE', 'FINAN', '50', '71505', 'Marketable securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70295, 'ENG-BASE', 'FINAN', '501', '70294', 'Shares in related companies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70296, 'ENG-BASE', 'FINAN', '502', '70294', 'Treasury shares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70297, 'ENG-BASE', 'FINAN', '503', '70294', 'Stock', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70298, 'ENG-BASE', 'FINAN', '504', '70294', 'Other titles conferring a right of ownership', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70299, 'ENG-BASE', 'FINAN', '505', '70294',
        'Bonds and bonds issued by the company and repurchased by it', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70300, 'ENG-BASE', 'FINAN', '506', '70294', 'Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70301, 'ENG-BASE', 'FINAN', '507', '70294', 'Treasury bills and short-term bills', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70302, 'ENG-BASE', 'FINAN', '508', '70294',
        'Other marketable securities and other assimilated claims', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70303, 'ENG-BASE', 'FINAN', '509', '70294',
        'Payments still to be made on undistributed investment securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70304, 'ENG-BASE', 'FINAN', '51', '71505', 'Banks, financial institutions and the like', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70305, 'ENG-BASE', 'FINAN', '511', '70304', 'Cash values', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70306, 'ENG-BASE', 'FINAN', '512', '70304', 'Banks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70307, 'ENG-BASE', 'FINAN', '514', '70304', 'Postal checks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70308, 'ENG-BASE', 'FINAN', '515', '70304', 'Caisses of the Treasury and public institutions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70309, 'ENG-BASE', 'FINAN', '516', '70304', 'Exchange companies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70310, 'ENG-BASE', 'FINAN', '517', '70304', 'Other financial institutions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70311, 'ENG-BASE', 'FINAN', '518', '70304', 'Accrued interest', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70312, 'ENG-BASE', 'FINAN', '519', '70304', 'Bank overdrafts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70313, 'ENG-BASE', 'FINAN', '52', '71505', 'Treasury instruments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70314, 'ENG-BASE', 'FINAN', '53', '71505', 'Checkout', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70315, 'ENG-BASE', 'FINAN', '531', '70314', 'Head Office', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70316, 'ENG-BASE', 'FINAN', '532', '70314', 'Cash box (or factory) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70317, 'ENG-BASE', 'FINAN', '533', '70314', 'Cash box (or factory) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70318, 'ENG-BASE', 'FINAN', '54', '71505', 'Advance and Flow-Through', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70319, 'ENG-BASE', 'FINAN', '58', '71505', 'Internal transfers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70320, 'ENG-BASE', 'FINAN', '59', '71505', 'Provisions for impairment of financial accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70321, 'ENG-BASE', 'FINAN', '590', '70320', 'Provisions for depreciation of marketable securities',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70322, 'ENG-BASE', 'EXPENSE', '60', '71506', 'Shopping', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70323, 'ENG-BASE', 'EXPENSE', '601', '70322', 'Stored Procurement - Raw Materials (and Supplies)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70324, 'ENG-BASE', 'EXPENSE', '602', '70322', 'Stored Procurement - Other Supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70325, 'ENG-BASE', 'EXPENSE', '603', '70322', 'Inventory Changes (Supplies and Commodities)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70326, 'ENG-BASE', 'EXPENSE', '604', '70322', 'Stored Procurement - Raw Materials (and Supplies)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70327, 'ENG-BASE', 'EXPENSE', '605', '70322', 'Purchase of equipment, works and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70328, 'ENG-BASE', 'EXPENSE', '606', '70322', 'Non-stock purchases of materials and supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70329, 'ENG-BASE', 'EXPENSE', '607', '70322', 'Purchases of goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70330, 'ENG-BASE', 'EXPENSE', '608', '70322',
        'Reserved account, where applicable, to the recapitulation of incidental expenses included in purchases', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70331, 'ENG-BASE', 'EXPENSE', '609', '70322',
        'Discounts, rebates and rebates obtained on purchases', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70332, 'ENG-BASE', 'EXPENSE', '61', '71506', 'Outside services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70333, 'ENG-BASE', 'EXPENSE', '611', '70332', 'General subcontracting', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70334, 'ENG-BASE', 'EXPENSE', '612', '70332', 'Lease payments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70335, 'ENG-BASE', 'EXPENSE', '613', '70332', 'Rentals', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70336, 'ENG-BASE', 'EXPENSE', '614', '70332', 'Rental and condominium expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70337, 'ENG-BASE', 'EXPENSE', '615', '70332', 'Maintenance and repairs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70338, 'ENG-BASE', 'EXPENSE', '616', '70332', 'Insurance premiums', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70339, 'ENG-BASE', 'EXPENSE', '617', '70332', 'Studies and research', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70340, 'ENG-BASE', 'EXPENSE', '618', '70332', 'Various', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70341, 'ENG-BASE', 'EXPENSE', '619', '70332',
        'Discounts, rebates and rebates obtained on external services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70342, 'ENG-BASE', 'EXPENSE', '62', '71506', 'Other services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70343, 'ENG-BASE', 'EXPENSE', '621', '70342', 'Staff outside the company', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70344, 'ENG-BASE', 'EXPENSE', '622', '70342', 'Remuneration of intermediaries and fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70345, 'ENG-BASE', 'EXPENSE', '623', '70342', 'Advertising, publications, public relations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70346, 'ENG-BASE', 'EXPENSE', '624', '70342',
        'Transport of goods and public transport of personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70347, 'ENG-BASE', 'EXPENSE', '625', '70342', 'Travel, missions and receptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70348, 'ENG-BASE', 'EXPENSE', '626', '70342', 'Postal and telecommunications costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70349, 'ENG-BASE', 'EXPENSE', '627', '70342', 'Banking and related services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70350, 'ENG-BASE', 'EXPENSE', '628', '70342', 'Various', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70351, 'ENG-BASE', 'EXPENSE', '629', '70342',
        'Discounts, rebates and rebates obtained on other external services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70352, 'ENG-BASE', 'EXPENSE', '63', '71506', 'Taxes other and payments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70353, 'ENG-BASE', 'EXPENSE', '631', '70352',
        'Taxes and similar payments on remuneration (tax administrations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70354, 'ENG-BASE', 'EXPENSE', '633', '70352',
        'Taxes and similar payments on remuneration (other bodies)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70355, 'ENG-BASE', 'EXPENSE', '635', '70352',
        'Other taxes, duties and similar payments (tax administrations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70356, 'ENG-BASE', 'EXPENSE', '637', '70352',
        'Other taxes, duties and similar payments (other bodies)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70357, 'ENG-BASE', 'EXPENSE', '64', '71506', 'Staff costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70358, 'ENG-BASE', 'EXPENSE', '641', '70357', 'Remuneration of staff', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70359, 'ENG-BASE', 'EXPENSE', '644', '70357', 'Remuneration of the operator''s work', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70360, 'ENG-BASE', 'EXPENSE', '645', '70357', 'Social Security and Welfare Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70361, 'ENG-BASE', 'EXPENSE', '646', '70357', 'Personal social contributions of the operator', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70362, 'ENG-BASE', 'EXPENSE', '647', '70357', 'Other payroll taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70363, 'ENG-BASE', 'EXPENSE', '648', '70357', 'Other staff costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70364, 'ENG-BASE', 'EXPENSE', '65', '71506', 'Other current operating expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70365, 'ENG-BASE', 'EXPENSE', '651', '70364',
        'Royalties for concessions, patents, licenses, trademarks, processes, software, rights and similar values', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70366, 'ENG-BASE', 'EXPENSE', '653', '70364', 'Attendance fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70367, 'ENG-BASE', 'EXPENSE', '654', '70364', 'Loss on bad debts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70368, 'ENG-BASE', 'EXPENSE', '655', '70364',
        'Share of profit or loss on transactions made jointly', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70369, 'ENG-BASE', 'EXPENSE', '658', '70364', 'Miscellaneous operating expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70370, 'ENG-BASE', 'EXPENSE', '66', '71506', 'Financial expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70371, 'ENG-BASE', 'EXPENSE', '661', '70370', 'Interest charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70372, 'ENG-BASE', 'EXPENSE', '664', '70370', 'Loss on receivables related to investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70373, 'ENG-BASE', 'EXPENSE', '665', '70370', 'Discounts granted', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70374, 'ENG-BASE', 'EXPENSE', '666', '70370', 'Exchange losses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70375, 'ENG-BASE', 'EXPENSE', '667', '70370', 'Net expense on disposals of marketable securities',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70376, 'ENG-BASE', 'EXPENSE', '668', '70370', 'Other financial expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70377, 'ENG-BASE', 'EXPENSE', '67', '71506', 'Extraordinary charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70378, 'ENG-BASE', 'EXPENSE', '671', '70377', 'Exceptional charges on management operations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70379, 'ENG-BASE', 'EXPENSE', '672', '70377',
        'Account available to entities to record, in the course of the financial year, expenses over previous financial years',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70380, 'ENG-BASE', 'EXPENSE', '675', '70377', 'Book value of assets sold', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70381, 'ENG-BASE', 'EXPENSE', '678', '70377', 'Other extraordinary expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70382, 'ENG-BASE', 'EXPENSE', '68', '71506', 'Depreciation, amortization and provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70383, 'ENG-BASE', 'EXPENSE', '681', '70382',
        'Depreciation, amortization and provisions - Operating expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70384, 'ENG-BASE', 'EXPENSE', '686', '70382',
        'Depreciation, amortization and provisions - Financial expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70385, 'ENG-BASE', 'EXPENSE', '687', '70382',
        'Depreciation, amortization and provisions - Extraordinary expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70386, 'ENG-BASE', 'EXPENSE', '69', '71506', 'Employee participation - income tax and assimilated',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70387, 'ENG-BASE', 'EXPENSE', '691', '70386', 'Employee participation in results', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70388, 'ENG-BASE', 'EXPENSE', '695', '70386', 'Income taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70389, 'ENG-BASE', 'EXPENSE', '696', '70386', 'Corporate income tax related to distributions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70390, 'ENG-BASE', 'EXPENSE', '697', '70386', 'Annual corporation tax', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70391, 'ENG-BASE', 'EXPENSE', '698', '70386', 'Tax integration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70392, 'ENG-BASE', 'EXPENSE', '699', '70386', 'Products - Reports back deficits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70393, 'ENG-BASE', 'INCOME', '70', '71507', 'Sales of manufactured goods, services, goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70394, 'ENG-BASE', 'INCOME', '701', '70393', 'Sales of finished products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70395, 'ENG-BASE', 'INCOME', '702', '70393', 'Sales of intermediate products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70396, 'ENG-BASE', 'INCOME', '703', '70393', 'Sales of residual products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70397, 'ENG-BASE', 'INCOME', '704', '70393', 'Works', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70398, 'ENG-BASE', 'INCOME', '705', '70393', 'Studies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70399, 'ENG-BASE', 'INCOME', '706', '70393', 'Services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70400, 'ENG-BASE', 'INCOME', '707', '70393', 'Sale of goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70401, 'ENG-BASE', 'INCOME', '708', '70393', 'Income from ancillary activities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70402, 'ENG-BASE', 'INCOME', '709', '70393',
        'Discounts, rebates and rebates granted by the company', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70403, 'ENG-BASE', 'INCOME', '71', '71507', 'Stored production (or destocking)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70404, 'ENG-BASE', 'INCOME', '713', '70403', 'Change in stocks (in-process production, products)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70405, 'ENG-BASE', 'INCOME', '72', '71507', 'Immobilised production', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70406, 'ENG-BASE', 'INCOME', '721', '70405', 'Intangible assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70407, 'ENG-BASE', 'INCOME', '722', '70405', 'Property, plant and equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70408, 'ENG-BASE', 'INCOME', '74', '71507', 'Operating grants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70409, 'ENG-BASE', 'INCOME', '75', '71507', 'Other management products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70410, 'ENG-BASE', 'INCOME', '751', '70409',
        'Royalties for concessions, patents, licenses, trademarks, processes, software, rights and similar values', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70411, 'ENG-BASE', 'INCOME', '752', '70409',
        'Income from buildings not used for professional purposes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70412, 'ENG-BASE', 'INCOME', '753', '70409',
        'Directors'' fees and remuneration of directors, managers, ...', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70413, 'ENG-BASE', 'INCOME', '754', '70409', 'Perceived refunds of cooperatives (from surplus)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70414, 'ENG-BASE', 'INCOME', '755', '70409', 'Share of profits on transactions made jointly', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70415, 'ENG-BASE', 'INCOME', '758', '70409', 'Miscellaneous current management products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70416, 'ENG-BASE', 'INCOME', '76', '71507', 'Financial products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70417, 'ENG-BASE', 'INCOME', '761', '70416', 'Income from participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70418, 'ENG-BASE', 'INCOME', '762', '70416', 'Income from other financial assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70419, 'ENG-BASE', 'INCOME', '763', '70416', 'Revenue from other receivables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70420, 'ENG-BASE', 'INCOME', '764', '70416', 'Income from marketable securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70421, 'ENG-BASE', 'INCOME', '765', '70416', 'Discounts obtained', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70422, 'ENG-BASE', 'INCOME', '766', '70416', 'Exchange gains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70423, 'ENG-BASE', 'INCOME', '767', '70416', 'Net proceeds on disposals of marketable securities',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70424, 'ENG-BASE', 'INCOME', '768', '70416', 'Other financial income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70425, 'ENG-BASE', 'INCOME', '77', '71507', 'Exceptional products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70426, 'ENG-BASE', 'INCOME', '771', '70425', 'Extraordinary income from management operations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70427, 'ENG-BASE', 'INCOME', '772', '70425',
        'Account available to entities to record, during the financial year, the revenues over previous financial years',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70428, 'ENG-BASE', 'INCOME', '775', '70425', 'Proceeds from disposals of assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70429, 'ENG-BASE', 'INCOME', '777', '70425',
        'Share of investment grants transferred to profit or loss for the year', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70430, 'ENG-BASE', 'INCOME', '778', '70425', 'Other extraordinary income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70431, 'ENG-BASE', 'INCOME', '78', '71507', 'Reversals of depreciation and provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70432, 'ENG-BASE', 'INCOME', '781', '70431',
        'Reversals of depreciation and provisions (to be included in revenue)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70433, 'ENG-BASE', 'INCOME', '786', '70431',
        'Reversals of provisions for risks (to be recorded in financial income)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70434, 'ENG-BASE', 'INCOME', '787', '70431',
        'Reversals of provisions (to be recorded in exceptional income)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70435, 'ENG-BASE', 'INCOME', '79', '71507', 'Transfers of charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70436, 'ENG-BASE', 'INCOME', '791', '70435', 'Transfers of operating expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70437, 'ENG-BASE', 'INCOME', '796', '70435', 'Transfers of financial expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70438, 'ENG-BASE', 'INCOME', '797', '70435', 'Transfers of Exceptional Charges', 1);
