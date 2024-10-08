-- Copyright (C) 2023 Nick Fragoulis
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
-- !! Do not place comments at the end of the line, 
-- as this file is parsed during installation and all '--' acronyms are removed.
--
-- Note: To replace a string that is '__, 0' into an increasing number, you can use vi with comment
-- :let @a=1 | %s/__, 0/\='__, '.(@a+setreg('a',@a+1))/g
--
-- Description of charts of accounts GREECE Ε.Λ.Π. 
-- ID 1 - 460
-- ADD 1020000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 1, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '1', 0, 'Ενσώματα και άυλα μη κυκλοφορούντα (πάγια) περιουσιακά στοιχεία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 2, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '10', 1, 'Γη', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 3, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '10.01', 2, 'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 4, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '10.02', 2, 'Σωρευμένες απομειώσεις γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 5, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '11', 1, 'Διαμορφώσεις γης υποκείμενες σε απόσβεση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 6, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '11.01', 5, 'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) διαμορφώσεων γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 7, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '11.02', 5, 'Σωρευμένες αποσβέσεις διαμορφώσεων γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 8, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '11.03', 5, 'Σωρευμένες απομειώσεις διαμορφώσεων γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 9, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '12', 1, 'Κτήρια - τεχνικά έργα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 10, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '12.01', 9,
        'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) κτηρίων - τεχνικών έργων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 11, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '12.02', 9, 'Σωρευμένες αποσβέσεις κτηρίων - τεχνικών έργων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 12, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '12.03', 9, 'Σωρευμένες απομειώσεις κτηρίων - τεχνικών έργων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 13, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '13', 1, 'Μηχανολογικός εξοπλισμός', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 14, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '13.01', 13, 'Αξία κτήσης μηχανολογικού εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 15, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '13.02', 13, 'Σωρευμένες αποσβέσεις μηχανολογικού εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 16, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '13.03', 13, 'Σωρευμένες απομειώσεις μηχανολογικού εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 17, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '14', 1, 'Μεταφορικά μέσα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 18, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '14.01', 17, 'Μικτή αξία κτήσης μεταφορικών μέσων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 19, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '14.02', 17, 'Σωρευμένες αποσβέσεις μεταφορικών μέσων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 20, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '14.03', 17, 'Σωρευμένες απομειώσεις μεταφορικών μέσων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 21, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '15', 1, 'Λοιπός εξοπλισμός', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 22, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '15.01', 21, 'Μικτή αξία κτήσης εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 23, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '15.02', 21, 'Σωρευμένες αποσβέσεις εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 24, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '15.03', 21, 'Σωρευμένες απομειώσεις εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 25, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '16', 1, 'Επενδύσεις σε ακίνητα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 26, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '16.01', 25, 'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) επενδύσεων σε ακίνητα',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 27, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '16.02', 25, 'Σωρευμένες αποσβέσεις επενδύσεων σε ακίνητα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 28, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '16.03', 25, 'Σωρευμένες απομειώσεις επενδύσεων σε ακίνητα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 29, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17', 1, 'Πάγια βιολογικά περιουσιακά στοιχεία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 30, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.01', 29, 'Ζώντα ζώα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 31, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.01.01', 30, 'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 32, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.01.02', 30, 'Σωρευμένες αποσβέσεις ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 33, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.01.03', 30, 'Σωρευμένες απομειώσεις ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 34, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.02', 29, 'Δένδρα και φυτά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 35, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.02.01', 34, 'Μικτή αξία (κόστος ή αναπροσαρμοσμένη) δένδρων και φυτών',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 36, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.02.02', 34, 'Σωρευμένες αποσβέσεις δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 37, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '17.02.03', 34, 'Σωρευμένες απομειώσεις δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 38, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18', 1, 'Άυλα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 39, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.01', 38, 'Δαπάνες ανάπτυξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 40, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.01.01', 39, 'Μικτή αξία κτήσης δαπανών ανάπτυξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 41, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.01.02', 39, 'Σωρευμένες αποσβέσεις δαπανών ανάπτυξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 42, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.01.03', 39, 'Σωρευμένες απομειώσεις δαπανών ανάπτυξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 43, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.02', 38, 'Υπεραξία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 44, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.02.01', 43, 'Μικτή αξία κτήσης υπεραξίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 45, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.02.02', 43, 'Σωρευμένες αποσβέσεις υπεραξίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 46, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.02.03', 43, 'Σωρευμένες απομειώσεις υπεραξίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 47, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.03', 38, 'Λοιπά άυλα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 48, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.03.01', 47, 'Μικτή αξία κτήσης λοιπών άυλων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 49, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.03.02', 47, 'Σωρευμένες αποσβέσεις λοιπών άυλων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 50, 'Ε.Λ.Π.', 'ΠΑΓΙΑ', '18.03.03', 47, 'Σωρευμένες απομειώσεις λοιπών άυλων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 51, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '2', 0, 'Αποθέματα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 52, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20', 51, 'Εμπορεύματα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 53, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.01', 52, 'Εμπορεύματα έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 54, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.02', 52, 'Αγορές εμπορευμάτων χρήσης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 55, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.03', 52, 'Εκπτώσεις αγορών εμπορευμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 56, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.04', 52, 'Επιστροφές αγορών εμπορευμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 57, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.05', 52, 'Απομείωση εμπορευμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 58, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '20.06', 52, 'Εμπορεύματα λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 59, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '21', 51, 'Προϊόντα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 60, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '21.01', 59, 'Προϊόντα έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 61, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '21.02', 59, 'Παραγωγή χρήσης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 62, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '21.03', 59, 'Απομείωση προϊόντων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 63, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '21.04', 59, 'Προϊόντα λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 64, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22', 51, 'Βιολογικά περιουσιακά στοιχεία (κυκλοφορούντα)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 65, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01', 64, 'Ζώντα ζώα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 66, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.01', 65, 'Ζώντα ζώα έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 67, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.02', 65, 'Αγορές ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 68, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.03', 65, 'Εκπτώσεις αγορών ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 69, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.04', 65, 'Επιστροφές αγορών ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 70, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.05', 65, 'Απομείωση ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 71, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.06', 65, 'Διαφορές επιμέτρησης εύλογης αξίας ζώντων ζώων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 72, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.01.07', 65, 'Ζώντα ζώα λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 73, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02', 64, 'Δένδρα και φυτά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 74, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.01', 73, 'Δένδρα και φυτά έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 75, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.02', 73, 'Αγορές δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 76, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.03', 73, 'Εκπτώσεις αγορών δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 77, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.04', 73, 'Επιστροφές αγορών δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 78, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.05', 73, 'Απομείωση δένδρων και φυτών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 79, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.06', 73, 'Διαφορές επιμέτρησης εύλογης αξίας δένδρων και φυτών',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 80, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '22.02.07', 73, 'Δένδρα και φυτά λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 81, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '23', 51, 'Παραγωγή σε εξέλιξη', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 82, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '23.01', 81, 'Παραγωγή σε εξέλιξη έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 83, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '23.02', 81, 'Παραγωγή σε εξέλιξη λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 84, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24', 51, 'Πρώτες ύλες και υλικά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 85, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.01', 84, 'Πρώτες ύλες και υλικά έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 86, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.02', 84, 'Αγορές πρώτων υλών και υλικών χρήσης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 87, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.03', 84, 'Εκπτώσεις αγορών πρώτων υλών και υλικών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 88, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.04', 84, 'Επιστροφές αγορών πρώτων υλών και υλικών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 89, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.05', 84, 'Απομείωση πρώτων υλών και υλικών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 90, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '24.06', 84, 'Αποθέματα λήξης πρώτων υλών και υλικών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 91, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25', 51, 'Υλικά συσκευασίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 92, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.01', 91, 'Υλικά συσκευασίας έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 93, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.02', 91, 'Αγορές υλικών συσκευασίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 94, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.03', 91, 'Εκπτώσεις αγορών υλικών συσκευασίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 95, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.04', 91, 'Επιστροφές αγορών υλικών συσκευασίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 96, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.05', 91, 'Απομείωση υλικών συσκευασίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 97, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '25.06', 91, 'Υλικά συσκευασίας λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 98, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26', 51, 'Ανταλλακτικά παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 99, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.01', 98, 'Ανταλλακτικά παγίων έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 100, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.02', 98, 'Αγορές ανταλλακτικών παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 101, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.03', 98, 'Εκπτώσεις αγορών ανταλλακτικών παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 102, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.04', 98, 'Επιστροφές αγορών ανταλλακτικών παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 103, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.05', 98, 'Απομείωση ανταλλακτικών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 104, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '26.06', 98, 'Ανταλλακτικά παγίων λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 105, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27', 51, 'Λοιπά αποθέματα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 106, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.01', 105, 'Λοιπά αποθέματα έναρξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 107, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.02', 105, 'Αγορές λοιπών αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 108, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.03', 105, 'Εκπτώσεις αγορών λοιπών αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 109, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.04', 105, 'Επιστροφές αγορών λοιπών αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 110, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.05', 105, 'Απομείωση λοιπών αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 111, 'Ε.Λ.Π.', 'ΑΠΟΘΕΜΑΤΑ', '27.06', 105, 'Λοιπά αποθέματα λήξης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 112, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '3', 0, 'Χρηματοοικονομικά και λοιπά περιουσιακά στοιχεία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 113, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30', 112, 'Πελάτες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 114, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.01', 113, 'Πελάτες - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 115, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.01.01', 114,
        'Πελάτες μη συνδεδεμένες οντότητες - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 116, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.01.02', 114, 'Μη δουλευμένοι τόκοι μη συνδεδεμένων πελατών',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 117, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.01.03', 114, 'Προκαταβολές μη συνδεδεμένων πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 118, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.01.04', 114, 'Απομείωση μη συνδεδεμένων πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 119, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.02', 113, 'Πελάτες - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 120, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.02.01', 119, 'Συνδεδεμένοι πελάτες - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 121, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.02.02', 119, 'Μη δουλευμένοι τόκοι συνδεδεμένων πελατών',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 122, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.02.03', 119, 'Προκαταβολές συνδεδεμένων πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 123, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '30.02.04', 119, 'Απομείωση συνδεδεμένων πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 124, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31', 112, 'Αξιόγραφα εμπορικών απαιτήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 125, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.01', 124,
        'Αξιόγραφα εμπορικών απαιτήσεων - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 126, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.01.01', 125,
        'Αξιόγραφα εμπορικών απαιτήσεων μη συνδεδεμένων οντοτήτων - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 127, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.01.02', 125,
        'Μη δουλευμένοι τόκοι αξιογράφων εμπορικών απαιτήσεων μη συνδεδεμένων οντοτήτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 128, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.01.03', 125,
        'Απομείωση αξιογράφων εμπορικών απαιτήσεων μη συνδεδεμένων οντοτήτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 129, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.02', 124,
        'Αξιόγραφα εμπορικών απαιτήσεων - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 130, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.02.01', 129,
        'Αξιόγραφα εμπορικών απαιτήσεων συνδεδεμένων οντοτήτων - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 131, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.02.02', 129,
        'Μη δουλευμένοι τόκοι αξιογράφων εμπορικών απαιτήσεων συνδεδεμένων οντοτήτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 132, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '31.02.03', 129,
        'Απομείωση αξιογράφων εμπορικών απαιτήσεων συνδεδεμένων οντοτήτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 133, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '32', 112, 'Χορηγηθέντα δάνεια', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 134, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '32.01', 133, 'Δάνεια χορηγηθέντα σε συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 135, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '32.02', 133,
        'Δάνεια χορηγηθέντα στο προσωπικό και στη διοίκηση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 136, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '32.03', 133, 'Λοιπά χορηγηθέντα δάνεια', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 137, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '32.04', 133, 'Απομείωση χορηγηθέντων δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 138, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33', 112, 'Λοιπές απαιτήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 139, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.01', 138, 'Έσοδα από πάσης φύσεως συμμετοχές εισπρακτέα',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 140, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.01.01', 139,
        'Έσοδα από πάσης φύσεως συμμετοχές εισπρακτέα - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 141, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.01.02', 139,
        'Απομείωση - έσοδα από πάσης φύσεως συμμετοχές εισπρακτέα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 142, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.02', 138, 'Άλλες απαιτήσεις από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 143, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.02.01', 142,
        'Άλλες απαιτήσεις από συνδεδεμένες οντότητες - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 144, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.02.02', 142,
        'Απομείωση - άλλες απαιτήσεις από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 145, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.03', 138, 'Άλλες απαιτήσεις από μη συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 146, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.03.01', 145,
        'Άλλες απαιτήσεις από μη συνδεδεμένες οντότητες - ονομαστικό ποσό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 147, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.03.02', 145,
        'Απομείωση - άλλες απαιτήσεις από μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 148, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '33.04', 138, 'Εγγυήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 149, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34', 112, 'Επενδύσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 150, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.01', 149, 'Διακρατούμενες έως τη λήξη επενδύσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 151, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.01.01', 150,
        'Διακρατούμενες έως τη λήξη επενδύσεις - ονομαστική αξία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 152, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.01.02', 150,
        'Διακρατούμενες έως τη λήξη επενδύσεις - συμπληρωματικά ποσά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 153, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.01.03', 150,
        'Απομείωση διακρατούμενων έως τη λήξη επενδύσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 154, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.02', 149, 'Διαθέσιμα για πώληση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 155, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.02.01', 154, 'Διαθέσιμα για πώληση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 156, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.02.02', 154, 'Απομείωση διαθέσιμων για πώληση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 157, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '34.03', 149, 'Εμπορικό χαρτοφυλάκιο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 158, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '35', 112, 'Χρηματοοικονομικά στοιχεία για αντιστάθμιση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 159, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '35.01', 158,
        'Χρηματοοικονομικά στοιχεία για αντιστάθμιση εύλογης αξίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 160, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '35.02', 158,
        'Χρηματοοικονομικά στοιχεία για αντιστάθμιση ταμειακών ροών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 161, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36', 112, 'Συμμετοχές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 162, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.01', 161, 'Συμμετοχές σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 163, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.01.01', 162, 'Συμμετοχές σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 164, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.01.02', 162, 'Απομείωση συμμετοχών σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 165, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.02', 161, 'Συμμετοχές σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 166, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.02.01', 165, 'Συμμετοχές σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 167, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.02.02', 165, 'Απομείωση συμμετοχών σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 168, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.03', 161, 'Συμμετοχές σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 169, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.03.01', 168, 'Συμμετοχές σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 170, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '36.03.02', 168, 'Απομείωσης συμμετοχών σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 171, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37', 112, 'Προπληρωμένα έξοδα και δουλευμένα έσοδα περιόδου',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 172, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.01', 171, 'Προπληρωμένα έξοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 173, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.01.01', 172,
        'Προπληρωμένα έξοδα σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 174, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.01.02', 172, 'Προπληρωμένα έξοδα σε συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 175, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.02', 171, 'Δουλευμένα έσοδα περιόδου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 176, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.02.01', 175,
        'Δουλευμένα έσοδα περιόδου από μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 177, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '37.02.02', 175,
        'Δουλευμένα έσοδα περιόδου από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 178, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '38', 112, 'Ταμειακά διαθέσιμα και ισοδύναμα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 179, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '38.01', 178, 'Ταμείο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 180, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '38.02', 178, 'Καταθέσεις όψεως', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 181, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '38.03', 178, 'Καταθέσεις προθεσμίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 182, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '38.04', 178, 'Λοιπά ταμειακά ισοδύναμα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 183, 'Ε.Λ.Π.', 'ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΑ', '39', 112, 'Αναβαλλόμενοι φόροι ενεργητικού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 184, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '4', 0, 'Καθαρή θέση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 185, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '40', 184, 'Κεφάλαιο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 186, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '41', 184, 'Υπέρ το άρτιο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 187, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '42', 184, 'Καταθέσεις ιδιοκτητών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 188, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '43', 184, 'Ίδιοι τίτλοι', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 189, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '43.01', 188, 'Αξία κτήσης ίδιων τίτλων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 190, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '43.02', 188, 'Αποτέλεσμα (κέρδος/ζημία) από τη διάθεση ίδιων τίτλων',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 191, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '44', 184, 'Διαφορές εύλογης αξίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 192, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '44.01', 191, 'Διαφορές εύλογης αξίας ενσώματων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 193, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '44.02', 191, 'Διαφορές εύλογης αξίας διαθέσιμων για πώληση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 194, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '44.03', 191,
        'Διαφορές εύλογης αξίας στοιχείων αντιστάθμισης ταμειακών ροών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 195, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '45', 184, 'Συναλλαγματικές διαφορές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 196, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '46', 184, 'Αποθεματικά νόμων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 197, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '47', 184, 'Αφορολόγητα αποθεματικά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 198, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '48', 184, 'Αποθεματικά καταστατικού και λοιπά αποθεματικά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 199, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '48.01', 198, 'Αποθεματικά καταστατικού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 200, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '48.02', 198,
        'Προαιρετικά αποθεματικά αποφάσεων γενικής συνέλευσης ιδιοκτητών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 201, 'Ε.Λ.Π.', 'ΚΑΘΑΡΗ ΘΕΣΗ', '49', 184, 'Αποτελέσματα εις νέο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 202, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '5', 0, 'Υποχρεώσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 203, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50', 202, 'Προμηθευτές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 204, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.01', 203, 'Προμηθευτές - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 205, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.02', 203, 'Προμηθευτές - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 206, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.03', 203,
        'Προκαταβολές σε προμηθευτές - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 207, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.03.01', 206,
        'Προκαταβολές σε προμηθευτές για μη κυκλοφορούντα στοιχεία - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 208, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.03.02', 206,
        'Προκαταβολές σε προμηθευτές για αποθέματα - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 209, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.03.03', 206,
        'Λοιπές προκαταβολές σε προμηθευτές - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 210, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.04', 203, 'Προκαταβολές σε προμηθευτές - συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 211, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.04.01', 210,
        'Προκαταβολές σε προμηθευτές για μη κυκλοφορούντα στοιχεία - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 212, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.04.02', 210,
        'Προκαταβολές σε προμηθευτές για αποθέματα - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 213, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '50.04.03', 210,
        'Λοιπές προκαταβολές σε προμηθευτές - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 214, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '51', 202, 'Αξιόγραφα εμπορικών υποχρεώσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 215, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '51.01', 214,
        'Αξιόγραφα εμπορικών υποχρεώσεων - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 216, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '51.02', 214,
        'Αξιόγραφα εμπορικών υποχρεώσεων - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 217, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '52', 202, 'Τραπεζικά δάνεια', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 218, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '52.01', 217, 'Τραπεζικά δάνεια - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 219, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '52.02', 217, 'Τραπεζικά δάνεια - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 220, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53', 202, 'Λοιπές υποχρεώσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 221, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.01', 220, 'Δάνεια από μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 222, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.02', 220, 'Δάνεια από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 223, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.03', 220, 'Αποδοχές προσωπικού πληρωτέες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 224, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.04', 220, 'Υποχρεώσεις προς ιδιοκτήτες και διευθυντικό προσωπικό',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 225, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.05', 220,
        'Μερίσματα, προμερίσματα και άλλα ποσά συναφούς φύσης πληρωτέα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 226, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.06', 220, 'Άλλες υποχρεώσεις προς μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 227, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '53.07', 220, 'Άλλες υποχρεώσεις προς συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 228, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54', 202, 'Υποχρεώσεις από φόρους και τέλη', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 229, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.01', 228, 'Φόρος εισοδήματος πληρωτέος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 230, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.01.01', 229, 'Φόρος εισοδήματος ετήσιας δήλωσης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 231, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.01.02', 229,
        'Παρακρατούμενος φόρος εισοδήματος της οντότητας (αντίθετος)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 232, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.01.03', 229, 'Προκαταβολή φόρου εισοδήματος (αντίθετος)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 233, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.02', 228, 'Φόρος προστιθέμενης αξίας (ΦΠΑ)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 234, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.02.01', 233, 'ΦΠΑ εκροών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 235, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.02.02', 233, 'ΦΠΑ εισροών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 236, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.02.03', 233, 'Καταβληθείς ΦΠΑ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 237, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.03', 228, 'Παρακρατούμενοι φόροι εισοδήματος τρίτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 238, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.03.01', 237,
        'Παρακρατούμενος φόρος από μισθωτή εργασία και συντάξεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 239, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.03.02', 237,
        'Παρακρατούμενος φόρος από επιχειρηματική δραστηριότητα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 240, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.03.03', 237, 'Παρακρατούμενος φόρος διανεμομένων μερισμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 241, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.03.04', 237, 'Λοιποί παρακρατούμενοι φόροι εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 242, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.04', 228, 'Τέλη χαρτοσήμου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 243, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '54.05', 228, 'Λοιποί φόροι, τέλη και εισφορές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 244, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '55', 202, 'Υποχρεώσεις σε ασφαλιστικούς οργανισμούς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 245, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '55.01', 244,
        'Υποχρεώσεις σε ασφαλιστικούς οργανισμούς κύριας ασφάλισης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 246, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '55.02', 244,
        'Υποχρεώσεις σε ασφαλιστικούς οργανισμούς επικουρικής ασφάλισης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 247, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56', 202, 'Δουλευμένα έξοδα και έσοδα επομένων χρήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 248, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.01', 247, 'Έξοδα χρήσεως δουλευμένα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 249, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.01.01', 248,
        'Έξοδα χρήσεως δουλευμένα - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 250, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.01.02', 248, 'Έξοδα χρήσεως δουλευμένα - συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 251, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.02', 247, 'Έσοδα επόμενων χρήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 252, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.02.01', 251, 'Έσοδα επόμενων χρήσεων - μη συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 253, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '56.02.02', 251, 'Έσοδα επόμενων χρήσεων - συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 254, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57', 202, 'Προβλέψεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 255, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.01', 254, 'Προβλέψεις για παροχές σε εργαζομένους', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 256, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02', 254, 'Λοιπές προβλέψεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 257, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02.01', 256, 'Προβλέψεις για εκκρεμοδικίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 258, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02.02', 256, 'Προβλέψεις για δοσμένες εγγυήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 259, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02.03', 256, 'Προβλέψεις για αποκατάσταση περιβάλλοντος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 260, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02.04', 256, 'Προβλέψεις για διαφορές φορολογικού ελέγχου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 261, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.02.05', 256, 'Άλλες προβλέψεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 262, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '57.03', 254, 'Προβλέψεις για συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 263, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '58', 202, 'Κρατικές επιχορηγήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 264, 'Ε.Λ.Π.', 'ΥΠΟΧΡΕΩΣΕΙΣ', '59', 202, 'Αναβαλλόμενοι φόροι παθητικού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 265, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '6', 0, 'Έξοδα και ζημιές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 266, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60', 265, 'Παροχές σε εργαζόμενους', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 267, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60.01', 266, 'Μικτές αποδοχές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 268, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60.02', 266, 'Εργοδοτικές εισφορές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 269, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60.03', 266, 'Λοιπές παροχές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 270, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60.04', 266,
        'Προβλέψεις για παροχές μετά την έξοδο από την υπηρεσία (καθαρό ποσό)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 271, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '60.05', 266, 'Παροχές σε εργαζόμενους σε συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 272, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61', 265, 'Ζημιές επιμέτρησης περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 273, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.01', 272, 'Απομείωση ενσώματων παγίων (πλην βιολογικών)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 274, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.02', 272, 'Απομείωση βιολογικών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 275, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.03', 272, 'Απομείωση άυλων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 276, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.04', 272, 'Απομείωση αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 277, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05', 272, 'Απομείωση χρηματοοικονομιικών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 278, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.01', 277, 'Απομείωση πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 279, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.02', 277, 'Απομείωση αξιογράφων εμπορικών απαιτήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 280, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.03', 277,
        'Απομείωση διακρατούμενων μέχρι τη λήξη επενδύσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 281, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.04', 277, 'Απομείωση συμμετοχών σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 282, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.05', 277, 'Απομείωση συμμετοχών σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 283, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.05.06', 277, 'Απομείωση συμμετοχών σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 284, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.06', 272, 'Απομείωση λοιπών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 285, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.07', 272, 'Ζημίες από επιμέτρηση στην εύλογη αξία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 286, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.07.01', 285, 'Ζημιές εύλογης αξίας ενσώματων πάγιων στοιχείων',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 287, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.07.02', 285,
        'Ζημιές εύλογης αξίας βιολογικών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 288, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '61.07.03', 285,
        'Ζημιές εύλογης αξίας χρηματοοικονομικών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 289, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62', 265, 'Χρεωστικές συναλλαγματικές διαφορές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 290, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.01', 289,
        'Χρεωστικές συναλλαγματικές διαφορές από διακανονισμό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 291, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.01.01', 290,
        'Χρεωστικές συν/τικές διαφορές διακανονισμού εμπορικών απαιτήσεων και υποχρεώσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 292, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.01.02', 290,
        'Χρεωστικές συν/τικές διαφορές διακανονισμού δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 293, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.01.03', 290,
        'Χρεωστικές συν/τικές διαφορές διακανονισμού λοιπών στοιχείων ισολογισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 294, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.02', 289, 'Χρεωστικές συναλλαγματικές διαφορές επιμέτρησης',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 295, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.02.01', 294,
        'Χρεωστικές συν/τικές διαφορές επιμέτρησης εμπορικών απαιτήσεων και υποχρεώσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 296, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.02.02', 294,
        'Χρεωστικές συν/τικές διαφορές επιμέτρησης δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 297, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '62.02.03', 294,
        'Χρεωστικές συν/τικές διαφορές επιμέτρησης λοιπών στοιχείων ισολογισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 298, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '63', 265,
        'Ζημιές από διάθεση-απόσυρση μη κυκλοφορούντων περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 299, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '63.01', 298, 'Ζημιές από διάθεση-απόσυρση ενσώματων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 300, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '63.02', 298, 'Ζημιές από διάθεση-απόσυρση άυλων πάγιων στοιχείων',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 301, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '63.03', 298, 'Ζημιές από διάθεση χρηματοοικονομικών στοιχείων',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 302, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '63.04', 298,
        'Ζημιές από διάθεση - απόσυρση περιουσιακών στοιχείων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 303, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64', 265, 'Διάφορα λειτουργικά έξοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 304, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.01', 303, 'Αμοιβές για υπηρεσίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 305, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.01.01', 304,
        'Αμοιβές για υπηρεσίες - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 306, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.01.02', 304, 'Αμοιβές για υπηρεσίες - συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 307, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.02', 303, 'Ενέργεια', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 308, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.03', 303, 'Ύδρευση', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 309, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.04', 303, 'Τηλεπικοινωνίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 310, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.05', 303, 'Ενοίκια', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 311, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.05.01', 310, 'Ενοίκια - μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 312, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.05.02', 310, 'Ενοίκια - συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 313, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.06', 303, 'Ασφάλιστρα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 314, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.07', 303, 'Μεταφορικά', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 315, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.08', 303, 'Αναλώσιμα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 316, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.09', 303, 'Επισκευές και συντηρήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 317, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.10', 303, 'Διαφήμιση και προβολή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 318, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.11', 303, 'Φόροι και τέλη (πλην φόρου εισοδήματος)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 319, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.12', 303, 'Λοιπά έξοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 320, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '64.13', 303,
        'Διάφορα λειτουργικά έξοδα από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 321, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65', 265, 'Χρεωστικοί τόκοι και συναφή έξοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 322, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65.01', 321, 'Τόκοι τραπεζικών δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 323, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65.02', 321, 'Τόκοι δανείων από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 324, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65.03', 321, 'Τόκοι λοιπών δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 325, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65.04', 321, 'Τόκοι λοιπών υποχρεώσεων και προβλέψεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 326, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '65.05', 321, 'Λοιπά χρηματοοικονομικά έξοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 327, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66', 265, 'Αποσβέσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 328, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.01', 327, 'Αποσβέσεις διαμορφώσεων γης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 329, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.02', 327, 'Αποσβέσεις κτηρίων - τεχνικών έργων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 330, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.03', 327, 'Αποσβέσεις μηχανολογικού εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 331, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.04', 327, 'Αποσβέσεις μεταφορικών μέσων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 332, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.05', 327, 'Αποσβέσεις λοιπού εξοπλισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 333, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.06', 327, 'Αποσβέσεις επενδύσεων σε ακίνητα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 334, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.07', 327,
        'Αποσβέσεις πάγιων βιολογικών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 335, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '66.08', 327, 'Αποσβέσεις άυλων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 336, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67', 265, 'Ασυνήθη έξοδα, ζημιές και πρόστιμα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 337, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67.01', 336, 'Ζημιές φυσικών καταστροφών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 338, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67.02', 336, 'Ζημιές άλλων καταστροφών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 339, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67.03', 336, 'Άλλα ασυνήθη έξοδα και ζημίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 340, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67.04', 336, 'Πρόστιμα, προσαυξήσεις και ποινές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 341, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '67.05', 336,
        'Ασυνήθη έξοδα και ζημιές από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 342, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68', 265, 'Προβλέψεις (εκτός από προβλέψεις για το προσωπικό)',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 343, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.01', 342, 'Προβλέψεις για εκκρεμοδικίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 344, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.02', 342, 'Προβλέψεις για δοσμένες εγγυήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 345, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.03', 342, 'Προβλέψεις για αποκατάσταση περιβάλλοντος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 346, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.04', 342,
        'Προβλέψεις για διαφορές φορολογικού ελέγχου πλην φόρου εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 347, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.05', 342, 'Άλλες προβλέψεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 348, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '68.06', 342, 'Προβλέψεις για συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 349, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '69', 265, 'Φόρος εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 350, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '69.01', 349, 'Τρέχων φόρος (έξοδο) περιόδου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 351, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '69.02', 349, 'Αναβαλλόμενος φόρος (έξοδο) περιόδου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 352, 'Ε.Λ.Π.', 'ΕΞΟΔΑ & ΖΗΜΙΕΣ', '69.03', 349,
        'Προβλέψεις για διαφορές φορολογικού ελέγχου φόρου εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 353, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '7', 0, 'Έσοδα και κέρδη', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 354, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70', 353, 'Πωλήσεις αγαθών και υπηρεσιών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 355, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.01', 354,
        'Πωλήσεις εμπορευμάτων (καθαρές) σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 356, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.01.01', 355,
        'Πωλήσεις εμπορευμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 357, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.01.02', 355,
        'Επιστροφές πωλήσεων εμπορευμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 358, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.01.03', 355,
        'Εκπτώσεις πωλήσεων εμπορευμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 359, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.02', 354,
        'Πωλήσεις εμπορευμάτων (καθαρές) σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 360, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.02.01', 359, 'Πωλήσεις εμπορευμάτων σε συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 361, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.02.02', 359,
        'Επιστροφές πωλήσεων εμπορευμάτων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 362, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.02.03', 359,
        'Εκπτώσεις πωλήσεων εμπορευμάτων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 363, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.03', 354,
        'Πωλήσεις προϊόντων έτοιμων και ημιτελών (καθαρές) σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 364, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.03.01', 363,
        'Πωλήσεις προϊόντων έτοιμων και ημιτελών σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 365, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.03.02', 363,
        'Επιστροφές πωλήσεων προϊόντων έτοιμων και ημιτελών σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 366, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.03.03', 363,
        'Εκπτώσεις πωλήσεων προϊόντων έτοιμων και ημιτελών σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 367, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.04', 354,
        'Πωλήσεις προϊόντων έτοιμων και ημιτελών (καθαρές) σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 368, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.04.01', 367,
        'Πωλήσεις προϊόντων έτοιμων και ημιτελών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 369, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.04.02', 367,
        'Επιστροφές πωλήσεων προϊόντων έτοιμων και ημιτελών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 370, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.04.03', 367,
        'Εκπτώσεις πωλήσεων προϊόντων έτοιμων και ημιτελών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 371, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.05', 354,
        'Πωλήσεις λοιπών αποθεμάτων (καθαρές) σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 372, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.05.01', 371,
        'Πωλήσεις λοιπών αποθεμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 373, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.05.02', 371,
        'Επιστροφές πωλήσεων λοιπών αποθεμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 374, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.05.03', 371,
        'Εκπτώσεις πωλήσεων λοιπών αποθεμάτων σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 375, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.06', 354,
        'Πωλήσεις λοιπών αποθεμάτων (καθαρές) σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 376, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.06.01', 375,
        'Πωλήσεις λοιπών αποθεμάτων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 377, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.06.02', 375,
        'Επιστροφές πωλήσεων λοιπών αποθεμάτων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 378, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.06.03', 375,
        'Εκπτώσεις πωλήσεων λοιπών αποθεμάτων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 379, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.07', 354,
        'Πωλήσεις υπηρεσιών (καθαρές) σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 380, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.07.01', 379, 'Πωλήσεις υπηρεσιών σε μη συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 381, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.07.02', 379,
        'Επιστροφές πωλήσεων υπηρεσιών σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 382, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.07.03', 379,
        'Εκπτώσεις πωλήσεων υπηρεσιών σε μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 383, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.08', 354,
        'Πωλήσεις υπηρεσιών (καθαρές) σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 384, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.08.01', 383, 'Πωλήσεις υπηρεσιών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 385, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.08.02', 383,
        'Επιστροφές πωλήσεων υπηρεσιών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 386, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '70.08.03', 383,
        'Εκπτώσεις πωλήσεων υπηρεσιών σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 387, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71', 353, 'Λοιπά συνήθη έσοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 388, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71.01', 387, 'Αποσβέσεις επιχορηγήσεων παγίων στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 389, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71.02', 387, 'Επιχορηγήσεις τόκων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 390, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71.03', 387, 'Επιχορηγήσεις λοιπών εξόδων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 391, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71.04', 387, 'Άλλα λειτουργικά έσοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 392, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '71.05', 387, 'Άλλα λειτουργικά έσοδα από συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 393, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '72', 353, 'Πιστωτικοί τόκοι και συναφή έσοδα', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 394, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '72.01', 393, 'Πιστωτικοί τόκοι πωλήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 395, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '72.02', 393, 'Πιστωτικοί τόκοι δανείων και απαιτήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 396, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '72.03', 393, 'Πιστωτικοί τόκοι από συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 397, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '72.04', 393, 'Πιστωτικοί τόκοι άλλων επενδύσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 398, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73', 353, 'Πιστωτικές συναλλαγματικές διαφορές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 399, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.01', 398,
        'Πιστωτικές συναλλαγματικές διαφορές από διακανονισμό', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 400, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.01.01', 399,
        'Πιστωτικές συν/τικές διαφορές διακανονισμού εμπορικών απαιτήσεων και υποχρ/σεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 401, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.01.02', 399,
        'Πιστωτικές συν/τικές διαφορές διακανονισμού δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 402, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.01.03', 399,
        'Πιστωτικές συν/τικές διαφορές διακανονισμού λοιπών στοιχείων ισολογισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 403, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.02', 398, 'Πιστωτικές συναλλαγματικές διαφορές επιμέτρησης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 404, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.02.01', 403,
        'Πιστωτικές συν/τικές διαφορές επιμέτρησης εμπορικών απαιτήσεων και υποχρεώσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 405, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.02.02', 403,
        'Πιστωτικές συν/τικές διαφορές επιμέτρησης δανείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 406, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '73.02.03', 403,
        'Πιστωτικές συν/τικές διαφορές επιμέτρησης λοιπών στοιχείων ισολογισμού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 407, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '74', 353, 'Έσοδα συμμετοχών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 408, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '74.01', 407, 'Μερίσματα από συμμετοχές σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 409, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '74.02', 407, 'Μερίσματα από συμμετοχές σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 410, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '74.03', 407, 'Μερίσματα από συμμετοχές σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 411, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '74.04', 407, 'Μερίσματα από λοιπούς συμμετοχικούς τίτλους', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 412, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '75', 353,
        'Κέρδη από διάθεση μη κυκλοφορούντων περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 413, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '75.01', 412, 'Κέρδη από διάθεση ενσώματων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 414, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '75.02', 412, 'Κέρδη από διάθεση άυλων πάγιων στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 415, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '75.03', 412, 'Κέρδη από διάθεση χρηματοοικονομικών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 416, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '75.04', 412,
        'Κέρδη από διάθεση μη κυκλοφορούντων περιουσιακών στοιχείων σε συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 417, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76', 353, 'Κέρδη από αναστροφή προβλέψεων και απομειώσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 418, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.01', 417, 'Κέρδη από αναστροφή προβλέψεων για εκκρεμοδικίες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 419, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.02', 417,
        'Κέρδη από αναστροφή προβλέψεων για δοσμένες εγγυήσεις', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 420, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.03', 417,
        'Κέρδη από αναστροφή προβλέψεων για αποκατάσταση περιβάλλοντος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 421, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.04', 417,
        'Κέρδη από αναστροφή προβλέψεων για διαφορές φορολογικού ελέγχου πλην φόρου εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 422, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.05', 417, 'Κέρδη από αναστροφή άλλων προβλέψεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 423, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.06', 417,
        'Κέρδη από αναστροφή απομείωσης ενσώματων παγίων (πλην βιολογικών)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 424, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.07', 417,
        'Κέρδη από αναστροφή απομείωσης βιολογικών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 425, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.08', 417, 'Κέρδη από αναστροφή απομείωσης άυλων παγίων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 426, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.09', 417, 'Κέρδη από αναστροφή απομείωσης αποθεμάτων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 427, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10', 417,
        'Κέρδη από αναστροφή απομείωσης χρηματοοικονομιικών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 428, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.01', 427, 'Κέρδη από αναστροφή απομείωσης πελατών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 429, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.02', 427,
        'Κέρδη από αναστροφή απομείωσης αξιογράφων εμπορικών απαιτήσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 430, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.03', 427,
        'Κέρδη από αναστροφή απομείωσης διακρατούμενων μέχρι τη λήξη επενδύσεων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 431, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.04', 427,
        'Κέρδη από αναστροφή απομείωσης συμμετοχών σε θυγατρικές', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 432, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.05', 427,
        'Κέρδη από αναστροφή απομείωσης συμμετοχών σε συγγενείς', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 433, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.10.06', 427,
        'Κέρδη από αναστροφή απομείωσης συμμετοχών σε κοινοπραξίες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 434, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '76.11', 417,
        'Κέρδη από αναστροφή απομείωσης λοιπών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 435, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '77', 353, 'Κέρδη από επιμέτρηση στην εύλογη αξία', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 436, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '77.01', 435, 'Κέρδη εύλογης αξίας ενσώματων πάγιων στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 437, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '77.02', 435,
        'Κέρδη εύλογης αξίας βιολογικών περιουσιακών στοιχείων', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 438, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '77.03', 435, 'Κέρδη εύλογης αξίας χρηματοοικονομικών στοιχείων',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 439, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '78', 353, 'Φόρος εισοδήματος έσοδο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 440, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '78.01', 439, 'Τρέχων φόρος περιόδου έσοδο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 441, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '78.02', 439, 'Αναβαλλόμενος φόρος περιόδου έσοδο', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 442, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '78.03', 439,
        'Κέρδη από αναστροφή προβλέψεων για διαφορές φορολογικού ελέγχου φόρου εισοδήματος', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 443, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '79', 353, 'Ασυνήθη έσοδα και κέρδη', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 444, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '79.01', 443,
        'Ασυνήθη έσοδα και κέρδη από μη συνδεδεμένες οντότητες', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 445, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '79.02', 443, 'Ασυνήθη έσοδα και κέρδη από συνδεδεμένες οντότητες',
        1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 446, 'Ε.Λ.Π.', 'ΕΣΟΔΑ & ΚΕΡΔΗ', '79.03', 443, 'Κέρδος από αγορά οντότητας σε τιμή ευκαιρίας', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 447, 'Ε.Λ.Π.', 'ΑΛΛΑ', '8', 0, 'Ιδιοπαραγωγή, υποκαταστήματα και αποτελέσματα περιόδου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 448, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80', 447, 'Έξοδα σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 449, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80.01', 448, 'Παροχές σε εργαζόμενους σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 450, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80.02', 448, 'Αποσβέσεις σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 451, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80.03', 448, 'Άλλα λειτουργικά έξοδα σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 452, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80.04', 448, 'Χρηματοοικονομικά έξοδα σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 453, 'Ε.Λ.Π.', 'ΑΛΛΑ', '80.05', 448, 'Προβλέψεις σε ιδιοπαραγωγή', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 454, 'Ε.Λ.Π.', 'ΑΛΛΑ', '81', 447,
        'Δοσοληπτικοί λογαριασμοί υποκαταστημάτων αυτοτελούς παρακολούθησης', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 455, 'Ε.Λ.Π.', 'ΑΛΛΑ', '81.01', 454,
        'Χρεωστικοί δοσοληπτικοί λογαριασμοί υποκαταστημάτων / κεντρικού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 456, 'Ε.Λ.Π.', 'ΑΛΛΑ', '81.02', 454,
        'Πιστωτικοί δοσοληπτικοί λογαριασμοί υποκαταστημάτων / κεντρικού', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 457, 'Ε.Λ.Π.', 'ΑΛΛΑ', '82', 447, 'Αποτέλεσμα (κέρδη ή ζημίες) περιόδου', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 458, 'Ε.Λ.Π.', 'ΑΛΛΑ', '82.01', 457, 'Συγκέντρωση αποτελεσματικών λογαριασμών', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 459, 'Ε.Λ.Π.', 'ΑΛΛΑ', '82.02', 457, 'Καθαρό κέρδος περιόδου (μετά από φόρους)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ENTITY__, 460, 'Ε.Λ.Π.', 'ΑΛΛΑ', '82.03', 457, 'Καθαρή ζημία περιόδου (μετά από φόρους)', 1);
