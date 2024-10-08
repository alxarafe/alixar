--

-- Description of chart of account Mexico SAT/24-2019
-- 

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526100000, 'SAT/24-2019', 'ACTIVO', '100', 0, 'Activo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526100010, 'SAT/24-2019', 'ACTIVO', '100.01', 526100000, 'Activo a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526100990, 'SAT/24-2019', 'ACTIVO', '100.99', 526100010, 'Efectivo y Equivalentes de Efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526101000, 'SAT/24-2019', 'ACTIVO', '101', 526100990, 'Caja', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526101010, 'SAT/24-2019', 'ACTIVO', '101.01', 526101000, 'Caja y efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526102000, 'SAT/24-2019', 'ACTIVO', '102', 526100990, 'Bancos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526102010, 'SAT/24-2019', 'ACTIVO', '102.01', 526102000, 'Bancos nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526102020, 'SAT/24-2019', 'ACTIVO', '102.02', 526102000, 'Bancos extranjeros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526103000, 'SAT/24-2019', 'ACTIVO', '103', 526100990, 'Inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526103010, 'SAT/24-2019', 'ACTIVO', '103.01', 526103000, 'Inversiones temporales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526103020, 'SAT/24-2019', 'ACTIVO', '103.02', 526103000, 'Inversiones en fideicomisos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526103030, 'SAT/24-2019', 'ACTIVO', '103.03', 526103000, 'Otras inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526104000, 'SAT/24-2019', 'ACTIVO', '104', 526100990, 'Otros instrumentos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526104010, 'SAT/24-2019', 'ACTIVO', '104.01', 526104000, 'Otros instrumentos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526105000, 'SAT/24-2019', 'ACTIVO', '105', 526100010, 'Clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526105010, 'SAT/24-2019', 'ACTIVO', '105.01', 526105000, 'Clientes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526105020, 'SAT/24-2019', 'ACTIVO', '105.02', 526105000, 'Clientes extranjeros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526105030, 'SAT/24-2019', 'ACTIVO', '105.03', 526105000, 'Clientes nacionales parte relacionada',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526105040, 'SAT/24-2019', 'ACTIVO', '105.04', 526105000, 'Clientes extranjeros parte relacionada',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106000, 'SAT/24-2019', 'ACTIVO', '106', 526100010,
        'Cuentas y documentos por cobrar a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106010, 'SAT/24-2019', 'ACTIVO', '106.01', 526106000,
        'Cuentas y documentos por cobrar a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106020, 'SAT/24-2019', 'ACTIVO', '106.02', 526106000,
        'Cuentas y documentos por cobrar a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106030, 'SAT/24-2019', 'ACTIVO', '106.03', 526106000,
        'Cuentas y documentos por cobrar a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106040, 'SAT/24-2019', 'ACTIVO', '106.04', 526106000,
        'Cuentas y documentos por cobrar a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106050, 'SAT/24-2019', 'ACTIVO', '106.05', 526106000,
        'Intereses por cobrar a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106060, 'SAT/24-2019', 'ACTIVO', '106.06', 526106000,
        'Intereses por cobrar a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106070, 'SAT/24-2019', 'ACTIVO', '106.07', 526106000,
        'Intereses por cobrar a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106080, 'SAT/24-2019', 'ACTIVO', '106.08', 526106000,
        'Intereses por cobrar a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106090, 'SAT/24-2019', 'ACTIVO', '106.09', 526106000,
        'Otras cuentas y documentos por cobrar a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526106100, 'SAT/24-2019', 'ACTIVO', '106.1', 526106000,
        'Otras cuentas y documentos por cobrar a corto plazo parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107000, 'SAT/24-2019', 'ACTIVO', '107', 526100010, 'Deudores diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107010, 'SAT/24-2019', 'ACTIVO', '107.01', 526107000, 'Funcionarios y empleados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107020, 'SAT/24-2019', 'ACTIVO', '107.02', 526107000, 'Socios y accionistas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107030, 'SAT/24-2019', 'ACTIVO', '107.03', 526107000, 'Partes relacionadas nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107040, 'SAT/24-2019', 'ACTIVO', '107.04', 526107000, 'Partes relacionadas extranjeros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526107050, 'SAT/24-2019', 'ACTIVO', '107.05', 526107000, 'Otros deudores diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526108000, 'SAT/24-2019', 'ACTIVO', '108', 526100010, 'Estimación de cuentas incobrables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526108010, 'SAT/24-2019', 'ACTIVO', '108.01', 526108000,
        'Estimación de cuentas incobrables nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526108020, 'SAT/24-2019', 'ACTIVO', '108.02', 526108000,
        'Estimación de cuentas incobrables extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526108030, 'SAT/24-2019', 'ACTIVO', '108.03', 526108000,
        'Estimación de cuentas incobrables nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526108040, 'SAT/24-2019', 'ACTIVO', '108.04', 526108000,
        'Estimación de cuentas incobrables extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109000, 'SAT/24-2019', 'ACTIVO', '109', 526100990, 'Pagos anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109010, 'SAT/24-2019', 'ACTIVO', '109.01', 526109000,
        'Seguros y fianzas pagados por anticipado nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109020, 'SAT/24-2019', 'ACTIVO', '109.02', 526109000,
        'Seguros y fianzas pagados por anticipado extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109030, 'SAT/24-2019', 'ACTIVO', '109.03', 526109000,
        'Seguros y fianzas pagados por anticipado nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109040, 'SAT/24-2019', 'ACTIVO', '109.04', 526109000,
        'Seguros y fianzas pagados por anticipado extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109050, 'SAT/24-2019', 'ACTIVO', '109.05', 526109000, 'Rentas pagados por anticipado nacional',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109060, 'SAT/24-2019', 'ACTIVO', '109.06', 526109000, 'Rentas pagados por anticipado extranjero',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109070, 'SAT/24-2019', 'ACTIVO', '109.07', 526109000,
        'Rentas pagados por anticipado nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109080, 'SAT/24-2019', 'ACTIVO', '109.08', 526109000,
        'Rentas pagados por anticipado extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109090, 'SAT/24-2019', 'ACTIVO', '109.09', 526109000,
        'Intereses pagados por anticipado nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109100, 'SAT/24-2019', 'ACTIVO', '109.1', 526109000,
        'Intereses pagados por anticipado extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109110, 'SAT/24-2019', 'ACTIVO', '109.11', 526109000,
        'Intereses pagados por anticipado nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109120, 'SAT/24-2019', 'ACTIVO', '109.12', 526109000,
        'Intereses pagados por anticipado extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109130, 'SAT/24-2019', 'ACTIVO', '109.13', 526109000,
        'Factoraje financiero pagados por anticipado nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109140, 'SAT/24-2019', 'ACTIVO', '109.14', 526109000,
        'Factoraje financiero pagados por anticipado extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109150, 'SAT/24-2019', 'ACTIVO', '109.15', 526109000,
        'Factoraje financiero pagados por anticipado nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109160, 'SAT/24-2019', 'ACTIVO', '109.16', 526109000,
        'Factoraje financiero pagados por anticipado extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109170, 'SAT/24-2019', 'ACTIVO', '109.17', 526109000,
        'Arrendamiento financiero pagados por anticipado nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109180, 'SAT/24-2019', 'ACTIVO', '109.18', 526109000,
        'Arrendamiento financiero pagados por anticipado extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109190, 'SAT/24-2019', 'ACTIVO', '109.19', 526109000,
        'Arrendamiento financiero pagados por anticipado nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109200, 'SAT/24-2019', 'ACTIVO', '109.2', 526109000,
        'Arrendamiento financiero pagados por anticipado extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109210, 'SAT/24-2019', 'ACTIVO', '109.21', 526109000,
        'Pérdida por deterioro de pagos anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109220, 'SAT/24-2019', 'ACTIVO', '109.22', 526109000, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526109230, 'SAT/24-2019', 'ACTIVO', '109.23', 526109000, 'Otros pagos anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526110000, 'SAT/24-2019', 'ACTIVO', '110', 526100010, 'Subsidio al empleo por aplicar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526110010, 'SAT/24-2019', 'ACTIVO', '110.01', 526110000, 'Subsidio al empleo por aplicar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526111000, 'SAT/24-2019', 'ACTIVO', '111', 526100010, 'Crédito al diésel por acreditar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526111010, 'SAT/24-2019', 'ACTIVO', '111.01', 526111000, 'Crédito al diésel por acreditar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526112000, 'SAT/24-2019', 'ACTIVO', '112', 526100010, 'Otros estímulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526112010, 'SAT/24-2019', 'ACTIVO', '112.01', 526112000, 'Otros estímulos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113000, 'SAT/24-2019', 'ACTIVO', '113', 526100010, 'Impuestos a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113010, 'SAT/24-2019', 'ACTIVO', '113.01', 526113000, 'IVA a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113020, 'SAT/24-2019', 'ACTIVO', '113.02', 526113000, 'ISR a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113030, 'SAT/24-2019', 'ACTIVO', '113.03', 526113000, 'IETU a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113040, 'SAT/24-2019', 'ACTIVO', '113.04', 526113000, 'IDE a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113050, 'SAT/24-2019', 'ACTIVO', '113.05', 526113000, 'IA a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113060, 'SAT/24-2019', 'ACTIVO', '113.06', 526113000, 'Subsidio al empleo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113070, 'SAT/24-2019', 'ACTIVO', '113.07', 526113000, 'Pago de lo indebido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526113080, 'SAT/24-2019', 'ACTIVO', '113.08', 526113000, 'Otros impuestos a favor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526114000, 'SAT/24-2019', 'ACTIVO', '114', 526100010, 'Pagos provisionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526114010, 'SAT/24-2019', 'ACTIVO', '114.01', 526114000, 'Pagos provisionales de ISR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115000, 'SAT/24-2019', 'ACTIVO', '115', 526100010, 'Inventario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115010, 'SAT/24-2019', 'ACTIVO', '115.01', 526115000, 'Inventario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115020, 'SAT/24-2019', 'ACTIVO', '115.02', 526115000, 'Materia prima y materiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115030, 'SAT/24-2019', 'ACTIVO', '115.03', 526115000, 'Producción en proceso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115040, 'SAT/24-2019', 'ACTIVO', '115.04', 526115000, 'Productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115050, 'SAT/24-2019', 'ACTIVO', '115.05', 526115000, 'Mercancías en tránsito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115060, 'SAT/24-2019', 'ACTIVO', '115.06', 526115000, 'Mercancías en poder de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526115070, 'SAT/24-2019', 'ACTIVO', '115.07', 526115000, 'Otros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526116000, 'SAT/24-2019', 'ACTIVO', '116', 526100010,
        'Estimación de inventarios obsoletos y de lento movimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526116010, 'SAT/24-2019', 'ACTIVO', '116.01', 526116000,
        'Estimación de inventarios obsoletos y de lento movimiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526117000, 'SAT/24-2019', 'ACTIVO', '117', 526100010, 'Obras en proceso de inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526117010, 'SAT/24-2019', 'ACTIVO', '117.01', 526117000, 'Obras en proceso de inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526118000, 'SAT/24-2019', 'ACTIVO', '118', 526100010, 'Impuestos acreditables pagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526118010, 'SAT/24-2019', 'ACTIVO', '118.01', 526118000, 'IVA acreditable pagado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526118020, 'SAT/24-2019', 'ACTIVO', '118.02', 526118000, 'IVA acreditable de importación pagado',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526118030, 'SAT/24-2019', 'ACTIVO', '118.03', 526118000, 'IEPS acreditable pagado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526118040, 'SAT/24-2019', 'ACTIVO', '118.04', 526118000, 'IEPS pagado en importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526119000, 'SAT/24-2019', 'ACTIVO', '119', 526100010, 'Impuestos acreditables por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526119010, 'SAT/24-2019', 'ACTIVO', '119.01', 526119000, 'IVA pendiente de pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526119020, 'SAT/24-2019', 'ACTIVO', '119.02', 526119000, 'IVA de importación pendiente de pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526119030, 'SAT/24-2019', 'ACTIVO', '119.03', 526119000, 'IEPS pendiente de pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526119040, 'SAT/24-2019', 'ACTIVO', '119.04', 526119000, 'IEPS pendiente de pago en importación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526120000, 'SAT/24-2019', 'ACTIVO', '120', 526100010, 'Anticipo a proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526120010, 'SAT/24-2019', 'ACTIVO', '120.01', 526120000, 'Anticipo a proveedores nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526120020, 'SAT/24-2019', 'ACTIVO', '120.02', 526120000, 'Anticipo a proveedores extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526120030, 'SAT/24-2019', 'ACTIVO', '120.03', 526120000,
        'Anticipo a proveedores nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526120040, 'SAT/24-2019', 'ACTIVO', '120.04', 526120000,
        'Anticipo a proveedores extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526121000, 'SAT/24-2019', 'ACTIVO', '121', 526100010, 'Otros activos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526121010, 'SAT/24-2019', 'ACTIVO', '121.01', 526121000, 'Otros activos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526100020, 'SAT/24-2019', 'ACTIVO', '100.02', 526100000, 'Activo a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526151000, 'SAT/24-2019', 'ACTIVO', '151', 526100020, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526151010, 'SAT/24-2019', 'ACTIVO', '151.01', 526151000, 'Terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526152600, 'SAT/24-2019', 'ACTIVO', '152', 526100020, 'Edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526152610, 'SAT/24-2019', 'ACTIVO', '152.01', 526152600, 'Edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526153000, 'SAT/24-2019', 'ACTIVO', '153', 526100020, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526153010, 'SAT/24-2019', 'ACTIVO', '153.01', 526153000, 'Maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526154000, 'SAT/24-2019', 'ACTIVO', '154', 526100020,
        'Automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526154010, 'SAT/24-2019', 'ACTIVO', '154.01', 526154000,
        'Automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526155000, 'SAT/24-2019', 'ACTIVO', '155', 526100020, 'Mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526155010, 'SAT/24-2019', 'ACTIVO', '155.01', 526155000, 'Mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526156000, 'SAT/24-2019', 'ACTIVO', '156', 526100020, 'Equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526156010, 'SAT/24-2019', 'ACTIVO', '156.01', 526156000, 'Equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526157000, 'SAT/24-2019', 'ACTIVO', '157', 526100020, 'Equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526157010, 'SAT/24-2019', 'ACTIVO', '157.01', 526157000, 'Equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526158000, 'SAT/24-2019', 'ACTIVO', '158', 526100020, 'Activos biológicos, vegetales y semovientes',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526158010, 'SAT/24-2019', 'ACTIVO', '158.01', 526158000,
        'Activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526159000, 'SAT/24-2019', 'ACTIVO', '159', 526100020, 'Obras en proceso de activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526159010, 'SAT/24-2019', 'ACTIVO', '159.01', 526159000, 'Obras en proceso de activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526160000, 'SAT/24-2019', 'ACTIVO', '160', 526100020, 'Otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526160010, 'SAT/24-2019', 'ACTIVO', '160.01', 526160000, 'Otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526161000, 'SAT/24-2019', 'ACTIVO', '161', 526100020, 'Ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526161010, 'SAT/24-2019', 'ACTIVO', '161.01', 526161000, 'Ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526162000, 'SAT/24-2019', 'ACTIVO', '162', 526100020, 'Embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526162010, 'SAT/24-2019', 'ACTIVO', '162.01', 526162000, 'Embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526163000, 'SAT/24-2019', 'ACTIVO', '163', 526100020, 'Aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526163010, 'SAT/24-2019', 'ACTIVO', '163.01', 526163000, 'Aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526164000, 'SAT/24-2019', 'ACTIVO', '164', 526100020, 'Troqueles, moldes, matrices y herramental',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526164010, 'SAT/24-2019', 'ACTIVO', '164.01', 526164000,
        'Troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526165000, 'SAT/24-2019', 'ACTIVO', '165', 526100020, 'Equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526165010, 'SAT/24-2019', 'ACTIVO', '165.01', 526165000, 'Equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526166000, 'SAT/24-2019', 'ACTIVO', '166', 526100020, 'Equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526166010, 'SAT/24-2019', 'ACTIVO', '166.01', 526166000, 'Equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526167000, 'SAT/24-2019', 'ACTIVO', '167', 526100020,
        'Equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526167010, 'SAT/24-2019', 'ACTIVO', '167.01', 526167000,
        'Equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526168000, 'SAT/24-2019', 'ACTIVO', '168', 526100020,
        'Maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526168010, 'SAT/24-2019', 'ACTIVO', '168.01', 526168000,
        'Maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526169000, 'SAT/24-2019', 'ACTIVO', '169', 526100020, 'Otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526169010, 'SAT/24-2019', 'ACTIVO', '169.01', 526169000, 'Otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526170000, 'SAT/24-2019', 'ACTIVO', '170', 526100020, 'Adaptaciones y mejoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526170010, 'SAT/24-2019', 'ACTIVO', '170.01', 526170000, 'Adaptaciones y mejoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171000, 'SAT/24-2019', 'ACTIVO', '171', 526100020, 'Depreciación acumulada de activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171010, 'SAT/24-2019', 'ACTIVO', '171.01', 526171000, 'Depreciación acumulada de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171020, 'SAT/24-2019', 'ACTIVO', '171.02', 526171000,
        'Depreciación acumulada de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171030, 'SAT/24-2019', 'ACTIVO', '171.03', 526171000,
        'Depreciación acumulada de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171040, 'SAT/24-2019', 'ACTIVO', '171.04', 526171000,
        'Depreciación acumulada de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171050, 'SAT/24-2019', 'ACTIVO', '171.05', 526171000,
        'Depreciación acumulada de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171060, 'SAT/24-2019', 'ACTIVO', '171.06', 526171000,
        'Depreciación acumulada de equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171070, 'SAT/24-2019', 'ACTIVO', '171.07', 526171000,
        'Depreciación acumulada de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171080, 'SAT/24-2019', 'ACTIVO', '171.08', 526171000,
        'Depreciación acumulada de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171090, 'SAT/24-2019', 'ACTIVO', '171.09', 526171000, 'Depreciación acumulada de ferrocarriles',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171100, 'SAT/24-2019', 'ACTIVO', '171.1', 526171000, 'Depreciación acumulada de embarcaciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171110, 'SAT/24-2019', 'ACTIVO', '171.11', 526171000, 'Depreciación acumulada de aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171120, 'SAT/24-2019', 'ACTIVO', '171.12', 526171000,
        'Depreciación acumulada de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171130, 'SAT/24-2019', 'ACTIVO', '171.13', 526171000,
        'Depreciación acumulada de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171140, 'SAT/24-2019', 'ACTIVO', '171.14', 526171000,
        'Depreciación acumulada de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171150, 'SAT/24-2019', 'ACTIVO', '171.15', 526171000,
        'Depreciación acumulada de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171160, 'SAT/24-2019', 'ACTIVO', '171.16', 526171000,
        'Depreciación acumulada de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171170, 'SAT/24-2019', 'ACTIVO', '171.17', 526171000,
        'Depreciación acumulada de adaptaciones y mejoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526171180, 'SAT/24-2019', 'ACTIVO', '171.18', 526171000,
        'Depreciación acumulada de otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172000, 'SAT/24-2019', 'ACTIVO', '172', 526100020,
        'Pérdida por deterioro acumulado de activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172010, 'SAT/24-2019', 'ACTIVO', '172.01', 526172000,
        'Pérdida por deterioro acumulado de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172020, 'SAT/24-2019', 'ACTIVO', '172.02', 526172000,
        'Pérdida por deterioro acumulado de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172030, 'SAT/24-2019', 'ACTIVO', '172.03', 526172000,
        'Pérdida por deterioro acumulado de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172040, 'SAT/24-2019', 'ACTIVO', '172.04', 526172000,
        'Pérdida por deterioro acumulado de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172050, 'SAT/24-2019', 'ACTIVO', '172.05', 526172000,
        'Pérdida por deterioro acumulado de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172060, 'SAT/24-2019', 'ACTIVO', '172.06', 526172000,
        'Pérdida por deterioro acumulado de equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172070, 'SAT/24-2019', 'ACTIVO', '172.07', 526172000,
        'Pérdida por deterioro acumulado de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172080, 'SAT/24-2019', 'ACTIVO', '172.08', 526172000,
        'Pérdida por deterioro acumulado de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172090, 'SAT/24-2019', 'ACTIVO', '172.09', 526172000,
        'Pérdida por deterioro acumulado de ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172100, 'SAT/24-2019', 'ACTIVO', '172.1', 526172000,
        'Pérdida por deterioro acumulado de embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172110, 'SAT/24-2019', 'ACTIVO', '172.11', 526172000,
        'Pérdida por deterioro acumulado de aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172120, 'SAT/24-2019', 'ACTIVO', '172.12', 526172000,
        'Pérdida por deterioro acumulado de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172130, 'SAT/24-2019', 'ACTIVO', '172.13', 526172000,
        'Pérdida por deterioro acumulado de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172140, 'SAT/24-2019', 'ACTIVO', '172.14', 526172000,
        'Pérdida por deterioro acumulado de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172150, 'SAT/24-2019', 'ACTIVO', '172.15', 526172000,
        'Pérdida por deterioro acumulado de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172160, 'SAT/24-2019', 'ACTIVO', '172.16', 526172000,
        'Pérdida por deterioro acumulado de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172170, 'SAT/24-2019', 'ACTIVO', '172.17', 526172000,
        'Pérdida por deterioro acumulado de adaptaciones y mejoras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526172180, 'SAT/24-2019', 'ACTIVO', '172.18', 526172000,
        'Pérdida por deterioro acumulado de otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526173000, 'SAT/24-2019', 'ACTIVO', '173', 526100020, 'Gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526173010, 'SAT/24-2019', 'ACTIVO', '173.01', 526173000, 'Gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526174000, 'SAT/24-2019', 'ACTIVO', '174', 526100020, 'Gastos pre operativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526174010, 'SAT/24-2019', 'ACTIVO', '174.01', 526174000, 'Gastos pre operativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526175000, 'SAT/24-2019', 'ACTIVO', '175', 526100020,
        'Regalías, asistencia técnica y otros gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526175010, 'SAT/24-2019', 'ACTIVO', '175.01', 526175000,
        'Regalías, asistencia técnica y otros gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526176000, 'SAT/24-2019', 'ACTIVO', '176', 526100020, 'Activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526176010, 'SAT/24-2019', 'ACTIVO', '176.01', 526176000, 'Activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526177000, 'SAT/24-2019', 'ACTIVO', '177', 526100020, 'Gastos de organización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526177010, 'SAT/24-2019', 'ACTIVO', '177.01', 526177000, 'Gastos de organización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526178000, 'SAT/24-2019', 'ACTIVO', '178', 526100020, 'Investigación y desarrollo de mercado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526178010, 'SAT/24-2019', 'ACTIVO', '178.01', 526178000, 'Investigación y desarrollo de mercado',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526179000, 'SAT/24-2019', 'ACTIVO', '179', 526100020, 'Marcas y patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526179010, 'SAT/24-2019', 'ACTIVO', '179.01', 526179000, 'Marcas y patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526180000, 'SAT/24-2019', 'ACTIVO', '180', 526100020, 'Crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526180010, 'SAT/24-2019', 'ACTIVO', '180.01', 526180000, 'Crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526181000, 'SAT/24-2019', 'ACTIVO', '181', 526100020, 'Gastos de instalación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526181010, 'SAT/24-2019', 'ACTIVO', '181.01', 526181000, 'Gastos de instalación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526182000, 'SAT/24-2019', 'ACTIVO', '182', 526100020, 'Otros activos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526182010, 'SAT/24-2019', 'ACTIVO', '182.01', 526182000, 'Otros activos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183000, 'SAT/24-2019', 'ACTIVO', '183', 526100020, 'Amortización acumulada de activos diferidos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183010, 'SAT/24-2019', 'ACTIVO', '183.01', 526183000,
        'Amortización acumulada de gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183020, 'SAT/24-2019', 'ACTIVO', '183.02', 526183000,
        'Amortización acumulada de gastos pre operativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183030, 'SAT/24-2019', 'ACTIVO', '183.03', 526183000,
        'Amortización acumulada de regalías, asistencia técnica y otros gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183040, 'SAT/24-2019', 'ACTIVO', '183.04', 526183000,
        'Amortización acumulada de activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183050, 'SAT/24-2019', 'ACTIVO', '183.05', 526183000,
        'Amortización acumulada de gastos de organización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183060, 'SAT/24-2019', 'ACTIVO', '183.06', 526183000,
        'Amortización acumulada de investigación y desarrollo de mercado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183070, 'SAT/24-2019', 'ACTIVO', '183.07', 526183000,
        'Amortización acumulada de marcas y patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183080, 'SAT/24-2019', 'ACTIVO', '183.08', 526183000,
        'Amortización acumulada de crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183090, 'SAT/24-2019', 'ACTIVO', '183.09', 526183000,
        'Amortización acumulada de gastos de instalación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526183100, 'SAT/24-2019', 'ACTIVO', '183.1', 526183000,
        'Amortización acumulada de otros activos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526184000, 'SAT/24-2019', 'ACTIVO', '184', 526100020, 'Depósitos en garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526184010, 'SAT/24-2019', 'ACTIVO', '184.01', 526184000, 'Depósitos de fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526184020, 'SAT/24-2019', 'ACTIVO', '184.02', 526184000,
        'Depósitos de arrendamiento de bienes inmuebles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526184030, 'SAT/24-2019', 'ACTIVO', '184.03', 526184000, 'Otros depósitos en garantía', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526185000, 'SAT/24-2019', 'ACTIVO', '185', 526100020, 'Impuestos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526185010, 'SAT/24-2019', 'ACTIVO', '185.01', 526185000, 'Impuestos diferidos ISR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186000, 'SAT/24-2019', 'ACTIVO', '186', 526100020,
        'Cuentas y documentos por cobrar a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186010, 'SAT/24-2019', 'ACTIVO', '186.01', 526186000,
        'Cuentas y documentos por cobrar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186020, 'SAT/24-2019', 'ACTIVO', '186.02', 526186000,
        'Cuentas y documentos por cobrar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186030, 'SAT/24-2019', 'ACTIVO', '186.03', 526186000,
        'Cuentas y documentos por cobrar a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186040, 'SAT/24-2019', 'ACTIVO', '186.04', 526186000,
        'Cuentas y documentos por cobrar a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186050, 'SAT/24-2019', 'ACTIVO', '186.05', 526186000,
        'Intereses por cobrar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186060, 'SAT/24-2019', 'ACTIVO', '186.06', 526186000,
        'Intereses por cobrar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186070, 'SAT/24-2019', 'ACTIVO', '186.07', 526186000,
        'Intereses por cobrar a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186080, 'SAT/24-2019', 'ACTIVO', '186.08', 526186000,
        'Intereses por cobrar a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186090, 'SAT/24-2019', 'ACTIVO', '186.09', 526186000,
        'Otras cuentas y documentos por cobrar a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526186100, 'SAT/24-2019', 'ACTIVO', '186.1', 526186000,
        'Otras cuentas y documentos por cobrar a largo plazo parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526187000, 'SAT/24-2019', 'ACTIVO', '187', 526100020,
        'Participación de los trabajadores en las utilidades diferidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526187010, 'SAT/24-2019', 'ACTIVO', '187.01', 526187000,
        'Participación de los trabajadores en las utilidades diferidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526188000, 'SAT/24-2019', 'ACTIVO', '188', 526100020, 'Inversiones permanentes en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526188010, 'SAT/24-2019', 'ACTIVO', '188.01', 526188000,
        'Inversiones a largo plazo en subsidiarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526188020, 'SAT/24-2019', 'ACTIVO', '188.02', 526188000, 'Inversiones a largo plazo en asociadas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526188030, 'SAT/24-2019', 'ACTIVO', '188.03', 526188000,
        'Otras inversiones permanentes en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526189000, 'SAT/24-2019', 'ACTIVO', '189', 526100020,
        'Estimación por deterioro de inversiones permanentes en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526189010, 'SAT/24-2019', 'ACTIVO', '189.01', 526189000,
        'Estimación por deterioro de inversiones permanentes en acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526190000, 'SAT/24-2019', 'ACTIVO', '190', 526100020, 'Otros instrumentos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526190010, 'SAT/24-2019', 'ACTIVO', '190.01', 526190000, 'Otros instrumentos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526191000, 'SAT/24-2019', 'ACTIVO', '191', 526100020, 'Otros activos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526191010, 'SAT/24-2019', 'ACTIVO', '191.01', 526191000, 'Otros activos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526200000, 'SAT/24-2019', 'PASIVO', '200', 0, 'Pasivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526200010, 'SAT/24-2019', 'PASIVO', '200.01', 526200000, 'Pasivo a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526201000, 'SAT/24-2019', 'PASIVO', '201', 526200010, 'Proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526201010, 'SAT/24-2019', 'PASIVO', '201.01', 526201000, 'Proveedores nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526201020, 'SAT/24-2019', 'PASIVO', '201.02', 526201000, 'Proveedores extranjeros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526201030, 'SAT/24-2019', 'PASIVO', '201.03', 526201000, 'Proveedores nacionales parte relacionada',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526201040, 'SAT/24-2019', 'PASIVO', '201.04', 526201000,
        'Proveedores extranjeros parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202000, 'SAT/24-2019', 'PASIVO', '202', 526200010, 'Cuentas por pagar a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202010, 'SAT/24-2019', 'PASIVO', '202.01', 526202000,
        'Documentos por pagar bancario y financiero nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202020, 'SAT/24-2019', 'PASIVO', '202.02', 526202000,
        'Documentos por pagar bancario y financiero extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202030, 'SAT/24-2019', 'PASIVO', '202.03', 526202000,
        'Documentos y cuentas por pagar a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202040, 'SAT/24-2019', 'PASIVO', '202.04', 526202000,
        'Documentos y cuentas por pagar a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202050, 'SAT/24-2019', 'PASIVO', '202.05', 526202000,
        'Documentos y cuentas por pagar a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202060, 'SAT/24-2019', 'PASIVO', '202.06', 526202000,
        'Documentos y cuentas por pagar a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202070, 'SAT/24-2019', 'PASIVO', '202.07', 526202000,
        'Intereses por pagar a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202080, 'SAT/24-2019', 'PASIVO', '202.08', 526202000,
        'Intereses por pagar a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202090, 'SAT/24-2019', 'PASIVO', '202.09', 526202000,
        'Intereses por pagar a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202100, 'SAT/24-2019', 'PASIVO', '202.1', 526202000,
        'Intereses por pagar a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202110, 'SAT/24-2019', 'PASIVO', '202.11', 526202000, 'Dividendo por pagar nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526202120, 'SAT/24-2019', 'PASIVO', '202.12', 526202000, 'Dividendo por pagar extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203000, 'SAT/24-2019', 'PASIVO', '203', 526200010, 'Cobros anticipados a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203010, 'SAT/24-2019', 'PASIVO', '203.01', 526203000,
        'Rentas cobradas por anticipado a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203020, 'SAT/24-2019', 'PASIVO', '203.02', 526203000,
        'Rentas cobradas por anticipado a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203030, 'SAT/24-2019', 'PASIVO', '203.03', 526203000,
        'Rentas cobradas por anticipado a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203040, 'SAT/24-2019', 'PASIVO', '203.04', 526203000,
        'Rentas cobradas por anticipado a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203050, 'SAT/24-2019', 'PASIVO', '203.05', 526203000,
        'Intereses cobrados por anticipado a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203060, 'SAT/24-2019', 'PASIVO', '203.06', 526203000,
        'Intereses cobrados por anticipado a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203070, 'SAT/24-2019', 'PASIVO', '203.07', 526203000,
        'Intereses cobrados por anticipado a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203080, 'SAT/24-2019', 'PASIVO', '203.08', 526203000,
        'Intereses cobrados por anticipado a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203090, 'SAT/24-2019', 'PASIVO', '203.09', 526203000,
        'Factoraje financiero cobrados por anticipado a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203100, 'SAT/24-2019', 'PASIVO', '203.1', 526203000,
        'Factoraje financiero cobrados por anticipado a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203110, 'SAT/24-2019', 'PASIVO', '203.11', 526203000,
        'Factoraje financiero cobrados por anticipado a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203120, 'SAT/24-2019', 'PASIVO', '203.12', 526203000,
        'Factoraje financiero cobrados por anticipado a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203130, 'SAT/24-2019', 'PASIVO', '203.13', 526203000,
        'Arrendamiento financiero cobrados por anticipado a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203140, 'SAT/24-2019', 'PASIVO', '203.14', 526203000,
        'Arrendamiento financiero cobrados por anticipado a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203150, 'SAT/24-2019', 'PASIVO', '203.15', 526203000,
        'Arrendamiento financiero cobrados por anticipado a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203160, 'SAT/24-2019', 'PASIVO', '203.16', 526203000,
        'Arrendamiento financiero cobrados por anticipado a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203170, 'SAT/24-2019', 'PASIVO', '203.17', 526203000, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526203180, 'SAT/24-2019', 'PASIVO', '203.18', 526203000, 'Otros cobros anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526204000, 'SAT/24-2019', 'PASIVO', '204', 526200010, 'Instrumentos financieros a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526204010, 'SAT/24-2019', 'PASIVO', '204.01', 526204000, 'Instrumentos financieros a corto plazo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205000, 'SAT/24-2019', 'PASIVO', '205', 526200010, 'Acreedores diversos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205010, 'SAT/24-2019', 'PASIVO', '205.01', 526205000,
        'Socios, accionistas o representante legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205020, 'SAT/24-2019', 'PASIVO', '205.02', 526205000,
        'Acreedores diversos a corto plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205030, 'SAT/24-2019', 'PASIVO', '205.03', 526205000,
        'Acreedores diversos a corto plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205040, 'SAT/24-2019', 'PASIVO', '205.04', 526205000,
        'Acreedores diversos a corto plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205050, 'SAT/24-2019', 'PASIVO', '205.05', 526205000,
        'Acreedores diversos a corto plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526205060, 'SAT/24-2019', 'PASIVO', '205.06', 526205000, 'Otros acreedores diversos a corto plazo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206000, 'SAT/24-2019', 'PASIVO', '206', 526200010, 'Anticipo de cliente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206010, 'SAT/24-2019', 'PASIVO', '206.01', 526206000, 'Anticipo de cliente nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206020, 'SAT/24-2019', 'PASIVO', '206.02', 526206000, 'Anticipo de cliente extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206030, 'SAT/24-2019', 'PASIVO', '206.03', 526206000,
        'Anticipo de cliente nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206040, 'SAT/24-2019', 'PASIVO', '206.04', 526206000,
        'Anticipo de cliente extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526206050, 'SAT/24-2019', 'PASIVO', '206.05', 526206000, 'Otros anticipos de clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526207000, 'SAT/24-2019', 'PASIVO', '207', 526200010, 'Impuestos trasladados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526207010, 'SAT/24-2019', 'PASIVO', '207.01', 526207000, 'IVA trasladado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526207020, 'SAT/24-2019', 'PASIVO', '207.02', 526207000, 'IEPS trasladado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526208000, 'SAT/24-2019', 'PASIVO', '208', 526200010, 'Impuestos trasladados cobrados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526208010, 'SAT/24-2019', 'PASIVO', '208.01', 526208000, 'IVA trasladado cobrado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526208020, 'SAT/24-2019', 'PASIVO', '208.02', 526208000, 'IEPS trasladado cobrado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526209000, 'SAT/24-2019', 'PASIVO', '209', 526200010, 'Impuestos trasladados no cobrados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526209010, 'SAT/24-2019', 'PASIVO', '209.01', 526209000, 'IVA trasladado no cobrado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526209020, 'SAT/24-2019', 'PASIVO', '209.02', 526209000, 'IEPS trasladado no cobrado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210000, 'SAT/24-2019', 'PASIVO', '210', 526200010, 'Provisión de sueldos y salarios por pagar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210010, 'SAT/24-2019', 'PASIVO', '210.01', 526210000,
        'Provisión de sueldos y salarios por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210020, 'SAT/24-2019', 'PASIVO', '210.02', 526210000, 'Provisión de vacaciones por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210030, 'SAT/24-2019', 'PASIVO', '210.03', 526210000, 'Provisión de aguinaldo por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210040, 'SAT/24-2019', 'PASIVO', '210.04', 526210000, 'Provisión de fondo de ahorro por pagar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210050, 'SAT/24-2019', 'PASIVO', '210.05', 526210000,
        'Provisión de asimilados a salarios por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210060, 'SAT/24-2019', 'PASIVO', '210.06', 526210000,
        'Provisión de anticipos o remanentes por distribuir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526210070, 'SAT/24-2019', 'PASIVO', '210.07', 526210000,
        'Provisión de otros sueldos y salarios por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526211000, 'SAT/24-2019', 'PASIVO', '211', 526200010,
        'Provisión de contribuciones de seguridad social por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526211010, 'SAT/24-2019', 'PASIVO', '211.01', 526211000, 'Provisión de IMSS patronal por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526211020, 'SAT/24-2019', 'PASIVO', '211.02', 526211000, 'Provisión de SAR por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526211030, 'SAT/24-2019', 'PASIVO', '211.03', 526211000, 'Provisión de infonavit por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526212000, 'SAT/24-2019', 'PASIVO', '212', 526200010,
        'Provisión de impuesto estatal sobre nómina por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526212010, 'SAT/24-2019', 'PASIVO', '212.01', 526212000,
        'Provisión de impuesto estatal sobre nómina por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213000, 'SAT/24-2019', 'PASIVO', '213', 526200010, 'Impuestos y derechos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213010, 'SAT/24-2019', 'PASIVO', '213.01', 526213000, 'IVA por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213020, 'SAT/24-2019', 'PASIVO', '213.02', 526213000, 'IEPS por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213030, 'SAT/24-2019', 'PASIVO', '213.03', 526213000, 'ISR por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213040, 'SAT/24-2019', 'PASIVO', '213.04', 526213000, 'Impuesto estatal sobre nómina por pagar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213050, 'SAT/24-2019', 'PASIVO', '213.05', 526213000, 'Impuesto estatal y municipal por pagar',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213060, 'SAT/24-2019', 'PASIVO', '213.06', 526213000, 'Derechos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526213070, 'SAT/24-2019', 'PASIVO', '213.07', 526213000, 'Otros impuestos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526214000, 'SAT/24-2019', 'PASIVO', '214', 526200010, 'Dividendos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526214010, 'SAT/24-2019', 'PASIVO', '214.01', 526214000, 'Dividendos por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526215000, 'SAT/24-2019', 'PASIVO', '215', 526200010, 'PTU por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526215010, 'SAT/24-2019', 'PASIVO', '215.01', 526215000, 'PTU por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526215020, 'SAT/24-2019', 'PASIVO', '215.02', 526215000, 'PTU por pagar de ejercicios anteriores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526215030, 'SAT/24-2019', 'PASIVO', '215.03', 526215000, 'Provisión de PTU por pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216000, 'SAT/24-2019', 'PASIVO', '216', 526200010, 'Impuestos retenidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216010, 'SAT/24-2019', 'PASIVO', '216.01', 526216000,
        'Impuestos retenidos de ISR por sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216020, 'SAT/24-2019', 'PASIVO', '216.02', 526216000,
        'Impuestos retenidos de ISR por asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216030, 'SAT/24-2019', 'PASIVO', '216.03', 526216000,
        'Impuestos retenidos de ISR por arrendamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216040, 'SAT/24-2019', 'PASIVO', '216.04', 526216000,
        'Impuestos retenidos de ISR por servicios profesionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216050, 'SAT/24-2019', 'PASIVO', '216.05', 526216000,
        'Impuestos retenidos de ISR por dividendos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216060, 'SAT/24-2019', 'PASIVO', '216.06', 526216000, 'Impuestos retenidos de ISR por intereses',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216070, 'SAT/24-2019', 'PASIVO', '216.07', 526216000,
        'Impuestos retenidos de ISR por pagos al extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216080, 'SAT/24-2019', 'PASIVO', '216.08', 526216000,
        'Impuestos retenidos de ISR por venta de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216090, 'SAT/24-2019', 'PASIVO', '216.09', 526216000,
        'Impuestos retenidos de ISR por venta de partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216100, 'SAT/24-2019', 'PASIVO', '216.1', 526216000, 'Impuestos retenidos de IVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216110, 'SAT/24-2019', 'PASIVO', '216.11', 526216000, 'Retenciones de IMSS a los trabajadores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526216120, 'SAT/24-2019', 'PASIVO', '216.12', 526216000, 'Otras impuestos retenidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526217000, 'SAT/24-2019', 'PASIVO', '217', 526200010, 'Pagos realizados por cuenta de terceros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526217010, 'SAT/24-2019', 'PASIVO', '217.01', 526217000, 'Pagos realizados por cuenta de terceros',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526218000, 'SAT/24-2019', 'PASIVO', '218', 526200010, 'Otros pasivos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526218010, 'SAT/24-2019', 'PASIVO', '218.01', 526218000, 'Otros pasivos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526200020, 'SAT/24-2019', 'PASIVO', '200.02', 526200000, 'Pasivo a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251000, 'SAT/24-2019', 'PASIVO', '251', 526200020, 'Acreedores diversos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251010, 'SAT/24-2019', 'PASIVO', '251.01', 526251000,
        'Socios, accionistas o representante legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251020, 'SAT/24-2019', 'PASIVO', '251.02', 526251000,
        'Acreedores diversos a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251030, 'SAT/24-2019', 'PASIVO', '251.03', 526251000,
        'Acreedores diversos a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251040, 'SAT/24-2019', 'PASIVO', '251.04', 526251000,
        'Acreedores diversos a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251050, 'SAT/24-2019', 'PASIVO', '251.05', 526251000,
        'Acreedores diversos a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526251060, 'SAT/24-2019', 'PASIVO', '251.06', 526251000, 'Otros acreedores diversos a largo plazo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252600, 'SAT/24-2019', 'PASIVO', '252', 526200020, 'Cuentas por pagar a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252610, 'SAT/24-2019', 'PASIVO', '252.01', 526252600,
        'Documentos bancarios y financieros por pagar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252620, 'SAT/24-2019', 'PASIVO', '252.02', 526252600,
        'Documentos bancarios y financieros por pagar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252630, 'SAT/24-2019', 'PASIVO', '252.03', 526252600,
        'Documentos y cuentas por pagar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252640, 'SAT/24-2019', 'PASIVO', '252.04', 526252600,
        'Documentos y cuentas por pagar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252650, 'SAT/24-2019', 'PASIVO', '252.05', 526252600,
        'Documentos y cuentas por pagar a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252660, 'SAT/24-2019', 'PASIVO', '252.06', 526252600,
        'Documentos y cuentas por pagar a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252670, 'SAT/24-2019', 'PASIVO', '252.07', 526252600,
        'Hipotecas por pagar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252680, 'SAT/24-2019', 'PASIVO', '252.08', 526252600,
        'Hipotecas por pagar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252690, 'SAT/24-2019', 'PASIVO', '252.09', 526252600,
        'Hipotecas por pagar a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252100, 'SAT/24-2019', 'PASIVO', '252.1', 526252600,
        'Hipotecas por pagar a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252110, 'SAT/24-2019', 'PASIVO', '252.11', 526252600,
        'Intereses por pagar a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252120, 'SAT/24-2019', 'PASIVO', '252.12', 526252600,
        'Intereses por pagar a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252130, 'SAT/24-2019', 'PASIVO', '252.13', 526252600,
        'Intereses por pagar a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252140, 'SAT/24-2019', 'PASIVO', '252.14', 526252600,
        'Intereses por pagar a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252150, 'SAT/24-2019', 'PASIVO', '252.15', 526252600, 'Dividendos por pagar nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252160, 'SAT/24-2019', 'PASIVO', '252.16', 526252600, 'Dividendos por pagar extranjeros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526252170, 'SAT/24-2019', 'PASIVO', '252.17', 526252600,
        'Otras cuentas y documentos por pagar a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253000, 'SAT/24-2019', 'PASIVO', '253', 526200020, 'Cobros anticipados a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253010, 'SAT/24-2019', 'PASIVO', '253.01', 526253000,
        'Rentas cobradas por anticipado a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253020, 'SAT/24-2019', 'PASIVO', '253.02', 526253000,
        'Rentas cobradas por anticipado a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253030, 'SAT/24-2019', 'PASIVO', '253.03', 526253000,
        'Rentas cobradas por anticipado a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253040, 'SAT/24-2019', 'PASIVO', '253.04', 526253000,
        'Rentas cobradas por anticipado a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253050, 'SAT/24-2019', 'PASIVO', '253.05', 526253000,
        'Intereses cobrados por anticipado a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253060, 'SAT/24-2019', 'PASIVO', '253.06', 526253000,
        'Intereses cobrados por anticipado a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253070, 'SAT/24-2019', 'PASIVO', '253.07', 526253000,
        'Intereses cobrados por anticipado a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253080, 'SAT/24-2019', 'PASIVO', '253.08', 526253000,
        'Intereses cobrados por anticipado a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253090, 'SAT/24-2019', 'PASIVO', '253.09', 526253000,
        'Factoraje financiero cobrados por anticipado a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253100, 'SAT/24-2019', 'PASIVO', '253.1', 526253000,
        'Factoraje financiero cobrados por anticipado a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253110, 'SAT/24-2019', 'PASIVO', '253.11', 526253000,
        'Factoraje financiero cobrados por anticipado a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253120, 'SAT/24-2019', 'PASIVO', '253.12', 526253000,
        'Factoraje financiero cobrados por anticipado a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253130, 'SAT/24-2019', 'PASIVO', '253.13', 526253000,
        'Arrendamiento financiero cobrados por anticipado a largo plazo nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253140, 'SAT/24-2019', 'PASIVO', '253.14', 526253000,
        'Arrendamiento financiero cobrados por anticipado a largo plazo extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253150, 'SAT/24-2019', 'PASIVO', '253.15', 526253000,
        'Arrendamiento financiero cobrados por anticipado a largo plazo nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253160, 'SAT/24-2019', 'PASIVO', '253.16', 526253000,
        'Arrendamiento financiero cobrados por anticipado a largo plazo extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253170, 'SAT/24-2019', 'PASIVO', '253.17', 526253000, 'Derechos fiduciarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526253180, 'SAT/24-2019', 'PASIVO', '253.18', 526253000, 'Otros cobros anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526254000, 'SAT/24-2019', 'PASIVO', '254', 526200020, 'Instrumentos financieros a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526254010, 'SAT/24-2019', 'PASIVO', '254.01', 526254000, 'Instrumentos financieros a largo plazo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526255000, 'SAT/24-2019', 'PASIVO', '255', 526200020,
        'Pasivos por beneficios a los empleados a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526255010, 'SAT/24-2019', 'PASIVO', '255.01', 526255000,
        'Pasivos por beneficios a los empleados a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526256000, 'SAT/24-2019', 'PASIVO', '256', 526200020, 'Otros pasivos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526256010, 'SAT/24-2019', 'PASIVO', '256.01', 526256000, 'Otros pasivos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526257000, 'SAT/24-2019', 'PASIVO', '257', 526200020,
        'Participación de los trabajadores en las utilidades diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526257010, 'SAT/24-2019', 'PASIVO', '257.01', 526257000,
        'Participación de los trabajadores en las utilidades diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526258000, 'SAT/24-2019', 'PASIVO', '258', 526200020, 'Obligaciones contraídas de fideicomisos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526258010, 'SAT/24-2019', 'PASIVO', '258.01', 526258000, 'Obligaciones contraídas de fideicomisos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526259000, 'SAT/24-2019', 'PASIVO', '259', 526200020, 'Impuestos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526259010, 'SAT/24-2019', 'PASIVO', '259.01', 526259000, 'ISR diferido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526259020, 'SAT/24-2019', 'PASIVO', '259.02', 526259000, 'ISR por dividendo diferido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526259030, 'SAT/24-2019', 'PASIVO', '259.03', 526259000, 'Otros impuestos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526260000, 'SAT/24-2019', 'PASIVO', '260', 526200020, 'Pasivos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526260010, 'SAT/24-2019', 'PASIVO', '260.01', 526260000, 'Pasivos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526300000, 'SAT/24-2019', 'CAPITAL', '300', 0, 'Capital contable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301000, 'SAT/24-2019', 'CAPITAL', '301', 526300000, 'Capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301010, 'SAT/24-2019', 'CAPITAL', '301.01', 526301000, 'Capital fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301020, 'SAT/24-2019', 'CAPITAL', '301.02', 526301000, 'Capital variable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301030, 'SAT/24-2019', 'CAPITAL', '301.03', 526301000,
        'Aportaciones para futuros aumentos de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301040, 'SAT/24-2019', 'CAPITAL', '301.04', 526301000, 'Prima en suscripción de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526301050, 'SAT/24-2019', 'CAPITAL', '301.05', 526301000, 'Prima en suscripción de partes sociales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526302000, 'SAT/24-2019', 'CAPITAL', '302', 526300000, 'Patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526302010, 'SAT/24-2019', 'CAPITAL', '302.01', 526302000, 'Patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526302020, 'SAT/24-2019', 'CAPITAL', '302.02', 526302000, 'Aportación patrimonial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526302030, 'SAT/24-2019', 'CAPITAL', '302.03', 526302000, 'Déficit o remanente del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526303000, 'SAT/24-2019', 'CAPITAL', '303', 526300000, 'Reserva legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526303010, 'SAT/24-2019', 'CAPITAL', '303.01', 526303000, 'Reserva legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526304000, 'SAT/24-2019', 'CAPITAL', '304', 526300000, 'Resultado de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526304010, 'SAT/24-2019', 'CAPITAL', '304.01', 526304000, 'Utilidad de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526304020, 'SAT/24-2019', 'CAPITAL', '304.02', 526304000, 'Pérdida de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526304030, 'SAT/24-2019', 'CAPITAL', '304.03', 526304000,
        'Resultado integral de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526304040, 'SAT/24-2019', 'CAPITAL', '304.04', 526304000,
        'Déficit o remanente de ejercicio anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526305000, 'SAT/24-2019', 'CAPITAL', '305', 526300000, 'Resultado del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526305010, 'SAT/24-2019', 'CAPITAL', '305.01', 526305000, 'Utilidad del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526305020, 'SAT/24-2019', 'CAPITAL', '305.02', 526305000, 'Pérdida del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526305030, 'SAT/24-2019', 'CAPITAL', '305.03', 526305000, 'Resultado integral', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526306000, 'SAT/24-2019', 'CAPITAL', '306', 526300000, 'Otras cuentas de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526306010, 'SAT/24-2019', 'CAPITAL', '306.01', 526306000, 'Otras cuentas de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526400000, 'SAT/24-2019', 'INGRESOS', '400', 0, 'Ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401000, 'SAT/24-2019', 'INGRESOS', '401', 526400000, 'Ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401010, 'SAT/24-2019', 'INGRESOS', '401.01', 526401000,
        'Ventas y/o servicios gravados a la tasa general', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401020, 'SAT/24-2019', 'INGRESOS', '401.02', 526401000,
        'Ventas y/o servicios gravados a la tasa general de contado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401030, 'SAT/24-2019', 'INGRESOS', '401.03', 526401000,
        'Ventas y/o servicios gravados a la tasa general a crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401040, 'SAT/24-2019', 'INGRESOS', '401.04', 526401000,
        'Ventas y/o servicios gravados realizados en zona fronteriza norte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401050, 'SAT/24-2019', 'INGRESOS', '401.05', 526401000,
        'Ventas y/o servicios gravados realizados en zona fronteriza norte de contado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401060, 'SAT/24-2019', 'INGRESOS', '401.06', 526401000,
        'Ventas y/o servicios gravados realizados en zona fronteriza norte a crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401070, 'SAT/24-2019', 'INGRESOS', '401.07', 526401000, 'Ventas y/o servicios gravados al 0%',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401080, 'SAT/24-2019', 'INGRESOS', '401.08', 526401000,
        'Ventas y/o servicios gravados al 0% de contado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401090, 'SAT/24-2019', 'INGRESOS', '401.09', 526401000,
        'Ventas y/o servicios gravados al 0% a crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401100, 'SAT/24-2019', 'INGRESOS', '401.1', 526401000, 'Ventas y/o servicios exentos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401110, 'SAT/24-2019', 'INGRESOS', '401.11', 526401000,
        'Ventas y/o servicios exentos de contado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401120, 'SAT/24-2019', 'INGRESOS', '401.12', 526401000, 'Ventas y/o servicios exentos a crédito',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401130, 'SAT/24-2019', 'INGRESOS', '401.13', 526401000,
        'Ventas y/o servicios gravados a la tasa general nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401140, 'SAT/24-2019', 'INGRESOS', '401.14', 526401000,
        'Ventas y/o servicios gravados a la tasa general extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401150, 'SAT/24-2019', 'INGRESOS', '401.15', 526401000,
        'Ventas y/o servicios gravados al 0% nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401160, 'SAT/24-2019', 'INGRESOS', '401.16', 526401000,
        'Ventas y/o servicios gravados al 0% extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401170, 'SAT/24-2019', 'INGRESOS', '401.17', 526401000,
        'Ventas y/o servicios exentos nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401180, 'SAT/24-2019', 'INGRESOS', '401.18', 526401000,
        'Ventas y/o servicios exentos extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401190, 'SAT/24-2019', 'INGRESOS', '401.19', 526401000, 'Ingresos por servicios administrativos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401200, 'SAT/24-2019', 'INGRESOS', '401.2', 526401000,
        'Ingresos por servicios administrativos nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401210, 'SAT/24-2019', 'INGRESOS', '401.21', 526401000,
        'Ingresos por servicios administrativos extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401220, 'SAT/24-2019', 'INGRESOS', '401.22', 526401000, 'Ingresos por servicios profesionales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401230, 'SAT/24-2019', 'INGRESOS', '401.23', 526401000,
        'Ingresos por servicios profesionales nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401240, 'SAT/24-2019', 'INGRESOS', '401.24', 526401000,
        'Ingresos por servicios profesionales extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401250, 'SAT/24-2019', 'INGRESOS', '401.25', 526401000, 'Ingresos por arrendamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401260, 'SAT/24-2019', 'INGRESOS', '401.26', 526401000,
        'Ingresos por arrendamiento nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401270, 'SAT/24-2019', 'INGRESOS', '401.27', 526401000,
        'Ingresos por arrendamiento extranjeros partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401280, 'SAT/24-2019', 'INGRESOS', '401.28', 526401000, 'Ingresos por exportación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401290, 'SAT/24-2019', 'INGRESOS', '401.29', 526401000, 'Ingresos por comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401300, 'SAT/24-2019', 'INGRESOS', '401.3', 526401000, 'Ingresos por maquila', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401310, 'SAT/24-2019', 'INGRESOS', '401.31', 526401000, 'Ingresos por coordinados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401320, 'SAT/24-2019', 'INGRESOS', '401.32', 526401000, 'Ingresos por regalías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401330, 'SAT/24-2019', 'INGRESOS', '401.33', 526401000, 'Ingresos por asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401340, 'SAT/24-2019', 'INGRESOS', '401.34', 526401000, 'Ingresos por donativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401350, 'SAT/24-2019', 'INGRESOS', '401.35', 526401000,
        'Ingresos por intereses (actividad propia)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401360, 'SAT/24-2019', 'INGRESOS', '401.36', 526401000, 'Ingresos de copropiedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401370, 'SAT/24-2019', 'INGRESOS', '401.37', 526401000, 'Ingresos por fideicomisos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401380, 'SAT/24-2019', 'INGRESOS', '401.38', 526401000, 'Ingresos por factoraje financiero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401390, 'SAT/24-2019', 'INGRESOS', '401.39', 526401000, 'Ingresos por arrendamiento financiero',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401400, 'SAT/24-2019', 'INGRESOS', '401.4', 526401000,
        'Ingresos de extranjeros con establecimiento en el país', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526401410, 'SAT/24-2019', 'INGRESOS', '401.41', 526401000, 'Otros ingresos propios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402000, 'SAT/24-2019', 'INGRESOS', '402', 526400000,
        'Devoluciones, descuentos o bonificaciones sobre ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402010, 'SAT/24-2019', 'INGRESOS', '402.01', 526402000,
        'Devoluciones, descuentos o bonificaciones sobre ventas y/o servicios a la tasa general', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402020, 'SAT/24-2019', 'INGRESOS', '402.02', 526402000,
        'Devoluciones, descuentos o bonificaciones sobre ventas y/o servicios en zona fronteriza norte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402030, 'SAT/24-2019', 'INGRESOS', '402.03', 526402000,
        'Devoluciones, descuentos o bonificaciones sobre ventas y/o servicios al 0%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402040, 'SAT/24-2019', 'INGRESOS', '402.04', 526402000,
        'Devoluciones, descuentos o bonificaciones sobre ventas y/o servicios exentos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526402050, 'SAT/24-2019', 'INGRESOS', '402.05', 526402000,
        'Devoluciones, descuentos o bonificaciones de otros ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403000, 'SAT/24-2019', 'INGRESOS', '403', 526400000, 'Otros ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403010, 'SAT/24-2019', 'INGRESOS', '403.01', 526403000, 'Otros Ingresos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403020, 'SAT/24-2019', 'INGRESOS', '403.02', 526403000,
        'Otros ingresos nacionales parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403030, 'SAT/24-2019', 'INGRESOS', '403.03', 526403000,
        'Otros ingresos extranjeros parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403040, 'SAT/24-2019', 'INGRESOS', '403.04', 526403000, 'Ingresos por operaciones discontinuas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526403050, 'SAT/24-2019', 'INGRESOS', '403.05', 526403000, 'Ingresos por condonación de adeudo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526500000, 'SAT/24-2019', 'COSTOS', '500', 0, 'Costos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501000, 'SAT/24-2019', 'COSTOS', '501', 526500000, 'Costo de venta y/o servicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501010, 'SAT/24-2019', 'COSTOS', '501.01', 526501000, 'Costo de venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501020, 'SAT/24-2019', 'COSTOS', '501.02', 526501000, 'Costo de servicios (Mano de obra)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501030, 'SAT/24-2019', 'COSTOS', '501.03', 526501000,
        'Materia prima directa utilizada para la producción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501040, 'SAT/24-2019', 'COSTOS', '501.04', 526501000,
        'Materia prima consumida en el proceso productivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501050, 'SAT/24-2019', 'COSTOS', '501.05', 526501000, 'Mano de obra directa consumida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501060, 'SAT/24-2019', 'COSTOS', '501.06', 526501000, 'Mano de obra directa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501070, 'SAT/24-2019', 'COSTOS', '501.07', 526501000, 'Cargos indirectos de producción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526501080, 'SAT/24-2019', 'COSTOS', '501.08', 526501000, 'Otros conceptos de costo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526502000, 'SAT/24-2019', 'COSTOS', '502', 526500000, 'Compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526502010, 'SAT/24-2019', 'COSTOS', '502.01', 526502000, 'Compras nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526502020, 'SAT/24-2019', 'COSTOS', '502.02', 526502000, 'Compras nacionales parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526502030, 'SAT/24-2019', 'COSTOS', '502.03', 526502000, 'Compras de Importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526502040, 'SAT/24-2019', 'COSTOS', '502.04', 526502000,
        'Compras de Importación partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526503000, 'SAT/24-2019', 'COSTOS', '503', 526500000,
        'Devoluciones, descuentos o bonificaciones sobre compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526503010, 'SAT/24-2019', 'COSTOS', '503.01', 526503000,
        'Devoluciones, descuentos o bonificaciones sobre compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504000, 'SAT/24-2019', 'COSTOS', '504', 526500000, 'Otras cuentas de costos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504010, 'SAT/24-2019', 'COSTOS', '504.01', 526504000, 'Gastos indirectos de fabricación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504020, 'SAT/24-2019', 'COSTOS', '504.02', 526504000,
        'Gastos indirectos de fabricación de partes relacionadas nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504030, 'SAT/24-2019', 'COSTOS', '504.03', 526504000,
        'Gastos indirectos de fabricación de partes relacionadas extranjeras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504040, 'SAT/24-2019', 'COSTOS', '504.04', 526504000, 'Otras cuentas de costos incurridos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504050, 'SAT/24-2019', 'COSTOS', '504.05', 526504000,
        'Otras cuentas de costos incurridos con partes relacionadas nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504060, 'SAT/24-2019', 'COSTOS', '504.06', 526504000,
        'Otras cuentas de costos incurridos con partes relacionadas extranjeras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504070, 'SAT/24-2019', 'COSTOS', '504.07', 526504000, 'Depreciación de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504080, 'SAT/24-2019', 'COSTOS', '504.08', 526504000, 'Depreciación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504090, 'SAT/24-2019', 'COSTOS', '504.09', 526504000,
        'Depreciación de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504100, 'SAT/24-2019', 'COSTOS', '504.1', 526504000,
        'Depreciación de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504110, 'SAT/24-2019', 'COSTOS', '504.11', 526504000, 'Depreciación de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504120, 'SAT/24-2019', 'COSTOS', '504.12', 526504000, 'Depreciación de equipo de comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504130, 'SAT/24-2019', 'COSTOS', '504.13', 526504000,
        'Depreciación de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504140, 'SAT/24-2019', 'COSTOS', '504.14', 526504000, 'Depreciación de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504150, 'SAT/24-2019', 'COSTOS', '504.15', 526504000, 'Depreciación de ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504160, 'SAT/24-2019', 'COSTOS', '504.16', 526504000, 'Depreciación de embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504170, 'SAT/24-2019', 'COSTOS', '504.17', 526504000, 'Depreciación de aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504180, 'SAT/24-2019', 'COSTOS', '504.18', 526504000,
        'Depreciación de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504190, 'SAT/24-2019', 'COSTOS', '504.19', 526504000,
        'Depreciación de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504200, 'SAT/24-2019', 'COSTOS', '504.2', 526504000,
        'Depreciación de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504210, 'SAT/24-2019', 'COSTOS', '504.21', 526504000,
        'Depreciación de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504220, 'SAT/24-2019', 'COSTOS', '504.22', 526504000,
        'Depreciación de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504230, 'SAT/24-2019', 'COSTOS', '504.23', 526504000, 'Depreciación de adaptaciones y mejoras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504240, 'SAT/24-2019', 'COSTOS', '504.24', 526504000, 'Depreciación de otra maquinaria y equipo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526504250, 'SAT/24-2019', 'COSTOS', '504.25', 526504000, 'Otras cuentas de costos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526505000, 'SAT/24-2019', 'COSTOS', '505', 526500000, 'Costo de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526505010, 'SAT/24-2019', 'COSTOS', '505.01', 526505000, 'Costo por venta de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526505020, 'SAT/24-2019', 'COSTOS', '505.02', 526505000, 'Costo por baja de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526600000, 'SAT/24-2019', 'GASTOS', '600', 0, 'Gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601000, 'SAT/24-2019', 'GASTOS', '601', 526600000, 'Gastos generales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601010, 'SAT/24-2019', 'GASTOS', '601.01', 526601000, 'Sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601020, 'SAT/24-2019', 'GASTOS', '601.02', 526601000, 'Compensaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601030, 'SAT/24-2019', 'GASTOS', '601.03', 526601000, 'Tiempos extras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601040, 'SAT/24-2019', 'GASTOS', '601.04', 526601000, 'Premios de asistencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601050, 'SAT/24-2019', 'GASTOS', '601.05', 526601000, 'Premios de puntualidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601060, 'SAT/24-2019', 'GASTOS', '601.06', 526601000, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601070, 'SAT/24-2019', 'GASTOS', '601.07', 526601000, 'Prima vacacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601080, 'SAT/24-2019', 'GASTOS', '601.08', 526601000, 'Prima dominical', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601090, 'SAT/24-2019', 'GASTOS', '601.09', 526601000, 'Días festivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601100, 'SAT/24-2019', 'GASTOS', '601.1', 526601000, 'Gratificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601110, 'SAT/24-2019', 'GASTOS', '601.11', 526601000, 'Primas de antigüedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601120, 'SAT/24-2019', 'GASTOS', '601.12', 526601000, 'Aguinaldo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601130, 'SAT/24-2019', 'GASTOS', '601.13', 526601000, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601140, 'SAT/24-2019', 'GASTOS', '601.14', 526601000, 'Destajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601150, 'SAT/24-2019', 'GASTOS', '601.15', 526601000, 'Despensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601160, 'SAT/24-2019', 'GASTOS', '601.16', 526601000, 'Transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601170, 'SAT/24-2019', 'GASTOS', '601.17', 526601000, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601180, 'SAT/24-2019', 'GASTOS', '601.18', 526601000, 'Ayuda en gastos funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601190, 'SAT/24-2019', 'GASTOS', '601.19', 526601000, 'Fondo de ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601200, 'SAT/24-2019', 'GASTOS', '601.2', 526601000, 'Cuotas sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601210, 'SAT/24-2019', 'GASTOS', '601.21', 526601000, 'PTU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601220, 'SAT/24-2019', 'GASTOS', '601.22', 526601000, 'Estímulo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601230, 'SAT/24-2019', 'GASTOS', '601.23', 526601000, 'Previsión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601240, 'SAT/24-2019', 'GASTOS', '601.24', 526601000, 'Aportaciones para el plan de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601250, 'SAT/24-2019', 'GASTOS', '601.25', 526601000, 'Otras prestaciones al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601260, 'SAT/24-2019', 'GASTOS', '601.26', 526601000, 'Cuotas al IMSS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601270, 'SAT/24-2019', 'GASTOS', '601.27', 526601000, 'Aportaciones al infonavit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601280, 'SAT/24-2019', 'GASTOS', '601.28', 526601000, 'Aportaciones al SAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601290, 'SAT/24-2019', 'GASTOS', '601.29', 526601000, 'Impuesto estatal sobre nóminas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601300, 'SAT/24-2019', 'GASTOS', '601.3', 526601000, 'Otras aportaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601310, 'SAT/24-2019', 'GASTOS', '601.31', 526601000, 'Asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601320, 'SAT/24-2019', 'GASTOS', '601.32', 526601000, 'Servicios administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601330, 'SAT/24-2019', 'GASTOS', '601.33', 526601000,
        'Servicios administrativos partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601340, 'SAT/24-2019', 'GASTOS', '601.34', 526601000,
        'Honorarios a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601350, 'SAT/24-2019', 'GASTOS', '601.35', 526601000,
        'Honorarios a personas físicas residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601360, 'SAT/24-2019', 'GASTOS', '601.36', 526601000,
        'Honorarios a personas físicas residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601370, 'SAT/24-2019', 'GASTOS', '601.37', 526601000,
        'Honorarios a personas físicas residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601380, 'SAT/24-2019', 'GASTOS', '601.38', 526601000,
        'Honorarios a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601390, 'SAT/24-2019', 'GASTOS', '601.39', 526601000,
        'Honorarios a personas morales residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601400, 'SAT/24-2019', 'GASTOS', '601.4', 526601000,
        'Honorarios a personas morales residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601410, 'SAT/24-2019', 'GASTOS', '601.41', 526601000,
        'Honorarios a personas morales residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601420, 'SAT/24-2019', 'GASTOS', '601.42', 526601000, 'Honorarios aduanales personas físicas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601430, 'SAT/24-2019', 'GASTOS', '601.43', 526601000, 'Honorarios aduanales personas morales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601440, 'SAT/24-2019', 'GASTOS', '601.44', 526601000, 'Honorarios al consejo de administración',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601450, 'SAT/24-2019', 'GASTOS', '601.45', 526601000,
        'Arrendamiento a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601460, 'SAT/24-2019', 'GASTOS', '601.46', 526601000,
        'Arrendamiento a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601470, 'SAT/24-2019', 'GASTOS', '601.47', 526601000,
        'Arrendamiento a residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601480, 'SAT/24-2019', 'GASTOS', '601.48', 526601000, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601490, 'SAT/24-2019', 'GASTOS', '601.49', 526601000, 'Viáticos y gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601500, 'SAT/24-2019', 'GASTOS', '601.5', 526601000, 'Teléfono, internet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601510, 'SAT/24-2019', 'GASTOS', '601.51', 526601000, 'Agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601526, 'SAT/24-2019', 'GASTOS', '601.52', 526601000, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601530, 'SAT/24-2019', 'GASTOS', '601.53', 526601000, 'Vigilancia y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601540, 'SAT/24-2019', 'GASTOS', '601.54', 526601000, 'Limpieza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601550, 'SAT/24-2019', 'GASTOS', '601.55', 526601000, 'Papelería y artículos de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601560, 'SAT/24-2019', 'GASTOS', '601.56', 526601000, 'Mantenimiento y conservación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601570, 'SAT/24-2019', 'GASTOS', '601.57', 526601000, 'Seguros y fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601580, 'SAT/24-2019', 'GASTOS', '601.58', 526601000, 'Otros impuestos y derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601590, 'SAT/24-2019', 'GASTOS', '601.59', 526601000, 'Recargos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601600, 'SAT/24-2019', 'GASTOS', '601.6', 526601000, 'Cuotas y suscripciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601610, 'SAT/24-2019', 'GASTOS', '601.61', 526601000, 'Propaganda y publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601620, 'SAT/24-2019', 'GASTOS', '601.62', 526601000, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601630, 'SAT/24-2019', 'GASTOS', '601.63', 526601000, 'Donativos y ayudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601640, 'SAT/24-2019', 'GASTOS', '601.64', 526601000, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601650, 'SAT/24-2019', 'GASTOS', '601.65', 526601000, 'Regalías sujetas a otros porcentajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601660, 'SAT/24-2019', 'GASTOS', '601.66', 526601000, 'Regalías sujetas al 5%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601670, 'SAT/24-2019', 'GASTOS', '601.67', 526601000, 'Regalías sujetas al 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601680, 'SAT/24-2019', 'GASTOS', '601.68', 526601000, 'Regalías sujetas al 15%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601690, 'SAT/24-2019', 'GASTOS', '601.69', 526601000, 'Regalías sujetas al 25%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601700, 'SAT/24-2019', 'GASTOS', '601.7', 526601000, 'Regalías sujetas al 30%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601710, 'SAT/24-2019', 'GASTOS', '601.71', 526601000, 'Regalías sin retención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601720, 'SAT/24-2019', 'GASTOS', '601.72', 526601000, 'Fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601730, 'SAT/24-2019', 'GASTOS', '601.73', 526601000, 'Gastos de importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601740, 'SAT/24-2019', 'GASTOS', '601.74', 526601000, 'Comisiones sobre ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601750, 'SAT/24-2019', 'GASTOS', '601.75', 526601000, 'Comisiones por tarjetas de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601760, 'SAT/24-2019', 'GASTOS', '601.76', 526601000, 'Patentes y marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601770, 'SAT/24-2019', 'GASTOS', '601.77', 526601000, 'Uniformes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601780, 'SAT/24-2019', 'GASTOS', '601.78', 526601000, 'Prediales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601790, 'SAT/24-2019', 'GASTOS', '601.79', 526601000, 'Gastos generales de urbanización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601800, 'SAT/24-2019', 'GASTOS', '601.8', 526601000, 'Gastos generales de construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601810, 'SAT/24-2019', 'GASTOS', '601.81', 526601000, 'Fletes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601820, 'SAT/24-2019', 'GASTOS', '601.82', 526601000,
        'Recolección de bienes del sector agropecuario y/o ganadero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601830, 'SAT/24-2019', 'GASTOS', '601.83', 526601000,
        'Gastos no deducibles (sin requisitos fiscales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526601840, 'SAT/24-2019', 'GASTOS', '601.84', 526601000, 'Otros gastos generales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602000, 'SAT/24-2019', 'GASTOS', '602', 526600000, 'Gastos de venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602010, 'SAT/24-2019', 'GASTOS', '602.01', 526602000, 'Sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602020, 'SAT/24-2019', 'GASTOS', '602.02', 526602000, 'Compensaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602030, 'SAT/24-2019', 'GASTOS', '602.03', 526602000, 'Tiempos extras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602040, 'SAT/24-2019', 'GASTOS', '602.04', 526602000, 'Premios de asistencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602050, 'SAT/24-2019', 'GASTOS', '602.05', 526602000, 'Premios de puntualidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602060, 'SAT/24-2019', 'GASTOS', '602.06', 526602000, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602070, 'SAT/24-2019', 'GASTOS', '602.07', 526602000, 'Prima vacacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602080, 'SAT/24-2019', 'GASTOS', '602.08', 526602000, 'Prima dominical', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602090, 'SAT/24-2019', 'GASTOS', '602.09', 526602000, 'Días festivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602100, 'SAT/24-2019', 'GASTOS', '602.1', 526602000, 'Gratificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602110, 'SAT/24-2019', 'GASTOS', '602.11', 526602000, 'Primas de antigüedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602120, 'SAT/24-2019', 'GASTOS', '602.12', 526602000, 'Aguinaldo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602130, 'SAT/24-2019', 'GASTOS', '602.13', 526602000, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602140, 'SAT/24-2019', 'GASTOS', '602.14', 526602000, 'Destajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602150, 'SAT/24-2019', 'GASTOS', '602.15', 526602000, 'Despensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602160, 'SAT/24-2019', 'GASTOS', '602.16', 526602000, 'Transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602170, 'SAT/24-2019', 'GASTOS', '602.17', 526602000, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602180, 'SAT/24-2019', 'GASTOS', '602.18', 526602000, 'Ayuda en gastos funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602190, 'SAT/24-2019', 'GASTOS', '602.19', 526602000, 'Fondo de ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602200, 'SAT/24-2019', 'GASTOS', '602.2', 526602000, 'Cuotas sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602210, 'SAT/24-2019', 'GASTOS', '602.21', 526602000, 'PTU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602220, 'SAT/24-2019', 'GASTOS', '602.22', 526602000, 'Estímulo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602230, 'SAT/24-2019', 'GASTOS', '602.23', 526602000, 'Previsión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602240, 'SAT/24-2019', 'GASTOS', '602.24', 526602000, 'Aportaciones para el plan de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602250, 'SAT/24-2019', 'GASTOS', '602.25', 526602000, 'Otras prestaciones al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602260, 'SAT/24-2019', 'GASTOS', '602.26', 526602000, 'Cuotas al IMSS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602270, 'SAT/24-2019', 'GASTOS', '602.27', 526602000, 'Aportaciones al infonavit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602280, 'SAT/24-2019', 'GASTOS', '602.28', 526602000, 'Aportaciones al SAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602290, 'SAT/24-2019', 'GASTOS', '602.29', 526602000, 'Impuesto estatal sobre nóminas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602300, 'SAT/24-2019', 'GASTOS', '602.3', 526602000, 'Otras aportaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602310, 'SAT/24-2019', 'GASTOS', '602.31', 526602000, 'Asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602320, 'SAT/24-2019', 'GASTOS', '602.32', 526602000, 'Servicios administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602330, 'SAT/24-2019', 'GASTOS', '602.33', 526602000,
        'Servicios administrativos partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602340, 'SAT/24-2019', 'GASTOS', '602.34', 526602000,
        'Honorarios a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602350, 'SAT/24-2019', 'GASTOS', '602.35', 526602000,
        'Honorarios a personas físicas residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602360, 'SAT/24-2019', 'GASTOS', '602.36', 526602000,
        'Honorarios a personas físicas residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602370, 'SAT/24-2019', 'GASTOS', '602.37', 526602000,
        'Honorarios a personas físicas residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602380, 'SAT/24-2019', 'GASTOS', '602.38', 526602000,
        'Honorarios a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602390, 'SAT/24-2019', 'GASTOS', '602.39', 526602000,
        'Honorarios a personas morales residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602400, 'SAT/24-2019', 'GASTOS', '602.4', 526602000,
        'Honorarios a personas morales residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602410, 'SAT/24-2019', 'GASTOS', '602.41', 526602000,
        'Honorarios a personas morales residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602420, 'SAT/24-2019', 'GASTOS', '602.42', 526602000, 'Honorarios aduanales personas físicas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602430, 'SAT/24-2019', 'GASTOS', '602.43', 526602000, 'Honorarios aduanales personas morales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602440, 'SAT/24-2019', 'GASTOS', '602.44', 526602000, 'Honorarios al consejo de administración',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602450, 'SAT/24-2019', 'GASTOS', '602.45', 526602000,
        'Arrendamiento a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602460, 'SAT/24-2019', 'GASTOS', '602.46', 526602000,
        'Arrendamiento a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602470, 'SAT/24-2019', 'GASTOS', '602.47', 526602000,
        'Arrendamiento a residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602480, 'SAT/24-2019', 'GASTOS', '602.48', 526602000, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602490, 'SAT/24-2019', 'GASTOS', '602.49', 526602000, 'Viáticos y gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602500, 'SAT/24-2019', 'GASTOS', '602.5', 526602000, 'Teléfono, internet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602510, 'SAT/24-2019', 'GASTOS', '602.51', 526602000, 'Agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602526, 'SAT/24-2019', 'GASTOS', '602.52', 526602000, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602530, 'SAT/24-2019', 'GASTOS', '602.53', 526602000, 'Vigilancia y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602540, 'SAT/24-2019', 'GASTOS', '602.54', 526602000, 'Limpieza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602550, 'SAT/24-2019', 'GASTOS', '602.55', 526602000, 'Papelería y artículos de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602560, 'SAT/24-2019', 'GASTOS', '602.56', 526602000, 'Mantenimiento y conservación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602570, 'SAT/24-2019', 'GASTOS', '602.57', 526602000, 'Seguros y fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602580, 'SAT/24-2019', 'GASTOS', '602.58', 526602000, 'Otros impuestos y derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602590, 'SAT/24-2019', 'GASTOS', '602.59', 526602000, 'Recargos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602600, 'SAT/24-2019', 'GASTOS', '602.6', 526602000, 'Cuotas y suscripciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602610, 'SAT/24-2019', 'GASTOS', '602.61', 526602000, 'Propaganda y publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602620, 'SAT/24-2019', 'GASTOS', '602.62', 526602000, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602630, 'SAT/24-2019', 'GASTOS', '602.63', 526602000, 'Donativos y ayudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602640, 'SAT/24-2019', 'GASTOS', '602.64', 526602000, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602650, 'SAT/24-2019', 'GASTOS', '602.65', 526602000, 'Regalías sujetas a otros porcentajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602660, 'SAT/24-2019', 'GASTOS', '602.66', 526602000, 'Regalías sujetas al 5%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602670, 'SAT/24-2019', 'GASTOS', '602.67', 526602000, 'Regalías sujetas al 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602680, 'SAT/24-2019', 'GASTOS', '602.68', 526602000, 'Regalías sujetas al 15%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602690, 'SAT/24-2019', 'GASTOS', '602.69', 526602000, 'Regalías sujetas al 25%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602700, 'SAT/24-2019', 'GASTOS', '602.7', 526602000, 'Regalías sujetas al 30%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602710, 'SAT/24-2019', 'GASTOS', '602.71', 526602000, 'Regalías sin retención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602720, 'SAT/24-2019', 'GASTOS', '602.72', 526602000, 'Fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602730, 'SAT/24-2019', 'GASTOS', '602.73', 526602000, 'Gastos de importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602740, 'SAT/24-2019', 'GASTOS', '602.74', 526602000, 'Comisiones sobre ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602750, 'SAT/24-2019', 'GASTOS', '602.75', 526602000, 'Comisiones por tarjetas de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602760, 'SAT/24-2019', 'GASTOS', '602.76', 526602000, 'Patentes y marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602770, 'SAT/24-2019', 'GASTOS', '602.77', 526602000, 'Uniformes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602780, 'SAT/24-2019', 'GASTOS', '602.78', 526602000, 'Prediales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602790, 'SAT/24-2019', 'GASTOS', '602.79', 526602000, 'Gastos de venta de urbanización', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602800, 'SAT/24-2019', 'GASTOS', '602.8', 526602000, 'Gastos de venta de construcción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602810, 'SAT/24-2019', 'GASTOS', '602.81', 526602000, 'Fletes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602820, 'SAT/24-2019', 'GASTOS', '602.82', 526602000,
        'Recolección de bienes del sector agropecuario y/o ganadero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602830, 'SAT/24-2019', 'GASTOS', '602.83', 526602000,
        'Gastos no deducibles (sin requisitos fiscales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526602840, 'SAT/24-2019', 'GASTOS', '602.84', 526602000, 'Otros gastos de venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603000, 'SAT/24-2019', 'GASTOS', '603', 526600000, 'Gastos de administración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603010, 'SAT/24-2019', 'GASTOS', '603.01', 526603000, 'Sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603020, 'SAT/24-2019', 'GASTOS', '603.02', 526603000, 'Compensaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603030, 'SAT/24-2019', 'GASTOS', '603.03', 526603000, 'Tiempos extras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603040, 'SAT/24-2019', 'GASTOS', '603.04', 526603000, 'Premios de asistencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603050, 'SAT/24-2019', 'GASTOS', '603.05', 526603000, 'Premios de puntualidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603060, 'SAT/24-2019', 'GASTOS', '603.06', 526603000, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603070, 'SAT/24-2019', 'GASTOS', '603.07', 526603000, 'Prima vacacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603080, 'SAT/24-2019', 'GASTOS', '603.08', 526603000, 'Prima dominical', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603090, 'SAT/24-2019', 'GASTOS', '603.09', 526603000, 'Días festivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603100, 'SAT/24-2019', 'GASTOS', '603.1', 526603000, 'Gratificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603110, 'SAT/24-2019', 'GASTOS', '603.11', 526603000, 'Primas de antigüedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603120, 'SAT/24-2019', 'GASTOS', '603.12', 526603000, 'Aguinaldo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603130, 'SAT/24-2019', 'GASTOS', '603.13', 526603000, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603140, 'SAT/24-2019', 'GASTOS', '603.14', 526603000, 'Destajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603150, 'SAT/24-2019', 'GASTOS', '603.15', 526603000, 'Despensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603160, 'SAT/24-2019', 'GASTOS', '603.16', 526603000, 'Transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603170, 'SAT/24-2019', 'GASTOS', '603.17', 526603000, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603180, 'SAT/24-2019', 'GASTOS', '603.18', 526603000, 'Ayuda en gastos funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603190, 'SAT/24-2019', 'GASTOS', '603.19', 526603000, 'Fondo de ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603200, 'SAT/24-2019', 'GASTOS', '603.2', 526603000, 'Cuotas sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603210, 'SAT/24-2019', 'GASTOS', '603.21', 526603000, 'PTU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603220, 'SAT/24-2019', 'GASTOS', '603.22', 526603000, 'Estímulo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603230, 'SAT/24-2019', 'GASTOS', '603.23', 526603000, 'Previsión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603240, 'SAT/24-2019', 'GASTOS', '603.24', 526603000, 'Aportaciones para el plan de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603250, 'SAT/24-2019', 'GASTOS', '603.25', 526603000, 'Otras prestaciones al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603260, 'SAT/24-2019', 'GASTOS', '603.26', 526603000, 'Cuotas al IMSS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603270, 'SAT/24-2019', 'GASTOS', '603.27', 526603000, 'Aportaciones al infonavit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603280, 'SAT/24-2019', 'GASTOS', '603.28', 526603000, 'Aportaciones al SAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603290, 'SAT/24-2019', 'GASTOS', '603.29', 526603000, 'Impuesto estatal sobre nóminas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603300, 'SAT/24-2019', 'GASTOS', '603.3', 526603000, 'Otras aportaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603310, 'SAT/24-2019', 'GASTOS', '603.31', 526603000, 'Asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603320, 'SAT/24-2019', 'GASTOS', '603.32', 526603000, 'Servicios administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603330, 'SAT/24-2019', 'GASTOS', '603.33', 526603000,
        'Servicios administrativos partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603340, 'SAT/24-2019', 'GASTOS', '603.34', 526603000,
        'Honorarios a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603350, 'SAT/24-2019', 'GASTOS', '603.35', 526603000,
        'Honorarios a personas físicas residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603360, 'SAT/24-2019', 'GASTOS', '603.36', 526603000,
        'Honorarios a personas físicas residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603370, 'SAT/24-2019', 'GASTOS', '603.37', 526603000,
        'Honorarios a personas físicas residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603380, 'SAT/24-2019', 'GASTOS', '603.38', 526603000,
        'Honorarios a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603390, 'SAT/24-2019', 'GASTOS', '603.39', 526603000,
        'Honorarios a personas morales residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603400, 'SAT/24-2019', 'GASTOS', '603.4', 526603000,
        'Honorarios a personas morales residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603410, 'SAT/24-2019', 'GASTOS', '603.41', 526603000,
        'Honorarios a personas morales residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603420, 'SAT/24-2019', 'GASTOS', '603.42', 526603000, 'Honorarios aduanales personas físicas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603430, 'SAT/24-2019', 'GASTOS', '603.43', 526603000, 'Honorarios aduanales personas morales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603440, 'SAT/24-2019', 'GASTOS', '603.44', 526603000, 'Honorarios al consejo de administración',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603450, 'SAT/24-2019', 'GASTOS', '603.45', 526603000,
        'Arrendamiento a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603460, 'SAT/24-2019', 'GASTOS', '603.46', 526603000,
        'Arrendamiento a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603470, 'SAT/24-2019', 'GASTOS', '603.47', 526603000,
        'Arrendamiento a residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603480, 'SAT/24-2019', 'GASTOS', '603.48', 526603000, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603490, 'SAT/24-2019', 'GASTOS', '603.49', 526603000, 'Viáticos y gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603500, 'SAT/24-2019', 'GASTOS', '603.5', 526603000, 'Teléfono, internet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603510, 'SAT/24-2019', 'GASTOS', '603.51', 526603000, 'Agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603526, 'SAT/24-2019', 'GASTOS', '603.52', 526603000, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603530, 'SAT/24-2019', 'GASTOS', '603.53', 526603000, 'Vigilancia y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603540, 'SAT/24-2019', 'GASTOS', '603.54', 526603000, 'Limpieza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603550, 'SAT/24-2019', 'GASTOS', '603.55', 526603000, 'Papelería y artículos de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603560, 'SAT/24-2019', 'GASTOS', '603.56', 526603000, 'Mantenimiento y conservación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603570, 'SAT/24-2019', 'GASTOS', '603.57', 526603000, 'Seguros y fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603580, 'SAT/24-2019', 'GASTOS', '603.58', 526603000, 'Otros impuestos y derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603590, 'SAT/24-2019', 'GASTOS', '603.59', 526603000, 'Recargos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603600, 'SAT/24-2019', 'GASTOS', '603.6', 526603000, 'Cuotas y suscripciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603610, 'SAT/24-2019', 'GASTOS', '603.61', 526603000, 'Propaganda y publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603620, 'SAT/24-2019', 'GASTOS', '603.62', 526603000, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603630, 'SAT/24-2019', 'GASTOS', '603.63', 526603000, 'Donativos y ayudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603640, 'SAT/24-2019', 'GASTOS', '603.64', 526603000, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603650, 'SAT/24-2019', 'GASTOS', '603.65', 526603000, 'Regalías sujetas a otros porcentajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603660, 'SAT/24-2019', 'GASTOS', '603.66', 526603000, 'Regalías sujetas al 5%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603670, 'SAT/24-2019', 'GASTOS', '603.67', 526603000, 'Regalías sujetas al 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603680, 'SAT/24-2019', 'GASTOS', '603.68', 526603000, 'Regalías sujetas al 15%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603690, 'SAT/24-2019', 'GASTOS', '603.69', 526603000, 'Regalías sujetas al 25%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603700, 'SAT/24-2019', 'GASTOS', '603.7', 526603000, 'Regalías sujetas al 30%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603710, 'SAT/24-2019', 'GASTOS', '603.71', 526603000, 'Regalías sin retención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603720, 'SAT/24-2019', 'GASTOS', '603.72', 526603000, 'Fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603730, 'SAT/24-2019', 'GASTOS', '603.73', 526603000, 'Gastos de importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603740, 'SAT/24-2019', 'GASTOS', '603.74', 526603000, 'Patentes y marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603750, 'SAT/24-2019', 'GASTOS', '603.75', 526603000, 'Uniformes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603760, 'SAT/24-2019', 'GASTOS', '603.76', 526603000, 'Prediales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603770, 'SAT/24-2019', 'GASTOS', '603.77', 526603000, 'Gastos de administración de urbanización',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603780, 'SAT/24-2019', 'GASTOS', '603.78', 526603000, 'Gastos de administración de construcción',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603790, 'SAT/24-2019', 'GASTOS', '603.79', 526603000, 'Fletes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603800, 'SAT/24-2019', 'GASTOS', '603.8', 526603000,
        'Recolección de bienes del sector agropecuario y/o ganadero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603810, 'SAT/24-2019', 'GASTOS', '603.81', 526603000,
        'Gastos no deducibles (sin requisitos fiscales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526603820, 'SAT/24-2019', 'GASTOS', '603.82', 526603000, 'Otros gastos de administración', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604000, 'SAT/24-2019', 'GASTOS', '604', 526600000, 'Gastos de fabricación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604010, 'SAT/24-2019', 'GASTOS', '604.01', 526604000, 'Sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604020, 'SAT/24-2019', 'GASTOS', '604.02', 526604000, 'Compensaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604030, 'SAT/24-2019', 'GASTOS', '604.03', 526604000, 'Tiempos extras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604040, 'SAT/24-2019', 'GASTOS', '604.04', 526604000, 'Premios de asistencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604050, 'SAT/24-2019', 'GASTOS', '604.05', 526604000, 'Premios de puntualidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604060, 'SAT/24-2019', 'GASTOS', '604.06', 526604000, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604070, 'SAT/24-2019', 'GASTOS', '604.07', 526604000, 'Prima vacacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604080, 'SAT/24-2019', 'GASTOS', '604.08', 526604000, 'Prima dominical', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604090, 'SAT/24-2019', 'GASTOS', '604.09', 526604000, 'Días festivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604100, 'SAT/24-2019', 'GASTOS', '604.1', 526604000, 'Gratificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604110, 'SAT/24-2019', 'GASTOS', '604.11', 526604000, 'Primas de antigüedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604120, 'SAT/24-2019', 'GASTOS', '604.12', 526604000, 'Aguinaldo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604130, 'SAT/24-2019', 'GASTOS', '604.13', 526604000, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604140, 'SAT/24-2019', 'GASTOS', '604.14', 526604000, 'Destajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604150, 'SAT/24-2019', 'GASTOS', '604.15', 526604000, 'Despensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604160, 'SAT/24-2019', 'GASTOS', '604.16', 526604000, 'Transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604170, 'SAT/24-2019', 'GASTOS', '604.17', 526604000, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604180, 'SAT/24-2019', 'GASTOS', '604.18', 526604000, 'Ayuda en gastos funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604190, 'SAT/24-2019', 'GASTOS', '604.19', 526604000, 'Fondo de ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604200, 'SAT/24-2019', 'GASTOS', '604.2', 526604000, 'Cuotas sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604210, 'SAT/24-2019', 'GASTOS', '604.21', 526604000, 'PTU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604220, 'SAT/24-2019', 'GASTOS', '604.22', 526604000, 'Estímulo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604230, 'SAT/24-2019', 'GASTOS', '604.23', 526604000, 'Previsión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604240, 'SAT/24-2019', 'GASTOS', '604.24', 526604000, 'Aportaciones para el plan de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604250, 'SAT/24-2019', 'GASTOS', '604.25', 526604000, 'Otras prestaciones al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604260, 'SAT/24-2019', 'GASTOS', '604.26', 526604000, 'Cuotas al IMSS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604270, 'SAT/24-2019', 'GASTOS', '604.27', 526604000, 'Aportaciones al infonavit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604280, 'SAT/24-2019', 'GASTOS', '604.28', 526604000, 'Aportaciones al SAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604290, 'SAT/24-2019', 'GASTOS', '604.29', 526604000, 'Impuesto estatal sobre nóminas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604300, 'SAT/24-2019', 'GASTOS', '604.3', 526604000, 'Otras aportaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604310, 'SAT/24-2019', 'GASTOS', '604.31', 526604000, 'Asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604320, 'SAT/24-2019', 'GASTOS', '604.32', 526604000, 'Servicios administrativos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604330, 'SAT/24-2019', 'GASTOS', '604.33', 526604000,
        'Servicios administrativos partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604340, 'SAT/24-2019', 'GASTOS', '604.34', 526604000,
        'Honorarios a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604350, 'SAT/24-2019', 'GASTOS', '604.35', 526604000,
        'Honorarios a personas físicas residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604360, 'SAT/24-2019', 'GASTOS', '604.36', 526604000,
        'Honorarios a personas físicas residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604370, 'SAT/24-2019', 'GASTOS', '604.37', 526604000,
        'Honorarios a personas físicas residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604380, 'SAT/24-2019', 'GASTOS', '604.38', 526604000,
        'Honorarios a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604390, 'SAT/24-2019', 'GASTOS', '604.39', 526604000,
        'Honorarios a personas morales residentes nacionales partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604400, 'SAT/24-2019', 'GASTOS', '604.4', 526604000,
        'Honorarios a personas morales residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604410, 'SAT/24-2019', 'GASTOS', '604.41', 526604000,
        'Honorarios a personas morales residentes del extranjero partes relacionadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604420, 'SAT/24-2019', 'GASTOS', '604.42', 526604000, 'Honorarios aduanales personas físicas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604430, 'SAT/24-2019', 'GASTOS', '604.43', 526604000, 'Honorarios aduanales personas morales',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604440, 'SAT/24-2019', 'GASTOS', '604.44', 526604000, 'Honorarios al consejo de administración',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604450, 'SAT/24-2019', 'GASTOS', '604.45', 526604000,
        'Arrendamiento a personas físicas residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604460, 'SAT/24-2019', 'GASTOS', '604.46', 526604000,
        'Arrendamiento a personas morales residentes nacionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604470, 'SAT/24-2019', 'GASTOS', '604.47', 526604000,
        'Arrendamiento a residentes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604480, 'SAT/24-2019', 'GASTOS', '604.48', 526604000, 'Combustibles y lubricantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604490, 'SAT/24-2019', 'GASTOS', '604.49', 526604000, 'Viáticos y gastos de viaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604500, 'SAT/24-2019', 'GASTOS', '604.5', 526604000, 'Teléfono, internet', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604510, 'SAT/24-2019', 'GASTOS', '604.51', 526604000, 'Agua', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604526, 'SAT/24-2019', 'GASTOS', '604.52', 526604000, 'Energía eléctrica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604530, 'SAT/24-2019', 'GASTOS', '604.53', 526604000, 'Vigilancia y seguridad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604540, 'SAT/24-2019', 'GASTOS', '604.54', 526604000, 'Limpieza', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604550, 'SAT/24-2019', 'GASTOS', '604.55', 526604000, 'Papelería y artículos de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604560, 'SAT/24-2019', 'GASTOS', '604.56', 526604000, 'Mantenimiento y conservación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604570, 'SAT/24-2019', 'GASTOS', '604.57', 526604000, 'Seguros y fianzas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604580, 'SAT/24-2019', 'GASTOS', '604.58', 526604000, 'Otros impuestos y derechos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604590, 'SAT/24-2019', 'GASTOS', '604.59', 526604000, 'Recargos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604600, 'SAT/24-2019', 'GASTOS', '604.6', 526604000, 'Cuotas y suscripciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604610, 'SAT/24-2019', 'GASTOS', '604.61', 526604000, 'Propaganda y publicidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604620, 'SAT/24-2019', 'GASTOS', '604.62', 526604000, 'Capacitación al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604630, 'SAT/24-2019', 'GASTOS', '604.63', 526604000, 'Donativos y ayudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604640, 'SAT/24-2019', 'GASTOS', '604.64', 526604000, 'Asistencia técnica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604650, 'SAT/24-2019', 'GASTOS', '604.65', 526604000, 'Regalías sujetas a otros porcentajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604660, 'SAT/24-2019', 'GASTOS', '604.66', 526604000, 'Regalías sujetas al 5%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604670, 'SAT/24-2019', 'GASTOS', '604.67', 526604000, 'Regalías sujetas al 10%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604680, 'SAT/24-2019', 'GASTOS', '604.68', 526604000, 'Regalías sujetas al 15%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604690, 'SAT/24-2019', 'GASTOS', '604.69', 526604000, 'Regalías sujetas al 25%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604700, 'SAT/24-2019', 'GASTOS', '604.7', 526604000, 'Regalías sujetas al 30%', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604710, 'SAT/24-2019', 'GASTOS', '604.71', 526604000, 'Regalías sin retención', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604720, 'SAT/24-2019', 'GASTOS', '604.72', 526604000, 'Fletes y acarreos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604730, 'SAT/24-2019', 'GASTOS', '604.73', 526604000, 'Gastos de importación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604740, 'SAT/24-2019', 'GASTOS', '604.74', 526604000, 'Patentes y marcas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604750, 'SAT/24-2019', 'GASTOS', '604.75', 526604000, 'Uniformes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604760, 'SAT/24-2019', 'GASTOS', '604.76', 526604000, 'Prediales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604770, 'SAT/24-2019', 'GASTOS', '604.77', 526604000, 'Gastos de fabricación de urbanización',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604780, 'SAT/24-2019', 'GASTOS', '604.78', 526604000, 'Gastos de fabricación de construcción',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604790, 'SAT/24-2019', 'GASTOS', '604.79', 526604000, 'Fletes del extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604800, 'SAT/24-2019', 'GASTOS', '604.8', 526604000,
        'Recolección de bienes del sector agropecuario y/o ganadero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604810, 'SAT/24-2019', 'GASTOS', '604.81', 526604000,
        'Gastos no deducibles (sin requisitos fiscales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526604820, 'SAT/24-2019', 'GASTOS', '604.82', 526604000, 'Otros gastos de fabricación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605000, 'SAT/24-2019', 'GASTOS', '605', 526600000, 'Mano de obra directa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605010, 'SAT/24-2019', 'GASTOS', '605.01', 526605000, 'Mano de obra', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605020, 'SAT/24-2019', 'GASTOS', '605.02', 526605000, 'Sueldos y Salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605030, 'SAT/24-2019', 'GASTOS', '605.03', 526605000, 'Compensaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605040, 'SAT/24-2019', 'GASTOS', '605.04', 526605000, 'Tiempos extras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605050, 'SAT/24-2019', 'GASTOS', '605.05', 526605000, 'Premios de asistencia', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605060, 'SAT/24-2019', 'GASTOS', '605.06', 526605000, 'Premios de puntualidad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605070, 'SAT/24-2019', 'GASTOS', '605.07', 526605000, 'Vacaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605080, 'SAT/24-2019', 'GASTOS', '605.08', 526605000, 'Prima vacacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605090, 'SAT/24-2019', 'GASTOS', '605.09', 526605000, 'Prima dominical', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605100, 'SAT/24-2019', 'GASTOS', '605.1', 526605000, 'Días festivos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605110, 'SAT/24-2019', 'GASTOS', '605.11', 526605000, 'Gratificaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605120, 'SAT/24-2019', 'GASTOS', '605.12', 526605000, 'Primas de antigüedad', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605130, 'SAT/24-2019', 'GASTOS', '605.13', 526605000, 'Aguinaldo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605140, 'SAT/24-2019', 'GASTOS', '605.14', 526605000, 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605150, 'SAT/24-2019', 'GASTOS', '605.15', 526605000, 'Destajo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605160, 'SAT/24-2019', 'GASTOS', '605.16', 526605000, 'Despensa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605170, 'SAT/24-2019', 'GASTOS', '605.17', 526605000, 'Transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605180, 'SAT/24-2019', 'GASTOS', '605.18', 526605000, 'Servicio médico', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605190, 'SAT/24-2019', 'GASTOS', '605.19', 526605000, 'Ayuda en gastos funerarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605260, 'SAT/24-2019', 'GASTOS', '605.2', 526605000, 'Fondo de ahorro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605210, 'SAT/24-2019', 'GASTOS', '605.21', 526605000, 'Cuotas sindicales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605220, 'SAT/24-2019', 'GASTOS', '605.22', 526605000, 'PTU', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605230, 'SAT/24-2019', 'GASTOS', '605.23', 526605000, 'Estímulo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605240, 'SAT/24-2019', 'GASTOS', '605.24', 526605000, 'Previsión social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605250, 'SAT/24-2019', 'GASTOS', '605.25', 526605000, 'Aportaciones para el plan de jubilación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605265, 'SAT/24-2019', 'GASTOS', '605.26', 526605000, 'Otras prestaciones al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605270, 'SAT/24-2019', 'GASTOS', '605.27', 526605000, 'Asimilados a salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605280, 'SAT/24-2019', 'GASTOS', '605.28', 526605000, 'Cuotas al IMSS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605290, 'SAT/24-2019', 'GASTOS', '605.29', 526605000, 'Aportaciones al infonavit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605300, 'SAT/24-2019', 'GASTOS', '605.3', 526605000, 'Aportaciones al SAR', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526605310, 'SAT/24-2019', 'GASTOS', '605.31', 526605000, 'Otros costos de mano de obra directa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526606000, 'SAT/24-2019', 'GASTOS', '606', 526600000, 'Facilidades administrativas fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526606010, 'SAT/24-2019', 'GASTOS', '606.01', 526606000, 'Facilidades administrativas fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526607000, 'SAT/24-2019', 'GASTOS', '607', 526600000,
        'Participación de los trabajadores en las utilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526607010, 'SAT/24-2019', 'GASTOS', '607.01', 526607000,
        'Participación de los trabajadores en las utilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526608000, 'SAT/24-2019', 'GASTOS', '608', 526600000, 'Participación en resultados de subsidiarias',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526608010, 'SAT/24-2019', 'GASTOS', '608.01', 526608000,
        'Participación en resultados de subsidiarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526609000, 'SAT/24-2019', 'GASTOS', '609', 526600000, 'Participación en resultados de asociadas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526609010, 'SAT/24-2019', 'GASTOS', '609.01', 526609000, 'Participación en resultados de asociadas',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526610000, 'SAT/24-2019', 'GASTOS', '610', 526600000,
        'Participación de los trabajadores en las utilidades diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526610010, 'SAT/24-2019', 'GASTOS', '610.01', 526610000,
        'Participación de los trabajadores en las utilidades diferida', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526611000, 'SAT/24-2019', 'GASTOS', '611', 526600000, 'Impuesto Sobre la renta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526611010, 'SAT/24-2019', 'GASTOS', '611.01', 526611000, 'Impuesto Sobre la renta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526611020, 'SAT/24-2019', 'GASTOS', '611.02', 526611000,
        'Impuesto Sobre la renta por remanente distribuible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526612000, 'SAT/24-2019', 'GASTOS', '612', 526600000, 'Gastos no deducibles para CUFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526612010, 'SAT/24-2019', 'GASTOS', '612.01', 526612000, 'Gastos no deducibles para CUFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613000, 'SAT/24-2019', 'GASTOS', '613', 526600000, 'Depreciación contable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613010, 'SAT/24-2019', 'GASTOS', '613.01', 526613000, 'Depreciación de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613020, 'SAT/24-2019', 'GASTOS', '613.02', 526613000, 'Depreciación de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613030, 'SAT/24-2019', 'GASTOS', '613.03', 526613000,
        'Depreciación de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613040, 'SAT/24-2019', 'GASTOS', '613.04', 526613000,
        'Depreciación de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613050, 'SAT/24-2019', 'GASTOS', '613.05', 526613000, 'Depreciación de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613060, 'SAT/24-2019', 'GASTOS', '613.06', 526613000, 'Depreciación de equipo de comunicación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613070, 'SAT/24-2019', 'GASTOS', '613.07', 526613000,
        'Depreciación de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613080, 'SAT/24-2019', 'GASTOS', '613.08', 526613000, 'Depreciación de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613090, 'SAT/24-2019', 'GASTOS', '613.09', 526613000, 'Depreciación de ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613100, 'SAT/24-2019', 'GASTOS', '613.1', 526613000, 'Depreciación de embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613110, 'SAT/24-2019', 'GASTOS', '613.11', 526613000, 'Depreciación de aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613120, 'SAT/24-2019', 'GASTOS', '613.12', 526613000,
        'Depreciación de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613130, 'SAT/24-2019', 'GASTOS', '613.13', 526613000,
        'Depreciación de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613140, 'SAT/24-2019', 'GASTOS', '613.14', 526613000,
        'Depreciación de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613150, 'SAT/24-2019', 'GASTOS', '613.15', 526613000,
        'Depreciación de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613160, 'SAT/24-2019', 'GASTOS', '613.16', 526613000,
        'Depreciación de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613170, 'SAT/24-2019', 'GASTOS', '613.17', 526613000, 'Depreciación de adaptaciones y mejoras',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526613180, 'SAT/24-2019', 'GASTOS', '613.18', 526613000, 'Depreciación de otra maquinaria y equipo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614000, 'SAT/24-2019', 'GASTOS', '614', 526600000, 'Amortización contable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614010, 'SAT/24-2019', 'GASTOS', '614.01', 526614000, 'Amortización de gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614020, 'SAT/24-2019', 'GASTOS', '614.02', 526614000, 'Amortización de gastos pre operativos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614030, 'SAT/24-2019', 'GASTOS', '614.03', 526614000,
        'Amortización de regalías, asistencia técnica y otros gastos diferidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614040, 'SAT/24-2019', 'GASTOS', '614.04', 526614000, 'Amortización de activos intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614050, 'SAT/24-2019', 'GASTOS', '614.05', 526614000, 'Amortización de gastos de organización',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614060, 'SAT/24-2019', 'GASTOS', '614.06', 526614000,
        'Amortización de investigación y desarrollo de mercado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614070, 'SAT/24-2019', 'GASTOS', '614.07', 526614000, 'Amortización de marcas y patentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614080, 'SAT/24-2019', 'GASTOS', '614.08', 526614000, 'Amortización de crédito mercantil', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614090, 'SAT/24-2019', 'GASTOS', '614.09', 526614000, 'Amortización de gastos de instalación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526614100, 'SAT/24-2019', 'GASTOS', '614.1', 526614000, 'Amortización de otros activos diferidos',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526700000, 'SAT/24-2019', 'RESULTADOS', '700', 0, 'Resultado integral de financiamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701000, 'SAT/24-2019', 'RESULTADOS', '701', 526700000, 'Gastos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701010, 'SAT/24-2019', 'RESULTADOS', '701.01', 526701000, 'Pérdida cambiaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701020, 'SAT/24-2019', 'RESULTADOS', '701.02', 526701000,
        'Pérdida cambiaria nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701030, 'SAT/24-2019', 'RESULTADOS', '701.03', 526701000,
        'Pérdida cambiaria extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701040, 'SAT/24-2019', 'RESULTADOS', '701.04', 526701000, 'Intereses a cargo bancario nacional',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701050, 'SAT/24-2019', 'RESULTADOS', '701.05', 526701000,
        'Intereses a cargo bancario extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701060, 'SAT/24-2019', 'RESULTADOS', '701.06', 526701000,
        'Intereses a cargo de personas físicas nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701070, 'SAT/24-2019', 'RESULTADOS', '701.07', 526701000,
        'Intereses a cargo de personas físicas extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701080, 'SAT/24-2019', 'RESULTADOS', '701.08', 526701000,
        'Intereses a cargo de personas morales nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701090, 'SAT/24-2019', 'RESULTADOS', '701.09', 526701000,
        'Intereses a cargo de personas morales extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701100, 'SAT/24-2019', 'RESULTADOS', '701.1', 526701000, 'Comisiones bancarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526701110, 'SAT/24-2019', 'RESULTADOS', '701.11', 526701000, 'Otros gastos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702000, 'SAT/24-2019', 'RESULTADOS', '702', 526700000, 'Productos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702010, 'SAT/24-2019', 'RESULTADOS', '702.01', 526702000, 'Utilidad cambiaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702020, 'SAT/24-2019', 'RESULTADOS', '702.02', 526702000,
        'Utilidad cambiaria nacional parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702030, 'SAT/24-2019', 'RESULTADOS', '702.03', 526702000,
        'Utilidad cambiaria extranjero parte relacionada', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702040, 'SAT/24-2019', 'RESULTADOS', '702.04', 526702000, 'Intereses a favor bancarios nacional',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702050, 'SAT/24-2019', 'RESULTADOS', '702.05', 526702000,
        'Intereses a favor bancarios extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702060, 'SAT/24-2019', 'RESULTADOS', '702.06', 526702000,
        'Intereses a favor de personas físicas nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702070, 'SAT/24-2019', 'RESULTADOS', '702.07', 526702000,
        'Intereses a favor de personas físicas extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702080, 'SAT/24-2019', 'RESULTADOS', '702.08', 526702000,
        'Intereses a favor de personas morales nacional', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702090, 'SAT/24-2019', 'RESULTADOS', '702.09', 526702000,
        'Intereses a favor de personas morales extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526702100, 'SAT/24-2019', 'RESULTADOS', '702.1', 526702000, 'Otros productos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703000, 'SAT/24-2019', 'RESULTADOS', '703', 526700000, 'Otros gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703010, 'SAT/24-2019', 'RESULTADOS', '703.01', 526703000,
        'Pérdida en venta y/o baja de terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703020, 'SAT/24-2019', 'RESULTADOS', '703.02', 526703000,
        'Pérdida en venta y/o baja de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703030, 'SAT/24-2019', 'RESULTADOS', '703.03', 526703000,
        'Pérdida en venta y/o baja de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703040, 'SAT/24-2019', 'RESULTADOS', '703.04', 526703000,
        'Pérdida en venta y/o baja de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703050, 'SAT/24-2019', 'RESULTADOS', '703.05', 526703000,
        'Pérdida en venta y/o baja de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703060, 'SAT/24-2019', 'RESULTADOS', '703.06', 526703000,
        'Pérdida en venta y/o baja de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703070, 'SAT/24-2019', 'RESULTADOS', '703.07', 526703000,
        'Pérdida en venta y/o baja de equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703080, 'SAT/24-2019', 'RESULTADOS', '703.08', 526703000,
        'Pérdida en venta y/o baja de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703090, 'SAT/24-2019', 'RESULTADOS', '703.09', 526703000,
        'Pérdida en venta y/o baja de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703100, 'SAT/24-2019', 'RESULTADOS', '703.1', 526703000,
        'Pérdida en venta y/o baja de ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703110, 'SAT/24-2019', 'RESULTADOS', '703.11', 526703000,
        'Pérdida en venta y/o baja de embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703120, 'SAT/24-2019', 'RESULTADOS', '703.12', 526703000, 'Pérdida en venta y/o baja de aviones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703130, 'SAT/24-2019', 'RESULTADOS', '703.13', 526703000,
        'Pérdida en venta y/o baja de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703140, 'SAT/24-2019', 'RESULTADOS', '703.14', 526703000,
        'Pérdida en venta y/o baja de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703150, 'SAT/24-2019', 'RESULTADOS', '703.15', 526703000,
        'Pérdida en venta y/o baja de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703160, 'SAT/24-2019', 'RESULTADOS', '703.16', 526703000,
        'Pérdida en venta y/o baja de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703170, 'SAT/24-2019', 'RESULTADOS', '703.17', 526703000,
        'Pérdida en venta y/o baja de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703180, 'SAT/24-2019', 'RESULTADOS', '703.18', 526703000,
        'Pérdida en venta y/o baja de otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703190, 'SAT/24-2019', 'RESULTADOS', '703.19', 526703000, 'Pérdida por enajenación de acciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703200, 'SAT/24-2019', 'RESULTADOS', '703.2', 526703000,
        'Pérdida por enajenación de partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526703210, 'SAT/24-2019', 'RESULTADOS', '703.21', 526703000, 'Otros gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704000, 'SAT/24-2019', 'RESULTADOS', '704', 526700000, 'Otros productos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704010, 'SAT/24-2019', 'RESULTADOS', '704.01', 526704000,
        'Ganancia en venta y/o baja de terrenos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704020, 'SAT/24-2019', 'RESULTADOS', '704.02', 526704000,
        'Ganancia en venta y/o baja de edificios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704030, 'SAT/24-2019', 'RESULTADOS', '704.03', 526704000,
        'Ganancia en venta y/o baja de maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704040, 'SAT/24-2019', 'RESULTADOS', '704.04', 526704000,
        'Ganancia en venta y/o baja de automóviles, autobuses, camiones de carga, tractocamiones, montacargas y remolques',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704050, 'SAT/24-2019', 'RESULTADOS', '704.05', 526704000,
        'Ganancia en venta y/o baja de mobiliario y equipo de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704060, 'SAT/24-2019', 'RESULTADOS', '704.06', 526704000,
        'Ganancia en venta y/o baja de equipo de cómputo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704070, 'SAT/24-2019', 'RESULTADOS', '704.07', 526704000,
        'Ganancia en venta y/o baja de equipo de comunicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704080, 'SAT/24-2019', 'RESULTADOS', '704.08', 526704000,
        'Ganancia en venta y/o baja de activos biológicos, vegetales y semovientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704090, 'SAT/24-2019', 'RESULTADOS', '704.09', 526704000,
        'Ganancia en venta y/o baja de otros activos fijos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704100, 'SAT/24-2019', 'RESULTADOS', '704.1', 526704000,
        'Ganancia en venta y/o baja de ferrocarriles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704110, 'SAT/24-2019', 'RESULTADOS', '704.11', 526704000,
        'Ganancia en venta y/o baja de embarcaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704120, 'SAT/24-2019', 'RESULTADOS', '704.12', 526704000,
        'Ganancia en venta y/o baja de aviones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704130, 'SAT/24-2019', 'RESULTADOS', '704.13', 526704000,
        'Ganancia en venta y/o baja de troqueles, moldes, matrices y herramental', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704140, 'SAT/24-2019', 'RESULTADOS', '704.14', 526704000,
        'Ganancia en venta y/o baja de equipo de comunicaciones telefónicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704150, 'SAT/24-2019', 'RESULTADOS', '704.15', 526704000,
        'Ganancia en venta y/o baja de equipo de comunicación satelital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704160, 'SAT/24-2019', 'RESULTADOS', '704.16', 526704000,
        'Ganancia en venta y/o baja de equipo de adaptaciones para personas con capacidades diferentes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704170, 'SAT/24-2019', 'RESULTADOS', '704.17', 526704000,
        'Ganancia en venta de maquinaria y equipo de generación de energía de fuentes renovables o de sistemas de cogeneración de electricidad eficiente',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704180, 'SAT/24-2019', 'RESULTADOS', '704.18', 526704000,
        'Ganancia en venta y/o baja de otra maquinaria y equipo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704190, 'SAT/24-2019', 'RESULTADOS', '704.19', 526704000, 'Ganancia por enajenación de acciones',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704200, 'SAT/24-2019', 'RESULTADOS', '704.2', 526704000,
        'Ganancia por enajenación de partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704210, 'SAT/24-2019', 'RESULTADOS', '704.21', 526704000, 'Ingresos por estímulos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704220, 'SAT/24-2019', 'RESULTADOS', '704.22', 526704000, 'Ingresos por condonación de adeudo',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526704230, 'SAT/24-2019', 'RESULTADOS', '704.23', 526704000, 'Otros productos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526800000, 'SAT/24-2019', 'CTAS DE ORDEN', '800', 0, 'Cuentas de orden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526801000, 'SAT/24-2019', 'CTAS DE ORDEN', '801', 526800000, 'UFIN del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526801010, 'SAT/24-2019', 'CTAS DE ORDEN', '801.01', 526801000, 'UFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526801020, 'SAT/24-2019', 'CTAS DE ORDEN', '801.02', 526801000, 'Contra cuenta UFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526802000, 'SAT/24-2019', 'CTAS DE ORDEN', '802', 526800000, 'CUFIN del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526802010, 'SAT/24-2019', 'CTAS DE ORDEN', '802.01', 526802000, 'CUFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526802020, 'SAT/24-2019', 'CTAS DE ORDEN', '802.02', 526802000, 'Contra cuenta CUFIN', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526803000, 'SAT/24-2019', 'CTAS DE ORDEN', '803', 526800000, 'CUFIN de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526803010, 'SAT/24-2019', 'CTAS DE ORDEN', '803.01', 526803000, 'CUFIN de ejercicios anteriores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526803020, 'SAT/24-2019', 'CTAS DE ORDEN', '803.02', 526803000,
        'Contra cuenta CUFIN de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526804000, 'SAT/24-2019', 'CTAS DE ORDEN', '804', 526800000, 'CUFINRE del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526804010, 'SAT/24-2019', 'CTAS DE ORDEN', '804.01', 526804000, 'CUFINRE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526804020, 'SAT/24-2019', 'CTAS DE ORDEN', '804.02', 526804000, 'Contra cuenta CUFINRE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526805000, 'SAT/24-2019', 'CTAS DE ORDEN', '805', 526800000, 'CUFINRE de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526805010, 'SAT/24-2019', 'CTAS DE ORDEN', '805.01', 526805000, 'CUFINRE de ejercicios anteriores',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526805020, 'SAT/24-2019', 'CTAS DE ORDEN', '805.02', 526805000,
        'Contra cuenta CUFINRE de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526806000, 'SAT/24-2019', 'CTAS DE ORDEN', '806', 526800000, 'CUCA del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526806010, 'SAT/24-2019', 'CTAS DE ORDEN', '806.01', 526806000, 'CUCA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526806020, 'SAT/24-2019', 'CTAS DE ORDEN', '806.02', 526806000, 'Contra cuenta CUCA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526807000, 'SAT/24-2019', 'CTAS DE ORDEN', '807', 526800000, 'CUCA de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526807010, 'SAT/24-2019', 'CTAS DE ORDEN', '807.01', 526807000, 'CUCA de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526807020, 'SAT/24-2019', 'CTAS DE ORDEN', '807.02', 526807000,
        'Contra cuenta CUCA de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526808000, 'SAT/24-2019', 'CTAS DE ORDEN', '808', 526800000,
        'Ajuste anual por inflación acumulable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526808010, 'SAT/24-2019', 'CTAS DE ORDEN', '808.01', 526808000,
        'Ajuste anual por inflación acumulable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526808020, 'SAT/24-2019', 'CTAS DE ORDEN', '808.02', 526808000,
        'Acumulación del ajuste anual inflacionario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526809000, 'SAT/24-2019', 'CTAS DE ORDEN', '809', 526800000, 'Ajuste anual por inflación deducible',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526809010, 'SAT/24-2019', 'CTAS DE ORDEN', '809.01', 526809000,
        'Ajuste anual por inflación deducible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526809020, 'SAT/24-2019', 'CTAS DE ORDEN', '809.02', 526809000,
        'Deducción del ajuste anual inflacionario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526810000, 'SAT/24-2019', 'CTAS DE ORDEN', '810', 526800000, 'Deducción de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526810010, 'SAT/24-2019', 'CTAS DE ORDEN', '810.01', 526810000, 'Deducción de inversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526810020, 'SAT/24-2019', 'CTAS DE ORDEN', '810.02', 526810000,
        'Contra cuenta deducción de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526811000, 'SAT/24-2019', 'CTAS DE ORDEN', '811', 526800000,
        'Utilidad o pérdida fiscal en venta y/o baja de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526811010, 'SAT/24-2019', 'CTAS DE ORDEN', '811.01', 526811000,
        'Utilidad o pérdida fiscal en venta y/o baja de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526811020, 'SAT/24-2019', 'CTAS DE ORDEN', '811.02', 526811000,
        'Contra cuenta utilidad o pérdida fiscal en venta y/o baja de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526812000, 'SAT/24-2019', 'CTAS DE ORDEN', '812', 526800000,
        'Utilidad o pérdida fiscal en venta acciones o partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526812010, 'SAT/24-2019', 'CTAS DE ORDEN', '812.01', 526812000,
        'Utilidad o pérdida fiscal en venta acciones o partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526812020, 'SAT/24-2019', 'CTAS DE ORDEN', '812.02', 526812000,
        'Contra cuenta utilidad o pérdida fiscal en venta acciones o partes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526813000, 'SAT/24-2019', 'CTAS DE ORDEN', '813', 526800000,
        'Pérdidas fiscales pendientes de amortizar actualizadas de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526813010, 'SAT/24-2019', 'CTAS DE ORDEN', '813.01', 526813000,
        'Pérdidas fiscales pendientes de amortizar actualizadas de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526813020, 'SAT/24-2019', 'CTAS DE ORDEN', '813.02', 526813000,
        'Actualización de pérdidas fiscales pendientes de amortizar de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526814000, 'SAT/24-2019', 'CTAS DE ORDEN', '814', 526800000, 'Mercancías recibidas en consignación',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526814010, 'SAT/24-2019', 'CTAS DE ORDEN', '814.01', 526814000,
        'Mercancías recibidas en consignación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526814020, 'SAT/24-2019', 'CTAS DE ORDEN', '814.02', 526814000,
        'Consignación de mercancías recibidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526815000, 'SAT/24-2019', 'CTAS DE ORDEN', '815', 526800000,
        'Crédito fiscal de IVA e IEPS por la importación de mercancías para empresas certificadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526815010, 'SAT/24-2019', 'CTAS DE ORDEN', '815.01', 526815000,
        'Crédito fiscal de IVA e IEPS por la importación de mercancías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526815020, 'SAT/24-2019', 'CTAS DE ORDEN', '815.02', 526815000,
        'Importación de mercancías con aplicación de crédito fiscal de IVA e IEPS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526816000, 'SAT/24-2019', 'CTAS DE ORDEN', '816', 526800000,
        'Crédito fiscal de IVA e IEPS por la importación de activos fijos para empresas certificadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526816010, 'SAT/24-2019', 'CTAS DE ORDEN', '816.01', 526816000,
        'Crédito fiscal de IVA e IEPS por la importación de activo fijo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526816020, 'SAT/24-2019', 'CTAS DE ORDEN', '816.02', 526816000,
        'Importación de activo fijo con aplicación de crédito fiscal de IVA e IEPS', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526899000, 'SAT/24-2019', 'CTAS DE ORDEN', '899', 526800000, 'Otras cuentas de orden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526899010, 'SAT/24-2019', 'CTAS DE ORDEN', '899.01', 526899000, 'Otras cuentas de orden', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 526899020, 'SAT/24-2019', 'CTAS DE ORDEN', '899.02', 526899000,
        'Contra cuenta otras cuentas de orden', 1);
