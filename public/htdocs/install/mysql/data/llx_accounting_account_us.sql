-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007      Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2011-2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
-- Copyright (C) 2023      Udo Tamm             <dev@dolibit.de>
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
-- Note (US-BASE): INCOME = REVENUE
-- Note (US-BASE): EXPENSE = EXPENSES
-- Note (US-BASE): CAPITAL = EQUITY
--
--
-- !! Do not place comments at the end of the line, 
-- as this file is parsed during installation and all '--' acronyms are removed.
--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l''install et tous les sigles '--' sont supprimés.
--
-- Note: To replace a string that is '__, 0' into an increasing number, you can use vi with comment
-- :let @a=1 | %s/__, 0/\='__, '.(@a+setreg('a',@a+1))/g

-- Description of charts of accounts US-BASE 
-- Descriptif des plans comptables USA US-BASE
-- ID 1000 - 9999
-- ID 10000 - 10999
-- ADD 1100000 to rowid # Do no remove this comment --


-- Content (TOC)
-- US-BASE
-- US-GAAP-BASIC


-- US-BASE
----------
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1000, 'US-BASE', 'ASSETS', '1', '0', 'Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2000, 'US-BASE', 'LIABILITIES', '2', '0', 'Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3000, 'US-BASE', 'EQUITY', '3', '0', 'Equity', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4000, 'US-BASE', 'INCOME', '4', '0', 'Revenue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5000, 'US-BASE', 'COGS', '5', '0', 'Cost of Goods Sold', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6000, 'US-BASE', 'EXPENSE', '6', '0', 'Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7000, 'US-BASE', 'OTHER_REVENUE', '7', '0', 'Other Revenue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8000, 'US-BASE', 'OTHER_EXPENSES', '8', '0', 'Other Expenses', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1010, 'US-BASE', 'ASSETS', '1010', '1000', 'Cash on Hand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1011, 'US-BASE', 'ASSETS', '1020', '1000', 'Checking Account', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1012, 'US-BASE', 'ASSETS', '1030', '1000', 'Savings Account', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1013, 'US-BASE', 'ASSETS', '1040', '1000', 'Investments and Securities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1014, 'US-BASE', 'ASSETS', '1100', '1000', 'Accounts Receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1015, 'US-BASE', 'ASSETS', '1140', '1000', 'Other Receivables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1016, 'US-BASE', 'ASSETS', '1150', '1000', 'Allowance for Doubtful Accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1017, 'US-BASE', 'ASSETS', '1200', '1000', 'Raw Materials Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1018, 'US-BASE', 'ASSETS', '1205', '1000', 'Supplies Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1019, 'US-BASE', 'ASSETS', '1210', '1000', 'Work in Progress Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1020, 'US-BASE', 'ASSETS', '1215', '1000', 'Finished Goods Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1021, 'US-BASE', 'ASSETS', '1400', '1000', 'Prepaid Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1022, 'US-BASE', 'ASSETS', '1410', '1000', 'Employee Advances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1023, 'US-BASE', 'ASSETS', '1420', '1000', 'Notes Receivable - Current', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1024, 'US-BASE', 'ASSETS', '1430', '1000', 'Prepaid Interest', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1025, 'US-BASE', 'ASSETS', '1470', '1000', 'Other Current Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1026, 'US-BASE', 'ASSETS', '1500', '1000', 'Furniture and Fixtures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1027, 'US-BASE', 'ASSETS', '1510', '1000', 'Equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1028, 'US-BASE', 'ASSETS', '1520', '1000', 'Vehicles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1029, 'US-BASE', 'ASSETS', '1530', '1000', 'Other Depreciable Property', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1030, 'US-BASE', 'ASSETS', '1550', '1000', 'Buildings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1031, 'US-BASE', 'ASSETS', '1560', '1000', 'Building Improvements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1032, 'US-BASE', 'ASSETS', '1690', '1000', 'Land', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1033, 'US-BASE', 'ASSETS', '1700', '1000', 'Accumulated Depreciation, Furniture and Fixtures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1034, 'US-BASE', 'ASSETS', '1710', '1000', 'Accumulated Depreciation, Equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1035, 'US-BASE', 'ASSETS', '1720', '1000', 'Accumulated Depreciation, Vehicles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1036, 'US-BASE', 'ASSETS', '1730', '1000', 'Accumulated Depreciation, Buildings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1037, 'US-BASE', 'ASSETS', '1740', '1000', 'Accumulated Depreciation, Building Improvements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1038, 'US-BASE', 'ASSETS', '1750', '1000', 'Accumulated Depreciation, Other', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1039, 'US-BASE', 'ASSETS', '1900', '1000', 'Deposits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1040, 'US-BASE', 'ASSETS', '1910', '1000', 'Accumulated Amortization', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1041, 'US-BASE', 'ASSETS', '1920', '1000', 'Notes Receivable - Non-current', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1042, 'US-BASE', 'ASSETS', '1990', '1000', 'Other Non-current Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1043, 'US-BASE', 'LIABILITIES', '2100', '2000', 'Accounts Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1044, 'US-BASE', 'LIABILITIES', '2300', '2000', 'Accrued Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1045, 'US-BASE', 'LIABILITIES', '2310', '2000', 'Sales Tax Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1046, 'US-BASE', 'LIABILITIES', '2320', '2000', 'Wages Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1047, 'US-BASE', 'LIABILITIES', '2330', '2000', '401-K Deductions Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1048, 'US-BASE', 'LIABILITIES', '2335', '2000', 'Health Insurance Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1049, 'US-BASE', 'LIABILITIES', '2340', '2000', 'Federal Payroll Taxes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1050, 'US-BASE', 'LIABILITIES', '2350', '2000', 'Federal Unemployment Tax Act - Tax Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1051, 'US-BASE', 'LIABILITIES', '2360', '2000', 'State Payroll Taxes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1052, 'US-BASE', 'LIABILITIES', '2370', '2000', 'State Unemployment Tax Act - Tax Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1053, 'US-BASE', 'LIABILITIES', '2380', '2000', 'Local Payroll Taxes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1054, 'US-BASE', 'LIABILITIES', '2390', '2000', 'Income Taxes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1055, 'US-BASE', 'LIABILITIES', '2400', '2000', 'Other Taxes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1056, 'US-BASE', 'LIABILITIES', '2410', '2000', 'Employee Benefits Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1057, 'US-BASE', 'LIABILITIES', '2420', '2000', 'Current Portion of Long-term Debt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1058, 'US-BASE', 'LIABILITIES', '2440', '2000', 'Deposits from Customers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1059, 'US-BASE', 'LIABILITIES', '2480', '2000', 'Other Current Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1060, 'US-BASE', 'LIABILITIES', '2700', '2000', 'Notes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1061, 'US-BASE', 'LIABILITIES', '2702', '2000', 'Land Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1062, 'US-BASE', 'LIABILITIES', '2704', '2000', 'Equipment Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1063, 'US-BASE', 'LIABILITIES', '2706', '2000', 'Vehicles Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1064, 'US-BASE', 'LIABILITIES', '2708', '2000', 'Bank Loans Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1065, 'US-BASE', 'LIABILITIES', '2710', '2000', 'Deferred Revenue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1066, 'US-BASE', 'LIABILITIES', '2740', '2000', 'Other Long-term Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1067, 'US-BASE', 'CAPITAL', '3010', '3000', 'Stated Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1068, 'US-BASE', 'CAPITAL', '3020', '3000', 'Capital Surplus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1069, 'US-BASE', 'CAPITAL', '3030', '3000', 'Retained Earnings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1070, 'US-BASE', 'INCOME', '4010', '4000', 'Product Sales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1071, 'US-BASE', 'INCOME', '4060', '4000', 'Reimbursible Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1072, 'US-BASE', 'INCOME', '4061', '4000', 'Reimbursible Expenses - Meals and Entertainment ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1073, 'US-BASE', 'INCOME', '4540', '4000', 'Finance Charge Income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1074, 'US-BASE', 'INCOME', '4550', '4000', 'Shipping Charges Reimbursed', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1075, 'US-BASE', 'INCOME', '4800', '4000', 'Sales Returns and Allowances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1076, 'US-BASE', 'INCOME', '4900', '4000', 'Sales Discounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1077, 'US-BASE', 'COGS', '5010', '5000', 'Product Cost', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1078, 'US-BASE', 'COGS', '5050', '5000', 'Raw Material Purchases', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1079, 'US-BASE', 'COGS', '5100', '5000', 'Direct Labor Costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1080, 'US-BASE', 'COGS', '5150', '5000', 'Indirect Labor Costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1081, 'US-BASE', 'COGS', '5200', '5000', 'Heat and Power', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1082, 'US-BASE', 'COGS', '5250', '5000', 'Commissions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1083, 'US-BASE', 'COGS', '5300', '5000', 'Miscellaneous Factory Costs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1084, 'US-BASE', 'COGS', '5700', '5000', 'Cost of Goods Sold, Salaries and Wages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1085, 'US-BASE', 'COGS', '5730', '5000', 'Cost of Goods Sold, Contract Labor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1086, 'US-BASE', 'COGS', '5750', '5000', 'Cost of Goods Sold, Freight', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1087, 'US-BASE', 'COGS', '5800', '5000', 'Cost of Goods Sold, Other', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1088, 'US-BASE', 'COGS', '5850', '5000', 'Inventory Adjustments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1089, 'US-BASE', 'COGS', '5900', '5000', 'Purchase Returns and Allowances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1090, 'US-BASE', 'COGS', '5950', '5000', 'Purchase Discounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1091, 'US-BASE', 'EXPENSE', '6010', '6000', 'Default Purchase Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1092, 'US-BASE', 'EXPENSE', '6020', '6000', 'Advertising Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1093, 'US-BASE', 'EXPENSE', '6050', '6000', 'Amortization Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1094, 'US-BASE', 'EXPENSE', '6100', '6000', 'Auto EXPENSE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1095, 'US-BASE', 'EXPENSE', '6150', '6000', 'Bad Debt Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1096, 'US-BASE', 'EXPENSE', '6200', '6000', 'Bank Fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1097, 'US-BASE', 'EXPENSE', '6250', '6000', 'Cash Over and Short', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1098, 'US-BASE', 'EXPENSE', '6300', '6000', 'Charitable Contributions Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1099, 'US-BASE', 'EXPENSE', '6350', '6000', 'Commissions and Fees Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1100, 'US-BASE', 'EXPENSE', '6450', '6000', 'Dues and Subscriptions Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1101, 'US-BASE', 'EXPENSE', '6500', '6000', 'Employee Benefit Expense, Health Insurance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1102, 'US-BASE', 'EXPENSE', '6510', '6000', 'Employee Benefit Expense, Pension Plans', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1103, 'US-BASE', 'EXPENSE', '6520', '6000', 'Employee Benefit Expense, Profit Sharing Plan', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1104, 'US-BASE', 'EXPENSE', '6530', '6000', 'Employee Benefit Expense, Other', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1105, 'US-BASE', 'EXPENSE', '6550', '6000', 'Freight Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1106, 'US-BASE', 'EXPENSE', '6600', '6000', 'Gifts Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1107, 'US-BASE', 'EXPENSE', '6650', '6000', 'Income Tax Expense, Federal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1108, 'US-BASE', 'EXPENSE', '6660', '6000', 'Income Tax Expense, State', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1109, 'US-BASE', 'EXPENSE', '6670', '6000', 'Income Tax Expense, Local', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1110, 'US-BASE', 'EXPENSE', '6700', '6000', 'Insurance Expense, Product Liability', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1111, 'US-BASE', 'EXPENSE', '6710', '6000', 'Insurance Expense, Vehicle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1112, 'US-BASE', 'EXPENSE', '6800', '6000', 'Laundry and Dry Cleaning Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1113, 'US-BASE', 'EXPENSE', '6850', '6000', 'Legal and Professional Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1114, 'US-BASE', 'EXPENSE', '6900', '6000', 'Licenses Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1115, 'US-BASE', 'EXPENSE', '6950', '6000', 'Loss on Non-sufficient Funds Checks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1116, 'US-BASE', 'OTHER_REVENUE', '7010', '7000', 'Interest Income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1117, 'US-BASE', 'OTHER_REVENUE', '7030', '7000', 'Other Income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1118, 'US-BASE', 'OTHER_EXPENSES', '8010', '8000', 'Depreciation Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1119, 'US-BASE', 'OTHER_EXPENSES', '8020', '8000', 'Interest Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1120, 'US-BASE', 'OTHER_EXPENSES', '8030', '8000', 'Maintenance Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1121, 'US-BASE', 'OTHER_EXPENSES', '8050', '8000', 'Meals and Entertainment Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1122, 'US-BASE', 'OTHER_EXPENSES', '8100', '8000', 'Office Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1123, 'US-BASE', 'OTHER_EXPENSES', '8200', '8000', 'Payroll Tax Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1124, 'US-BASE', 'OTHER_EXPENSES', '8250', '8000', 'Penalties and Fines Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1125, 'US-BASE', 'OTHER_EXPENSES', '8300', '8000', 'Other Taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1126, 'US-BASE', 'OTHER_EXPENSES', '8350', '8000', 'Postage Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1127, 'US-BASE', 'OTHER_EXPENSES', '8400', '8000', 'Rent or Lease Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1128, 'US-BASE', 'OTHER_EXPENSES', '8450', '8000', 'Repair and Maintenance Expense, Office', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1129, 'US-BASE', 'OTHER_EXPENSES', '8460', '8000', 'Repair and Maintenance Expense, Vehicle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1130, 'US-BASE', 'OTHER_EXPENSES', '8550', '8000', 'Supplies Expense, Office', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1131, 'US-BASE', 'OTHER_EXPENSES', '8600', '8000', 'Telephone Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1132, 'US-BASE', 'OTHER_EXPENSES', '8620', '8000', 'Training Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1133, 'US-BASE', 'OTHER_EXPENSES', '8650', '8000', 'Travel Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1134, 'US-BASE', 'OTHER_EXPENSES', '8700', '8000', 'Salaries Expense, Officers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1135, 'US-BASE', 'OTHER_EXPENSES', '8750', '8000', 'Wages Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1136, 'US-BASE', 'OTHER_EXPENSES', '8800', '8000', 'Utilities Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1137, 'US-BASE', 'OTHER_EXPENSES', '8900', '8000', 'Gain/Loss on Sale of Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1138, 'US-BASE', 'OTHER_EXPENSES', '8950', '8000', 'Other Expense', 1);


