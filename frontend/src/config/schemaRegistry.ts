import terceros from '../schemas/terceros.json'
import contactos from '../schemas/contactos.json'
import productos from '../schemas/productos.json'
import facturas from '../schemas/facturas.json'
import pedidos from '../schemas/pedidos.json'
import presupuestos from '../schemas/presupuestos.json'
import facturasProveedor from '../schemas/facturas-proveedor.json'
import pedidosProveedor from '../schemas/pedidos-proveedor.json'
import proyectos from '../schemas/proyectos.json'
import bancos from '../schemas/bancos.json'
import agenda from '../schemas/agenda.json'
import usuarios from '../schemas/usuarios.json'

// Dictionary that resolves URI resource ID to its JSON schema.
// In the future this can be replaced by a fetch() call to the backend!
export const resourceSchemas: Record<string, any> = {
  terceros,
  contactos,
  productos,
  facturas,
  pedidos,
  presupuestos,
  'facturas-proveedor': facturasProveedor,
  'pedidos-proveedor': pedidosProveedor,
  proyectos,
  bancos,
  agenda,
  usuarios
}
