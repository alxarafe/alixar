# Glosario de Nomenclatura: Dolibarr → Alixar

> **Objetivo**: Documentar las inconsistencias de nomenclatura de Dolibarr para preparar
> una futura migración limpia, manteniendo compatibilidad total en la fase actual.
>
> **Regla de oro**: En el dominio de Alixar usamos nombres semánticos en inglés.
> La traducción a nombres de Dolibarr ocurre EXCLUSIVAMENTE en la capa de infraestructura
> (repositorios MySQL, controladores API).

---

## Convenciones de Alixar

| Aspecto | Convención Alixar | Ejemplo |
|---------|-------------------|---------|
| Entidades | `PascalCase`, inglés, singular | `ThirdParty`, `Contact`, `Invoice` |
| Propiedades | `camelCase`, inglés, descriptivo | `$vatNumber`, `$countryId` |
| Tablas (futuro) | `snake_case`, inglés, plural | `third_parties`, `contacts` |
| Columnas (futuro) | `snake_case`, inglés, descriptivo | `vat_number`, `country_id` |
| Endpoints (futuro) | `kebab-case`, inglés, plural | `/third-parties`, `/invoices` |

---

## 1. Tablas

| Dolibarr (actual) | Alixar (futuro) | Idioma original | Notas |
|--------------------|-----------------|-----------------|-------|
| `llx_societe` | `third_parties` | Francés | "société" = sociedad/empresa |
| `llx_socpeople` | `contacts` | Francés-ish | "soc" + "people" = mezcla |
| `llx_facture` | `invoices` | Francés | "facture" = factura |
| `llx_facture_fourn` | `supplier_invoices` | Francés | "fourn" = fournisseur |
| `llx_facture_rec` | `recurring_invoices` | Francés | "rec" = récurrente |
| `llx_facturedet` | `invoice_lines` | Francés | "det" = détail |
| `llx_commande` | `orders` | Francés | "commande" = pedido |
| `llx_commandedet` | `order_lines` | Francés | "det" = détail |
| `llx_commande_fournisseur` | `supplier_orders` | Francés | |
| `llx_propal` | `proposals` | Francés | "propal" = proposition commerciale |
| `llx_propaldet` | `proposal_lines` | Francés | |
| `llx_product` | `products` | ✅ Inglés | Correcto |
| `llx_expedition` | `shipments` | Francés | "expédition" = envío |
| `llx_expeditiondet` | `shipment_lines` | Francés | |
| `llx_reception` | `receptions` | ✅ Francés/Inglés | Aceptable |
| `llx_contrat` | `contracts` | Francés | "contrat" = contrato |
| `llx_contratdet` | `contract_lines` | Francés | |
| `llx_fichinter` | `interventions` | Francés | "fiche d'intervention" |
| `llx_fichinterdet` | `intervention_lines` | Francés | |
| `llx_projet` | `projects` | Francés | "projet" = proyecto |
| `llx_projet_task` | `project_tasks` | Francés/Inglés | Mezcla |
| `llx_adherent` | `members` | Francés | "adhérent" = miembro |
| `llx_adherent_type` | `member_types` | Francés | |
| `llx_don` | `donations` | Francés | "don" = donación |
| `llx_entrepot` | `warehouses` | Francés | "entrepôt" = almacén |
| `llx_user` | `users` | ✅ Inglés | Correcto |
| `llx_c_pays` | `countries` | Francés | "pays" = país |
| `llx_c_departements` | `states` | Francés | departamento ≠ estado |
| `llx_c_forme_juridique` | `legal_forms` | Francés | |
| `llx_c_effectif` | `company_sizes` | Francés | "effectif" = plantilla |
| `llx_c_typent` | `company_types` | Francés | abreviatura extrema |
| `llx_c_stcomm` | `commercial_statuses` | Francés | "statut commercial" |
| `llx_c_actioncomm` | `action_types` | Francés | |
| `llx_actioncomm` | `agenda_events` | Francés | |
| `llx_const` | `settings` | Inglés | Nombre poco descriptivo |
| `llx_rights_def` | `permission_definitions` | Inglés | Aceptable |
| `llx_paiement` | `payments` | Francés | "paiement" = pago |
| `llx_paiement_facture` | `payment_invoice_links` | Francés | |
| `llx_bank` | `bank_transactions` | Inglés | Poco descriptivo |
| `llx_bank_account` | `bank_accounts` | ✅ Inglés | Correcto |

---

## 2. Columnas Comunes

