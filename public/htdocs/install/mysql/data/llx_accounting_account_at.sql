-- Copyright (C) 2020 Norbert Penel   <support@oscss-shop.fr>
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
-- Do not place a comment at the end of the line, as this file is parsed 
-- during installation and all '--' symbols are removed.
--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Description of Austrian standard charts of accounts
-- Descriptif des plans comptables autrichiens standard
-- ADD 4100000 to rowid # Do no remove this comment --


INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1, 'AT-BASE', 'GROUP0', '110', '0', 'Patentrechte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2, 'AT-BASE', 'GROUP0', '120', '0', 'Software', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3, 'AT-BASE', 'GROUP0', '121', '0', 'ERP System', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4, 'AT-BASE', 'GROUP0', '122', '0', 'Homepage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5, 'AT-BASE', 'GROUP0', '125', '0', 'Software Fremdentwicklung, noch nicht aktivieren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6, 'AT-BASE', 'GROUP0', '160', '0', 'Umgründungsmehrwert', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7, 'AT-BASE', 'GROUP0', '250', '0', 'Mieterinvestitionen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8, 'AT-BASE', 'GROUP0', '400', '0', 'Maschinen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9, 'AT-BASE', 'GROUP0', '600', '0', 'Betriebs u. Geschäftsausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10, 'AT-BASE', 'GROUP0', '601', '0', 'Ausstellungsstücke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11, 'AT-BASE', 'GROUP0', '602', '0', 'Leihstellungsstücke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12, 'AT-BASE', 'GROUP0', '603', '0', 'Getriebeprüfstand hinten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13, 'AT-BASE', 'GROUP0', '604', '0', 'Wuchtstand_links_AQ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 14, 'AT-BASE', 'GROUP0', '605', '0', 'Messlabor(Messraum)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15, 'AT-BASE', 'GROUP0', '606', '0', 'PAK-System', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16, 'AT-BASE', 'GROUP0', '607', '0', 'Server', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 17, 'AT-BASE', 'GROUP0', '608', '0', 'EDV-Ausstattung (Hardware)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 18, 'AT-BASE', 'GROUP0', '609', '0', 'Werkstattausstattung (Werkzeug)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 19, 'AT-BASE', 'GROUP0', '610', '0', 'Wuchtprüfstand neu_noch nicht in Betrieb genommen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 20, 'AT-BASE', 'GROUP0', '611', '0', 'Messequipment/Ausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21, 'AT-BASE', 'GROUP0', '630', '0', 'PKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22, 'AT-BASE', 'GROUP0', '640', '0', 'LKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 23, 'AT-BASE', 'GROUP0', '680', '0', 'GWG-Geschäftsausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 24, 'AT-BASE', 'GROUP0', '710', '0', 'Anlagen in Bau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 25, 'AT-BASE', 'GROUP1', '1100', '0', 'Rohstoffe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 26, 'AT-BASE', 'GROUP1', '1200', '0', 'Bezogenen Teile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 27, 'AT-BASE', 'GROUP1', '1300', '0', 'Hilfsstoffe und Betriebsstoffe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 28, 'AT-BASE', 'GROUP1', '1400', '0', 'fertige Erzeugnisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 29, 'AT-BASE', 'GROUP1', '1500', '0', 'unfertige Erzeugnisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30, 'AT-BASE', 'GROUP1', '1600', '0', 'Waren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31, 'AT-BASE', 'GROUP1', '1700', '0', 'Noch nicht abrechenbare Leistungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 32, 'AT-BASE', 'GROUP1', '1701', '0', 'Bestandsveränderung laufend', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 33, 'AT-BASE', 'GROUP1', '1800', '0', 'Vorrat Verpackungsmaterial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 34, 'AT-BASE', 'GROUP1', '1810', '0', 'Vorrat Werbematerial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 35, 'AT-BASE', 'GROUP2', '2000', '0', 'Lieferforderungen Inland I', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 36, 'AT-BASE', 'GROUP2', '2080', '0', 'Einzelwertb. Ford. Inland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 37, 'AT-BASE', 'GROUP2', '2292', '0', 'geleistete Anzahlungen (20%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 38, 'AT-BASE', 'GROUP2', '2293', '0', 'gel. Anzahlungen i.g.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 39, 'AT-BASE', 'GROUP2', '2301', '0', 'Forderung Forschungsprämie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 40, 'AT-BASE', 'GROUP2', '2302', '0', 'Forderungen gelieferte (noch nicht fakturierte Waren)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41, 'AT-BASE', 'GROUP2', '2303', '0', 'Vorauszahlung Leasing Server', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 42, 'AT-BASE', 'GROUP2', '2306', '0', 'Kaution Pfauengarten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 43, 'AT-BASE', 'GROUP2', '2307', '0', 'Kaution Werkstatt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 44, 'AT-BASE', 'GROUP2', '2308', '0', 'Kaution Parkplatz PKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 45, 'AT-BASE', 'GROUP2', '2309', '0', 'Kaution Werkstatt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 46, 'AT-BASE', 'GROUP2', '2310', '0', 'Kaution Studentenwohnheim', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 47, 'AT-BASE', 'GROUP2', '2311', '0', 'Kaution China', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 48, 'AT-BASE', 'GROUP2', '2312', '0', 'Vorauszahlung Xerox', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 49, 'AT-BASE', 'GROUP2', '2313', '0', 'Verrechnung Bildungsscheck', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 50, 'AT-BASE', 'GROUP2', '2315', '0', 'Aktivierung Körperschaftsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51, 'AT-BASE', 'GROUP2', '2500', '0', 'Vorsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52, 'AT-BASE', 'GROUP2', '2501', '0', 'Vorsteuer aus i. g. Erwerb', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 53, 'AT-BASE', 'GROUP2', '2502', '0', 'Vorsteuer reverse charge syst.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 54, 'AT-BASE', 'GROUP2', '2503', '0', 'Vorsteuer Reverse Charge § 19/1d', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 55, 'AT-BASE', 'GROUP2', '2508', '0', 'Vorsteuer sonstige Leistungen EU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 56, 'AT-BASE', 'GROUP2', '2509', '0', 'EUSt Forderung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 57, 'AT-BASE', 'GROUP2', '2510', '0', 'Einfuhrumsatzsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 58, 'AT-BASE', 'GROUP2', '2531', '0', 'Vorsteuer Frankreich', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 59, 'AT-BASE', 'GROUP2', '2532', '0', 'Vorsteuer Niederlande', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 60, 'AT-BASE', 'GROUP2', '2533', '0', 'Vorsteuer GB', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61, 'AT-BASE', 'GROUP2', '2534', '0', 'Vorsteuer Belgien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62, 'AT-BASE', 'GROUP2', '2535', '0', 'Vorsteuer GB', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 63, 'AT-BASE', 'GROUP2', '2901', '0', 'Leasingvorauszahlung Vito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 64, 'AT-BASE', 'GROUP3', '3020', '0', 'Rückstellung für Körperschaftsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 65, 'AT-BASE', 'GROUP3', '3060', '0', 'Rst. für Beratungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 66, 'AT-BASE', 'GROUP3', '3064', '0', 'Rst. für Sonderzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 67, 'AT-BASE', 'GROUP3', '3072', '0', 'Rst. für nicht konsum. Urlaube', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 68, 'AT-BASE', 'GROUP3', '3214', '0', 'Raika 40-00.800.185', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 69, 'AT-BASE', 'GROUP3', '3286', '0', 'Darlehen Dipl. Ing. REICH GMBH', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70, 'AT-BASE', 'GROUP3', '3287', '0', 'Darlehen Dr.Höfler', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71, 'AT-BASE', 'GROUP3', '3288', '0', 'Darlehen DI Mayrhofer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 72, 'AT-BASE', 'GROUP3', '3289', '0', 'Darlehen AWS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 73, 'AT-BASE', 'GROUP3', '3292', '0', 'Anzahlungen von Kunden 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 74, 'AT-BASE', 'GROUP3', '3294', '0', 'Anzahlungen von Kunden Drittland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 75, 'AT-BASE', 'GROUP3', '3300', '0', 'Lieferverbindlichkeiten I', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 76, 'AT-BASE', 'GROUP3', '3481', '0', 'Verrechnungskto DI Mayrhofer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 77, 'AT-BASE', 'GROUP3', '3500', '0', 'Umsatzsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 78, 'AT-BASE', 'GROUP3', '3501', '0', 'Umsatzsteuer aus i. g. Erwerb', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 79, 'AT-BASE', 'GROUP3', '3502', '0', 'USt § 19/Art 19 (reverse Charge)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 80, 'AT-BASE', 'GROUP3', '3503', '0', 'Umsatzsteuer Reverse Charge § 19/1d', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81, 'AT-BASE', 'GROUP3', '3508', '0', 'Umsatzsteuer sonstige Leistung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82, 'AT-BASE', 'GROUP3', '3531', '0', 'FA-Zahllast Dezember', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 83, 'AT-BASE', 'GROUP3', '3533', '0', 'Umsatzsteuer 2012', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 84, 'AT-BASE', 'GROUP3', '3535', '0', 'Umsatzsteuer 2013', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 85, 'AT-BASE', 'GROUP3', '3536', '0', 'Umsatzsteuer 2014', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 86, 'AT-BASE', 'GROUP3', '3537', '0', 'Umsatzsteuer 2015', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 87, 'AT-BASE', 'GROUP3', '3632', '0', 'Verrechnungskonto EUSt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 88, 'AT-BASE', 'GROUP3', '3892', '0', 'Verbindlichkeiten Anzahlungsrechn.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 89, 'AT-BASE', 'GROUP3', '3898', '0', 'Abgrenzung Sonderzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 90, 'AT-BASE', 'GROUP4', '4000', '0', 'Erlöse Lieferungen 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 91, 'AT-BASE', 'GROUP4', '4001', '0', 'Erlöse i.g. Lieferung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 92, 'AT-BASE', 'GROUP4', '4002', '0', 'Erlöse Dienstleistungen EU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 93, 'AT-BASE', 'GROUP4', '4003', '0', 'Erlöse Dienstleistungen 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 94, 'AT-BASE', 'GROUP4', '4004', '0', 'Erlöse Software 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 95, 'AT-BASE', 'GROUP4', '4005', '0', 'Erlöse Software EU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 96, 'AT-BASE', 'GROUP4', '4006', '0', 'Evidenz Kfd. Reverse Charge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 97, 'AT-BASE', 'GROUP4', '4050', '0', 'Erlöse 0 % Drittland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 98, 'AT-BASE', 'GROUP4', '4051', '0', 'Erlöse Dienstleistungen Drittland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 99, 'AT-BASE', 'GROUP4', '4052', '0', 'Erlöse Software Drittland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 100, 'AT-BASE', 'GROUP4', '4069', '0', 'Erlöse § 19/1d Schrott', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 101, 'AT-BASE', 'GROUP4', '4400', '0', 'Kundenskonto 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 102, 'AT-BASE', 'GROUP4', '4405', '0', 'Kundenskonto 0 % Ausfuhrlieferungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 103, 'AT-BASE', 'GROUP4', '4410', '0', 'Skontoaufwand i.g. Lieferung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 104, 'AT-BASE', 'GROUP4', '4413', '0', 'Kundenskonto sonstige Leistung EU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 105, 'AT-BASE', 'GROUP4', '4420', '0', 'Kundenskonto EU-Land A x %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 106, 'AT-BASE', 'GROUP4', '4450', '0', 'Kundenrabatt 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 107, 'AT-BASE', 'GROUP4', '4500', '0', 'Bestandsveränderungen fertige Erzeugnisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 108, 'AT-BASE', 'GROUP4', '4510', '0', 'Best.Veränd.Halbf.Erzeugnisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 109, 'AT-BASE', 'GROUP4', '4519', '0', 'Bestandsveränderung laufend', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 110, 'AT-BASE', 'GROUP4', '4520', '0', 'Best.Veränd.n.n.abger.Leist.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 111, 'AT-BASE', 'GROUP4', '4530', '0', 'Gelieferte (noch nicht fakturierte Waren)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 112, 'AT-BASE', 'GROUP4', '4580', '0', 'Aktivierte Eigenleistung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 113, 'AT-BASE', 'GROUP4', '4630', '0', 'Erträge aus d.Abgang v.Anlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 114, 'AT-BASE', 'GROUP4', '4801', '0', 'Zuwendungen a.öffentl. Mitteln', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 115, 'AT-BASE', 'GROUP4', '4831', '0', 'sonstige betriebliche Erträge (nicht steuerbar)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 116, 'AT-BASE', 'GROUP4', '4840', '0', 'Sonstige Erlöse 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 117, 'AT-BASE', 'GROUP4', '4850', '0', 'Erl. Aufwandersätze', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 118, 'AT-BASE', 'GROUP4', '4881', '0', 'Versicherungsvergütungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 119, 'AT-BASE', 'GROUP4', '4885', '0', 'Zuschreibungen zum Umlaufvermögen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 120, 'AT-BASE', 'GROUP4', '4950', '0', 'Privatanteil 20 %', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 121, 'AT-BASE', 'GROUP4', '4991', '0', 'Sachbezüge 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 122, 'AT-BASE', 'GROUP5', '5000', '0', 'Handelswareneinsatz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 123, 'AT-BASE', 'GROUP5', '5001', '0', 'Materialeinkauf Fremdfertigung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 124, 'AT-BASE', 'GROUP5', '5002', '0', 'Wareneinkauf Verkauf', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 125, 'AT-BASE', 'GROUP5', '5020', '0', 'Materialeinkauf', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 126, 'AT-BASE', 'GROUP5', '5090', '0', 'Bezugskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 127, 'AT-BASE', 'GROUP5', '5100', '0', 'Verbrauch Rohstoffe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 128, 'AT-BASE', 'GROUP5', '5199', '0', 'Aufwand für TW-AFA Vorräte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 129, 'AT-BASE', 'GROUP5', '5200', '0', 'Verbrauch bezogenen Teile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 130, 'AT-BASE', 'GROUP5', '5300', '0', 'Verbrauch Hilfsstoffe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 131, 'AT-BASE', 'GROUP5', '5400', '0', 'Hilfsstoffverbrauch', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 132, 'AT-BASE', 'GROUP5', '5440', '0', 'Inventurveränderung Fremdbarb. + GK', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 133, 'AT-BASE', 'GROUP5', '5441', '0', 'GWG Fremdbarb. + GK', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 134, 'AT-BASE', 'GROUP5', '5450', '0', 'Verpackungsmaterial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 135, 'AT-BASE', 'GROUP5', '5800', '0', 'Fremdleistungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 136, 'AT-BASE', 'GROUP5', '5880', '0', 'Lieferantenskonti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 137, 'AT-BASE', 'GROUP5', '5900', '0', 'Skontoertrag ig.E. 0% (m.VST)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 138, 'AT-BASE', 'GROUP5', '5920', '0', 'Skontoertrag ig.E. 20% (m.VST)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 139, 'AT-BASE', 'GROUP6', '6000', '0', 'Löhne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 140, 'AT-BASE', 'GROUP6', '6001', '0', 'Rückerstattung AUVA Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 141, 'AT-BASE', 'GROUP6', '6010', '0', 'Lehrlingsentschädigung Arb.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 142, 'AT-BASE', 'GROUP6', '6020', '0', 'Nichtleistungslöhne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 143, 'AT-BASE', 'GROUP6', '6100', '0', 'Leihpersonal Aufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 144, 'AT-BASE', 'GROUP6', '6150', '0', 'Sonderzahlungen Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 145, 'AT-BASE', 'GROUP6', '6200', '0', 'Gehälter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 146, 'AT-BASE', 'GROUP6', '6201', '0', 'Förderung AMS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 147, 'AT-BASE', 'GROUP6', '6202', '0', 'Rückerstattung AUVA Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 148, 'AT-BASE', 'GROUP6', '6210', '0', 'Veränderung Mehrarbeitsvergütung RSt Ang', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 149, 'AT-BASE', 'GROUP6', '6211', '0', 'Veränderung Mehrarbeitsvergütung RSt Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 150, 'AT-BASE', 'GROUP6', '6230', '0', 'Sonderzahlungen Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 151, 'AT-BASE', 'GROUP6', '6231', '0', 'Dotierung RST Sonderzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 152, 'AT-BASE', 'GROUP6', '6255', '0', 'Geschäftsführerbezüge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 153, 'AT-BASE', 'GROUP6', '6256', '0', 'Geschäftsführersachbezüge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 154, 'AT-BASE', 'GROUP6', '6300', '0', 'Sonderzahlung aliquot vorläufig', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 155, 'AT-BASE', 'GROUP6', '6310', '0', 'Dotierung Urlaubsrückstellung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 156, 'AT-BASE', 'GROUP6', '6311', '0', 'Veränderung Urlaubsrückstellung Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 157, 'AT-BASE', 'GROUP6', '6402', '0', 'Betriebliche Vorsorgekassa Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 158, 'AT-BASE', 'GROUP6', '6407', '0', 'Betriebliche Vorsorgekassa Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 159, 'AT-BASE', 'GROUP6', '6416', '0', 'Veränderung Pensionsrückstellung (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 160, 'AT-BASE', 'GROUP6', '6435', '0', 'sonstige Beiträge für die Altersversorgung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 161, 'AT-BASE', 'GROUP6', '6500', '0', 'Gesetzlicher Sozialaufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 162, 'AT-BASE', 'GROUP6', '6600', '0', 'Gesetzlicher Sozialaufwand Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 163, 'AT-BASE', 'GROUP6', '6605', '0', 'Gesetzlicher Sozialaufwand Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 164, 'AT-BASE', 'GROUP6', '6610', '0', 'Dienstgeberbeitrag Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 165, 'AT-BASE', 'GROUP6', '6611', '0', 'Dienstgeberbeitrag Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 166, 'AT-BASE', 'GROUP6', '6620', '0', 'Zuschlag zum DB', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 167, 'AT-BASE', 'GROUP6', '6621', '0', 'Zuschlag zum DB Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 168, 'AT-BASE', 'GROUP6', '6630', '0', 'Ausgleichstaxe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 169, 'AT-BASE', 'GROUP6', '6690', '0', 'Lohnsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 170, 'AT-BASE', 'GROUP6', '6693', '0', 'Kommunalsteuer Arbeiter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 171, 'AT-BASE', 'GROUP6', '6694', '0', 'Kommunalsteuer Angestellte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 172, 'AT-BASE', 'GROUP6', '6700', '0', 'Freiwilliger Sozialaufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 173, 'AT-BASE', 'GROUP6', '6710', '0', 'Arbeitskleidung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 174, 'AT-BASE', 'GROUP6', '6720', '0', 'Fahrspesen Dienstnehmer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 175, 'AT-BASE', 'GROUP6', '6730', '0', 'Weihnachtsgeschenke Arbeitnehmer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 176, 'AT-BASE', 'GROUP6', '6740', '0', 'Betriebsveranstaltungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 177, 'AT-BASE', 'GROUP6', '6750', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 178, 'AT-BASE', 'GROUP6', '6760', '0', 'Vergleichszahlung Dienstnehmer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 179, 'AT-BASE', 'GROUP7', '7030', '0', 'Abschreibung  G W G', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 180, 'AT-BASE', 'GROUP7', '7070', '0', 'Buchwert ausgeschiedener Anlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 181, 'AT-BASE', 'GROUP7', '7080', '0', 'Planmäßige AFA immat.WG.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 182, 'AT-BASE', 'GROUP7', '7081', '0', 'Planmäßige Abschreibung für Sachanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 183, 'AT-BASE', 'GROUP7', '7100', '0', 'Nicht abzugsfähige Vorsteuer (VStK)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 184, 'AT-BASE', 'GROUP7', '7110', '0', 'Gebühren und Abgaben_Zoll', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 185, 'AT-BASE', 'GROUP7', '7111', '0', 'Kammerumlage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 186, 'AT-BASE', 'GROUP7', '7200', '0', 'Instandhaltung Gebäude', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 187, 'AT-BASE', 'GROUP7', '7201', '0', 'Instandhaltung Außenanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 188, 'AT-BASE', 'GROUP7', '7202', '0', 'Instandh. - Maschinen u. Anl.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 189, 'AT-BASE', 'GROUP7', '7204', '0',
        'Instandhaltung und Betriebskosten Betriebs und Geschäftsgebäude', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 190, 'AT-BASE', 'GROUP7', '7205', '0', 'Verbrauchsmaterial Werkstatt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 191, 'AT-BASE', 'GROUP7', '7210', '0', 'Müllentsorgung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 192, 'AT-BASE', 'GROUP7', '7211', '0', 'Entsorgungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 193, 'AT-BASE', 'GROUP7', '7230', '0', 'Reinigungsmaterial (div. Verbrauchsmaterial)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 194, 'AT-BASE', 'GROUP7', '7231', '0', 'Berufsbekleidung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 195, 'AT-BASE', 'GROUP7', '7235', '0', 'Reinigung durch Dritte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 196, 'AT-BASE', 'GROUP7', '7240', '0', 'LKW-Betriebskosten Vito G 437 MB', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 197, 'AT-BASE', 'GROUP7', '7241', '0', 'Leasing Mercedes Vito G 437 MB', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 198, 'AT-BASE', 'GROUP7', '7250', '0', 'KFZ Betriebskosten allgemein', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 199, 'AT-BASE', 'GROUP7', '7251', '0', 'KFZ Leasing allgemein', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 200, 'AT-BASE', 'GROUP7', '7252', '0', 'KFZ Versicherungen allgemein', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 201, 'AT-BASE', 'GROUP7', '7253', '0', 'Wachdienst', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 202, 'AT-BASE', 'GROUP7', '7254', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 203, 'AT-BASE', 'GROUP7', '7255', '0', 'Aufwand Leihwagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 204, 'AT-BASE', 'GROUP7', '7256', '0', 'PKW-Betriebskosten VW Golf G 854 SH Versuchsfahrzeug', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 205, 'AT-BASE', 'GROUP7', '7257', '0', 'Leasing VW Golf G 854 SH', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 206, 'AT-BASE', 'GROUP7', '7258', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 207, 'AT-BASE', 'GROUP7', '7285', '0', 'Strom', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 208, 'AT-BASE', 'GROUP7', '7286', '0', 'Betriebskosten/Beheizung Mietobjekte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 209, 'AT-BASE', 'GROUP7', '7300', '0', 'Transporte durch Dritte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 210, 'AT-BASE', 'GROUP7', '7330', '0', 'Reise und Fahrtspesen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 211, 'AT-BASE', 'GROUP7', '7331', '0', 'Kilometergelder', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 212, 'AT-BASE', 'GROUP7', '7360', '0', 'Reisediäten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 213, 'AT-BASE', 'GROUP7', '7380', '0', 'Telefon', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 214, 'AT-BASE', 'GROUP7', '7381', '0', 'Internet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 215, 'AT-BASE', 'GROUP7', '7382', '0', 'Wartung Homepage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 216, 'AT-BASE', 'GROUP7', '7390', '0', 'Postgebühren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 217, 'AT-BASE', 'GROUP7', '7400', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 218, 'AT-BASE', 'GROUP7', '7401', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 219, 'AT-BASE', 'GROUP7', '7402', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 220, 'AT-BASE', 'GROUP7', '7403', '0', 'Miete Büro Linz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 221, 'AT-BASE', 'GROUP7', '7404', '0', 'Miete Gradnerstraße', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 222, 'AT-BASE', 'GROUP7', '7410', '0', 'Maschinen u. Gerätemieten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 223, 'AT-BASE', 'GROUP7', '7411', '0', 'Wartungskosten BuG Ausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 224, 'AT-BASE', 'GROUP7', '7420', '0', 'Mobilien-Leasing ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 225, 'AT-BASE', 'GROUP7', '7421', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 226, 'AT-BASE', 'GROUP7', '7422', '0', 'Leasing Server', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 227, 'AT-BASE', 'GROUP7', '7423', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 228, 'AT-BASE', 'GROUP7', '7424', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 229, 'AT-BASE', 'GROUP7', '7480', '0', 'Lizenzgebühren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 230, 'AT-BASE', 'GROUP7', '7540', '0', 'Provisionen an Dritte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 231, 'AT-BASE', 'GROUP7', '7600', '0', 'Büromaterial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 232, 'AT-BASE', 'GROUP7', '7601', '0', 'EDV-Material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 233, 'AT-BASE', 'GROUP7', '7610', '0', 'Drucksorten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 234, 'AT-BASE', 'GROUP7', '7620', '0', 'Fachliteratur und Zeitungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 235, 'AT-BASE', 'GROUP7', '7630', '0', 'Gästeunt. u. Zeitschriften', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 236, 'AT-BASE', 'GROUP7', '7650', '0', 'Werbeaufwand/Inserate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 237, 'AT-BASE', 'GROUP7', '7651', '0', 'Anbahnung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 238, 'AT-BASE', 'GROUP7', '7652', '0', 'Aufwand Messen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 239, 'AT-BASE', 'GROUP7', '7653', '0', 'Konto frei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 240, 'AT-BASE', 'GROUP7', '7654', '0', 'Inserate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 241, 'AT-BASE', 'GROUP7', '7670', '0', 'Bewirtungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 242, 'AT-BASE', 'GROUP7', '7690', '0', 'Trinkgelder u. Spenden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 243, 'AT-BASE', 'GROUP7', '7691', '0', 'Spenden an begünstigte Institutionen/Sponsoring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 244, 'AT-BASE', 'GROUP7', '7696', '0', 'Säumnis- und Verspätungszuschläge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 245, 'AT-BASE', 'GROUP7', '7700', '0', 'Betriebsversicherungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 246, 'AT-BASE', 'GROUP7', '7701', '0', 'Transportversicherungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 247, 'AT-BASE', 'GROUP7', '7710', '0', 'Pflichtversich. Unternehmer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 248, 'AT-BASE', 'GROUP7', '7749', '0', 'Aufwand Japan', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 249, 'AT-BASE', 'GROUP7', '7750', '0', 'Steuerberatung (Lohnverrechnung, Buchhaltung)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 250, 'AT-BASE', 'GROUP7', '7751', '0', 'Patentkosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 251, 'AT-BASE', 'GROUP7', '7752', '0', 'Rechtsberatung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 252, 'AT-BASE', 'GROUP7', '7753', '0', 'Unternehmensberatung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 253, 'AT-BASE', 'GROUP7', '7754', '0', 'Aufwand tectos China', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 254, 'AT-BASE', 'GROUP7', '7755', '0', 'Wartung (Betreuung EDV)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 255, 'AT-BASE', 'GROUP7', '7756', '0', 'Lizenzgebühren Abaqus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 256, 'AT-BASE', 'GROUP7', '7757', '0', 'Lizenzgebühren Sonstige', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 257, 'AT-BASE', 'GROUP7', '7758', '0', 'Sonstige Beratungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 258, 'AT-BASE', 'GROUP7', '7759', '0', 'EDV-Beratung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 259, 'AT-BASE', 'GROUP7', '7760', '0', 'Mitgliedsbeiträge/freiwillige Beiträge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 260, 'AT-BASE', 'GROUP7', '7761', '0', 'Prüfung Jahresabschluss', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 261, 'AT-BASE', 'GROUP7', '7770', '0', 'Aus- und Fortbildung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 262, 'AT-BASE', 'GROUP7', '7775', '0', 'Forschung und Entwicklung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 263, 'AT-BASE', 'GROUP7', '7776', '0', 'Messentwicklung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 264, 'AT-BASE', 'GROUP7', '7777', '0', 'Produktentwicklung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 265, 'AT-BASE', 'GROUP7', '7785', '0', 'Freiwillige Verbandsbeiträge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 266, 'AT-BASE', 'GROUP7', '7790', '0', 'Spesen des Geldverkehrs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 267, 'AT-BASE', 'GROUP7', '7791', '0', 'Kursdifferenzen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 268, 'AT-BASE', 'GROUP7', '7800', '0', 'Betriebsbedingte Schadensfälle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 269, 'AT-BASE', 'GROUP7', '7801', '0', 'Ausgaben nicht absetzbar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 270, 'AT-BASE', 'GROUP7', '7802', '0', 'Strafen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 271, 'AT-BASE', 'GROUP7', '7805', '0', 'Forderungsverluste 20', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 272, 'AT-BASE', 'GROUP7', '7806', '0', 'Abschreibungen auf Forderungen (EU)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 273, 'AT-BASE', 'GROUP7', '7807', '0', 'Abschreibungen auf Forderungen (Drittland)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 274, 'AT-BASE', 'GROUP7', '7810', '0', 'Zuweisung an Einzel-WB Forderungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 275, 'AT-BASE', 'GROUP7', '7811', '0',
        'Zuweisung pauschale Wertberichtigungen zu Exportforderungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 276, 'AT-BASE', 'GROUP7', '7812', '0', 'Abschreibungen auf Vorräte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 277, 'AT-BASE', 'GROUP7', '7820', '0', 'Buchwert abgegangener Sachanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 278, 'AT-BASE', 'GROUP7', '7840', '0', 'Gründungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 279, 'AT-BASE', 'GROUP7', '7850', '0', 'Sonstiger Aufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 280, 'AT-BASE', 'GROUP7', '7851', '0', 'Sonstiger Aufwand Gewinnanteil Reich', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 281, 'AT-BASE', 'GROUP7', '7930', '0', 'Aufw. Gewährleistungsverpfl.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 282, 'AT-BASE', 'GROUP7', '7940', '0', 'Aufwand aus Vorperioden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 283, 'AT-BASE', 'GROUP8', '8020', '0', 'Gewinnüberrg. v. Organgesell.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 284, 'AT-BASE', 'GROUP8', '8060', '0', 'Zinserträge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 285, 'AT-BASE', 'GROUP8', '8090', '0', 'Ertr.a.Ant.a.and. Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 286, 'AT-BASE', 'GROUP8', '8100', '0', 'Habenzinsen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 287, 'AT-BASE', 'GROUP8', '8280', '0', 'Zinsen f. Kredite u. Darlehen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 288, 'AT-BASE', 'GROUP8', '8286', '0', 'Kursgewinne/Kursverluste', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 289, 'AT-BASE', 'GROUP8', '8288', '0', 'Zinsen auf Lieferantenkredite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 290, 'AT-BASE', 'GROUP8', '8291', '0', 'Sonst. Zinsen und ähnliche Aufwendungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 291, 'AT-BASE', 'GROUP8', '8500', '0', 'Körperschaftsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 292, 'AT-BASE', 'GROUP8', '8505', '0', 'Kapitalertragsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 293, 'AT-BASE', 'GROUP8', '8510', '0', 'Körperschaftsteuervorauszahl.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 294, 'AT-BASE', 'GROUP8', '8511', '0', 'Dotierung KöSt-Rückstellung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 295, 'AT-BASE', 'GROUP8', '8512', '0', 'Aktivierung Körperschaftsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 296, 'AT-BASE', 'GROUP8', '8513', '0', 'Köst Vorperioden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 297, 'AT-BASE', 'GROUP8', '8520', '0', 'Forschungsprämie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 298, 'AT-BASE', 'GROUP8', '8595', '0', 'Ertrag aus der Aktivierung latenter Steuern', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 299, 'AT-BASE', 'GROUP8', '8610', '0', 'Auflösung sonstiger unversteuerter Rücklagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 300, 'AT-BASE', 'GROUP8', '8700', '0', 'Auflösung gebundener Kapitalrücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 301, 'AT-BASE', 'GROUP8', '8710', '0', 'Auflösung Rücklage für eigene Anteile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 302, 'AT-BASE', 'GROUP8', '8720', '0', 'Auflösung nicht gebundene Kapitalrücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 303, 'AT-BASE', 'GROUP8', '8750', '0', 'Auflösung gesetzliche Rücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 304, 'AT-BASE', 'GROUP8', '8760', '0', 'Auflösung satzungsmäßige Rücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 305, 'AT-BASE', 'GROUP8', '8770', '0', 'Auflösung andere (freie) Rücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 306, 'AT-BASE', 'GROUP8', '8810', '0', 'Zuweisung sonstige unversteuerte Rücklagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 307, 'AT-BASE', 'GROUP8', '8820', '0', 'Zuweisung Inv. Rücklage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 308, 'AT-BASE', 'GROUP8', '8890', '0', 'Zuw.Bew.Res.GWG', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 309, 'AT-BASE', 'GROUP8', '8900', '0', 'Zuweisung gesetzliche Rücklagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 310, 'AT-BASE', 'GROUP8', '8910', '0', 'Zuweisung satzungsmäßige Rücklagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 311, 'AT-BASE', 'GROUP8', '8920', '0', 'Zuweisung andere (freie) Rücklagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 312, 'AT-BASE', 'GROUP9', '9390', '0', 'Bilanzgewinn', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 313, 'AT-BASE', 'GROUP9', '9391', '0', 'Bilanzverlust', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 314, 'AT-BASE', 'GROUP9', '9700', '0', 'Wachdienst', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 315, 'AT-BASE', 'GROUP9', '9991', '0', 'Gewinnvortrag', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 316, 'AT-BASE', 'GROUP9', '9993', '0', 'Verlustvortrag', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 317, 'AT-BASE', 'GROUP9', '9994', '0', 'Verlustvortrag', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 318, 'AT-BASE', 'GROUP5', '50200', '0', 'Materialeinkauf', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 319, 'AT-BASE', 'GROUP6', '60000', '0', 'kalk. Löhne u Gehälter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 320, 'AT-BASE', 'GROUP6', '64160', '0', 'Veränderung Pensionsrückstellung (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 321, 'AT-BASE', 'GROUP6', '66300', '0', 'Leistungserfassung', 1);

-- Different Base CoA for Austria

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1001, 'AT-BASE-2', 'Anlagevermögen', '0010', '0',
        'Aufwendungen für das Ingangsetzen und Erweitern eines Betriebes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1002, 'AT-BASE-2', 'Anlagevermögen', '0090', '0', 'Kumulierte Abschreibungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1003, 'AT-BASE-2', 'Anlagevermögen', '0100', '0', 'Konzessionen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1004, 'AT-BASE-2', 'Anlagevermögen', '0110', '0', 'Patentrechte und Lizenzen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1005, 'AT-BASE-2', 'Anlagevermögen', '0120', '0', 'Datenverarbeitungsprogramme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1006, 'AT-BASE-2', 'Anlagevermögen', '0121', '0', 'Geringwertige Datenverarbeitungsprogramme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1007, 'AT-BASE-2', 'Anlagevermögen', '0130', '0',
        'Marken, Warenzeichen und Musterschutzrechte, sonstige Urheberrechte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1008, 'AT-BASE-2', 'Anlagevermögen', '0140', '0', 'Pacht- und Mietrechte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1009, 'AT-BASE-2', 'Anlagevermögen', '0150', '0', 'Geschäfts(Firmen)wert', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1010, 'AT-BASE-2', 'Anlagevermögen', '0180', '0', 'Geleistete Anzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1011, 'AT-BASE-2', 'Anlagevermögen', '0190', '0', 'Kumulierte Abschreibungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1012, 'AT-BASE-2', 'Sachanlagen', '0200', '0', 'Unbebaute Grundstücke', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1013, 'AT-BASE-2', 'Sachanlagen', '0210', '0', 'Bebaute Grundstücke (Grundwert)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1014, 'AT-BASE-2', 'Sachanlagen', '0220', '0', 'Grundstücksgleiche Rechte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1015, 'AT-BASE-2', 'Sachanlagen', '0300', '0', 'Betriebs- und Geschäftsgebäude auf eigenem Grund',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1016, 'AT-BASE-2', 'Sachanlagen', '0310', '0', 'Wohn- und Sozialgebäude auf eigenem Grund', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1017, 'AT-BASE-2', 'Sachanlagen', '0320', '0', 'Betriebs- und Geschäftsgebäude auf fremdem Grund',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1018, 'AT-BASE-2', 'Sachanlagen', '0330', '0', 'Wohn- und Sozialgebäude auf fremdem Grund', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1019, 'AT-BASE-2', 'Sachanlagen', '0340', '0', 'Grundstückseinrichtungen auf eigenem Grund', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1020, 'AT-BASE-2', 'Sachanlagen', '0350', '0', 'Grundstückseinrichtungen auf fremdem Grund', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1021, 'AT-BASE-2', 'Sachanlagen', '0360', '0',
        'Bauliche Investitionen in fremden (gepachteten) Betriebs- und Geschäftsgebäuden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1022, 'AT-BASE-2', 'Sachanlagen', '0370', '0',
        'Bauliche Investitionen in fremden (gepachteten) Wohn- und Sozialgebäuden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1023, 'AT-BASE-2', 'Sachanlagen', '0390', '0', 'Kumulierte Abschreibungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1024, 'AT-BASE-2', 'Sachanlagen', '0400', '0', 'Fertigungsmaschinen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1025, 'AT-BASE-2', 'Sachanlagen', '0410', '0', 'Antriebsmaschinen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1026, 'AT-BASE-2', 'Sachanlagen', '0420', '0', 'Energieversorgungsanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1027, 'AT-BASE-2', 'Sachanlagen', '0430', '0', 'Transportanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1028, 'AT-BASE-2', 'Sachanlagen', '0500', '0', 'Maschinenwerkzeuge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1029, 'AT-BASE-2', 'Sachanlagen', '0510', '0', 'Allgemeine Werkzeuge und Handwerkzeuge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1030, 'AT-BASE-2', 'Sachanlagen', '0520', '0', 'Vorrichtungen, Formen und Modelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1031, 'AT-BASE-2', 'Sachanlagen', '0530', '0', 'Andere Erzeugungshilfsmittel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1032, 'AT-BASE-2', 'Sachanlagen', '0540', '0', 'Hebezeuge und Montageanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1033, 'AT-BASE-2', 'Sachanlagen', '0550', '0',
        'Geringwertige Vermögensgegenstände, soweit im Erzeugungsprozeß verwendet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1034, 'AT-BASE-2', 'Sachanlagen', '0600', '0', 'Beheizungs- und Beleuchtungsanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1035, 'AT-BASE-2', 'Sachanlagen', '0610', '0', 'Nachrichten- und Kontrollanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1036, 'AT-BASE-2', 'Sachanlagen', '0620', '0', 'Büromaschinen, EDV-Anlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1037, 'AT-BASE-2', 'Sachanlagen', '0630', '0', 'PKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1038, 'AT-BASE-2', 'Sachanlagen', '0640', '0', 'LKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1039, 'AT-BASE-2', 'Sachanlagen', '0650', '0', 'Andere Beförderungsmittel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1040, 'AT-BASE-2', 'Sachanlagen', '0660', '0', 'Andere Betriebs- und Geschäftsausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1041, 'AT-BASE-2', 'Sachanlagen', '0670', '0', 'Gebinde', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1042, 'AT-BASE-2', 'Sachanlagen', '0680', '0', 'Geringwertige Büromaschinen, EDV-Anlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1043, 'AT-BASE-2', 'Sachanlagen', '0681', '0', 'Geringwertige Betriebs- und Geschäftsausstattung',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1044, 'AT-BASE-2', 'Sachanlagen', '0692', '0',
        'Kumulierte Abschreibungen zu Büromaschinen, EDV-Anlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1045, 'AT-BASE-2', 'Sachanlagen', '0693', '0', 'Kumulierte Abschreibungen zu PKW und Kombis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1046, 'AT-BASE-2', 'Sachanlagen', '0694', '0', 'Kumulierte Abschreibungen zu LKW', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1047, 'AT-BASE-2', 'Sachanlagen', '0696', '0',
        'Kumulierte Abschreibungen zur Betriebs- und Geschäftsausstattung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1048, 'AT-BASE-2', 'Vorauszahlungen', '0700', '0', 'Geleistete Anzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1049, 'AT-BASE-2', 'Sachanlagen', '0710', '0', 'Anlagen in Bau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1050, 'AT-BASE-2', 'Sachanlagen', '0790', '0', 'Kumulierte Abschreibungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1051, 'AT-BASE-2', 'Anlagevermögen', '0800', '0', 'Anteile an verbundenen Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1052, 'AT-BASE-2', 'Anlagevermögen', '0810', '0', 'Beteiligungen an Gemeinschaftsunternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1053, 'AT-BASE-2', 'Anlagevermögen', '0820', '0',
        'Beteiligungen an angeschlossenen (assoziierten) Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1054, 'AT-BASE-2', 'Anlagevermögen', '0830', '0', 'Sonstige Beteiligungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1055, 'AT-BASE-2', 'Anlagevermögen', '0840', '0', 'Ausleihungen an verbundene Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1056, 'AT-BASE-2', 'Anlagevermögen', '0850', '0',
        'Ausleihungen an Unternehmen, mit denen ein Beteiligungsverhältnis besteht', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1057, 'AT-BASE-2', 'Anlagevermögen', '0860', '0', 'Sonstige Ausleihungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1058, 'AT-BASE-2', 'Anlagevermögen', '0870', '0',
        'Anteile an Kapitalgesellschaften ohne Beteiligungscharakter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1059, 'AT-BASE-2', 'Anlagevermögen', '0880', '0',
        'Anteile an Personengesellschaften ohne Beteiligungscharakter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1060, 'AT-BASE-2', 'Anlagevermögen', '0900', '0',
        'Genossenschaftsanteile ohne Beteiligungscharakter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1061, 'AT-BASE-2', 'Anlagevermögen', '0910', '0', 'Anteile an Investmentfonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1062, 'AT-BASE-2', 'Vorauszahlungen', '0980', '0', 'Geleistete Anzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1063, 'AT-BASE-2', 'Anlagevermögen', '0990', '0', 'Kumulierte Abschreibungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1064, 'AT-BASE-2', 'Umlaufvermögen', '1600', '0', 'Handelswaren', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1065, 'AT-BASE-2', 'Vorauszahlungen', '1800', '0', 'Geleistete Anzahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1066, 'AT-BASE-2', 'Debitoren', '2000', '0',
        'Forderungen von Partnern im Inland ohne eigenes Debitorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1067, 'AT-BASE-2', 'Umlaufvermögen', '2080', '0',
        'Einzelwertberichtigungen zu Forderungen aus Lieferungen und Leistungen Inland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1068, 'AT-BASE-2', 'Umlaufvermögen', '2090', '0',
        'Pauschalwertberichtigungen zu Forderungen aus Lieferungen und Leistungen Inland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1069, 'AT-BASE-2', 'Debitoren', '2099', '0', 'Forderungen von Partnern (Point Of Sale)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1070, 'AT-BASE-2', 'Debitoren', '2100', '0',
        'Forderungen von Partnern im EU Raum ohne eigenes Debitorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1071, 'AT-BASE-2', 'Umlaufvermögen', '2130', '0',
        'Einzelwertberichtigungen zu Forderungen aus Lieferungen und Leistungen Währungsunion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1072, 'AT-BASE-2', 'Umlaufvermögen', '2140', '0',
        'Pauschalwertberichtigungen zu Forderungen aus Lieferungen und Leistungen Währungsunion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1073, 'AT-BASE-2', 'Debitoren', '2150', '0',
        'Forderungen von Partnern in Drittstaaten ohne eigenes Debitorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1074, 'AT-BASE-2', 'Umlaufvermögen', '2180', '0',
        'Einzelwertberichtigungen zu Forderungen aus Lieferungen und Leistungen sonstiges Ausland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1075, 'AT-BASE-2', 'Umlaufvermögen', '2190', '0',
        'Pauschalwertberichtigungen zu Forderungen aus Lieferungen und Leistungen sonstiges Ausland', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1076, 'AT-BASE-2', 'Umlaufvermögen', '2230', '0',
        'Einzelwertberichtigungen zu Forderungen gegenüber verbundenen Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1077, 'AT-BASE-2', 'Umlaufvermögen', '2240', '0',
        'Pauschalwertberichtigungen zu Forderungen gegenüber verbundenen Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1078, 'AT-BASE-2', 'Umlaufvermögen', '2280', '0',
        'Einzelwertberichtigungen zu Forderungen gegenüber Unternehmen, mit denen ein Beteiligungsverhältnis besteht',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1079, 'AT-BASE-2', 'Umlaufvermögen', '2290', '0',
        'Pauschalwertberichtigungen zu Forderungen gegenüber Unternehmen, mit denen ein Beteiligungsverhältnis besteht',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1080, 'AT-BASE-2', 'Umlaufvermögen', '2470', '0',
        'Eingeforderte, aber noch nicht eingezahlte Einlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1081, 'AT-BASE-2', 'Umlaufvermögen', '2480', '0',
        'Einzelwertberichtigungen zu sonstigen Forderungen und Vermögensgegenständen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1082, 'AT-BASE-2', 'Umlaufvermögen', '2490', '0',
        'Pauschalwertberichtigungen zu sonstigen Forderungen und Vermögensgegenständen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1083, 'AT-BASE-2', 'Umlaufvermögen', '2500', '0', 'Vorsteuern 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1084, 'AT-BASE-2', 'Umlaufvermögen', '2501', '0', 'Vorsteuern 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1085, 'AT-BASE-2', 'Umlaufvermögen', '2502', '0', 'Vorsteuern 13%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1086, 'AT-BASE-2', 'Umlaufvermögen', '2505', '0', 'Sonstige Vorsteuern', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1087, 'AT-BASE-2', 'Umlaufvermögen', '2506', '0', 'Vorsteuern RC 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1088, 'AT-BASE-2', 'Umlaufvermögen', '2507', '0', 'Vorsteuern RC 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1089, 'AT-BASE-2', 'Umlaufvermögen', '2510', '0', 'Vorsteuern RC EU 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1090, 'AT-BASE-2', 'Umlaufvermögen', '2511', '0', 'Vorsteuern IGE 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1091, 'AT-BASE-2', 'Umlaufvermögen', '2512', '0', 'Vorsteuern IGE 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1092, 'AT-BASE-2', 'Umlaufvermögen', '2513', '0', 'Vorsteuern IGE 13%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1093, 'AT-BASE-2', 'Umlaufvermögen', '2515', '0', 'Vorsteuern 20% (aus EUSt.)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1094, 'AT-BASE-2', 'Umlaufvermögen', '2600', '0', 'Eigene Anteile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1095, 'AT-BASE-2', 'Umlaufvermögen', '2610', '0', 'Anteile an verbundenen Unternehmen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1096, 'AT-BASE-2', 'Umlaufvermögen', '2620', '0', 'Sonstige Anteile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1097, 'AT-BASE-2', 'Umlaufvermögen', '2680', '0',
        'Besitzwechsel, soweit dem Unternehmen nicht die der Ausstellung zugrundeliegenden Forderungen zustehen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1098, 'AT-BASE-2', 'Umlaufvermögen', '2690', '0', 'Wertberichtigungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1099, 'AT-BASE-2', 'Liquide Mittel', '2701', '0', 'Kasse/Bank', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1100, 'AT-BASE-2', 'Umlaufvermögen', '2730', '0', 'Postwertzeichen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1101, 'AT-BASE-2', 'Umlaufvermögen', '2740', '0', 'Stempelmarken', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1102, 'AT-BASE-2', 'Umlaufvermögen', '2780', '0', 'Schecks in Inlandswährung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1103, 'AT-BASE-2', 'Umlaufvermögen', '2801', '0', 'Bankzwischenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1104, 'AT-BASE-2', 'Umlaufvermögen', '2802', '0', 'Ausstehende Quittungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1105, 'AT-BASE-2', 'Umlaufvermögen', '2803', '0', 'Ausstehende Zahlungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1106, 'AT-BASE-2', 'Liquide Mittel', '2804', '0', 'Bank', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1107, 'AT-BASE-2', 'Umlaufvermögen', '2880', '0', 'Schwebende Geldbewegungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1108, 'AT-BASE-2', 'Umlaufvermögen', '2881', '0', 'Liquiditätstransfer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1109, 'AT-BASE-2', 'Umlaufvermögen', '2890', '0', 'Wertberichtigungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1110, 'AT-BASE-2', 'Umlaufvermögen', '2900', '0', 'Aktive Rechnungsabgrenzungsposten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1111, 'AT-BASE-2', 'Umlaufvermögen', '2950', '0', 'Disagio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1112, 'AT-BASE-2', 'Umlaufvermögen', '2960', '0',
        'Unterschiedsbetrag zur gebotenen Pensionsrückstellung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1113, 'AT-BASE-2', 'Umlaufvermögen', '2970', '0',
        'Unterschiedsbetrag gem. Abschnitt XII Pensionskassengesetz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1114, 'AT-BASE-2', 'Umlaufvermögen', '2980', '0', 'Steuerabgrenzung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1115, 'AT-BASE-2', 'Langfristige Verbindlichkeiten', '3000', '0',
        'Rückstellungen für Abfertigungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1116, 'AT-BASE-2', 'Langfristige Verbindlichkeiten', '3010', '0', 'Rückstellungen für Pensionen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1117, 'AT-BASE-2', 'Umlaufvermögen', '3100', '0', 'Anleihen (einschließlich konvertibler)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1118, 'AT-BASE-2', 'Umlaufvermögen', '3200', '0', 'Erhaltene Anzahlungen auf Bestellungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1119, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3210', '0',
        'Umsatzsteuer-Evidenzkonto für erhaltene Anzahlungen auf Bestellungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1120, 'AT-BASE-2', 'Kreditoren', '3300', '0',
        'Verbindlichkeiten bei Partnern im Inland ohne eigenes Kreditorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1121, 'AT-BASE-2', 'Kreditoren', '3360', '0',
        'Verbindlichkeiten bei Partnern im EU Raum ohne eigenes Kreditorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1122, 'AT-BASE-2', 'Kreditoren', '3370', '0',
        'Verbindlichkeiten bei Partnern in Drittstaaten ohne eigenes Kreditorenkonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1123, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3480', '0',
        'Verbindlichkeiten gegenüber Gesellschaftern', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1124, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3500', '0', 'Umsatzsteuer 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1125, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3501', '0', 'Umsatzsteuer 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1126, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3502', '0', 'Umsatzsteuer 13%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1127, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3505', '0', 'Sonstige Umsatzsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1128, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3510', '0', 'Umsatzsteuer RC EU 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1129, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3511', '0', 'Umsatzsteuer IGE 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1130, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3512', '0', 'Umsatzsteuer IGE 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1131, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3513', '0', 'Umsatzsteuer IGE 13%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1132, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3515', '0', 'Einfuhrumsatzsteuer 20%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1133, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3520', '0', 'Ust. Zahllast', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1134, 'AT-BASE-2', 'Kreditoren', '3530', '0', 'Verrechnungskonto Finanzamt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1135, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3540', '0', 'Verrechnung Lohnsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1136, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3541', '0', 'Verrechnung Dienstgeberbeitrag',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1137, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3542', '0', 'Verrechnung Dienstgeberzuschlag',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1138, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3550', '0', 'Verrechnung Kommunalsteuer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1139, 'AT-BASE-2', 'Kurzfristige Verbindlichkeiten', '3551', '0',
        'Verrechnung Wiener Dienstgeberabgabe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1140, 'AT-BASE-2', 'Kreditoren', '3600', '0', 'Verrechungskonto Sozialversicherung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1141, 'AT-BASE-2', 'Kreditoren', '3610', '0',
        'Verrechnungskonto Magistrat/Gemeinde (KoSt, U-Bahn, etc.)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1142, 'AT-BASE-2', 'Kreditoren', '3740', '0', 'WERE Verrechnungskonto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1143, 'AT-BASE-2', 'Erlöse', '4000', '0', 'Brutto-Umsatzerlöse im Inland (20%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1144, 'AT-BASE-2', 'Erlöse', '4001', '0', 'Brutto-Umsatzerlöse im Inland (10%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1145, 'AT-BASE-2', 'Erlöse', '4100', '0', 'Brutto-Umsatzerlöse im EU Raum (RC 20%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1146, 'AT-BASE-2', 'Erlöse', '4110', '0', 'Brutto-Umsatzerlöse im EU Raum (RC 10%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1147, 'AT-BASE-2', 'Erlöse', '4200', '0', 'Brutto-Umsatzerlöse in Drittstaaten (0%)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1148, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '4860', '0',
        'Kursgewinne aus Fremdwährungstransaktionen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1149, 'AT-BASE-2', 'Aufwand', '5000', '0', 'Wareneinkauf', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1150, 'AT-BASE-2', 'Aufwand', '5050', '0', 'Wareneinkauf EU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1151, 'AT-BASE-2', 'Aufwand', '5090', '0', 'Wareneinkauf 0%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1152, 'AT-BASE-2', 'Aufwand', '5800', '0', 'Skontoerträge auf Materialaufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1153, 'AT-BASE-2', 'Aufwand', '5810', '0',
        'Skontoerträge auf sonstige bezogene Herstellungsleistungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1154, 'AT-BASE-2', 'Aufwand', '5900', '0', 'Aufwandsstellenrechnung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1155, 'AT-BASE-2', 'Aufwand', '6200', '0', 'Gehälter (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1156, 'AT-BASE-2', 'Aufwand', '6205', '0', 'Geschäftsführerbezug', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1157, 'AT-BASE-2', 'Aufwand', '6242', '0', 'Urlaubsabfindung (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1158, 'AT-BASE-2', 'Aufwand', '6260', '0', 'Sonstige Bezüge (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1159, 'AT-BASE-2', 'Aufwand', '6270', '0', 'Sachbezug (Angestellte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1160, 'AT-BASE-2', 'Aufwand', '6271', '0', 'Sachbezug (Geschäftsführer)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1161, 'AT-BASE-2', 'Aufwand', '6310', '0', 'Grundgehälter (Überstunden)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1162, 'AT-BASE-2', 'Aufwand', '6330', '0', 'Gehälter (Überstundenzuschläge)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1163, 'AT-BASE-2', 'Aufwand', '6340', '0', 'Veränderung noch nicht konsumierter Urlaub', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1164, 'AT-BASE-2', 'Aufwand', '6400', '0', 'Beiträge für betriebliche Mitarbeitervorsorgekasse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1165, 'AT-BASE-2', 'Aufwand', '6560', '0', 'Gesetzlicher Sozialaufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1166, 'AT-BASE-2', 'Aufwand', '6660', '0', 'Kommunalsteuer (KoSt)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1167, 'AT-BASE-2', 'Aufwand', '6661', '0',
        'Dienstgeberbeitrag zum Familienlastenausgleichsfonds (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1168, 'AT-BASE-2', 'Aufwand', '6662', '0', 'Zuschlag zum Dienstnehmerbeitrag (DZ)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1169, 'AT-BASE-2', 'Aufwand', '6663', '0', 'Dienstgeberabgabe der Gemeinde Wien (U-Bahn Steuer)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1170, 'AT-BASE-2', 'Aufwand', '6700', '0', 'Sonstiger freiwilliger Sozialaufwand', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1171, 'AT-BASE-2', 'Aufwand', '6900', '0', 'Aufwandsstellenrechnung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1172, 'AT-BASE-2', 'Abschreibungen', '7000', '0',
        'Abschreibungen auf aktivierte Aufwendungen für das Ingangsetzen und Erweitern eines Betriebes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1173, 'AT-BASE-2', 'Abschreibungen', '7090', '0',
        'Abschreibungen vom Umlaufvermögen, soweit diese die im Unternehmen üblichen Abschreibungen übersteigen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1174, 'AT-BASE-2', 'Aufwand', '7600', '0', 'Büromaterial und Drucksorten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1175, 'AT-BASE-2', 'Aufwand', '7630', '0', 'Fachliteratur und Zeitungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1176, 'AT-BASE-2', 'Aufwand', '7690', '0', 'Spenden und Trinkgelder', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1177, 'AT-BASE-2', 'Aufwand', '7770', '0', 'Aus- und Fortbildung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1178, 'AT-BASE-2', 'Aufwand', '7780', '0', 'Mitgliedsbeiträge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1179, 'AT-BASE-2', 'Aufwand', '7790', '0', 'Spesen des Geldverkehrs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1180, 'AT-BASE-2', 'Aufwand', '7820', '0',
        'Buchwert abgegangener Anlagen, ausgenommen Finanzanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1181, 'AT-BASE-2', 'Aufwand', '7830', '0',
        'Verluste aus dem Abgang vom Anlagevermögen, ausgenommen Finanzanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1182, 'AT-BASE-2', 'Aufwand', '7860', '0', 'Kursverluste aus Fremdwährungstransaktionen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1183, 'AT-BASE-2', 'Aufwand', '7890', '0', 'Skontoerträge auf sonstige betriebliche Aufwendungen',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1184, 'AT-BASE-2', 'Aufwand', '7900', '0', 'Aufwandsstellenrechnung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1185, 'AT-BASE-2', 'Aufwand', '7960', '0',
        'Herstellungskosten der zur Erzielung der Umsatzerlöse erbrachten Leistungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1186, 'AT-BASE-2', 'Aufwand', '7970', '0', 'Vertriebskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1187, 'AT-BASE-2', 'Aufwand', '7980', '0', 'Verwaltungskosten', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1188, 'AT-BASE-2', 'Aufwand', '7990', '0', 'Sonstige betriebliche Aufwendungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1189, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8140', '0',
        'Erlöse aus dem Abgang von Beteiligungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1190, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8150', '0',
        'Erlöse aus dem Abgang von sonstigen Finanzanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1191, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8160', '0',
        'Erlöse aus dem Abgang von Wertpapieren des Umlaufvermögens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1192, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8170', '0',
        'Buchwert abgegangener Beteiligungen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1193, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8180', '0',
        'Buchwert abgegangener sonstiger Finanzanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1194, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8190', '0',
        'Buchwert abgegangener Wertpapiere des Umlaufvermögens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1195, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8200', '0',
        'Erträge aus dem Abgang von und der Zuschreibung zu Finanzanlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1196, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8210', '0',
        'Erträge aus dem Abgang von und der Zuschreibung zu Wertpapieren des Umlaufvermögens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1197, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8350', '0',
        'Nicht ausgenützte Lieferantenskonti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1198, 'AT-BASE-2', 'Sonstige betriebliche Erträge', '8990', '0',
        'Gewinnabfuhr bzw. Verlustüberrechnung aus Ergebnisabführungsverträgen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1199, 'AT-BASE-2', 'Eigenkapital', '9190', '0', 'Nicht eingeforderte ausstehende Einlagen', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1200, 'AT-BASE-2', 'Eigenkapital', '9390', '0', 'Bilanzgewinn (-verlust)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1201, 'AT-BASE-2', 'Eigenkapital', '9800', '0', 'Eröffnungsbilanz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1202, 'AT-BASE-2', 'Eigenkapital', '9850', '0', 'Schlussbilanz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1203, 'AT-BASE-2', 'Eigenkapital', '9890', '0', 'Gewinn- und Verlustrechnung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1204, 'AT-BASE-2', 'Aufwand', '9991', '0', 'Bargelddifferenz Verlust', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1205, 'AT-BASE-2', 'Erlöse', '9992', '0', 'Bargelddifferenz Gewinn', 1);
