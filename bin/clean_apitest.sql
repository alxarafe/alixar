-- Script de limpieza quirúrgica para entorno de test de Dolibarr
-- Mantiene configuración, usuarios y tokens. Borra datos transaccionales.

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Terceros y Contactos
TRUNCATE TABLE llx_societe;
TRUNCATE TABLE llx_socpeople;
TRUNCATE TABLE llx_societe_rib;
TRUNCATE TABLE llx_societe_commerciaux;
TRUNCATE TABLE llx_categorie_societe;
TRUNCATE TABLE third_parties;
TRUNCATE TABLE bank_accounts;
TRUNCATE TABLE third_party_categories;
TRUNCATE TABLE third_party_category_links;
TRUNCATE TABLE third_party_representatives;
TRUNCATE TABLE contacts;
TRUNCATE TABLE contact_category_links;

-- 2. Presupuestos (Proposals)
TRUNCATE TABLE llx_propal;
TRUNCATE TABLE llx_propaldet;
TRUNCATE TABLE llx_propal_extrafields;
TRUNCATE TABLE proposals;
TRUNCATE TABLE proposal_lines;
TRUNCATE TABLE proposal_contacts;

-- 3. Pedidos de Clientes (Orders)
TRUNCATE TABLE llx_commande;
TRUNCATE TABLE llx_commandedet;
TRUNCATE TABLE llx_commande_extrafields;
TRUNCATE TABLE orders;
TRUNCATE TABLE order_lines;
TRUNCATE TABLE order_contacts;

-- 4. Facturas de Clientes (Invoices)
TRUNCATE TABLE llx_facture;
TRUNCATE TABLE llx_facturedet;
TRUNCATE TABLE llx_facture_extrafields;
TRUNCATE TABLE llx_paiement;
TRUNCATE TABLE llx_paiement_facture;
TRUNCATE TABLE invoices;
TRUNCATE TABLE invoice_lines;
TRUNCATE TABLE invoice_contacts;

-- 5. Proyectos (Projects)
TRUNCATE TABLE llx_projet;
TRUNCATE TABLE llx_projet_task;
TRUNCATE TABLE projects;
TRUNCATE TABLE project_tasks;

-- 6. Eventos / Agenda (Events)
TRUNCATE TABLE llx_actioncomm;
TRUNCATE TABLE llx_actioncomm_resources;
TRUNCATE TABLE llx_actioncomm_extrafields;
TRUNCATE TABLE events;

-- 7. Proveedores (Supplier Invoices/Orders)
TRUNCATE TABLE llx_commande_fournisseur;
TRUNCATE TABLE llx_commande_fournisseurdet;
TRUNCATE TABLE llx_facture_fourn;
TRUNCATE TABLE llx_facture_fourn_det;
TRUNCATE TABLE llx_paiementfourn;
TRUNCATE TABLE llx_paiementfourn_facturefourn;
TRUNCATE TABLE supplier_invoices;
TRUNCATE TABLE supplier_invoice_lines;
TRUNCATE TABLE supplier_orders;
TRUNCATE TABLE supplier_order_lines;

-- 8. Productos y Categorías
TRUNCATE TABLE llx_product;
TRUNCATE TABLE llx_product_price;
TRUNCATE TABLE llx_categorie_product;
TRUNCATE TABLE products;
TRUNCATE TABLE product_associations;
TRUNCATE TABLE product_supplier_prices;
TRUNCATE TABLE product_customer_prices;
TRUNCATE TABLE product_stock;
TRUNCATE TABLE product_attributes;
TRUNCATE TABLE product_variants;
TRUNCATE TABLE product_contacts;

-- 9. Finance
TRUNCATE TABLE llx_bank;
TRUNCATE TABLE llx_bank_account;
TRUNCATE TABLE treasury_bank_accounts;
TRUNCATE TABLE bank_transactions;

-- 10. Extras (Logistics, Interventions)
TRUNCATE TABLE shipments;
TRUNCATE TABLE receptions;
TRUNCATE TABLE interventions;

SET FOREIGN_KEY_CHECKS = 1;
