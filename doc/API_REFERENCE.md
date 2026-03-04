# Referencia de API Alixar

La API de Alixar permite la integración con sistemas externos (Apps, eCommerce, Automatizaciones).

## Autenticación
La API requiere un **JSON Web Token (JWT)**.
- **Endpoint**: `api.php/Admin/AuthApi/login`
- **Método**: POST
- **Body**: `{"login": "usuario", "password": "..."}`

## Endpoints Principales

### CRM (Terceros)
- **Listar**: `GET api.php/Alixar/ThirdPartyApi/list`
  - Filtros: `client`, `fournisseur`, `name`.
- **Detalle**: `GET api.php/Alixar/ThirdPartyApi/get/{id}`

### Ventas (Clientes)
- **Pedidos**: `GET api.php/Alixar/OrderApi/list`
- **Facturas**: `GET api.php/Alixar/InvoiceApi/list`

### Compras (Proveedores)
- **Presupuestos**: `GET api.php/Alixar/SupplierProposalApi/list`
- **Pedidos**: `GET api.php/Alixar/SupplierOrderApi/list`
- **Facturas**: `GET api.php/Alixar/SupplierInvoiceApi/list`

### Tesorería
- **Cuentas**: `GET api.php/Alixar/BankAccountApi/list`
- **Movimientos**: `GET api.php/Alixar/BankMovementApi/list`
- **Cobros Clientes**: `GET api.php/Alixar/PaymentApi/listCustomer`
- **Pagos Prov**: `GET api.php/Alixar/PaymentApi/listSupplier`

## Parámetros Comunes
- `limit`: Cantidad de registros (defecto: 20).
- `offset`: Desplazamiento para paginación.
- `ref`: Búsqueda por referencia parcial.

## Respuestas
Todas las respuestas se devuelven en formato JSON:
```json
{
    "total": 125,
    "items": [...]
}
```
