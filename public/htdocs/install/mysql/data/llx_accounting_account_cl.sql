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

-- Descriptif des plans comptables CL PC-MIPYME
-- ID 4785 - 4999
-- ADD 6700000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4785, 'PC-MIPYME', 'Activo', '1.1', '0', 'Activo Circulante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4786, 'PC-MIPYME', 'Activo', '1.1.10.1', '4785', 'Caja', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4787, 'PC-MIPYME', 'Activo', '1.1.20.1', '4785', 'Banco', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4788, 'PC-MIPYME', 'Activo', '1.1.30.1', '4785', 'Insumos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4789, 'PC-MIPYME', 'Activo', '1.1.40.1', '4785', 'Productos en Proceso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4790, 'PC-MIPYME', 'Activo', '1.1.50.1', '4785', 'Mercaderias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4791, 'PC-MIPYME', 'Activo', '1.1.60.1', '4785', 'Depósito  a Plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4792, 'PC-MIPYME', 'Activo', '1.1.70.1', '4785', 'Valores Negociables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4793, 'PC-MIPYME', 'Activo', '1.1.80.1 ', '4785', 'Deudores por Ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4794, 'PC-MIPYME', 'Activo', '1.1.90.1', '4785', 'Documnetos por cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4795, 'PC-MIPYME', 'Activo', '1.1.100.1', '4785', 'Documentos por cobrar de Terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4797, 'PC-MIPYME', 'Activo', '1.1.120.1', '4785',
        'Documentos y Cuentas  por cobrar a Empresas No  Relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4798, 'PC-MIPYME', 'Activo', '1.1.130.1', '4785', 'Estimación Deudores Incobrable (Provisión)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4799, 'PC-MIPYME', 'Activo', '1.1.140.1', '4785', 'Deudores Varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4800, 'PC-MIPYME', 'Activo', '1.1.150.1', '4785', 'Anticipo Remuneraciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4801, 'PC-MIPYME', 'Activo', '1.1.160.1', '4785', 'Préstamos a Trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4802, 'PC-MIPYME', 'Activo', '1.1.170.1', '4785', 'Otros Descuentos de Remuneraciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4803, 'PC-MIPYME', 'Activo', '1.1.180.1', '4785', 'Préstamos a Socio (empresario)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4804, 'PC-MIPYME', 'Activo', '1.1.190.1', '4785', 'Cuenta Corriente Consignatario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4805, 'PC-MIPYME', 'Activo', '1.1.200.1', '4785', 'Impuestos por recuperar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4806, 'PC-MIPYME', 'Activo', '1.1.210.1', '4785', 'Impuesto Específico Combustible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4807, 'PC-MIPYME', 'Activo', '1.1.220.1', '4785', 'IVA Créditos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4808, 'PC-MIPYME', 'Activo', '1.1.230.1', '4785', 'Crédito Impuesto Ley 18.211', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4809, 'PC-MIPYME', 'Activo', '1.1.240.1', '4785', 'Crédito Impuesto Específico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4810, 'PC-MIPYME', 'Activo', '1.1.250.1', '4785', 'Crédito Impuesto Adicional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4811, 'PC-MIPYME', 'Activo', '1.1.260.1', '4785', 'Impuestos Diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4812, 'PC-MIPYME', 'Activo', '1.1.270.1', '4785', 'Gastos pagados por anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4813, 'PC-MIPYME', 'Activo', '1.1.280.1', '4785', 'Otros Activos Circulantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4814, 'PC-MIPYME', 'Activo', '1.1.290.1', '4785', 'Contratos Leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4815, 'PC-MIPYME', 'Activo', '1.1.300.1', '4785', 'Activos para  Leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4816, 'PC-MIPYME', 'XXXXXX', '1.1.310.1', NULL, 'Pago Provisional Mensual (PPM)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4817, 'PC-MIPYME', 'Activo', '1.2', NULL, 'Activos Fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4818, 'PC-MIPYME', 'Activo', '1.2.10.1', '4817', 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4819, 'PC-MIPYME', 'Activo', '1.2.20.1', '4817', 'Construcciones y Obras de Infraestructura.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4820, 'PC-MIPYME', 'Activo', '1.2.30.1', '4817', 'Maquinarias y Equipos.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4821, 'PC-MIPYME', 'Activo', '1.2.40.1', '4817', 'Muebles y Utiles.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4822, 'PC-MIPYME', 'Activo', '1.2.50.1', '4817', 'Activos en Leasing.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4823, 'PC-MIPYME', 'Activo', '1.2.60.1', '4817', 'Otros Activos Fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4824, 'PC-MIPYME', 'Activo', '1.2.70.1', '4817', 'Mayor Valor Retasación Técnica del Activo Fijo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4825, 'PC-MIPYME', 'Activo', '1.2.80.1', '4817', 'Depreciación Acumulada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4826, 'PC-MIPYME', 'Activo', '1.3', NULL, 'Otros Activos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4827, 'PC-MIPYME', 'Activo', '1.3.10.1', '4826', 'Cuentas Particulares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4828, 'PC-MIPYME', 'Activo', '1.3.20.1', '4826', 'Inversión en Empresas Relacionadas.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4829, 'PC-MIPYME', 'Activo', '1.3.30.1', '4826', 'Inversión en otras Sociedades.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4831, 'PC-MIPYME', 'Activo', '1.3.40.1', '4826', 'Deudores largo Plazo.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4832, 'PC-MIPYME', 'Activo', '1.3.50.1', '4826',
        'Documentos y Cuentas por Cobrar a Empresas Relacionada Largo Plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4833, 'PC-MIPYME', 'Activo', '1.3.60.1', '4826', 'Impuestos Diferidos Largo Plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4834, 'PC-MIPYME', 'Activo', '1.3.70.1', '4826', 'Intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4835, 'PC-MIPYME', 'Activo', '1.3.80.1', '4826', 'Otros Activos. ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4836, 'PC-MIPYME', 'Activo', '1.3.90.1', '4826', 'Otros Activos Trabajadores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4837, 'PC-MIPYME', 'Activo', '1.3.100.1', '4826', 'Contratos de Leasing de Largo Plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4838, 'PC-MIPYME', 'Activo', '1.3.110.1', '4826', 'Inversión Ley Arica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4839, 'PC-MIPYME', 'Activo', '1.3.120.1', '4826', 'Inversión Ley Austral', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4840, 'PC-MIPYME', 'Complementaria de Ac', '1.3.130.1', '4826', 'Amortización (Acumulada)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4841, 'PC-MIPYME', 'Pasivo', '2.1', NULL, 'Total Pasivos Circulantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4842, 'PC-MIPYME', 'Pasivo', '2.1.10.1', '4841',
        'Obligaciones con Bancos e Instituciones Financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4843, 'PC-MIPYME', 'Pasivo', '2.1.20.1', '4841', 'Obligaciones con el público (pagarés)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4844, 'PC-MIPYME', 'Pasivo', '2.1.30.1', '4841', 'Cuentas y Documentos por pagar.  ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4845, 'PC-MIPYME', 'Pasivo', '2.1.40.1', '4841',
        'Documentos y Cuentas por Pagar Empresas Relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4846, 'PC-MIPYME', 'Pasivo', '2.1.50.1', '4841',
        'Documentos y Cuentas por Pagar Empresas No Relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4847, 'PC-MIPYME', 'Pasivo', '2.1.60.1', '4841', 'Cuenta Corriente Comitente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4848, 'PC-MIPYME', 'Pasivo', '2.1.70.1', '4841', 'Acreedores Varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4849, 'PC-MIPYME', 'Pasivo', '2.1.80.1', '4841',
        'Obligaciones o Acreedores por Leasing porción C/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4850, 'PC-MIPYME', 'Pasivo', '2.1.90.1', '4841', 'Intereses diferidos por Leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4851, 'PC-MIPYME', 'Pasivo', '2.1.100.1', '4841', 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4852, 'PC-MIPYME', 'Pasivo', '2.1.110.1', '4841', 'Remuneraciones por Pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4853, 'PC-MIPYME', 'Pasivo', '2.1.120.1', '4841', 'Entidades Previsionales por Pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4854, 'PC-MIPYME', 'Pasivo', '2.1.130.1', '4841', 'Impuesto Único Por Pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4855, 'PC-MIPYME', 'Pasivo', '2.1.140.1', '4841', 'Retenciones por Pagar  ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4856, 'PC-MIPYME', 'Pasivo', '2.1.150.1', '4841', 'Impuesto a la Renta por Pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4857, 'PC-MIPYME', 'Pasivo', '2.1.160.1', '4841', ' Otros Impuesto Por Pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4858, 'PC-MIPYME', 'Pasivo', '2.1.170.1', '4841', 'IVA Débitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4859, 'PC-MIPYME', 'Pasivo', '2.1.180.1', '4841', 'Impuesto Adicional Débitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4860, 'PC-MIPYME', 'Pasivo', '2.1.190.1', '4841', 'Impuesto Ley 18.211 Débitos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4861, 'PC-MIPYME', 'Pasivo', '2.1.200.1', '4841', 'Impuestos Diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4862, 'PC-MIPYME', 'Pasivo', '2.1.210.1', '4841', 'Ingresos percibidos por adelantado.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4863, 'PC-MIPYME', 'Pasivo', '2.1.220.1', '4841', 'Depósitos Garantía de Envases', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4864, 'PC-MIPYME', 'Pasivo', '2.1.230.1', '4841', 'Otros Pasivos Circulantes.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4865, 'PC-MIPYME', 'Pasivo', '2.2', '0', 'Pasivos Largo Plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4866, 'PC-MIPYME', 'Pasivo', '2.2.10.1', '4865',
        'Obligaciones con bancos e Instituciones Financieras L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4867, 'PC-MIPYME', 'Pasivo', '2.2.20.1', '4865', 'Obligaciones con el público Largo Plazo (Bonos)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4868, 'PC-MIPYME', 'Pasivo', '2.2.30.1', '4865', 'Cuentas y Documentos por pagar L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4869, 'PC-MIPYME', 'Pasivo', '2.2.40.1', '4865', 'Acreedores Varios L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4870, 'PC-MIPYME', 'Pasivo', '2.2.50.1', '4865',
        'Obligaciones o Acreedores por Leasing porción L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4871, 'PC-MIPYME', 'Pasivo', '2.2.60.1', '4865',
        'Documentos y Cuentas por Pagar a Empresas Relacionadas L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4872, 'PC-MIPYME', 'Pasivo', '2.2.70.1', '4865', 'Impuestos Diferidos L/P', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4873, 'PC-MIPYME', 'Pasivo', '2.2.80.1', '4865', 'Otros Pasivos Largo Plazo.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4874, 'PC-MIPYME', 'XXXXXX', '3', NULL, 'Patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4875, 'PC-MIPYME', 'XXXXXX', '3.1', NULL, 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4876, 'PC-MIPYME', 'Patrimonio', '3.1.10.1', '4875', 'Capital Pagado.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4877, 'PC-MIPYME', 'Patrimonio', '3.1.20.1', '4875', 'Reserva Revalorización Capital Propio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4878, 'PC-MIPYME', 'Patrimonio', '3.1.30.1', '4875', 'Otra Reservas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4879, 'PC-MIPYME', 'Patrimonio', '3.1.40.1', '4875', 'Cuenta Obligada Socio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4880, 'PC-MIPYME', 'XXXXXX', '3.2', NULL, 'Utilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4881, 'PC-MIPYME', 'Patrimonio', '3.2.10.1', '4880', 'Utilidades Acumuladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4882, 'PC-MIPYME', 'Patrimonio', '3.2.20.1', '4880', 'Pérdidas Acumuladas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4883, 'PC-MIPYME', 'Patrimonio', '3.2.30.1', '4880', 'Utilidad del Ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4884, 'PC-MIPYME', 'Patrimonio', '3.2.40.1', '4880', 'Pérdida y Ganancia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4885, 'PC-MIPYME', 'XXXXXX', '4', NULL, 'Resultado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4886, 'PC-MIPYME', 'Resultado', '4.1', NULL, 'Ingresos de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4887, 'PC-MIPYME', 'Resultado', '4.1.20.1', '4886', 'Otros Ingresos del Giro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4888, 'PC-MIPYME', 'Resultado', '4.2', NULL, 'Costos de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4889, 'PC-MIPYME', 'Resultado', '4.2.10.1', '4888',
        'Costos Directo por ventas de Bienes y Servicios del Giro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4890, 'PC-MIPYME', 'Resultado', '4.2.20.1', '4888', 'Otros Costos Directos del Giro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4891, 'PC-MIPYME', 'Resultado', '4.3', NULL, 'Administración y Venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4892, 'PC-MIPYME', 'Resultado', '4.3.10.1', '4891', 'Gastos Generales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4893, 'PC-MIPYME', 'Resultado', '4.3.20.1', '4891', 'Contribuciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4894, 'PC-MIPYME', 'Resultado', '4.3.30.1', '4891', 'Deudores Incobrables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4895, 'PC-MIPYME', 'Resultado', '4.3.40.1', '4891', 'Reparaciones Automóviles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4896, 'PC-MIPYME', 'Resultado', '4.3.50.1', '4891', 'Gastos de Organización y Puesta en Marcha', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4897, 'PC-MIPYME', 'Resultado', '4.3.60.1', '4891', 'Gastos de Investigación y Desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4898, 'PC-MIPYME', 'Resultado', '4.3.70.1', '4891', 'Sueldos (Remuneraciones)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4899, 'PC-MIPYME', 'Resultado', '4.3.80.1', '4891', 'Aporte Patronal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4900, 'PC-MIPYME', 'Resultado', '4.3.90.1', '4891', 'Honorarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4901, 'PC-MIPYME', 'Resultado', '4.3.100.1', '4891', 'Sueldo Empresarial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4903, 'PC-MIPYME', 'Resultado', '4.3.110.1', '4891', 'Depreciación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4904, 'PC-MIPYME', 'Resultado', '4.3.120.1', '4891', 'Amortización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4905, 'PC-MIPYME', 'Resultado', '4.3.130.1', '4891', 'Mermas (Castigo de Mercaderías)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4906, 'PC-MIPYME', 'Resultado', '4.3.140.1', '4891', 'Gasto Promoción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4907, 'PC-MIPYME', 'Resultado', '4.3.150.1', '4891', 'Otros Gastos de Administración y Venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4908, 'PC-MIPYME', 'Resultado', '4.4', NULL, 'Otros Ingresos Fuera de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4909, 'PC-MIPYME', 'Resultado', '4.4.10.1', '4908', 'Ingresos Financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4910, 'PC-MIPYME', 'Resultado', '4.4.20.1', '4908', 'Utilidad Inversión en Empresas Relacionadas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4911, 'PC-MIPYME', 'Resultado', '4.4.30.1', '4908', 'Rentas de Fuente Extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4912, 'PC-MIPYME', 'Resultado', '4.4.40.1', '4908', 'Dividendos Percibidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4913, 'PC-MIPYME', 'Resultado', '4.4.50.1', '4908', 'Ingresos No Renta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4914, 'PC-MIPYME', 'Resultado', '4.4.60.1', '4908', 'Rentas Exentas Impuesto 1° Categoría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4915, 'PC-MIPYME', 'Resultado', '4.4.70.1', '4908',
        'Rentas Afectas a Impuesto Único de 1° Categoría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4916, 'PC-MIPYME', 'Resultado', '4.4.80.1', '4908',
        'Rentas por Arriendos de Bienes Raíces Agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4917, 'PC-MIPYME', 'Resultado', '4.4.90.1', '4908', 'Rentas por Bienes Raíces No Agrícolas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4918, 'PC-MIPYME', 'Resultado', '4.4.100.1', '4908',
        'Otras Rentas Afectas a Impuesto de 1° Categoría', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4919, 'PC-MIPYME', 'Resultado', '4.4.110.1', '4908', 'Comisiones Percibidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4920, 'PC-MIPYME', 'Resultado', '4.4.120.1', '4908', 'Ingresos fuera de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4921, 'PC-MIPYME', 'Resultado', '4.4.130.1', '4908', 'Ajuste Ejercicio Anterior', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4922, 'PC-MIPYME', 'Resultado', '4.4.140.1', '4908', 'Corrección Monetaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4923, 'PC-MIPYME', 'Resultado', '4.4.150.1', '4908', 'Diferencia Por Tipo de Cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4924, 'PC-MIPYME', 'XXXXXX', '4.5', NULL, 'Egresos Fuera de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4925, 'PC-MIPYME', 'Resultado', '4.5.10.1', '4924', 'Gastos Financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4927, 'PC-MIPYME', 'Resultado', '4.5.20.1', '4924', 'Comisiones Pagadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4928, 'PC-MIPYME', 'Resultado', '4.5.40.1', '4924',
        'Costos y Gastos por Rentas Fuentes Extranjeras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4929, 'PC-MIPYME', 'Resultado', '4.5.50.1', '4924', 'Otros Egresos Fuera de Explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4930, 'PC-MIPYME', 'Resultado', '4.5.60.1', '4924',
        'Pérdida por Financiamiento (Operaciones en Leasing)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4931, 'PC-MIPYME', 'Resultado', '4.5.70.1', '4924',
        'Gastos aceptado por Donaciones por fines Sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4932, 'PC-MIPYME', 'Resultado', '4.5.80.1', '4924',
        'Gastos aceptado por Donaciones para Fines Políticos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4933, 'PC-MIPYME', 'Resultado', '4.5.90.1', '4924',
        'Gasto aceptado por Donaciones del Art. N° 10 Ley 19.885', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4934, 'PC-MIPYME', 'Resultado', '4.5.100.1', '4924', 'Donaciones Escasos Recursos Artc. 46 DL 3063',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4935, 'PC-MIPYME', 'Resultado', '4.5.110.1', '4924', 'Donaciones sin Beneficios Tributarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4936, 'PC-MIPYME', 'Resultado', '4.5.120.1', '4924', 'Otras Donaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4937, 'PC-MIPYME', 'Resultado', '4.5.130.1', '4924', 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4938, 'PC-MIPYME', 'Resultado', '4.5.140.1', '4924', 'Impuestos no Recuperables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4939, 'PC-MIPYME', 'Resultado', '4.6', NULL, 'Impuesto a la Renta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4940, 'PC-MIPYME', 'Resultado', '4.6.10.1', '4939', 'Provisión Impuesto a la Renta', 1);
