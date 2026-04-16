import type { InfoField } from '../components/InfoCard.vue';

// Interfaces for our types
import type { ThirdParty, Contact, Product, Invoice, Proposal, Order, SupplierInvoice, SupplierOrder, Project, BankAccount, CRMEvent, Ticket, Category, Contract, SupplierProposal } from '../api';

const extractExtrafields = (e: any): InfoField[] => {
  if (!e.array_options) return [];
  return Object.entries(e.array_options)
    .filter(([_, v]) => v !== null && v !== '')
    .map(([k, v]) => ({
      label: k.replace(/^options_/, '').replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
      value: String(v)
    }));
};

export const entityFields = {
  thirdParty: (e: ThirdParty): InfoField[] => [
    { label: 'Nombre Legal', value: e.name },
    { label: 'Alias / Comercial', value: e.name_alias },
    { label: 'NIF / CIF', value: e.siren, type: 'badge' },
    { label: 'Código Cliente', value: e.code_client },
    { label: 'Código Proveedor', value: e.code_fournisseur },
    { label: 'Email', value: e.email, type: 'email' },
    { label: 'Teléfono', value: e.phone },
    { label: 'Sitio Web', value: e.url, type: 'link' },
    { label: 'Dirección', value: e.address },
    { label: 'C.P.', value: e.zip },
    { label: 'Población', value: e.town },
    ...extractExtrafields(e)
  ],
  contact: (e: Contact): InfoField[] => [
    { label: 'Nombre', value: e.firstname },
    { label: 'Apellidos', value: e.lastname },
    { label: 'Puesto / Cargo', value: e.jobTitle },
    { label: 'Email', value: e.email, type: 'email' },
    { label: 'Tlf. Profesional', value: e.phone_pro },
    { label: 'Tlf. Móvil', value: e.phone_mobile },
    { label: 'Población', value: e.town },
    { label: 'Tercero Asociado', value: e.fk_soc ? `#${e.fk_soc}` : undefined },
    ...extractExtrafields(e)
  ],
  product: (e: Product): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Etiqueta', value: e.label },
    { label: 'Tipo', value: e.type === '0' ? '📦 Producto' : '🛠️ Servicio' },
    { label: 'Precio TTC', value: e.price_ttc ? `${Number(e.price_ttc).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.tva_tx ? `${e.tva_tx}%` : undefined },
    { label: 'Descripción', value: e.description },
    { label: 'Código de Barras', value: e.barcode },
    { label: 'Estado Compra', value: e.status_buy === '1' ? 'En Compra' : 'No Comprable' },
    ...extractExtrafields(e)
  ],
  invoice: (e: Invoice): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Externa', value: e.ref_ext },
    { label: 'Tercero', value: e.socname || `#${e.fk_soc}` },
    { label: 'Fecha Factura', value: e.datef ? new Date(e.datef).toLocaleDateString('es-ES') : undefined },
    { label: 'Fecha Vencimiento', value: e.date_lim_reglement ? new Date(e.date_lim_reglement).toLocaleDateString('es-ES') : undefined },
    { label: 'Base Imponible (HT)', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.total_tva ? `${Number(e.total_tva).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ],
  proposal: (e: Proposal): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Cliente', value: e.ref_client },
    { label: 'Tercero', value: e.socname || `#${e.fk_soc}` },
    { label: 'Fecha Propuesta', value: e.datep ? new Date(e.datep).toLocaleDateString('es-ES') : undefined },
    { label: 'Válido Hasta', value: e.fin_validite ? new Date(e.fin_validite).toLocaleDateString('es-ES') : undefined },
    { label: 'Base Imponible', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.total_tva ? `${Number(e.total_tva).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ],
  order: (e: Order): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Cliente', value: e.ref_client },
    { label: 'Tercero', value: e.socname || `#${e.fk_soc}` },
    { label: 'Fecha Pedido', value: e.date_commande ? new Date(e.date_commande).toLocaleDateString('es-ES') : undefined },
    { label: 'Base Imponible', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.total_tva ? `${Number(e.total_tva).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ],
  supplierInvoice: (e: SupplierInvoice): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Proveedor', value: e.ref_supplier },
    { label: 'Proveedor', value: e.socname || `#${e.fk_soc}` },
    { label: 'Fecha', value: e.datef ? new Date(e.datef).toLocaleDateString('es-ES') : undefined },
    { label: 'Base Imponible', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.total_tva ? `${Number(e.total_tva).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ],
  supplierOrder: (e: SupplierOrder): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Proveedor', value: e.ref_supplier },
    { label: 'Proveedor', value: e.socname || `#${e.fk_soc}` },
    { label: 'Fecha Pedido', value: e.date_commande ? new Date(e.date_commande).toLocaleDateString('es-ES') : undefined },
    { label: 'Base Imponible', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'IVA', value: e.total_tva ? `${Number(e.total_tva).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ],
  project: (e: Project): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Título', value: e.title },
    { label: 'Tercero', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Fecha Inicio', value: e.dateo ? new Date(e.dateo).toLocaleDateString('es-ES') : undefined },
    { label: 'Fecha Fin', value: e.datee ? new Date(e.datee).toLocaleDateString('es-ES') : undefined },
    { label: 'Descripción', value: e.description },
    ...extractExtrafields(e)
  ],
  bankAccount: (e: BankAccount): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Etiqueta', value: e.label },
    { label: 'Banco', value: e.bank },
    { label: 'IBAN', value: e.iban_prefix },
    { label: 'BIC / SWIFT', value: e.bic },
    { label: 'Nº Cuenta', value: e.account_number },
    { label: 'Divisa', value: e.currency_code },
    ...extractExtrafields(e)
  ],
  event: (e: CRMEvent): InfoField[] => [
    { label: 'Tipo', value: e.typeCode, type: 'badge' },
    { label: 'Asunto', value: e.title },
    { label: 'Fecha Inicio', value: e.dateStart ? new Date(e.dateStart).toLocaleDateString('es-ES') : undefined },
    { label: 'Fecha Fin', value: e.dateEnd ? new Date(e.dateEnd).toLocaleDateString('es-ES') : undefined },
    { label: 'Progreso', value: e.percentage !== undefined ? `${e.percentage}%` : undefined },
    { label: 'Tercero', value: e.thirdPartyId ? `#${e.thirdPartyId}` : undefined },
    { label: 'Contacto', value: e.contactId ? `#${e.contactId}` : undefined },
    { label: 'Proyecto', value: e.projectId ? `#${e.projectId}` : undefined },
    { label: 'Notas', value: e.note },
    ...extractExtrafields(e)
  ],
  user: (e: any): InfoField[] => [
    { label: 'Username', value: e.username, type: 'badge' },
    { label: 'Nombre Completo', value: e.full_name || `${e.first_name || ''} ${e.last_name || ''}` },
    { label: 'Email', value: e.email, type: 'email' },
    { label: 'Idioma', value: e.language },
    { label: 'Zona Horaria', value: e.timezone },
    { label: 'Estado', value: e.is_active ? 'Activo' : 'Inactivo' },
    { label: 'Superadmin', value: e.is_superadmin ? 'Sí' : 'No' },
    { label: 'Último Acceso', value: e.last_login_at ? new Date(e.last_login_at).toLocaleString('es-ES') : 'Nunca' }
  ],
  role: (e: any): InfoField[] => [
    { label: 'Rol', value: e.name, type: 'badge' },
    { label: 'Descripción', value: e.description },
    { label: 'Es de Sistema', value: e.is_system ? 'Sí' : 'No' },
    { label: 'Nº Permisos', value: typeof e.permissions_count === 'number' ? e.permissions_count.toString() : 'N/A' }
  ],
  ticket: (e: Ticket): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Asunto', value: e.subject },
    { label: 'Tercero', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Severidad', value: e.severity },
    { label: 'Tipo', value: e.type_code },
    { label: 'Estado', value: e.status_code },
    ...extractExtrafields(e)
  ],
  category: (e: Category): InfoField[] => [
    { label: 'Etiqueta', value: e.label, type: 'badge' },
    { label: 'Tipo', value: e.type ? e.type.toString() : 'Genérico' },
    { label: 'Descripción', value: e.description },
    { label: 'Color', value: e.color }
  ],
  contract: (e: Contract): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Tercero', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Fecha Contrato', value: e.date_contrat ? new Date(e.date_contrat).toLocaleDateString('es-ES') : undefined },
    { label: 'Estado', value: e.statut !== undefined ? e.statut.toString() : undefined },
    ...extractExtrafields(e)
  ],
  supplierProposal: (e: SupplierProposal): InfoField[] => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Proveedor', value: e.ref_supplier },
    { label: 'Proveedor', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Fecha Propuesta', value: e.datep ? new Date(e.datep).toLocaleDateString('es-ES') : undefined },
    { label: 'Total HT', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined },
    ...extractExtrafields(e)
  ]
};