| Dolibarr (actual) | Alixar (futuro) | Tabla(s) | Notas |
|--------------------|-----------------|----------|-------|
| `rowid` | `id` | Todas | PK universal en Dolibarr |
| `nom` | `name` | `societe` | Francés: "nom" = nombre |
| `fk_soc` | `third_party_id` | Muchas | FK a societe |
| `fk_pays` | `country_id` | Muchas | Francés: "pays" = país |
| `fk_departement` | `state_id` | Muchas | departamento ≠ estado |
| `fk_user_creat` | `created_by_id` | Muchas | Francés + abreviatura |
| `fk_user_modif` | `modified_by_id` | Muchas | Francés + abreviatura |
| `datec` | `created_at` | Muchas | Abreviatura: "date création" |
| `tms` | `updated_at` | Muchas | "timestamp modification" |
| `tva_intra` | `vat_number` | `societe` | Francés: "TVA intracommunautaire" |
| `tva_assuj` | `vat_liable` | `societe` | Francés: "assujetti à la TVA" |
| `fournisseur` | `is_supplier` | `societe` | Francés: boolean como entero |
| `fk_stcomm` | `commercial_status_id` | `societe` | Abreviatura extrema |
| `fk_typent` | `company_type_id` | `societe` | Abreviatura: "type entité" |
| `fk_forme_juridique` | `legal_form_id` | `societe` | Francés |
| `fk_effectif` | `company_size_id` | `societe` | Francés |
| `remise_percent` | `discount_percent` | `societe` | Francés: "remise" = descuento |
| `code_compta` | `accounting_code` | `societe` | Francés: "comptabilité" |
| `poste` | `job_title` | `socpeople` | Francés: "poste" = puesto |
| `priv` | `is_private` | `socpeople` | Abreviatura |
| `statut` | `status` | Muchas | Francés |
| `phone_pro` | `phone` | API contacts | Solo API, DB usa `phone` |
| `ref` | `reference` | Muchas | Abreviatura |
| `ref_ext` | `external_reference` | Muchas | |
| `multicurrency_code` | `currency_code` | Muchas | Redundante |
| `localtax1_assuj` | `local_tax_1_liable` | `societe` | Ilegible |
| `localtax1_value` | `local_tax_1_rate` | `societe` | |

---

## 3. Endpoints API

| Dolibarr (actual) | Alixar (futuro v2) | Notas |
|--------------------|-------------------|-------|
| `/api/index.php/thirdparties` | `/api/v2/third-parties` | kebab-case |
| `/api/index.php/contacts` | `/api/v2/contacts` | ✅ OK |
| `/api/index.php/invoices` | `/api/v2/invoices` | ✅ OK |
| `/api/index.php/supplierinvoices` | `/api/v2/supplier-invoices` | kebab-case |
| `/api/index.php/supplierorders` | `/api/v2/supplier-orders` | kebab-case |
| `/api/index.php/proposals` | `/api/v2/proposals` | ✅ OK |
| `/api/index.php/agendaevents` | `/api/v2/agenda-events` | kebab-case |
| `/api/index.php/bankaccounts` | `/api/v2/bank-accounts` | kebab-case |
| `/api/index.php/expensereports` | `/api/v2/expense-reports` | kebab-case |
| `/api/index.php/stockmovements` | `/api/v2/stock-movements` | kebab-case |
| `/api/index.php/productlots` | `/api/v2/product-lots` | kebab-case |

---

## 4. Patrones de Mapeo en Código

### En la entidad de dominio (anotación `@dolibarr-column`):

```php
/**
 * Número de IVA intracomunitario.
 *
 * @dolibarr-column tva_intra
 * @dolibarr-table   societe
 */
private ?string $vatNumber;
```

### En el repositorio (capa de infraestructura):

```php
// El mapeo Dolibarr ↔ Dominio ocurre AQUÍ, no en la entidad.
// La entidad es 100% pura, sin referencias a Dolibarr.
```

### En el controlador API (compatibilidad):

```php
// La API v1 mantiene los nombres de Dolibarr para compatibilidad.
// La API v2 (futura) usará los nombres limpios del dominio.
```

---

## Apéndice: Prefijo `llx_`

El prefijo `llx_` es configurable en Dolibarr (`$dolibarr_main_db_prefix` en `conf.php`).
En Alixar se pasa como parámetro en la configuración: `table_prefix`.

Cuando lleguemos a la v2 de la BD, eliminaremos el prefijo y usaremos un esquema dedicado
(ej: `alixar.third_parties` en lugar de `public.llx_societe`).
