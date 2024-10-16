-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007      Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2011-2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
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
-- Note (JPN-BASE): INCOME  = REVENUE
-- Note (JPN-BASE): EXPENSE = EXPENSES
-- Note (JPN-BASE): CAPITAL = EQUITY
--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l''install et tous les sigles '--' sont supprimés.
-- Note: To replace a string thas is '__, 0' into an increasing number, you can use vi with comment
-- :let @a=1 | %s/__, 0/\='__, '.(@a+setreg('a',@a+1))/g

-- Descriptif des plans comptables Japan JPN-BASE                                            
-- ID 10000 - 99999
-- ADD 12300000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10000, 'JPN-BASE', 'ASSETS', '10000000', '0', '資産合計', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11000, 'JPN-BASE', 'ASSETS', '11000000', '10000000', '流動資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11100, 'JPN-BASE', 'ASSETS', '11100000', '11000000', '当座資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11101, 'JPN-BASE', 'ASSETS', '11110000', '11100000', '現金及び預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11102, 'JPN-BASE', 'ASSETS', '11111000', '11110000', '現金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11103, 'JPN-BASE', 'ASSETS', '11111100', '11111000', '現金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11104, 'JPN-BASE', 'ASSETS', '11111200', '11111000', '小口現金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11105, 'JPN-BASE', 'ASSETS', '11111300', '11111000', '小切手', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11106, 'JPN-BASE', 'ASSETS', '11111400', '11111000', '転送中現金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11107, 'JPN-BASE', 'ASSETS', '11112000', '11110000', '流動性預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11108, 'JPN-BASE', 'ASSETS', '11112100', '11112000', '当座預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11109, 'JPN-BASE', 'ASSETS', '11112200', '11112000', '普通預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11110, 'JPN-BASE', 'ASSETS', '11112300', '11112000', '通知預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11111, 'JPN-BASE', 'ASSETS', '11112400', '11112000', 'その他流動性預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11112, 'JPN-BASE', 'ASSETS', '11112500', '11112000', '銀行通過中預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11113, 'JPN-BASE', 'ASSETS', '11112600', '11112000', '銀行未確認受領', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11114, 'JPN-BASE', 'ASSETS', '11112700', '11112000', '未配分受取預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11115, 'JPN-BASE', 'ASSETS', '11113000', '11110000', '固定性預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11116, 'JPN-BASE', 'ASSETS', '11113100', '11113000', '定期預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11117, 'JPN-BASE', 'ASSETS', '11113200', '11113000', '定期積金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11118, 'JPN-BASE', 'ASSETS', '11113300', '11113000', 'その他固定性預金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11119, 'JPN-BASE', 'ASSETS', '11120000', '11100000', 'その他当座資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11120, 'JPN-BASE', 'ASSETS', '11121000', '11120000', '受取手形', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11121, 'JPN-BASE', 'ASSETS', '11122000', '11120000', '売掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11122, 'JPN-BASE', 'ASSETS', '11123000', '11120000', 'サービス売掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11123, 'JPN-BASE', 'ASSETS', '11124000', '11120000', '有価証券', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11124, 'JPN-BASE', 'ASSETS', '11125000', '11120000', 'その他当座資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11125, 'JPN-BASE', 'ASSETS', '11126000', '11120000', '未請求売掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11200, 'JPN-BASE', 'ASSETS', '11200000', '11000000', '棚卸資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11201, 'JPN-BASE', 'ASSETS', '11201000', '11200000', '商品', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11202, 'JPN-BASE', 'ASSETS', '11202000', '11200000', '製品', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11203, 'JPN-BASE', 'ASSETS', '11203000', '11200000', '製品資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11204, 'JPN-BASE', 'ASSETS', '11204000', '11200000', '倉庫資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11205, 'JPN-BASE', 'ASSETS', '11205000', '11200000', '原材料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11206, 'JPN-BASE', 'ASSETS', '11206000', '11200000', '半製品・仕掛品', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11207, 'JPN-BASE', 'ASSETS', '11207000', '11200000', '貯蔵品', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11208, 'JPN-BASE', 'ASSETS', '11208000', '11200000', '補助材料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11209, 'JPN-BASE', 'ASSETS', '11209000', '11200000', 'その他棚卸資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11210, 'JPN-BASE', 'ASSETS', '11210000', '11200000', '仕掛品在庫', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11211, 'JPN-BASE', 'ASSETS', '11211000', '11200000', '検品中在庫', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11300, 'JPN-BASE', 'ASSETS', '11300000', '11000000', 'その他流動資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11301, 'JPN-BASE', 'ASSETS', '11301000', '11300000', '前渡金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11302, 'JPN-BASE', 'ASSETS', '11302000', '11300000', '短期貸付金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11303, 'JPN-BASE', 'ASSETS', '11303000', '11300000', '立替金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11304, 'JPN-BASE', 'ASSETS', '11304000', '11300000', '従業員立替', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11305, 'JPN-BASE', 'ASSETS', '11305000', '11300000', '未収入金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11306, 'JPN-BASE', 'ASSETS', '11306000', '11300000', '仮払金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11307, 'JPN-BASE', 'ASSETS', '11307000', '11300000', '前払金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11308, 'JPN-BASE', 'ASSETS', '11308000', '11300000', '仮払消費税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11309, 'JPN-BASE', 'ASSETS', '11309000', '11300000', '未収法人税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11310, 'JPN-BASE', 'ASSETS', '11310000', '11300000', '繰延税金資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11311, 'JPN-BASE', 'ASSETS', '11311000', '11300000', 'その他流動資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11312, 'JPN-BASE', 'ASSETS', '11312000', '11300000', '不渡手形', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11313, 'JPN-BASE', 'ASSETS', '11313000', '11300000', '債権償却特別勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11314, 'JPN-BASE', 'ASSETS', '11314000', '11300000', '貸倒引当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12000, 'JPN-BASE', 'ASSETS', '12000000', '10000000', '固定資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12100, 'JPN-BASE', 'ASSETS', '12100000', '12000000', '有形固定資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12101, 'JPN-BASE', 'ASSETS', '12101000', '12100000', '建物', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12102, 'JPN-BASE', 'ASSETS', '12102000', '12100000', '建物付属設備', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12103, 'JPN-BASE', 'ASSETS', '12103000', '12100000', '構築物', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12104, 'JPN-BASE', 'ASSETS', '12104000', '12100000', '機械装置', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12105, 'JPN-BASE', 'ASSETS', '12105000', '12100000', '車両運搬具', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12106, 'JPN-BASE', 'ASSETS', '12106000', '12100000', '工具器具備品', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12107, 'JPN-BASE', 'ASSETS', '12107000', '12100000', '土地', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12108, 'JPN-BASE', 'ASSETS', '12108000', '12100000', '建設仮勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12109, 'JPN-BASE', 'ASSETS', '12109000', '12100000', 'その他有形固定資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12110, 'JPN-BASE', 'ASSETS', '12110000', '12100000', '減価償却累計額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12200, 'JPN-BASE', 'ASSETS', '12200000', '12000000', '無形固定資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12201, 'JPN-BASE', 'ASSETS', '12201000', '12200000', '電話加入権', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12202, 'JPN-BASE', 'ASSETS', '12202000', '12200000', 'その他無形固定資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12203, 'JPN-BASE', 'ASSETS', '12203000', '12200000', 'ソフトウェア資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12300, 'JPN-BASE', 'ASSETS', '12300000', '12000000', '投資その他の資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12301, 'JPN-BASE', 'ASSETS', '12301000', '12300000', '投資有価証券', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12302, 'JPN-BASE', 'ASSETS', '12302000', '12300000', '出資金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12303, 'JPN-BASE', 'ASSETS', '12303000', '12300000', '長期貸付金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12304, 'JPN-BASE', 'ASSETS', '12304000', '12300000', '長期前払費用', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12305, 'JPN-BASE', 'ASSETS', '12305000', '12300000', '保証金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12306, 'JPN-BASE', 'ASSETS', '12306000', '12300000', '事業保険積立金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12307, 'JPN-BASE', 'ASSETS', '12307000', '12300000', '長期繰延税金資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12308, 'JPN-BASE', 'ASSETS', '12308000', '12300000', 'その他投資', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12309, 'JPN-BASE', 'ASSETS', '12410000', '12000000', 'プロジェクト資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12310, 'JPN-BASE', 'ASSETS', '12420000', '12000000', 'プロジェクト仕掛', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13000, 'JPN-BASE', 'ASSETS', '13000000', '10000000', '繰延資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13001, 'JPN-BASE', 'ASSETS', '13100000', '13000000', '創立費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13002, 'JPN-BASE', 'ASSETS', '13200000', '13000000', '開発費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13003, 'JPN-BASE', 'ASSETS', '13300000', '13000000', '試験研究費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13004, 'JPN-BASE', 'ASSETS', '13400000', '13000000', 'その他繰延資産', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 14000, 'JPN-BASE', 'ASSETS', '14000000', '10000000', '関係会社取引元勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 20000, 'JPN-BASE', 'LIABILITIES_EQUITY', '20000000', '0', '負債・純資産合計', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21000, 'JPN-BASE', 'LIABILITIES', '21000000', '20000000', '負債合計', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21001, 'JPN-BASE', 'LIABILITIES', '21100000', '21000000', '流動負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21002, 'JPN-BASE', 'LIABILITIES', '21101000', '21100000', '支払手形', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21003, 'JPN-BASE', 'LIABILITIES', '21102000', '21100000', '買掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21004, 'JPN-BASE', 'LIABILITIES', '21103000', '21100000', 'サービス買掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21005, 'JPN-BASE', 'LIABILITIES', '21104000', '21100000', '短期借入金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21006, 'JPN-BASE', 'LIABILITIES', '21105000', '21100000', '１年内返済長期借入金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21007, 'JPN-BASE', 'LIABILITIES', '21106000', '21100000', '未払金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21008, 'JPN-BASE', 'LIABILITIES', '21107000', '21100000', '未払費用', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21009, 'JPN-BASE', 'LIABILITIES', '21108000', '21100000', '前受金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21010, 'JPN-BASE', 'LIABILITIES', '21109000', '21100000', '仮受金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21011, 'JPN-BASE', 'LIABILITIES', '21110000', '21100000', '預り金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21012, 'JPN-BASE', 'LIABILITIES', '21111000', '21100000', '従業員預り金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21013, 'JPN-BASE', 'LIABILITIES', '21112000', '21100000', '割引手形', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21014, 'JPN-BASE', 'LIABILITIES', '21113000', '21100000', '裏書手形', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21015, 'JPN-BASE', 'LIABILITIES', '21114000', '21100000', '未払法人税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21016, 'JPN-BASE', 'LIABILITIES', '21115000', '21100000', '賞与引当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21017, 'JPN-BASE', 'LIABILITIES', '21116000', '21100000', '仮受消費税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21018, 'JPN-BASE', 'LIABILITIES', '21117000', '21100000', '繰延税金負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21019, 'JPN-BASE', 'LIABILITIES', '21118000', '21100000', 'その他流動負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21020, 'JPN-BASE', 'LIABILITIES', '21119000', '21100000', '未請求受領書', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21021, 'JPN-BASE', 'LIABILITIES', '21200000', '21000000', '固定負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21022, 'JPN-BASE', 'LIABILITIES', '21201000', '21200000', '長期借入金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21023, 'JPN-BASE', 'LIABILITIES', '21202000', '21200000', '預り保証金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21024, 'JPN-BASE', 'LIABILITIES', '21203000', '21200000', '退職給与引当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21025, 'JPN-BASE', 'LIABILITIES', '21204000', '21200000', '長期繰延税金負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21026, 'JPN-BASE', 'LIABILITIES', '21205000', '21200000', 'その他固定負債', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21027, 'JPN-BASE', 'LIABILITIES', '21300000', '21000000', '引当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21028, 'JPN-BASE', 'LIABILITIES', '21301000', '21300000', '引当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21029, 'JPN-BASE', 'LIABILITIES', '21410000', '21000000', '関係会社取引先勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21030, 'JPN-BASE', 'LIABILITIES', '21420000', '21000000', '源泉所得税', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21031, 'JPN-BASE', 'LIABILITIES', '21430000', '21000000', '支払中買掛金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22000, 'JPN-BASE', 'EQUITY', '22000000', '20000000', '純資産合計', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22001, 'JPN-BASE', 'EQUITY', '22100000', '22000000', '株主資本', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22002, 'JPN-BASE', 'EQUITY', '22110000', '22100000', '資本金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22003, 'JPN-BASE', 'EQUITY', '22111000', '22110000', '資本金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22004, 'JPN-BASE', 'EQUITY', '22120000', '22100000', '新株式申込証拠金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22005, 'JPN-BASE', 'EQUITY', '22121000', '22120000', '新株式申込証拠金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22006, 'JPN-BASE', 'EQUITY', '22130000', '22100000', '資本剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22007, 'JPN-BASE', 'EQUITY', '22131000', '22130000', '資本準備金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22008, 'JPN-BASE', 'EQUITY', '22131100', '22131000', 'その他資本剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22009, 'JPN-BASE', 'EQUITY', '22131110', '22131100', '資本・資本準備金減少差益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22010, 'JPN-BASE', 'EQUITY', '22131120', '22131100', '自己株式処分差益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22011, 'JPN-BASE', 'EQUITY', '22140000', '22100000', '利益剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22012, 'JPN-BASE', 'EQUITY', '22141000', '22140000', '利益準備金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22013, 'JPN-BASE', 'EQUITY', '22142000', '22140000', 'その他利益剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22014, 'JPN-BASE', 'EQUITY', '22142100', '22142000', '退職給与積立金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22015, 'JPN-BASE', 'EQUITY', '22142200', '22142000', '別途積立金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22016, 'JPN-BASE', 'EQUITY', '22142300', '22142000', 'その他任意積立金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22017, 'JPN-BASE', 'EQUITY', '22142400', '22142000', '繰越利益剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22018, 'JPN-BASE', 'EQUITY', '22142410', '22142400', '繰越利益剰余金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22019, 'JPN-BASE', 'EQUITY', '22150000', '22100000', '自己株式', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22020, 'JPN-BASE', 'EQUITY', '22151000', '22150000', '自己株式', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22021, 'JPN-BASE', 'EQUITY', '22160000', '22100000', '自己株式申込証拠金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22022, 'JPN-BASE', 'EQUITY', '22161000', '22160000', '自己株式申込証拠金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22023, 'JPN-BASE', 'EQUITY', '22200000', '22000000', '評価・換算差額等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22024, 'JPN-BASE', 'EQUITY', '22210000', '22200000', '他有価証券評価差額金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22025, 'JPN-BASE', 'EQUITY', '22211000', '22210000', '他有価証券評価差額金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22026, 'JPN-BASE', 'EQUITY', '22220000', '22200000', '繰越ヘッジ損益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22027, 'JPN-BASE', 'EQUITY', '22221000', '22220000', '繰越ヘッジ損益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22028, 'JPN-BASE', 'EQUITY', '22300000', '22000000', '新株予約権', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22029, 'JPN-BASE', 'EQUITY', '22310000', '22300000', '新株予約権', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22030, 'JPN-BASE', 'EQUITY', '22320000', '22300000', '自己新株予約権', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30000, 'JPN-BASE', 'INCOME', '30000000', '0', '純売上高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30001, 'JPN-BASE', 'INCOME', '30001000', '30000000', '商品売上高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30002, 'JPN-BASE', 'INCOME', '30002000', '30000000', '製品売上高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30003, 'JPN-BASE', 'INCOME', '30003000', '30000000', 'サービス売上高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30004, 'JPN-BASE', 'INCOME', '30004000', '30000000', '売上値引高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30005, 'JPN-BASE', 'INCOME', '30005000', '30000000', '売上戻り高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30006, 'JPN-BASE', 'INCOME', '30006000', '30000000', '売上割戻し高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30007, 'JPN-BASE', 'INCOME', '30007000', '30000000', '前受収益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30008, 'JPN-BASE', 'INCOME', '30008000', '30000000', '未請求売上', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31000, 'JPN-BASE', 'COGS', '31000000', '0', '売上原価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31001, 'JPN-BASE', 'COGS', '31100000', '31000000', '商品売上原価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31002, 'JPN-BASE', 'COGS', '31200000', '31000000', '製品売上原価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31003, 'JPN-BASE', 'COGS', '31201000', '31000000', '製品経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31004, 'JPN-BASE', 'COGS', '31202000', '31000000', '製品原価調整', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31005, 'JPN-BASE', 'COGS', '31203000', '31000000', '入庫請求仮勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31006, 'JPN-BASE', 'COGS', '31204000', '31000000', '請求価格差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31007, 'JPN-BASE', 'COGS', '31205000', '31000000', '標準価格差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31008, 'JPN-BASE', 'COGS', '31206000', '31000000', '平均原価差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31009, 'JPN-BASE', 'COGS', '31207000', '31000000', '倉庫差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31010, 'JPN-BASE', 'COGS', '31208000', '31000000', '在庫調整', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31011, 'JPN-BASE', 'COGS', '31209000', '31000000', '棚卸再評価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31012, 'JPN-BASE', 'COGS', '31300000', '31000000', '期首棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31400, 'JPN-BASE', 'COGS', '31400000', '31000000', '仕入高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31401, 'JPN-BASE', 'COGS', '31410000', '31400000', '商品仕入高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31402, 'JPN-BASE', 'COGS', '31420000', '31400000', 'サービス仕入高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31403, 'JPN-BASE', 'COGS', '31430000', '31400000', '仕入値引高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31404, 'JPN-BASE', 'COGS', '31440000', '31400000', '仕入戻り高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31405, 'JPN-BASE', 'COGS', '31450000', '31400000', '仕入割戻し高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31406, 'JPN-BASE', 'COGS', '31460000', '31400000', '仕入等配賦額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31500, 'JPN-BASE', 'COGS', '31500000', '31000000', '当期製品製造原価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31501, 'JPN-BASE', 'COGS', '31510000', '31500000', '当期総製造費用', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31502, 'JPN-BASE', 'COGS', '31511000', '31510000', '材料費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31503, 'JPN-BASE', 'COGS', '31511100', '31511000', '期首材料棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31504, 'JPN-BASE', 'COGS', '31511200', '31511000', '材料仕入高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31505, 'JPN-BASE', 'COGS', '31511300', '31511000', '期末材料棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31506, 'JPN-BASE', 'COGS', '31512000', '31510000', '労務費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31507, 'JPN-BASE', 'COGS', '31512100', '31512000', '賃金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31508, 'JPN-BASE', 'COGS', '31512200', '31512000', '賞与', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31509, 'JPN-BASE', 'COGS', '31512300', '31512000', '退職金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31510, 'JPN-BASE', 'COGS', '31512400', '31512000', '法定福利費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31511, 'JPN-BASE', 'COGS', '31512500', '31512000', '福利厚生費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31512, 'JPN-BASE', 'COGS', '31512600', '31512000', '賞与引当金繰入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31513, 'JPN-BASE', 'COGS', '31512700', '31512000', '退職給与引当金繰入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31514, 'JPN-BASE', 'COGS', '31512800', '31512000', 'その他労務費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31515, 'JPN-BASE', 'COGS', '31512900', '31512000', '雑給', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31516, 'JPN-BASE', 'COGS', '31513000', '31510000', '外注加工費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31517, 'JPN-BASE', 'COGS', '31513100', '31513000', '外注加工費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31518, 'JPN-BASE', 'COGS', '31514000', '31510000', '製造経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31519, 'JPN-BASE', 'COGS', '31514010', '31514000', '電力費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31520, 'JPN-BASE', 'COGS', '31514020', '31514000', '燃料費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31521, 'JPN-BASE', 'COGS', '31514030', '31514000', '水道光熱費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31522, 'JPN-BASE', 'COGS', '31514040', '31514000', '車両関連費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31523, 'JPN-BASE', 'COGS', '31514050', '31514000', '運賃', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31524, 'JPN-BASE', 'COGS', '31514060', '31514000', '工場消耗品費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31525, 'JPN-BASE', 'COGS', '31514070', '31514000', '賃借料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31526, 'JPN-BASE', 'COGS', '31514080', '31514000', '支払保険料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31527, 'JPN-BASE', 'COGS', '31514090', '31514000', '修繕費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31528, 'JPN-BASE', 'COGS', '31514100', '31514000', '租税公課', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31529, 'JPN-BASE', 'COGS', '31514110', '31514000', '減価償却費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31530, 'JPN-BASE', 'COGS', '31514120', '31514000', '旅費交通費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31531, 'JPN-BASE', 'COGS', '31514130', '31514000', '通信費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31532, 'JPN-BASE', 'COGS', '31514140', '31514000', '支払手数料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31533, 'JPN-BASE', 'COGS', '31514150', '31514000', '会議費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31534, 'JPN-BASE', 'COGS', '31514160', '31514000', '諸会費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31535, 'JPN-BASE', 'COGS', '31514170', '31514000', '図書教育費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31536, 'JPN-BASE', 'COGS', '31514180', '31514000', '試験研究費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31537, 'JPN-BASE', 'COGS', '31514190', '31514000', 'その他製造経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31538, 'JPN-BASE', 'COGS', '31514200', '31514000', '雑費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31539, 'JPN-BASE', 'COGS', '31515010', '31514000', '製造原価', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31540, 'JPN-BASE', 'COGS', '31515020', '31514000', 'スクラップ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31541, 'JPN-BASE', 'COGS', '31515030', '31514000', '外注加工費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31542, 'JPN-BASE', 'COGS', '31515040', '31514000', '数量差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31543, 'JPN-BASE', 'COGS', '31515050', '31514000', '仕様変更差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31544, 'JPN-BASE', 'COGS', '31515060', '31514000', '賃率差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31545, 'JPN-BASE', 'COGS', '31515070', '31514000', '準変動費差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31546, 'JPN-BASE', 'COGS', '31515080', '31514000', '労務費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31547, 'JPN-BASE', 'COGS', '31515090', '31514000', '負担', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31548, 'JPN-BASE', 'COGS', '31515100', '31514000', '間接諸経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31549, 'JPN-BASE', 'COGS', '31520000', '31500000', '仕掛品棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31550, 'JPN-BASE', 'COGS', '31521000', '31520000', '製造原価配賦額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31551, 'JPN-BASE', 'COGS', '31522000', '31520000', '期首仕掛品棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31552, 'JPN-BASE', 'COGS', '31523000', '31520000', '期末仕掛品棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31553, 'JPN-BASE', 'COGS', '31524000', '31520000', '他勘定振替高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31600, 'JPN-BASE', 'COGS', '31600000', '31000000', '期末棚卸高', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41000, 'JPN-BASE', 'EXPENSE', '41000000', '0', '販売費及び一般管理費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41100, 'JPN-BASE', 'EXPENSE', '41100000', '41000000', '人件費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41101, 'JPN-BASE', 'EXPENSE', '41101000', '41100000', '役員報酬', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41102, 'JPN-BASE', 'EXPENSE', '41102000', '41100000', '役員賞与', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41103, 'JPN-BASE', 'EXPENSE', '41103000', '41100000', '給料手当', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41104, 'JPN-BASE', 'EXPENSE', '41104000', '41100000', '賞与', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41105, 'JPN-BASE', 'EXPENSE', '41105000', '41100000', '退職金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41106, 'JPN-BASE', 'EXPENSE', '41106000', '41100000', '法定福利費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41107, 'JPN-BASE', 'EXPENSE', '41107000', '41100000', '福利厚生費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41108, 'JPN-BASE', 'EXPENSE', '41108000', '41100000', '賞与引当金繰入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41109, 'JPN-BASE', 'EXPENSE', '41109000', '41100000', '退職給与引当金繰入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41110, 'JPN-BASE', 'EXPENSE', '41110000', '41100000', 'その他人件費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41111, 'JPN-BASE', 'EXPENSE', '41111000', '41100000', '雑給', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41112, 'JPN-BASE', 'EXPENSE', '41112000', '41100000', '従業員経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41200, 'JPN-BASE', 'EXPENSE', '41200000', '41000000', '販売直接費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41201, 'JPN-BASE', 'EXPENSE', '41201000', '41200000', '広告宣伝費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41202, 'JPN-BASE', 'EXPENSE', '41202000', '41200000', '運賃', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41203, 'JPN-BASE', 'EXPENSE', '41203000', '41200000', '販売手数料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41204, 'JPN-BASE', 'EXPENSE', '41204000', '41200000', '容器包装費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41205, 'JPN-BASE', 'EXPENSE', '41205000', '41200000', 'その他販売直接費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41300, 'JPN-BASE', 'EXPENSE', '41300000', '41000000', '一般管理費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41301, 'JPN-BASE', 'EXPENSE', '41301000', '41300000', '水道光熱費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41302, 'JPN-BASE', 'EXPENSE', '41302000', '41300000', '車両関連費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41303, 'JPN-BASE', 'EXPENSE', '41303000', '41300000', '事務用消耗品費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41304, 'JPN-BASE', 'EXPENSE', '41304000', '41300000', '消耗品費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41305, 'JPN-BASE', 'EXPENSE', '41305000', '41300000', '賃借料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41306, 'JPN-BASE', 'EXPENSE', '41306000', '41300000', '支払保険料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41307, 'JPN-BASE', 'EXPENSE', '41307000', '41300000', '修繕費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41308, 'JPN-BASE', 'EXPENSE', '41308000', '41300000', '租税公課', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41309, 'JPN-BASE', 'EXPENSE', '41309000', '41300000', '減価償却費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41310, 'JPN-BASE', 'EXPENSE', '41310000', '41300000', '接待交際費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41311, 'JPN-BASE', 'EXPENSE', '41311000', '41300000', '旅費交通費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41312, 'JPN-BASE', 'EXPENSE', '41312000', '41300000', '通信費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41313, 'JPN-BASE', 'EXPENSE', '41313000', '41300000', '支払手数料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41314, 'JPN-BASE', 'EXPENSE', '41314000', '41300000', '会議費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41315, 'JPN-BASE', 'EXPENSE', '41315000', '41300000', '諸会費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41316, 'JPN-BASE', 'EXPENSE', '41316000', '41300000', '寄付金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41317, 'JPN-BASE', 'EXPENSE', '41317000', '41300000', '図書教育費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41318, 'JPN-BASE', 'EXPENSE', '41318000', '41300000', '試験研究費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41319, 'JPN-BASE', 'EXPENSE', '41319000', '41300000', 'その他管理費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41320, 'JPN-BASE', 'EXPENSE', '41320000', '41300000', '貸倒引当金繰入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41321, 'JPN-BASE', 'EXPENSE', '41321000', '41300000', '銀行手数料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41322, 'JPN-BASE', 'EXPENSE', '41322000', '41300000', '現金差異', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41323, 'JPN-BASE', 'EXPENSE', '41323000', '41300000', '雑費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41400, 'JPN-BASE', 'EXPENSE', '41400000', '41000000', '販管費配賦額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51000, 'JPN-BASE', 'OTHER_REVENUE', '51000000', '0', '営業外収益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51001, 'JPN-BASE', 'OTHER_REVENUE', '51010000', '51000000', '受取利息', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51002, 'JPN-BASE', 'OTHER_REVENUE', '51020000', '51000000', '受取配当金', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51003, 'JPN-BASE', 'OTHER_REVENUE', '51030000', '51000000', '銀行再評価益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51004, 'JPN-BASE', 'OTHER_REVENUE', '51040000', '51000000', '銀行決済利益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51005, 'JPN-BASE', 'OTHER_REVENUE', '51050000', '51000000', '手数料収益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51006, 'JPN-BASE', 'OTHER_REVENUE', '51060000', '51000000', 'その他営業外収益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51007, 'JPN-BASE', 'OTHER_REVENUE', '51070000', '51000000', '支払割引費科目', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51008, 'JPN-BASE', 'OTHER_REVENUE', '51080000', '51000000', '許可割引料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51009, 'JPN-BASE', 'OTHER_REVENUE', '51090000', '51000000', '現金出納帳受取', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51010, 'JPN-BASE', 'OTHER_REVENUE', '51100000', '51000000', '未実現利益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51011, 'JPN-BASE', 'OTHER_REVENUE', '51110000', '51000000', '実現利益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51012, 'JPN-BASE', 'OTHER_REVENUE', '51120000', '51000000', '雑収入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52000, 'JPN-BASE', 'OTHER_EXPENSES', '52000000', '0', '営業外費用', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52001, 'JPN-BASE', 'OTHER_EXPENSES', '52010000', '52000000', '支払利息', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52002, 'JPN-BASE', 'OTHER_EXPENSES', '52020000', '52000000', '銀行再評価損', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52003, 'JPN-BASE', 'OTHER_EXPENSES', '52030000', '52000000', '銀行決済損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52004, 'JPN-BASE', 'OTHER_EXPENSES', '52040000', '52000000', '手数料経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52005, 'JPN-BASE', 'OTHER_EXPENSES', '52050000', '52000000', '手形売却損', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52006, 'JPN-BASE', 'OTHER_EXPENSES', '52060000', '52000000', 'その他営業外費用', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52007, 'JPN-BASE', 'OTHER_EXPENSES', '52070000', '52000000', '支払割引売上科目', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52008, 'JPN-BASE', 'OTHER_EXPENSES', '52080000', '52000000', '受取割引料', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52009, 'JPN-BASE', 'OTHER_EXPENSES', '52090000', '52000000', '貸倒損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52010, 'JPN-BASE', 'OTHER_EXPENSES', '52100000', '52000000', '現金出納帳経費', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52011, 'JPN-BASE', 'OTHER_EXPENSES', '52110000', '52000000', '未実現損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52012, 'JPN-BASE', 'OTHER_EXPENSES', '52120000', '52000000', '実現損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52013, 'JPN-BASE', 'OTHER_EXPENSES', '52130000', '52000000', '雑損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52014, 'JPN-BASE', 'OTHER_EXPENSES', '52140000', '52000000', '営業外配賦額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61000, 'JPN-BASE', 'EXTRAORDINALY_REVENUE', '61000000', '0', '特別利益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61001, 'JPN-BASE', 'EXTRAORDINALY_REVENUE', '61100000', '61000000', '固定資産売却益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61002, 'JPN-BASE', 'EXTRAORDINALY_REVENUE', '61200000', '61000000', '貸倒引当金戻入', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61003, 'JPN-BASE', 'EXTRAORDINALY_REVENUE', '61300000', '61000000', 'その他特別利益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61004, 'JPN-BASE', 'EXTRAORDINALY_REVENUE', '61400000', '61000000', '前期損益修正益', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62000, 'JPN-BASE', 'EXTRAORDINALY_EXPENSES', '62000000', '0', '特別損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62001, 'JPN-BASE', 'EXTRAORDINALY_EXPENSES', '62100000', '62000000', '固定資産売却除却損', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62002, 'JPN-BASE', 'EXTRAORDINALY_EXPENSES', '62200000', '62000000', 'その他特別損失', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62003, 'JPN-BASE', 'EXTRAORDINALY_EXPENSES', '62300000', '62000000', '前期損益修正損', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71100, 'JPN-BASE', 'INCOME_TAXES', '71100000', '0', '法人税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71101, 'JPN-BASE', 'INCOME_TAXES', '71110000', '71100000', '法人税等', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71102, 'JPN-BASE', 'INCOME_TAXES', '71120000', '71100000', '法人税等調整額', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81101, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81101000', '0', 'デフォルト勘定科目', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81102, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81102000', '0', '貸借不一致仮勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81103, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81103000', '0', 'エラー仮勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81104, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81104000', '0', '通貨貸借不一致仮勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81105, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81105000', '0', '損益勘定', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81106, 'JPN-BASE', 'OTHER_INCOME_EXPENSES', '81106000', '0', '購入価格差異相殺', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82101, 'JPN-BASE', 'MEMO', '82100000', '0', 'コミッション相殺', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82102, 'JPN-BASE', 'MEMO', '82200000', '0', '販売コミッション相殺', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82103, 'JPN-BASE', 'MEMO', '99999999', '0', '諸口', 1);
