-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2011-2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
-- Copyright (C) 2017      Juanjo Menent        <jmenent@2byte.es>
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

-- Description of chart of account EC EC-SUPERCIAS
-- ID 1 - 445
-- ADD 8400000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1, 'EC-SUPERCIAS', 'Activo', '1', 0, 'ACTIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2, 'EC-SUPERCIAS', 'Activo', '101', 1, 'ACTIVO CORRIENTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3, 'EC-SUPERCIAS', 'Activo', '10101', 2, 'EFECTIVO Y EQUIVALENTES AL EFECTIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4, 'EC-SUPERCIAS', 'Activo', '10102', 2, 'ACTIVOS FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5, 'EC-SUPERCIAS', 'Activo', '1010201', 4,
        'ACTIVOS FINANCIEROS A VALOR RAZONABLE CON CAMBIOS EN RESULTADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6, 'EC-SUPERCIAS', 'Activo', '1010202', 4, 'ACTIVOS FINANCIEROS DISPONIBLES PARA LA VENTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7, 'EC-SUPERCIAS', 'Activo', '1010203', 4, 'ACTIVOS FINANCIEROS MANTENIDOS HASTA EL VENCIMIENTO',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8, 'EC-SUPERCIAS', 'Activo', '1010204', 4, '(-) PROVISION POR DETERIORO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9, 'EC-SUPERCIAS', 'Activo', '1010205', 4,
        'DOCUMENTOS Y CUENTAS POR COBRAR CLIENTES NO RELACIONADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10, 'EC-SUPERCIAS', 'Activo', '101020501', 9, 'DE ACTIVIDADES ORDINARIAS QUE GENEREN INTERESES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11, 'EC-SUPERCIAS', 'Activo', '101020502', 9, 'DE ACTIVIDADES ORDINARIAS QUE NO GENEREN INTERESES',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12, 'EC-SUPERCIAS', 'Activo', '1010206', 4, 'DOCUMENTOS Y CUENTAS POR COBRAR CLIENTES RELACIONADOS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13, 'EC-SUPERCIAS', 'Activo', '1010207', 4, 'OTRAS CUENTAS POR COBRAR RELACIONADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 14, 'EC-SUPERCIAS', 'Activo', '1010208', 4, 'OTRAS CUENTAS POR COBRAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15, 'EC-SUPERCIAS', 'Activo', '1010209', 4, '(-) PROVISIÓN CUENTAS INCOBRABLES Y DETERIORO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16, 'EC-SUPERCIAS', 'Activo', '10103', 2, 'INVENTARIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 17, 'EC-SUPERCIAS', 'Activo', '1010301', 16, 'INVENTARIOS DE MATERIA PRIMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 18, 'EC-SUPERCIAS', 'Activo', '1010302', 16, 'INVENTARIOS DE PRODUCTOS EN PROCESO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 19, 'EC-SUPERCIAS', 'Activo', '1010303', 16,
        'INVENTARIOS DE SUMINISTROS O MATERIALES A SER CONSUMIDOS EN EL PROCESO DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 20, 'EC-SUPERCIAS', 'Activo', '1010304', 16,
        'INVENTARIOS DE SUMINISTROS O MATERIALES A SER CONSUMIDOS EN LA PRESTACIÓN DE SERVICIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21, 'EC-SUPERCIAS', 'Activo', '1010305', 16,
        'INVENTARIOS DE PRODUCTOS TERMINADOS Y MERCADERIA EN ALMACÉN - PRODUCIDO POR LA COMPAÑÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22, 'EC-SUPERCIAS', 'Activo', '1010306', 16,
        'INVENTARIOS DE PRODUCTOS TERMINADOS Y MERCADERIA EN ALMACÉN - COMPRADO DE TERCEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 23, 'EC-SUPERCIAS', 'Activo', '1010307', 16, 'MERCADERÍAS EN TRÁNSITO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 24, 'EC-SUPERCIAS', 'Activo', '1010308', 16, 'OBRAS EN CONSTRUCCION', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 25, 'EC-SUPERCIAS', 'Activo', '1010309', 16, 'OBRAS TERMINADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 26, 'EC-SUPERCIAS', 'Activo', '1010310', 16, 'MATERIALES O BIENES PARA LA CONSTRUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 27, 'EC-SUPERCIAS', 'Activo', '1010311', 16, 'INVENTARIOS REPUESTOS, HERRAMIENTAS Y ACCESORIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 28, 'EC-SUPERCIAS', 'Activo', '1010312', 16, 'OTROS INVENTARIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 29, 'EC-SUPERCIAS', 'Activo', '1010313', 16,
        '(-) PROVISIÓN POR VALOR NETO DE REALIZACIÓN Y OTRAS PÉRDIDAS EN EL INVENTARIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30, 'EC-SUPERCIAS', 'Activo', '10104', 2, 'SERVICIOS Y OTROS PAGOS ANTICIPADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31, 'EC-SUPERCIAS', 'Activo', '1010401', 30, 'SEGUROS PAGADOS POR ANTICIPADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 32, 'EC-SUPERCIAS', 'Activo', '1010402', 30, 'ARRIENDOS PAGADOS POR ANTICIPADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 33, 'EC-SUPERCIAS', 'Activo', '1010403', 30, 'ANTICIPOS A PROVEEDORES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 34, 'EC-SUPERCIAS', 'Activo', '1010404', 30, 'OTROS ANTICIPOS ENTREGADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 35, 'EC-SUPERCIAS', 'Activo', '10105', 2, 'ACTIVOS POR IMPUESTOS CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 36, 'EC-SUPERCIAS', 'Activo', '1010501', 35, 'CRÉDITO TRIBUTARIO A FAVOR DE LA EMPRESA (IVA)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 37, 'EC-SUPERCIAS', 'Activo', '1010502', 35, 'CRÉDITO TRIBUTARIO A FAVOR DE LA EMPRESA ( I. R.)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 38, 'EC-SUPERCIAS', 'Activo', '1010503', 35, 'ANTICIPO DE IMPUESTO A LA RENTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 39, 'EC-SUPERCIAS', 'Activo', '10106', 2,
        'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA Y OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 40, 'EC-SUPERCIAS', 'Activo', '10107', 2, 'CONSTRUCCIONES EN PROCESO (NIC 11 Y SECC.23 PYMES)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41, 'EC-SUPERCIAS', 'Activo', '10108', 2, 'OTROS ACTIVOS CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 42, 'EC-SUPERCIAS', 'Activo', '102', 1, 'ACTIVO NO CORRIENTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 43, 'EC-SUPERCIAS', 'Activo', '10201', 42, 'PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 44, 'EC-SUPERCIAS', 'Activo', '1020101', 43, 'TERRENOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 45, 'EC-SUPERCIAS', 'Activo', '1020102', 43, 'EDIFICIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 46, 'EC-SUPERCIAS', 'Activo', '1020103', 43, 'CONTRUCCIONES EN CURSO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 47, 'EC-SUPERCIAS', 'Activo', '1020104', 43, 'INSTALACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 48, 'EC-SUPERCIAS', 'Activo', '1020105', 43, 'MUEBLES Y ENSERES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 49, 'EC-SUPERCIAS', 'Activo', '1020106', 43, 'MAQUINARIA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 50, 'EC-SUPERCIAS', 'Activo', '1020107', 43, 'NAVES, AERONAVES, BARCAZAS Y SIMILARES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51, 'EC-SUPERCIAS', 'Activo', '1020108', 43, 'EQUIPO DE COMPUTACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52, 'EC-SUPERCIAS', 'Activo', '1020109', 43,
        'VEHÍCULOS, EQUIPOS DE TRANSPORTE Y EQUIPO CAMINERO MÓVIL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 53, 'EC-SUPERCIAS', 'Activo', '1020110', 43, 'OTROS PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 54, 'EC-SUPERCIAS', 'Activo', '1020111', 43, 'REPUESTOS Y HERRAMIENTAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 55, 'EC-SUPERCIAS', 'Activo', '1020112', 43,
        '(-) DEPRECIACIÓN ACUMULADA PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 56, 'EC-SUPERCIAS', 'Activo', '1020113', 43,
        '(-) DETERIORO ACUMULADO DE PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 57, 'EC-SUPERCIAS', 'Activo', '1020114', 43, 'ACTIVOS DE EXPLORACIÓN Y EXPLOTACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 58, 'EC-SUPERCIAS', 'Activo', '102011401', 57, 'ACTIVOS DE EXPLORACIÓN Y EXPLOTACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 59, 'EC-SUPERCIAS', 'Activo', '102011402', 57,
        '(-) AMORTIZACIÓN ACUMULADA DE ACTIVOS DE EXLORACIÓN Y EXPLOTACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 60, 'EC-SUPERCIAS', 'Activo', '102011403', 57,
        '(-) DETERIORO ACUMULADO DE ACTIVOS DE EXPLORACIÓN Y EXPLOTACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61, 'EC-SUPERCIAS', 'Activo', '10202', 42, 'PROPIEDADES DE INVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62, 'EC-SUPERCIAS', 'Activo', '1020201', 61, 'TERRENOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 63, 'EC-SUPERCIAS', 'Activo', '1020202', 61, 'EDIFICIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 64, 'EC-SUPERCIAS', 'Activo', '1020203', 61,
        '(-) DEPRECIACION ACUMULADA DE PROPIEDADES DE INVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 65, 'EC-SUPERCIAS', 'Activo', '1020204', 61, '(-) DETERIORO ACUMULADO DE PROPIEDADES DE INVERSIÓN',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 66, 'EC-SUPERCIAS', 'Activo', '10203', 42, 'ACTIVOS BIOLOGICOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 67, 'EC-SUPERCIAS', 'Activo', '1020301', 66, 'ANIMALES VIVOS EN CRECIMIENTO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 68, 'EC-SUPERCIAS', 'Activo', '1020302', 66, 'ANIMALES VIVOS EN PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 69, 'EC-SUPERCIAS', 'Activo', '1020303', 66, 'PLANTAS EN CRECIMIENTO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70, 'EC-SUPERCIAS', 'Activo', '1020304', 66, 'PLANTAS EN PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71, 'EC-SUPERCIAS', 'Activo', '1020305', 66, '(-) DEPRECIACIÓN ACUMULADA DE ACTIVOS BIOLÓGICOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 72, 'EC-SUPERCIAS', 'Activo', '1020306', 66, '(-) DETERIORO ACUMULADO DE ACTIVOS BIOLÓGICOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 73, 'EC-SUPERCIAS', 'Activo', '10204', 42, 'ACTIVO INTANGIBLE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 74, 'EC-SUPERCIAS', 'Activo', '1020401', 73, 'PLUSVALÍAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 75, 'EC-SUPERCIAS', 'Activo', '1020402', 73,
        'MARCAS, PATENTES, DERECHOS DE LLAVE, CUOTAS PATRIMONIALES Y OTROS SIMILARES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 76, 'EC-SUPERCIAS', 'Activo', '1020403', 73, 'ACTIVOS DE EXPLORACION Y EXPLOTACION', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 77, 'EC-SUPERCIAS', 'Activo', '1020404', 73, '(-) AMORTIZACIÓN ACUMULADA DE ACTIVO INTANGIBLE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 78, 'EC-SUPERCIAS', 'Activo', '1020405', 73, '(-) DETERIORO ACUMULADO DE ACTIVO INTANGIBLE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 79, 'EC-SUPERCIAS', 'Activo', '1020406', 73, 'OTROS INTANGIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 80, 'EC-SUPERCIAS', 'Activo', '10205', 42, 'ACTIVOS POR IMPUESTOS DIFERIDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81, 'EC-SUPERCIAS', 'Activo', '10206', 42, 'ACTIVOS FINANCIEROS NO CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82, 'EC-SUPERCIAS', 'Activo', '1020601', 81, 'ACTIVOS FINANCIEROS MANTENIDOS HASTA EL VENCIMIENTO',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 83, 'EC-SUPERCIAS', 'Activo', '1020602', 81,
        '(-) PROVISIÓN POR DETERIORO DE ACTIVOS FINANCIEROS MANTENIDOS HASTA EL VENCIMIENTO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 84, 'EC-SUPERCIAS', 'Activo', '1020603', 81, 'DOCUMENTOS Y CUENTAS POR COBRAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 85, 'EC-SUPERCIAS', 'Activo', '1020604', 81,
        '(-) PROVISIÓN CUENTAS INCOBRABLES DE ACTIVOS FINANCIEROS NO CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 86, 'EC-SUPERCIAS', 'Activo', '10207', 42, 'OTROS ACTIVOS NO CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 87, 'EC-SUPERCIAS', 'Activo', '1020701', 86, 'INVERSIONES SUBSIDIARIAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 88, 'EC-SUPERCIAS', 'Activo', '1020702', 86, 'INVERSIONES ASOCIADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 89, 'EC-SUPERCIAS', 'Activo', '1020703', 86, 'INVERSIONES NEGOCIOS CONJUNTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 90, 'EC-SUPERCIAS', 'Activo', '1020704', 86, 'OTRAS INVERSIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 91, 'EC-SUPERCIAS', 'Activo', '1020705', 86, '(-) PROVISIÓN VALUACIÓN DE INVERSIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 92, 'EC-SUPERCIAS', 'Activo', '1020706', 86, 'OTROS ACTIVOS NO CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 93, 'EC-SUPERCIAS', 'Pasivo', '2', 0, 'PASIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 94, 'EC-SUPERCIAS', 'Pasivo', '201', 93, 'PASIVO CORRIENTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 95, 'EC-SUPERCIAS', 'Pasivo', '20101', 94,
        'PASIVOS FINANCIEROS A VALOR RAZONABLE CON CAMBIOS EN RESULTADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 96, 'EC-SUPERCIAS', 'Pasivo', '20102', 94, 'PASIVOS POR CONTRATOS DE ARRENDAMIENTO FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 97, 'EC-SUPERCIAS', 'Pasivo', '20103', 94, 'CUENTAS Y DOCUMENTOS POR PAGAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 98, 'EC-SUPERCIAS', 'Pasivo', '2010301', 97, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 99, 'EC-SUPERCIAS', 'Pasivo', '2010302', 97, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 100, 'EC-SUPERCIAS', 'Pasivo', '20104', 94, 'OBLIGACIONES CON INSTITUCIONES FINANCIERAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 101, 'EC-SUPERCIAS', 'Pasivo', '2010401', 100, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 102, 'EC-SUPERCIAS', 'Pasivo', '2010402', 100, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 103, 'EC-SUPERCIAS', 'Pasivo', '20105', 94, 'PROVISIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 104, 'EC-SUPERCIAS', 'Pasivo', '2010501', 103, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 105, 'EC-SUPERCIAS', 'Pasivo', '2010502', 103, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 106, 'EC-SUPERCIAS', 'Pasivo', '20106', 94, 'PORCIÓN CORRIENTE DE OBLIGACIONES EMITIDAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 107, 'EC-SUPERCIAS', 'Pasivo', '20107', 94, 'OTRAS OBLIGACIONES CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 108, 'EC-SUPERCIAS', 'Pasivo', '2010701', 107, 'CON LA ADMINISTRACIÓN TRIBUTARIA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 109, 'EC-SUPERCIAS', 'Pasivo', '2010702', 107, 'IMPUESTO A LA RENTA POR PAGAR DEL EJERCICIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 110, 'EC-SUPERCIAS', 'Pasivo', '2010703', 107, 'CON EL IESS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 111, 'EC-SUPERCIAS', 'Pasivo', '2010704', 107, 'POR BENEFICIOS DE LEY A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 112, 'EC-SUPERCIAS', 'Pasivo', '2010705', 107, 'PARTICIPACIÓN TRABAJADORES POR PAGAR DEL EJERCICIO',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 113, 'EC-SUPERCIAS', 'Pasivo', '2010706', 107, 'DIVIDENDOS POR PAGAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 114, 'EC-SUPERCIAS', 'Pasivo', '20108', 94, 'CUENTAS POR PAGAR DIVERSAS – RELACIONADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 115, 'EC-SUPERCIAS', 'Pasivo', '20109', 94, 'OTROS PASIVOS FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 116, 'EC-SUPERCIAS', 'Pasivo', '20110', 94, 'ANTICIPOS DE CLIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 117, 'EC-SUPERCIAS', 'Pasivo', '20111', 94,
        'PASIVOS DIRECTAMENTE ASOCIADOS CON LOS ACTIVOS NO CORRIENTES Y OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 118, 'EC-SUPERCIAS', 'Pasivo', '20112', 94,
        'PORCIÓN CORRIENTE DE PROVISIONES POR BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 119, 'EC-SUPERCIAS', 'Pasivo', '2011201', 118, 'JUBILACIÓN PATRONAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 120, 'EC-SUPERCIAS', 'Pasivo', '2011202', 118, 'OTROS BENEFICIOS A LARGO PLAZO PARA LOS EMPLEADOS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 121, 'EC-SUPERCIAS', 'Pasivo', '20113', 94, 'OTROS PASIVOS CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 122, 'EC-SUPERCIAS', 'Pasivo', '202', 93, 'PASIVO NO CORRIENTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 123, 'EC-SUPERCIAS', 'Pasivo', '20201', 122, 'PASIVOS POR CONTRATOS DE ARRENDAMIENTO FINANCIERO',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 124, 'EC-SUPERCIAS', 'Pasivo', '20202', 122, 'CUENTAS Y DOCUMENTOS POR PAGAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 125, 'EC-SUPERCIAS', 'Pasivo', '2020201', 124, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 126, 'EC-SUPERCIAS', 'Pasivo', '2020202', 124, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 127, 'EC-SUPERCIAS', 'Pasivo', '20203', 122, 'OBLIGACIONES CON INSTITUCIONES FINANCIERAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 128, 'EC-SUPERCIAS', 'Pasivo', '2020301', 127, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 129, 'EC-SUPERCIAS', 'Pasivo', '2020302', 127, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 130, 'EC-SUPERCIAS', 'Pasivo', '20204', 122, 'CUENTAS POR PAGAR DIVERSAS / RELACIONADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 131, 'EC-SUPERCIAS', 'Pasivo', '2020401', 130, 'LOCALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 132, 'EC-SUPERCIAS', 'Pasivo', '2020402', 130, 'DEL EXTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 133, 'EC-SUPERCIAS', 'Pasivo', '20205', 122, 'OBLIGACIONES EMITIDAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 134, 'EC-SUPERCIAS', 'Pasivo', '20206', 122, 'ANTICIPOS DE CLIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 135, 'EC-SUPERCIAS', 'Pasivo', '20207', 122, 'PROVISIONES POR BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 136, 'EC-SUPERCIAS', 'Pasivo', '2020701', 135, 'JUBILACIÓN PATRONAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 137, 'EC-SUPERCIAS', 'Pasivo', '2020702', 135, 'OTROS BENEFICIOS NO CORRIENTES PARA LOS EMPLEADOS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 138, 'EC-SUPERCIAS', 'Pasivo', '20208', 122, 'OTRAS PROVISIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 139, 'EC-SUPERCIAS', 'Pasivo', '20209', 122, 'PASIVO DIFERIDO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 140, 'EC-SUPERCIAS', 'Pasivo', '2020901', 139, 'INGRESOS DIFERIDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 141, 'EC-SUPERCIAS', 'Pasivo', '2020902', 139, 'PASIVOS POR IMPUESTOS DIFERIDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 142, 'EC-SUPERCIAS', 'Pasivo', '20210', 122, 'OTROS PASIVOS NO CORRIENTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 143, 'EC-SUPERCIAS', 'Patrimonio', '3', 0, 'PATRIMONIO NETO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 144, 'EC-SUPERCIAS', 'Patrimonio', '30', 0,
        'PATRIMONIO ATRIBUIBLE A LOS PROPIETARIOS DE LA CONTROLADORA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 145, 'EC-SUPERCIAS', 'Patrimonio', '301', 143, 'CAPITAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 146, 'EC-SUPERCIAS', 'Patrimonio', '30101', 145, 'CAPITAL SUSCRITO o ASIGNADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 147, 'EC-SUPERCIAS', 'Patrimonio', '30102', 145,
        '(-) CAPITAL SUSCRITO NO PAGADO, ACCIONES EN TESORERÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 148, 'EC-SUPERCIAS', 'Patrimonio', '302', 143,
        'APORTES DE SOCIOS O ACCIONISTAS PARA FUTURA CAPITALIZACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 149, 'EC-SUPERCIAS', 'Patrimonio', '303', 143, 'PRIMA POR EMISION PRIMARIA DE ACCIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 150, 'EC-SUPERCIAS', 'Patrimonio', '304', 143, 'RESERVAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 151, 'EC-SUPERCIAS', 'Patrimonio', '30401', 150, 'RESERVA LEGAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 152, 'EC-SUPERCIAS', 'Patrimonio', '30402', 150, 'RESERVAS FACULTATIVA Y ESTATUTARIA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 153, 'EC-SUPERCIAS', 'Patrimonio', '305', 143, 'OTROS RESULTADOS INTEGRALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 154, 'EC-SUPERCIAS', 'Patrimonio', '30501', 153,
        'SUPERAVIT DE ACTIVOS FINANCIEROS DISPONIBLES PARA LA VENTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 155, 'EC-SUPERCIAS', 'Patrimonio', '30502', 153,
        'SUPERAVIT POR REVALUACIÓN DE PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 156, 'EC-SUPERCIAS', 'Patrimonio', '30503', 153, 'SUPERAVIT POR REVALUACION DE ACTIVOS INTANGIBLES',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 157, 'EC-SUPERCIAS', 'Patrimonio', '30504', 153, 'OTROS SUPERAVIT POR REVALUACION', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 158, 'EC-SUPERCIAS', 'Patrimonio', '306', 143, 'RESULTADOS ACUMULADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 159, 'EC-SUPERCIAS', 'Patrimonio', '30601', 158, 'GANACIAS ACUMULADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 160, 'EC-SUPERCIAS', 'Patrimonio', '30602', 158, '(-) PÉRDIDAS ACUMULADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 161, 'EC-SUPERCIAS', 'Patrimonio', '30603', 158,
        'RESULTADOS ACUMULADOS PROVENIENTES DE LA ADOPCIÓN POR PRIMERA VEZ DE LAS NIIF', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 162, 'EC-SUPERCIAS', 'Patrimonio', '30604', 158, 'RESERVA DE CAPITAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 163, 'EC-SUPERCIAS', 'Patrimonio', '30605', 158, 'RESERVA POR DONACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 164, 'EC-SUPERCIAS', 'Patrimonio', '30606', 158, 'RESERVA POR VALUACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 165, 'EC-SUPERCIAS', 'Patrimonio', '30607', 158, 'SUPERÁVIT POR REVALUACIÓN DE INVERSIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 166, 'EC-SUPERCIAS', 'Patrimonio', '307', 143, 'RESULTADOS DEL EJERCICIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 167, 'EC-SUPERCIAS', 'Patrimonio', '30701', 166, 'GANANCIA NETA DEL PERIODO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 168, 'EC-SUPERCIAS', 'Patrimonio', '30702', 166, '(-) PÉRDIDA NETA DEL PERIODO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 169, 'EC-SUPERCIAS', 'Patrimonio', '31', 0, 'PARTICIPACIÓN NO CONTROLADORA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 170, 'EC-SUPERCIAS', 'Ingresos', '41', 0, 'INGRESOS DE ACTIVIDADES ORDINARIAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 171, 'EC-SUPERCIAS', 'Ingresos', '4101', 170, 'VENTA DE BIENES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 172, 'EC-SUPERCIAS', 'Ingresos', '4102', 170, 'PRESTACIÓN DE SERVICIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 173, 'EC-SUPERCIAS', 'Ingresos', '4103', 170, 'CONTRATOS DE CONSTRUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 174, 'EC-SUPERCIAS', 'Ingresos', '4104', 170, 'SUBVENCIONES DEL GOBIERNO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 175, 'EC-SUPERCIAS', 'Ingresos', '4105', 170, 'REGALÍAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 176, 'EC-SUPERCIAS', 'Ingresos', '4106', 170, 'INTERESES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 177, 'EC-SUPERCIAS', 'Ingresos', '410601', 176, 'INTERESES GENERADOS POR VENTAS A CRÉDITO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 178, 'EC-SUPERCIAS', 'Ingresos', '410602', 176, 'OTROS INTERESES GENERADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 179, 'EC-SUPERCIAS', 'Ingresos', '4107', 170, 'DIVIDENDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 180, 'EC-SUPERCIAS', 'Ingresos', '4108', 170,
        'GANANCIA POR MEDICIÓN A VALOR RAZONABLE DE ACTIVOS BIOLÓGICOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 181, 'EC-SUPERCIAS', 'Ingresos', '4109', 170, 'OTROS INGRESOS DE ACTIVIDADES ORDINARIAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 182, 'EC-SUPERCIAS', 'Ingresos', '4110', 170, '(-) DESCUENTO EN VENTAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 183, 'EC-SUPERCIAS', 'Ingresos', '4111', 170, '(-) DEVOLUCIONES EN VENTAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 184, 'EC-SUPERCIAS', 'Ingresos', '4112', 170, '(-) BONIFICACIÓN EN PRODUCTO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 185, 'EC-SUPERCIAS', 'Ingresos', '4113', 170, '(-) OTRAS REBAJAS COMERCIALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 186, 'EC-SUPERCIAS', 'Ingresos', '42', 0, 'GANANCIA BRUTA --> Subtotal A (41 - 51)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 187, 'EC-SUPERCIAS', 'Ingresos', '43', 0, 'OTROS INGRESOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 188, 'EC-SUPERCIAS', 'Ingresos', '4301', 187, 'DIVIDENDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 189, 'EC-SUPERCIAS', 'Ingresos', '4302', 187, 'INTERESES FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 190, 'EC-SUPERCIAS', 'Ingresos', '4303', 187,
        'GANANCIA EN INVERSIONES EN ASOCIADAS / SUBSIDIARIAS Y OTRAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 191, 'EC-SUPERCIAS', 'Ingresos', '4304', 187,
        'VALUACIÓN DE INSTRUMENTOS FINANCIEROS A VALOR RAZONABLE CON CAMBIO EN RESULTADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 192, 'EC-SUPERCIAS', 'Ingresos', '4305', 187, 'OTRAS RENTAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 193, 'EC-SUPERCIAS', 'Egresos', '51', 0, 'COSTO DE VENTAS Y PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 194, 'EC-SUPERCIAS', 'Egresos', '5101', 193, 'MATERIALES UTILIZADOS O PRODUCTOS VENDIDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 195, 'EC-SUPERCIAS', 'Egresos', '510101', 194,
        '(+) INVENTARIO INICIAL DE BIENES NO PRODUCIDOS POR LA COMPAÑÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 196, 'EC-SUPERCIAS', 'Egresos', '510102', 194,
        '(+) COMPRAS NETAS LOCALES DE BIENES NO PRODUCIDOS POR LA COMPAÑÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 197, 'EC-SUPERCIAS', 'Egresos', '510103', 194,
        '(+) IMPORTACIONES DE BIENES NO PRODUCIDOS POR LA COMPAÑÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 198, 'EC-SUPERCIAS', 'Egresos', '510104', 194,
        '(-) INVENTARIO FINAL DE BIENES NO PRODUCIDOS POR LA COMPAÑÍA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 199, 'EC-SUPERCIAS', 'Egresos', '510105', 194, '(+) INVENTARIO INICIAL DE MATERIA PRIMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 200, 'EC-SUPERCIAS', 'Egresos', '510106', 194, '(+) COMPRAS NETAS LOCALES DE MATERIA PRIMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 201, 'EC-SUPERCIAS', 'Egresos', '510107', 194, '(+) IMPORTACIONES DE MATERIA PRIMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 202, 'EC-SUPERCIAS', 'Egresos', '510108', 194, '(-) INVENTARIO FINAL DE MATERIA PRIMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 203, 'EC-SUPERCIAS', 'Egresos', '510109', 194, '(+) INVENTARIO INICIAL DE PRODUCTOS EN PROCESO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 204, 'EC-SUPERCIAS', 'Egresos', '510110', 194, '(-) INVENTARIO FINAL DE PRODUCTOS EN PROCESO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 205, 'EC-SUPERCIAS', 'Egresos', '510111', 194, '(+) INVENTARIO INICIAL PRODUCTOS TERMINADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 206, 'EC-SUPERCIAS', 'Egresos', '510112', 194, '(-) INVENTARIO FINAL DE PRODUCTOS TERMINADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 207, 'EC-SUPERCIAS', 'Egresos', '5102', 193, '(+) MANO DE OBRA DIRECTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 208, 'EC-SUPERCIAS', 'Egresos', '510201', 207, 'SUELDOS Y BENEFICIOS SOCIALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 209, 'EC-SUPERCIAS', 'Egresos', '510202', 207, 'GASTO PLANES DE BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 210, 'EC-SUPERCIAS', 'Egresos', '5103', 193, '(+) MANO DE OBRA INDIRECTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 211, 'EC-SUPERCIAS', 'Egresos', '510301', 210, 'SUELDOS Y BENEFICIOS SOCIALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 212, 'EC-SUPERCIAS', 'Egresos', '510302', 210, 'GASTO PLANES DE BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 213, 'EC-SUPERCIAS', 'Egresos', '5104', 193, '(+) OTROS COSTOS INDIRECTOS DE FABRICACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 214, 'EC-SUPERCIAS', 'Egresos', '510401', 213, 'DEPRECIACIÓN PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 215, 'EC-SUPERCIAS', 'Egresos', '510402', 213, 'DETERIORO O PÉRDIDAS DE ACTIVOS BIOLÓGICOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 216, 'EC-SUPERCIAS', 'Egresos', '510403', 213, 'DETERIORO DE PROPIEDAD, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 217, 'EC-SUPERCIAS', 'Egresos', '510404', 213, 'EFECTO VALOR NETO DE REALIZACIÓN DE INVENTARIOS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 218, 'EC-SUPERCIAS', 'Egresos', '510405', 213,
        'GASTO POR GARANTÍAS EN VENTA DE PRODUCTOS O SERVICIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 219, 'EC-SUPERCIAS', 'Egresos', '510406', 213, 'MANTENIMIENTO Y REPARACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 220, 'EC-SUPERCIAS', 'Egresos', '510407', 213, 'SUMINISTROS MATERIALES Y REPUESTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 221, 'EC-SUPERCIAS', 'Egresos', '510408', 213, 'OTROS COSTOS DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 222, 'EC-SUPERCIAS', 'Egresos', '52', 0, 'GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 223, 'EC-SUPERCIAS', 'Egresos', '5201', 222, 'GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 224, 'EC-SUPERCIAS', 'Egresos', '520101', 223, 'SUELDOS, SALARIOS Y DEMÁS REMUNERACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 225, 'EC-SUPERCIAS', 'Egresos', '520102', 223,
        'APORTES A LA SEGURIDAD SOCIAL (incluido fondo de reserva)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 226, 'EC-SUPERCIAS', 'Egresos', '520103', 223, 'BENEFICIOS SOCIALES E INDEMNIZACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 227, 'EC-SUPERCIAS', 'Egresos', '520104', 223, 'GASTO PLANES DE BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 228, 'EC-SUPERCIAS', 'Egresos', '520105', 223,
        'HONORARIOS, COMISIONES Y DIETAS A PERSONAS NATURALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 229, 'EC-SUPERCIAS', 'Egresos', '520106', 223, 'REMUNERACIONES A OTROS TRABAJADORES AUTÓNOMOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 230, 'EC-SUPERCIAS', 'Egresos', '520107', 223, 'HONORARIOS A EXTRANJEROS POR SERVICIOS OCASIONALES',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 231, 'EC-SUPERCIAS', 'Egresos', '520108', 223, 'MANTENIMIENTO Y REPARACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 232, 'EC-SUPERCIAS', 'Egresos', '520109', 223, 'ARRENDAMIENTO OPERATIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 233, 'EC-SUPERCIAS', 'Egresos', '520110', 223, 'COMISIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 234, 'EC-SUPERCIAS', 'Egresos', '520111', 223, 'PROMOCIÓN Y PUBLICIDAD', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 235, 'EC-SUPERCIAS', 'Egresos', '520112', 223, 'COMBUSTIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 236, 'EC-SUPERCIAS', 'Egresos', '520113', 223, 'LUBRICANTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 237, 'EC-SUPERCIAS', 'Egresos', '520114', 223, 'SEGUROS Y REASEGUROS (primas y cesiones)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 238, 'EC-SUPERCIAS', 'Egresos', '520115', 223, 'TRANSPORTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 239, 'EC-SUPERCIAS', 'Egresos', '520116', 223,
        'GASTOS DE GESTIÓN (agasajos a accionistas, trabajadores y clientes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 240, 'EC-SUPERCIAS', 'Egresos', '520117', 223, 'GASTOS DE VIAJE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 241, 'EC-SUPERCIAS', 'Egresos', '520118', 223, 'AGUA, ENERGÍA, LUZ Y TELECOMUNICACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 242, 'EC-SUPERCIAS', 'Egresos', '520119', 223,
        'NOTARIOS Y REGISTRADORES DE LA PROPIEDAD O MERCANTILES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 243, 'EC-SUPERCIAS', 'Egresos', '520121', 223, 'DEPRECIACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 244, 'EC-SUPERCIAS', 'Egresos', '52012101', 243, 'PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 245, 'EC-SUPERCIAS', 'Egresos', '52012102', 243, 'PROPIEDADES DE INVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 246, 'EC-SUPERCIAS', 'Egresos', '520122', 223, 'AMORTIZACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 247, 'EC-SUPERCIAS', 'Egresos', '52012201', 246, 'INTANGIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 248, 'EC-SUPERCIAS', 'Egresos', '52012202', 246, 'OTROS ACTIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 249, 'EC-SUPERCIAS', 'Egresos', '520123', 223, 'GASTO DETERIORO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 250, 'EC-SUPERCIAS', 'Egresos', '52012301', 249, 'PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 251, 'EC-SUPERCIAS', 'Egresos', '52012306', 249, 'OTROS ACTIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 252, 'EC-SUPERCIAS', 'Egresos', '520124', 223,
        'GASTOS POR CANTIDADES ANORMALES DE UTILIZACIÓN EN EL PROCESO DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 253, 'EC-SUPERCIAS', 'Egresos', '52012401', 252, 'MANO DE OBRA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 254, 'EC-SUPERCIAS', 'Egresos', '52012402', 252, 'MATERIALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 255, 'EC-SUPERCIAS', 'Egresos', '52012403', 252, 'COSTOS DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 256, 'EC-SUPERCIAS', 'Egresos', '520125', 223, 'GASTO POR REESTRUCTURACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 257, 'EC-SUPERCIAS', 'Egresos', '520126', 223, 'VALOR NETO DE REALIZACIÓN DE INVENTARIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 258, 'EC-SUPERCIAS', 'Egresos', '520128', 223, 'OTROS GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 259, 'EC-SUPERCIAS', 'Egresos', '5202', 222, 'GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 260, 'EC-SUPERCIAS', 'Egresos', '520201', 259, 'SUELDOS, SALARIOS Y DEMÁS REMUNERACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 261, 'EC-SUPERCIAS', 'Egresos', '520202', 259,
        'APORTES A LA SEGURIDAD SOCIAL (incluido fondo de reserva)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 262, 'EC-SUPERCIAS', 'Egresos', '520203', 259, 'BENEFICIOS SOCIALES E INDEMNIZACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 263, 'EC-SUPERCIAS', 'Egresos', '520204', 259, 'GASTO PLANES DE BENEFICIOS A EMPLEADOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 264, 'EC-SUPERCIAS', 'Egresos', '520205', 259,
        'HONORARIOS, COMISIONES Y DIETAS A PERSONAS NATURALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 265, 'EC-SUPERCIAS', 'Egresos', '520206', 259, 'REMUNERACIONES A OTROS TRABAJADORES AUTÓNOMOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 266, 'EC-SUPERCIAS', 'Egresos', '520207', 259, 'HONORARIOS A EXTRANJEROS POR SERVICIOS OCASIONALES',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 267, 'EC-SUPERCIAS', 'Egresos', '520208', 259, 'MANTENIMIENTO Y REPARACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 268, 'EC-SUPERCIAS', 'Egresos', '520209', 259, 'ARRENDAMIENTO OPERATIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 269, 'EC-SUPERCIAS', 'Egresos', '520210', 259, 'COMISIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 270, 'EC-SUPERCIAS', 'Egresos', '520212', 259, 'COMBUSTIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 271, 'EC-SUPERCIAS', 'Egresos', '520213', 259, 'LUBRICANTES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 272, 'EC-SUPERCIAS', 'Egresos', '520214', 259, 'SEGUROS Y REASEGUROS (primas y cesiones)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 273, 'EC-SUPERCIAS', 'Egresos', '520215', 259, 'TRANSPORTE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 274, 'EC-SUPERCIAS', 'Egresos', '520216', 259,
        'GASTOS DE GESTIÓN (agasajos a accionistas, trabajadores y clientes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 275, 'EC-SUPERCIAS', 'Egresos', '520217', 259, 'GASTOS DE VIAJE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 276, 'EC-SUPERCIAS', 'Egresos', '520218', 259, 'AGUA, ENERGÍA, LUZ Y TELECOMUNICACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 277, 'EC-SUPERCIAS', 'Egresos', '520219', 259,
        'NOTARIOS Y REGISTRADORES DE LA PROPIEDAD O MERCANTILES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 278, 'EC-SUPERCIAS', 'Egresos', '520220', 259, 'IMPUESTOS, CONTRIBUCIONES Y OTROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 279, 'EC-SUPERCIAS', 'Egresos', '520221', 259, 'DEPRECIACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 280, 'EC-SUPERCIAS', 'Egresos', '52022101', 279, 'PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 281, 'EC-SUPERCIAS', 'Egresos', '52022102', 279, 'PROPIEDADES DE INVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 282, 'EC-SUPERCIAS', 'Egresos', '520222', 259, 'AMORTIZACIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 283, 'EC-SUPERCIAS', 'Egresos', '52022201', 282, 'INTANGIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 284, 'EC-SUPERCIAS', 'Egresos', '52022202', 282, 'OTROS ACTIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 285, 'EC-SUPERCIAS', 'Egresos', '520223', 259, 'GASTO DETERIORO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 286, 'EC-SUPERCIAS', 'Egresos', '52022301', 285, 'PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 287, 'EC-SUPERCIAS', 'Egresos', '52022302', 285, 'INVENTARIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 288, 'EC-SUPERCIAS', 'Egresos', '52022303', 285, 'INSTRUMENTOS FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 289, 'EC-SUPERCIAS', 'Egresos', '52022304', 285, 'INTANGIBLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 290, 'EC-SUPERCIAS', 'Egresos', '52022305', 285, 'CUENTAS POR COBRAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 291, 'EC-SUPERCIAS', 'Egresos', '52022306', 285, 'OTROS ACTIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 292, 'EC-SUPERCIAS', 'Egresos', '520224', 259,
        'GASTOS POR CANTIDADES ANORMALES DE UTILIZACIÓN EN EL PROCESO DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 293, 'EC-SUPERCIAS', 'Egresos', '52022401', 292, 'MANO DE OBRA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 294, 'EC-SUPERCIAS', 'Egresos', '52022402', 292, 'MATERIALES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 295, 'EC-SUPERCIAS', 'Egresos', '52022403', 292, 'COSTOS DE PRODUCCIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 296, 'EC-SUPERCIAS', 'Egresos', '520225', 259, 'GASTO POR REESTRUCTURACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 297, 'EC-SUPERCIAS', 'Egresos', '520226', 259, 'VALOR NETO DE REALIZACIÓN DE INVENTARIOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 298, 'EC-SUPERCIAS', 'Egresos', '520227', 259,
        'GASTO IMPUESTO A LA RENTA (ACTIVOS Y PASIVOS DIFERIDOS)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 299, 'EC-SUPERCIAS', 'Egresos', '520228', 259, 'OTROS GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 300, 'EC-SUPERCIAS', 'Egresos', '5203', 222, 'GASTOS FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 301, 'EC-SUPERCIAS', 'Egresos', '520301', 300, 'INTERESES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 302, 'EC-SUPERCIAS', 'Egresos', '520302', 300, 'COMISIONES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 303, 'EC-SUPERCIAS', 'Egresos', '520303', 300, 'GASTOS DE FINANCIAMIENTO DE ACTIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 304, 'EC-SUPERCIAS', 'Egresos', '520304', 300, 'DIFERENCIA EN CAMBIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 305, 'EC-SUPERCIAS', 'Egresos', '520305', 300, 'OTROS GASTOS FINANCIEROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 306, 'EC-SUPERCIAS', 'Egresos', '5204', 222, 'OTROS GASTOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 307, 'EC-SUPERCIAS', 'Egresos', '520401', 306,
        'PERDIDA EN INVERSIONES EN ASOCIADAS / SUBSIDIARIAS Y OTRAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 308, 'EC-SUPERCIAS', 'Egresos', '520402', 306, 'OTROS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 309, 'EC-SUPERCIAS', 'Orden', '60', 0,
        'GANANCIA (PÉRDIDA) ANTES DE 15% A TRABAJADORES E IMPUESTO A LA RENTA DE OPERACIONES CONTINUADAS --> Subtotal B (A + 43 - 52)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 310, 'EC-SUPERCIAS', 'Orden', '61', 0, '15% PARTICIPACIÓN TRABAJADORES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 311, 'EC-SUPERCIAS', 'Orden', '62', 0,
        'GANANCIA (PÉRDIDA) ANTES DE IMPUESTOS --> Subtotal C (B - 61)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 312, 'EC-SUPERCIAS', 'Orden', '63', 0, 'IMPUESTO A LA RENTA CAUSADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 313, 'EC-SUPERCIAS', 'Orden', '64', 0,
        'GANANCIA (PÉRDIDA) DE OPERACIONES CONTINUADAS ANTES DEL IMPUESTO DIFERIDO --> Subtotal D (C - 63)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 314, 'EC-SUPERCIAS', 'Orden', '65', 0, '(-) GASTO POR IMPUESTO DIFERIDO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 315, 'EC-SUPERCIAS', 'Orden', '66', 0, '(+) INGRESO POR IMPUESTO DIFERIDO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 316, 'EC-SUPERCIAS', 'Orden', '67', 0, 'GANANCIA (PÉRDIDA) DE OPERACIONES CONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 317, 'EC-SUPERCIAS', 'Orden', '71', 0, 'INGRESOS POR OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 318, 'EC-SUPERCIAS', 'Orden', '72', 0, 'GASTOS POR OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 319, 'EC-SUPERCIAS', 'Orden', '73', 0,
        'GANANCIA (PÉRDIDA) ANTES DE 15% A TRABAJADORES E IMPUESTO A LA RENTA DE OPERACIONES DISCONTINUADAS --> Subtotal E (71 - 72)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 320, 'EC-SUPERCIAS', 'Orden', '74', 0, '15% PARTICIPACIÓN TRABAJADORES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 321, 'EC-SUPERCIAS', 'Orden', '75', 0,
        'GANANCIA (PÉRDIDA) ANTES DE IMPUESTOS DE OPERACIONES DISCONTINUADAS --> Subtotal F (E - 74)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 322, 'EC-SUPERCIAS', 'Orden', '76', 0, 'IMPUESTO A LA RENTA CAUSADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 323, 'EC-SUPERCIAS', 'Orden', '77', 0,
        'GANANCIA (PÉRDIDA) DE OPERACIONES DISCONTINUADAS --> Subtotal G (F - 76)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 324, 'EC-SUPERCIAS', 'Orden', '79', 0, 'GANANCIA (PÉRDIDA) NETA DEL PERIODO --> Subtotal H (D + G)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 325, 'EC-SUPERCIAS', 'Orden', '7901', 324, 'PROPIETARIOS DE LA CONTROLADORA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 326, 'EC-SUPERCIAS', 'Orden', '7902', 324,
        'PARTICIPACIÓN ATRIBUIBLE A LA NO CONTROLADORA (informativo)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 327, 'EC-SUPERCIAS', 'Orden', '81', 0, 'COMPONENTES DEL OTRO RESULTADO INTEGRAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 328, 'EC-SUPERCIAS', 'Orden', '8101', 327, 'DIFERENCIA DE CAMBIO POR CONVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 329, 'EC-SUPERCIAS', 'Orden', '8102', 327,
        'VALUACIÓN DE ACTIVOS FINANCIEROS DISPONIBLES PARA LA VENTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 330, 'EC-SUPERCIAS', 'Orden', '8103', 327,
        'GANANCIAS POR REVALUACIÓN DE PROPIEDADES, PLANTA Y EQUIPO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 331, 'EC-SUPERCIAS', 'Orden', '8104', 327,
        'GANANCIAS (PÉRDIDAS) ACTUARIALES POR PLANES DE BENEFICIOS DEFINIDOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 332, 'EC-SUPERCIAS', 'Orden', '8105', 327,
        'REVERSIÓN DEL DETERIORO (PÉRDIDA POR DETERIORO) DE UN ACTIVO REVALUADO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 333, 'EC-SUPERCIAS', 'Orden', '8106', 327, 'PARTICIPACIÓN DE OTRO RESULTADO INTEGRAL DE ASOCIADAS',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 334, 'EC-SUPERCIAS', 'Orden', '8107', 327,
        'IMPUESTO SOBRE LAS GANACIAS RELATIVO A OTRO RESULTADO INTEGRAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 335, 'EC-SUPERCIAS', 'Orden', '8108', 327, 'OTROS (DETALLAR EN NOTAS)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 336, 'EC-SUPERCIAS', 'Orden', '82', 0, 'RESULTADO INTEGRAL TOTAL DEL AÑO --> Subtotal I (H + 81)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 337, 'EC-SUPERCIAS', 'Orden', '8201', 336, 'PROPIETARIOS DE LA CONTROLADORA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 338, 'EC-SUPERCIAS', 'Orden', '8202', 336, 'PARTICIPACIÓN NO CONTROLADORA (informativo)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 339, 'EC-SUPERCIAS', 'Orden', '90', 0, 'GANANCIA POR ACCIÓN (SOLO EMPRESAS QUE COTIZAN EN BOLSA)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 340, 'EC-SUPERCIAS', 'Orden', '9001', 339, 'GANANCIA POR ACCIÓN BÁSICA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 341, 'EC-SUPERCIAS', 'Orden', '900101', 340,
        'GANANCIA POR ACCIÓN BÁSICA EN OPERACIONES CONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 342, 'EC-SUPERCIAS', 'Orden', '900102', 340,
        'GANANCIA POR ACCIÓN BÁSICA EN OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 343, 'EC-SUPERCIAS', 'Orden', '9002', 339, 'GANANCIA POR ACCIÓN DILUÍDA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 344, 'EC-SUPERCIAS', 'Orden', '900201', 343,
        'GANANCIA POR ACCIÓN DILUÍDA EN OPERACIONES CONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 345, 'EC-SUPERCIAS', 'Orden', '900202', 343,
        'GANANCIA POR ACCIÓN DILUÍDA EN OPERACIONES DISCONTINUADAS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 346, 'EC-SUPERCIAS', 'Orden', '91', 0, 'UTILIDAD A REINVERTIR (INFORMATIVO)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 347, 'EC-SUPERCIAS', 'Orden', '95', 0,
        'INCREMENTO NETO (DISMINUCIÓN) EN EL EFECTIVO Y EQUIVALENTES AL EFECTIVO, ANTES DEL EFECTO DE LOS CAMBIOS EN LA TASA DE CAMBIO',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 348, 'EC-SUPERCIAS', 'Orden', '9501', 347,
        'FLUJOS DE EFECTIVO PROCEDENTES DE (UTILIZADOS EN) ACTIVIDADES DE OPERACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 349, 'EC-SUPERCIAS', 'Orden', '950101', 348, 'CLASES DE COBROS POR ACTIVIDADES DE OPERACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 350, 'EC-SUPERCIAS', 'Orden', '95010101', 349,
        'Cobros procedentes de las ventas de bienes y prestación de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 351, 'EC-SUPERCIAS', 'Orden', '95010102', 349,
        'Cobros procedentes de regalías, cuotas, comisiones y otros ingresos de actividades ordinarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 352, 'EC-SUPERCIAS', 'Orden', '95010103', 349,
        'Cobros procedentes de contratos mantenidos con propósitos de intermediación o para negociar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 353, 'EC-SUPERCIAS', 'Orden', '95010104', 349,
        'Cobros procedentes de primas y prestaciones, anualidades y otros beneficios de pólizas suscritas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 354, 'EC-SUPERCIAS', 'Orden', '95010105', 349, 'Otros cobros por actividades de operación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 355, 'EC-SUPERCIAS', 'Orden', '950102', 348, 'CLASES DE PAGOS POR ACTIVIDADES DE OPERACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 356, 'EC-SUPERCIAS', 'Orden', '95010201', 355,
        'Pagos a proveedores por el suministro de bienes y servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 357, 'EC-SUPERCIAS', 'Orden', '95010202', 355,
        'Pagos procedentes de contratos mantenidos para intermediación o para negociar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 358, 'EC-SUPERCIAS', 'Orden', '95010203', 355, 'Pagos a y por cuenta de los empleados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 359, 'EC-SUPERCIAS', 'Orden', '95010204', 355,
        'Pagos por primas y prestaciones, anualidades y otras obligaciones derivadas de las pólizas suscritas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 360, 'EC-SUPERCIAS', 'Orden', '95010205', 355, 'Otros pagos por actividades de operación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 361, 'EC-SUPERCIAS', 'Orden', '950103', 348, 'Dividendos pagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 362, 'EC-SUPERCIAS', 'Orden', '950104', 348, 'Dividendos recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 363, 'EC-SUPERCIAS', 'Orden', '950105', 348, 'Intereses pagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 364, 'EC-SUPERCIAS', 'Orden', '950106', 348, 'Intereses recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 365, 'EC-SUPERCIAS', 'Orden', '950107', 348, 'Impuestos a las ganancias pagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 366, 'EC-SUPERCIAS', 'Orden', '950108', 348, 'Otras entradas (salidas) de efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 367, 'EC-SUPERCIAS', 'Orden', '9502', 347,
        'FLUJOS DE EFECTIVOS PROCEDENTES DE (UTILIZADOS EN) ACTIVIDADES DE INVERSIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 368, 'EC-SUPERCIAS', 'Orden', '950201', 367,
        'Efectivo procedentes de la venta de acciones en subsidiarias u otros negocios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 369, 'EC-SUPERCIAS', 'Orden', '950202', 367,
        'Efectivo utilizado para adquirir acciones en subsidiarias u otros negocios para tener el control', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 370, 'EC-SUPERCIAS', 'Orden', '950203', 367,
        'Efectivo utilizado en la compra de participaciones no controladoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 371, 'EC-SUPERCIAS', 'Orden', '950204', 367,
        'Otros cobros por la venta de acciones o instrumentos de deuda de otras entidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 372, 'EC-SUPERCIAS', 'Orden', '950205', 367,
        'Otros pagos para adquirir acciones o instrumentos de deuda de otras entidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 373, 'EC-SUPERCIAS', 'Orden', '950206', 367,
        'Otros cobros por la venta de participaciones en negocios conjuntos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 374, 'EC-SUPERCIAS', 'Orden', '950207', 367,
        'Otros pagos para adquirir participaciones en negocios conjuntos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 375, 'EC-SUPERCIAS', 'Orden', '950208', 367,
        'Importes procedentes por la venta de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 376, 'EC-SUPERCIAS', 'Orden', '950209', 367, 'Adquisiciones de propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 377, 'EC-SUPERCIAS', 'Orden', '950210', 367,
        'Importes procedentes de ventas de activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 378, 'EC-SUPERCIAS', 'Orden', '950211', 367, 'Compras de activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 379, 'EC-SUPERCIAS', 'Orden', '950212', 367, 'Importes procedentes de otros activos a largo plazo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 380, 'EC-SUPERCIAS', 'Orden', '950213', 367, 'Compras de otros activos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 381, 'EC-SUPERCIAS', 'Orden', '950214', 367, 'Importes procedentes de subvenciones del gobierno',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 382, 'EC-SUPERCIAS', 'Orden', '950215', 367, 'Anticipos de efectivo efectuados a terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 383, 'EC-SUPERCIAS', 'Orden', '950216', 367,
        'Cobros procedentes del reembolso de anticipos y préstamos concedidos a terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 384, 'EC-SUPERCIAS', 'Orden', '950217', 367,
        'Pagos derivados de contratos de futuro, a término, de opciones y de permuta financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 385, 'EC-SUPERCIAS', 'Orden', '950218', 367,
        'Cobros procedentes de contratos de futuro, a término, de opciones y de permuta financiera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 386, 'EC-SUPERCIAS', 'Orden', '950219', 367, 'Dividendos recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 387, 'EC-SUPERCIAS', 'Orden', '950220', 367, 'Intereses recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 388, 'EC-SUPERCIAS', 'Orden', '950221', 367, 'Otras entradas (salidas) de efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 389, 'EC-SUPERCIAS', 'Orden', '9503', 347,
        'FLUJOS DE EFECTIVO PROCEDENTES DE (UTILIZADOS EN) ACTIVIDADES DE FINANCIACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 390, 'EC-SUPERCIAS', 'Orden', '950301', 389, 'Aporte en efectivo por aumento de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 391, 'EC-SUPERCIAS', 'Orden', '950302', 389, 'Financiamiento por emisión de títulos valores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 392, 'EC-SUPERCIAS', 'Orden', '950303', 389,
        'Pagos por adquirir o rescatar las acciones de la entidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 393, 'EC-SUPERCIAS', 'Orden', '950304', 389, 'Financiación por préstamos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 394, 'EC-SUPERCIAS', 'Orden', '950305', 389, 'Pagos de préstamos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 395, 'EC-SUPERCIAS', 'Orden', '950306', 389, 'Pagos de pasivos por arrendamientos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 396, 'EC-SUPERCIAS', 'Orden', '950307', 389, 'Importes procedentes de subvenciones del gobierno',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 397, 'EC-SUPERCIAS', 'Orden', '950308', 389, 'Dividendos pagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 398, 'EC-SUPERCIAS', 'Orden', '950309', 389, 'Intereses recibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 399, 'EC-SUPERCIAS', 'Orden', '950310', 389, 'Otras entradas (salidas) de efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 400, 'EC-SUPERCIAS', 'Orden', '9504', 347,
        'EFECTOS DE LA VARIACIÓN EN LA TASA DE CAMBIO SOBRE EL EFECTIVO Y EQUIVALENTES AL EFECTIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 401, 'EC-SUPERCIAS', 'Orden', '950401', 400,
        'Efectos de la variación en la tasa de cambio sobre el efectivo y equivalentes de efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 402, 'EC-SUPERCIAS', 'Orden', '9505', 347,
        'INCREMENTO (DISMINUCIÓN) NETO DE EFECTIVO Y EQUIVALENTES AL EFECTIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 403, 'EC-SUPERCIAS', 'Orden', '9506', 347,
        'EFECTIVO Y EQUIVALENTES AL EFECTIVO AL PRINCIPIO DEL PERIODO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 404, 'EC-SUPERCIAS', 'Orden', '9507', 347,
        'EFECTIVO Y EQUIVALENTES AL EFECTIVO AL FINAL DEL PERIODO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 405, 'EC-SUPERCIAS', 'Orden', '96', 0,
        'GANANCIA (PÉRDIDA) ANTES DE 15% A TRABAJADORES E IMPUESTO A LA RENTA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 406, 'EC-SUPERCIAS', 'Orden', '97', 0, 'AJUSTE POR PARTIDAS DISTINTAS AL EFECTIVO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 407, 'EC-SUPERCIAS', 'Orden', '9701', 406, 'Ajustes por gasto de depreciación y amortización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 408, 'EC-SUPERCIAS', 'Orden', '9702', 406,
        'Ajustes por gastos por deterioro (reversiones por deterioro) reconocidas en los resultados del periodo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 409, 'EC-SUPERCIAS', 'Orden', '9703', 406, 'Pérdida (ganancia) de moneda extranjera no realizada',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 410, 'EC-SUPERCIAS', 'Orden', '9704', 406, 'Pérdidas en cambio de moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 411, 'EC-SUPERCIAS', 'Orden', '9705', 406, 'Ajustes por gastos en provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 412, 'EC-SUPERCIAS', 'Orden', '9706', 406, 'Ajuste por participaciones no controladoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 413, 'EC-SUPERCIAS', 'Orden', '9707', 406, 'Ajuste por pagos basados en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 414, 'EC-SUPERCIAS', 'Orden', '9708', 406, 'Ajustes por ganancias (pérdidas) en valor razonable',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 415, 'EC-SUPERCIAS', 'Orden', '9709', 406, 'Ajustes por gasto por impuesto a la renta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 416, 'EC-SUPERCIAS', 'Orden', '9710', 406, 'Ajustes por gasto por participación trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 417, 'EC-SUPERCIAS', 'Orden', '9711', 406, 'Otros ajustes por partidas distintas al efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 418, 'EC-SUPERCIAS', 'Orden', '98', 0, 'CAMBIOS EN ACTIVOS Y PASIVOS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 419, 'EC-SUPERCIAS', 'Orden', '9801', 418,
        '(Incremento) disminución en cuentas por cobrar clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 420, 'EC-SUPERCIAS', 'Orden', '9802', 418, '(Incremento) disminución en otras cuentas por cobrar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 421, 'EC-SUPERCIAS', 'Orden', '9803', 418, '(Incremento) disminución en anticipos de proveedores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 422, 'EC-SUPERCIAS', 'Orden', '9804', 418, '(Incremento) disminución en inventarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 423, 'EC-SUPERCIAS', 'Orden', '9805', 418, '(Incremento) disminución en otros activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 424, 'EC-SUPERCIAS', 'Orden', '9806', 418,
        'Incremento (disminución) en cuentas por pagar comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 425, 'EC-SUPERCIAS', 'Orden', '9807', 418, 'Incremento (disminución) en otras cuentas por pagar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 426, 'EC-SUPERCIAS', 'Orden', '9808', 418, 'Incremento (disminución) en beneficios empleados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 427, 'EC-SUPERCIAS', 'Orden', '9809', 418, 'Incremento (disminución) en anticipos de clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 428, 'EC-SUPERCIAS', 'Orden', '9810', 418, 'Incremento (disminución) en otros pasivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 429, 'EC-SUPERCIAS', 'Orden', '9820', 418,
        'FLUJOS DE EFECTIVO PROCEDENTES DE (UTILIZADOS EN) ACTIVIDADES DE OPERACIÓN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 430, 'EC-SUPERCIAS', 'Orden', '99', 0, 'SALDO AL FINAL DEL PERÍODO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 431, 'EC-SUPERCIAS', 'Orden', '9901', 430, 'SALDO REEXPRESADO DEL PERIODO INMEDIATO ANTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 432, 'EC-SUPERCIAS', 'Orden', '990101', 431, 'SALDO DEL PERÍODO INMEDIATO ANTERIOR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 433, 'EC-SUPERCIAS', 'Orden', '990102', 431, 'CAMBIOS EN POLÍTICAS CONTABLES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 434, 'EC-SUPERCIAS', 'Orden', '990103', 431, 'CORRECCIÓN DE ERRORES', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 435, 'EC-SUPERCIAS', 'Orden', '9902', 430, 'CAMBIOS DEL AÑO EN EL PATRIMONIO', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 436, 'EC-SUPERCIAS', 'Orden', '990201', 435, 'Aumento (disminución) de capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 437, 'EC-SUPERCIAS', 'Orden', '990202', 435, 'Aportes para futuras capitalizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 438, 'EC-SUPERCIAS', 'Orden', '990203', 435, 'Prima por emisión primaria de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 439, 'EC-SUPERCIAS', 'Orden', '990204', 435, 'Dividendos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 440, 'EC-SUPERCIAS', 'Orden', '990205', 435,
        'Transferencia de Resultados a otras cuentas patrimoniales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 441, 'EC-SUPERCIAS', 'Orden', '990206', 435,
        'Realización de la Reserva por Valuación de Activos Financieros Disponibles para la venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 442, 'EC-SUPERCIAS', 'Orden', '990207', 435,
        'Realización de la Reserva por Valuación de Propiedades, planta y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 443, 'EC-SUPERCIAS', 'Orden', '990208', 435,
        'Realización de la Reserva por Valuación de Activos Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 444, 'EC-SUPERCIAS', 'Orden', '990209', 435, 'Otros cambios (detallar)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 445, 'EC-SUPERCIAS', 'Orden', '990210', 435,
        'Resultado Integral Total del Año (Ganancia o pérdida del ejercicio)', 1);
