# Migration Analysis: Third Party (Société)

Analysis of Dolibarr's `Societe` functionality and its cloning into the Alixar `ThirdPartyController`.

## 1. Source Reference
- **Dolibarr Class**: `htdocs/societe/class/societe.class.php`
- **Dolibarr UI**: `htdocs/societe/card.php`
- **Alixar Controller**: `Modules/Alixar/Controller/ThirdPartyController.php`
- **Alixar Model**: `Modules/Alixar/Model/ThirdParty.php`

## 2. Functional Mapping & Business Rules

### 3.1 Third Party Types
Dolibarr uses two main numeric fields to define the nature of the entity:
- `client`: `0` (None), `1` (Customer), `2` (Prospect), `3` (Customer & Prospect).
- `fournisseur`: `0` (No), `1` (Yes).

**Alixar Implementation**: Handled via `Boolean` fields in the UI for simplicity, but mapped to these numeric values in the model if necessary for DB compatibility.

### 3.2 Reference/Code Generation
- **Dolibarr Logic**: Uses modules/masks. If code is `-1` or `auto`, it triggers generation.
- **Rules**:
  - Codes must be unique within the entity.
  - Codes can be forced as mandatory via `SOCIETE_CODECLIENT_MANDATORY`.
- **Alixar Implementation**: Automated via `ReferenceService` and `HasReference` trait.
  - *Example Mask*: `CU{yy}{mm}-{0000}`
  - *Automatic Trigger*: Use `-1` or `auto` as the value in the field.

### 3.3 Validation Rules (`verify()` method)
Key validations identified in Dolibarr:
1. **Name mandatory**: Cannot create a third party without a name.
2. **Duplicate Detection**: 
   - Name uniqueness (optional via setup).
   - Professional IDs (VAT/CIF, ProfId1-6) uniqueness.
3. **VAT Validation**: Country-specific VAT syntax check (crucial for ES/EU).
4. **Mandatory Prof IDs**: Conditional requirements based on the Third Party's country vs Company country.

## 3. Framework Enhancements (Alxarafe)

The following improvements have been implemented in the Alxarafe Framework:

1. **`ReferenceService`**: 
   - Centralized service to parse masks (`{yy}`, `{mm}`, `{0000}`, etc.).
   - Efficiently finds the next available counter in the database using `LIKE` and `MAX()`.

2. **`HasReference` Trait**: 
   - Automates generation in the model's `creating` event.
   - Supports both single fields (`referenceField`) and multiple fields (`referenceConfig`).
   - Integrated into `ThirdParty` and `Product` models.

3. **Advanced Validations in ResourceController**:
   - Support for "Unique within Entity" (multi-tenant aware).
   - `VatValidationService`: Handles Spanish TIN (NIF/CIF/NIE) checks.

4. **Aseptic & Decoupled Resource View**:
   - **Blade Components**: `ResourceTrait` no longer contains hardcoded HTML tags (`<form>`, `<div>`, etc.). Instead, it generates a structure using `@component('component.resource.form_container')` and `@component('component.container.panel')`.
   - **Theme Independence**: This allows any theme (like Eldy) to completely override the form's surrounding markup by creating its own versions of these components in `templates/themes/{theme}/component/...`.
   - **Hybrid Generation**: The trait still "bakes" the field includes for performance, but delegates the layout structure to the Blade engine.

## 4. Next Steps
- [x] Implement `ReferenceService` pattern in Alxarafe core.
- [x] Implement `HasReference` trait in Alxarafe core.
- [x] Implement the "Contacts" relationship in `ThirdParty` model.
- [x] Implement `VatValidationService` (Spanish logic ported).
- [x] Implement the tabbed UI in `ResourceController`.
- [ ] Add country-specific UI logic for VAT/CIF labels.
- [ ] Implement the "Documents" tab with file upload support.
