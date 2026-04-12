-- Script de limpieza quirúrgica para entorno de test de Dolibarr
-- Mantiene configuración, usuarios y tokens. Borra datos transaccionales.

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Terceros y Contactos
TRUNCATE TABLE llx_societe;
TRUNCATE TABLE llx_socpeople;
TRUNCATE TABLE llx_societe_rib;
TRUNCATE TABLE llx_societe_commerciaux;
TRUNCATE TABLE llx_categorie_societe;

-- 2. Presupuestos (Proposals)
TRUNCATE TABLE llx_propal;
TRUNCATE TABLE llx_propaldet;
TRUNCATE TABLE llx_propal_extrafields;

-- 3. Pedidos de Clientes (Orders)
TRUNCATE TABLE llx_commande;
TRUNCATE TABLE llx_commandedet;
TRUNCATE TABLE llx_commande_extrafields;

-- 4. Facturas de Clientes (Invoices)
TRUNCATE TABLE llx_facture;
TRUNCATE TABLE llx_facturedet;
TRUNCATE TABLE llx_facture_extrafields;
TRUNCATE TABLE llx_paiement;
TRUNCATE TABLE llx_paiement_facture;

-- 5. Proyectos (Projects)
TRUNCATE TABLE llx_projet;
TRUNCATE TABLE llx_projet_task;
TRUNCATE TABLE llx_projet_task_time;

-- 6. Eventos / Agenda (Events)
TRUNCATE TABLE llx_actioncomm;

-- 7. Proveedores (Supplier Invoices/Orders)
TRUNCATE TABLE llx_commande_fournisseur;
TRUNCATE TABLE llx_commande_fournisseurdet;
TRUNCATE TABLE llx_facture_fourn;
TRUNCATE TABLE llx_facture_fourn_det;
TRUNCATE TABLE llx_paiementfourn;
TRUNCATE TABLE llx_paiementfourn_facturefourn;

-- 8. Productos y Categorías
TRUNCATE TABLE llx_product;
TRUNCATE TABLE llx_product_price;
TRUNCATE TABLE llx_categorie_product;

SET FOREIGN_KEY_CHECKS = 1;
