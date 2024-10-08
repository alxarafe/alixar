-- Copyright (C) 2018 
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
-- de l''install et tous les sigles '--' sont supprimés.
--                                                         

-- ADD 18800000 before rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1, 'RO-BASE', 'CAPIT', '1', '0',
        'Conturi de capitaluri, provizioane, împrumuturi şi datorii asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10, 'RO-BASE', 'CAPIT', '10', '1', 'Capital şi rezerve', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1010, 'RO-BASE', 'CAPIT', '101', '10', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1011, 'RO-BASE', 'CAPIT', '1011', '1010', 'Capital subscris nevărsat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1012, 'RO-BASE', 'CAPIT', '1012', '1010', 'Capital subscris vărsat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1015, 'RO-BASE', 'CAPIT', '1015', '1010', 'Patrimoniul regiei (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1016, 'RO-BASE', 'CAPIT', '1016', '1010', 'Patrimoniul public (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1017, 'RO-BASE', 'CAPIT', '1017', '1010', 'Patrimoniul privat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1018, 'RO-BASE', 'CAPIT', '1018', '1010',
        'Patrimoniul institutelor naţionale de cercetare-dezvoltare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1030, 'RO-BASE', 'CAPIT', '103', '10', 'Alte elemente de capitaluri proprii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1031, 'RO-BASE', 'CAPIT', '1031', '1030',
        'Beneficii acordate angajaţilor sub forma instrumentelor de capitaluri proprii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1033, 'RO-BASE', 'CAPIT', '1033', '1030',
        'Diferenţe de curs valutar în relaţie cu investiţia netă într-o entitate străină (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1038, 'RO-BASE', 'CAPIT', '1038', '1030',
        'Diferenţe din modificarea valorii juste a activelor financiare disponibile în vederea vânzării şi alte elemente de capitaluri proprii (A/P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1040, 'RO-BASE', 'CAPIT', '104', '10', 'Prime de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1041, 'RO-BASE', 'CAPIT', '1041', '1040', 'Prime de emisiune (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1042, 'RO-BASE', 'CAPIT', '1042', '1040', 'Prime de fuziune/divizare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1043, 'RO-BASE', 'CAPIT', '1043', '1040', 'Prime de aport (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1044, 'RO-BASE', 'CAPIT', '1044', '1040', 'Prime de conversie a obligaţiunilor în acţiuni (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1050, 'RO-BASE', 'CAPIT', '105', '10', 'Rezerve din reevaluare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1060, 'RO-BASE', 'CAPIT', '106', '10', 'Rezerve', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1061, 'RO-BASE', 'CAPIT', '1061', '1060', 'Rezerve legale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1063, 'RO-BASE', 'CAPIT', '1063', '1060', 'Rezerve statutare sau contractuale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1068, 'RO-BASE', 'CAPIT', '1068', '1060', 'Alte rezerve (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1070, 'RO-BASE', 'CAPIT', '107', '10', 'Diferenţe de curs valutar din conversie (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1080, 'RO-BASE', 'CAPIT', '108', '10', 'Interese care nu controlează', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1081, 'RO-BASE', 'CAPIT', '1081', '1080',
        'Interese care nu controlează - rezultatul exerciţiului financiar (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1082, 'RO-BASE', 'CAPIT', '1082', '1080',
        'Interese care nu controlează - alte capitaluri proprii (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1090, 'RO-BASE', 'CAPIT', '109', '10', 'Acţiuni proprii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1091, 'RO-BASE', 'CAPIT', '1091', '1090', 'Acţiuni proprii deţinute pe termen scurt (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1092, 'RO-BASE', 'CAPIT', '1092', '1090', 'Acţiuni proprii deţinute pe termen lung (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1095, 'RO-BASE', 'CAPIT', '1095', '1090',
        'Acţiuni proprii reprezentând titluri deţinute de societatea absorbită la societatea absorbantă (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11, 'RO-BASE', 'CAPIT', '11', '1', 'Rezultatul reportat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1170, 'RO-BASE', 'CAPIT', '117', '11', 'Rezultatul reportat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1171, 'RO-BASE', 'CAPIT', '1171', '1170',
        'Rezultatul reportat reprezentând profitul nerepartizat sau pierderea neacoperită (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1172, 'RO-BASE', 'CAPIT', '1172', '1170',
        'Rezultatul reportat provenit din adoptarea pentru prima dată a IAS, mai puţin IAS 29(A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1173, 'RO-BASE', 'CAPIT', '1173', '1170',
        'Rezultatul reportat provenit din modificările politicilor contabile (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1174, 'RO-BASE', 'CAPIT', '1174', '1170',
        'Rezultatul reportat provenit din corectarea erorilor contabile (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1175, 'RO-BASE', 'CAPIT', '1175', '1170',
        'Rezultatul reportat reprezentând surplusul realizat din rezerve din reevaluare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1176, 'RO-BASE', 'CAPIT', '1176', '1170',
        'Rezultatul reportat provenit din trecerea la aplicarea reglementărilor contabile conforme cu directivele europene (A/P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12, 'RO-BASE', 'CAPIT', '12', '1', 'Rezultatul exerciţiului financiar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1210, 'RO-BASE', 'CAPIT', '121', '12', 'Profit sau pierdere (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1290, 'RO-BASE', 'CAPIT', '129', '12', 'Repartizarea profitului (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 14, 'RO-BASE', 'CAPIT', '14', '1',
        'Câştiguri sau pierderi legate de emiterea, răscumpărarea, vânzarea, cedarea cu titlu gratuit sau anularea instrumentelor de capitaluri proprii',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1410, 'RO-BASE', 'CAPIT', '141', '14',
        'Câştiguri legate de vânzarea sau anularea instrumentelor de capitaluri proprii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1411, 'RO-BASE', 'CAPIT', '1411', '1410',
        'Câştiguri legate de vânzarea instrumentelor de capitaluri proprii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1412, 'RO-BASE', 'CAPIT', '1412', '1410',
        'Câştiguri legate de anularea instrumentelor de capitaluri proprii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1490, 'RO-BASE', 'CAPIT', '149', '14',
        'Pierderi legate de emiterea, răscumpărarea, vânzarea, cedarea cu titlu gratuit sau anularea instrumentelor de capitaluri proprii',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1491, 'RO-BASE', 'CAPIT', '1491', '1490',
        'Pierderi rezultate din vânzarea instrumentelor de capitaluri proprii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1495, 'RO-BASE', 'CAPIT', '1495', '1490',
        'Pierderi rezultate din reorganizări, care sunt determinate de anularea titlurilor deţinute (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1498, 'RO-BASE', 'CAPIT', '1498', '1490',
        'Alte pierderi legate de instrumentele de capitaluri proprii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15, 'RO-BASE', 'CAPIT', '15', '1', 'Provizioane', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1510, 'RO-BASE', 'CAPIT', '151', '15', 'Provizioane', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1511, 'RO-BASE', 'CAPIT', '1511', '1510', 'Provizioane pentru litigii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1512, 'RO-BASE', 'CAPIT', '1512', '1510', 'Provizioane pentru garanţii acordate clienţilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1513, 'RO-BASE', 'CAPIT', '1513', '1510',
        'Provizioane pentru dezafectare imobilizări corporale şi alte acţiuni similare legate de acestea (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1514, 'RO-BASE', 'CAPIT', '1514', '1510', 'Provizioane pentru restructurare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1515, 'RO-BASE', 'CAPIT', '1515', '1510', 'Provizioane pentru pensii şi obligaţii similare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1516, 'RO-BASE', 'CAPIT', '1516', '1510', 'Provizioane pentru impozite (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1517, 'RO-BASE', 'CAPIT', '1517', '1510', 'Provizioane pentru terminarea contractului de muncă (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1518, 'RO-BASE', 'CAPIT', '1518', '1510', 'Alte provizioane (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16, 'RO-BASE', 'CAPIT', '16', '1', 'Împrumuturi şi datorii asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1610, 'RO-BASE', 'CAPIT', '161', '16', 'Împrumuturi din emisiuni de obligaţiuni', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1614, 'RO-BASE', 'CAPIT', '1614', '1610',
        'Împrumuturi externe din emisiuni de obligaţiuni garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1615, 'RO-BASE', 'CAPIT', '1615', '1610',
        'Împrumuturi externe din emisiuni de obligaţiuni garantate de bănci (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1617, 'RO-BASE', 'CAPIT', '1617', '1610',
        'Împrumuturi interne din emisiuni de obligaţiuni garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1618, 'RO-BASE', 'CAPIT', '1618', '1610', 'Alte împrumuturi din emisiuni de obligaţiuni (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1620, 'RO-BASE', 'CAPIT', '162', '16', 'Credite bancare pe termen lung', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1621, 'RO-BASE', 'CAPIT', '1621', '1620', 'Credite bancare pe termen lung (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1622, 'RO-BASE', 'CAPIT', '1622', '1620',
        'Credite bancare pe termen lung nerambursate la scadenţă (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1623, 'RO-BASE', 'CAPIT', '1623', '1620', 'Credite externe guvernamentale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1624, 'RO-BASE', 'CAPIT', '1624', '1620', 'Credite bancare externe garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1625, 'RO-BASE', 'CAPIT', '1625', '1620', 'Credite bancare externe garantate de bănci (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1626, 'RO-BASE', 'CAPIT', '1626', '1620', 'Credite de la trezoreria statului (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1627, 'RO-BASE', 'CAPIT', '1627', '1620', 'Credite bancare interne garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1660, 'RO-BASE', 'CAPIT', '166', '16', 'Datorii care privesc imobilizările financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1661, 'RO-BASE', 'CAPIT', '1661', '1660', 'Datorii faţă de entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1663, 'RO-BASE', 'CAPIT', '1663', '1660',
        'Datorii faţă de entităţile asociate şi entităţile controlate în comun (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1670, 'RO-BASE', 'CAPIT', '167', '16', 'Alte împrumuturi şi datorii asimilate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1680, 'RO-BASE', 'CAPIT', '168', '16', 'Dobânzi aferente împrumuturilor şi datoriilor asimilate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1681, 'RO-BASE', 'CAPIT', '1681', '1680',
        'Dobânzi aferente împrumuturilor din emisiuni de obligaţiuni (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1682, 'RO-BASE', 'CAPIT', '1682', '1680', 'Dobânzi aferente creditelor bancare pe termen lung (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1685, 'RO-BASE', 'CAPIT', '1685', '1680',
        'Dobânzi aferente datoriilor faţă de entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1686, 'RO-BASE', 'CAPIT', '1686', '1680',
        'Dobânzi aferente datoriilor faţă de entităţile asociate şi entităţile controlate în comun (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1687, 'RO-BASE', 'CAPIT', '1687', '1680',
        'Dobânzi aferente altor împrumuturi şi datorii asimilate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1690, 'RO-BASE', 'CAPIT', '169', '16',
        'Prime privind rambursarea obligaţiunilor şi a altor datorii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1691, 'RO-BASE', 'CAPIT', '1691', '1690', 'Prime privind rambursarea obligaţiunilor (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1692, 'RO-BASE', 'CAPIT', '1692', '1690', 'Prime privind rambursarea altor datorii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2, 'RO-BASE', 'IMMO', '2', '0', 'Conturi de imobilizări', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 20, 'RO-BASE', 'IMMO', '20', '2', 'IMOBILIZĂRI NECORPORALE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2010, 'RO-BASE', 'IMMO', '201', '20', 'Cheltuieli de constituire (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2030, 'RO-BASE', 'IMMO', '203', '20', 'Cheltuieli de dezvoltare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2050, 'RO-BASE', 'IMMO', '205', '20',
        'Concesiuni, brevete, licenţe, mărci comerciale, drepturi şi active similare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2060, 'RO-BASE', 'IMMO', '206', '20',
        'Active necorporale de explorare şi evaluare a resurselor minerale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2070, 'RO-BASE', 'IMMO', '207', '20', 'Fond comercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2071, 'RO-BASE', 'IMMO', '2071', '2070', 'Fond comercial pozitiv (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2075, 'RO-BASE', 'IMMO', '2075', '2070', 'Fond comercial negativ (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2080, 'RO-BASE', 'IMMO', '208', '20', 'Alte imobilizări necorporale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21, 'RO-BASE', 'IMMO', '21', '2', 'Imobilizări corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2110, 'RO-BASE', 'IMMO', '211', '21', 'Terenuri şi amenajări de terenuri (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2111, 'RO-BASE', 'IMMO', '2111', '2110', 'Terenuri', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2112, 'RO-BASE', 'IMMO', '2112', '2110', 'Amenajări de terenuri', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2120, 'RO-BASE', 'IMMO', '212', '21', 'Construcţii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2130, 'RO-BASE', 'IMMO', '213', '21', 'Instalaţii tehnice şi mijloace de transport', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2131, 'RO-BASE', 'IMMO', '2131', '2130',
        'Echipamente tehnologice (maşini, utilaje şi instalaţii de lucru) (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2132, 'RO-BASE', 'IMMO', '2132', '2130',
        'Aparate şi instalaţii de măsurare, control şi reglare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2133, 'RO-BASE', 'IMMO', '2133', '2130', 'Mijloace de transport (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2140, 'RO-BASE', 'IMMO', '214', '21',
        'Mobilier, aparatură birotică, echipamente de protecţie a valorilor umane şi materiale şi alte active corporale (A)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2150, 'RO-BASE', 'IMMO', '215', '21', 'Investiţii imobiliare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2160, 'RO-BASE', 'IMMO', '216', '21',
        'Active corporale de explorare şi evaluare a resurselor minerale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2170, 'RO-BASE', 'IMMO', '217', '21', 'Active biologice productive (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22, 'RO-BASE', 'IMMO', '22', '2', 'Imobilizări corporale în curs de aprovizionare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2230, 'RO-BASE', 'IMMO', '223', '22',
        'Instalaţii tehnice şi mijloace de transport în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2240, 'RO-BASE', 'IMMO', '224', '22',
        'Mobilier, aparatură birotică, echipamente de protecţie a valorilor umane şi materiale şi alte active corporale în curs de aprovizionare (A)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2270, 'RO-BASE', 'IMMO', '227', '22', 'Active biologice productive în curs de aprovizionare (A)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 23, 'RO-BASE', 'IMMO', '23', '2', 'Imobilizări în curs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2310, 'RO-BASE', 'IMMO', '231', '23', 'Imobilizări corporale în curs de execuţie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2350, 'RO-BASE', 'IMMO', '235', '23', 'Investiţii imobiliare în curs de execuţie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 26, 'RO-BASE', 'IMMO', '26', '2', 'Imobilizări financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2610, 'RO-BASE', 'IMMO', '261', '26', 'Acţiuni deţinute la entităţile afiliate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2620, 'RO-BASE', 'IMMO', '262', '26', 'Acţiuni deţinute la entităţi asociate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2630, 'RO-BASE', 'IMMO', '263', '26', 'Acţiuni deţinute la entităţi controlate în comun (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2640, 'RO-BASE', 'IMMO', '264', '26', 'Titluri puse în echivalenţă (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2650, 'RO-BASE', 'IMMO', '265', '26', 'Alte titluri imobilizate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2660, 'RO-BASE', 'IMMO', '266', '26', 'Certificate verzi amânate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2670, 'RO-BASE', 'IMMO', '267', '26', 'Creanţe imobilizate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2671, 'RO-BASE', 'IMMO', '2671', '2670', 'Sume de încasat de la entităţile afiliate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2672, 'RO-BASE', 'IMMO', '2672', '2670',
        'Dobânda aferentă sumelor de încasat de la entităţile afiliate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2673, 'RO-BASE', 'IMMO', '2673', '2670',
        'Creanţe faţă de entităţile asociate şi entităţile controlate în comun (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2674, 'RO-BASE', 'IMMO', '2674', '2670',
        'Dobânda aferentă creanţelor faţă de entităţile asociate şi entităţile controlate în comun (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2675, 'RO-BASE', 'IMMO', '2675', '2670', 'Împrumuturi acordate pe termen lung (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2676, 'RO-BASE', 'IMMO', '2676', '2670',
        'Dobânda aferentă împrumuturilor acordate pe termen lung (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2677, 'RO-BASE', 'IMMO', '2677', '2670',
        'Obligaţiuni achiziţionate cu ocazia emisiunilor efectuate de terţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2678, 'RO-BASE', 'IMMO', '2678', '2670', 'Alte creanţe imobilizate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2679, 'RO-BASE', 'IMMO', '2679', '2670', 'Dobânzi aferente altor creanţe imobilizate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2690, 'RO-BASE', 'IMMO', '269', '26', 'Vărsăminte de efectuat pentru imobilizări financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2691, 'RO-BASE', 'IMMO', '2691', '2690',
        'Vărsăminte de efectuat privind acţiunile deţinute la entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2692, 'RO-BASE', 'IMMO', '2692', '2690',
        'Vărsăminte de efectuat privind acţiunile deţinute la entităţi asociate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2693, 'RO-BASE', 'IMMO', '2693', '2690',
        'Vărsăminte de efectuat privind acţiunile deţinute la entităţi controlate în comun (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2695, 'RO-BASE', 'IMMO', '2695', '2690',
        'Vărsăminte de efectuat pentru alte imobilizări financiare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 28, 'RO-BASE', 'IMMO', '28', '2', 'Amortizări privind imobilizările', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2800, 'RO-BASE', 'IMMO', '280', '28', 'Amortizări privind imobilizările necorporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2801, 'RO-BASE', 'IMMO', '2801', '2800', 'Amortizarea cheltuielilor de constituire (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2803, 'RO-BASE', 'IMMO', '2803', '2800', 'Amortizarea cheltuielilor de dezvoltare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2805, 'RO-BASE', 'IMMO', '2805', '2800',
        'Amortizarea concesiunilor, brevetelor, licenţelor, mărcilor comerciale, drepturilor şi activelor similare (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2806, 'RO-BASE', 'IMMO', '2806', '2800',
        'Amortizarea activelor necorporale de explorare şi evaluare a resurselor minerale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2807, 'RO-BASE', 'IMMO', '2807', '2800', 'Amortizarea fondului comercial (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2808, 'RO-BASE', 'IMMO', '2808', '2800', 'Amortizarea altor imobilizări necorporale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2810, 'RO-BASE', 'IMMO', '281', '28', 'Amortizări privind imobilizările corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2811, 'RO-BASE', 'IMMO', '2811', '2810', 'Amortizarea amenajărilor de terenuri (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2812, 'RO-BASE', 'IMMO', '2812', '2810', 'Amortizarea construcţiilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2813, 'RO-BASE', 'IMMO', '2813', '2810',
        'Amortizarea instalaţiilor şi mijloacelor de transport (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2814, 'RO-BASE', 'IMMO', '2814', '2810', 'Amortizarea altor imobilizări corporale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2815, 'RO-BASE', 'IMMO', '2815', '2810', 'Amortizarea investiţiilor imobiliare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2816, 'RO-BASE', 'IMMO', '2816', '2810',
        'Amortizarea activelor corporale de explorare şi evaluare a resurselor minerale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2817, 'RO-BASE', 'IMMO', '2817', '2810', 'Amortizarea activelor biologice productive (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 29, 'RO-BASE', 'IMMO', '29', '2',
        'Ajustări pentru deprecierea sau pierderea de valoare a imobilizărilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2900, 'RO-BASE', 'IMMO', '290', '29', 'Ajustări pentru deprecierea imobilizărilor necorporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2903, 'RO-BASE', 'IMMO', '2903', '2900',
        'Ajustări pentru deprecierea cheltuielilor de dezvoltare (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2905, 'RO-BASE', 'IMMO', '2905', '2900',
        'Ajustări pentru deprecierea concesiunilor, brevetelor, licenţelor, mărcilor comerciale, drepturilor şi activelor similare (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2906, 'RO-BASE', 'IMMO', '2906', '2900',
        'Ajustări pentru deprecierea activelor necorporale de explorare şi evaluare a resurselor minerale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2908, 'RO-BASE', 'IMMO', '2908', '2900',
        'Ajustări pentru deprecierea altor imobilizări necorporale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2910, 'RO-BASE', 'IMMO', '291', '29', 'Ajustări pentru deprecierea imobilizărilor corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2911, 'RO-BASE', 'IMMO', '2911', '2910',
        'Ajustări pentru deprecierea terenurilor şi amenajărilor de terenuri (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2912, 'RO-BASE', 'IMMO', '2912', '2910', 'Ajustări pentru deprecierea construcţiilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2913, 'RO-BASE', 'IMMO', '2913', '2910',
        'Ajustări pentru deprecierea instalaţiilor şi mijloacelor de transport (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2914, 'RO-BASE', 'IMMO', '2914', '2910',
        'Ajustări pentru deprecierea altor imobilizări corporale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2915, 'RO-BASE', 'IMMO', '2915', '2910', 'Ajustări pentru deprecierea investiţiilor imobiliare (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2916, 'RO-BASE', 'IMMO', '2916', '2910',
        'Ajustări pentru deprecierea activelor corporale de explorare şi evaluare a resurselor minerale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2917, 'RO-BASE', 'IMMO', '2917', '2910',
        'Ajustări pentru deprecierea activelor biologice productive (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2930, 'RO-BASE', 'IMMO', '293', '29',
        'Ajustări pentru deprecierea imobilizărilor în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2931, 'RO-BASE', 'IMMO', '2931', '2930',
        'Ajustări pentru deprecierea imobilizărilor corporale în curs de execuţie (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2935, 'RO-BASE', 'IMMO', '2935', '2930',
        'Ajustări pentru deprecierea investiţiilor imobiliare în curs de execuţie (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2960, 'RO-BASE', 'IMMO', '296', '29',
        'Ajustări pentru pierderea de valoare a imobilizărilor financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2961, 'RO-BASE', 'IMMO', '2961', '2960',
        'Ajustări pentru pierderea de valoare a acţiunilor deţinute la entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2962, 'RO-BASE', 'IMMO', '2962', '2960',
        'Ajustări pentru pierderea de valoare a acţiunilor deţinute la entităţi asociate şi entităţi controlate în comun (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2963, 'RO-BASE', 'IMMO', '2963', '2960',
        'Ajustări pentru pierderea de valoare a altor titluri imobilizate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2964, 'RO-BASE', 'IMMO', '2964', '2960',
        'Ajustări pentru pierderea de valoare a sumelor de încasat de la entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2965, 'RO-BASE', 'IMMO', '2965', '2960',
        'Ajustări pentru pierderea de valoare a creanţelor faţă de entităţile asociate şi entităţile controlate în comun (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2966, 'RO-BASE', 'IMMO', '2966', '2960',
        'Ajustări pentru pierderea de valoare a împrumuturilor acordate pe termen lung (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2968, 'RO-BASE', 'IMMO', '2968', '2960',
        'Ajustări pentru pierderea de valoare a altor creanţe imobilizate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3, 'RO-BASE', 'STOCK', '3', '0', 'Conturi de stocuri şi producţie în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30, 'RO-BASE', 'STOCK', '30', '3', 'Stocuri de materii prime şi materiale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3010, 'RO-BASE', 'STOCK', '301', '30', 'Materii prime (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3020, 'RO-BASE', 'STOCK', '302', '30', 'Materiale consumabile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3021, 'RO-BASE', 'STOCK', '3021', '3020', 'Materiale auxiliare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3022, 'RO-BASE', 'STOCK', '3022', '3020', 'Combustibili (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3023, 'RO-BASE', 'STOCK', '3023', '3020', 'Materiale pentru ambalat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3024, 'RO-BASE', 'STOCK', '3024', '3020', 'Piese de schimb (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3025, 'RO-BASE', 'STOCK', '3025', '3020', 'Seminţe şi materiale de plantat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3026, 'RO-BASE', 'STOCK', '3026', '3020', 'Furaje (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3028, 'RO-BASE', 'STOCK', '3028', '3020', 'Alte materiale consumabile (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3030, 'RO-BASE', 'STOCK', '303', '30', 'Materiale de natura obiectelor de inventar (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3080, 'RO-BASE', 'STOCK', '308', '30', 'Diferenţe de preţ la materii prime şi materiale (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 32, 'RO-BASE', 'STOCK', '32', '3', 'Stocuri în curs de aprovizionare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3210, 'RO-BASE', 'STOCK', '321', '32', 'Materii prime în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3220, 'RO-BASE', 'STOCK', '322', '32', 'Materiale consumabile în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3230, 'RO-BASE', 'STOCK', '323', '32',
        'Materiale de natura obiectelor de inventar în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3260, 'RO-BASE', 'STOCK', '326', '32',
        'Active biologice de natura stocurilor în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3270, 'RO-BASE', 'STOCK', '327', '32', 'Mărfuri în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3280, 'RO-BASE', 'STOCK', '328', '32', 'Ambalaje în curs de aprovizionare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 33, 'RO-BASE', 'STOCK', '33', '3', 'Producţie în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3310, 'RO-BASE', 'STOCK', '331', '33', 'Produse în curs de execuţie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3320, 'RO-BASE', 'STOCK', '332', '33', 'Servicii în curs de execuţie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 34, 'RO-BASE', 'STOCK', '34', '3', 'PRODUSE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3410, 'RO-BASE', 'STOCK', '341', '34', 'Semifabricate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3450, 'RO-BASE', 'STOCK', '345', '34', 'Produse finite (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3460, 'RO-BASE', 'STOCK', '346', '34', 'Produse reziduale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3470, 'RO-BASE', 'STOCK', '347', '34', 'Produse agricole (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3480, 'RO-BASE', 'STOCK', '348', '34', 'Diferenţe de preţ la produse (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 35, 'RO-BASE', 'STOCK', '35', '3', 'STOCURI AFLATE LA TERŢI', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3510, 'RO-BASE', 'STOCK', '351', '35', 'Materii şi materiale aflate la terţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3540, 'RO-BASE', 'STOCK', '354', '35', 'Produse aflate la terţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3560, 'RO-BASE', 'STOCK', '356', '35', 'Active biologice de natura stocurilor aflate la terţi (A)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3570, 'RO-BASE', 'STOCK', '357', '35', 'Mărfuri aflate la terţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3580, 'RO-BASE', 'STOCK', '358', '35', 'Ambalaje aflate la terţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 36, 'RO-BASE', 'STOCK', '36', '3', 'Active biologice de natura stocurilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3610, 'RO-BASE', 'STOCK', '361', '36', 'Active biologice de natura stocurilor (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3680, 'RO-BASE', 'STOCK', '368', '36',
        'Diferenţe de preţ la active biologice de natura stocurilor (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 37, 'RO-BASE', 'STOCK', '37', '3', 'MĂRFURI', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3710, 'RO-BASE', 'STOCK', '371', '37', 'Mărfuri (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3780, 'RO-BASE', 'STOCK', '378', '37', 'Diferenţe de preţ la mărfuri (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 38, 'RO-BASE', 'STOCK', '38', '3', 'Ambalaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3810, 'RO-BASE', 'STOCK', '381', '38', 'Ambalaje (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3880, 'RO-BASE', 'STOCK', '388', '38', 'Diferenţe de preţ la ambalaje (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 39, 'RO-BASE', 'STOCK', '39', '3',
        'Ajustări pentru deprecierea stocurilor şi producţiei în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3910, 'RO-BASE', 'STOCK', '391', '39', 'Ajustări pentru deprecierea materiilor prime (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3920, 'RO-BASE', 'STOCK', '392', '39', 'Ajustări pentru deprecierea materialelor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3921, 'RO-BASE', 'STOCK', '3921', '3920',
        'Ajustări pentru deprecierea materialelor consumabile (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3922, 'RO-BASE', 'STOCK', '3922', '3920',
        'Ajustări pentru deprecierea materialelor de natura obiectelor de inventar (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3930, 'RO-BASE', 'STOCK', '393', '39',
        'Ajustări pentru deprecierea producţiei în curs de execuţie (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3940, 'RO-BASE', 'STOCK', '394', '39', 'Ajustări pentru deprecierea produselor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3941, 'RO-BASE', 'STOCK', '3941', '3940', 'Ajustări pentru deprecierea semifabricatelor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3945, 'RO-BASE', 'STOCK', '3945', '3940', 'Ajustări pentru deprecierea produselor finite (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3946, 'RO-BASE', 'STOCK', '3946', '3940', 'Ajustări pentru deprecierea produselor reziduale (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3947, 'RO-BASE', 'STOCK', '3947', '3940', 'Ajustări pentru deprecierea produselor agricole (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3950, 'RO-BASE', 'STOCK', '395', '39', 'Ajustări pentru deprecierea stocurilor aflate la terţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3951, 'RO-BASE', 'STOCK', '3951', '3950',
        'Ajustări pentru deprecierea materiilor şi materialelor aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3952, 'RO-BASE', 'STOCK', '3952', '3950',
        'Ajustări pentru deprecierea semifabricatelor aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3953, 'RO-BASE', 'STOCK', '3953', '3950',
        'Ajustări pentru deprecierea produselor finite aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3954, 'RO-BASE', 'STOCK', '3954', '3950',
        'Ajustări pentru deprecierea produselor reziduale aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3955, 'RO-BASE', 'STOCK', '3955', '3950',
        'Ajustări pentru deprecierea produselor agricole aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3956, 'RO-BASE', 'STOCK', '3956', '3950',
        'Ajustări pentru deprecierea activelor biologice de natura stocurilor aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3957, 'RO-BASE', 'STOCK', '3957', '3950',
        'Ajustări pentru deprecierea mărfurilor aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3958, 'RO-BASE', 'STOCK', '3958', '3950',
        'Ajustări pentru deprecierea ambalajelor aflate la terţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3960, 'RO-BASE', 'STOCK', '396', '39',
        'Ajustări pentru deprecierea activelor biologice de natura stocurilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3970, 'RO-BASE', 'STOCK', '397', '39', 'Ajustări pentru deprecierea mărfurilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3980, 'RO-BASE', 'STOCK', '398', '39', 'Ajustări pentru deprecierea ambalajelor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4, 'RO-BASE', 'THIRDPARTY', '4', '0', 'Conturi de terţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 40, 'RO-BASE', 'THIRDPARTY', '40', '4', 'Furnizori şi conturi asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4010, 'RO-BASE', 'THIRDPARTY', '401', '40', 'Furnizori (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4030, 'RO-BASE', 'THIRDPARTY', '403', '40', 'Efecte de plătit (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4040, 'RO-BASE', 'THIRDPARTY', '404', '40', 'Furnizori de imobilizări (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4050, 'RO-BASE', 'THIRDPARTY', '405', '40', 'Efecte de plătit pentru imobilizări (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4080, 'RO-BASE', 'THIRDPARTY', '408', '40', 'Furnizori - facturi nesosite (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4090, 'RO-BASE', 'THIRDPARTY', '409', '40', 'Furnizori - debitori', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4091, 'RO-BASE', 'THIRDPARTY', '4091', '4090',
        'Furnizori - debitori pentru cumpărări de bunuri de natura stocurilor (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4092, 'RO-BASE', 'THIRDPARTY', '4092', '4090',
        'Furnizori - debitori pentru prestări de servicii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4093, 'RO-BASE', 'THIRDPARTY', '4093', '4090', 'Avansuri acordate pentru imobilizări corporale (A)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4094, 'RO-BASE', 'THIRDPARTY', '4094', '4090',
        'Avansuri acordate pentru imobilizări necorporale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41, 'RO-BASE', 'THIRDPARTY', '41', '4', 'Clienţi şi conturi asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4110, 'RO-BASE', 'THIRDPARTY', '411', '41', 'Clienţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4111, 'RO-BASE', 'THIRDPARTY', '4111', '4110', 'Clienţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4118, 'RO-BASE', 'THIRDPARTY', '4118', '4110', 'Clienţi incerţi sau în litigiu (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4130, 'RO-BASE', 'THIRDPARTY', '413', '41', 'Efecte de primit de la clienţi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4180, 'RO-BASE', 'THIRDPARTY', '418', '41', 'Clienţi - facturi de întocmit (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4190, 'RO-BASE', 'THIRDPARTY', '419', '41', 'Clienţi - creditori (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 42, 'RO-BASE', 'THIRDPARTY', '42', '4', 'Personal şi conturi asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4210, 'RO-BASE', 'THIRDPARTY', '421', '42', 'Personal - salarii datorate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4230, 'RO-BASE', 'THIRDPARTY', '423', '42', 'Personal - ajutoare materiale datorate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4240, 'RO-BASE', 'THIRDPARTY', '424', '42',
        'Prime reprezentând participarea personalului la profit*16) (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4250, 'RO-BASE', 'THIRDPARTY', '425', '42', 'Avansuri acordate personalului (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4260, 'RO-BASE', 'THIRDPARTY', '426', '42', 'Drepturi de personal neridicate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4270, 'RO-BASE', 'THIRDPARTY', '427', '42', 'Reţineri din salarii datorate terţilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4280, 'RO-BASE', 'THIRDPARTY', '428', '42', 'Alte datorii şi creanţe în legătură cu personalul', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4281, 'RO-BASE', 'THIRDPARTY', '4281', '4280', 'Alte datorii în legătură cu personalul (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4282, 'RO-BASE', 'THIRDPARTY', '4282', '4280', 'Alte creanţe în legătură cu personalul (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 43, 'RO-BASE', 'THIRDPARTY', '43', '4', 'Asigurări sociale, protecţia socială şi conturi asimilate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4310, 'RO-BASE', 'THIRDPARTY', '431', '43', 'Asigurări sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4311, 'RO-BASE', 'THIRDPARTY', '4311', '4310', 'Contribuţia unităţii la asigurările sociale (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4312, 'RO-BASE', 'THIRDPARTY', '4312', '4310',
        'Contribuţia personalului la asigurările sociale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4313, 'RO-BASE', 'THIRDPARTY', '4313', '4310',
        'Contribuţia angajatorului pentru asigurările sociale de sănătate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4314, 'RO-BASE', 'THIRDPARTY', '4314', '4310',
        'Contribuţia angajaţilor pentru asigurările sociale de sănătate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4315, 'RO-BASE', 'THIRDPARTY', '4315', '4310', 'Contribuţia de asigurări sociale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4316, 'RO-BASE', 'THIRDPARTY', '4316', '4310', 'Contribuţia de asigurări sociale de sănătate (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4318, 'RO-BASE', 'THIRDPARTY', '4318', '4310',
        'Alte contribuţii pentru asigurările sociale de sănătate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4360, 'RO-BASE', 'THIRDPARTY', '436', '43', 'Contribuția asiguratorie pentru muncă        ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4370, 'RO-BASE', 'THIRDPARTY', '437', '43', 'Ajutor de şomaj', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4371, 'RO-BASE', 'THIRDPARTY', '4371', '4370', 'Contribuţia unităţii la fondul de şomaj (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4372, 'RO-BASE', 'THIRDPARTY', '4372', '4370', 'Contribuţia personalului la fondul de şomaj (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4380, 'RO-BASE', 'THIRDPARTY', '438', '43', 'Alte datorii şi creanţe sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4381, 'RO-BASE', 'THIRDPARTY', '4381', '4380', 'Alte datorii sociale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4382, 'RO-BASE', 'THIRDPARTY', '4382', '4380', 'Alte creanţe sociale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 44, 'RO-BASE', 'THIRDPARTY', '44', '4', 'Bugetul statului, fonduri speciale şi conturi asimilate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4410, 'RO-BASE', 'THIRDPARTY', '441', '44', 'Impozitul pe profit/venit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4411, 'RO-BASE', 'THIRDPARTY', '4411', '4410', 'Impozitul pe profit (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4418, 'RO-BASE', 'THIRDPARTY', '4418', '4410', 'Impozitul pe venit*17) (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4420, 'RO-BASE', 'THIRDPARTY', '442', '44', 'Taxa pe valoarea adăugată', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4423, 'RO-BASE', 'THIRDPARTY', '4423', '4420', 'TVA de plată (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4424, 'RO-BASE', 'THIRDPARTY', '4424', '4420', 'TVA de recuperat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4426, 'RO-BASE', 'THIRDPARTY', '4426', '4420', 'TVA deductibilă (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4427, 'RO-BASE', 'THIRDPARTY', '4427', '4420', 'TVA colectată (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4428, 'RO-BASE', 'THIRDPARTY', '4428', '4420', 'TVA neexigibilă (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4440, 'RO-BASE', 'THIRDPARTY', '444', '44', 'Impozitul pe venituri de natura salariilor (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4450, 'RO-BASE', 'THIRDPARTY', '445', '44', 'Subvenţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4451, 'RO-BASE', 'THIRDPARTY', '4451', '4450', 'Subvenţii guvernamentale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4452, 'RO-BASE', 'THIRDPARTY', '4452', '4450',
        'Împrumuturi nerambursabile cu caracter de subvenţii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4458, 'RO-BASE', 'THIRDPARTY', '4458', '4450', 'Alte sume primite cu caracter de subvenţii (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4460, 'RO-BASE', 'THIRDPARTY', '446', '44', 'Alte impozite, taxe şi vărsăminte asimilate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4470, 'RO-BASE', 'THIRDPARTY', '447', '44', 'Fonduri speciale - taxe şi vărsăminte asimilate (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4480, 'RO-BASE', 'THIRDPARTY', '448', '44', 'Alte datorii şi creanţe cu bugetul statului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4481, 'RO-BASE', 'THIRDPARTY', '4481', '4480', 'Alte datorii faţă de bugetul statului (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4482, 'RO-BASE', 'THIRDPARTY', '4482', '4480', 'Alte creanţe privind bugetul statului (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 45, 'RO-BASE', 'THIRDPARTY', '45', '4', 'Grup şi acţionari/asociaţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4510, 'RO-BASE', 'THIRDPARTY', '451', '45', 'Decontări între entităţile afiliate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4511, 'RO-BASE', 'THIRDPARTY', '4511', '4510', 'Decontări între entităţile afiliate (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4518, 'RO-BASE', 'THIRDPARTY', '4518', '4510',
        'Dobânzi aferente decontărilor între entităţile afiliate (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4530, 'RO-BASE', 'THIRDPARTY', '453', '45',
        'Decontări cu entităţile asociate şi entităţile controlate în comun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4531, 'RO-BASE', 'THIRDPARTY', '4531', '4530',
        'Decontări cu entităţile asociate şi entităţile controlate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4538, 'RO-BASE', 'THIRDPARTY', '4538', '4530',
        'Dobânzi aferente decontărilor cu entităţile asociate şi entităţile controlate în comun (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4550, 'RO-BASE', 'THIRDPARTY', '455', '45', 'Sume datorate acţionarilor/asociaţilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4551, 'RO-BASE', 'THIRDPARTY', '4551', '4550', 'Acţionari/Asociaţi - conturi curente (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4558, 'RO-BASE', 'THIRDPARTY', '4558', '4550',
        'Acţionari/Asociaţi - dobânzi la conturi curente (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4560, 'RO-BASE', 'THIRDPARTY', '456', '45',
        'Decontări cu acţionarii/asociaţii privind capitalul (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4570, 'RO-BASE', 'THIRDPARTY', '457', '45', 'Dividende de plată (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4580, 'RO-BASE', 'THIRDPARTY', '458', '45', 'Decontări din operaţiuni în participaţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4581, 'RO-BASE', 'THIRDPARTY', '4581', '4580',
        'Decontări din operaţiuni în participaţie - pasiv (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4582, 'RO-BASE', 'THIRDPARTY', '4582', '4580',
        'Decontări din operaţiuni în participaţie - activ (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 46, 'RO-BASE', 'THIRDPARTY', '46', '4', 'Debitori şi creditori diverşi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4610, 'RO-BASE', 'THIRDPARTY', '461', '46', 'Debitori diverşi (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4620, 'RO-BASE', 'THIRDPARTY', '462', '46', 'Creditori diverşi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4660, 'RO-BASE', 'THIRDPARTY', '466', '46', 'Decontări din operaţiuni de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4661, 'RO-BASE', 'THIRDPARTY', '4661', '4660', 'Datorii din operaţiuni de fiducie (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4662, 'RO-BASE', 'THIRDPARTY', '4662', '4660', 'Creanţe din operaţiuni de fiducie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 47, 'RO-BASE', 'THIRDPARTY', '47', '4', 'Conturi de subvenţii, regularizare şi asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4710, 'RO-BASE', 'THIRDPARTY', '471', '47', 'Cheltuieli înregistrate în avans (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4720, 'RO-BASE', 'THIRDPARTY', '472', '47', 'Venituri înregistrate în avans (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4730, 'RO-BASE', 'THIRDPARTY', '473', '47', 'Decontări din operaţiuni în curs de clarificare (A/P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4750, 'RO-BASE', 'THIRDPARTY', '475', '47', 'Subvenţii pentru investiţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4751, 'RO-BASE', 'THIRDPARTY', '4751', '4750', 'Subvenţii guvernamentale pentru investiţii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4752, 'RO-BASE', 'THIRDPARTY', '4752', '4750',
        'Împrumuturi nerambursabile cu caracter de subvenţii pentru investiţii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4753, 'RO-BASE', 'THIRDPARTY', '4753', '4750', 'Donaţii pentru investiţii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4754, 'RO-BASE', 'THIRDPARTY', '4754', '4750', 'Plusuri de inventar de natura imobilizărilor (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4758, 'RO-BASE', 'THIRDPARTY', '4758', '4750',
        'Alte sume primite cu caracter de subvenţii pentru investiţii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4780, 'RO-BASE', 'THIRDPARTY', '478', '47',
        'Venituri în avans aferente activelor primite prin transfer de la clienţi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 48, 'RO-BASE', 'THIRDPARTY', '48', '4', 'Decontări în cadrul unităţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4810, 'RO-BASE', 'THIRDPARTY', '481', '48', 'Decontări între unitate şi subunităţi (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4820, 'RO-BASE', 'THIRDPARTY', '482', '48', 'Decontări între subunităţi (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 49, 'RO-BASE', 'THIRDPARTY', '49', '4', 'Ajustări pentru deprecierea creanţelor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4910, 'RO-BASE', 'THIRDPARTY', '491', '49', 'Ajustări pentru deprecierea creanţelor - clienţi (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4950, 'RO-BASE', 'THIRDPARTY', '495', '49',
        'Ajustări pentru deprecierea creanţelor - decontări în cadrul grupului şi cu acţionarii/asociaţii (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4960, 'RO-BASE', 'THIRDPARTY', '496', '49',
        'Ajustări pentru deprecierea creanţelor - debitori diverşi (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5, 'RO-BASE', 'FINAN', '5', '0', 'Conturi de trezorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 50, 'RO-BASE', 'FINAN', '50', '5', 'Investiţii pe termen scurt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5010, 'RO-BASE', 'FINAN', '501', '50', 'Acţiuni deţinute la entităţile afiliate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5050, 'RO-BASE', 'FINAN', '505', '50', 'Obligaţiuni emise şi răscumpărate (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5060, 'RO-BASE', 'FINAN', '506', '50', 'Obligaţiuni (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5070, 'RO-BASE', 'FINAN', '507', '50', 'Certificate verzi primite (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5080, 'RO-BASE', 'FINAN', '508', '50', 'Alte investiţii pe termen scurt şi creanţe asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5081, 'RO-BASE', 'FINAN', '5081', '5080', 'Alte titluri de plasament (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5088, 'RO-BASE', 'FINAN', '5088', '5080', 'Dobânzi la obligaţiuni şi titluri de plasament (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5090, 'RO-BASE', 'FINAN', '509', '50', 'Vărsăminte de efectuat pentru investiţiile pe termen scurt',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5091, 'RO-BASE', 'FINAN', '5091', '5090',
        'Vărsăminte de efectuat pentru acţiunile deţinute la entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5092, 'RO-BASE', 'FINAN', '5092', '5090',
        'Vărsăminte de efectuat pentru alte investiţii pe termen scurt (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51, 'RO-BASE', 'FINAN', '51', '5', 'Conturi la bănci', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5110, 'RO-BASE', 'FINAN', '511', '51', 'Valori de încasat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5112, 'RO-BASE', 'FINAN', '5112', '5110', 'Cecuri de încasat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5113, 'RO-BASE', 'FINAN', '5113', '5110', 'Efecte de încasat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5114, 'RO-BASE', 'FINAN', '5114', '5110', 'Efecte remise spre scontare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5120, 'RO-BASE', 'FINAN', '512', '51', 'Conturi curente la bănci', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5121, 'RO-BASE', 'FINAN', '5121', '5120', 'Conturi la bănci în lei (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5124, 'RO-BASE', 'FINAN', '5124', '5120', 'Conturi la bănci în valută (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5125, 'RO-BASE', 'FINAN', '5125', '5120', 'Sume în curs de decontare (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5126, 'RO-BASE', 'FINAN', '5126', '5120', 'Conturi la bănci în lei - TVA defalcat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5127, 'RO-BASE', 'FINAN', '5127', '5120', 'Conturi la bănci în valută - TVA defalcat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5180, 'RO-BASE', 'FINAN', '518', '51', 'Dobânzi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5186, 'RO-BASE', 'FINAN', '5186', '5180', 'Dobânzi de plătit (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5187, 'RO-BASE', 'FINAN', '5187', '5180', 'Dobânzi de încasat (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5190, 'RO-BASE', 'FINAN', '519', '51', 'Credite bancare pe termen scurt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5191, 'RO-BASE', 'FINAN', '5191', '5190', 'Credite bancare pe termen scurt (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5192, 'RO-BASE', 'FINAN', '5192', '5190',
        'Credite bancare pe termen scurt nerambursate la scadenţă (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5193, 'RO-BASE', 'FINAN', '5193', '5190', 'Credite externe guvernamentale (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5194, 'RO-BASE', 'FINAN', '5194', '5190', 'Credite externe garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5195, 'RO-BASE', 'FINAN', '5195', '5190', 'Credite externe garantate de bănci (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5196, 'RO-BASE', 'FINAN', '5196', '5190', 'Credite de la Trezoreria Statului (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5197, 'RO-BASE', 'FINAN', '5197', '5190', 'Credite interne garantate de stat (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5198, 'RO-BASE', 'FINAN', '5198', '5190', 'Dobânzi aferente creditelor bancare pe termen scurt (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 53, 'RO-BASE', 'FINAN', '53', '5', 'Casa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5310, 'RO-BASE', 'FINAN', '531', '53', 'Casa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5311, 'RO-BASE', 'FINAN', '5311', '5310', 'Casa în lei (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5314, 'RO-BASE', 'FINAN', '5314', '5310', 'Casa în valută (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5320, 'RO-BASE', 'FINAN', '532', '53', 'Alte valori', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5321, 'RO-BASE', 'FINAN', '5321', '5320', 'Timbre fiscale şi poştale (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5322, 'RO-BASE', 'FINAN', '5322', '5320', 'Bilete de tratament şi odihnă (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5323, 'RO-BASE', 'FINAN', '5323', '5320', 'Tichete şi bilete de călătorie (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5328, 'RO-BASE', 'FINAN', '5328', '5320', 'Alte valori (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 54, 'RO-BASE', 'FINAN', '54', '5', 'Acreditive', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5410, 'RO-BASE', 'FINAN', '541', '54', 'Acreditive', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5411, 'RO-BASE', 'FINAN', '5411', '5410', 'Acreditive în lei (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5414, 'RO-BASE', 'FINAN', '5414', '5410', 'Acreditive în valută (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5420, 'RO-BASE', 'FINAN', '542', '54', 'Avansuri de trezorerie*18) (A)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 58, 'RO-BASE', 'FINAN', '58', '5', 'Viramente interne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5810, 'RO-BASE', 'FINAN', '581', '58', 'Viramente interne (A/P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 59, 'RO-BASE', 'FINAN', '59', '5',
        'Ajustări pentru pierderea de valoare a conturilor de trezorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5910, 'RO-BASE', 'FINAN', '591', '59',
        'Ajustări pentru pierderea de valoare a acţiunilor deţinute la entităţile afiliate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5950, 'RO-BASE', 'FINAN', '595', '59',
        'Ajustări pentru pierderea de valoare a obligaţiunilor emise şi răscumpărate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5960, 'RO-BASE', 'FINAN', '596', '59', 'Ajustări pentru pierderea de valoare a obligaţiunilor (P)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5980, 'RO-BASE', 'FINAN', '598', '59',
        'Ajustări pentru pierderea de valoare a altor investiţii pe termen scurt şi creanţe asimilate (P)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6, 'RO-BASE', 'EXPENSE', '6', '0', 'Conturi de cheltuieli', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 60, 'RO-BASE', 'EXPENSE', '60', '6', 'Cheltuieli privind stocurile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6010, 'RO-BASE', 'EXPENSE', '601', '60', 'Cheltuieli cu materiile prime', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6020, 'RO-BASE', 'EXPENSE', '602', '60', 'Cheltuieli cu materialele consumabile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6021, 'RO-BASE', 'EXPENSE', '6021', '6020', 'Cheltuieli cu materialele auxiliare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6022, 'RO-BASE', 'EXPENSE', '6022', '6020', 'Cheltuieli privind combustibilii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6023, 'RO-BASE', 'EXPENSE', '6023', '6020', 'Cheltuieli privind materialele pentru ambalat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6024, 'RO-BASE', 'EXPENSE', '6024', '6020', 'Cheltuieli privind piesele de schimb', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6025, 'RO-BASE', 'EXPENSE', '6025', '6020',
        'Cheltuieli privind seminţele şi materialele de plantat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6026, 'RO-BASE', 'EXPENSE', '6026', '6020', 'Cheltuieli privind furajele', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6028, 'RO-BASE', 'EXPENSE', '6028', '6020', 'Cheltuieli privind alte materiale consumabile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6030, 'RO-BASE', 'EXPENSE', '603', '60',
        'Cheltuieli privind materialele de natura obiectelor de inventar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6040, 'RO-BASE', 'EXPENSE', '604', '60', 'Cheltuieli privind materialele nestocate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6050, 'RO-BASE', 'EXPENSE', '605', '60', 'Cheltuieli privind energia şi apa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6060, 'RO-BASE', 'EXPENSE', '606', '60',
        'Cheltuieli privind activele biologice de natura stocurilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6070, 'RO-BASE', 'EXPENSE', '607', '60', 'Cheltuieli privind mărfurile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6080, 'RO-BASE', 'EXPENSE', '608', '60', 'Cheltuieli privind ambalajele', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6090, 'RO-BASE', 'EXPENSE', '609', '60', 'Reduceri comerciale primite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61, 'RO-BASE', 'EXPENSE', '61', '6', 'Cheltuieli cu serviciile executate de terţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6110, 'RO-BASE', 'EXPENSE', '611', '61', 'Cheltuieli cu întreţinerea şi reparaţiile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6120, 'RO-BASE', 'EXPENSE', '612', '61',
        'Cheltuieli cu redevenţele, locaţiile de gestiune şi chiriile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6130, 'RO-BASE', 'EXPENSE', '613', '61', 'Cheltuieli cu primele de asigurare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6140, 'RO-BASE', 'EXPENSE', '614', '61', 'Cheltuieli cu studiile şi cercetările', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6150, 'RO-BASE', 'EXPENSE', '615', '61', 'Cheltuieli cu pregătirea personalului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62, 'RO-BASE', 'EXPENSE', '62', '6', 'Cheltuieli cu alte servicii executate de terţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6210, 'RO-BASE', 'EXPENSE', '621', '62', 'Cheltuieli cu colaboratorii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6220, 'RO-BASE', 'EXPENSE', '622', '62', 'Cheltuieli privind comisioanele şi onorariile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6230, 'RO-BASE', 'EXPENSE', '623', '62', 'Cheltuieli de protocol, reclamă şi publicitate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6240, 'RO-BASE', 'EXPENSE', '624', '62', 'Cheltuieli cu transportul de bunuri şi personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6250, 'RO-BASE', 'EXPENSE', '625', '62', 'Cheltuieli cu deplasări, detaşări şi transferări', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6260, 'RO-BASE', 'EXPENSE', '626', '62', 'Cheltuieli poştale şi taxe de telecomunicaţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6270, 'RO-BASE', 'EXPENSE', '627', '62', 'Cheltuieli cu serviciile bancare şi asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6280, 'RO-BASE', 'EXPENSE', '628', '62', 'Alte cheltuieli cu serviciile executate de terţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 63, 'RO-BASE', 'EXPENSE', '63', '6', 'Cheltuieli cu alte impozite, taxe şi vărsăminte asimilate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6350, 'RO-BASE', 'EXPENSE', '635', '63',
        'Cheltuieli cu alte impozite, taxe şi vărsăminte asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 64, 'RO-BASE', 'EXPENSE', '64', '6', 'Cheltuieli cu personalul', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6410, 'RO-BASE', 'EXPENSE', '641', '64', 'Cheltuieli cu salariile personalului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6420, 'RO-BASE', 'EXPENSE', '642', '64',
        'Cheltuieli cu avantajele în natură şi tichetele acordate salariaţilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6421, 'RO-BASE', 'EXPENSE', '6421', '6420',
        'Cheltuieli cu avantajele în natură acordate salariaţilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6422, 'RO-BASE', 'EXPENSE', '6422', '6420', 'Cheltuieli cu tichetele acordate salariaţilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6430, 'RO-BASE', 'EXPENSE', '643', '64',
        'Cheltuieli cu remunerarea în instrumente de capitaluri proprii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6440, 'RO-BASE', 'EXPENSE', '644', '64',
        'Cheltuieli cu primele reprezentând participarea personalului la profit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6450, 'RO-BASE', 'EXPENSE', '645', '64', 'Cheltuieli privind asigurările şi protecţia socială', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6451, 'RO-BASE', 'EXPENSE', '6451', '6450',
        'Cheltuieli privind contribuţia unităţii la asigurările sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6452, 'RO-BASE', 'EXPENSE', '6452', '6450',
        'Cheltuieli privind contribuţia unităţii pentru ajutorul de şomaj', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6453, 'RO-BASE', 'EXPENSE', '6453', '6450',
        'Cheltuieli privind contribuţia angajatorului pentru asigurările sociale de sănătate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6455, 'RO-BASE', 'EXPENSE', '6455', '6450',
        'Cheltuieli privind contribuţia unităţii la asigurările de viaţă', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6456, 'RO-BASE', 'EXPENSE', '6456', '6450',
        'Cheltuieli privind contribuţia unităţii la fondurile de pensii facultative', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6457, 'RO-BASE', 'EXPENSE', '6457', '6450',
        'Cheltuieli privind contribuţia unităţii la primele de asigurare voluntară de sănătate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6458, 'RO-BASE', 'EXPENSE', '6458', '6450',
        'Alte cheltuieli privind asigurările şi protecţia socială', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6460, 'RO-BASE', 'EXPENSE', '646', '64', 'Cheltuieli privind contribuția asiguratorie pentru muncă',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 65, 'RO-BASE', 'EXPENSE', '65', '6', 'Alte cheltuieli de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6510, 'RO-BASE', 'EXPENSE', '651', '65', 'Cheltuieli din operaţiuni de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6511, 'RO-BASE', 'EXPENSE', '6511', '6510', 'Cheltuieli ocazionate de constituirea fiduciei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6512, 'RO-BASE', 'EXPENSE', '6512', '6510', 'Cheltuieli din derularea operaţiunilor de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6513, 'RO-BASE', 'EXPENSE', '6513', '6510', 'Cheltuieli din lichidarea operaţiunilor de fiducie',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6520, 'RO-BASE', 'EXPENSE', '652', '65', 'Cheltuieli cu protecţia mediului înconjurător', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6540, 'RO-BASE', 'EXPENSE', '654', '65', 'Pierderi din creanţe şi debitori diverşi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6550, 'RO-BASE', 'EXPENSE', '655', '65', 'Cheltuieli din reevaluarea imobilizărilor corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6580, 'RO-BASE', 'EXPENSE', '658', '65', 'Alte cheltuieli de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6581, 'RO-BASE', 'EXPENSE', '6581', '6580', 'Despăgubiri, amenzi şi penalităţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6582, 'RO-BASE', 'EXPENSE', '6582', '6580', 'Donaţii acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6583, 'RO-BASE', 'EXPENSE', '6583', '6580',
        'Cheltuieli privind activele cedate şi alte operaţiuni de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6584, 'RO-BASE', 'EXPENSE', '6584', '6580',
        'Cheltuieli cu sumele sau bunurile acordate ca sponsorizări  ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6586, 'RO-BASE', 'EXPENSE', '6586', '6580',
        'Cheltuieli reprezentând transferuri şi contribuţii datorate în baza unor acte normative speciale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6587, 'RO-BASE', 'EXPENSE', '6587', '6580',
        'Cheltuieli privind calamităţile şi alte evenimente similare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6588, 'RO-BASE', 'EXPENSE', '6588', '6580', 'Alte cheltuieli de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 66, 'RO-BASE', 'EXPENSE', '66', '6', 'Cheltuieli financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6630, 'RO-BASE', 'EXPENSE', '663', '66', 'Pierderi din creanţe legate de participaţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6640, 'RO-BASE', 'EXPENSE', '664', '66', 'Cheltuieli privind investiţiile financiare cedate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6641, 'RO-BASE', 'EXPENSE', '6641', '6640', 'Cheltuieli privind imobilizările financiare cedate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6642, 'RO-BASE', 'EXPENSE', '6642', '6640', 'Pierderi din investiţiile pe termen scurt cedate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6650, 'RO-BASE', 'EXPENSE', '665', '66', 'Cheltuieli din diferenţe de curs valutar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6651, 'RO-BASE', 'EXPENSE', '6651', '6650',
        'Diferenţe nefavorabile de curs valutar legate de elementele monetare exprimate în valută', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6652, 'RO-BASE', 'EXPENSE', '6652', '6650',
        'Diferenţe nefavorabile de curs valutar din evaluarea elementelor monetare care fac parte din investiţia netă într-o entitate străină',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6660, 'RO-BASE', 'EXPENSE', '666', '66', 'Cheltuieli privind dobânzile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6670, 'RO-BASE', 'EXPENSE', '667', '66', 'Cheltuieli privind sconturile acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6680, 'RO-BASE', 'EXPENSE', '668', '66', 'Alte cheltuieli financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 68, 'RO-BASE', 'EXPENSE', '68', '6',
        'Cheltuieli cu amortizările, provizioanele şi ajustările pentru depreciere sau pierdere de valoare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6810, 'RO-BASE', 'EXPENSE', '681', '68',
        'Cheltuieli de exploatare privind amortizările, provizioanele şi ajustările pentru depreciere', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6811, 'RO-BASE', 'EXPENSE', '6811', '6810',
        'Cheltuieli de exploatare privind amortizarea imobilizărilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6812, 'RO-BASE', 'EXPENSE', '6812', '6810', 'Cheltuieli de exploatare privind provizioanele', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6813, 'RO-BASE', 'EXPENSE', '6813', '6810',
        'Cheltuieli de exploatare privind ajustările pentru deprecierea imobilizărilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6814, 'RO-BASE', 'EXPENSE', '6814', '6810',
        'Cheltuieli de exploatare privind ajustările pentru deprecierea activelor circulante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6817, 'RO-BASE', 'EXPENSE', '6817', '6810',
        'Cheltuieli de exploatare privind ajustările pentru deprecierea fondului comercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6860, 'RO-BASE', 'EXPENSE', '686', '68',
        'Cheltuieli financiare privind amortizările, provizioanele şi ajustările pentru pierdere de valoare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6861, 'RO-BASE', 'EXPENSE', '6861', '6860', 'Cheltuieli privind actualizarea provizioanelor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6863, 'RO-BASE', 'EXPENSE', '6863', '6860',
        'Cheltuieli financiare privind ajustările pentru pierderea de valoare a imobilizărilor financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6864, 'RO-BASE', 'EXPENSE', '6864', '6860',
        'Cheltuieli financiare privind ajustările pentru pierderea de valoare a activelor circulante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6865, 'RO-BASE', 'EXPENSE', '6865', '6860',
        'Cheltuieli financiare privind amortizarea diferenţelor aferente titlurilor de stat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6868, 'RO-BASE', 'EXPENSE', '6868', '6860',
        'Cheltuieli financiare privind amortizarea primelor de rambursare a obligaţiunilor şi a altor datorii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 69, 'RO-BASE', 'EXPENSE', '69', '6', 'Cheltuieli cu impozitul pe profit şi alte impozite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6910, 'RO-BASE', 'EXPENSE', '691', '69', 'Cheltuieli cu impozitul pe profit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6980, 'RO-BASE', 'EXPENSE', '698', '69',
        'Cheltuieli cu impozitul pe venit şi cu alte impozite care nu apar în elementele de mai sus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7, 'RO-BASE', 'INCOME', '7', '0', 'Conturi de venituri', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70, 'RO-BASE', 'INCOME', '70', '7', 'Cifra de afaceri netă', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7010, 'RO-BASE', 'INCOME', '701', '70',
        'Venituri din vânzarea produselor finite, produselor agricole şi a activelor biologice de natura stocurilor',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7015, 'RO-BASE', 'INCOME', '7015', '7010', 'Venituri din vânzarea produselor finite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7017, 'RO-BASE', 'INCOME', '7017', '7010', 'Venituri din vânzarea produselor agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7018, 'RO-BASE', 'INCOME', '7018', '7010',
        'Venituri din vânzarea activelor biologice de natura stocurilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7020, 'RO-BASE', 'INCOME', '702', '70', 'Venituri din vânzarea semifabricatelor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7030, 'RO-BASE', 'INCOME', '703', '70', 'Venituri din vânzarea produselor reziduale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7040, 'RO-BASE', 'INCOME', '704', '70', 'Venituri din servicii prestate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7050, 'RO-BASE', 'INCOME', '705', '70', 'Venituri din studii şi cercetări', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7060, 'RO-BASE', 'INCOME', '706', '70', 'Venituri din redevenţe, locaţii de gestiune şi chirii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7070, 'RO-BASE', 'INCOME', '707', '70', 'Venituri din vânzarea mărfurilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7080, 'RO-BASE', 'INCOME', '708', '70', 'Venituri din activităţi diverse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7090, 'RO-BASE', 'INCOME', '709', '70', 'Reduceri comerciale acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71, 'RO-BASE', 'INCOME', '71', '7', 'Venituri aferente costului producţiei în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7110, 'RO-BASE', 'INCOME', '711', '71', 'Venituri aferente costurilor stocurilor de produse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7120, 'RO-BASE', 'INCOME', '712', '71',
        'Venituri aferente costurilor serviciilor în curs de execuţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 72, 'RO-BASE', 'INCOME', '72', '7', 'Venituri din producţia de imobilizări', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7210, 'RO-BASE', 'INCOME', '721', '72', 'Venituri din producţia de imobilizări necorporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7220, 'RO-BASE', 'INCOME', '722', '72', 'Venituri din producţia de imobilizări corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7250, 'RO-BASE', 'INCOME', '725', '72', 'Venituri din producţia de investiţii imobiliare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 74, 'RO-BASE', 'INCOME', '74', '7', 'Venituri din subvenţii de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7410, 'RO-BASE', 'INCOME', '741', '74', 'Venituri din subvenţii de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7411, 'RO-BASE', 'INCOME', '7411', '7410',
        'Venituri din subvenţii de exploatare aferente cifrei de afaceri', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7412, 'RO-BASE', 'INCOME', '7412', '7410',
        'Venituri din subvenţii de exploatare pentru materii prime şi materiale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7413, 'RO-BASE', 'INCOME', '7413', '7410',
        'Venituri din subvenţii de exploatare pentru alte cheltuieli externe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7414, 'RO-BASE', 'INCOME', '7414', '7410',
        'Venituri din subvenţii de exploatare pentru plata personalului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7415, 'RO-BASE', 'INCOME', '7415', '7410',
        'Venituri din subvenţii de exploatare pentru asigurări şi protecţie socială', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7416, 'RO-BASE', 'INCOME', '7416', '7410',
        'Venituri din subvenţii de exploatare pentru alte cheltuieli de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7417, 'RO-BASE', 'INCOME', '7417', '7410',
        'Venituri din subvenţii de exploatare în caz de calamităţi şi alte evenimente similare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7418, 'RO-BASE', 'INCOME', '7418', '7410',
        'Venituri din subvenţii de exploatare pentru dobânda datorată', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7419, 'RO-BASE', 'INCOME', '7419', '7410',
        'Venituri din subvenţii de exploatare aferente altor venituri', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 75, 'RO-BASE', 'INCOME', '75', '7', 'Alte venituri din exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7510, 'RO-BASE', 'INCOME', '751', '75', 'Venituri din operaţiuni de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7511, 'RO-BASE', 'INCOME', '7511', '7510', 'Venituri ocazionate de constituirea fiduciei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7512, 'RO-BASE', 'INCOME', '7512', '7510', 'Venituri din derularea operaţiunilor de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7513, 'RO-BASE', 'INCOME', '7513', '7510', 'Venituri din lichidarea operaţiunilor de fiducie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7540, 'RO-BASE', 'INCOME', '754', '75', 'Venituri din creanţe reactivate şi debitori diverşi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7550, 'RO-BASE', 'INCOME', '755', '75', 'Venituri din reevaluarea imobilizărilor corporale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7580, 'RO-BASE', 'INCOME', '758', '75', 'Alte venituri din exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7581, 'RO-BASE', 'INCOME', '7581', '7580', 'Venituri din despăgubiri, amenzi şi penalităţi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7582, 'RO-BASE', 'INCOME', '7582', '7580', 'Venituri din donaţii primite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7583, 'RO-BASE', 'INCOME', '7583', '7580',
        'Venituri din vânzarea activelor şi alte operaţiuni de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7584, 'RO-BASE', 'INCOME', '7584', '7580', 'Venituri din subvenţii pentru investiţii', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7586, 'RO-BASE', 'INCOME', '7586', '7580',
        'Venituri reprezentând transferuri cuvenite în baza unor acte normative speciale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7588, 'RO-BASE', 'INCOME', '7588', '7580', 'Alte venituri din exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 76, 'RO-BASE', 'INCOME', '76', '7', 'Venituri financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7610, 'RO-BASE', 'INCOME', '761', '76', 'Venituri din imobilizări financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7611, 'RO-BASE', 'INCOME', '7611', '7610', 'Venituri din acţiuni deţinute la entităţile afiliate',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7612, 'RO-BASE', 'INCOME', '7612', '7610', 'Venituri din acţiuni deţinute la entităţi asociate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7613, 'RO-BASE', 'INCOME', '7613', '7610',
        'Venituri din acţiuni deţinute la entităţi controlate în comun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7615, 'RO-BASE', 'INCOME', '7615', '7610', 'Venituri din alte imobilizări financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7620, 'RO-BASE', 'INCOME', '762', '76', 'Venituri din investiţii financiare pe termen scurt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7640, 'RO-BASE', 'INCOME', '764', '76', 'Venituri din investiţii financiare cedate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7641, 'RO-BASE', 'INCOME', '7641', '7640', 'Venituri din imobilizări financiare cedate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7642, 'RO-BASE', 'INCOME', '7642', '7640', 'Câştiguri din investiţii pe termen scurt cedate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7650, 'RO-BASE', 'INCOME', '765', '76', 'Venituri din diferenţe de curs valutar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7651, 'RO-BASE', 'INCOME', '7651', '7650',
        'Diferenţe favorabile de curs valutar legate de elementele monetare exprimate în valută', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7652, 'RO-BASE', 'INCOME', '7652', '7650',
        'Diferenţe favorabile de curs valutar din evaluarea elementelor monetare care fac parte din investiţia netă într-o entitate străină',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7660, 'RO-BASE', 'INCOME', '766', '76', 'Venituri din dobânzi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7670, 'RO-BASE', 'INCOME', '767', '76', 'Venituri din sconturi obţinute', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7680, 'RO-BASE', 'INCOME', '768', '76', 'Alte venituri financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 78, 'RO-BASE', 'INCOME', '78', '7',
        'Venituri din provizioane, amortizări şi ajustări pentru depreciere sau pierdere de valoare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7810, 'RO-BASE', 'INCOME', '781', '78',
        'Venituri din provizioane şi ajustări pentru depreciere privind activitatea de exploatare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7812, 'RO-BASE', 'INCOME', '7812', '7810', 'Venituri din provizioane', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7813, 'RO-BASE', 'INCOME', '7813', '7810',
        'Venituri din ajustări pentru deprecierea imobilizărilor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7814, 'RO-BASE', 'INCOME', '7814', '7810',
        'Venituri din ajustări pentru deprecierea activelor circulante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7815, 'RO-BASE', 'INCOME', '7815', '7810', 'Venituri din fondul comercial negativ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7860, 'RO-BASE', 'INCOME', '786', '78',
        'Venituri financiare din amortizări şi ajustări pentru pierdere de valoare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7863, 'RO-BASE', 'INCOME', '7863', '7860',
        'Venituri financiare din ajustări pentru pierderea de valoare a imobilizărilor financiare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7864, 'RO-BASE', 'INCOME', '7864', '7860',
        'Venituri financiare din ajustări pentru pierderea de valoare a activelor circulante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7865, 'RO-BASE', 'INCOME', '7865', '7860',
        'Venituri financiare din amortizarea diferenţelor aferente titlurilor de stat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8, 'RO-BASE', 'OTHER', '8', '0', 'Conturi speciale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 80, 'RO-BASE', 'OTHER', '80', '8', 'Conturi în afara bilanţului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8010, 'RO-BASE', 'OTHER', '801', '80', 'Angajamente acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8011, 'RO-BASE', 'OTHER', '8011', '8010', 'Giruri şi garanţii acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8018, 'RO-BASE', 'OTHER', '8018', '8010', 'Alte angajamente acordate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8020, 'RO-BASE', 'OTHER', '802', '80', 'Angajamente primite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8021, 'RO-BASE', 'OTHER', '8021', '8020', 'Giruri şi garanţii primite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8028, 'RO-BASE', 'OTHER', '8028', '8020', 'Alte angajamente primite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8030, 'RO-BASE', 'OTHER', '803', '80', 'Alte conturi în afara bilanţului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8031, 'RO-BASE', 'OTHER', '8031', '8030',
        'Imobilizări corporale primite cu chirie sau în baza altor contracte similare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8032, 'RO-BASE', 'OTHER', '8032', '8030', 'Valori materiale primite spre prelucrare sau reparare',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8033, 'RO-BASE', 'OTHER', '8033', '8030', 'Valori materiale primite în păstrare sau custodie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8034, 'RO-BASE', 'OTHER', '8034', '8030', 'Debitori scoşi din activ, urmăriţi în continuare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8035, 'RO-BASE', 'OTHER', '8035', '8030',
        'Stocuri de natura obiectelor de inventar date în folosinţă', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8036, 'RO-BASE', 'OTHER', '8036', '8030',
        'Redevenţe, locaţii de gestiune, chirii şi alte datorii asimilate', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8037, 'RO-BASE', 'OTHER', '8037', '8030', 'Efecte scontate neajunse la scadenţă', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8038, 'RO-BASE', 'OTHER', '8038', '8030',
        'Bunuri primite în administrare, concesiune şi cu chirie şi alte bunuri similare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8039, 'RO-BASE', 'OTHER', '8039', '8030', 'Alte valori în afara bilanţului', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8040, 'RO-BASE', 'OTHER', '804', '80', 'Certificate verzi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8050, 'RO-BASE', 'OTHER', '805', '80',
        'Dobânzi aferente contractelor de leasing şi altor contracte asimilate, neajunse la scadenţă', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8051, 'RO-BASE', 'OTHER', '8051', '8050', 'Dobânzi de plătit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8052, 'RO-BASE', 'OTHER', '8052', '8050', 'Dobânzi de încasat*24)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8060, 'RO-BASE', 'OTHER', '806', '80', 'Certificate de emisii de gaze cu efect de seră', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8070, 'RO-BASE', 'OTHER', '807', '80', 'Active contingente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8080, 'RO-BASE', 'OTHER', '808', '80', 'Datorii contingente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8090, 'RO-BASE', 'OTHER', '809', '80', 'Creanţe preluate prin cesionare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 89, 'RO-BASE', 'OTHER', '89', '8', 'Bilanţ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8910, 'RO-BASE', 'OTHER', '891', '89', 'Bilanţ de deschidere', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8920, 'RO-BASE', 'OTHER', '892', '89', 'Bilanţ de închidere', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9, 'RO-BASE', 'MANAGEMENT', '9', '0', 'Conturi de gestiune', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 90, 'RO-BASE', 'MANAGEMENT', '90', '9', 'Decontări interne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9010, 'RO-BASE', 'MANAGEMENT', '901', '90', 'Decontări interne privind cheltuielile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9020, 'RO-BASE', 'MANAGEMENT', '902', '90', 'Decontări interne privind producţia obţinută', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9030, 'RO-BASE', 'MANAGEMENT', '903', '90', 'Decontări interne privind diferenţele de preţ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 92, 'RO-BASE', 'MANAGEMENT', '92', '9', 'Conturi de calculaţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9210, 'RO-BASE', 'MANAGEMENT', '921', '92', 'Cheltuielile activităţii de bază', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9220, 'RO-BASE', 'MANAGEMENT', '922', '92', 'Cheltuielile activităţilor auxiliare', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9230, 'RO-BASE', 'MANAGEMENT', '923', '92', 'Cheltuieli indirecte de producţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9240, 'RO-BASE', 'MANAGEMENT', '924', '92', 'Cheltuieli generale de administraţie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9250, 'RO-BASE', 'MANAGEMENT', '925', '92', 'Cheltuieli de desfacere', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 93, 'RO-BASE', 'MANAGEMENT', '93', '9', 'Costul producţiei', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9310, 'RO-BASE', 'MANAGEMENT', '931', '93', 'Costul producţiei obţinute', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9330, 'RO-BASE', 'MANAGEMENT', '933', '93', 'Costul producţiei în curs de execuţie', 1);


