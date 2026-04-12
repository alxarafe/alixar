import { createRouter, createWebHistory } from 'vue-router'

// ── Shared Tabs ─────────────────────────────────────────
import GenericFichaTab from '../views/shared/GenericFichaTab.vue'
import GenericLineasTab from '../views/shared/GenericLineasTab.vue'
import GenericNotasTab from '../views/shared/GenericNotasTab.vue'
import GenericCreateView from '../views/shared/GenericCreateView.vue'

// ── Views: Dashboard ────────────────────────────────────
// ── Views: Dashboard ────────────────────────────────────
import DashboardView from '../views/DashboardView.vue'
import CommercialDashboardView from '../views/CommercialDashboardView.vue'

// ── Views: ThirdParties ─────────────────────────────────
import ThirdPartyListView from '../views/thirdparties/ThirdPartyListView.vue'
import ThirdPartyDetailView from '../views/thirdparties/ThirdPartyDetailView.vue'

// ── Views: Contacts ─────────────────────────────────────
import ContactListView from '../views/contacts/ContactListView.vue'
import ContactDetailView from '../views/contacts/ContactDetailView.vue'

// ── Views: Products ─────────────────────────────────────
import ProductListView from '../views/products/ProductListView.vue'
import ProductDetailView from '../views/products/ProductDetailView.vue'

// ── Views: Invoices ─────────────────────────────────────
import InvoiceListView from '../views/invoices/InvoiceListView.vue'
import InvoiceDetailView from '../views/invoices/InvoiceDetailView.vue'

// ── Views: Proposals ────────────────────────────────────
import ProposalListView from '../views/proposals/ProposalListView.vue'
import ProposalDetailView from '../views/proposals/ProposalDetailView.vue'

// ── Views: Orders ───────────────────────────────────────
import OrderListView from '../views/orders/OrderListView.vue'
import OrderDetailView from '../views/orders/OrderDetailView.vue'

// ── Views: Supplier Invoices ────────────────────────────
import SupplierInvoiceListView from '../views/supplier-invoices/SupplierInvoiceListView.vue'
import SupplierInvoiceDetailView from '../views/supplier-invoices/SupplierInvoiceDetailView.vue'

// ── Views: Supplier Orders ──────────────────────────────
import SupplierOrderListView from '../views/supplier-orders/SupplierOrderListView.vue'
import SupplierOrderDetailView from '../views/supplier-orders/SupplierOrderDetailView.vue'

// ── Views: Projects ─────────────────────────────────────
import ProjectListView from '../views/projects/ProjectListView.vue'
import ProjectDetailView from '../views/projects/ProjectDetailView.vue'
import ProjectTareasTab from '../views/projects/tabs/TareasTab.vue'

// ── Views: Bank Accounts ────────────────────────────────
import BankAccountListView from '../views/bank-accounts/BankAccountListView.vue'
import BankAccountDetailView from '../views/bank-accounts/BankAccountDetailView.vue'
import BankAccountMovimientosTab from '../views/bank-accounts/tabs/MovimientosTab.vue'

