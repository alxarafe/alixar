-- Copyright (C) 2023      Mario Samudio        <mrsamudio@ucundinamarca.edu.co>
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

-- Description of chart of account CO CO-PUC


INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1, 'CO-PUC', 'Activo', 'x', '1', 0, 'Activo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2, 'CO-PUC', 'Activos', 'xx', '11', 1, 'Disponible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 3, 'CO-PUC', 'Activos disponibles', 'xx xx', '1105', 2, 'Caja', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 4, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '110505', 3, 'Caja General', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 5, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '110510', 3, 'Cajas Menores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 6, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '110515', 3, 'Moneda Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 7, 'CO-PUC', 'Activos disponibles', 'xx xx', '1110', 2, 'Bancos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 8, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '111005', 7, 'Moneda Nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 9, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '111010', 7, 'Moneda Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 10, 'CO-PUC', 'Activos disponibles', 'xx xx', '1115', 2, 'Remesas En Transito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 11, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '111505', 10, 'Moneda Nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 12, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '111510', 10, 'Moneda Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 13, 'CO-PUC', 'Activos disponibles', 'xx xx', '1120', 2, 'Cuentas De Ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 14, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112005', 13, 'Bancos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 15, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112010', 13, 'Corporaciones De Ahorro Y Vivienda',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 16, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112015', 13,
        'Organismos Cooperativos Financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 17, 'CO-PUC', 'Activos disponibles', 'xx xx', '1125', 2, 'Fondos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 18, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112505', 17, 'Rotatorios Moneda Nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 19, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112510', 17, 'Rotatorios Moneda Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 20, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112515', 17, 'Especiales Moneda Nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 21, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112520', 17, 'Especiales Moneda Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 22, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112525', 17, 'De Amortizacion Moneda Nacional',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 23, 'CO-PUC', 'Activos disponibles', 'xx xx xx', '112530', 17, 'De Amortizacion Moneda Extranjera',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 24, 'CO-PUC', 'Activos', 'xx', '12', 1, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 25, 'CO-PUC', 'Activos inversiones', 'xx xx', '1205', 24, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 26, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120505', 25,
        'Agricultura, ganadería, caza y silvicultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 27, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120510', 25, 'Pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 28, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120515', 25, 'Explotación de minas y canteras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 29, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120520', 25, 'Industria manufacturera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 30, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120525', 25,
        'Suministro de electricidad, gas y agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 31, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120530', 25, 'Construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 32, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120535', 25,
        'Comercio al por mayor y al por menor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 33, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120540', 25, 'Hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 34, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120545', 25,
        'Transporte, almacenamiento y comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 35, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120550', 25, 'Actividad financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 36, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120555', 25,
        'Actividades inmobiliarias, empresariales y de alquiler', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 37, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120560', 25, 'Enseñanza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 38, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120565', 25, 'Servicios sociales y de salud', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 39, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120570', 25,
        'Otras actividades de servicios comunitarios, sociales y personales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 40, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '120599', 25, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 41, 'CO-PUC', 'Activos inversiones', 'xx xx', '1210', 24, 'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 42, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121005', 41,
        'Agricultura, ganadería, caza y silvicultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 43, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121010', 41, 'Pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 44, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121015', 41, 'Explotación de minas y canteras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 45, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121020', 41, 'Industria manufacturera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 46, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121025', 41,
        'Suministro de electricidad, gas y agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 47, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121030', 41, 'Construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 48, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121035', 41,
        'Comercio al por mayor y al por menor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 49, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121040', 41, 'Hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 50, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121045', 41,
        'Transporte, almacenamiento y comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 51, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121050', 41, 'Actividad financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 52, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121055', 41,
        'Actividades inmobiliarias, empresariales y de alquiler', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 53, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121060', 41, 'Enseñanza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 54, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121065', 41, 'Servicios sociales y de salud', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 55, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121070', 41,
        'Otras actividades de servicios comunitarios, sociales y personales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 56, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121099', 41, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 57, 'CO-PUC', 'Activos inversiones', 'xx xx', '1215', 24, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 58, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121505', 57, 'Bonos públicos moneda nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 59, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121510', 57, 'Bonos públicos moneda extranjera',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 60, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121515', 57, 'Bonos ordinarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 61, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121520', 57, 'Bonos convertibles en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 62, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '121595', 57, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 63, 'CO-PUC', 'Activos inversiones', 'xx xx', '1220', 24, 'Cédulas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 64, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122005', 63, 'Cédulas de capitalización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 65, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122010', 63, 'Cédulas hipotecarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 66, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122015', 63, 'Cédulas de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 67, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122095', 63, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 68, 'CO-PUC', 'Activos inversiones', 'xx xx', '1225', 24, 'Certificados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 69, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122505', 68,
        'Certificados de depósito a término (CDT)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 70, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122510', 68, 'Certificados de depósito de ahorro',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 71, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122515', 68,
        'Certificados de ahorro de valor constante (CAVC)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 72, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122520', 68, 'Certificados de cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 73, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122525', 68,
        'Certificados cafeteros valorizables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 74, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122530', 68,
        'Certificados eléctricos valorizables (CEV)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 75, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122535', 68,
        'Certificados de reembolso tributario (CERT)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 76, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122540', 68,
        'Certificados de desarrollo turístico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 77, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122545', 68,
        'Certificados de inversión forestal (CIF)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 78, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '122595', 68, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 79, 'CO-PUC', 'Activos inversiones', 'xx xx', '1230', 24, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 80, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123005', 79, 'Empresas comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 81, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123010', 79, 'Empresas industriales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 82, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123015', 79, 'Empresas de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 83, 'CO-PUC', 'Activos inversiones', 'xx xx', '1235', 24, 'Títulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 84, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123505', 83, 'Títulos de desarrollo agropecuario',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 85, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123510', 83,
        'Títulos canjeables por certificados de cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 86, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123515', 83, 'Títulos de tesorería (TES)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 87, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123520', 83, 'Títulos de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 88, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123525', 83, 'Títulos de crédito de fomento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 89, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123530', 83,
        'Títulos financieros agroindustriales (TFA)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 90, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123535', 83, 'Títulos de ahorro cafetero (TAC)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 91, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123540', 83, 'Títulos de ahorro nacional (TAN)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 92, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123545', 83,
        'Títulos energéticos de rentabilidad creciente (TER)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 93, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123550', 83, 'Títulos de ahorro educativo (TAE)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 94, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123555', 83,
        'Títulos financieros industriales y comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 95, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123560', 83, 'Tesoros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 96, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123565', 83,
        'Títulos de devolución de impuestos nacionales (TIDIS)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 97, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123570', 83, 'Títulos inmobiliarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 98, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '123595', 83, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 99, 'CO-PUC', 'Activos inversiones', 'xx xx', '1240', 24, 'Aceptaciones bancarias o financieras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 100, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124005', 99, 'Bancos comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 101, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124010', 99,
        'Compañías de financiamiento comercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 102, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124015', 99, 'Corporaciones financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 103, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124095', 99, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 104, 'CO-PUC', 'Activos inversiones', 'xx xx', '1245', 24, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 105, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124505', 104,
        'Fideicomisos de inversión moneda nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 106, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '124510', 104,
        'Fideicomisos de inversión moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 107, 'CO-PUC', 'Activos inversiones', 'xx xx', '1250', 24,
        'Derechos de recompra de inversiones negociadas (repos)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 108, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125005', 107, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 109, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125010', 107,
        'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 110, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125015', 107, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 111, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125020', 107, 'Cédulas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 112, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125025', 107, 'Certificados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 113, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125030', 107, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 114, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125035', 107, 'Títulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 115, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125040', 107,
        'Aceptaciones bancarias o financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 116, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125095', 107, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 117, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125099', 107, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 118, 'CO-PUC', 'Activos inversiones', 'xx xx', '1255', 24, 'Obligatorias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 119, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125505', 118, 'Bonos de financiamiento especial',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 120, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125510', 118,
        'Bonos de financiamiento presupuestal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 121, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125515', 118,
        'Bonos para desarrollo social y seguridad interna (BDSI)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 122, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '125595', 118, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 123, 'CO-PUC', 'Activos inversiones', 'xx xx', '1260', 24, 'Cuentas en participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 124, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '126099', 123, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 125, 'CO-PUC', 'Activos inversiones', 'xx xx', '1295', 24, 'Otras inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 126, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129505', 125, 'Aportes en cooperativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 127, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129510', 125, 'Derechos en clubes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 128, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129515', 125,
        'Acciones o derechos en clubes deportivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 129, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129520', 125, 'Bonos en colegios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 130, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129595', 125, 'Diversas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 131, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129599', 125, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 132, 'CO-PUC', 'Activos inversiones', 'xx xx', '1299', 24, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 133, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129905', 132, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 134, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129910', 132,
        'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 135, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129915', 132, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 136, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129920', 132, 'Cédulas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 137, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129925', 132, 'Certificados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 138, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129930', 132, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 139, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129935', 132, 'Títulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 140, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129940', 132,
        'Aceptaciones bancarias o financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 141, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129945', 132, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 142, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129950', 132,
        'Derechos de recompra de inversiones negociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 143, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129955', 132, 'Obligatorias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 144, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129960', 132, 'Cuentas en participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 145, 'CO-PUC', 'Activos inversiones', 'xx xx xx', '129995', 132, 'Otras inversiones', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 146, 'CO-PUC', 'Activos', 'xx', '13', 1, 'Deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 147, 'CO-PUC', 'Activos deudores', 'xx xx', '1305', 146, 'Clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 148, 'CO-PUC', 'Activos deudores', 'xx xx xx', '130505', 147, 'Nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 149, 'CO-PUC', 'Activos deudores', 'xx xx xx', '130510', 147, 'Del exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 150, 'CO-PUC', 'Activos deudores', 'xx xx xx', '130515', 147, 'Deudores del sistema', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 151, 'CO-PUC', 'Activos deudores', 'xx xx', '1310', 146, 'Cuentas corrientes comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 152, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131005', 151, 'Casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 153, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131010', 151, 'Compañías vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 154, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131015', 151, 'Accionistas o socios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 155, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131020', 151, 'Particulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 156, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131095', 151, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 157, 'CO-PUC', 'Activos deudores', 'xx xx', '1315', 146, 'Cuentas por cobrar a casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 158, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131505', 157, 'Ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 159, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131510', 157, 'Pagos a nombre de casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 160, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131515', 157, 'Valores recibidos por casa matriz',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 161, 'CO-PUC', 'Activos deudores', 'xx xx xx', '131520', 157, 'Préstamos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 162, 'CO-PUC', 'Activos deudores', 'xx xx', '1320', 146,
        'Cuentas por cobrar a vinculados económicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 163, 'CO-PUC', 'Activos deudores', 'xx xx xx', '132005', 162, 'Filiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 164, 'CO-PUC', 'Activos deudores', 'xx xx xx', '132010', 162, 'Subsidiarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 165, 'CO-PUC', 'Activos deudores', 'xx xx xx', '132015', 162, 'Sucursales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 166, 'CO-PUC', 'Activos deudores', 'xx xx', '1323', 146, 'Cuentas por cobrar a directores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 167, 'CO-PUC', 'Activos deudores', 'xx xx', '1325', 146,
        'Cuentas por cobrar a socios y accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 168, 'CO-PUC', 'Activos deudores', 'xx xx xx', '132505', 167, 'A socios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 169, 'CO-PUC', 'Activos deudores', 'xx xx xx', '132510', 167, 'A accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 170, 'CO-PUC', 'Activos deudores', 'xx xx', '1328', 146, 'Aportes por cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 171, 'CO-PUC', 'Activos deudores', 'xx xx', '1330', 146, 'Anticipos y avances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 172, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133005', 171, 'A proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 173, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133010', 171, 'A contratistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 174, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133015', 171, 'A trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 175, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133020', 171, 'A agentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 176, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133025', 171, 'A concesionarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 177, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133030', 171, 'De adjudicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 178, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133095', 171, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 179, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133099', 171, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 180, 'CO-PUC', 'Activos deudores', 'xx xx', '1332', 146, 'Cuentas de operación conjunta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 181, 'CO-PUC', 'Activos deudores', 'xx xx', '1335', 146, 'Depósitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 182, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133505', 181, 'Para importaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 183, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133510', 181, 'Para servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 184, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133515', 181, 'Para contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 185, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133520', 181, 'Para responsabilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 186, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133525', 181, 'Para juicios ejecutivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 187, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133530', 181,
        'Para adquisición de acciones, cuotas o derechos sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 188, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133535', 181, 'En garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 189, 'CO-PUC', 'Activos deudores', 'xx xx xx', '133595', 181, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 190, 'CO-PUC', 'Activos deudores', 'xx xx', '1340', 146, 'Promesas de compra venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 191, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134005', 190, 'De bienes raíces', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 192, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134010', 190, 'De maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 193, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134015', 190, 'De flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 194, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134020', 190, 'De flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 195, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134025', 190, 'De flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 196, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134030', 190,
        'De flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 197, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134035', 190, 'De semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 198, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134095', 190, 'De otros bienes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 199, 'CO-PUC', 'Activos deudores', 'xx xx', '1345', 146, 'Ingresos por cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 200, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134505', 199, 'Dividendos y/o participaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 201, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134510', 199, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 202, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134515', 199, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 203, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134520', 199, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 204, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134525', 199, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 205, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134530', 199, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 206, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134535', 199, 'CERT por cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 207, 'CO-PUC', 'Activos deudores', 'xx xx xx', '134595', 199, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 208, 'CO-PUC', 'Activos deudores', 'xx xx', '1350', 146, 'Retención sobre contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 209, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135005', 208, 'De construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 210, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135010', 208, 'De prestación de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 211, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135095', 208, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 212, 'CO-PUC', 'Activos deudores', 'xx xx', '1355', 146,
        'Anticipo de impuestos y contribuciones o saldos a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 213, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135505', 212,
        'Anticipo de impuestos de renta y complementarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 214, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135510', 212,
        'Anticipo de impuestos de industria y comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 215, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135515', 212, 'Retención en la fuente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 216, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135517', 212, 'Impuesto a las ventas retenido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 217, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135518', 212,
        'Impuesto de industria y comercio retenido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 218, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135520', 212,
        'Sobrantes en liquidación privada de impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 219, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135525', 212, 'Contribuciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 220, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135530', 212, 'Impuestos descontables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 221, 'CO-PUC', 'Activos deudores', 'xx xx xx', '135595', 212, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 222, 'CO-PUC', 'Activos deudores', 'xx xx', '1360', 146, 'Reclamaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 223, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136005', 222, 'A compañías aseguradoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 224, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136010', 222, 'A transportadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 225, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136015', 222, 'Por tiquetes aéreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 226, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136095', 222, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 227, 'CO-PUC', 'Activos deudores', 'xx xx', '1365', 146, 'Cuentas por cobrar a trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 228, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136505', 227, 'Vivienda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 229, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136510', 227, 'Vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 230, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136515', 227, 'Educación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 231, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136520', 227, 'Médicos, odontológicos y similares',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 232, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136525', 227, 'Calamidad doméstica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 233, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136530', 227, 'Responsabilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 234, 'CO-PUC', 'Activos deudores', 'xx xx xx', '136595', 227, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 235, 'CO-PUC', 'Activos deudores', 'xx xx', '1370', 146, 'Préstamos a particulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 236, 'CO-PUC', 'Activos deudores', 'xx xx xx', '137005', 235, 'Con garantía real', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 237, 'CO-PUC', 'Activos deudores', 'xx xx xx', '137010', 235, 'Con garantía personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 238, 'CO-PUC', 'Activos deudores', 'xx xx', '1380', 146, 'Deudores varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 239, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138005', 238, 'Depositarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 240, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138010', 238, 'Comisionistas de bolsas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 241, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138015', 238, 'Fondo de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 242, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138020', 238, 'Cuentas por cobrar de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 243, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138025', 238, 'Pagos por cuenta de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 244, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138030', 238, 'Fondos de inversión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 245, 'CO-PUC', 'Activos deudores', 'xx xx xx', '138095', 238, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 246, 'CO-PUC', 'Activos deudores', 'xx xx', '1385', 146,
        'Derechos de recompra de cartera negociada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 247, 'CO-PUC', 'Activos deudores', 'xx xx', '1390', 146, 'Deudas de difícil cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 248, 'CO-PUC', 'Activos deudores', 'xx xx', '1399', 146, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 249, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139905', 248, 'Clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 250, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139910', 248, 'Cuentas corrientes comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 251, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139915', 248, 'Cuentas por cobrar a casa matriz',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 252, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139920', 248,
        'Cuentas por cobrar a vinculados económicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 253, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139925', 248,
        'Cuentas por cobrar a socios y accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 254, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139930', 248, 'Anticipos y avances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 255, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139932', 248, 'Cuentas de operación conjunta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 256, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139935', 248, 'Depósitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 257, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139940', 248, 'Promesas de compraventa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 258, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139945', 248, 'Ingresos por cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 259, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139950', 248, 'Retención sobre contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 260, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139955', 248, 'Reclamaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 261, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139960', 248, 'Cuentas por cobrar a trabajadores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 262, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139965', 248, 'Préstamos a particulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 263, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139975', 248, 'Deudores varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 264, 'CO-PUC', 'Activos deudores', 'xx xx xx', '139980', 248,
        'Derechos de recompra de cartera negociada', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 265, 'CO-PUC', 'Activos', 'xx', '14', 1, 'Inventarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 266, 'CO-PUC', 'Activos inventarios', 'xx xx', '1405', 265, 'Materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 267, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '140599', 266, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 268, 'CO-PUC', 'Activos inventarios', 'xx xx', '1410', 265, 'Productos en proceso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 269, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '141099', 268, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 270, 'CO-PUC', 'Activos inventarios', 'xx xx', '1415', 265, 'Obras de construcción en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 271, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '141599', 270, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 272, 'CO-PUC', 'Activos inventarios', 'xx xx', '1417', 265, 'Obras de urbanismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 273, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '141799', 272, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 274, 'CO-PUC', 'Activos inventarios', 'xx xx', '1420', 265, 'Contratos en ejecución', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 275, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '142099', 274, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 276, 'CO-PUC', 'Activos inventarios', 'xx xx', '1425', 265, 'Cultivos en desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 277, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '142599', 276, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 278, 'CO-PUC', 'Activos inventarios', 'xx xx', '1428', 265, 'Plantaciones agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 279, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '142899', 278, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 280, 'CO-PUC', 'Activos inventarios', 'xx xx', '1430', 265, 'Productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 281, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143005', 280, 'Productos manufacturados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 282, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143010', 280,
        'Productos extraídos y/o procesados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 283, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143015', 280, 'Productos agrícolas y forestales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 284, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143020', 280, 'Subproductos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 285, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143025', 280, 'Productos de pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 286, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143099', 280, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 287, 'CO-PUC', 'Activos inventarios', 'xx xx', '1435', 265,
        'Mercancías no fabricadas por la empresa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 288, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '143599', 287, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 289, 'CO-PUC', 'Activos inventarios', 'xx xx', '1440', 265, 'Bienes raíces para la venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 290, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '144099', 289, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 291, 'CO-PUC', 'Activos inventarios', 'xx xx', '1445', 265, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 292, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '144599', 291, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 293, 'CO-PUC', 'Activos inventarios', 'xx xx', '1450', 265, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 294, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '145005', 293, 'Por urbanizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 295, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '145010', 293, 'Urbanizados por construir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 296, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '145099', 293, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 297, 'CO-PUC', 'Activos inventarios', 'xx xx', '1455', 265, 'Materiales, repuestos y accesorios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 298, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '145599', 297, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 299, 'CO-PUC', 'Activos inventarios', 'xx xx', '1460', 265, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 300, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '146099', 299, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 301, 'CO-PUC', 'Activos inventarios', 'xx xx', '1465', 265, 'Inventarios en tránsito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 302, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '146599', 301, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 303, 'CO-PUC', 'Activos inventarios', 'xx xx', '1499', 265, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 304, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '149905', 303, 'Para obsolescencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 305, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '149910', 303,
        'Para diferencia de inventario físico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 306, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '149915', 303, 'Para pérdidas de inventarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 307, 'CO-PUC', 'Activos inventarios', 'xx xx xx', '149920', 303, 'Lifo', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 308, 'CO-PUC', 'Activos', 'xx', '15', 1, 'Propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 309, 'CO-PUC', 'Activos ppye', 'xx xx', '1504', 308, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 310, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150405', 309, 'Urbanos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 311, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150410', 309, 'Rurales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 312, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150499', 309, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 313, 'CO-PUC', 'Activos ppye', 'xx xx', '1506', 308, 'Materiales proyectos petroleros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 314, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150605', 313, 'Tuberías y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 315, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150610', 313, 'Costos de importación materiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 316, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150615', 313, 'Proyectos de construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 317, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150699', 313, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 318, 'CO-PUC', 'Activos ppye', 'xx xx', '1508', 308, 'Construcciones en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 319, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150805', 318, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 320, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150810', 318, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 321, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150815', 318, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 322, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150820', 318, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 323, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150825', 318, 'Proyectos de exploración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 324, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150830', 318, 'Proyectos de desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 325, 'CO-PUC', 'Activos ppye', 'xx xx xx', '150899', 318, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 326, 'CO-PUC', 'Activos ppye', 'xx xx', '1512', 308, 'Maquinaria y equipos en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 327, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151205', 326, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 328, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151210', 326, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 329, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151215', 326, 'Equipo de computación y comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 330, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151220', 326, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 331, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151225', 326, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 332, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151230', 326, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 333, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151235', 326, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 334, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151240', 326, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 335, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151245', 326, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 336, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151250', 326, 'Plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 337, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151299', 326, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 338, 'CO-PUC', 'Activos ppye', 'xx xx', '1516', 308, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 339, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151605', 338, 'Edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 340, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151610', 338, 'Oficinas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 341, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151615', 338, 'Almacenes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 342, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151620', 338, 'Fábricas y plantas industriales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 343, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151625', 338, 'Salas de exhibición y ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 344, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151630', 338, 'Cafetería y casinos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 345, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151635', 338, 'Silos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 346, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151640', 338, 'Invernaderos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 347, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151645', 338, 'Casetas y campamentos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 348, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151650', 338, 'Instalaciones agropecuarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 349, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151655', 338, 'Viviendas para empleados y obreros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 350, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151660', 338, 'Terminal de buses y taxis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 351, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151663', 338, 'Terminal marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 352, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151665', 338, 'Terminal férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 353, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151670', 338, 'Parqueaderos, garajes y depósitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 354, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151675', 338, 'Hangares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 355, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151680', 338, 'Bodegas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 356, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151695', 338, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 357, 'CO-PUC', 'Activos ppye', 'xx xx xx', '151699', 338, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 358, 'CO-PUC', 'Activos ppye', 'xx xx', '1520', 308, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 359, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152099', 358, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 360, 'CO-PUC', 'Activos ppye', 'xx xx', '1524', 308, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 361, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152405', 360, 'Muebles y enseres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 362, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152410', 360, 'Equipos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 363, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152495', 360, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 364, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152499', 360, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 365, 'CO-PUC', 'Activos ppye', 'xx xx', '1528', 308, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 366, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152805', 365, 'Equipos de procesamiento de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 367, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152810', 365, 'Equipos de telecomunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 368, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152815', 365, 'Equipos de radio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 369, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152820', 365, 'Satélites y antenas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 370, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152825', 365, 'Líneas telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 371, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152895', 365, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 372, 'CO-PUC', 'Activos ppye', 'xx xx xx', '152899', 365, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 373, 'CO-PUC', 'Activos ppye', 'xx xx', '1532', 308, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 374, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153205', 373, 'Médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 375, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153210', 373, 'Odontológico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 376, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153215', 373, 'Laboratorio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 377, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153220', 373, 'Instrumental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 378, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153295', 373, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 379, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153299', 373, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 380, 'CO-PUC', 'Activos ppye', 'xx xx', '1536', 308, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 381, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153605', 380, 'De habitaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 382, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153610', 380, 'De comestibles y bebidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 383, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153695', 380, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 384, 'CO-PUC', 'Activos ppye', 'xx xx xx', '153699', 380, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 385, 'CO-PUC', 'Activos ppye', 'xx xx', '1540', 308, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 386, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154005', 385, 'Autos, camionetas y camperos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 387, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154008', 385, 'Camiones, volquetas y furgones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 388, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154010', 385, 'Tractomulas y remolques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 389, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154015', 385, 'Buses y busetas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 390, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154017', 385, 'Recolectores y contenedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 391, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154020', 385, 'Montacargas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 392, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154025', 385, 'Palas y grúas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 393, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154030', 385, 'Motocicletas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 394, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154035', 385, 'Bicicletas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 395, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154040', 385, 'Estibas y carretas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 396, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154045', 385, 'Bandas transportadoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 397, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154095', 385, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 398, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154099', 385, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 399, 'CO-PUC', 'Activos ppye', 'xx xx', '1544', 308, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 400, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154405', 399, 'Buques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 401, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154410', 399, 'Lanchas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 402, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154415', 399, 'Remolcadoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 403, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154420', 399, 'Botes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 404, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154425', 399, 'Boyas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 405, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154430', 399, 'Amarres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 406, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154435', 399, 'Contenedores y chasises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 407, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154440', 399, 'Gabarras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 408, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154495', 399, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 409, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154499', 399, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 410, 'CO-PUC', 'Activos ppye', 'xx xx', '1548', 308, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 411, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154805', 410, 'Aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 412, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154810', 410, 'Avionetas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 413, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154815', 410, 'Helicópteros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 414, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154820', 410, 'Turbinas y motores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 415, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154825', 410,
        'Manuales de entrenamiento personal técnico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 416, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154830', 410, 'Equipos de vuelo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 417, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154895', 410, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 418, 'CO-PUC', 'Activos ppye', 'xx xx xx', '154899', 410, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 419, 'CO-PUC', 'Activos ppye', 'xx xx', '1552', 308, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 420, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155205', 419, 'Locomotoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 421, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155210', 419, 'Vagones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 422, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155215', 419, 'Redes férreas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 423, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155295', 419, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 424, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155299', 419, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 425, 'CO-PUC', 'Activos ppye', 'xx xx', '1556', 308, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 426, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155605', 425, 'Instalaciones para agua y energía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 427, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155610', 425, 'Acueducto, acequias y canalizaciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 428, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155615', 425, 'Plantas de generación hidráulica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 429, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155620', 425, 'Plantas de generación térmica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 430, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155625', 425, 'Plantas de generación a gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 431, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155628', 425,
        'Plantas de generación diesel, gasolina y petróleo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 432, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155630', 425, 'Plantas de distribución', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 433, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155635', 425, 'Plantas de transmisión y subestaciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 434, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155640', 425, 'Oleoductos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 435, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155645', 425, 'Gasoductos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 436, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155647', 425, 'Poliductos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 437, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155650', 425, 'Redes de distribución', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 438, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155655', 425, 'Plantas de tratamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 439, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155660', 425, 'Redes de recolección de aguas negras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 440, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155665', 425, 'Instalaciones y equipo de bombeo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 441, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155670', 425, 'Redes de distribución de vapor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 442, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155675', 425, 'Redes de aire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 443, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155680', 425, 'Redes alimentación de gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 444, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155682', 425, 'Redes externas de telefonía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 445, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155685', 425, 'Plantas deshidratadoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 446, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155695', 425, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 447, 'CO-PUC', 'Activos ppye', 'xx xx xx', '155699', 425, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 448, 'CO-PUC', 'Activos ppye', 'xx xx', '1560', 308, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 449, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156099', 448, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 450, 'CO-PUC', 'Activos ppye', 'xx xx', '1562', 308, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 451, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156299', 450, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 452, 'CO-PUC', 'Activos ppye', 'xx xx', '1564', 308, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 453, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156405', 452, 'Cultivos en desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 454, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156410', 452, 'Cultivos amortizables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 455, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156499', 452, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 456, 'CO-PUC', 'Activos ppye', 'xx xx', '1568', 308, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 457, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156805', 456, 'Pavimentación y patios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 458, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156810', 456, 'Vías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 459, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156815', 456, 'Puentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 460, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156820', 456, 'Calles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 461, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156825', 456, 'Aeródromos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 462, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156895', 456, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 463, 'CO-PUC', 'Activos ppye', 'xx xx xx', '156899', 456, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 464, 'CO-PUC', 'Activos ppye', 'xx xx', '1572', 308, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 465, 'CO-PUC', 'Activos ppye', 'xx xx xx', '157205', 464, 'Minas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 466, 'CO-PUC', 'Activos ppye', 'xx xx xx', '157210', 464, 'Canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 467, 'CO-PUC', 'Activos ppye', 'xx xx xx', '157299', 464, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 468, 'CO-PUC', 'Activos ppye', 'xx xx', '1576', 308, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 469, 'CO-PUC', 'Activos ppye', 'xx xx xx', '157699', 468, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 470, 'CO-PUC', 'Activos ppye', 'xx xx', '1580', 308, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 471, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158099', 470, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 472, 'CO-PUC', 'Activos ppye', 'xx xx', '1584', 308, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 473, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158499', 472, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 474, 'CO-PUC', 'Activos ppye', 'xx xx', '1588', 308, 'Propiedades, planta y equipo en tránsito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 475, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158805', 474, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 476, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158810', 474, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 477, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158815', 474, 'Equipo de computación y comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 478, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158820', 474, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 479, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158825', 474, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 480, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158830', 474, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 481, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158835', 474, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 482, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158840', 474, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 483, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158845', 474, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 484, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158850', 474, 'Plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 485, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158855', 474, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 486, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158860', 474, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 487, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158865', 474, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 488, 'CO-PUC', 'Activos ppye', 'xx xx xx', '158899', 474, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 489, 'CO-PUC', 'Activos ppye', 'xx xx', '1592', 308, 'Depreciación acumulada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 490, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159205', 489, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 491, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159210', 489, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 492, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159215', 489, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 493, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159220', 489, 'Equipo de computación y comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 494, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159225', 489, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 495, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159230', 489, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 496, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159235', 489, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 497, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159240', 489, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 498, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159245', 489, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 499, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159250', 489, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 500, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159255', 489, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 501, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159260', 489, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 502, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159265', 489, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 503, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159299', 489, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 504, 'CO-PUC', 'Activos ppye', 'xx xx', '1596', 308, 'Depreciación diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 505, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159605', 504, 'Exceso fiscal sobre la contable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 506, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159610', 504, 'Defecto fiscal sobre la contable (CR)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 507, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159699', 504, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 508, 'CO-PUC', 'Activos ppye', 'xx xx', '1597', 308, 'Amortización acumulada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 509, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159705', 508, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 510, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159710', 508, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 511, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159715', 508, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 512, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159799', 508, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 513, 'CO-PUC', 'Activos ppye', 'xx xx', '1598', 308, 'Agotamiento acumulado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 514, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159805', 513, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 515, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159815', 513, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 516, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159820', 513, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 517, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159899', 513, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 518, 'CO-PUC', 'Activos ppye', 'xx xx', '1599', 308, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 519, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159904', 518, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 520, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159906', 518, 'Materiales proyectos petroleros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 521, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159908', 518, 'Construcciones en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 522, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159912', 518, 'Maquinaria en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 523, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159916', 518, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 524, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159920', 518, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 525, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159924', 518, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 526, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159928', 518, 'Equipo de computación y comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 527, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159932', 518, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 528, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159936', 518, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 529, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159940', 518, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 530, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159944', 518, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 531, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159948', 518, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 532, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159952', 518, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 533, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159956', 518, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 534, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159960', 518, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 535, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159962', 518, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 536, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159964', 518, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 537, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159968', 518, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 538, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159972', 518, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 539, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159980', 518, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 540, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159984', 518, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 541, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159988', 518, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 542, 'CO-PUC', 'Activos ppye', 'xx xx xx', '159992', 518,
        'Propiedades, planta y equipo en tránsito', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 543, 'CO-PUC', 'Activos', 'xx', '16', 1, 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 544, 'CO-PUC', 'Activos intangibles', 'xx xx', '1605', 543, 'Crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 545, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '160505', 544, 'Formado o estimado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 546, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '160510', 544, 'Adquirido o comprado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 547, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '160599', 544, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 548, 'CO-PUC', 'Activos intangibles', 'xx xx', '1610', 543, 'Marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 549, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161005', 548, 'Adquiridas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 550, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161010', 548, 'Formadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 551, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161099', 548, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 552, 'CO-PUC', 'Activos intangibles', 'xx xx', '1615', 543, 'Patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 553, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161505', 552, 'Adquiridas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 554, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161510', 552, 'Formadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 555, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '161599', 552, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 556, 'CO-PUC', 'Activos intangibles', 'xx xx', '1620', 543, 'Concesiones y franquicias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 557, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162005', 556, 'Concesiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 558, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162010', 556, 'Franquicias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 559, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162099', 556, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 560, 'CO-PUC', 'Activos intangibles', 'xx xx', '1625', 543, 'Derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 561, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162505', 560, 'Derechos de autor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 562, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162510', 560, 'Puesto de bolsa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 563, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162515', 560, 'En fideicomisos inmobiliarios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 564, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162520', 560, 'En fideicomisos de garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 565, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162525', 560,
        'En fideicomisos de administración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 566, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162530', 560, 'De exhibición - películas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 567, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162535', 560,
        'En bienes recibidos en arrendamiento financiero (leasing)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 568, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162595', 560, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 569, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '162599', 560, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 570, 'CO-PUC', 'Activos intangibles', 'xx xx', '1630', 543, 'Know how', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 571, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '163099', 570, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 572, 'CO-PUC', 'Activos intangibles', 'xx xx', '1635', 543, 'Licencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 573, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '163599', 572, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 574, 'CO-PUC', 'Activos intangibles', 'xx xx', '1698', 543,
        'Depreciación y/o amortización acumulada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 575, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169805', 574, 'Crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 576, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169810', 574, 'Marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 577, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169815', 574, 'Patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 578, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169820', 574, 'Concesiones y franquicias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 579, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169830', 574, 'Derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 580, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169835', 574, 'Know how', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 581, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169840', 574, 'Licencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 582, 'CO-PUC', 'Activos intangibles', 'xx xx xx', '169899', 574, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 583, 'CO-PUC', 'Activos intangibles', 'xx xx', '1699', 543, 'Provisiones', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 584, 'CO-PUC', 'Activos', 'xx', '17', 1, 'Diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 585, 'CO-PUC', 'Activos diferidos', 'xx xx', '1705', 584, 'Gastos pagados por anticipado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 586, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170505', 585, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 587, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170510', 585, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 588, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170515', 585, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 589, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170520', 585, 'Seguros y fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 590, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170525', 585, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 591, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170530', 585, 'Bodegajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 592, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170535', 585, 'Mantenimiento equipos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 593, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170540', 585, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 594, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170545', 585, 'Suscripciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 595, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '170595', 585, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 596, 'CO-PUC', 'Activos diferidos', 'xx xx', '1710', 584, 'Cargos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 597, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171004', 596, 'Organización y preoperativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 598, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171008', 596, 'Remodelaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 599, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171012', 596,
        'Estudios, investigaciones y proyectos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 600, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171016', 596,
        'Programas para computador (software)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 601, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171020', 596, 'Útiles y papelería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 602, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171024', 596, 'Mejoras a propiedades ajenas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 603, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171028', 596, 'Contribuciones y afiliaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 604, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171032', 596, 'Entrenamiento de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 605, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171036', 596, 'Ferias y exposiciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 606, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171040', 596, 'Licencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 607, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171044', 596, 'Publicidad, propaganda y promoción',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 608, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171048', 596, 'Elementos de aseo y cafetería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 609, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171052', 596, 'Moldes y troqueles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 610, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171056', 596, 'Instrumental quirúrgico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 611, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171060', 596,
        'Dotación y suministro a trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 612, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171064', 596, 'Elementos de ropería y lencería',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 613, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171068', 596, 'Loza y cristalería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 614, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171069', 596, 'Platería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 615, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171070', 596, 'Cubiertería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 616, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171076', 596,
        'Impuesto de renta diferido ?débitos? por diferencias temporales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 617, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171080', 596, 'Concursos y licitaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 618, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171095', 596, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 619, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171099', 596, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 620, 'CO-PUC', 'Activos diferidos', 'xx xx', '1715', 584, 'Costos de exploración por amortizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 621, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171505', 620, 'Pozos secos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 622, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171510', 620, 'Pozos no comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 623, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171515', 620, 'Otros costos de exploración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 624, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '171599', 620, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 625, 'CO-PUC', 'Activos diferidos', 'xx xx', '1720', 584, 'Costos de explotación y desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 626, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '172005', 625, 'Perforación y explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 627, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '172010', 625, 'Perforaciones campos en desarrollo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 628, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '172015', 625, 'Facilidades de producción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 629, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '172020', 625, 'Servicio a pozos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 630, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '172099', 625, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 631, 'CO-PUC', 'Activos diferidos', 'xx xx', '1730', 584,
        'Cargos por corrección monetaria diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 632, 'CO-PUC', 'Activos diferidos', 'xx xx', '1798', 584, 'Amortización acumulada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 633, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '179805', 632,
        'Costos de exploración por amortizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 634, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '179810', 632, 'Costos de explotación y desarrollo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 635, 'CO-PUC', 'Activos diferidos', 'xx xx xx', '179899', 632, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 636, 'CO-PUC', 'Activos', 'xx', '18', 1, 'Otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 637, 'CO-PUC', 'Activos otros activos', 'xx xx', '1805', 636, 'Bienes de arte y cultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 638, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '180505', 637, 'Obras de arte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 639, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '180510', 637, 'Bibliotecas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 640, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '180595', 637, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 641, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '180599', 637, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 642, 'CO-PUC', 'Activos otros activos', 'xx xx', '1895', 636, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 643, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189505', 642, 'Máquinas porteadoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 644, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189510', 642, 'Bienes entregados en comodato',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 645, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189515', 642,
        'Amortización acumulada de bienes entregados en comodato (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 646, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189520', 642, 'Bienes recibidos en pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 647, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189525', 642, 'Derechos sucesorales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 648, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189530', 642, 'Estampillas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 649, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189595', 642, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 650, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189599', 642, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 651, 'CO-PUC', 'Activos otros activos', 'xx xx', '1899', 636, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 652, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189905', 651, 'Bienes de arte y cultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 653, 'CO-PUC', 'Activos otros activos', 'xx xx xx', '189995', 651, 'Diversos', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 654, 'CO-PUC', 'Activos', 'xx', '19', 1, 'Valorizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 655, 'CO-PUC', 'Activos valorizaciones', 'xx xx', '1905', 654, 'De inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 656, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '190505', 655, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 657, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '190510', 655,
        'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 658, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '190515', 655, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 659, 'CO-PUC', 'Activos valorizaciones', 'xx xx', '1910', 654, 'De propiedades, planta y equipo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 660, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191004', 659, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 661, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191006', 659,
        'Materiales proyectos petroleros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 662, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191008', 659,
        'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 663, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191012', 659, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 664, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191016', 659, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 665, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191020', 659,
        'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 666, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191024', 659, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 667, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191028', 659,
        'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 668, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191032', 659, 'Flota y equipo de transporte',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 669, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191036', 659,
        'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 670, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191040', 659, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 671, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191044', 659, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 672, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191048', 659, 'Acueductos, plantas y redes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 673, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191052', 659, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 674, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191056', 659, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 675, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191060', 659,
        'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 676, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191064', 659, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 677, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191068', 659, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 678, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191072', 659, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 679, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191076', 659, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 680, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '191080', 659, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 681, 'CO-PUC', 'Activos valorizaciones', 'xx xx', '1995', 654, 'De otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 682, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '199505', 681, 'Bienes de arte y cultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 683, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '199510', 681, 'Bienes entregados en comodato',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 684, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '199515', 681, 'Bienes recibidos en pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 685, 'CO-PUC', 'Activos valorizaciones', 'xx xx xx', '199520', 681, 'Inventario de semovientes', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 686, 'CO-PUC', 'Pasivos', 'x', '2', 0, 'Pasivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 687, 'CO-PUC', 'Pasivos', 'xx', '21', 686, 'Obligaciones financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 688, 'CO-PUC', 'Pasivos', 'xx xx', '2105', 687, 'Bancos nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 689, 'CO-PUC', 'Pasivos', 'xx xx xx', '210505', 688, 'Sobregiros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 690, 'CO-PUC', 'Pasivos', 'xx xx xx', '210510', 688, 'Pagarés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 691, 'CO-PUC', 'Pasivos', 'xx xx xx', '210515', 688, 'Cartas de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 692, 'CO-PUC', 'Pasivos', 'xx xx xx', '210520', 688, 'Aceptaciones bancarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 693, 'CO-PUC', 'Pasivos', 'xx xx', '2110', 687, 'Bancos del exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 694, 'CO-PUC', 'Pasivos', 'xx xx xx', '211005', 693, 'Sobregiros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 695, 'CO-PUC', 'Pasivos', 'xx xx xx', '211010', 693, 'Pagarés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 696, 'CO-PUC', 'Pasivos', 'xx xx xx', '211015', 693, 'Cartas de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 697, 'CO-PUC', 'Pasivos', 'xx xx xx', '211020', 693, 'Aceptaciones bancarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 698, 'CO-PUC', 'Pasivos', 'xx xx', '2115', 687, 'Corporaciones financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 699, 'CO-PUC', 'Pasivos', 'xx xx xx', '211505', 698, 'Pagarés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 700, 'CO-PUC', 'Pasivos', 'xx xx xx', '211510', 698, 'Aceptaciones financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 701, 'CO-PUC', 'Pasivos', 'xx xx xx', '211515', 698, 'Cartas de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 702, 'CO-PUC', 'Pasivos', 'xx xx xx', '211520', 698,
        'Contratos de arrendamiento financiero (leasing)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 703, 'CO-PUC', 'Pasivos', 'xx xx', '2120', 687, 'Compañías de financiamiento comercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 704, 'CO-PUC', 'Pasivos', 'xx xx xx', '212005', 703, 'Pagarés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 705, 'CO-PUC', 'Pasivos', 'xx xx xx', '212010', 703, 'Aceptaciones financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 706, 'CO-PUC', 'Pasivos', 'xx xx xx', '212020', 703,
        'Contratos de arrendamiento financiero (leasing)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 707, 'CO-PUC', 'Pasivos', 'xx xx', '2125', 687, 'Corporaciones de ahorro y vivienda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 708, 'CO-PUC', 'Pasivos', 'xx xx xx', '212505', 707, 'Sobregiros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 709, 'CO-PUC', 'Pasivos', 'xx xx xx', '212510', 707, 'Pagarés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 710, 'CO-PUC', 'Pasivos', 'xx xx xx', '212515', 707, 'Hipotecarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 711, 'CO-PUC', 'Pasivos', 'xx xx', '2130', 687, 'Entidades financieras del exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 712, 'CO-PUC', 'Pasivos', 'xx xx', '2135', 687, 'Compromisos de recompra de inversiones negociadas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 713, 'CO-PUC', 'Pasivos', 'xx xx xx', '213505', 712, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 714, 'CO-PUC', 'Pasivos', 'xx xx xx', '213510', 712, 'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 715, 'CO-PUC', 'Pasivos', 'xx xx xx', '213515', 712, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 716, 'CO-PUC', 'Pasivos', 'xx xx xx', '213520', 712, 'Cédulas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 717, 'CO-PUC', 'Pasivos', 'xx xx xx', '213525', 712, 'Certificados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 718, 'CO-PUC', 'Pasivos', 'xx xx xx', '213530', 712, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 719, 'CO-PUC', 'Pasivos', 'xx xx xx', '213535', 712, 'Títulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 720, 'CO-PUC', 'Pasivos', 'xx xx xx', '213540', 712, 'Aceptaciones bancarias o financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 721, 'CO-PUC', 'Pasivos', 'xx xx xx', '213595', 712, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 722, 'CO-PUC', 'Pasivos', 'xx xx', '2140', 687, 'Compromisos de recompra de cartera negociada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 723, 'CO-PUC', 'Pasivos', 'xx xx', '2145', 687, 'Obligaciones gubernamentales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 724, 'CO-PUC', 'Pasivos', 'xx xx xx', '214505', 723, 'Gobierno Nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 725, 'CO-PUC', 'Pasivos', 'xx xx xx', '214510', 723, 'Entidades oficiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 726, 'CO-PUC', 'Pasivos', 'xx xx', '2195', 687, 'Otras obligaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 727, 'CO-PUC', 'Pasivos', 'xx xx xx', '219505', 726, 'Particulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 728, 'CO-PUC', 'Pasivos', 'xx xx xx', '219510', 726, 'Compañías vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 729, 'CO-PUC', 'Pasivos', 'xx xx xx', '219515', 726, 'Casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 730, 'CO-PUC', 'Pasivos', 'xx xx xx', '219520', 726, 'Socios o accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 731, 'CO-PUC', 'Pasivos', 'xx xx xx', '219525', 726, 'Fondos y cooperativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 732, 'CO-PUC', 'Pasivos', 'xx xx xx', '219530', 726, 'Directores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 733, 'CO-PUC', 'Pasivos', 'xx xx xx', '219595', 726, 'Otras', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 734, 'CO-PUC', 'Pasivos', 'xx', '22', 686, 'Proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 735, 'CO-PUC', 'Pasivos', 'xx xx', '2205', 734, 'Nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 736, 'CO-PUC', 'Pasivos', 'xx xx', '2210', 734, 'Del exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 737, 'CO-PUC', 'Pasivos', 'xx xx', '2215', 734, 'Cuentas corrientes comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 738, 'CO-PUC', 'Pasivos', 'xx xx', '2220', 734, 'Casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 739, 'CO-PUC', 'Pasivos', 'xx xx', '2225', 734, 'Compañías vinculadas', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 740, 'CO-PUC', 'Pasivos', 'xx', '23', 686, 'Cuentas por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 741, 'CO-PUC', 'Pasivos', 'xx xx', '2305', 740, 'Cuentas corrientes comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 742, 'CO-PUC', 'Pasivos', 'xx xx', '2310', 740, 'A casa matriz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 743, 'CO-PUC', 'Pasivos', 'xx xx', '2315', 740, 'A compañías vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 744, 'CO-PUC', 'Pasivos', 'xx xx', '2320', 740, 'A contratistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 745, 'CO-PUC', 'Pasivos', 'xx xx', '2330', 740, 'Órdenes de compra por utilizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 746, 'CO-PUC', 'Pasivos', 'xx xx', '2335', 740, 'Costos y gastos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 747, 'CO-PUC', 'Pasivos', 'xx xx xx', '233505', 746, 'Gastos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 748, 'CO-PUC', 'Pasivos', 'xx xx xx', '233510', 746, 'Gastos legales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 749, 'CO-PUC', 'Pasivos', 'xx xx xx', '233515', 746, 'Libros, suscripciones, periódicos y revistas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 750, 'CO-PUC', 'Pasivos', 'xx xx xx', '233520', 746, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 751, 'CO-PUC', 'Pasivos', 'xx xx xx', '233525', 746, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 752, 'CO-PUC', 'Pasivos', 'xx xx xx', '233530', 746, 'Servicios técnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 753, 'CO-PUC', 'Pasivos', 'xx xx xx', '233535', 746, 'Servicios de mantenimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 754, 'CO-PUC', 'Pasivos', 'xx xx xx', '233540', 746, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 755, 'CO-PUC', 'Pasivos', 'xx xx xx', '233545', 746, 'Transportes, fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 756, 'CO-PUC', 'Pasivos', 'xx xx xx', '233550', 746, 'Servicios públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 757, 'CO-PUC', 'Pasivos', 'xx xx xx', '233555', 746, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 758, 'CO-PUC', 'Pasivos', 'xx xx xx', '233560', 746, 'Gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 759, 'CO-PUC', 'Pasivos', 'xx xx xx', '233565', 746,
        'Gastos de representación y relaciones públicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 760, 'CO-PUC', 'Pasivos', 'xx xx xx', '233570', 746, 'Servicios aduaneros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 761, 'CO-PUC', 'Pasivos', 'xx xx xx', '233595', 746, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 762, 'CO-PUC', 'Pasivos', 'xx xx', '2340', 740, 'Instalamentos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 763, 'CO-PUC', 'Pasivos', 'xx xx', '2345', 740, 'Acreedores oficiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 764, 'CO-PUC', 'Pasivos', 'xx xx', '2350', 740, 'Regalías por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 765, 'CO-PUC', 'Pasivos', 'xx xx', '2355', 740, 'Deudas con accionistas o socios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 766, 'CO-PUC', 'Pasivos', 'xx xx xx', '235505', 765, 'Accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 767, 'CO-PUC', 'Pasivos', 'xx xx xx', '235510', 765, 'Socios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 768, 'CO-PUC', 'Pasivos', 'xx xx', '2357', 740, 'Deudas con directores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 769, 'CO-PUC', 'Pasivos', 'xx xx', '2360', 740, 'Dividendos o participaciones por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 770, 'CO-PUC', 'Pasivos', 'xx xx xx', '236005', 769, 'Dividendos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 771, 'CO-PUC', 'Pasivos', 'xx xx xx', '236010', 769, 'Participaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 772, 'CO-PUC', 'Pasivos', 'xx xx', '2365', 740, 'Retención en la fuente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 773, 'CO-PUC', 'Pasivos', 'xx xx xx', '236505', 772, 'Salarios y pagos laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 774, 'CO-PUC', 'Pasivos', 'xx xx xx', '236510', 772, 'Dividendos y/o participaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 775, 'CO-PUC', 'Pasivos', 'xx xx xx', '236515', 772, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 776, 'CO-PUC', 'Pasivos', 'xx xx xx', '236520', 772, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 777, 'CO-PUC', 'Pasivos', 'xx xx xx', '236525', 772, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 778, 'CO-PUC', 'Pasivos', 'xx xx xx', '236530', 772, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 779, 'CO-PUC', 'Pasivos', 'xx xx xx', '236535', 772, 'Rendimientos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 780, 'CO-PUC', 'Pasivos', 'xx xx xx', '236540', 772, 'Compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 781, 'CO-PUC', 'Pasivos', 'xx xx xx', '236545', 772, 'Loterías, rifas, apuestas y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 782, 'CO-PUC', 'Pasivos', 'xx xx xx', '236550', 772, 'Por pagos al exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 783, 'CO-PUC', 'Pasivos', 'xx xx xx', '236555', 772, 'Por ingresos obtenidos en el exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 784, 'CO-PUC', 'Pasivos', 'xx xx xx', '236560', 772,
        'Enajenación propiedades planta y equipo, personas naturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 785, 'CO-PUC', 'Pasivos', 'xx xx xx', '236565', 772, 'Por impuesto de timbre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 786, 'CO-PUC', 'Pasivos', 'xx xx xx', '236570', 772, 'Otras retenciones y patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 787, 'CO-PUC', 'Pasivos', 'xx xx xx', '236575', 772, 'Autorretenciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 788, 'CO-PUC', 'Pasivos', 'xx xx', '2367', 740, 'Impuesto a las ventas retenido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 789, 'CO-PUC', 'Pasivos', 'xx xx', '2368', 740, 'Impuesto de industria y comercio retenido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 790, 'CO-PUC', 'Pasivos', 'xx xx', '2370', 740, 'Retenciones y aportes de nómina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 791, 'CO-PUC', 'Pasivos', 'xx xx xx', '237005', 790, 'Aportes a entidades promotoras de salud, EPS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 792, 'CO-PUC', 'Pasivos', 'xx xx xx', '237006', 790,
        'Aportes a administradoras de riesgos profesionales, ARP', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 793, 'CO-PUC', 'Pasivos', 'xx xx xx', '237010', 790,
        'Aportes al ICBF, SENA y cajas de compensación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 794, 'CO-PUC', 'Pasivos', 'xx xx xx', '237015', 790, 'Aportes al FIC', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 795, 'CO-PUC', 'Pasivos', 'xx xx xx', '237025', 790, 'Embargos judiciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 796, 'CO-PUC', 'Pasivos', 'xx xx xx', '237030', 790, 'Libranzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 797, 'CO-PUC', 'Pasivos', 'xx xx xx', '237035', 790, 'Sindicatos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 798, 'CO-PUC', 'Pasivos', 'xx xx xx', '237040', 790, 'Cooperativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 799, 'CO-PUC', 'Pasivos', 'xx xx xx', '237045', 790, 'Fondos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 800, 'CO-PUC', 'Pasivos', 'xx xx xx', '237095', 790, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 801, 'CO-PUC', 'Pasivos', 'xx xx', '2375', 740, 'Cuotas por devolver', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 802, 'CO-PUC', 'Pasivos', 'xx xx', '2380', 740, 'Acreedores varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 803, 'CO-PUC', 'Pasivos', 'xx xx xx', '238005', 802, 'Depositarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 804, 'CO-PUC', 'Pasivos', 'xx xx xx', '238010', 802, 'Comisionistas de bolsas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 805, 'CO-PUC', 'Pasivos', 'xx xx xx', '238015', 802, 'Sociedad administradora-Fondos de inversión',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 806, 'CO-PUC', 'Pasivos', 'xx xx xx', '238020', 802, 'Reintegros por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 807, 'CO-PUC', 'Pasivos', 'xx xx xx', '238025', 802, 'Fondo de perseverancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 808, 'CO-PUC', 'Pasivos', 'xx xx xx', '238030', 802, 'Fondos de cesantías y/o pensiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 809, 'CO-PUC', 'Pasivos', 'xx xx xx', '238035', 802, 'Donaciones asignadas por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 810, 'CO-PUC', 'Pasivos', 'xx xx xx', '238095', 802, 'Otros', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 811, 'CO-PUC', 'Pasivos', 'xx', '24', 686, 'Impuestos, gravámenes y tasas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 812, 'CO-PUC', 'Pasivos', 'xx xx', '2404', 811, 'De renta y complementarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 813, 'CO-PUC', 'Pasivos', 'xx xx xx', '240405', 812, 'Vigencia fiscal corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 814, 'CO-PUC', 'Pasivos', 'xx xx xx', '240410', 812, 'Vigencias fiscales anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 815, 'CO-PUC', 'Pasivos', 'xx xx', '2408', 811, 'Impuesto sobre las ventas por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 816, 'CO-PUC', 'Pasivos', 'xx xx', '2412', 811, 'De industria y comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 817, 'CO-PUC', 'Pasivos', 'xx xx xx', '241205', 816, 'Vigencia fiscal corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 818, 'CO-PUC', 'Pasivos', 'xx xx xx', '241210', 816, 'Vigencias fiscales anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 819, 'CO-PUC', 'Pasivos', 'xx xx', '2416', 811, 'A la propiedad raíz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 820, 'CO-PUC', 'Pasivos', 'xx xx', '2420', 811, 'Derechos sobre instrumentos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 821, 'CO-PUC', 'Pasivos', 'xx xx', '2424', 811, 'De valorización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 822, 'CO-PUC', 'Pasivos', 'xx xx xx', '242405', 821, 'Vigencia fiscal corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 823, 'CO-PUC', 'Pasivos', 'xx xx xx', '242410', 821, 'Vigencias fiscales anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 824, 'CO-PUC', 'Pasivos', 'xx xx', '2428', 811, 'De turismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 825, 'CO-PUC', 'Pasivos', 'xx xx', '2432', 811, 'Tasa por utilización de puertos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 826, 'CO-PUC', 'Pasivos', 'xx xx', '2436', 811, 'De vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 827, 'CO-PUC', 'Pasivos', 'xx xx xx', '243605', 826, 'Vigencia fiscal corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 828, 'CO-PUC', 'Pasivos', 'xx xx xx', '243610', 826, 'Vigencias fiscales anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 829, 'CO-PUC', 'Pasivos', 'xx xx', '2440', 811, 'De espectáculos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 830, 'CO-PUC', 'Pasivos', 'xx xx', '2444', 811, 'De hidrocarburos y minas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 831, 'CO-PUC', 'Pasivos', 'xx xx xx', '244405', 830, 'De hidrocarburos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 832, 'CO-PUC', 'Pasivos', 'xx xx xx', '244410', 830, 'De minas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 833, 'CO-PUC', 'Pasivos', 'xx xx', '2448', 811,
        'Regalías e impuestos a la pequeña y mediana minería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 834, 'CO-PUC', 'Pasivos', 'xx xx', '2452', 811, 'A las exportaciones cafeteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 835, 'CO-PUC', 'Pasivos', 'xx xx', '2456', 811, 'A las importaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 836, 'CO-PUC', 'Pasivos', 'xx xx', '2460', 811, 'Cuotas de fomento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 837, 'CO-PUC', 'Pasivos', 'xx xx', '2464', 811, 'De licores, cervezas y cigarrillos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 838, 'CO-PUC', 'Pasivos', 'xx xx xx', '246405', 837, 'De licores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 839, 'CO-PUC', 'Pasivos', 'xx xx xx', '246410', 837, 'De cervezas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 840, 'CO-PUC', 'Pasivos', 'xx xx xx', '246415', 837, 'De cigarrillos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 841, 'CO-PUC', 'Pasivos', 'xx xx', '2468', 811, 'Al sacrificio de ganado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 842, 'CO-PUC', 'Pasivos', 'xx xx', '2472', 811, 'Al azar y juegos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 843, 'CO-PUC', 'Pasivos', 'xx xx', '2476', 811, 'Gravámenes y regalías por utilización del suelo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 844, 'CO-PUC', 'Pasivos', 'xx xx', '2495', 811, 'Otros', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 845, 'CO-PUC', 'Pasivos', 'xx', '25', 686, 'Obligaciones laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 846, 'CO-PUC', 'Pasivos', 'xx xx', '2505', 845, 'Salarios por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 847, 'CO-PUC', 'Pasivos', 'xx xx', '2510', 845, 'Cesantías consolidadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 848, 'CO-PUC', 'Pasivos', 'xx xx xx', '251005', 847, 'Ley laboral anterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 849, 'CO-PUC', 'Pasivos', 'xx xx xx', '251010', 847, 'Ley 50 de 1990 y normas posteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 850, 'CO-PUC', 'Pasivos', 'xx xx', '2515', 845, 'Intereses sobre cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 851, 'CO-PUC', 'Pasivos', 'xx xx', '2520', 845, 'Prima de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 852, 'CO-PUC', 'Pasivos', 'xx xx', '2525', 845, 'Vacaciones consolidadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 853, 'CO-PUC', 'Pasivos', 'xx xx', '2530', 845, 'Prestaciones extralegales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 854, 'CO-PUC', 'Pasivos', 'xx xx xx', '253005', 853, 'Primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 855, 'CO-PUC', 'Pasivos', 'xx xx xx', '253010', 853, 'Auxilios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 856, 'CO-PUC', 'Pasivos', 'xx xx xx', '253015', 853, 'Dotación y suministro a trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 857, 'CO-PUC', 'Pasivos', 'xx xx xx', '253020', 853, 'Bonificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 858, 'CO-PUC', 'Pasivos', 'xx xx xx', '253025', 853, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 859, 'CO-PUC', 'Pasivos', 'xx xx xx', '253095', 853, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 860, 'CO-PUC', 'Pasivos', 'xx xx', '2532', 845, 'Pensiones por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 861, 'CO-PUC', 'Pasivos', 'xx xx', '2535', 845, 'Cuotas partes pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 862, 'CO-PUC', 'Pasivos', 'xx xx', '2540', 845, 'Indemnizaciones laborales', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 863, 'CO-PUC', 'Pasivos', 'xx', '26', 686, 'Pasivos estimados y provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 864, 'CO-PUC', 'Pasivos', 'xx xx', '2605', 863, 'Para costos y gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 865, 'CO-PUC', 'Pasivos', 'xx xx xx', '260505', 864, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 866, 'CO-PUC', 'Pasivos', 'xx xx xx', '260510', 864, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 867, 'CO-PUC', 'Pasivos', 'xx xx xx', '260515', 864, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 868, 'CO-PUC', 'Pasivos', 'xx xx xx', '260520', 864, 'Servicios técnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 869, 'CO-PUC', 'Pasivos', 'xx xx xx', '260525', 864, 'Transportes, fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 870, 'CO-PUC', 'Pasivos', 'xx xx xx', '260530', 864, 'Gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 871, 'CO-PUC', 'Pasivos', 'xx xx xx', '260535', 864, 'Servicios públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 872, 'CO-PUC', 'Pasivos', 'xx xx xx', '260540', 864, 'Regalías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 873, 'CO-PUC', 'Pasivos', 'xx xx xx', '260545', 864, 'Garantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 874, 'CO-PUC', 'Pasivos', 'xx xx xx', '260550', 864, 'Materiales y repuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 875, 'CO-PUC', 'Pasivos', 'xx xx xx', '260595', 864, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 876, 'CO-PUC', 'Pasivos', 'xx xx', '2610', 863, 'Para obligaciones laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 877, 'CO-PUC', 'Pasivos', 'xx xx xx', '261005', 876, 'Cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 878, 'CO-PUC', 'Pasivos', 'xx xx xx', '261010', 876, 'Intereses sobre cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 879, 'CO-PUC', 'Pasivos', 'xx xx xx', '261015', 876, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 880, 'CO-PUC', 'Pasivos', 'xx xx xx', '261020', 876, 'Prima de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 881, 'CO-PUC', 'Pasivos', 'xx xx xx', '261025', 876, 'Prestaciones extralegales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 882, 'CO-PUC', 'Pasivos', 'xx xx xx', '261030', 876, 'Viáticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 883, 'CO-PUC', 'Pasivos', 'xx xx xx', '261095', 876, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 884, 'CO-PUC', 'Pasivos', 'xx xx', '2615', 863, 'Para obligaciones fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 885, 'CO-PUC', 'Pasivos', 'xx xx xx', '261505', 884, 'De renta y complementarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 886, 'CO-PUC', 'Pasivos', 'xx xx xx', '261510', 884, 'De industria y comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 887, 'CO-PUC', 'Pasivos', 'xx xx xx', '261515', 884, 'Tasa por utilización de puertos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 888, 'CO-PUC', 'Pasivos', 'xx xx xx', '261520', 884, 'De vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 889, 'CO-PUC', 'Pasivos', 'xx xx xx', '261525', 884, 'De hidrocarburos y minas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 890, 'CO-PUC', 'Pasivos', 'xx xx xx', '261595', 884, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 891, 'CO-PUC', 'Pasivos', 'xx xx', '2620', 863, 'Pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 892, 'CO-PUC', 'Pasivos', 'xx xx xx', '262005', 891, 'Cálculo actuarial pensiones de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 893, 'CO-PUC', 'Pasivos', 'xx xx xx', '262010', 891, 'Pensiones de jubilación por amortizar (DB)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 894, 'CO-PUC', 'Pasivos', 'xx xx', '2625', 863, 'Para obras de urbanismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 895, 'CO-PUC', 'Pasivos', 'xx xx xx', '262505', 894, 'Acueducto y alcantarillado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 896, 'CO-PUC', 'Pasivos', 'xx xx xx', '262510', 894, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 897, 'CO-PUC', 'Pasivos', 'xx xx xx', '262515', 894, 'Teléfonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 898, 'CO-PUC', 'Pasivos', 'xx xx xx', '262595', 894, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 899, 'CO-PUC', 'Pasivos', 'xx xx', '2630', 863, 'Para mantenimiento y reparaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 900, 'CO-PUC', 'Pasivos', 'xx xx xx', '263005', 899, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 901, 'CO-PUC', 'Pasivos', 'xx xx xx', '263010', 899, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 902, 'CO-PUC', 'Pasivos', 'xx xx xx', '263015', 899, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 903, 'CO-PUC', 'Pasivos', 'xx xx xx', '263020', 899, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 904, 'CO-PUC', 'Pasivos', 'xx xx xx', '263025', 899, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 905, 'CO-PUC', 'Pasivos', 'xx xx xx', '263030', 899, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 906, 'CO-PUC', 'Pasivos', 'xx xx xx', '263035', 899, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 907, 'CO-PUC', 'Pasivos', 'xx xx xx', '263040', 899, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 908, 'CO-PUC', 'Pasivos', 'xx xx xx', '263045', 899, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 909, 'CO-PUC', 'Pasivos', 'xx xx xx', '263050', 899, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 910, 'CO-PUC', 'Pasivos', 'xx xx xx', '263055', 899, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 911, 'CO-PUC', 'Pasivos', 'xx xx xx', '263060', 899, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 912, 'CO-PUC', 'Pasivos', 'xx xx xx', '263065', 899, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 913, 'CO-PUC', 'Pasivos', 'xx xx xx', '263070', 899, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 914, 'CO-PUC', 'Pasivos', 'xx xx xx', '263075', 899, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 915, 'CO-PUC', 'Pasivos', 'xx xx xx', '263080', 899, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 916, 'CO-PUC', 'Pasivos', 'xx xx xx', '263085', 899, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 917, 'CO-PUC', 'Pasivos', 'xx xx xx', '263095', 899, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 918, 'CO-PUC', 'Pasivos', 'xx xx', '2635', 863, 'Para contingencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 919, 'CO-PUC', 'Pasivos', 'xx xx xx', '263505', 918,
        'Multas y sanciones autoridades administrativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 920, 'CO-PUC', 'Pasivos', 'xx xx xx', '263510', 918, 'Intereses por multas y sanciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 921, 'CO-PUC', 'Pasivos', 'xx xx xx', '263515', 918, 'Reclamos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 922, 'CO-PUC', 'Pasivos', 'xx xx xx', '263520', 918, 'Laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 923, 'CO-PUC', 'Pasivos', 'xx xx xx', '263525', 918, 'Civiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 924, 'CO-PUC', 'Pasivos', 'xx xx xx', '263530', 918, 'Penales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 925, 'CO-PUC', 'Pasivos', 'xx xx xx', '263535', 918, 'Administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 926, 'CO-PUC', 'Pasivos', 'xx xx xx', '263540', 918, 'Comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 927, 'CO-PUC', 'Pasivos', 'xx xx xx', '263595', 918, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 928, 'CO-PUC', 'Pasivos', 'xx xx', '2640', 863, 'Para obligaciones de garantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 929, 'CO-PUC', 'Pasivos', 'xx xx', '2695', 863, 'Provisiones diversas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 930, 'CO-PUC', 'Pasivos', 'xx xx xx', '269505', 929, 'Para beneficencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 931, 'CO-PUC', 'Pasivos', 'xx xx xx', '269510', 929, 'Para comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 932, 'CO-PUC', 'Pasivos', 'xx xx xx', '269515', 929, 'Para pérdida en transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 933, 'CO-PUC', 'Pasivos', 'xx xx xx', '269520', 929, 'Para operación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 934, 'CO-PUC', 'Pasivos', 'xx xx xx', '269525', 929, 'Para protección de bienes agotables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 935, 'CO-PUC', 'Pasivos', 'xx xx xx', '269530', 929, 'Para ajustes en redención de unidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 936, 'CO-PUC', 'Pasivos', 'xx xx xx', '269535', 929, 'Autoseguro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 937, 'CO-PUC', 'Pasivos', 'xx xx xx', '269540', 929,
        'Planes y programas de reforestación y electrificación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 938, 'CO-PUC', 'Pasivos', 'xx xx xx', '269595', 929, 'Otras', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 939, 'CO-PUC', 'Pasivos', 'xx', '27', 686, 'Diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 940, 'CO-PUC', 'Pasivos', 'xx xx', '2705', 939, 'Ingresos recibidos por anticipado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 941, 'CO-PUC', 'Pasivos', 'xx xx xx', '270505', 940, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 942, 'CO-PUC', 'Pasivos', 'xx xx xx', '270510', 940, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 943, 'CO-PUC', 'Pasivos', 'xx xx xx', '270515', 940, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 944, 'CO-PUC', 'Pasivos', 'xx xx xx', '270520', 940, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 945, 'CO-PUC', 'Pasivos', 'xx xx xx', '270525', 940, 'Servicios técnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 946, 'CO-PUC', 'Pasivos', 'xx xx xx', '270530', 940, 'De suscriptores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 947, 'CO-PUC', 'Pasivos', 'xx xx xx', '270535', 940, 'Transportes, fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 948, 'CO-PUC', 'Pasivos', 'xx xx xx', '270540', 940, 'Mercancía en tránsito ya vendida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 949, 'CO-PUC', 'Pasivos', 'xx xx xx', '270545', 940, 'Matrículas y pensiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 950, 'CO-PUC', 'Pasivos', 'xx xx xx', '270550', 940, 'Cuotas de administración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 951, 'CO-PUC', 'Pasivos', 'xx xx xx', '270595', 940, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 952, 'CO-PUC', 'Pasivos', 'xx xx', '2710', 939, 'Abonos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 953, 'CO-PUC', 'Pasivos', 'xx xx xx', '271005', 952, 'Reajuste del sistema', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 954, 'CO-PUC', 'Pasivos', 'xx xx', '2715', 939, 'Utilidad diferida en ventas a plazos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 955, 'CO-PUC', 'Pasivos', 'xx xx', '2720', 939, 'Crédito por corrección monetaria diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 956, 'CO-PUC', 'Pasivos', 'xx xx', '2725', 939, 'Impuestos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 957, 'CO-PUC', 'Pasivos', 'xx xx xx', '272505', 956, 'Por depreciación flexible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 958, 'CO-PUC', 'Pasivos', 'xx xx xx', '272595', 956, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 959, 'CO-PUC', 'Pasivos', 'xx xx xx', '272599', 956, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 960, 'CO-PUC', 'Pasivos', 'xx', '28', 686, 'Otros pasivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 961, 'CO-PUC', 'Pasivos', 'xx xx', '2805', 960, 'Anticipos y avances recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 962, 'CO-PUC', 'Pasivos', 'xx xx xx', '280505', 961, 'De clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 963, 'CO-PUC', 'Pasivos', 'xx xx xx', '280510', 961, 'Sobre contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 964, 'CO-PUC', 'Pasivos', 'xx xx xx', '280515', 961, 'Para obras en proceso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 965, 'CO-PUC', 'Pasivos', 'xx xx xx', '280595', 961, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 966, 'CO-PUC', 'Pasivos', 'xx xx', '2810', 960, 'Depósitos recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 967, 'CO-PUC', 'Pasivos', 'xx xx xx', '281005', 966, 'Para futura suscripción de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 968, 'CO-PUC', 'Pasivos', 'xx xx xx', '281010', 966,
        'Para futuro pago de cuotas o derechos sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 969, 'CO-PUC', 'Pasivos', 'xx xx xx', '281015', 966, 'Para garantía en la prestación de servicios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 970, 'CO-PUC', 'Pasivos', 'xx xx xx', '281020', 966, 'Para garantía de contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 971, 'CO-PUC', 'Pasivos', 'xx xx xx', '281025', 966, 'De licitaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 972, 'CO-PUC', 'Pasivos', 'xx xx xx', '281030', 966, 'De manejo de bienes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 973, 'CO-PUC', 'Pasivos', 'xx xx xx', '281035', 966, 'Fondo de reserva', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 974, 'CO-PUC', 'Pasivos', 'xx xx xx', '281095', 966, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 975, 'CO-PUC', 'Pasivos', 'xx xx', '2815', 960, 'Ingresos recibidos para terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 976, 'CO-PUC', 'Pasivos', 'xx xx xx', '281505', 975, 'Valores recibidos para terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 977, 'CO-PUC', 'Pasivos', 'xx xx xx', '281510', 975, 'Venta por cuenta de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 978, 'CO-PUC', 'Pasivos', 'xx xx', '2820', 960, 'Cuentas de operación conjunta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 979, 'CO-PUC', 'Pasivos', 'xx xx', '2825', 960, 'Retenciones a terceros sobre contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 980, 'CO-PUC', 'Pasivos', 'xx xx xx', '282505', 979, 'Cumplimiento obligaciones laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 981, 'CO-PUC', 'Pasivos', 'xx xx xx', '282510', 979, 'Para estabilidad de obra', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 982, 'CO-PUC', 'Pasivos', 'xx xx xx', '282515', 979, 'Garantía cumplimiento de contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 983, 'CO-PUC', 'Pasivos', 'xx xx', '2830', 960, 'Embargos judiciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 984, 'CO-PUC', 'Pasivos', 'xx xx xx', '283005', 983, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 985, 'CO-PUC', 'Pasivos', 'xx xx xx', '283010', 983, 'Depósitos judiciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 986, 'CO-PUC', 'Pasivos', 'xx xx', '2835', 960, 'Acreedores del sistema', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 987, 'CO-PUC', 'Pasivos', 'xx xx xx', '283505', 986, 'Cuotas netas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 988, 'CO-PUC', 'Pasivos', 'xx xx xx', '283510', 986, 'Grupos en formación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 989, 'CO-PUC', 'Pasivos', 'xx xx', '2840', 960, 'Cuentas en participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 990, 'CO-PUC', 'Pasivos', 'xx xx', '2895', 960, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 991, 'CO-PUC', 'Pasivos', 'xx xx xx', '289505', 990, 'Préstamos de productos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 992, 'CO-PUC', 'Pasivos', 'xx xx xx', '289510', 990, 'Reembolso de costos exploratorios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 993, 'CO-PUC', 'Pasivos', 'xx xx xx', '289515', 990, 'Programa de extensión agropecuaria', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 994, 'CO-PUC', 'Pasivos', 'xx', '29', 686, 'Bonos y papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 995, 'CO-PUC', 'Pasivos', 'xx xx', '2905', 994, 'Bonos en circulación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 996, 'CO-PUC', 'Pasivos', 'xx xx', '2910', 994, 'Bonos obligatoriamente convertibles en acciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 997, 'CO-PUC', 'Pasivos', 'xx xx', '2915', 994, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 998, 'CO-PUC', 'Pasivos', 'xx xx', '2920', 994, 'Bonos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 999, 'CO-PUC', 'Pasivos', 'xx xx xx', '292005', 998, 'Valor bonos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1000, 'CO-PUC', 'Pasivos', 'xx xx xx', '292010', 998, 'Bonos pensionales por amortizar (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1001, 'CO-PUC', 'Pasivos', 'xx xx xx', '292015', 998, 'Intereses causados sobre bonos pensionales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1002, 'CO-PUC', 'Pasivos', 'xx xx', '2925', 994, 'Títulos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1003, 'CO-PUC', 'Pasivos', 'xx xx xx', '292505', 1002, 'Valor títulos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1004, 'CO-PUC', 'Pasivos', 'xx xx xx', '292510', 1002, 'Títulos pensionales por amortizar (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1005, 'CO-PUC', 'Pasivos', 'xx xx xx', '292515', 1002,
        'Intereses causados sobre títulos pensionales', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1006, 'CO-PUC', 'Patrimonio', 'x', '3', 0, 'Patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1007, 'CO-PUC', 'Patrimonio', 'xx', '31', 1006, 'Capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1008, 'CO-PUC', 'Patrimonio', 'xx xx', '3105', 1007, 'Capital suscrito y pagado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1009, 'CO-PUC', 'Patrimonio', 'xx xx xx', '310505', 1008, 'Capital autorizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1010, 'CO-PUC', 'Patrimonio', 'xx xx xx', '310510', 1008, 'Capital por suscribir (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1011, 'CO-PUC', 'Patrimonio', 'xx xx xx', '310515', 1008, 'Capital suscrito por cobrar (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1012, 'CO-PUC', 'Patrimonio', 'xx xx', '3115', 1007, 'Aportes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1013, 'CO-PUC', 'Patrimonio', 'xx xx xx', '311505', 1012, 'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1014, 'CO-PUC', 'Patrimonio', 'xx xx xx', '311510', 1012,
        'Aportes de socios-fondo mutuo de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1015, 'CO-PUC', 'Patrimonio', 'xx xx xx', '311515', 1012,
        'Contribución de la empresa-fondo mutuo de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1016, 'CO-PUC', 'Patrimonio', 'xx xx xx', '311520', 1012, 'Suscripciones del público', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1017, 'CO-PUC', 'Patrimonio', 'xx xx', '3120', 1007, 'Capital asignado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1018, 'CO-PUC', 'Patrimonio', 'xx xx', '3125', 1007, 'Inversión suplementaria al capital asignado',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1019, 'CO-PUC', 'Patrimonio', 'xx xx', '3130', 1007, 'Capital de personas naturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1020, 'CO-PUC', 'Patrimonio', 'xx xx', '3135', 1007, 'Aportes del Estado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1021, 'CO-PUC', 'Patrimonio', 'xx xx', '3140', 1007, 'Fondo social', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1022, 'CO-PUC', 'Patrimonio', 'xx', '32', 1006, 'Superávit de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1023, 'CO-PUC', 'Patrimonio', 'xx xx', '3205', 1022,
        'Prima en colocación de acciones, cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1024, 'CO-PUC', 'Patrimonio', 'xx xx xx', '320505', 1023, 'Prima en colocación de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1025, 'CO-PUC', 'Patrimonio', 'xx xx xx', '320510', 1023,
        'Prima en colocación de acciones por cobrar (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1026, 'CO-PUC', 'Patrimonio', 'xx xx xx', '320515', 1023,
        'Prima en colocación de cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1027, 'CO-PUC', 'Patrimonio', 'xx xx', '3210', 1022, 'Donaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1028, 'CO-PUC', 'Patrimonio', 'xx xx xx', '321005', 1027, 'En dinero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1029, 'CO-PUC', 'Patrimonio', 'xx xx xx', '321010', 1027, 'En valores mobiliarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1030, 'CO-PUC', 'Patrimonio', 'xx xx xx', '321015', 1027, 'En bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1031, 'CO-PUC', 'Patrimonio', 'xx xx xx', '321020', 1027, 'En bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1032, 'CO-PUC', 'Patrimonio', 'xx xx xx', '321025', 1027, 'En intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1033, 'CO-PUC', 'Patrimonio', 'xx xx', '3215', 1022, 'Crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1034, 'CO-PUC', 'Patrimonio', 'xx xx', '3220', 1022, 'Know how', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1035, 'CO-PUC', 'Patrimonio', 'xx xx', '3225', 1022, 'Superávit método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1036, 'CO-PUC', 'Patrimonio', 'xx xx xx', '322505', 1035, 'De acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1037, 'CO-PUC', 'Patrimonio', 'xx xx xx', '322510', 1035, 'De cuotas o partes de interés social',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1038, 'CO-PUC', 'Patrimonio', 'xx', '33', 1006, 'Reservas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1039, 'CO-PUC', 'Patrimonio', 'xx xx', '3305', 1038, 'Reservas obligatorias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1040, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330505', 1039, 'Reserva legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1041, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330510', 1039, 'Reservas por disposiciones fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1042, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330515', 1039, 'Reserva para readquisición de acciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1043, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330516', 1039, 'Acciones propias readquiridas (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1044, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330517', 1039,
        'Reserva para readquisición de cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1045, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330518', 1039,
        'Cuotas o partes de interés social propias readquiridas (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1046, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330520', 1039, 'Reserva para extensión agropecuaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1047, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330525', 1039, 'Reserva Ley 7ª de 1990', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1048, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330530', 1039, 'Reserva para reposición de semovientes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1049, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330535', 1039, 'Reserva Ley 4ª de 1980', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1050, 'CO-PUC', 'Patrimonio', 'xx xx xx', '330595', 1039, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1051, 'CO-PUC', 'Patrimonio', 'xx xx', '3310', 1038, 'Reservas estatutarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1052, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331005', 1051, 'Para futuras capitalizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1053, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331010', 1051, 'Para reposición de activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1054, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331015', 1051, 'Para futuros ensanches', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1055, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331095', 1051, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1056, 'CO-PUC', 'Patrimonio', 'xx xx', '3315', 1038, 'Reservas ocasionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1057, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331505', 1056, 'Para beneficencia y civismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1058, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331510', 1056, 'Para futuras capitalizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1059, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331515', 1056, 'Para futuros ensanches', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1060, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331520', 1056,
        'Para adquisición o reposición de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1061, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331525', 1056, 'Para investigaciones y desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1062, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331530', 1056, 'Para fomento económico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1063, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331535', 1056, 'Para capital de trabajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1064, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331540', 1056, 'Para estabilización de rendimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1065, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331545', 1056, 'A disposición del máximo órgano social',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1066, 'CO-PUC', 'Patrimonio', 'xx xx xx', '331595', 1056, 'Otras', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1067, 'CO-PUC', 'Patrimonio', 'xx', '34', 1006, 'Revalorización del patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1068, 'CO-PUC', 'Patrimonio', 'xx xx', '3405', 1067, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1069, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340505', 1068, 'De capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1070, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340510', 1068, 'De superávit de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1071, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340515', 1068, 'De reservas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1072, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340520', 1068, 'De resultados de ejercicios anteriores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1073, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340525', 1068, 'De activos en período improductivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1074, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340530', 1068, 'De saneamiento fiscal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1075, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340535', 1068, 'De ajustes Decreto 3019 de 1989', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1076, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340540', 1068,
        'De dividendos y participaciones decretadas en acciones, cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1077, 'CO-PUC', 'Patrimonio', 'xx xx xx', '340545', 1068, 'Superávit método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1078, 'CO-PUC', 'Patrimonio', 'xx xx', '3410', 1067, 'Saneamiento fiscal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1079, 'CO-PUC', 'Patrimonio', 'xx xx', '3415', 1067, 'Ajustes por inflación Decreto 3019 de 1989',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1080, 'CO-PUC', 'Patrimonio', 'xx', '35', 1006,
        'Dividendos o participaciones decretados en acciones, cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1081, 'CO-PUC', 'Patrimonio', 'xx xx', '3505', 1080, 'Dividendos decretados en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1082, 'CO-PUC', 'Patrimonio', 'xx xx', '3510', 1080,
        'Participaciones decretadas en cuotas o partes de interés social', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1083, 'CO-PUC', 'Patrimonio', 'xx', '36', 1006, 'Resultados del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1084, 'CO-PUC', 'Patrimonio', 'xx xx', '3605', 1083, 'Utilidad del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1085, 'CO-PUC', 'Patrimonio', 'xx xx', '3610', 1083, 'Pérdida del ejercicio', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1086, 'CO-PUC', 'Patrimonio', 'xx', '37', 1006, 'Resultados de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1087, 'CO-PUC', 'Patrimonio', 'xx xx', '3705', 1086, 'Utilidades acumuladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1088, 'CO-PUC', 'Patrimonio', 'xx xx', '3710', 1086, 'Pérdidas acumuladas', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1089, 'CO-PUC', 'Patrimonio', 'xx', '38', 1006, 'Superávit por valorizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1090, 'CO-PUC', 'Patrimonio', 'xx xx', '3805', 1089, 'De inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1091, 'CO-PUC', 'Patrimonio', 'xx xx xx', '380505', 1090, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1092, 'CO-PUC', 'Patrimonio', 'xx xx xx', '380510', 1090, 'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1093, 'CO-PUC', 'Patrimonio', 'xx xx xx', '380515', 1090, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1094, 'CO-PUC', 'Patrimonio', 'xx xx', '3810', 1089, 'De propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1095, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381004', 1094, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1096, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381006', 1094, 'Materiales proyectos petroleros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1097, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381008', 1094, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1098, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381012', 1094, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1099, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381016', 1094, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1100, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381020', 1094, 'Equipo de computación y comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1101, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381024', 1094, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1102, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381028', 1094, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1103, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381032', 1094, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1104, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381036', 1094, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1105, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381040', 1094, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1106, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381044', 1094, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1107, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381048', 1094, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1108, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381052', 1094, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1109, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381056', 1094, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1110, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381060', 1094, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1111, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381064', 1094, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1112, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381068', 1094, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1113, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381072', 1094, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1114, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381076', 1094, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1115, 'CO-PUC', 'Patrimonio', 'xx xx xx', '381080', 1094, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1116, 'CO-PUC', 'Patrimonio', 'xx xx', '3895', 1089, 'De otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1117, 'CO-PUC', 'Patrimonio', 'xx xx xx', '389505', 1116, 'Bienes de arte y cultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1118, 'CO-PUC', 'Patrimonio', 'xx xx xx', '389510', 1116, 'Bienes entregados en comodato', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1119, 'CO-PUC', 'Patrimonio', 'xx xx xx', '389515', 1116, 'Bienes recibidos en pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1120, 'CO-PUC', 'Patrimonio', 'xx xx xx', '389520', 1116, 'Inventario de semovientes', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1121, 'CO-PUC', 'Ingresos', 'x', '4', 0, 'Ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1122, 'CO-PUC', 'Ingresos', 'xx', '41', 1121, 'Operacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1123, 'CO-PUC', 'Ingresos', 'xx xx', '4105', 1122, 'Agricultura, ganadería, caza y silvicultura',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1124, 'CO-PUC', 'Ingresos', 'xx xx xx', '410505', 1123, 'Cultivo de cereales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1125, 'CO-PUC', 'Ingresos', 'xx xx xx', '410510', 1123,
        'Cultivos de hortalizas, legumbres y plantas ornamentales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1126, 'CO-PUC', 'Ingresos', 'xx xx xx', '410515', 1123,
        'Cultivos de frutas, nueces y plantas aromáticas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1127, 'CO-PUC', 'Ingresos', 'xx xx xx', '410520', 1123, 'Cultivo de café', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1128, 'CO-PUC', 'Ingresos', 'xx xx xx', '410525', 1123, 'Cultivo de flores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1129, 'CO-PUC', 'Ingresos', 'xx xx xx', '410530', 1123, 'Cultivo de caña de azúcar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1130, 'CO-PUC', 'Ingresos', 'xx xx xx', '410535', 1123,
        'Cultivo de algodón y plantas para material textil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1131, 'CO-PUC', 'Ingresos', 'xx xx xx', '410540', 1123, 'Cultivo de banano', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1132, 'CO-PUC', 'Ingresos', 'xx xx xx', '410545', 1123, 'Otros cultivos agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1133, 'CO-PUC', 'Ingresos', 'xx xx xx', '410550', 1123,
        'Cría de ovejas, cabras, asnos, mulas y burdéganos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1134, 'CO-PUC', 'Ingresos', 'xx xx xx', '410555', 1123, 'Cría de ganado caballar y vacuno', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1135, 'CO-PUC', 'Ingresos', 'xx xx xx', '410560', 1123, 'Producción avícola', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1136, 'CO-PUC', 'Ingresos', 'xx xx xx', '410565', 1123, 'Cría de otros animales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1137, 'CO-PUC', 'Ingresos', 'xx xx xx', '410570', 1123, 'Servicios agrícolas y ganaderos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1138, 'CO-PUC', 'Ingresos', 'xx xx xx', '410575', 1123, 'Actividad de caza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1139, 'CO-PUC', 'Ingresos', 'xx xx xx', '410580', 1123, 'Actividad de silvicultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1140, 'CO-PUC', 'Ingresos', 'xx xx xx', '410595', 1123, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1141, 'CO-PUC', 'Ingresos', 'xx xx xx', '410599', 1123, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1142, 'CO-PUC', 'Ingresos', 'xx xx', '4110', 1122, 'Pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1143, 'CO-PUC', 'Ingresos', 'xx xx xx', '411005', 1142, 'Actividad de pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1144, 'CO-PUC', 'Ingresos', 'xx xx xx', '411010', 1142, 'Explotación de criaderos de peces', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1145, 'CO-PUC', 'Ingresos', 'xx xx xx', '411095', 1142, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1146, 'CO-PUC', 'Ingresos', 'xx xx xx', '411099', 1142, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1147, 'CO-PUC', 'Ingresos', 'xx xx', '4115', 1122, 'Explotación de minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1148, 'CO-PUC', 'Ingresos', 'xx xx xx', '411505', 1147, 'Carbón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1149, 'CO-PUC', 'Ingresos', 'xx xx xx', '411510', 1147, 'Petróleo crudo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1150, 'CO-PUC', 'Ingresos', 'xx xx xx', '411512', 1147, 'Gas natural', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1151, 'CO-PUC', 'Ingresos', 'xx xx xx', '411514', 1147,
        'Servicios relacionados con extracción de petróleo y gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1152, 'CO-PUC', 'Ingresos', 'xx xx xx', '411515', 1147, 'Minerales de hierro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1153, 'CO-PUC', 'Ingresos', 'xx xx xx', '411520', 1147, 'Minerales metalíferos no ferrosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1154, 'CO-PUC', 'Ingresos', 'xx xx xx', '411525', 1147, 'Piedra, arena y arcilla', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1155, 'CO-PUC', 'Ingresos', 'xx xx xx', '411527', 1147, 'Piedras preciosas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1156, 'CO-PUC', 'Ingresos', 'xx xx xx', '411528', 1147, 'Oro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1157, 'CO-PUC', 'Ingresos', 'xx xx xx', '411530', 1147, 'Otras minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1158, 'CO-PUC', 'Ingresos', 'xx xx xx', '411532', 1147, 'Prestación de servicios sector minero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1159, 'CO-PUC', 'Ingresos', 'xx xx xx', '411595', 1147, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1160, 'CO-PUC', 'Ingresos', 'xx xx xx', '411599', 1147, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1161, 'CO-PUC', 'Ingresos', 'xx xx', '4120', 1122, 'Industrias manufactureras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1162, 'CO-PUC', 'Ingresos', 'xx xx xx', '412001', 1161,
        'Producción y procesamiento de carnes y productos cárnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1163, 'CO-PUC', 'Ingresos', 'xx xx xx', '412002', 1161, 'Productos de pescado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1164, 'CO-PUC', 'Ingresos', 'xx xx xx', '412003', 1161,
        'Productos de frutas, legumbres y hortalizas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1165, 'CO-PUC', 'Ingresos', 'xx xx xx', '412004', 1161, 'Elaboración de aceites y grasas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1166, 'CO-PUC', 'Ingresos', 'xx xx xx', '412005', 1161, 'Elaboración de productos lácteos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1167, 'CO-PUC', 'Ingresos', 'xx xx xx', '412006', 1161, 'Elaboración de productos de molinería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1168, 'CO-PUC', 'Ingresos', 'xx xx xx', '412007', 1161, 'Elaboración de almidones y derivados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1169, 'CO-PUC', 'Ingresos', 'xx xx xx', '412008', 1161, 'Elaboración de alimentos para animales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1170, 'CO-PUC', 'Ingresos', 'xx xx xx', '412009', 1161, 'Elaboración de productos para panadería',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1171, 'CO-PUC', 'Ingresos', 'xx xx xx', '412010', 1161, 'Elaboración de azúcar y melazas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1172, 'CO-PUC', 'Ingresos', 'xx xx xx', '412011', 1161,
        'Elaboración de cacao, chocolate y confitería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1173, 'CO-PUC', 'Ingresos', 'xx xx xx', '412012', 1161,
        'Elaboración de pastas y productos farináceos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1174, 'CO-PUC', 'Ingresos', 'xx xx xx', '412013', 1161, 'Elaboración de productos de café', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1175, 'CO-PUC', 'Ingresos', 'xx xx xx', '412014', 1161,
        'Elaboración de otros productos alimenticios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1176, 'CO-PUC', 'Ingresos', 'xx xx xx', '412015', 1161,
        'Elaboración de bebidas alcohólicas y alcohol etílico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1177, 'CO-PUC', 'Ingresos', 'xx xx xx', '412016', 1161, 'Elaboración de vinos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1178, 'CO-PUC', 'Ingresos', 'xx xx xx', '412017', 1161,
        'Elaboración de bebidas malteadas y de malta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1179, 'CO-PUC', 'Ingresos', 'xx xx xx', '412018', 1161, 'Elaboración de bebidas no alcohólicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1180, 'CO-PUC', 'Ingresos', 'xx xx xx', '412019', 1161, 'Elaboración de productos de tabaco', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1181, 'CO-PUC', 'Ingresos', 'xx xx xx', '412020', 1161,
        'Preparación e hilatura de fibras textiles y tejeduría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1182, 'CO-PUC', 'Ingresos', 'xx xx xx', '412021', 1161, 'Acabado de productos textiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1183, 'CO-PUC', 'Ingresos', 'xx xx xx', '412022', 1161,
        'Elaboración de artículos de materiales textiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1184, 'CO-PUC', 'Ingresos', 'xx xx xx', '412023', 1161, 'Elaboración de tapices y alfombras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1185, 'CO-PUC', 'Ingresos', 'xx xx xx', '412024', 1161,
        'Elaboración de cuerdas, cordeles, bramantes y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1186, 'CO-PUC', 'Ingresos', 'xx xx xx', '412025', 1161, 'Elaboración de otros productos textiles',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1187, 'CO-PUC', 'Ingresos', 'xx xx xx', '412026', 1161, 'Elaboración de tejidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1188, 'CO-PUC', 'Ingresos', 'xx xx xx', '412027', 1161, 'Elaboración de prendas de vestir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1189, 'CO-PUC', 'Ingresos', 'xx xx xx', '412028', 1161, 'Preparación, adobo y teñido de pieles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1190, 'CO-PUC', 'Ingresos', 'xx xx xx', '412029', 1161, 'Curtido, adobo o preparación de cuero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1191, 'CO-PUC', 'Ingresos', 'xx xx xx', '412030', 1161,
        'Elaboración de maletas, bolsos y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1192, 'CO-PUC', 'Ingresos', 'xx xx xx', '412031', 1161, 'Elaboración de calzado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1193, 'CO-PUC', 'Ingresos', 'xx xx xx', '412032', 1161,
        'Producción de madera, artículos de madera y corcho', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1194, 'CO-PUC', 'Ingresos', 'xx xx xx', '412033', 1161,
        'Elaboración de pasta y productos de madera, papel y cartón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1195, 'CO-PUC', 'Ingresos', 'xx xx xx', '412034', 1161, 'Ediciones y publicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1196, 'CO-PUC', 'Ingresos', 'xx xx xx', '412035', 1161, 'Impresión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1197, 'CO-PUC', 'Ingresos', 'xx xx xx', '412036', 1161,
        'Servicios relacionados con la edición y la impresión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1198, 'CO-PUC', 'Ingresos', 'xx xx xx', '412037', 1161, 'Reproducción de grabaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1199, 'CO-PUC', 'Ingresos', 'xx xx xx', '412038', 1161,
        'Elaboración de productos de horno de coque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1200, 'CO-PUC', 'Ingresos', 'xx xx xx', '412039', 1161,
        'Elaboración de productos de la refinación de petróleo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1201, 'CO-PUC', 'Ingresos', 'xx xx xx', '412040', 1161,
        'Elaboración de sustancias químicas básicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1202, 'CO-PUC', 'Ingresos', 'xx xx xx', '412041', 1161,
        'Elaboración de abonos y compuestos de nitrógeno', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1203, 'CO-PUC', 'Ingresos', 'xx xx xx', '412042', 1161,
        'Elaboración de plástico y caucho sintético', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1204, 'CO-PUC', 'Ingresos', 'xx xx xx', '412043', 1161,
        'Elaboración de productos químicos de uso agropecuario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1205, 'CO-PUC', 'Ingresos', 'xx xx xx', '412044', 1161,
        'Elaboración de pinturas, tintas y masillas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1206, 'CO-PUC', 'Ingresos', 'xx xx xx', '412045', 1161,
        'Elaboración de productos farmacéuticos y botánicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1207, 'CO-PUC', 'Ingresos', 'xx xx xx', '412046', 1161,
        'Elaboración de jabones, detergentes y preparados de tocador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1208, 'CO-PUC', 'Ingresos', 'xx xx xx', '412047', 1161, 'Elaboración de otros productos químicos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1209, 'CO-PUC', 'Ingresos', 'xx xx xx', '412048', 1161, 'Elaboración de fibras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1210, 'CO-PUC', 'Ingresos', 'xx xx xx', '412049', 1161, 'Elaboración de otros productos de caucho',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1211, 'CO-PUC', 'Ingresos', 'xx xx xx', '412050', 1161, 'Elaboración de productos de plástico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1212, 'CO-PUC', 'Ingresos', 'xx xx xx', '412051', 1161,
        'Elaboración de vidrio y productos de vidrio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1213, 'CO-PUC', 'Ingresos', 'xx xx xx', '412052', 1161,
        'Elaboración de productos de cerámica, loza, piedra, arcilla y porcelana', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1214, 'CO-PUC', 'Ingresos', 'xx xx xx', '412053', 1161, 'Elaboración de cemento, cal y yeso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1215, 'CO-PUC', 'Ingresos', 'xx xx xx', '412054', 1161,
        'Elaboración de artículos de hormigón, cemento y yeso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1216, 'CO-PUC', 'Ingresos', 'xx xx xx', '412055', 1161, 'Corte, tallado y acabado de la piedra', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1217, 'CO-PUC', 'Ingresos', 'xx xx xx', '412056', 1161,
        'Elaboración de otros productos minerales no metálicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1218, 'CO-PUC', 'Ingresos', 'xx xx xx', '412057', 1161,
        'Industrias básicas y fundición de hierro y acero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1219, 'CO-PUC', 'Ingresos', 'xx xx xx', '412058', 1161,
        'Productos primarios de metales preciosos y de metales no ferrosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1220, 'CO-PUC', 'Ingresos', 'xx xx xx', '412059', 1161, 'Fundición de metales no ferrosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1221, 'CO-PUC', 'Ingresos', 'xx xx xx', '412060', 1161,
        'Fabricación de productos metálicos para uso estructural', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1222, 'CO-PUC', 'Ingresos', 'xx xx xx', '412061', 1161,
        'Forja, prensado, estampado, laminado de metal y pulvimetalurgia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1223, 'CO-PUC', 'Ingresos', 'xx xx xx', '412062', 1161,
        'Revestimiento de metales y obras de ingeniería mecánica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1224, 'CO-PUC', 'Ingresos', 'xx xx xx', '412063', 1161, 'Fabricación de artículos de ferretería',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1225, 'CO-PUC', 'Ingresos', 'xx xx xx', '412064', 1161, 'Elaboración de otros productos de metal',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1226, 'CO-PUC', 'Ingresos', 'xx xx xx', '412065', 1161, 'Fabricación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1227, 'CO-PUC', 'Ingresos', 'xx xx xx', '412066', 1161,
        'Fabricación de equipos de elevación y manipulación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1228, 'CO-PUC', 'Ingresos', 'xx xx xx', '412067', 1161, 'Elaboración de aparatos de uso doméstico',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1229, 'CO-PUC', 'Ingresos', 'xx xx xx', '412068', 1161, 'Elaboración de equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1230, 'CO-PUC', 'Ingresos', 'xx xx xx', '412069', 1161, 'Elaboración de pilas y baterías primarias',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1231, 'CO-PUC', 'Ingresos', 'xx xx xx', '412070', 1161, 'Elaboración de equipo de iluminación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1232, 'CO-PUC', 'Ingresos', 'xx xx xx', '412071', 1161,
        'Elaboración de otros tipos de equipo eléctrico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1233, 'CO-PUC', 'Ingresos', 'xx xx xx', '412072', 1161,
        'Fabricación de equipos de radio, televisión y comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1234, 'CO-PUC', 'Ingresos', 'xx xx xx', '412073', 1161,
        'Fabricación de aparatos e instrumentos médicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1235, 'CO-PUC', 'Ingresos', 'xx xx xx', '412074', 1161,
        'Fabricación de instrumentos de medición y control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1236, 'CO-PUC', 'Ingresos', 'xx xx xx', '412075', 1161,
        'Fabricación de instrumentos de óptica y equipo fotográfico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1237, 'CO-PUC', 'Ingresos', 'xx xx xx', '412076', 1161, 'Fabricación de relojes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1238, 'CO-PUC', 'Ingresos', 'xx xx xx', '412077', 1161, 'Fabricación de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1239, 'CO-PUC', 'Ingresos', 'xx xx xx', '412078', 1161,
        'Fabricación de carrocerías para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1240, 'CO-PUC', 'Ingresos', 'xx xx xx', '412079', 1161,
        'Fabricación de partes piezas y accesorios para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1241, 'CO-PUC', 'Ingresos', 'xx xx xx', '412080', 1161,
        'Fabricación y reparación de buques y otras embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1242, 'CO-PUC', 'Ingresos', 'xx xx xx', '412081', 1161,
        'Fabricación de locomotoras y material rodante para ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1243, 'CO-PUC', 'Ingresos', 'xx xx xx', '412082', 1161, 'Fabricación de aeronaves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1244, 'CO-PUC', 'Ingresos', 'xx xx xx', '412083', 1161, 'Fabricación de motocicletas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1245, 'CO-PUC', 'Ingresos', 'xx xx xx', '412084', 1161,
        'Fabricación de bicicletas y sillas de ruedas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1246, 'CO-PUC', 'Ingresos', 'xx xx xx', '412085', 1161, 'Fabricación de otros tipos de transporte',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1247, 'CO-PUC', 'Ingresos', 'xx xx xx', '412086', 1161, 'Fabricación de muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1248, 'CO-PUC', 'Ingresos', 'xx xx xx', '412087', 1161, 'Fabricación de joyas y artículos conexos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1249, 'CO-PUC', 'Ingresos', 'xx xx xx', '412088', 1161, 'Fabricación de instrumentos de música', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1250, 'CO-PUC', 'Ingresos', 'xx xx xx', '412089', 1161,
        'Fabricación de artículos y equipo para deporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1251, 'CO-PUC', 'Ingresos', 'xx xx xx', '412090', 1161, 'Fabricación de juegos y juguetes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1252, 'CO-PUC', 'Ingresos', 'xx xx xx', '412091', 1161, 'Reciclamiento de desperdicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1253, 'CO-PUC', 'Ingresos', 'xx xx xx', '412095', 1161,
        'Productos de otras industrias manufactureras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1254, 'CO-PUC', 'Ingresos', 'xx xx xx', '412099', 1161, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1255, 'CO-PUC', 'Ingresos', 'xx xx', '4125', 1122, 'Suministro de electricidad, gas y agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1256, 'CO-PUC', 'Ingresos', 'xx xx xx', '412505', 1255,
        'Generación, captación y distribución de energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1257, 'CO-PUC', 'Ingresos', 'xx xx xx', '412510', 1255,
        'Fabricación de gas y distribución de combustibles gaseosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1258, 'CO-PUC', 'Ingresos', 'xx xx xx', '412515', 1255,
        'Captación, depuración y distribución de agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1259, 'CO-PUC', 'Ingresos', 'xx xx xx', '412595', 1255, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1260, 'CO-PUC', 'Ingresos', 'xx xx xx', '412599', 1255, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1261, 'CO-PUC', 'Ingresos', 'xx xx', '4130', 1122, 'Construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1262, 'CO-PUC', 'Ingresos', 'xx xx xx', '413005', 1261, 'Preparación de terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1263, 'CO-PUC', 'Ingresos', 'xx xx xx', '413010', 1261,
        'Construcción de edificios y obras de ingeniería civil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1264, 'CO-PUC', 'Ingresos', 'xx xx xx', '413015', 1261, 'Acondicionamiento de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1265, 'CO-PUC', 'Ingresos', 'xx xx xx', '413020', 1261, 'Terminación de edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1266, 'CO-PUC', 'Ingresos', 'xx xx xx', '413025', 1261, 'Alquiler de equipo con operarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1267, 'CO-PUC', 'Ingresos', 'xx xx xx', '413095', 1261, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1268, 'CO-PUC', 'Ingresos', 'xx xx xx', '413099', 1261, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1269, 'CO-PUC', 'Ingresos', 'xx xx', '4135', 1122, 'Comercio al por mayor y al por menor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1270, 'CO-PUC', 'Ingresos', 'xx xx xx', '413502', 1269, 'Venta de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1271, 'CO-PUC', 'Ingresos', 'xx xx xx', '413504', 1269,
        'Mantenimiento, reparación y lavado de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1272, 'CO-PUC', 'Ingresos', 'xx xx xx', '413506', 1269,
        'Venta de partes, piezas y accesorios de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1273, 'CO-PUC', 'Ingresos', 'xx xx xx', '413508', 1269,
        'Venta de combustibles sólidos, líquidos, gaseosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1274, 'CO-PUC', 'Ingresos', 'xx xx xx', '413510', 1269,
        'Venta de lubricantes, aditivos, llantas y lujos para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1275, 'CO-PUC', 'Ingresos', 'xx xx xx', '413512', 1269,
        'Venta a cambio de retribución o por contrata', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1276, 'CO-PUC', 'Ingresos', 'xx xx xx', '413514', 1269,
        'Venta de insumos, materias primas agropecuarias y flores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1277, 'CO-PUC', 'Ingresos', 'xx xx xx', '413516', 1269,
        'Venta de otros insumos y materias primas no agropecuarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1278, 'CO-PUC', 'Ingresos', 'xx xx xx', '413518', 1269, 'Venta de animales vivos y cueros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1279, 'CO-PUC', 'Ingresos', 'xx xx xx', '413520', 1269,
        'Venta de productos en almacenes no especializados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1280, 'CO-PUC', 'Ingresos', 'xx xx xx', '413522', 1269, 'Venta de productos agropecuarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1281, 'CO-PUC', 'Ingresos', 'xx xx xx', '413524', 1269,
        'Venta de productos textiles, de vestir, de cuero y calzado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1282, 'CO-PUC', 'Ingresos', 'xx xx xx', '413526', 1269, 'Venta de papel y cartón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1283, 'CO-PUC', 'Ingresos', 'xx xx xx', '413528', 1269,
        'Venta de libros, revistas, elementos de papelería, útiles y textos escolares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1284, 'CO-PUC', 'Ingresos', 'xx xx xx', '413530', 1269,
        'Venta de juegos, juguetes y artículos deportivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1285, 'CO-PUC', 'Ingresos', 'xx xx xx', '413532', 1269,
        'Venta de instrumentos quirúrgicos y ortopédicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1286, 'CO-PUC', 'Ingresos', 'xx xx xx', '413534', 1269,
        'Venta de artículos en relojerías y joyerías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1287, 'CO-PUC', 'Ingresos', 'xx xx xx', '413536', 1269, 'Venta de electrodomésticos y muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1288, 'CO-PUC', 'Ingresos', 'xx xx xx', '413538', 1269,
        'Venta de productos de aseo, farmacéuticos, medicinales, y artículos de tocador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1289, 'CO-PUC', 'Ingresos', 'xx xx xx', '413540', 1269,
        'Venta de cubiertos, vajillas, cristalería, porcelanas, cerámicas y otros artículos de uso doméstico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1290, 'CO-PUC', 'Ingresos', 'xx xx xx', '413542', 1269,
        'Venta de materiales de construcción, fontanería y calefacción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1291, 'CO-PUC', 'Ingresos', 'xx xx xx', '413544', 1269, 'Venta de pinturas y lacas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1292, 'CO-PUC', 'Ingresos', 'xx xx xx', '413546', 1269,
        'Venta de productos de vidrios y marquetería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1293, 'CO-PUC', 'Ingresos', 'xx xx xx', '413548', 1269,
        'Venta de herramientas y artículos de ferretería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1294, 'CO-PUC', 'Ingresos', 'xx xx xx', '413550', 1269, 'Venta de químicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1295, 'CO-PUC', 'Ingresos', 'xx xx xx', '413552', 1269,
        'Venta de productos intermedios, desperdicios y desechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1296, 'CO-PUC', 'Ingresos', 'xx xx xx', '413554', 1269,
        'Venta de maquinaria, equipo de oficina y programas de computador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1297, 'CO-PUC', 'Ingresos', 'xx xx xx', '413556', 1269,
        'Venta de artículos en cacharrerías y misceláneas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1298, 'CO-PUC', 'Ingresos', 'xx xx xx', '413558', 1269, 'Venta de instrumentos musicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1299, 'CO-PUC', 'Ingresos', 'xx xx xx', '413560', 1269,
        'Venta de artículos en casas de empeño y prenderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1300, 'CO-PUC', 'Ingresos', 'xx xx xx', '413562', 1269, 'Venta de equipo fotográfico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1301, 'CO-PUC', 'Ingresos', 'xx xx xx', '413564', 1269, 'Venta de equipo óptico y de precisión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1302, 'CO-PUC', 'Ingresos', 'xx xx xx', '413566', 1269, 'Venta de empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1303, 'CO-PUC', 'Ingresos', 'xx xx xx', '413568', 1269, 'Venta de equipo profesional y científico',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1304, 'CO-PUC', 'Ingresos', 'xx xx xx', '413570', 1269,
        'Venta de loterías, rifas, chance, apuestas y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1305, 'CO-PUC', 'Ingresos', 'xx xx xx', '413572', 1269,
        'Reparación de efectos personales y electrodomésticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1306, 'CO-PUC', 'Ingresos', 'xx xx xx', '413595', 1269, 'Venta de otros productos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1307, 'CO-PUC', 'Ingresos', 'xx xx xx', '413599', 1269, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1308, 'CO-PUC', 'Ingresos', 'xx xx', '4140', 1122, 'Hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1309, 'CO-PUC', 'Ingresos', 'xx xx xx', '414005', 1308, 'Hotelería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1310, 'CO-PUC', 'Ingresos', 'xx xx xx', '414010', 1308, 'Campamento y otros tipos de hospedaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1311, 'CO-PUC', 'Ingresos', 'xx xx xx', '414015', 1308, 'Restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1312, 'CO-PUC', 'Ingresos', 'xx xx xx', '414020', 1308, 'Bares y cantinas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1313, 'CO-PUC', 'Ingresos', 'xx xx xx', '414095', 1308, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1314, 'CO-PUC', 'Ingresos', 'xx xx xx', '414099', 1308, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1315, 'CO-PUC', 'Ingresos', 'xx xx', '4145', 1122, 'Transporte, almacenamiento y comunicaciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1316, 'CO-PUC', 'Ingresos', 'xx xx xx', '414505', 1315, 'Servicio de transporte por carretera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1317, 'CO-PUC', 'Ingresos', 'xx xx xx', '414510', 1315, 'Servicio de transporte por vía férrea', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1318, 'CO-PUC', 'Ingresos', 'xx xx xx', '414515', 1315, 'Servicio de transporte por vía acuática',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1319, 'CO-PUC', 'Ingresos', 'xx xx xx', '414520', 1315, 'Servicio de transporte por vía aérea', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1320, 'CO-PUC', 'Ingresos', 'xx xx xx', '414525', 1315, 'Servicio de transporte por tuberías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1321, 'CO-PUC', 'Ingresos', 'xx xx xx', '414530', 1315, 'Manipulación de carga', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1322, 'CO-PUC', 'Ingresos', 'xx xx xx', '414535', 1315, 'Almacenamiento y depósito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1323, 'CO-PUC', 'Ingresos', 'xx xx xx', '414540', 1315,
        'Servicios complementarios para el transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1324, 'CO-PUC', 'Ingresos', 'xx xx xx', '414545', 1315, 'Agencias de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1325, 'CO-PUC', 'Ingresos', 'xx xx xx', '414550', 1315, 'Otras agencias de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1326, 'CO-PUC', 'Ingresos', 'xx xx xx', '414555', 1315, 'Servicio postal y de correo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1327, 'CO-PUC', 'Ingresos', 'xx xx xx', '414560', 1315, 'Servicio telefónico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1328, 'CO-PUC', 'Ingresos', 'xx xx xx', '414565', 1315, 'Servicio de telégrafo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1329, 'CO-PUC', 'Ingresos', 'xx xx xx', '414570', 1315, 'Servicio de transmisión de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1330, 'CO-PUC', 'Ingresos', 'xx xx xx', '414575', 1315, 'Servicio de radio y televisión por cable',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1331, 'CO-PUC', 'Ingresos', 'xx xx xx', '414580', 1315,
        'Transmisión de sonido e imágenes por contrato', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1332, 'CO-PUC', 'Ingresos', 'xx xx xx', '414595', 1315, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1333, 'CO-PUC', 'Ingresos', 'xx xx xx', '414599', 1315, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1334, 'CO-PUC', 'Ingresos', 'xx xx', '4150', 1122, 'Actividad financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1335, 'CO-PUC', 'Ingresos', 'xx xx xx', '415005', 1334, 'Venta de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1336, 'CO-PUC', 'Ingresos', 'xx xx xx', '415010', 1334,
        'Dividendos de sociedades anónimas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1337, 'CO-PUC', 'Ingresos', 'xx xx xx', '415015', 1334,
        'Participaciones de sociedades limitadas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1338, 'CO-PUC', 'Ingresos', 'xx xx xx', '415020', 1334, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1339, 'CO-PUC', 'Ingresos', 'xx xx xx', '415025', 1334, 'Reajuste monetario-UPAC (hoy UVR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1340, 'CO-PUC', 'Ingresos', 'xx xx xx', '415030', 1334, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1341, 'CO-PUC', 'Ingresos', 'xx xx xx', '415035', 1334, 'Operaciones de descuento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1342, 'CO-PUC', 'Ingresos', 'xx xx xx', '415040', 1334, 'Cuotas de inscripción-consorcios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1343, 'CO-PUC', 'Ingresos', 'xx xx xx', '415045', 1334, 'Cuotas de administración-consorcios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1344, 'CO-PUC', 'Ingresos', 'xx xx xx', '415050', 1334, 'Reajuste del sistema-consorcios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1345, 'CO-PUC', 'Ingresos', 'xx xx xx', '415055', 1334, 'Eliminación de suscriptores-consorcios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1346, 'CO-PUC', 'Ingresos', 'xx xx xx', '415060', 1334,
        'Cuotas de ingreso o retiro-sociedad administradora', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1347, 'CO-PUC', 'Ingresos', 'xx xx xx', '415065', 1334, 'Servicios a comisionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1348, 'CO-PUC', 'Ingresos', 'xx xx xx', '415070', 1334, 'Inscripciones y cuotas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1349, 'CO-PUC', 'Ingresos', 'xx xx xx', '415075', 1334, 'Recuperación de garantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1350, 'CO-PUC', 'Ingresos', 'xx xx xx', '415080', 1334, 'Ingresos método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1351, 'CO-PUC', 'Ingresos', 'xx xx xx', '415095', 1334, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1352, 'CO-PUC', 'Ingresos', 'xx xx xx', '415099', 1334, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1353, 'CO-PUC', 'Ingresos', 'xx xx', '4155', 1122,
        'Actividades inmobiliarias, empresariales y de alquiler', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1354, 'CO-PUC', 'Ingresos', 'xx xx xx', '415505', 1353, 'Arrendamientos de bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1355, 'CO-PUC', 'Ingresos', 'xx xx xx', '415510', 1353, 'Inmobiliarias por retribución o contrata',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1356, 'CO-PUC', 'Ingresos', 'xx xx xx', '415515', 1353, 'Alquiler equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1357, 'CO-PUC', 'Ingresos', 'xx xx xx', '415520', 1353, 'Alquiler maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1358, 'CO-PUC', 'Ingresos', 'xx xx xx', '415525', 1353,
        'Alquiler de efectos personales y enseres domésticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1359, 'CO-PUC', 'Ingresos', 'xx xx xx', '415530', 1353,
        'Consultoría en equipo y programas de informática', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1360, 'CO-PUC', 'Ingresos', 'xx xx xx', '415535', 1353, 'Procesamiento de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1361, 'CO-PUC', 'Ingresos', 'xx xx xx', '415540', 1353,
        'Mantenimiento y reparación de maquinaria de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1362, 'CO-PUC', 'Ingresos', 'xx xx xx', '415545', 1353,
        'Investigaciones científicas y de desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1363, 'CO-PUC', 'Ingresos', 'xx xx xx', '415550', 1353, 'Actividades empresariales de consultoría',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1364, 'CO-PUC', 'Ingresos', 'xx xx xx', '415555', 1353, 'Publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1365, 'CO-PUC', 'Ingresos', 'xx xx xx', '415560', 1353, 'Dotación de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1366, 'CO-PUC', 'Ingresos', 'xx xx xx', '415565', 1353, 'Investigación y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1367, 'CO-PUC', 'Ingresos', 'xx xx xx', '415570', 1353, 'Limpieza de inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1368, 'CO-PUC', 'Ingresos', 'xx xx xx', '415575', 1353, 'Fotografía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1369, 'CO-PUC', 'Ingresos', 'xx xx xx', '415580', 1353, 'Envase y empaque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1370, 'CO-PUC', 'Ingresos', 'xx xx xx', '415585', 1353, 'Fotocopiado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1371, 'CO-PUC', 'Ingresos', 'xx xx xx', '415590', 1353,
        'Mantenimiento y reparación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1372, 'CO-PUC', 'Ingresos', 'xx xx xx', '415595', 1353, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1373, 'CO-PUC', 'Ingresos', 'xx xx xx', '415599', 1353, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1374, 'CO-PUC', 'Ingresos', 'xx xx', '4160', 1122, 'Enseñanza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1375, 'CO-PUC', 'Ingresos', 'xx xx xx', '416005', 1374, 'Actividades relacionadas con la educación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1376, 'CO-PUC', 'Ingresos', 'xx xx xx', '416095', 1374, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1377, 'CO-PUC', 'Ingresos', 'xx xx xx', '416099', 1374, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1378, 'CO-PUC', 'Ingresos', 'xx xx', '4165', 1122, 'Servicios sociales y de salud', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1379, 'CO-PUC', 'Ingresos', 'xx xx xx', '416505', 1378, 'Servicio hospitalario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1380, 'CO-PUC', 'Ingresos', 'xx xx xx', '416510', 1378, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1381, 'CO-PUC', 'Ingresos', 'xx xx xx', '416515', 1378, 'Servicio odontológico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1382, 'CO-PUC', 'Ingresos', 'xx xx xx', '416520', 1378, 'Servicio de laboratorio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1383, 'CO-PUC', 'Ingresos', 'xx xx xx', '416525', 1378, 'Actividades veterinarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1384, 'CO-PUC', 'Ingresos', 'xx xx xx', '416530', 1378, 'Actividades de servicios sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1385, 'CO-PUC', 'Ingresos', 'xx xx xx', '416595', 1378, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1386, 'CO-PUC', 'Ingresos', 'xx xx xx', '416599', 1378, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1387, 'CO-PUC', 'Ingresos', 'xx xx', '4170', 1122,
        'Otras actividades de servicios comunitarios, sociales y personales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1388, 'CO-PUC', 'Ingresos', 'xx xx xx', '417005', 1387,
        'Eliminación de desperdicios y aguas residuales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1389, 'CO-PUC', 'Ingresos', 'xx xx xx', '417010', 1387, 'Actividades de asociación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1390, 'CO-PUC', 'Ingresos', 'xx xx xx', '417015', 1387,
        'Producción y distribución de filmes y videocintas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1391, 'CO-PUC', 'Ingresos', 'xx xx xx', '417020', 1387, 'Exhibición de filmes y videocintas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1392, 'CO-PUC', 'Ingresos', 'xx xx xx', '417025', 1387, 'Actividad de radio y televisión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1393, 'CO-PUC', 'Ingresos', 'xx xx xx', '417030', 1387, 'Actividad teatral, musical y artística',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1394, 'CO-PUC', 'Ingresos', 'xx xx xx', '417035', 1387, 'Grabación y producción de discos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1395, 'CO-PUC', 'Ingresos', 'xx xx xx', '417040', 1387, 'Entretenimiento y esparcimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1396, 'CO-PUC', 'Ingresos', 'xx xx xx', '417045', 1387, 'Agencias de noticias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1397, 'CO-PUC', 'Ingresos', 'xx xx xx', '417050', 1387, 'Lavanderías y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1398, 'CO-PUC', 'Ingresos', 'xx xx xx', '417055', 1387, 'Peluquerías y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1399, 'CO-PUC', 'Ingresos', 'xx xx xx', '417060', 1387, 'Servicios funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1400, 'CO-PUC', 'Ingresos', 'xx xx xx', '417065', 1387, 'Zonas francas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1401, 'CO-PUC', 'Ingresos', 'xx xx xx', '417095', 1387, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1402, 'CO-PUC', 'Ingresos', 'xx xx xx', '417099', 1387, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1403, 'CO-PUC', 'Ingresos', 'xx xx', '4175', 1122, 'Devoluciones en ventas (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1404, 'CO-PUC', 'Ingresos', 'xx xx xx', '417599', 1403, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1405, 'CO-PUC', 'Ingresos', 'xx', '42', 1121, 'No operacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1406, 'CO-PUC', 'Ingresos', 'xx xx', '4205', 1405, 'Otras ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1407, 'CO-PUC', 'Ingresos', 'xx xx xx', '420505', 1406, 'Materia prima', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1408, 'CO-PUC', 'Ingresos', 'xx xx xx', '420510', 1406, 'Material de desecho', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1409, 'CO-PUC', 'Ingresos', 'xx xx xx', '420515', 1406, 'Materiales varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1410, 'CO-PUC', 'Ingresos', 'xx xx xx', '420520', 1406, 'Productos de diversificación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1411, 'CO-PUC', 'Ingresos', 'xx xx xx', '420525', 1406, 'Excedentes de exportación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1412, 'CO-PUC', 'Ingresos', 'xx xx xx', '420530', 1406, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1413, 'CO-PUC', 'Ingresos', 'xx xx xx', '420535', 1406, 'Productos agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1414, 'CO-PUC', 'Ingresos', 'xx xx xx', '420540', 1406, 'De propaganda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1415, 'CO-PUC', 'Ingresos', 'xx xx xx', '420545', 1406, 'Productos en remate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1416, 'CO-PUC', 'Ingresos', 'xx xx xx', '420550', 1406, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1417, 'CO-PUC', 'Ingresos', 'xx xx xx', '420599', 1406, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1418, 'CO-PUC', 'Ingresos', 'xx xx', '4210', 1405, 'Financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1419, 'CO-PUC', 'Ingresos', 'xx xx xx', '421005', 1418, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1420, 'CO-PUC', 'Ingresos', 'xx xx xx', '421010', 1418, 'Reajuste monetario-UPAC (hoy UVR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1421, 'CO-PUC', 'Ingresos', 'xx xx xx', '421015', 1418, 'Descuentos amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1422, 'CO-PUC', 'Ingresos', 'xx xx xx', '421020', 1418, 'Diferencia en cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1423, 'CO-PUC', 'Ingresos', 'xx xx xx', '421025', 1418, 'Financiación vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1424, 'CO-PUC', 'Ingresos', 'xx xx xx', '421030', 1418, 'Financiación sistemas de viajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1425, 'CO-PUC', 'Ingresos', 'xx xx xx', '421035', 1418, 'Aceptaciones bancarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1426, 'CO-PUC', 'Ingresos', 'xx xx xx', '421040', 1418, 'Descuentos comerciales condicionados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1427, 'CO-PUC', 'Ingresos', 'xx xx xx', '421045', 1418, 'Descuentos bancarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1428, 'CO-PUC', 'Ingresos', 'xx xx xx', '421050', 1418, 'Comisiones cheques de otras plazas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1429, 'CO-PUC', 'Ingresos', 'xx xx xx', '421055', 1418, 'Multas y recargos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1430, 'CO-PUC', 'Ingresos', 'xx xx xx', '421060', 1418, 'Sanciones cheques devueltos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1431, 'CO-PUC', 'Ingresos', 'xx xx xx', '421095', 1418, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1432, 'CO-PUC', 'Ingresos', 'xx xx xx', '421099', 1418, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1433, 'CO-PUC', 'Ingresos', 'xx xx', '4215', 1405, 'Dividendos y participaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1434, 'CO-PUC', 'Ingresos', 'xx xx xx', '421505', 1433, 'De sociedades anónimas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1435, 'CO-PUC', 'Ingresos', 'xx xx xx', '421510', 1433, 'De sociedades limitadas y/o asimiladas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1436, 'CO-PUC', 'Ingresos', 'xx xx xx', '421599', 1433, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1437, 'CO-PUC', 'Ingresos', 'xx xx', '4218', 1405, 'Ingresos método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1438, 'CO-PUC', 'Ingresos', 'xx xx xx', '421805', 1437, 'De sociedades anónimas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1439, 'CO-PUC', 'Ingresos', 'xx xx xx', '421810', 1437, 'De sociedades limitadas y/o asimiladas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1440, 'CO-PUC', 'Ingresos', 'xx xx', '4220', 1405, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1441, 'CO-PUC', 'Ingresos', 'xx xx xx', '422005', 1440, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1442, 'CO-PUC', 'Ingresos', 'xx xx xx', '422010', 1440, 'Construcciones y edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1443, 'CO-PUC', 'Ingresos', 'xx xx xx', '422015', 1440, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1444, 'CO-PUC', 'Ingresos', 'xx xx xx', '422020', 1440, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1445, 'CO-PUC', 'Ingresos', 'xx xx xx', '422025', 1440, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1446, 'CO-PUC', 'Ingresos', 'xx xx xx', '422030', 1440, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1447, 'CO-PUC', 'Ingresos', 'xx xx xx', '422035', 1440, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1448, 'CO-PUC', 'Ingresos', 'xx xx xx', '422040', 1440, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1449, 'CO-PUC', 'Ingresos', 'xx xx xx', '422045', 1440, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1450, 'CO-PUC', 'Ingresos', 'xx xx xx', '422050', 1440, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1451, 'CO-PUC', 'Ingresos', 'xx xx xx', '422055', 1440, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1452, 'CO-PUC', 'Ingresos', 'xx xx xx', '422060', 1440, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1453, 'CO-PUC', 'Ingresos', 'xx xx xx', '422062', 1440, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1454, 'CO-PUC', 'Ingresos', 'xx xx xx', '422065', 1440, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1455, 'CO-PUC', 'Ingresos', 'xx xx xx', '422070', 1440, 'Aeródromos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1456, 'CO-PUC', 'Ingresos', 'xx xx xx', '422075', 1440, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1457, 'CO-PUC', 'Ingresos', 'xx xx xx', '422099', 1440, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1458, 'CO-PUC', 'Ingresos', 'xx xx', '4225', 1405, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1459, 'CO-PUC', 'Ingresos', 'xx xx xx', '422505', 1458, 'Sobre inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1460, 'CO-PUC', 'Ingresos', 'xx xx xx', '422510', 1458, 'De concesionarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1461, 'CO-PUC', 'Ingresos', 'xx xx xx', '422515', 1458, 'De actividades financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1462, 'CO-PUC', 'Ingresos', 'xx xx xx', '422520', 1458, 'Por venta de servicios de taller', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1463, 'CO-PUC', 'Ingresos', 'xx xx xx', '422525', 1458, 'Por venta de seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1464, 'CO-PUC', 'Ingresos', 'xx xx xx', '422530', 1458, 'Por ingresos para terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1465, 'CO-PUC', 'Ingresos', 'xx xx xx', '422535', 1458, 'Por distribución de películas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1466, 'CO-PUC', 'Ingresos', 'xx xx xx', '422540', 1458, 'Derechos de autor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1467, 'CO-PUC', 'Ingresos', 'xx xx xx', '422545', 1458, 'Derechos de programación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1468, 'CO-PUC', 'Ingresos', 'xx xx xx', '422599', 1458, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1469, 'CO-PUC', 'Ingresos', 'xx xx', '4230', 1405, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1470, 'CO-PUC', 'Ingresos', 'xx xx xx', '423005', 1469, 'Asesorías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1471, 'CO-PUC', 'Ingresos', 'xx xx xx', '423010', 1469, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1472, 'CO-PUC', 'Ingresos', 'xx xx xx', '423015', 1469, 'Administración de vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1473, 'CO-PUC', 'Ingresos', 'xx xx xx', '423099', 1469, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1474, 'CO-PUC', 'Ingresos', 'xx xx', '4235', 1405, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1475, 'CO-PUC', 'Ingresos', 'xx xx xx', '423505', 1474, 'De báscula', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1476, 'CO-PUC', 'Ingresos', 'xx xx xx', '423510', 1474, 'De transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1477, 'CO-PUC', 'Ingresos', 'xx xx xx', '423515', 1474, 'De prensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1478, 'CO-PUC', 'Ingresos', 'xx xx xx', '423520', 1474, 'Administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1479, 'CO-PUC', 'Ingresos', 'xx xx xx', '423525', 1474, 'Técnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1480, 'CO-PUC', 'Ingresos', 'xx xx xx', '423530', 1474, 'De computación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1481, 'CO-PUC', 'Ingresos', 'xx xx xx', '423535', 1474, 'De telefax', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1482, 'CO-PUC', 'Ingresos', 'xx xx xx', '423540', 1474, 'Taller de vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1483, 'CO-PUC', 'Ingresos', 'xx xx xx', '423545', 1474, 'De recepción de aeronaves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1484, 'CO-PUC', 'Ingresos', 'xx xx xx', '423550', 1474, 'De transporte programa gas natural', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1485, 'CO-PUC', 'Ingresos', 'xx xx xx', '423555', 1474, 'Por contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1486, 'CO-PUC', 'Ingresos', 'xx xx xx', '423560', 1474, 'De trilla', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1487, 'CO-PUC', 'Ingresos', 'xx xx xx', '423565', 1474, 'De mantenimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1488, 'CO-PUC', 'Ingresos', 'xx xx xx', '423570', 1474, 'Al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1489, 'CO-PUC', 'Ingresos', 'xx xx xx', '423575', 1474, 'De casino', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1490, 'CO-PUC', 'Ingresos', 'xx xx xx', '423580', 1474, 'Fletes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1491, 'CO-PUC', 'Ingresos', 'xx xx xx', '423585', 1474, 'Entre compañías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1492, 'CO-PUC', 'Ingresos', 'xx xx xx', '423595', 1474, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1493, 'CO-PUC', 'Ingresos', 'xx xx xx', '423599', 1474, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1494, 'CO-PUC', 'Ingresos', 'xx xx', '4240', 1405, 'Utilidad en venta de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1495, 'CO-PUC', 'Ingresos', 'xx xx xx', '424005', 1494, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1496, 'CO-PUC', 'Ingresos', 'xx xx xx', '424010', 1494, 'Cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1497, 'CO-PUC', 'Ingresos', 'xx xx xx', '424015', 1494, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1498, 'CO-PUC', 'Ingresos', 'xx xx xx', '424020', 1494, 'Cédulas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1499, 'CO-PUC', 'Ingresos', 'xx xx xx', '424025', 1494, 'Certificados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1500, 'CO-PUC', 'Ingresos', 'xx xx xx', '424030', 1494, 'Papeles comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1501, 'CO-PUC', 'Ingresos', 'xx xx xx', '424035', 1494, 'Títulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1502, 'CO-PUC', 'Ingresos', 'xx xx xx', '424045', 1494, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1503, 'CO-PUC', 'Ingresos', 'xx xx xx', '424050', 1494, 'Obligatorias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1504, 'CO-PUC', 'Ingresos', 'xx xx xx', '424095', 1494, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1505, 'CO-PUC', 'Ingresos', 'xx xx xx', '424099', 1494, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1506, 'CO-PUC', 'Ingresos', 'xx xx', '4245', 1405,
        'Utilidad en venta de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1507, 'CO-PUC', 'Ingresos', 'xx xx xx', '424504', 1506, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1508, 'CO-PUC', 'Ingresos', 'xx xx xx', '424506', 1506, 'Materiales industria petrolera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1509, 'CO-PUC', 'Ingresos', 'xx xx xx', '424508', 1506, 'Construcciones en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1510, 'CO-PUC', 'Ingresos', 'xx xx xx', '424512', 1506, 'Maquinaria en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1511, 'CO-PUC', 'Ingresos', 'xx xx xx', '424516', 1506, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1512, 'CO-PUC', 'Ingresos', 'xx xx xx', '424520', 1506, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1513, 'CO-PUC', 'Ingresos', 'xx xx xx', '424524', 1506, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1514, 'CO-PUC', 'Ingresos', 'xx xx xx', '424528', 1506, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1515, 'CO-PUC', 'Ingresos', 'xx xx xx', '424532', 1506, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1516, 'CO-PUC', 'Ingresos', 'xx xx xx', '424536', 1506, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1517, 'CO-PUC', 'Ingresos', 'xx xx xx', '424540', 1506, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1518, 'CO-PUC', 'Ingresos', 'xx xx xx', '424544', 1506, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1519, 'CO-PUC', 'Ingresos', 'xx xx xx', '424548', 1506, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1520, 'CO-PUC', 'Ingresos', 'xx xx xx', '424552', 1506, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1521, 'CO-PUC', 'Ingresos', 'xx xx xx', '424556', 1506, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1522, 'CO-PUC', 'Ingresos', 'xx xx xx', '424560', 1506, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1523, 'CO-PUC', 'Ingresos', 'xx xx xx', '424562', 1506, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1524, 'CO-PUC', 'Ingresos', 'xx xx xx', '424564', 1506, 'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1525, 'CO-PUC', 'Ingresos', 'xx xx xx', '424568', 1506, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1526, 'CO-PUC', 'Ingresos', 'xx xx xx', '424572', 1506, 'Minas y Canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1527, 'CO-PUC', 'Ingresos', 'xx xx xx', '424580', 1506, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1528, 'CO-PUC', 'Ingresos', 'xx xx xx', '424584', 1506, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1529, 'CO-PUC', 'Ingresos', 'xx xx xx', '424588', 1506, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1530, 'CO-PUC', 'Ingresos', 'xx xx xx', '424599', 1506, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1531, 'CO-PUC', 'Ingresos', 'xx xx', '4248', 1405, 'Utilidad en venta de otros bienes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1532, 'CO-PUC', 'Ingresos', 'xx xx xx', '424805', 1531, 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1533, 'CO-PUC', 'Ingresos', 'xx xx xx', '424810', 1531, 'Otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1534, 'CO-PUC', 'Ingresos', 'xx xx xx', '424899', 1531, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1535, 'CO-PUC', 'Ingresos', 'xx xx', '4250', 1405, 'Recuperaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1536, 'CO-PUC', 'Ingresos', 'xx xx xx', '425005', 1535, 'Deudas malas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1537, 'CO-PUC', 'Ingresos', 'xx xx xx', '425010', 1535, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1538, 'CO-PUC', 'Ingresos', 'xx xx xx', '425015', 1535, 'Reclamos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1539, 'CO-PUC', 'Ingresos', 'xx xx xx', '425020', 1535, 'Reintegro por personal en comisión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1540, 'CO-PUC', 'Ingresos', 'xx xx xx', '425025', 1535, 'Reintegro garantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1541, 'CO-PUC', 'Ingresos', 'xx xx xx', '425030', 1535, 'Descuentos concedidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1542, 'CO-PUC', 'Ingresos', 'xx xx xx', '425035', 1535, 'De provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1543, 'CO-PUC', 'Ingresos', 'xx xx xx', '425040', 1535, 'Gastos bancarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1544, 'CO-PUC', 'Ingresos', 'xx xx xx', '425045', 1535, 'De depreciación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1545, 'CO-PUC', 'Ingresos', 'xx xx xx', '425050', 1535, 'Reintegro de otros costos y gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1546, 'CO-PUC', 'Ingresos', 'xx xx xx', '425099', 1535, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1547, 'CO-PUC', 'Ingresos', 'xx xx', '4255', 1405, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1548, 'CO-PUC', 'Ingresos', 'xx xx xx', '425505', 1547, 'Por siniestro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1549, 'CO-PUC', 'Ingresos', 'xx xx xx', '425510', 1547, 'Por suministros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1550, 'CO-PUC', 'Ingresos', 'xx xx xx', '425515', 1547, 'Lucro cesante compañías de seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1551, 'CO-PUC', 'Ingresos', 'xx xx xx', '425520', 1547, 'Daño emergente compañías de seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1552, 'CO-PUC', 'Ingresos', 'xx xx xx', '425525', 1547, 'Por pérdida de mercancía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1553, 'CO-PUC', 'Ingresos', 'xx xx xx', '425530', 1547, 'Por incumplimiento de contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1554, 'CO-PUC', 'Ingresos', 'xx xx xx', '425535', 1547, 'De terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1555, 'CO-PUC', 'Ingresos', 'xx xx xx', '425540', 1547, 'Por incapacidades ISS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1556, 'CO-PUC', 'Ingresos', 'xx xx xx', '425595', 1547, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1557, 'CO-PUC', 'Ingresos', 'xx xx xx', '425599', 1547, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1558, 'CO-PUC', 'Ingresos', 'xx xx', '4260', 1405, 'Participaciones en concesiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1559, 'CO-PUC', 'Ingresos', 'xx xx xx', '426099', 1558, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1560, 'CO-PUC', 'Ingresos', 'xx xx', '4265', 1405, 'Ingresos de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1561, 'CO-PUC', 'Ingresos', 'xx xx xx', '426599', 1560, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1562, 'CO-PUC', 'Ingresos', 'xx xx', '4275', 1405, 'Devoluciones en otras ventas (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1563, 'CO-PUC', 'Ingresos', 'xx xx xx', '427599', 1562, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1564, 'CO-PUC', 'Ingresos', 'xx xx', '4295', 1405, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1565, 'CO-PUC', 'Ingresos', 'xx xx xx', '429503', 1564, 'CERT', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1566, 'CO-PUC', 'Ingresos', 'xx xx xx', '429505', 1564, 'Aprovechamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1567, 'CO-PUC', 'Ingresos', 'xx xx xx', '429507', 1564, 'Auxilios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1568, 'CO-PUC', 'Ingresos', 'xx xx xx', '429509', 1564, 'Subvenciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1569, 'CO-PUC', 'Ingresos', 'xx xx xx', '429511', 1564, 'Ingresos por investigación y desarrollo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1570, 'CO-PUC', 'Ingresos', 'xx xx xx', '429513', 1564, 'Por trabajos ejecutados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1571, 'CO-PUC', 'Ingresos', 'xx xx xx', '429515', 1564, 'Regalías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1572, 'CO-PUC', 'Ingresos', 'xx xx xx', '429517', 1564, 'Derivados de las exportaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1573, 'CO-PUC', 'Ingresos', 'xx xx xx', '429519', 1564, 'Otros ingresos de explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1574, 'CO-PUC', 'Ingresos', 'xx xx xx', '429521', 1564, 'De la actividad ganadera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1575, 'CO-PUC', 'Ingresos', 'xx xx xx', '429525', 1564, 'Derechos y licitaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1576, 'CO-PUC', 'Ingresos', 'xx xx xx', '429530', 1564, 'Ingresos por elementos perdidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1577, 'CO-PUC', 'Ingresos', 'xx xx xx', '429533', 1564, 'Multas y recargos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1578, 'CO-PUC', 'Ingresos', 'xx xx xx', '429535', 1564, 'Preavisos descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1579, 'CO-PUC', 'Ingresos', 'xx xx xx', '429537', 1564, 'Reclamos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1580, 'CO-PUC', 'Ingresos', 'xx xx xx', '429540', 1564, 'Recobro de daños', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1581, 'CO-PUC', 'Ingresos', 'xx xx xx', '429543', 1564, 'Premios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1582, 'CO-PUC', 'Ingresos', 'xx xx xx', '429545', 1564, 'Bonificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1583, 'CO-PUC', 'Ingresos', 'xx xx xx', '429547', 1564, 'Productos descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1584, 'CO-PUC', 'Ingresos', 'xx xx xx', '429549', 1564, 'Reconocimientos ISS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1585, 'CO-PUC', 'Ingresos', 'xx xx xx', '429551', 1564, 'Excedentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1586, 'CO-PUC', 'Ingresos', 'xx xx xx', '429553', 1564, 'Sobrantes de caja', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1587, 'CO-PUC', 'Ingresos', 'xx xx xx', '429555', 1564, 'Sobrantes en liquidación fletes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1588, 'CO-PUC', 'Ingresos', 'xx xx xx', '429557', 1564, 'Subsidios estatales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1589, 'CO-PUC', 'Ingresos', 'xx xx xx', '429559', 1564, 'Capacitación distribuidores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1590, 'CO-PUC', 'Ingresos', 'xx xx xx', '429561', 1564, 'De escrituración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1591, 'CO-PUC', 'Ingresos', 'xx xx xx', '429563', 1564, 'Registro promesas de venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1592, 'CO-PUC', 'Ingresos', 'xx xx xx', '429567', 1564, 'Útiles, papelería y fotocopias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1593, 'CO-PUC', 'Ingresos', 'xx xx xx', '429571', 1564, 'Resultados, matrículas y traspasos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1594, 'CO-PUC', 'Ingresos', 'xx xx xx', '429573', 1564, 'Decoraciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1595, 'CO-PUC', 'Ingresos', 'xx xx xx', '429575', 1564, 'Manejo de carga', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1596, 'CO-PUC', 'Ingresos', 'xx xx xx', '429579', 1564, 'Historia clínica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1597, 'CO-PUC', 'Ingresos', 'xx xx xx', '429581', 1564, 'Ajuste al peso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1598, 'CO-PUC', 'Ingresos', 'xx xx xx', '429583', 1564, 'Llamadas telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1599, 'CO-PUC', 'Ingresos', 'xx xx xx', '429595', 1564, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1600, 'CO-PUC', 'Ingresos', 'xx xx xx', '429599', 1564, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1601, 'CO-PUC', 'Ingresos', 'xx', '47', 1121, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1602, 'CO-PUC', 'Ingresos', 'xx xx', '4705', 1601, 'Corrección monetaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1603, 'CO-PUC', 'Ingresos', 'xx xx xx', '470505', 1602, 'Inversiones (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1604, 'CO-PUC', 'Ingresos', 'xx xx xx', '470510', 1602, 'Inventarios (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1605, 'CO-PUC', 'Ingresos', 'xx xx xx', '470515', 1602, 'Propiedades, planta y equipo (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1606, 'CO-PUC', 'Ingresos', 'xx xx xx', '470520', 1602, 'Intangibles (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1607, 'CO-PUC', 'Ingresos', 'xx xx xx', '470525', 1602, 'Activos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1608, 'CO-PUC', 'Ingresos', 'xx xx xx', '470530', 1602, 'Otros activos (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1609, 'CO-PUC', 'Ingresos', 'xx xx xx', '470535', 1602, 'Pasivos sujetos de ajuste', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1610, 'CO-PUC', 'Ingresos', 'xx xx xx', '470540', 1602, 'Patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1611, 'CO-PUC', 'Ingresos', 'xx xx xx', '470545', 1602, 'Depreciación acumulada (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1612, 'CO-PUC', 'Ingresos', 'xx xx xx', '470550', 1602, 'Depreciación diferida (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1613, 'CO-PUC', 'Ingresos', 'xx xx xx', '470555', 1602, 'Agotamiento acumulado (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1614, 'CO-PUC', 'Ingresos', 'xx xx xx', '470560', 1602, 'Amortización acumulada (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1615, 'CO-PUC', 'Ingresos', 'xx xx xx', '470565', 1602, 'Ingresos operacionales (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1616, 'CO-PUC', 'Ingresos', 'xx xx xx', '470568', 1602, 'Devoluciones en ventas (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1617, 'CO-PUC', 'Ingresos', 'xx xx xx', '470570', 1602, 'Ingresos no operacionales (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1618, 'CO-PUC', 'Ingresos', 'xx xx xx', '470575', 1602,
        'Gastos operacionales de administración (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1619, 'CO-PUC', 'Ingresos', 'xx xx xx', '470580', 1602, 'Gastos operacionales de ventas (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1620, 'CO-PUC', 'Ingresos', 'xx xx xx', '470585', 1602, 'Gastos no operacionales (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1621, 'CO-PUC', 'Ingresos', 'xx xx xx', '470590', 1602, 'Compras (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1622, 'CO-PUC', 'Ingresos', 'xx xx xx', '470591', 1602, 'Devoluciones en compras (DB)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1623, 'CO-PUC', 'Ingresos', 'xx xx xx', '470592', 1602, 'Costo de ventas (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1624, 'CO-PUC', 'Ingresos', 'xx xx xx', '470594', 1602, 'Costos de producción o de operación (CR)',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1625, 'CO-PUC', 'Gastos', 'x', '5', 0, 'Gastos', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1626, 'CO-PUC', 'Gastos', 'xx', '51', 1625, 'Operacionales de administración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1627, 'CO-PUC', 'Gastos', 'xx xx', '5105', 1626, 'Gastos de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1628, 'CO-PUC', 'Gastos', 'xx xx xx', '510503', 1627, 'Salario integral', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1629, 'CO-PUC', 'Gastos', 'xx xx xx', '510506', 1627, 'Sueldos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1630, 'CO-PUC', 'Gastos', 'xx xx xx', '510512', 1627, 'Jornales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1631, 'CO-PUC', 'Gastos', 'xx xx xx', '510515', 1627, 'Horas extras y recargos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1632, 'CO-PUC', 'Gastos', 'xx xx xx', '510518', 1627, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1633, 'CO-PUC', 'Gastos', 'xx xx xx', '510521', 1627, 'Viáticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1634, 'CO-PUC', 'Gastos', 'xx xx xx', '510524', 1627, 'Incapacidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1635, 'CO-PUC', 'Gastos', 'xx xx xx', '510527', 1627, 'Auxilio de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1636, 'CO-PUC', 'Gastos', 'xx xx xx', '510530', 1627, 'Cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1637, 'CO-PUC', 'Gastos', 'xx xx xx', '510533', 1627, 'Intereses sobre cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1638, 'CO-PUC', 'Gastos', 'xx xx xx', '510536', 1627, 'Prima de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1639, 'CO-PUC', 'Gastos', 'xx xx xx', '510539', 1627, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1640, 'CO-PUC', 'Gastos', 'xx xx xx', '510542', 1627, 'Primas extralegales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1641, 'CO-PUC', 'Gastos', 'xx xx xx', '510545', 1627, 'Auxilios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1642, 'CO-PUC', 'Gastos', 'xx xx xx', '510548', 1627, 'Bonificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1643, 'CO-PUC', 'Gastos', 'xx xx xx', '510551', 1627, 'Dotación y suministro a trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1644, 'CO-PUC', 'Gastos', 'xx xx xx', '510554', 1627, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1645, 'CO-PUC', 'Gastos', 'xx xx xx', '510557', 1627, 'Cuotas partes pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1646, 'CO-PUC', 'Gastos', 'xx xx xx', '510558', 1627,
        'Amortización cálculo actuarial pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1647, 'CO-PUC', 'Gastos', 'xx xx xx', '510559', 1627, 'Pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1648, 'CO-PUC', 'Gastos', 'xx xx xx', '510560', 1627, 'Indemnizaciones laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1649, 'CO-PUC', 'Gastos', 'xx xx xx', '510561', 1627, 'Amortización bonos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1650, 'CO-PUC', 'Gastos', 'xx xx xx', '510562', 1627, 'Amortización títulos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1651, 'CO-PUC', 'Gastos', 'xx xx xx', '510563', 1627, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1652, 'CO-PUC', 'Gastos', 'xx xx xx', '510566', 1627, 'Gastos deportivos y de recreación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1653, 'CO-PUC', 'Gastos', 'xx xx xx', '510568', 1627,
        'Aportes a administradoras de riesgos profesionales, ARP', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1654, 'CO-PUC', 'Gastos', 'xx xx xx', '510569', 1627,
        'Aportes a entidades promotoras de salud, EPS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1655, 'CO-PUC', 'Gastos', 'xx xx xx', '510570', 1627, 'Aportes a fondos de pensiones y/o cesantías',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1656, 'CO-PUC', 'Gastos', 'xx xx xx', '510572', 1627, 'Aportes cajas de compensación familiar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1657, 'CO-PUC', 'Gastos', 'xx xx xx', '510575', 1627, 'Aportes ICBF', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1658, 'CO-PUC', 'Gastos', 'xx xx xx', '510578', 1627, 'SENA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1659, 'CO-PUC', 'Gastos', 'xx xx xx', '510581', 1627, 'Aportes sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1660, 'CO-PUC', 'Gastos', 'xx xx xx', '510584', 1627, 'Gastos médicos y drogas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1661, 'CO-PUC', 'Gastos', 'xx xx xx', '510595', 1627, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1662, 'CO-PUC', 'Gastos', 'xx xx xx', '510599', 1627, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1663, 'CO-PUC', 'Gastos', 'xx xx', '5110', 1626, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1664, 'CO-PUC', 'Gastos', 'xx xx xx', '511005', 1663, 'Junta directiva', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1665, 'CO-PUC', 'Gastos', 'xx xx xx', '511010', 1663, 'Revisoría fiscal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1666, 'CO-PUC', 'Gastos', 'xx xx xx', '511015', 1663, 'Auditoría externa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1667, 'CO-PUC', 'Gastos', 'xx xx xx', '511020', 1663, 'Avalúos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1668, 'CO-PUC', 'Gastos', 'xx xx xx', '511025', 1663, 'Asesoría jurídica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1669, 'CO-PUC', 'Gastos', 'xx xx xx', '511030', 1663, 'Asesoría financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1670, 'CO-PUC', 'Gastos', 'xx xx xx', '511035', 1663, 'Asesoría técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1671, 'CO-PUC', 'Gastos', 'xx xx xx', '511095', 1663, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1672, 'CO-PUC', 'Gastos', 'xx xx xx', '511099', 1663, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1673, 'CO-PUC', 'Gastos', 'xx xx', '5115', 1626, 'Impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1674, 'CO-PUC', 'Gastos', 'xx xx xx', '511505', 1673, 'Industria y comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1675, 'CO-PUC', 'Gastos', 'xx xx xx', '511510', 1673, 'De timbres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1676, 'CO-PUC', 'Gastos', 'xx xx xx', '511515', 1673, 'A la propiedad raíz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1677, 'CO-PUC', 'Gastos', 'xx xx xx', '511520', 1673, 'Derechos sobre instrumentos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1678, 'CO-PUC', 'Gastos', 'xx xx xx', '511525', 1673, 'De valorización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1679, 'CO-PUC', 'Gastos', 'xx xx xx', '511530', 1673, 'De turismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1680, 'CO-PUC', 'Gastos', 'xx xx xx', '511535', 1673, 'Tasa por utilización de puertos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1681, 'CO-PUC', 'Gastos', 'xx xx xx', '511540', 1673, 'De vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1682, 'CO-PUC', 'Gastos', 'xx xx xx', '511545', 1673, 'De espectáculos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1683, 'CO-PUC', 'Gastos', 'xx xx xx', '511550', 1673, 'Cuotas de fomento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1684, 'CO-PUC', 'Gastos', 'xx xx xx', '511570', 1673, 'IVA descontable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1685, 'CO-PUC', 'Gastos', 'xx xx xx', '511595', 1673, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1686, 'CO-PUC', 'Gastos', 'xx xx xx', '511599', 1673, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1687, 'CO-PUC', 'Gastos', 'xx xx', '5120', 1626, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1688, 'CO-PUC', 'Gastos', 'xx xx xx', '512005', 1687, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1689, 'CO-PUC', 'Gastos', 'xx xx xx', '512010', 1687, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1690, 'CO-PUC', 'Gastos', 'xx xx xx', '512015', 1687, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1691, 'CO-PUC', 'Gastos', 'xx xx xx', '512020', 1687, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1692, 'CO-PUC', 'Gastos', 'xx xx xx', '512025', 1687, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1693, 'CO-PUC', 'Gastos', 'xx xx xx', '512030', 1687, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1694, 'CO-PUC', 'Gastos', 'xx xx xx', '512035', 1687, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1695, 'CO-PUC', 'Gastos', 'xx xx xx', '512040', 1687, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1696, 'CO-PUC', 'Gastos', 'xx xx xx', '512045', 1687, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1697, 'CO-PUC', 'Gastos', 'xx xx xx', '512050', 1687, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1698, 'CO-PUC', 'Gastos', 'xx xx xx', '512055', 1687, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1699, 'CO-PUC', 'Gastos', 'xx xx xx', '512060', 1687, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1700, 'CO-PUC', 'Gastos', 'xx xx xx', '512065', 1687, 'Aeródromos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1701, 'CO-PUC', 'Gastos', 'xx xx xx', '512070', 1687, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1702, 'CO-PUC', 'Gastos', 'xx xx xx', '512095', 1687, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1703, 'CO-PUC', 'Gastos', 'xx xx xx', '512099', 1687, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1704, 'CO-PUC', 'Gastos', 'xx xx', '5125', 1626, 'Contribuciones y afiliaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1705, 'CO-PUC', 'Gastos', 'xx xx xx', '512505', 1704, 'Contribuciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1706, 'CO-PUC', 'Gastos', 'xx xx xx', '512510', 1704, 'Afiliaciones y sostenimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1707, 'CO-PUC', 'Gastos', 'xx xx xx', '512599', 1704, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1708, 'CO-PUC', 'Gastos', 'xx xx', '5130', 1626, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1709, 'CO-PUC', 'Gastos', 'xx xx xx', '513005', 1708, 'Manejo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1710, 'CO-PUC', 'Gastos', 'xx xx xx', '513010', 1708, 'Cumplimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1711, 'CO-PUC', 'Gastos', 'xx xx xx', '513015', 1708, 'Corriente débil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1712, 'CO-PUC', 'Gastos', 'xx xx xx', '513020', 1708, 'Vida colectiva', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1713, 'CO-PUC', 'Gastos', 'xx xx xx', '513025', 1708, 'Incendio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1714, 'CO-PUC', 'Gastos', 'xx xx xx', '513030', 1708, 'Terremoto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1715, 'CO-PUC', 'Gastos', 'xx xx xx', '513035', 1708, 'Sustracción y hurto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1716, 'CO-PUC', 'Gastos', 'xx xx xx', '513040', 1708, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1717, 'CO-PUC', 'Gastos', 'xx xx xx', '513045', 1708, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1718, 'CO-PUC', 'Gastos', 'xx xx xx', '513050', 1708, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1719, 'CO-PUC', 'Gastos', 'xx xx xx', '513055', 1708, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1720, 'CO-PUC', 'Gastos', 'xx xx xx', '513060', 1708, 'Responsabilidad civil y extracontractual',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1721, 'CO-PUC', 'Gastos', 'xx xx xx', '513065', 1708, 'Vuelo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1722, 'CO-PUC', 'Gastos', 'xx xx xx', '513070', 1708, 'Rotura de maquinaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1723, 'CO-PUC', 'Gastos', 'xx xx xx', '513075', 1708, 'Obligatorio accidente de tránsito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1724, 'CO-PUC', 'Gastos', 'xx xx xx', '513080', 1708, 'Lucro cesante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1725, 'CO-PUC', 'Gastos', 'xx xx xx', '513085', 1708, 'Transporte de mercancía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1726, 'CO-PUC', 'Gastos', 'xx xx xx', '513095', 1708, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1727, 'CO-PUC', 'Gastos', 'xx xx xx', '513099', 1708, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1728, 'CO-PUC', 'Gastos', 'xx xx', '5135', 1626, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1729, 'CO-PUC', 'Gastos', 'xx xx xx', '513505', 1728, 'Aseo y vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1730, 'CO-PUC', 'Gastos', 'xx xx xx', '513510', 1728, 'Temporales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1731, 'CO-PUC', 'Gastos', 'xx xx xx', '513515', 1728, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1732, 'CO-PUC', 'Gastos', 'xx xx xx', '513520', 1728, 'Procesamiento electrónico de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1733, 'CO-PUC', 'Gastos', 'xx xx xx', '513525', 1728, 'Acueducto y alcantarillado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1734, 'CO-PUC', 'Gastos', 'xx xx xx', '513530', 1728, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1735, 'CO-PUC', 'Gastos', 'xx xx xx', '513535', 1728, 'Teléfono', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1736, 'CO-PUC', 'Gastos', 'xx xx xx', '513540', 1728, 'Correo, portes y telegramas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1737, 'CO-PUC', 'Gastos', 'xx xx xx', '513545', 1728, 'Fax y télex', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1738, 'CO-PUC', 'Gastos', 'xx xx xx', '513550', 1728, 'Transporte, fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1739, 'CO-PUC', 'Gastos', 'xx xx xx', '513555', 1728, 'Gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1740, 'CO-PUC', 'Gastos', 'xx xx xx', '513595', 1728, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1741, 'CO-PUC', 'Gastos', 'xx xx xx', '513599', 1728, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1742, 'CO-PUC', 'Gastos', 'xx xx', '5140', 1626, 'Gastos legales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1743, 'CO-PUC', 'Gastos', 'xx xx xx', '514005', 1742, 'Notariales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1744, 'CO-PUC', 'Gastos', 'xx xx xx', '514010', 1742, 'Registro mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1745, 'CO-PUC', 'Gastos', 'xx xx xx', '514015', 1742, 'Trámites y licencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1746, 'CO-PUC', 'Gastos', 'xx xx xx', '514020', 1742, 'Aduaneros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1747, 'CO-PUC', 'Gastos', 'xx xx xx', '514025', 1742, 'Consulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1748, 'CO-PUC', 'Gastos', 'xx xx xx', '514095', 1742, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1749, 'CO-PUC', 'Gastos', 'xx xx xx', '514099', 1742, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1750, 'CO-PUC', 'Gastos', 'xx xx', '5145', 1626, 'Mantenimiento y reparaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1751, 'CO-PUC', 'Gastos', 'xx xx xx', '514505', 1750, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1752, 'CO-PUC', 'Gastos', 'xx xx xx', '514510', 1750, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1753, 'CO-PUC', 'Gastos', 'xx xx xx', '514515', 1750, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1754, 'CO-PUC', 'Gastos', 'xx xx xx', '514520', 1750, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1755, 'CO-PUC', 'Gastos', 'xx xx xx', '514525', 1750, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1756, 'CO-PUC', 'Gastos', 'xx xx xx', '514530', 1750, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1757, 'CO-PUC', 'Gastos', 'xx xx xx', '514535', 1750, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1758, 'CO-PUC', 'Gastos', 'xx xx xx', '514540', 1750, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1759, 'CO-PUC', 'Gastos', 'xx xx xx', '514545', 1750, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1760, 'CO-PUC', 'Gastos', 'xx xx xx', '514550', 1750, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1761, 'CO-PUC', 'Gastos', 'xx xx xx', '514555', 1750, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1762, 'CO-PUC', 'Gastos', 'xx xx xx', '514560', 1750, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1763, 'CO-PUC', 'Gastos', 'xx xx xx', '514565', 1750, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1764, 'CO-PUC', 'Gastos', 'xx xx xx', '514570', 1750, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1765, 'CO-PUC', 'Gastos', 'xx xx xx', '514599', 1750, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1766, 'CO-PUC', 'Gastos', 'xx xx', '5150', 1626, 'Adecuación e instalación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1767, 'CO-PUC', 'Gastos', 'xx xx xx', '515005', 1766, 'Instalaciones eléctricas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1768, 'CO-PUC', 'Gastos', 'xx xx xx', '515010', 1766, 'Arreglos ornamentales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1769, 'CO-PUC', 'Gastos', 'xx xx xx', '515015', 1766, 'Reparaciones locativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1770, 'CO-PUC', 'Gastos', 'xx xx xx', '515095', 1766, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1771, 'CO-PUC', 'Gastos', 'xx xx xx', '515099', 1766, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1772, 'CO-PUC', 'Gastos', 'xx xx', '5155', 1626, 'Gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1773, 'CO-PUC', 'Gastos', 'xx xx xx', '515505', 1772, 'Alojamiento y manutención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1774, 'CO-PUC', 'Gastos', 'xx xx xx', '515510', 1772, 'Pasajes fluviales y/o marítimos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1775, 'CO-PUC', 'Gastos', 'xx xx xx', '515515', 1772, 'Pasajes aéreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1776, 'CO-PUC', 'Gastos', 'xx xx xx', '515520', 1772, 'Pasajes terrestres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1777, 'CO-PUC', 'Gastos', 'xx xx xx', '515525', 1772, 'Pasajes férreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1778, 'CO-PUC', 'Gastos', 'xx xx xx', '515595', 1772, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1779, 'CO-PUC', 'Gastos', 'xx xx xx', '515599', 1772, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1780, 'CO-PUC', 'Gastos', 'xx xx', '5160', 1626, 'Depreciaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1781, 'CO-PUC', 'Gastos', 'xx xx xx', '516005', 1780, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1782, 'CO-PUC', 'Gastos', 'xx xx xx', '516010', 1780, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1783, 'CO-PUC', 'Gastos', 'xx xx xx', '516015', 1780, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1784, 'CO-PUC', 'Gastos', 'xx xx xx', '516020', 1780, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1785, 'CO-PUC', 'Gastos', 'xx xx xx', '516025', 1780, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1786, 'CO-PUC', 'Gastos', 'xx xx xx', '516030', 1780, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1787, 'CO-PUC', 'Gastos', 'xx xx xx', '516035', 1780, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1788, 'CO-PUC', 'Gastos', 'xx xx xx', '516040', 1780, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1789, 'CO-PUC', 'Gastos', 'xx xx xx', '516045', 1780, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1790, 'CO-PUC', 'Gastos', 'xx xx xx', '516050', 1780, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1791, 'CO-PUC', 'Gastos', 'xx xx xx', '516055', 1780, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1792, 'CO-PUC', 'Gastos', 'xx xx xx', '516060', 1780, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1793, 'CO-PUC', 'Gastos', 'xx xx xx', '516099', 1780, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1794, 'CO-PUC', 'Gastos', 'xx xx', '5165', 1626, 'Amortizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1795, 'CO-PUC', 'Gastos', 'xx xx xx', '516505', 1794, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1796, 'CO-PUC', 'Gastos', 'xx xx xx', '516510', 1794, 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1797, 'CO-PUC', 'Gastos', 'xx xx xx', '516515', 1794, 'Cargos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1798, 'CO-PUC', 'Gastos', 'xx xx xx', '516595', 1794, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1799, 'CO-PUC', 'Gastos', 'xx xx xx', '516599', 1794, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1800, 'CO-PUC', 'Gastos', 'xx xx', '5195', 1626, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1801, 'CO-PUC', 'Gastos', 'xx xx xx', '519505', 1800, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1802, 'CO-PUC', 'Gastos', 'xx xx xx', '519510', 1800,
        'Libros, suscripciones, periódicos y revistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1803, 'CO-PUC', 'Gastos', 'xx xx xx', '519515', 1800, 'Música ambiental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1804, 'CO-PUC', 'Gastos', 'xx xx xx', '519520', 1800,
        'Gastos de representación y relaciones públicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1805, 'CO-PUC', 'Gastos', 'xx xx xx', '519525', 1800, 'Elementos de aseo y cafetería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1806, 'CO-PUC', 'Gastos', 'xx xx xx', '519530', 1800, 'Útiles, papelería y fotocopias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1807, 'CO-PUC', 'Gastos', 'xx xx xx', '519535', 1800, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1808, 'CO-PUC', 'Gastos', 'xx xx xx', '519540', 1800, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1809, 'CO-PUC', 'Gastos', 'xx xx xx', '519545', 1800, 'Taxis y buses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1810, 'CO-PUC', 'Gastos', 'xx xx xx', '519550', 1800, 'Estampillas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1811, 'CO-PUC', 'Gastos', 'xx xx xx', '519555', 1800, 'Microfilmación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1812, 'CO-PUC', 'Gastos', 'xx xx xx', '519560', 1800, 'Casino y restaurante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1813, 'CO-PUC', 'Gastos', 'xx xx xx', '519565', 1800, 'Parqueaderos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1814, 'CO-PUC', 'Gastos', 'xx xx xx', '519570', 1800, 'Indemnización por daños a terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1815, 'CO-PUC', 'Gastos', 'xx xx xx', '519575', 1800, 'Pólvora y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1816, 'CO-PUC', 'Gastos', 'xx xx xx', '519595', 1800, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1817, 'CO-PUC', 'Gastos', 'xx xx xx', '519599', 1800, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1818, 'CO-PUC', 'Gastos', 'xx xx', '5199', 1626, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1819, 'CO-PUC', 'Gastos', 'xx xx xx', '519905', 1818, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1820, 'CO-PUC', 'Gastos', 'xx xx xx', '519910', 1818, 'Deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1821, 'CO-PUC', 'Gastos', 'xx xx xx', '519915', 1818, 'Propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1822, 'CO-PUC', 'Gastos', 'xx xx xx', '519995', 1818, 'Otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1823, 'CO-PUC', 'Gastos', 'xx xx xx', '519999', 1818, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1824, 'CO-PUC', 'Gastos', 'xx', '52', 1625, 'Operacionales de ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1825, 'CO-PUC', 'Gastos', 'xx xx', '5205', 1824, 'Gastos de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1826, 'CO-PUC', 'Gastos', 'xx xx xx', '520503', 1825, 'Salario integral', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1827, 'CO-PUC', 'Gastos', 'xx xx xx', '520506', 1825, 'Sueldos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1828, 'CO-PUC', 'Gastos', 'xx xx xx', '520512', 1825, 'Jornales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1829, 'CO-PUC', 'Gastos', 'xx xx xx', '520515', 1825, 'Horas extras y recargos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1830, 'CO-PUC', 'Gastos', 'xx xx xx', '520518', 1825, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1831, 'CO-PUC', 'Gastos', 'xx xx xx', '520521', 1825, 'Viáticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1832, 'CO-PUC', 'Gastos', 'xx xx xx', '520524', 1825, 'Incapacidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1833, 'CO-PUC', 'Gastos', 'xx xx xx', '520527', 1825, 'Auxilio de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1834, 'CO-PUC', 'Gastos', 'xx xx xx', '520530', 1825, 'Cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1835, 'CO-PUC', 'Gastos', 'xx xx xx', '520533', 1825, 'Intereses sobre cesantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1836, 'CO-PUC', 'Gastos', 'xx xx xx', '520536', 1825, 'Prima de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1837, 'CO-PUC', 'Gastos', 'xx xx xx', '520539', 1825, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1838, 'CO-PUC', 'Gastos', 'xx xx xx', '520542', 1825, 'Primas extralegales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1839, 'CO-PUC', 'Gastos', 'xx xx xx', '520545', 1825, 'Auxilios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1840, 'CO-PUC', 'Gastos', 'xx xx xx', '520548', 1825, 'Bonificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1841, 'CO-PUC', 'Gastos', 'xx xx xx', '520551', 1825, 'Dotación y suministro a trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1842, 'CO-PUC', 'Gastos', 'xx xx xx', '520554', 1825, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1843, 'CO-PUC', 'Gastos', 'xx xx xx', '520557', 1825, 'Cuotas partes pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1844, 'CO-PUC', 'Gastos', 'xx xx xx', '520558', 1825,
        'Amortización cálculo actuarial pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1845, 'CO-PUC', 'Gastos', 'xx xx xx', '520559', 1825, 'Pensiones de jubilación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1846, 'CO-PUC', 'Gastos', 'xx xx xx', '520560', 1825, 'Indemnizaciones laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1847, 'CO-PUC', 'Gastos', 'xx xx xx', '520561', 1825, 'Amortización bonos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1848, 'CO-PUC', 'Gastos', 'xx xx xx', '520562', 1825, 'Amortización títulos pensionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1849, 'CO-PUC', 'Gastos', 'xx xx xx', '520563', 1825, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1850, 'CO-PUC', 'Gastos', 'xx xx xx', '520566', 1825, 'Gastos deportivos y de recreación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1851, 'CO-PUC', 'Gastos', 'xx xx xx', '520568', 1825,
        'Aportes a administradoras de riesgos profesionales, ARP', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1852, 'CO-PUC', 'Gastos', 'xx xx xx', '520569', 1825,
        'Aportes a entidades promotoras de salud, EPS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1853, 'CO-PUC', 'Gastos', 'xx xx xx', '520570', 1825, 'Aportes a fondos de pensiones y/o cesantías',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1854, 'CO-PUC', 'Gastos', 'xx xx xx', '520572', 1825, 'Aportes cajas de compensación familiar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1855, 'CO-PUC', 'Gastos', 'xx xx xx', '520575', 1825, 'Aportes ICBF', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1856, 'CO-PUC', 'Gastos', 'xx xx xx', '520578', 1825, 'SENA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1857, 'CO-PUC', 'Gastos', 'xx xx xx', '520581', 1825, 'Aportes sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1858, 'CO-PUC', 'Gastos', 'xx xx xx', '520584', 1825, 'Gastos médicos y drogas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1859, 'CO-PUC', 'Gastos', 'xx xx xx', '520595', 1825, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1860, 'CO-PUC', 'Gastos', 'xx xx xx', '520599', 1825, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1861, 'CO-PUC', 'Gastos', 'xx xx', '5210', 1824, 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1862, 'CO-PUC', 'Gastos', 'xx xx xx', '521005', 1861, 'Junta directiva', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1863, 'CO-PUC', 'Gastos', 'xx xx xx', '521010', 1861, 'Revisoría fiscal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1864, 'CO-PUC', 'Gastos', 'xx xx xx', '521015', 1861, 'Auditoría externa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1865, 'CO-PUC', 'Gastos', 'xx xx xx', '521020', 1861, 'Avalúos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1866, 'CO-PUC', 'Gastos', 'xx xx xx', '521025', 1861, 'Asesoría jurídica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1867, 'CO-PUC', 'Gastos', 'xx xx xx', '521030', 1861, 'Asesoría financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1868, 'CO-PUC', 'Gastos', 'xx xx xx', '521035', 1861, 'Asesoría técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1869, 'CO-PUC', 'Gastos', 'xx xx xx', '521095', 1861, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1870, 'CO-PUC', 'Gastos', 'xx xx xx', '521099', 1861, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1871, 'CO-PUC', 'Gastos', 'xx xx', '5215', 1824, 'Impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1872, 'CO-PUC', 'Gastos', 'xx xx xx', '521505', 1871, 'Industria y comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1873, 'CO-PUC', 'Gastos', 'xx xx xx', '521510', 1871, 'De timbres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1874, 'CO-PUC', 'Gastos', 'xx xx xx', '521515', 1871, 'A la propiedad raíz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1875, 'CO-PUC', 'Gastos', 'xx xx xx', '521520', 1871, 'Derechos sobre instrumentos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1876, 'CO-PUC', 'Gastos', 'xx xx xx', '521525', 1871, 'De valorización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1877, 'CO-PUC', 'Gastos', 'xx xx xx', '521530', 1871, 'De turismo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1878, 'CO-PUC', 'Gastos', 'xx xx xx', '521535', 1871, 'Tasa por utilización de puertos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1879, 'CO-PUC', 'Gastos', 'xx xx xx', '521540', 1871, 'De vehículos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1880, 'CO-PUC', 'Gastos', 'xx xx xx', '521545', 1871, 'De espectáculos públicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1881, 'CO-PUC', 'Gastos', 'xx xx xx', '521550', 1871, 'Cuotas de fomento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1882, 'CO-PUC', 'Gastos', 'xx xx xx', '521555', 1871, 'Licores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1883, 'CO-PUC', 'Gastos', 'xx xx xx', '521560', 1871, 'Cervezas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1884, 'CO-PUC', 'Gastos', 'xx xx xx', '521565', 1871, 'Cigarrillos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1885, 'CO-PUC', 'Gastos', 'xx xx xx', '521570', 1871, 'IVA descontable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1886, 'CO-PUC', 'Gastos', 'xx xx xx', '521595', 1871, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1887, 'CO-PUC', 'Gastos', 'xx xx xx', '521599', 1871, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1888, 'CO-PUC', 'Gastos', 'xx xx', '5220', 1824, 'Arrendamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1889, 'CO-PUC', 'Gastos', 'xx xx xx', '522005', 1888, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1890, 'CO-PUC', 'Gastos', 'xx xx xx', '522010', 1888, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1891, 'CO-PUC', 'Gastos', 'xx xx xx', '522015', 1888, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1892, 'CO-PUC', 'Gastos', 'xx xx xx', '522020', 1888, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1893, 'CO-PUC', 'Gastos', 'xx xx xx', '522025', 1888, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1894, 'CO-PUC', 'Gastos', 'xx xx xx', '522030', 1888, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1895, 'CO-PUC', 'Gastos', 'xx xx xx', '522035', 1888, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1896, 'CO-PUC', 'Gastos', 'xx xx xx', '522040', 1888, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1897, 'CO-PUC', 'Gastos', 'xx xx xx', '522045', 1888, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1898, 'CO-PUC', 'Gastos', 'xx xx xx', '522050', 1888, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1899, 'CO-PUC', 'Gastos', 'xx xx xx', '522055', 1888, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1900, 'CO-PUC', 'Gastos', 'xx xx xx', '522060', 1888, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1901, 'CO-PUC', 'Gastos', 'xx xx xx', '522065', 1888, 'Aeródromos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1902, 'CO-PUC', 'Gastos', 'xx xx xx', '522070', 1888, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1903, 'CO-PUC', 'Gastos', 'xx xx xx', '522095', 1888, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1904, 'CO-PUC', 'Gastos', 'xx xx xx', '522099', 1888, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1905, 'CO-PUC', 'Gastos', 'xx xx', '5225', 1824, 'Contribuciones y afiliaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1906, 'CO-PUC', 'Gastos', 'xx xx xx', '522505', 1905, 'Contribuciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1907, 'CO-PUC', 'Gastos', 'xx xx xx', '522510', 1905, 'Afiliaciones y sostenimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1908, 'CO-PUC', 'Gastos', 'xx xx xx', '522599', 1905, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1909, 'CO-PUC', 'Gastos', 'xx xx', '5230', 1824, 'Seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1910, 'CO-PUC', 'Gastos', 'xx xx xx', '523005', 1909, 'Manejo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1911, 'CO-PUC', 'Gastos', 'xx xx xx', '523010', 1909, 'Cumplimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1912, 'CO-PUC', 'Gastos', 'xx xx xx', '523015', 1909, 'Corriente débil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1913, 'CO-PUC', 'Gastos', 'xx xx xx', '523020', 1909, 'Vida colectiva', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1914, 'CO-PUC', 'Gastos', 'xx xx xx', '523025', 1909, 'Incendio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1915, 'CO-PUC', 'Gastos', 'xx xx xx', '523030', 1909, 'Terremoto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1916, 'CO-PUC', 'Gastos', 'xx xx xx', '523035', 1909, 'Sustracción y hurto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1917, 'CO-PUC', 'Gastos', 'xx xx xx', '523040', 1909, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1918, 'CO-PUC', 'Gastos', 'xx xx xx', '523045', 1909, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1919, 'CO-PUC', 'Gastos', 'xx xx xx', '523050', 1909, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1920, 'CO-PUC', 'Gastos', 'xx xx xx', '523055', 1909, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1921, 'CO-PUC', 'Gastos', 'xx xx xx', '523060', 1909, 'Responsabilidad civil y extracontractual',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1922, 'CO-PUC', 'Gastos', 'xx xx xx', '523065', 1909, 'Vuelo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1923, 'CO-PUC', 'Gastos', 'xx xx xx', '523070', 1909, 'Rotura de maquinaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1924, 'CO-PUC', 'Gastos', 'xx xx xx', '523075', 1909, 'Obligatorio accidente de tránsito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1925, 'CO-PUC', 'Gastos', 'xx xx xx', '523080', 1909, 'Lucro cesante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1926, 'CO-PUC', 'Gastos', 'xx xx xx', '523095', 1909, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1927, 'CO-PUC', 'Gastos', 'xx xx xx', '523099', 1909, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1928, 'CO-PUC', 'Gastos', 'xx xx', '5235', 1824, 'Servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1929, 'CO-PUC', 'Gastos', 'xx xx xx', '523505', 1928, 'Aseo y vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1930, 'CO-PUC', 'Gastos', 'xx xx xx', '523510', 1928, 'Temporales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1931, 'CO-PUC', 'Gastos', 'xx xx xx', '523515', 1928, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1932, 'CO-PUC', 'Gastos', 'xx xx xx', '523520', 1928, 'Procesamiento electrónico de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1933, 'CO-PUC', 'Gastos', 'xx xx xx', '523525', 1928, 'Acueducto y alcantarillado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1934, 'CO-PUC', 'Gastos', 'xx xx xx', '523530', 1928, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1935, 'CO-PUC', 'Gastos', 'xx xx xx', '523535', 1928, 'Teléfono', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1936, 'CO-PUC', 'Gastos', 'xx xx xx', '523540', 1928, 'Correo, portes y telegramas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1937, 'CO-PUC', 'Gastos', 'xx xx xx', '523545', 1928, 'Fax y télex', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1938, 'CO-PUC', 'Gastos', 'xx xx xx', '523550', 1928, 'Transporte, fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1939, 'CO-PUC', 'Gastos', 'xx xx xx', '523555', 1928, 'Gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1940, 'CO-PUC', 'Gastos', 'xx xx xx', '523560', 1928, 'Publicidad, propaganda y promoción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1941, 'CO-PUC', 'Gastos', 'xx xx xx', '523595', 1928, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1942, 'CO-PUC', 'Gastos', 'xx xx xx', '523599', 1928, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1943, 'CO-PUC', 'Gastos', 'xx xx', '5240', 1824, 'Gastos legales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1944, 'CO-PUC', 'Gastos', 'xx xx xx', '524005', 1943, 'Notariales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1945, 'CO-PUC', 'Gastos', 'xx xx xx', '524010', 1943, 'Registro mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1946, 'CO-PUC', 'Gastos', 'xx xx xx', '524015', 1943, 'Trámites y licencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1947, 'CO-PUC', 'Gastos', 'xx xx xx', '524020', 1943, 'Aduaneros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1948, 'CO-PUC', 'Gastos', 'xx xx xx', '524025', 1943, 'Consulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1949, 'CO-PUC', 'Gastos', 'xx xx xx', '524095', 1943, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1950, 'CO-PUC', 'Gastos', 'xx xx xx', '524099', 1943, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1951, 'CO-PUC', 'Gastos', 'xx xx', '5245', 1824, 'Mantenimiento y reparaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1952, 'CO-PUC', 'Gastos', 'xx xx xx', '524505', 1951, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1953, 'CO-PUC', 'Gastos', 'xx xx xx', '524510', 1951, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1954, 'CO-PUC', 'Gastos', 'xx xx xx', '524515', 1951, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1955, 'CO-PUC', 'Gastos', 'xx xx xx', '524520', 1951, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1956, 'CO-PUC', 'Gastos', 'xx xx xx', '524525', 1951, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1957, 'CO-PUC', 'Gastos', 'xx xx xx', '524530', 1951, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1958, 'CO-PUC', 'Gastos', 'xx xx xx', '524535', 1951, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1959, 'CO-PUC', 'Gastos', 'xx xx xx', '524540', 1951, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1960, 'CO-PUC', 'Gastos', 'xx xx xx', '524545', 1951, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1961, 'CO-PUC', 'Gastos', 'xx xx xx', '524550', 1951, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1962, 'CO-PUC', 'Gastos', 'xx xx xx', '524555', 1951, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1963, 'CO-PUC', 'Gastos', 'xx xx xx', '524560', 1951, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1964, 'CO-PUC', 'Gastos', 'xx xx xx', '524565', 1951, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1965, 'CO-PUC', 'Gastos', 'xx xx xx', '524570', 1951, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1966, 'CO-PUC', 'Gastos', 'xx xx xx', '524599', 1951, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1967, 'CO-PUC', 'Gastos', 'xx xx', '5250', 1824, 'Adecuación e instalación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1968, 'CO-PUC', 'Gastos', 'xx xx xx', '525005', 1967, 'Instalaciones eléctricas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1969, 'CO-PUC', 'Gastos', 'xx xx xx', '525010', 1967, 'Arreglos ornamentales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1970, 'CO-PUC', 'Gastos', 'xx xx xx', '525015', 1967, 'Reparaciones locativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1971, 'CO-PUC', 'Gastos', 'xx xx xx', '525095', 1967, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1972, 'CO-PUC', 'Gastos', 'xx xx xx', '525099', 1967, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1973, 'CO-PUC', 'Gastos', 'xx xx', '5255', 1824, 'Gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1974, 'CO-PUC', 'Gastos', 'xx xx xx', '525505', 1973, 'Alojamiento y manutención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1975, 'CO-PUC', 'Gastos', 'xx xx xx', '525510', 1973, 'Pasajes fluviales y/o marítimos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1976, 'CO-PUC', 'Gastos', 'xx xx xx', '525515', 1973, 'Pasajes aéreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1977, 'CO-PUC', 'Gastos', 'xx xx xx', '525520', 1973, 'Pasajes terrestres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1978, 'CO-PUC', 'Gastos', 'xx xx xx', '525525', 1973, 'Pasajes férreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1979, 'CO-PUC', 'Gastos', 'xx xx xx', '525595', 1973, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1980, 'CO-PUC', 'Gastos', 'xx xx xx', '525599', 1973, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1981, 'CO-PUC', 'Gastos', 'xx xx', '5260', 1824, 'Depreciaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1982, 'CO-PUC', 'Gastos', 'xx xx xx', '526005', 1981, 'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1983, 'CO-PUC', 'Gastos', 'xx xx xx', '526010', 1981, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1984, 'CO-PUC', 'Gastos', 'xx xx xx', '526015', 1981, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1985, 'CO-PUC', 'Gastos', 'xx xx xx', '526020', 1981, 'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1986, 'CO-PUC', 'Gastos', 'xx xx xx', '526025', 1981, 'Equipo médico-científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1987, 'CO-PUC', 'Gastos', 'xx xx xx', '526030', 1981, 'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1988, 'CO-PUC', 'Gastos', 'xx xx xx', '526035', 1981, 'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1989, 'CO-PUC', 'Gastos', 'xx xx xx', '526040', 1981, 'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1990, 'CO-PUC', 'Gastos', 'xx xx xx', '526045', 1981, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1991, 'CO-PUC', 'Gastos', 'xx xx xx', '526050', 1981, 'Flota y equipo férreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1992, 'CO-PUC', 'Gastos', 'xx xx xx', '526055', 1981, 'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1993, 'CO-PUC', 'Gastos', 'xx xx xx', '526060', 1981, 'Armamento de vigilancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1994, 'CO-PUC', 'Gastos', 'xx xx xx', '526065', 1981, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1995, 'CO-PUC', 'Gastos', 'xx xx xx', '526099', 1981, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1996, 'CO-PUC', 'Gastos', 'xx xx', '5265', 1824, 'Amortizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1997, 'CO-PUC', 'Gastos', 'xx xx xx', '526505', 1996, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1998, 'CO-PUC', 'Gastos', 'xx xx xx', '526510', 1996, 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 1999, 'CO-PUC', 'Gastos', 'xx xx xx', '526515', 1996, 'Cargos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2000, 'CO-PUC', 'Gastos', 'xx xx xx', '526595', 1996, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2001, 'CO-PUC', 'Gastos', 'xx xx xx', '526599', 1996, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2002, 'CO-PUC', 'Gastos', 'xx xx', '5270', 1824, 'Financieros-reajuste del sistema', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2003, 'CO-PUC', 'Gastos', 'xx xx xx', '527099', 2002, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2004, 'CO-PUC', 'Gastos', 'xx xx', '5275', 2002, 'Pérdidas método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2005, 'CO-PUC', 'Gastos', 'xx xx xx', '527505', 2002, 'De sociedades anónimas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2006, 'CO-PUC', 'Gastos', 'xx xx xx', '527510', 2002, 'De sociedades limitadas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2007, 'CO-PUC', 'Gastos', 'xx xx', '5295', 1824, 'Diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2008, 'CO-PUC', 'Gastos', 'xx xx xx', '529505', 2007, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2009, 'CO-PUC', 'Gastos', 'xx xx xx', '529510', 2007,
        'Libros, suscripciones, periódicos y revistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2010, 'CO-PUC', 'Gastos', 'xx xx xx', '529515', 2007, 'Música ambiental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2011, 'CO-PUC', 'Gastos', 'xx xx xx', '529520', 2007,
        'Gastos de representación y relaciones públicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2012, 'CO-PUC', 'Gastos', 'xx xx xx', '529525', 2007, 'Elementos de aseo y cafetería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2013, 'CO-PUC', 'Gastos', 'xx xx xx', '529530', 2007, 'Útiles, papelería y fotocopias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2014, 'CO-PUC', 'Gastos', 'xx xx xx', '529535', 2007, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2015, 'CO-PUC', 'Gastos', 'xx xx xx', '529540', 2007, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2016, 'CO-PUC', 'Gastos', 'xx xx xx', '529545', 2007, 'Taxis y buses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2017, 'CO-PUC', 'Gastos', 'xx xx xx', '529550', 2007, 'Estampillas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2018, 'CO-PUC', 'Gastos', 'xx xx xx', '529555', 2007, 'Microfilmación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2019, 'CO-PUC', 'Gastos', 'xx xx xx', '529560', 2007, 'Casino y restaurante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2020, 'CO-PUC', 'Gastos', 'xx xx xx', '529565', 2007, 'Parqueaderos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2021, 'CO-PUC', 'Gastos', 'xx xx xx', '529570', 2007, 'Indemnización por daños a terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2022, 'CO-PUC', 'Gastos', 'xx xx xx', '529575', 2007, 'Pólvora y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2023, 'CO-PUC', 'Gastos', 'xx xx xx', '529595', 2007, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2024, 'CO-PUC', 'Gastos', 'xx xx xx', '529599', 2007, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2025, 'CO-PUC', 'Gastos', 'xx xx', '5299', 1824, 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2026, 'CO-PUC', 'Gastos', 'xx xx xx', '529905', 2025, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2027, 'CO-PUC', 'Gastos', 'xx xx xx', '529910', 2025, 'Deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2028, 'CO-PUC', 'Gastos', 'xx xx xx', '529915', 2025, 'Inventarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2029, 'CO-PUC', 'Gastos', 'xx xx xx', '529920', 2025, 'Propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2030, 'CO-PUC', 'Gastos', 'xx xx xx', '529995', 2025, 'Otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2031, 'CO-PUC', 'Gastos', 'xx xx xx', '529999', 2025, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2032, 'CO-PUC', 'Gastos', 'xx', '53', 1625, 'No operacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2033, 'CO-PUC', 'Gastos', 'xx xx', '5305', 2032, 'Financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2034, 'CO-PUC', 'Gastos', 'xx xx xx', '530505', 2033, 'Gastos bancarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2035, 'CO-PUC', 'Gastos', 'xx xx xx', '530510', 2033, 'Reajuste monetario-UPAC (hoy UVR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2036, 'CO-PUC', 'Gastos', 'xx xx xx', '530515', 2033, 'Comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2037, 'CO-PUC', 'Gastos', 'xx xx xx', '530520', 2033, 'Intereses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2038, 'CO-PUC', 'Gastos', 'xx xx xx', '530525', 2033, 'Diferencia en cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2039, 'CO-PUC', 'Gastos', 'xx xx xx', '530530', 2033,
        'Gastos en negociación certificados de cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2040, 'CO-PUC', 'Gastos', 'xx xx xx', '530535', 2033, 'Descuentos comerciales condicionados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2041, 'CO-PUC', 'Gastos', 'xx xx xx', '530540', 2033, 'Gastos manejo y emisión de bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2042, 'CO-PUC', 'Gastos', 'xx xx xx', '530545', 2033, 'Prima amortizada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2043, 'CO-PUC', 'Gastos', 'xx xx xx', '530595', 2033, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2044, 'CO-PUC', 'Gastos', 'xx xx xx', '530599', 2033, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2045, 'CO-PUC', 'Gastos', 'xx xx', '5310', 2032, 'Pérdida en venta y retiro de bienes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2046, 'CO-PUC', 'Gastos', 'xx xx xx', '531005', 2045, 'Venta de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2047, 'CO-PUC', 'Gastos', 'xx xx xx', '531010', 2045, 'Venta de cartera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2048, 'CO-PUC', 'Gastos', 'xx xx xx', '531015', 2045, 'Venta de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2049, 'CO-PUC', 'Gastos', 'xx xx xx', '531020', 2045, 'Venta de intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2050, 'CO-PUC', 'Gastos', 'xx xx xx', '531025', 2045, 'Venta de otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2051, 'CO-PUC', 'Gastos', 'xx xx xx', '531030', 2045, 'Retiro de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2052, 'CO-PUC', 'Gastos', 'xx xx xx', '531035', 2045, 'Retiro de otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2053, 'CO-PUC', 'Gastos', 'xx xx xx', '531040', 2045, 'Pérdidas por siniestros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2054, 'CO-PUC', 'Gastos', 'xx xx xx', '531095', 2045, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2055, 'CO-PUC', 'Gastos', 'xx xx xx', '531099', 2045, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2056, 'CO-PUC', 'Gastos', 'xx xx', '5313', 2032, 'Pérdidas método de participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2057, 'CO-PUC', 'Gastos', 'xx xx xx', '531305', 2056, 'De sociedades anónimas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2058, 'CO-PUC', 'Gastos', 'xx xx xx', '531310', 2056, 'De sociedades limitadas y/o asimiladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2059, 'CO-PUC', 'Gastos', 'xx xx', '5315', 2032, 'Gastos extraordinarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2060, 'CO-PUC', 'Gastos', 'xx xx xx', '531505', 2059, 'Costas y procesos judiciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2061, 'CO-PUC', 'Gastos', 'xx xx xx', '531510', 2059, 'Actividades culturales y cívicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2062, 'CO-PUC', 'Gastos', 'xx xx xx', '531515', 2059, 'Costos y gastos de ejercicios anteriores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2063, 'CO-PUC', 'Gastos', 'xx xx xx', '531520', 2059, 'Impuestos asumidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2064, 'CO-PUC', 'Gastos', 'xx xx xx', '531595', 2059, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2065, 'CO-PUC', 'Gastos', 'xx xx xx', '531599', 2059, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2066, 'CO-PUC', 'Gastos', 'xx xx', '5395', 2032, 'Gastos diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2067, 'CO-PUC', 'Gastos', 'xx xx xx', '539505', 2066, 'Demandas laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2068, 'CO-PUC', 'Gastos', 'xx xx xx', '539510', 2066, 'Demandas por incumplimiento de contratos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2069, 'CO-PUC', 'Gastos', 'xx xx xx', '539515', 2066, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2070, 'CO-PUC', 'Gastos', 'xx xx xx', '539520', 2066, 'Multas, sanciones y litigios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2071, 'CO-PUC', 'Gastos', 'xx xx xx', '539525', 2066, 'Donaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2072, 'CO-PUC', 'Gastos', 'xx xx xx', '539530', 2066, 'Constitución de garantías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2073, 'CO-PUC', 'Gastos', 'xx xx xx', '539535', 2066,
        'Amortización de bienes entregados en comodato', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2074, 'CO-PUC', 'Gastos', 'xx xx xx', '539595', 2066, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2075, 'CO-PUC', 'Gastos', 'xx xx xx', '539599', 2066, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2076, 'CO-PUC', 'Gastos', 'xx', '54', 1625, 'Impuesto de renta y complementarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2077, 'CO-PUC', 'Gastos', 'xx xx', '5405', 2076, 'Impuesto de renta y complementarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2078, 'CO-PUC', 'Gastos', 'xx xx xx', '540505', 2076, 'Impuesto de renta y complementarios', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2079, 'CO-PUC', 'Gastos', 'xx', '59', 1625, 'Ganancias y pérdidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2080, 'CO-PUC', 'Gastos', 'xx xx', '5905', 2079, 'Ganancias y pérdidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2081, 'CO-PUC', 'Gastos', 'xx xx xx', '590505', 2079, 'Ganancias y pérdidas', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2082, 'CO-PUC', 'Costos de ventas', 'x', '6', 0, 'Costos de ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2083, 'CO-PUC', 'Costos de ventas', 'xx', '61', 2082,
        'Costo de ventas y de prestación de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2084, 'CO-PUC', 'Costos de ventas', 'xx xx', '6105', 2083,
        'Agricultura, ganadería, caza y silvicultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2085, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610505', 2084, 'Cultivo de cereales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2086, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610510', 2084,
        'Cultivos de hortalizas, legumbres y plantas ornamentales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2087, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610515', 2084,
        'Cultivos de frutas, nueces y plantas aromáticas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2088, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610520', 2084, 'Cultivo de café', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2089, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610525', 2084, 'Cultivo de flores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2090, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610530', 2084, 'Cultivo de caña de azúcar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2091, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610535', 2084,
        'Cultivo de algodón y plantas para material textil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2092, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610540', 2084, 'Cultivo de banano', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2093, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610545', 2084, 'Otros cultivos agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2094, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610550', 2084,
        'Cría de ovejas, cabras, asnos, mulas y burdéganos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2095, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610555', 2084, 'Cría de ganado caballar y vacuno',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2096, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610560', 2084, 'Producción avícola', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2097, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610565', 2084, 'Cría de otros animales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2098, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610570', 2084, 'Servicios agrícolas y ganaderos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2099, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610575', 2084, 'Actividad de caza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2100, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610580', 2084, 'Actividad de silvicultura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2101, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610595', 2084, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2102, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '610599', 2084, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2103, 'CO-PUC', 'Costos de ventas', 'xx xx', '6110', 2083, 'Pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2104, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611005', 2103, 'Actividad de pesca', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2105, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611010', 2103, 'Explotación de criaderos de peces',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2106, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611095', 2103, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2107, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611099', 2103, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2108, 'CO-PUC', 'Costos de ventas', 'xx xx', '6115', 2083, 'Explotación de minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2109, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611505', 2108, 'Carbón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2110, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611510', 2108, 'Petróleo crudo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2111, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611512', 2108, 'Gas natural', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2112, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611514', 2108,
        'Servicios relacionados con extracción de petróleo y gas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2113, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611515', 2108, 'Minerales de hierro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2114, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611520', 2108, 'Minerales metalíferos no ferrosos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2115, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611525', 2108, 'Piedra, arena y arcilla', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2116, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611527', 2108, 'Piedras preciosas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2117, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611528', 2108, 'Oro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2118, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611530', 2108, 'Otras minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2119, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611532', 2108,
        'Prestación de servicios sector minero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2120, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611595', 2108, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2121, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '611599', 2108, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2122, 'CO-PUC', 'Costos de ventas', 'xx xx', '6120', 2083, 'Industrias manufactureras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2123, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612001', 2122,
        'Producción y procesamiento de carnes y productos cárnicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2124, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612002', 2122, 'Productos de pescado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2125, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612003', 2122,
        'Productos de frutas, legumbres y hortalizas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2126, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612004', 2122, 'Elaboración de aceites y grasas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2127, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612005', 2122, 'Elaboración de productos lácteos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2128, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612006', 2122,
        'Elaboración de productos de molinería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2129, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612007', 2122,
        'Elaboración de almidones y derivados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2130, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612008', 2122,
        'Elaboración de alimentos para animales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2131, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612009', 2122,
        'Elaboración de productos para panadería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2132, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612010', 2122, 'Elaboración de azúcar y melazas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2133, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612011', 2122,
        'Elaboración de cacao, chocolate y confitería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2134, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612012', 2122,
        'Elaboración de pastas y productos farináceos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2135, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612013', 2122, 'Elaboración de productos de café',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2136, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612014', 2122,
        'Elaboración de otros productos alimenticios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2137, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612015', 2122,
        'Elaboración de bebidas alcohólicas y alcohol etílico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2138, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612016', 2122, 'Elaboración de vinos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2139, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612017', 2122,
        'Elaboración de bebidas malteadas y de malta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2140, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612018', 2122,
        'Elaboración de bebidas no alcohólicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2141, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612019', 2122,
        'Elaboración de productos de tabaco', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2142, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612020', 2122,
        'Preparación e hilatura de fibras textiles y tejeduría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2143, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612021', 2122, 'Acabado de productos textiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2144, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612022', 2122,
        'Elaboración de artículos de materiales textiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2145, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612023', 2122,
        'Elaboración de tapices y alfombras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2146, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612024', 2122,
        'Elaboración de cuerdas, cordeles, bramantes y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2147, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612025', 2122,
        'Elaboración de otros productos textiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2148, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612026', 2122, 'Elaboración de tejidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2149, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612027', 2122, 'Elaboración de prendas de vestir',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2150, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612028', 2122,
        'Preparación, adobo y teñido de pieles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2151, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612029', 2122,
        'Curtido, adobo o preparación de cuero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2152, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612030', 2122,
        'Elaboración de maletas, bolsos y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2153, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612031', 2122, 'Elaboración de calzado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2154, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612032', 2122,
        'Producción de madera, artículos de madera y corcho', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2155, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612033', 2122,
        'Elaboración de pasta y productos de madera, papel y cartón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2156, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612034', 2122, 'Ediciones y publicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2157, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612035', 2122, 'Impresión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2158, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612036', 2122,
        'Servicios relacionados con la edición y la impresión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2159, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612037', 2122, 'Reproducción de grabaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2160, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612038', 2122,
        'Elaboración de productos de horno de coque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2161, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612039', 2122,
        'Elaboración de productos de la refinación de petróleo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2162, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612040', 2122,
        'Elaboración de sustancias químicas básicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2163, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612041', 2122,
        'Elaboración de abonos y compuestos de nitrógeno', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2164, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612042', 2122,
        'Elaboración de plástico y caucho sintético', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2165, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612043', 2122,
        'Elaboración de productos químicos de uso agropecuario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2166, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612044', 2122,
        'Elaboración de pinturas, tintas y masillas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2167, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612045', 2122,
        'Elaboración de productos farmacéuticos y botánicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2168, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612046', 2122,
        'Elaboración de jabones, detergentes y preparados de tocador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2169, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612047', 2122,
        'Elaboración de otros productos químicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2170, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612048', 2122, 'Elaboración de fibras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2171, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612049', 2122,
        'Elaboración de otros productos de caucho', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2172, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612050', 2122,
        'Elaboración de productos de plástico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2173, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612051', 2122,
        'Elaboración de vidrio y productos de vidrio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2174, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612052', 2122,
        'Elaboración de productos de cerámica, loza, piedra, arcilla y porcelana', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2175, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612053', 2122,
        'Elaboración de cemento, cal y yeso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2176, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612054', 2122,
        'Elaboración de artículos de hormigón, cemento y yeso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2177, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612055', 2122,
        'Corte, tallado y acabado de la piedra', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2178, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612056', 2122,
        'Elaboración de otros productos minerales no metálicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2179, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612057', 2122,
        'Industrias básicas y fundición de hierro y acero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2180, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612058', 2122,
        'Productos primarios de metales preciosos y de metales no ferrosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2181, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612059', 2122, 'Fundición de metales no ferrosos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2182, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612060', 2122,
        'Fabricación de productos metálicos para uso estructural', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2183, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612061', 2122,
        'Forja, prensado, estampado, laminado de metal y pulvimetalurgia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2184, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612062', 2122,
        'Revestimiento de metales y obras de ingeniería mecánica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2185, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612063', 2122,
        'Fabricación de artículos de ferretería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2186, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612064', 2122,
        'Elaboración de otros productos de metal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2187, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612065', 2122,
        'Fabricación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2188, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612066', 2122,
        'Fabricación de equipos de elevación y manipulación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2189, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612067', 2122,
        'Elaboración de aparatos de uso doméstico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2190, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612068', 2122, 'Elaboración de equipo de oficina',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2191, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612069', 2122,
        'Elaboración de pilas y baterías primarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2192, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612070', 2122,
        'Elaboración de equipo de iluminación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2193, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612071', 2122,
        'Elaboración de otros tipos de equipo eléctrico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2194, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612072', 2122,
        'Fabricación de equipos de radio, televisión y comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2195, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612073', 2122,
        'Fabricación de aparatos e instrumentos médicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2196, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612074', 2122,
        'Fabricación de instrumentos de medición y control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2197, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612075', 2122,
        'Fabricación de instrumentos de óptica y equipo fotográfico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2198, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612076', 2122, 'Fabricación de relojes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2199, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612077', 2122,
        'Fabricación de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2200, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612078', 2122,
        'Fabricación de carrocerías para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2201, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612079', 2122,
        'Fabricación de partes, piezas y accesorios para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2202, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612080', 2122,
        'Fabricación y reparación de buques y otras embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2203, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612081', 2122,
        'Fabricación de locomotoras y material rodante para ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2204, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612082', 2122, 'Fabricación de aeronaves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2205, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612083', 2122, 'Fabricación de motocicletas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2206, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612084', 2122,
        'Fabricación de bicicletas y sillas de ruedas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2207, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612085', 2122,
        'Fabricación de otros tipos de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2208, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612086', 2122, 'Fabricación de muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2209, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612087', 2122,
        'Fabricación de joyas y artículos conexos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2210, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612088', 2122,
        'Fabricación de instrumentos de música', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2211, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612089', 2122,
        'Fabricación de artículos y equipo para deporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2212, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612090', 2122, 'Fabricación de juegos y juguetes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2213, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612091', 2122, 'Reciclamiento de desperdicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2214, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612095', 2122,
        'Productos de otras industrias manufactureras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2215, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612099', 2122, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2216, 'CO-PUC', 'Costos de ventas', 'xx xx', '6125', 2083, 'Suministro de electricidad, gas y agua',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2217, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612505', 2216,
        'Generación, captación y distribución de energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2218, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612510', 2216,
        'Fabricación de gas y distribución de combustibles gaseosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2219, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612515', 2216,
        'Captación, depuración y distribución de agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2220, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612595', 2216, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2221, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '612599', 2216, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2222, 'CO-PUC', 'Costos de ventas', 'xx xx', '6130', 2083, 'Construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2223, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613005', 2222, 'Preparación de terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2224, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613010', 2222,
        'Construcción de edificios y obras de ingeniería civil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2225, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613015', 2222, 'Acondicionamiento de edificios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2226, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613020', 2222, 'Terminación de edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2227, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613025', 2222, 'Alquiler de equipo con operario',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2228, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613095', 2222, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2229, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613099', 2222, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2230, 'CO-PUC', 'Costos de ventas', 'xx xx', '6135', 2083, 'Comercio al por mayor y al por menor',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2231, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613502', 2230, 'Venta de vehículos automotores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2232, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613504', 2230,
        'Mantenimiento, reparación y lavado de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2233, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613506', 2230,
        'Venta de partes, piezas y accesorios de vehículos automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2234, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613508', 2230,
        'Venta de combustibles sólidos, líquidos, gaseosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2235, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613510', 2230,
        'Venta de lubricantes, aditivos, llantas y lujos para automotores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2236, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613512', 2230,
        'Venta a cambio de retribución o por contrata', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2237, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613514', 2230,
        'Venta de insumos, materias primas agropecuarias y flores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2238, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613516', 2230,
        'Venta de otros insumos y materias primas no agropecuarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2239, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613518', 2230, 'Venta de animales vivos y cueros',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2240, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613520', 2230,
        'Venta de productos en almacenes no especializados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2241, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613522', 2230, 'Venta de productos agropecuarios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2242, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613524', 2230,
        'Venta de productos textiles, de vestir, de cuero y calzado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2243, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613526', 2230, 'Venta de papel y cartón', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2244, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613528', 2230,
        'Venta de libros, revistas, elementos de papelería, útiles y textos escolares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2245, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613530', 2230,
        'Venta de juegos, juguetes y artículos deportivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2246, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613532', 2230,
        'Venta de instrumentos quirúrgicos y ortopédicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2247, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613534', 2230,
        'Venta de artículos en relojerías y joyerías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2248, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613536', 2230,
        'Venta de electrodomésticos y muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2249, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613538', 2230,
        'Venta de productos de aseo, farmacéuticos, medicinales y artículos de tocador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2250, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613540', 2230,
        'Venta de cubiertos, vajillas, cristalería, porcelanas, cerámicas y otros artículos de uso doméstico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2251, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613542', 2230,
        'Venta de materiales de construcción, fontanería y calefacción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2252, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613544', 2230, 'Venta de pinturas y lacas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2253, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613546', 2230,
        'Venta de productos de vidrios y marquetería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2254, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613548', 2230,
        'Venta de herramientas y artículos de ferretería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2255, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613550', 2230, 'Venta de químicos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2256, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613552', 2230,
        'Venta de productos intermedios, desperdicios y desechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2257, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613554', 2230,
        'Venta de maquinaria, equipo de oficina y programas de computador', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2258, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613556', 2230,
        'Venta de artículos en cacharrerías y misceláneas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2259, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613558', 2230, 'Venta de instrumentos musicales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2260, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613560', 2230,
        'Venta de artículos en casas de empeño y prenderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2261, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613562', 2230, 'Venta de equipo fotográfico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2262, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613564', 2230,
        'Venta de equipo óptico y de precisión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2263, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613566', 2230, 'Venta de empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2264, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613568', 2230,
        'Venta de equipo profesional y científico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2265, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613570', 2230,
        'Venta de loterías, rifas, chance, apuestas y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2266, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613572', 2230,
        'Reparación de efectos personales y electrodomésticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2267, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613595', 2230, 'Venta de otros productos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2268, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '613599', 2230, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2269, 'CO-PUC', 'Costos de ventas', 'xx xx', '6140', 2083, 'Hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2270, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614005', 2269, 'Hotelería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2271, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614010', 2269,
        'Campamento y otros tipos de hospedaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2272, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614015', 2269, 'Restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2273, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614020', 2269, 'Bares y cantinas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2274, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614095', 2269, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2275, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614099', 2269, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2276, 'CO-PUC', 'Costos de ventas', 'xx xx', '6145', 2083,
        'Transporte, almacenamiento y comunicaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2277, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614505', 2276,
        'Servicio de transporte por carretera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2278, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614510', 2276,
        'Servicio de transporte por vía férrea', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2279, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614515', 2276,
        'Servicio de transporte por vía acuática', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2280, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614520', 2276,
        'Servicio de transporte por vía aérea', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2281, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614525', 2276,
        'Servicio de transporte por tuberías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2282, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614530', 2276, 'Manipulación de carga', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2283, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614535', 2276, 'Almacenamiento y depósito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2284, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614540', 2276,
        'Servicios complementarios para el transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2285, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614545', 2276, 'Agencias de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2286, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614550', 2276, 'Otras agencias de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2287, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614555', 2276, 'Servicio postal y de correo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2288, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614560', 2276, 'Servicio telefónico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2289, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614565', 2276, 'Servicio de telégrafo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2290, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614570', 2276, 'Servicio de transmisión de datos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2291, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614575', 2276,
        'Servicio de radio y televisión por cable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2292, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614580', 2276,
        'Transmisión de sonido e imágenes por contrato', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2293, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614595', 2276, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2294, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '614599', 2276, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2295, 'CO-PUC', 'Costos de ventas', 'xx xx', '6150', 2083, 'Actividad financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2296, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615005', 2295, 'De inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2297, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615010', 2295, 'De servicio de bolsa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2298, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615099', 2295, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2299, 'CO-PUC', 'Costos de ventas', 'xx xx', '6155', 2083,
        'Actividades inmobiliarias, empresariales y de alquiler', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2300, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615505', 2299,
        'Arrendamientos de bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2301, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615510', 2299,
        'Inmobiliarias por retribución o contrata', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2302, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615515', 2299, 'Alquiler equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2303, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615520', 2299, 'Alquiler maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2304, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615525', 2299,
        'Alquiler de efectos personales y enseres domésticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2305, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615530', 2299,
        'Consultoría en equipo y programas de informática', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2306, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615535', 2299, 'Procesamiento de datos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2307, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615540', 2299,
        'Mantenimiento y reparación de maquinaria de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2308, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615545', 2299,
        'Investigaciones científicas y de desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2309, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615550', 2299,
        'Actividades empresariales de consultoría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2310, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615555', 2299, 'Publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2311, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615560', 2299, 'Dotación de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2312, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615565', 2299, 'Investigación y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2313, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615570', 2299, 'Limpieza de inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2314, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615575', 2299, 'Fotografía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2315, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615580', 2299, 'Envase y empaque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2316, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615585', 2299, 'Fotocopiado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2317, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615590', 2299,
        'Mantenimiento y reparación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2318, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615595', 2299, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2319, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '615599', 2299, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2320, 'CO-PUC', 'Costos de ventas', 'xx xx', '6160', 2083, 'Enseñanza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2321, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616005', 2320,
        'Actividades relacionadas con la educación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2322, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616095', 2320, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2323, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616099', 2320, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2324, 'CO-PUC', 'Costos de ventas', 'xx xx', '6165', 2083, 'Servicios sociales y de salud', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2325, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616505', 2324, 'Servicio hospitalario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2326, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616510', 2324, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2327, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616515', 2324, 'Servicio odontológico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2328, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616520', 2324, 'Servicio de laboratorio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2329, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616525', 2324, 'Actividades veterinarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2330, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616530', 2324, 'Actividades de servicios sociales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2331, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616595', 2324, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2332, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '616599', 2324, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2333, 'CO-PUC', 'Costos de ventas', 'xx xx', '6170', 2083,
        'Otras actividades de servicios comunitarios, sociales y personales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2334, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617005', 2333,
        'Eliminación de desperdicios y aguas residuales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2335, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617010', 2333, 'Actividades de asociación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2336, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617015', 2333,
        'Producción y distribución de filmes y videocintas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2337, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617020', 2333,
        'Exhibición de filmes y videocintas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2338, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617025', 2333, 'Actividad de radio y televisión',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2339, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617030', 2333,
        'Actividad teatral, musical y artística', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2340, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617035', 2333, 'Grabación y producción de discos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2341, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617040', 2333, 'Entretenimiento y esparcimiento',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2342, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617045', 2333, 'Agencias de noticias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2343, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617050', 2333, 'Lavanderías y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2344, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617055', 2333, 'Peluquerías y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2345, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617060', 2333, 'Servicios funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2346, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617065', 2333, 'Zonas francas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2347, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617095', 2333, 'Actividades conexas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2348, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '617099', 2333, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2349, 'CO-PUC', 'Costos de ventas', 'xx', '62', 2082, 'Compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2350, 'CO-PUC', 'Costos de ventas', 'xx xx', '6205', 2349, 'De mercancías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2351, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '620599', 2350, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2352, 'CO-PUC', 'Costos de ventas', 'xx xx', '6210', 2349, 'De materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2353, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '621099', 2352, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2354, 'CO-PUC', 'Costos de ventas', 'xx xx', '6215', 2349, 'De materiales indirectos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2355, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '621599', 2354, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2356, 'CO-PUC', 'Costos de ventas', 'xx xx', '6220', 2349, 'Compra de energía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2357, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '622099', 2356, 'Ajustes por inflación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2358, 'CO-PUC', 'Costos de ventas', 'xx xx', '6225', 2349, 'Devoluciones en compras (CR)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2359, 'CO-PUC', 'Costos de ventas', 'xx xx xx', '622599', 2358, 'Ajustes por inflación', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2360, 'CO-PUC', 'Costos de producción o de operación', 'x', '7', 0,
        'Costos de producción o de operación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2361, 'CO-PUC', 'Costos de producción o de operación', 'xx', '71', 2360, 'Materia prima', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2362, 'CO-PUC', 'Costos de producción o de operación', 'xx', '72', 2360, 'Mano de obra directa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2363, 'CO-PUC', 'Costos de producción o de operación', 'xx', '73', 2360, 'Costos indirectos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2364, 'CO-PUC', 'Costos de producción o de operación', 'xx', '74', 2360, 'Contratos de servicios',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2365, 'CO-PUC', 'Cuentas de orden deudoras', 'x', '8', 0, 'Cuentas de orden deudoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2366, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '81', 2365, 'Derechos contingentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2367, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8105', 2366,
        'Bienes y valores entregados en custodia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2368, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '810505', 2367, 'Valores mobiliarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2369, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '810510', 2367, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2370, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '810599', 2367, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2371, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8110', 2366,
        'Bienes y valores entregados en garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2372, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811005', 2371, 'Valores mobiliarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2373, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811010', 2371, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2374, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811015', 2371, 'Bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2375, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811020', 2371,
        'Contratos de ganado en participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2376, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811099', 2371, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2377, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8115', 2366,
        'Bienes y valores en poder de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2378, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811505', 2377, 'En arrendamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2379, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811510', 2377, 'En préstamo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2380, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811515', 2377, 'En depósito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2381, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811520', 2377, 'En consignación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2382, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '811599', 2377, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2383, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8120', 2366, 'Litigios y/o demandas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2384, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '812005', 2383, 'Ejecutivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2385, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '812010', 2383,
        'Incumplimiento de contratos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2386, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8125', 2366, 'Promesas de compraventa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2387, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8195', 2366, 'Diversas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2388, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '819505', 2387,
        'Valores adquiridos por recibir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2389, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '819595', 2387, 'Otras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2390, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '819599', 2387, 'Ajustes por inflación',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2391, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '82', 2365, 'Deudoras fiscales', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2392, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '83', 2365, 'Deudoras de control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2393, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8305', 2392,
        'Bienes recibidos en arrendamiento financiero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2394, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '830505', 2393, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2395, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '830510', 2393, 'Bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2396, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '830599', 2393, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2397, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8310', 2392,
        'Títulos de inversión no colocados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2398, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831005', 2397, 'Acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2399, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831010', 2397, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2400, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831095', 2397, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2401, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8315', 2392,
        'Propiedades, planta y equipo totalmente depreciados, agotados y/o amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2402, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831506', 2401,
        'Materiales proyectos petroleros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2403, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831516', 2401,
        'Construcciones y edificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2404, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831520', 2401, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2405, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831524', 2401, 'Equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2406, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831528', 2401,
        'Equipo de computación y comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2407, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831532', 2401, 'Equipo médico-científico',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2408, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831536', 2401,
        'Equipo de hoteles y restaurantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2409, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831540', 2401,
        'Flota y equipo de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2410, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831544', 2401,
        'Flota y equipo fluvial y/o marítimo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2411, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831548', 2401, 'Flota y equipo aéreo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2412, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831552', 2401, 'Flota y equipo férreo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2413, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831556', 2401,
        'Acueductos, plantas y redes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2414, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831560', 2401, 'Armamento de vigilancia',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2415, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831562', 2401, 'Envases y empaques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2416, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831564', 2401,
        'Plantaciones agrícolas y forestales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2417, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831568', 2401, 'Vías de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2418, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831572', 2401, 'Minas y canteras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2419, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831576', 2401, 'Pozos artesianos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2420, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831580', 2401, 'Yacimientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2421, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831584', 2401, 'Semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2422, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '831599', 2401, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2423, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8320', 2392,
        'Créditos a favor no utilizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2424, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '832005', 2423, 'País', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2425, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '832010', 2423, 'Exterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2426, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8325', 2392, 'Activos castigados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2427, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '832505', 2427, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2428, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '832510', 2427, 'Deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2429, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '832595', 2427, 'Otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2430, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8330', 2392,
        'Títulos de inversión amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2431, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '833005', 2430, 'Bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2432, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '833095', 2430, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2433, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8335', 2392,
        'Capitalización por revalorización de patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2434, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8395', 2392,
        'Otras cuentas deudoras de control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2435, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839505', 2434, 'Cheques posfechados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2436, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839510', 2434,
        'Certificados de depósito a término', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2437, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839515', 2434, 'Cheques devueltos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2438, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839520', 2434,
        'Bienes y valores en fideicomiso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2439, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839525', 2434,
        'Intereses sobre deudas vencidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2440, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839595', 2434, 'Diversas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2441, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839599', 2434, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2442, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx', '8399', 2392, 'Ajustes por inflación activos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2443, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839905', 2442, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2444, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839910', 2442, 'Inventarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2445, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839915', 2442,
        'Propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2446, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839920', 2442, 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2447, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839925', 2442, 'Cargos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2448, 'CO-PUC', 'Cuentas de orden deudoras', 'xx xx xx', '839995', 2442, 'Otros activos', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2449, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '84', 2365,
        'Derechos contingentes por contra (CR)', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2450, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '85', 2365, 'Deudoras fiscales por contra (CR)',
        1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2451, 'CO-PUC', 'Cuentas de orden deudoras', 'xx', '86', 2365,
        'Deudoras de control por contra (CR)', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2452, 'CO-PUC', 'Cuentas de orden acreedoras', 'x', '9', 0, 'Cuentas de orden acreedoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2453, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '91', 2452, 'Responsabilidades contingentes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2454, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9105', 2453,
        'Bienes y valores recibidos en custodia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2455, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '910505', 2454, 'Valores mobiliarios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2456, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '910510', 2454, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2457, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '910599', 2454, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2458, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9110', 2453,
        'Bienes y valores recibidos en garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2459, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911005', 2458, 'Valores mobiliarios',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2460, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911010', 2458, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2461, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911015', 2458, 'Bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2462, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911020', 2458,
        'Contratos de ganado en participación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2463, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911099', 2458, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2464, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9115', 2453,
        'Bienes y valores recibidos de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2465, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911505', 2464, 'En arrendamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2466, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911510', 2464, 'En préstamo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2467, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911515', 2464, 'En depósito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2468, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911520', 2464, 'En consignación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2469, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911525', 2464, 'En comodato', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2470, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '911599', 2464, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2471, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9120', 2453, 'Litigios y/o demandas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2472, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '912005', 2471, 'Laborales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2473, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '912010', 2471, 'Civiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2474, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '912015', 2471,
        'Administrativos o arbitrales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2475, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '912020', 2471, 'Tributarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2476, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9125', 2453, 'Promesas de compraventa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2477, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9130', 2453,
        'Contratos de administración delegada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2478, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9135', 2453, 'Cuentas en participación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2479, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9195', 2453,
        'Otras responsabilidades contingentes', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2480, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '92', 2452, 'Acreedoras fiscales', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2481, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '93', 2452, 'Acreedoras de control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2482, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9305', 2481,
        'Contratos de arrendamiento financiero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2483, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '930505', 2482, 'Bienes muebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2484, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '930510', 2482, 'Bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2485, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9395', 2481,
        'Otras cuentas de orden acreedoras de control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2486, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939505', 2485,
        'Documentos por cobrar descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2487, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939510', 2485, 'Convenios de pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2488, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939515', 2485,
        'Contratos de construcciones e instalaciones por ejecutar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2489, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939525', 2485,
        'Adjudicaciones pendientes de legalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2490, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939530', 2485,
        'Reserva artículo 3º Ley 4ª de 1980', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2491, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939535', 2485,
        'Reserva costo reposición semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2492, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939595', 2485, 'Diversas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2493, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939599', 2485, 'Ajustes por inflación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2494, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx', '9399', 2481,
        'Ajustes por inflación patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2495, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939905', 2494, 'Capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2496, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939910', 2494, 'Superávit de capital',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2497, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939915', 2494, 'Reservas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2498, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939925', 2494,
        'Dividendos o participaciones decretadas en acciones, cuotas o partes de interés social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2499, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx xx xx', '939930', 2494,
        'Resultados de ejercicios anteriores', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2500, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '94', 2452,
        'Responsabilidades contingentes por contra (DB)', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2501, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '95', 2452,
        'Acreedoras fiscales por contra (DB)', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, pcg_subtype, account_number,
                                    account_parent, label, active)
VALUES (__ENTITY__, 2502, 'CO-PUC', 'Cuentas de orden acreedoras', 'xx', '96', 2452,
        'Acreedoras de control por contra (DB)', 1);
