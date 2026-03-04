# Roadmap: Migración Dolibarr → Alixar

## Decisión Crítica: Estructura de Módulos

> [!IMPORTANT]
> Dolibarr NO tiene módulos organizados. Tiene carpetas sueltas bajo `htdocs/` sin coherencia.
> Alixar tiene la oportunidad de organizar esto limpiamente.

### Propuesta: 12 Módulos Limpios

| Módulo Alixar | Carpeta | Top Menu | Dolibarr htdocs (origen caótico) |
|---|---|---|---|
| **Alixar** | `Modules/Alixar/` | Dashboard | `htdocs/core/`, `htdocs/admin/` |
| **CRM** | `Modules/CRM/` | CRM | `htdocs/societe/`, `htdocs/contact/`, `htdocs/categories/` |
| **Sales** | `Modules/Sales/` | Ventas | `htdocs/comm/propal/`, `htdocs/commande/`, `htdocs/compta/facture/`, `htdocs/compta/paiement/` |
| **Purchases** | `Modules/Purchases/` | Compras | `htdocs/fourn/commande/`, `htdocs/fourn/facture/`, `htdocs/fourn/paiement/` |
| **Products** | `Modules/Products/` | Productos | `htdocs/product/`, `htdocs/categories/` |
| **Stock** | `Modules/Stock/` | Stock | `htdocs/product/stock/`, `htdocs/expedition/`, `htdocs/reception/`, `htdocs/delivery/` |
| **Finance** | `Modules/Finance/` | Finanzas | `htdocs/compta/bank/`, `htdocs/compta/sociales/`, `htdocs/compta/tva/`, `htdocs/loan/` |
| **Accounting** | `Modules/Accounting/` | Contabilidad | `htdocs/accountancy/` |
| **HRM** | `Modules/HRM/` | RRHH | `htdocs/hrm/`, `htdocs/holiday/`, `htdocs/expensereport/`, `htdocs/salaries/` |
| **Projects** | `Modules/Projects/` | Proyectos | `htdocs/projet/`, `htdocs/fichinter/` |
| **Members** | `Modules/Members/` | Socios | `htdocs/adherents/`, `htdocs/don/`, `htdocs/subscription/` |
| **Tools** | `Modules/Tools/` | Herramientas | `htdocs/ticket/`, `htdocs/resource/`, `htdocs/ecm/`, `htdocs/mailing/` |

> [!NOTE]
> Actualmente TODO está en `Modules/Alixar/`. La migración implicaría mover Controllers y Models a sus módulos correctos progresivamente. No es urgente — se puede hacer módulo a módulo.

---

## Crosswalk Detallado: Dolibarr → Alixar

### Módulo CRM (`Modules/CRM/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Lista de terceros | `societe/list.php` | ThirdPartyController::doIndex | ✅ |
| Ficha tercero | `societe/card.php` | ThirdPartyController::doEdit | ✅ |
| Nuevo tercero | `societe/card.php?action=create` | ThirdPartyController::doCreate | ✅ |
| Contactos tercero | `societe/contact.php` | ContactController (tab) | ❌ |
| Direcciones tercero | `societe/address.php` | AddressController (tab) | ❌ |
| RIB bancarios | `societe/rib.php` | ThirdPartyRibController (tab) | ❌ |
| Documentos adjuntos | `societe/document.php` | DocumentController (tab) | 🔶 |
| Lista contactos | `contact/list.php` | ContactController::doIndex | ❌ |
| Ficha contacto | `contact/card.php` | ContactController::doEdit | ❌ |
| Categorías | `categories/index.php` | CategoryController | ❌ |

### Módulo Sales (`Modules/Sales/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Lista presupuestos | `comm/propal/list.php` | ProposalController::doIndex | ✅ |
| Ficha presupuesto | `comm/propal/card.php` | ProposalController::doEdit | ✅ |
| Líneas presupuesto | `comm/propal/card.php` (tab) | ProposalLineController (tab) | ❌ |
| Lista pedidos | `commande/list.php` | OrderController::doIndex | ✅ |
| Ficha pedido | `commande/card.php` | OrderController::doEdit | ✅ |
| Líneas pedido | `commande/card.php` (tab) | OrderLineController (tab) | ❌ |
| Lista facturas | `compta/facture/list.php` | InvoiceController::doIndex | ✅ |
| Ficha factura | `compta/facture/card.php` | InvoiceController::doEdit | ✅ |
| Líneas factura | `compta/facture/card.php` (tab) | InvoiceLineController (tab) | ❌ |
| Lista cobros | `compta/paiement/list.php` | PaymentController::doIndex | ✅ |
| Cobro | `compta/paiement/card.php` | PaymentController::doEdit | ✅ |
| Estadísticas | `comm/propal/stats/` | SalesStatsController | ❌ |
| Márgenes | `margin/index.php` | MarginController | ❌ |

