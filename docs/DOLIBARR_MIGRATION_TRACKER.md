# Dolibarr ➜ Alixar: Migration Table Tracker

Este documento es una lista exhaustiva de las tablas legacy de Dolibarr. Conforme avancemos con el patrón *Strangler Fig*, marcaremos cada tabla como "Migrada" y documentaremos qué Plugin de Alixar ahora es responsable de su dominio y qué Adaptador de `dolibarr-compat` la gestiona.

## 🟢 CRM (Customer Relationship Management)
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ✅ | `llx_socpeople` | `Plugin\Crm\...\Contact` | `DolibarrMysqlContactRepository` |
| ✅ | `llx_categorie_contact`| `Plugin\Crm\...\CategoryLink` | `DolibarrMysqlContactCategoryRepository` |
| ✅ | `llx_actioncomm` | `Plugin\Crm\...\Event` | `DolibarrMysqlEventRepository` |

## 🟣 Business Foundation / Soporte Empresarial
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ✅ | `llx_societe` | `Plugin\Business\...\ThirdParty` | `DolibarrMysqlThirdPartyRepository` |
| ✅ | `llx_societe_rib` | `Plugin\Business\...\BankAccount` | `MysqlBankAccountRepository` |
| ✅ | `llx_categorie` | `Plugin\Business\...\Category` | `DolibarrMysqlCategoryRepository` |
| ✅ | `llx_categorie_societe`| `Plugin\Business\...\CategoryLink` | `DolibarrMysqlThirdPartyCategoryRepository` |

## 🔵 Core / Base
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ✅ | `llx_societe_extrafields` | `Core\Domain\CustomField` | `DolibarrExtrafieldsAdapter` (genérico para **todas** las `_extrafields`) |
| ✅ | `llx_const` | `Core\Configuration` | Adaptador implementado en Fases Previas. |
| ✅ | `llx_menu` | `Core\Menu` | `MysqlLegacyDolibarrMenuAdapter` (en `dolibarr-compat`). |
| N/A | `llx_user` | — | Alixar usa tabla propia `users` (no hereda de Dolibarr). |
| N/A | `llx_user_rights` | — | Alixar usa tablas propias `roles` + `permissions`. |

## 🟤 Datos de Referencia (compartidos por CRM, Trading, RRHH...)
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ⏳ | `llx_c_country` | Plugin compartido (Geo/Ref) | Diccionario de países. Lo consume CRM, Trading, etc. |
| ⏳ | `llx_c_regions` | Plugin compartido (Geo/Ref) | Diccionario de regiones. Lo consume CRM, Trading, etc. |

## 🟣 Commercial / Trading (Facturación, Presupuestos, Pedidos)
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ✅ | `llx_propal` | `Plugin\Trading\...\Proposal` | `DolibarrMysqlProposalRepository` |
| ✅ | `llx_propaldet` | `Plugin\Trading\...\ProposalLine`| `DolibarrMysqlProposalRepository` (incluido) |
| ✅ | `llx_commande` | `Plugin\Trading\...\Order` | `DolibarrMysqlOrderRepository` |
| ✅ | `llx_commandedet` | `Plugin\Trading\...\OrderLine` | `DolibarrMysqlOrderRepository` (incluido) |
| ✅ | `llx_facture` | `Plugin\Trading\...\Invoice` | `DolibarrMysqlInvoiceRepository` |
| ✅ | `llx_facturedet` | `Plugin\Trading\...\InvoiceLine` | `DolibarrMysqlInvoiceRepository` (incluido) |
| ✅ | `llx_facture_fourn` | `Plugin\Trading\...\SupplierInvoice` | `DolibarrMysqlSupplierInvoiceRepository` |
| ✅ | `llx_facture_fourn_det`| `Plugin\Trading\...\SupplierInvoiceLine` | `DolibarrMysqlSupplierInvoiceRepository` (incluido) |
| ✅ | `llx_commande_fournisseur` | `Plugin\Trading\...\SupplierOrder` | `DolibarrMysqlSupplierOrderRepository` |
| ✅ | `llx_commande_fournisseurdet`| `Plugin\Trading\...\SupplierOrderLine` | `DolibarrMysqlSupplierOrderRepository` (incluido) |

## 🟠 Products / Catálogo
| Estado | Tabla Dolibarr | Dominio Alixar Entidad | Adaptador (`dolibarr-compat`) / Comentarios |
| :---: | :--- | :--- | :--- |
| ✅ | `llx_product` | `Plugin\Products\...\Product` | `DolibarrMysqlProductRepository` |
| ✅ | `llx_product_price` | `Plugin\Products\...\Price` | `DolibarrMysqlProductRepository` (incluido) |
| ✅ | `llx_product_stock` | `Plugin\Products\...\Stock` | `DolibarrMysqlProductRepository` (incluido) |
| ✅ | `llx_entrepot` | `Plugin\Products\...\Warehouse`| `DolibarrMysqlProductRepository` (relacionado) |

*(Nota: Esta tabla se irá expandiendo y marcando como `[x]` (✅) dinámicamente según ataquemos las fases).*