// ── Views: Events ───────────────────────────────────────
import EventListView from '../views/events/EventListView.vue'
import EventDetailView from '../views/events/EventDetailView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', name: 'dashboard', component: DashboardView, meta: { title: 'Panel Principal' } },
    { path: '/comercial', name: 'commercial-dashboard', component: CommercialDashboardView, meta: { title: 'Área Comercial' } },
    { path: '/crear/:resource', name: 'resource-create', component: GenericCreateView, meta: { title: 'Nuevo Registro' } },

    // ── Third Parties ─────────────────────────────────
    { path: '/terceros', name: 'thirdparties', component: ThirdPartyListView, meta: { title: 'Directorio de Terceros' } },
    {
      path: '/terceros/:id', component: ThirdPartyDetailView, meta: { title: 'Ficha de Tercero' },
      children: [
        { path: '', redirect: { name: 'thirdparty-ficha' } },
        { path: 'ficha', name: 'thirdparty-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'thirdparty-notas', component: GenericNotasTab },
      ]
    },

    // ── Contacts ──────────────────────────────────────
    { path: '/contactos', name: 'contacts', component: ContactListView, meta: { title: 'Agenda de Contactos' } },
    {
      path: '/contactos/:id', component: ContactDetailView, meta: { title: 'Ficha de Contacto' },
      children: [
        { path: '', redirect: { name: 'contact-ficha' } },
        { path: 'ficha', name: 'contact-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'contact-notas', component: GenericNotasTab },
      ]
    },

    // ── Products ──────────────────────────────────────
    { path: '/productos', name: 'products', component: ProductListView, meta: { title: 'Catálogo de Productos' } },
    {
      path: '/productos/:id', component: ProductDetailView, meta: { title: 'Ficha de Producto' },
      children: [
        { path: '', redirect: { name: 'product-ficha' } },
        { path: 'ficha', name: 'product-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'product-notas', component: GenericNotasTab },
      ]
    },

    // ── Invoices ──────────────────────────────────────
    { path: '/facturas', name: 'invoices', component: InvoiceListView, meta: { title: 'Facturas de Cliente' } },
    {
      path: '/facturas/:id', component: InvoiceDetailView, meta: { title: 'Factura' },
      children: [
        { path: '', redirect: { name: 'invoice-ficha' } },
        { path: 'ficha', name: 'invoice-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'invoice-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'invoice-notas', component: GenericNotasTab },
      ]
    },

    // ── Proposals ─────────────────────────────────────
    { path: '/presupuestos', name: 'proposals', component: ProposalListView, meta: { title: 'Presupuestos' } },
    {
      path: '/presupuestos/:id', component: ProposalDetailView, meta: { title: 'Presupuesto' },
      children: [
        { path: '', redirect: { name: 'proposal-ficha' } },
        { path: 'ficha', name: 'proposal-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'proposal-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'proposal-notas', component: GenericNotasTab },
      ]
    },

    // ── Orders ────────────────────────────────────────
    { path: '/pedidos', name: 'orders', component: OrderListView, meta: { title: 'Pedidos de Cliente' } },
    {
      path: '/pedidos/:id', component: OrderDetailView, meta: { title: 'Pedido' },
      children: [
        { path: '', redirect: { name: 'order-ficha' } },
        { path: 'ficha', name: 'order-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'order-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'order-notas', component: GenericNotasTab },
      ]
    },

    // ── Supplier Invoices ─────────────────────────────
    { path: '/facturas-proveedor', name: 'supplier-invoices', component: SupplierInvoiceListView, meta: { title: 'Facturas de Proveedor' } },
    {
      path: '/facturas-proveedor/:id', component: SupplierInvoiceDetailView, meta: { title: 'Factura Proveedor' },
      children: [
        { path: '', redirect: { name: 'supplier-invoice-ficha' } },
        { path: 'ficha', name: 'supplier-invoice-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'supplier-invoice-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'supplier-invoice-notas', component: GenericNotasTab },
      ]
    },

    // ── Supplier Orders ──────────────────────────────
    { path: '/pedidos-proveedor', name: 'supplier-orders', component: SupplierOrderListView, meta: { title: 'Pedidos de Proveedor' } },
    {
      path: '/pedidos-proveedor/:id', component: SupplierOrderDetailView, meta: { title: 'Pedido Proveedor' },
      children: [
        { path: '', redirect: { name: 'supplier-order-ficha' } },
        { path: 'ficha', name: 'supplier-order-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'supplier-order-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'supplier-order-notas', component: GenericNotasTab },
      ]
    },

    // ── Projects ──────────────────────────────────────
    { path: '/proyectos', name: 'projects', component: ProjectListView, meta: { title: 'Proyectos' } },
    {
      path: '/proyectos/:id', component: ProjectDetailView, meta: { title: 'Proyecto' },
      children: [
        { path: '', redirect: { name: 'project-ficha' } },
        { path: 'ficha', name: 'project-ficha', component: GenericFichaTab },
        { path: 'tareas', name: 'project-tareas', component: ProjectTareasTab },
        { path: 'notas', name: 'project-notas', component: GenericNotasTab },
      ]
    },

    // ── Bank Accounts ─────────────────────────────────
    { path: '/bancos', name: 'bank-accounts', component: BankAccountListView, meta: { title: 'Cuentas Bancarias' } },
    {
      path: '/bancos/:id', component: BankAccountDetailView, meta: { title: 'Cuenta Bancaria' },
      children: [
        { path: '', redirect: { name: 'bank-ficha' } },
        { path: 'ficha', name: 'bank-ficha', component: GenericFichaTab },
        { path: 'movimientos', name: 'bank-movimientos', component: BankAccountMovimientosTab },
      ]
    },

    // ── Events / Agenda ───────────────────────────────
    { path: '/agenda', name: 'events', component: EventListView, meta: { title: 'Agenda / Eventos' } },
    {
      path: '/agenda/:id', component: EventDetailView, meta: { title: 'Evento' },
      children: [
        { path: '', redirect: { name: 'event-ficha' } },
        { path: 'ficha', name: 'event-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'event-notas', component: GenericNotasTab },
      ]
    },
  ]
})

export default router
