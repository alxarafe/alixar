-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2010 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2021      Udo Tamm             <dev@dolibit.de>
--
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

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- Types de charges 
--

-- INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code) VALUES (id of country, id of social charges = fk_pays id & free numbering, label, ...);

--
-- France
--
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 1, 'Securite sociale (URSSAF / MSA)', 1, 1, 'TAXSECU');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 2, 'Securite sociale des indépendants (URSSAF)', 1, 1, 'TAXSSI');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 10, 'Taxe apprentissage', 1, 1, 'TAXAPP');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 11, 'Formation professionnelle continue', 1, 1, 'TAXFPC');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 12, 'Cotisation fonciere des entreprises (CFE)', 1, 1, 'TAXCFE');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 13, 'Cotisation sur la valeur ajoutee des entreprises (CVAE)', 1, 1, 'TAXCVAE');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 20, 'Taxe fonciere', 1, 1, 'TAXFON');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 25, 'Prelevement à la source (PAS)', 0, 1, 'TAXPAS');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 30, 'Prevoyance', 1, 1, 'TAXPREV');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 40, 'Mutuelle', 1, 1, 'TAXMUT');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 50, 'Retraite', 1, 1, 'TAXRET');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 60, 'Taxe sur vehicule societe (TVS)', 0, 1, 'TAXTVS');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (1, 70, 'impôts sur les sociétés (IS)', 0, 1, 'TAXIS');

--
-- Belgique
--
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (2, 201, 'ONSS', 1, 1, 'TAXBEONSS');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (2, 210, 'Precompte professionnel', 1, 1, 'TAXBEPREPRO');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (2, 220, 'Prime existence', 1, 1, 'TAXBEPRIEXI');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (2, 230, 'Precompte immobilier', 1, 1, 'TAXBEPREIMMO');

--
-- Austria
--
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4101, 'Krankenversicherung', 1, 1, 'TAXATKV');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4102, 'Unfallversicherung', 1, 1, 'TAXATUV');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4103, 'Pensionsversicherung', 1, 1, 'TAXATPV');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4104, 'Arbeitslosenversicherung', 1, 1, 'TAXATAV');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4105, 'Insolvenzentgeltsicherungsfond', 1, 1, 'TAXATIESG');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4106, 'Wohnbauförderung', 1, 1, 'TAXATWF');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4107, 'Arbeiterkammerumlage', 1, 1, 'TAXATAK');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4108, 'Mitarbeitervorsorgekasse', 1, 1, 'TAXATMVK');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (41, 4109, 'Familienlastenausgleichsfond', 1, 1, 'TAXATFLAF');

--
-- Greece
--
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10201, 'Αναλυτική Περιοδική Δήλωση (ΑΠΔ)', 1, 1, 'ΑΠΔ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10202, 'Φόρος Μισθωτών Υπηρεσιών (ΦΜΥ)', 1, 1, 'ΦΜΥ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10203, 'Ασφαλιστικές εισφορές (ΕΦΚΑ)', 1, 1, 'ΕΦΚΑ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10204, 'Προκαταβολή Φόρου Εισοδήματος', 0, 1, 'ΕΦΟΡΙΑ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10205, 'Ενιαίος Φόρος Ιδιοκτησίας Ακινήτων (ΕΝ.Φ.Ι.Α) ', 0, 1, 'ΕΝΦΙΑ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10206, 'Ετήσιο τέλος διατήρησης Μερίδας στο Γ.Ε.ΜΗ.', 1, 1, 'ΓΕΜΗ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10207, 'Επαγγελματικό Επιμελητήριο', 1, 1, 'ΕΕ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10208, 'Εμπορικό και Βιομηχανικό Επιμελητηρίο', 1, 1, 'ΕΒΕ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10209, 'Τέλη Κυκλοφορίας', 1, 1, 'ΤΕΛΗ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10210, 'Ασφάλιση οχήματος', 1, 1, 'ΑΣΦΑΛΕΙΑ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10211, 'Ενοίκιο', 1, 1, 'ΕΝΟΙΚΙΟ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10212, 'Κοινόχρηστα', 1, 1, 'ΚΟΙΝΟ');
INSERT INTO llx_c_chargesociales (fk_pays, id, libelle, deductible, active, code)
VALUES (102, 10213, 'Ηλεκτροδότηση', 1, 1, 'ΡΕΥΜΑ');
