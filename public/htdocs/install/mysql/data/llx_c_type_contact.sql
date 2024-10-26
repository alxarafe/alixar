-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2021 	   Udo Tamm             <dev@dolibit.de>
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
-- Notes
--
-- Do not place a comment at the end of the line, this file is parsed when
-- of the install and all the acronyms '-' are removed.
--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- The types of contact of an element
--
-- The unique key is set on (element, source, code)
--

-- Contract / Contrat
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('contrat', 'internal', 'SALESREPSIGN', 'Commercial signataire du contrat', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('contrat', 'internal', 'SALESREPFOLL', 'Commercial suivi du contrat', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('contrat', 'external', 'BILLING', 'Contact client facturation contrat', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('contrat', 'external', 'CUSTOMER', 'Contact client suivi contrat', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('contrat', 'external', 'SALESREPSIGN', 'Contact client signataire contrat', 1);

-- Proposal / Propal
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('propal', 'internal', 'SALESREPFOLL', 'Commercial à l''origine de la propale', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('propal', 'external', 'BILLING', 'Contact client facturation propale', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('propal', 'external', 'CUSTOMER', 'Contact client suivi propale', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('propal', 'external', 'SHIPPING', 'Contact client livraison propale', 1);

-- Customer Invoice / Facture
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('facture', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('facture', 'external', 'BILLING', 'Contact client facturation', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('facture', 'external', 'SHIPPING', 'Contact client livraison', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('facture', 'external', 'SERVICE', 'Contact client prestation', 1);

-- Supplier Invoice
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('invoice_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('invoice_supplier', 'external', 'BILLING', 'Contact fournisseur facturation', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('invoice_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('invoice_supplier', 'external', 'SERVICE', 'Contact fournisseur prestation', 1);

-- Agenda
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('agenda', 'internal', 'ACTOR', 'Responsable', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('agenda', 'internal', 'GUEST', 'Guest', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('agenda', 'external', 'ACTOR', 'Responsable', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('agenda', 'external', 'GUEST', 'Guest', 1);

-- Customer Order / Commande
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('commande', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('commande', 'external', 'BILLING', 'Contact client facturation commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('commande', 'external', 'CUSTOMER', 'Contact client suivi commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('commande', 'external', 'SHIPPING', 'Contact client livraison commande', 1);

-- Intervention / Fichinter
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('fichinter', 'internal', 'INTERREPFOLL', 'Responsable suivi de l''intervention', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('fichinter', 'internal', 'INTERVENING', 'Intervenant', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('fichinter', 'external', 'BILLING', 'Contact client facturation intervention', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('fichinter', 'external', 'CUSTOMER', 'Contact client suivi de l''intervention', 1);

-- Supplier Order
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('order_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('order_supplier', 'internal', 'SHIPPING', 'Responsable réception de la commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('order_supplier', 'external', 'BILLING', 'Contact fournisseur facturation commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('order_supplier', 'external', 'CUSTOMER', 'Contact fournisseur suivi commande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('order_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison commande', 1);

-- Resource
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('dolresource', 'internal', 'USERINCHARGE', 'In charge of resource', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('dolresource', 'external', 'THIRDINCHARGE', 'In charge of resource', 1);

-- Tickets
INSERT INTO llx_c_type_contact (element, source, code, libelle, active, module)
VALUES ('ticket', 'internal', 'SUPPORTTEC', 'Utilisateur contact support', 1, NULL);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active, module)
VALUES ('ticket', 'internal', 'CONTRIBUTOR', 'Intervenant', 1, NULL);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active, module)
VALUES ('ticket', 'external', 'SUPPORTCLI', 'Contact client suivi incident', 1, NULL);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active, module)
VALUES ('ticket', 'external', 'CONTRIBUTOR', 'Intervenant', 1, NULL);

-- Projects / Projet - All project code can start with 'PROJECT'
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project', 'internal', 'PROJECTLEADER', 'Chef de Projet', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project', 'internal', 'PROJECTCONTRIBUTOR', 'Intervenant', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project', 'external', 'PROJECTLEADER', 'Chef de Projet', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project', 'external', 'PROJECTCONTRIBUTOR', 'Intervenant', 1);

-- Project Tasks - All task code can start with 'TASK'
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project_task', 'internal', 'TASKEXECUTIVE', 'Responsable', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project_task', 'internal', 'TASKCONTRIBUTOR', 'Intervenant', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project_task', 'external', 'TASKEXECUTIVE', 'Responsable', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('project_task', 'external', 'TASKCONTRIBUTOR', 'Intervenant', 1);

-- Supplier proposal
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('supplier_proposal', 'internal', 'SALESREPFOLL', 'Responsable suivi de la demande', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('supplier_proposal', 'external', 'BILLING', 'Contact fournisseur facturation', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('supplier_proposal', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('supplier_proposal', 'external', 'SERVICE', 'Contact fournisseur prestation', 1);

-- Event Organization
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('conferenceorbooth', 'internal', 'MANAGER', 'Conference or Booth manager', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('conferenceorbooth', 'external', 'SPEAKER', 'Conference Speaker', 1);
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('conferenceorbooth', 'external', 'RESPONSIBLE', 'Booth responsible', 1);

-- Thirdparty
INSERT INTO llx_c_type_contact (element, source, code, libelle, active)
VALUES ('societe', 'internal', 'SALESREPTHIRD', 'Sales Representative', 1);