-- US-GAAP-Basic
----------------
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10000, 'US-GAAP-BASIC', 'ASSETS', '1', '0', 'Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10001, 'US-GAAP-BASIC', 'ASSETS', '11', '10000', 'Cash And Financial Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10002, 'US-GAAP-BASIC', 'ASSETS', '111', '10001', 'Cash And Cash Equivalents', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10003, 'US-GAAP-BASIC', 'ASSETS', '112', '10001', 'Financial Assets (Investments)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10004, 'US-GAAP-BASIC', 'ASSETS', '113', '10001', 'Restricted Cash And Financial Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10005, 'US-GAAP-BASIC', 'ASSETS', '114', '10001', 'Additional Financial Assets And Investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10006, 'US-GAAP-BASIC', 'ASSETS', '12', '10000', 'Receivables And Contracts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10007, 'US-GAAP-BASIC', 'ASSETS', '121', '10006', 'Accounts, Notes And Loans Receivable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10008, 'US-GAAP-BASIC', 'ASSETS', '122', '10006', 'Contracts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10009, 'US-GAAP-BASIC', 'ASSETS', '123', '10006', 'Nontrade And Other Receivables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10010, 'US-GAAP-BASIC', 'ASSETS', '13', '10000', 'Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10011, 'US-GAAP-BASIC', 'ASSETS', '131', '10010', 'Merchandise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10012, 'US-GAAP-BASIC', 'ASSETS', '132', '10010', 'Raw Material, Parts And Supplies', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10013, 'US-GAAP-BASIC', 'ASSETS', '133', '10010', 'Work In Process', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10014, 'US-GAAP-BASIC', 'ASSETS', '134', '10010', 'Finished Goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10015, 'US-GAAP-BASIC', 'ASSETS', '135', '10010', 'Other Inventory', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10016, 'US-GAAP-BASIC', 'ASSETS', '14', '10000', 'Accruals And Additional Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10017, 'US-GAAP-BASIC', 'ASSETS', '141', '10016', 'Prepaid Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10018, 'US-GAAP-BASIC', 'ASSETS', '142', '10016', 'Accrued Income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10019, 'US-GAAP-BASIC', 'ASSETS', '143', '10016', 'Additional Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10020, 'US-GAAP-BASIC', 'ASSETS', '15', '10000', 'Property, Plant And Equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10021, 'US-GAAP-BASIC', 'ASSETS', '151', '10020', 'Land And Land Improvements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10022, 'US-GAAP-BASIC', 'ASSETS', '152', '10020', 'Buildings, Structures And Improvements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10023, 'US-GAAP-BASIC', 'ASSETS', '153', '10020', 'Machinery And Equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10024, 'US-GAAP-BASIC', 'ASSETS', '154', '10020', 'Furniture And Fixtures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10025, 'US-GAAP-BASIC', 'ASSETS', '155', '10020', 'Additional Property, Plant And Equipment', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10026, 'US-GAAP-BASIC', 'ASSETS', '156', '10020', 'Construction In Progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10027, 'US-GAAP-BASIC', 'ASSETS', '16', '10000', 'Intangible Assets (Excluding Goodwill)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10028, 'US-GAAP-BASIC', 'ASSETS', '161', '10027', 'Intellectual Property', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10029, 'US-GAAP-BASIC', 'ASSETS', '162', '10027', 'Computer Software', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10030, 'US-GAAP-BASIC', 'ASSETS', '163', '10027', 'Trade And Distribution Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10031, 'US-GAAP-BASIC', 'ASSETS', '164', '10027', 'Contracts And Rights', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10032, 'US-GAAP-BASIC', 'ASSETS', '165', '10027', 'Right To Use Assets (Classified By Type)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10033, 'US-GAAP-BASIC', 'ASSETS', '166', '10027', 'Other Intangible Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10034, 'US-GAAP-BASIC', 'ASSETS', '167', '10027', 'Acquisition In Progress', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10035, 'US-GAAP-BASIC', 'ASSETS', '17', '10000', 'Goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10036, 'US-GAAP-BASIC', 'LIABILITIES', '2', '0', 'Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10037, 'US-GAAP-BASIC', 'LIABILITIES', '21', '10036', 'Payables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10038, 'US-GAAP-BASIC', 'LIABILITIES', '211', '10037', 'Trade Payables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10039, 'US-GAAP-BASIC', 'LIABILITIES', '212', '10037', 'Dividends Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10040, 'US-GAAP-BASIC', 'LIABILITIES', '213', '10037', 'Interest Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10041, 'US-GAAP-BASIC', 'LIABILITIES', '214', '10037', 'Other Payables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10042, 'US-GAAP-BASIC', 'LIABILITIES', '22', '10036', 'Accruals And Other Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10043, 'US-GAAP-BASIC', 'LIABILITIES', '221', '10042', 'Accrued Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10044, 'US-GAAP-BASIC', 'LIABILITIES', '222', '10042', 'Deferred Income (Unearned Revenue) ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10045, 'US-GAAP-BASIC', 'LIABILITIES', '223', '10042', 'Accrued Taxes (Other Than Payroll)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10046, 'US-GAAP-BASIC', 'LIABILITIES', '224', '10042', 'Other Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10047, 'US-GAAP-BASIC', 'LIABILITIES', '23', '10036', 'Financial Labilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10048, 'US-GAAP-BASIC', 'LIABILITIES', '231', '10047', 'Notes Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10049, 'US-GAAP-BASIC', 'LIABILITIES', '232', '10047', 'Loans Payable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10050, 'US-GAAP-BASIC', 'LIABILITIES', '233', '10047', 'Bonds (Debentures)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10051, 'US-GAAP-BASIC', 'LIABILITIES', '234', '10047', 'Other Debts And Borrowings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10052, 'US-GAAP-BASIC', 'LIABILITIES', '235', '10047', 'Lease Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10053, 'US-GAAP-BASIC', 'LIABILITIES', '236', '10047', 'Derivative Financial Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10054, 'US-GAAP-BASIC', 'LIABILITIES', '24', '10036', 'Provisions (Contingencies)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10055, 'US-GAAP-BASIC', 'LIABILITIES', '241', '10054', 'Customer Related Provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10056, 'US-GAAP-BASIC', 'LIABILITIES', '242', '10054', 'Ligation And Regulatory Provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10057, 'US-GAAP-BASIC', 'LIABILITIES', '243', '10054', 'Additional Provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10058, 'US-GAAP-BASIC', 'EQUITY', '3', '0', 'Equity', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10059, 'US-GAAP-BASIC', 'EQUITY', '31', '10058', 'Owners Equity (Attributable To Owners Of Parent)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10060, 'US-GAAP-BASIC', 'EQUITY', '311', '10059', 'Equity At Par (Issued Capital)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10061, 'US-GAAP-BASIC', 'EQUITY', '312', '10059', 'Additional Paid-In Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10062, 'US-GAAP-BASIC', 'EQUITY', '32', '10058', 'Retained Earnings', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10063, 'US-GAAP-BASIC', 'EQUITY', '321', '10062', 'Appropriated', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10064, 'US-GAAP-BASIC', 'EQUITY', '322', '10062', 'Unappropriated', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10065, 'US-GAAP-BASIC', 'EQUITY', '323', '10062', 'Deficit ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10066, 'US-GAAP-BASIC', 'EQUITY', '324', '10062', 'In Suspense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10067, 'US-GAAP-BASIC', 'EQUITY', '33', '10058', 'Accumulated OCI', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10068, 'US-GAAP-BASIC', 'EQUITY', '331', '10067', 'Exchange Differences On Translation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10069, 'US-GAAP-BASIC', 'EQUITY', '332', '10067', 'Remeasurements Cash Flow Hedges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10070, 'US-GAAP-BASIC', 'EQUITY', '333', '10067',
        'Remeasurements Available-For-Sale Financial Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10071, 'US-GAAP-BASIC', 'EQUITY', '334', '10067', 'Remeasurement Of Defined Benefit Plans', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10072, 'US-GAAP-BASIC', 'EQUITY', '34', '10058', 'Other Equity Items', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10073, 'US-GAAP-BASIC', 'EQUITY', '341', '10072', 'ESOP Related Items', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10074, 'US-GAAP-BASIC', 'EQUITY', '342', '10072', 'Subscribed Stock Receivables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10075, 'US-GAAP-BASIC', 'EQUITY', '343', '10072', 'Treasury Stock', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10076, 'US-GAAP-BASIC', 'EQUITY', '344', '10072', 'Miscellaneous Equity', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10077, 'US-GAAP-BASIC', 'EQUITY', '35', '10058', 'Non-controlling (Minority) Interest', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10078, 'US-GAAP-BASIC', 'REVENUE', '4', '0', 'Revenue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10079, 'US-GAAP-BASIC', 'REVENUE', '41', '10078', 'Recognized Point Of Time', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10080, 'US-GAAP-BASIC', 'REVENUE', '411', '10079', 'Goods', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10081, 'US-GAAP-BASIC', 'REVENUE', '412', '10079', 'Services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10082, 'US-GAAP-BASIC', 'REVENUE', '42', '10078', 'Recognized Over Time', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10083, 'US-GAAP-BASIC', 'REVENUE', '421', '10082', 'Products', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10084, 'US-GAAP-BASIC', 'REVENUE', '422', '10082', 'Services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10085, 'US-GAAP-BASIC', 'REVENUE', '43', '10078', 'Adjustments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10086, 'US-GAAP-BASIC', 'REVENUE', '431', '10085', 'Variable Consideration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10087, 'US-GAAP-BASIC', 'REVENUE', '432', '10085', 'Consideration Paid (Payable) To Customers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10088, 'US-GAAP-BASIC', 'REVENUE', '433', '10085', 'Other Adjustments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10089, 'US-GAAP-BASIC', 'EXPENSES', '5', '0', 'Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10090, 'US-GAAP-BASIC', 'EXPENSES', '51', '10089', 'Expenses Classified By Nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10091, 'US-GAAP-BASIC', 'EXPENSES', '511', '10090', 'Material And Merchandise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10092, 'US-GAAP-BASIC', 'EXPENSES', '512', '10090', 'Employee Benefits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10093, 'US-GAAP-BASIC', 'EXPENSES', '513', '10090', 'Services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10094, 'US-GAAP-BASIC', 'EXPENSES', '514', '10090',
        'Rent, Depreciation, Amortization And Depletion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10095, 'US-GAAP-BASIC', 'EXPENSES', '52', '10089', 'Expenses Classified By Function', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10096, 'US-GAAP-BASIC', 'EXPENSES', '521', '10095', 'Cost Of Sales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10097, 'US-GAAP-BASIC', 'EXPENSES', '522', '10095', 'Selling, General And Administrative ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10098, 'US-GAAP-BASIC', 'EXPENSES', '523', '10095', 'Provision For Doubtful Accounts (US GAAP)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10099, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '6', '0',
        'Other (Non-Operating) Income And Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10100, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '61', '10099', 'Other Revenue And Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10101, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '611', '10100', 'Other Revenue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10102, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '612', '10100', 'Other Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10103, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '62', '10099', 'Gains And Losses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10104, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '621', '10103',
        'Foreign Currency Transaction Gain (Loss)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10105, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '622', '10103', 'Gain (Loss) On Investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10106, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '623', '10103', 'Gain (Loss) On Derivatives', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10107, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '624', '10103',
        'Gain (Loss) On Disposal Of Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10108, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '625', '10103', 'Debt Related Gain (Loss)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10109, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '626', '10103', 'Impairment Loss', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10110, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '628', '10103', 'Other Gains And (Losses)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10111, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '63', '10099',
        'Taxes (Other Than Income And Payroll) And Fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10112, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '631', '10111', 'Real Estate Taxes And Insurance',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10113, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '632', '10111', 'Highway (Road) Taxes And Tolls',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10114, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '633', '10111', 'Direct Tax And License Fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10115, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '634', '10111', 'Excise And Sales Taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10116, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '635', '10111',
        'Customs Fees And Duties (Not Classified As Sales Or Excise)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10117, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '636', '10111', 'Non-Deductible VAT (GST)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10118, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '637', '10111', 'General Insurance Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10119, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '638', '10111',
        'Administrative Fees (Revenue Stamps)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10120, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '639', '10111', 'Fines And Penalties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10121, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '6310', '10111', 'Miscellaneous Taxes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10122, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '6311', '10111', 'Other Taxes And Fees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10123, 'US-GAAP-BASIC', 'OTHER_INCOME_EXPENSES', '64', '10099', 'Income Tax Expense (Benefit)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10124, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '7', '0',
        'Intercompany And Related Party Accounts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10125, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '71', '10124',
        'Intercompany And Related Party Assets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10126, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '711', '10125',
        'Intercompany Balances (Eliminated In Consolidation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10127, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '712', '10125',
        'Related Party Balances (Reported Or Disclosed)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10128, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '713', '10125',
        'Intercompany Investments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10129, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '72', '10124',
        'Intercompany And Related Party Liabilities', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10130, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '721', '10129',
        'Intercompany Balances (Eliminated In Consolidation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10131, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '722', '10129',
        'Related Party Balances (Reported Or Disclosed)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10132, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '73', '10124',
        'Intercompany And Related Party Income And Expense', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10133, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '731', '10132',
        'Intercompany And Related Party Income', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10134, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '732', '10132',
        'Intercompany And Related Party Expenses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10135, 'US-GAAP-BASIC', 'INTERCOMPANY_RELPARTY_ACCOUNTS', '733', '10132',
        'Income (Loss) From Equity Method Investments', 1);