### Módulo Purchases (`Modules/Purchases/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Presupuestos prov. | `supplier_proposal/list.php` | SupplierProposalController | ✅ |
| Pedidos prov. | `fourn/commande/list.php` | SupplierOrderController | ✅ |
| Facturas prov. | `fourn/facture/list.php` | SupplierInvoiceController | ✅ |
| Pagos prov. | `fourn/paiement/list.php` | SupplierPaymentController | ✅ |

### Módulo Products (`Modules/Products/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Lista productos | `product/list.php` | ProductController::doIndex | ✅ |
| Ficha producto | `product/card.php` | ProductController::doEdit | ✅ |
| Precios cliente | `product/price.php` | ProductPriceController (tab) | ❌ |
| Precios proveedor | `product/fournisseurs.php` | ProductSupplierPriceController (tab) | ❌ |
| Stock producto | `product/stock/product.php` | ProductStockController (tab) | ❌ |
| Lotes | `product/stock/productlot_card.php` | ProductLotController | ❌ |
| Variantes | `product/attributes.php` | ProductAttributeController | ❌ |

### Módulo Stock (`Modules/Stock/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Almacenes | `product/stock/list.php` | WarehouseController | ❌ |
| Movimientos | `product/stock/mouvement.php` | StockMovementController | ❌ |
| Envíos | `expedition/list.php` | ShipmentController | ❌ |
| Recepciones | `reception/list.php` | ReceptionController | ❌ |
| Inventarios | `product/inventory/` | InventoryController | ❌ |

### Módulo Finance (`Modules/Finance/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Cuentas bancarias | `compta/bank/list.php` | BankAccountController | ✅ |
| Movimientos banco | `compta/bank/bankentries_list.php` | BankMovementController | ✅ |
| Conciliación | `compta/bank/releve.php` | BankReconcileController | ❌ |
| Remesas | `compta/prelevement/` | DirectDebitController | ❌ |
| IVA | `compta/tva/list.php` | VatController | ❌ |
| Cargas sociales | `compta/sociales/list.php` | SocialChargeController | ❌ |
| Préstamos | `loan/list.php` | LoanController | ❌ |
| Pagos varios | `compta/paiement/various/` | PaymentVariousController | ❌ |

### Módulo HRM (`Modules/HRM/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Empleados | `hrm/list.php` | EmployeeController | ❌ |
| Vacaciones | `holiday/list.php` | HolidayController | ❌ |
| Notas de gasto | `expensereport/list.php` | ExpenseReportController | ❌ |
| Nóminas | `salaries/list.php` | SalaryController | ❌ |

### Módulo Projects (`Modules/Projects/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Proyectos | `projet/list.php` | ProjectController | ❌ |
| Tareas | `projet/tasks/list.php` | TaskController | ❌ |
| Intervenciones | `fichinter/list.php` | InterventionController | ❌ |
| Agenda | `comm/action/list.php` | AgendaController | ❌ |

### Módulo Accounting (`Modules/Accounting/`)
| Pantalla Dolibarr | Archivo htdocs | Controller Alixar | Estado |
|---|---|---|---|
| Plan contable | `accountancy/admin/account.php` | ChartOfAccountsController | ❌ |
| Asientos | `accountancy/bookkeeping/list.php` | BookkeepingController | ❌ |
| Balances | `accountancy/report/` | BalanceController | ❌ |

---

## Fase 0: Herramientas y Definición

### 0.1 Definir módulos (este documento) → ✅
### 0.2 Script generador

```
php scripts/generate_module.php --module=CRM --table=llx_socpeople --controller=Contact
```

Genera:
- `Modules/CRM/Controller/ContactController.php` con `#[Menu]`
- `Modules/CRM/Model/Contact.php` con campos y FKs
- Detecta y genera relaciones belongsTo/hasMany

### 0.3 Patrón de pestañas (tabs)

> [!WARNING]
> 🔧 **Candidato a cambio en Alxarafe**: Un helper para tabs en ResourceController simplificaría enormemente la migración. Casi todas las fichas de Dolibarr usan pestañas.

### 0.4 Workflow de estados

> [!WARNING]
> 🔧 **Candidato a cambio en Alxarafe**: StateMachine helper (Borrador→Validado→Cerrado→Anulado). Lo usan: Presupuestos, Pedidos, Facturas, Intervenciones, etc.

### 0.5 Extrafields UI

> [!WARNING]
> 🔧 **Candidato a cambio en Alxarafe**: Renderizado automático de extrafields. Es core en Dolibarr — todas las entidades los soportan.

---

## Orden de Ejecución Recomendado

| Paso | Qué | Por qué primero |
|---|---|---|
| 1 | Script generador | Multiplica velocidad x5 |
| 2 | Completar **CRM** | Base de todo el ERP |
| 3 | Completar **Sales** | El flujo comercial más usado |
| 4 | Completar **Purchases** | Mirror de Sales |
| 5 | **Products** + **Stock** | Depende de CRM y Sales |
| 6 | **Finance** | Depende de Sales + Purchases |
| 7 | **HRM**, **Projects** | Paralelos, independientes |
| 8 | **Accounting** | El más complejo, dejarlo para el final |
| 9 | **Members**, **Tools** | Nice-to-have |
