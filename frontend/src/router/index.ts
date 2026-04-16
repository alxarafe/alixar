import { createRouter, createWebHistory } from 'vue-router'

// ── Shared Tabs ─────────────────────────────────────────
import GenericFichaTab from '../views/shared/GenericFichaTab.vue'
import GenericLineasTab from '../views/shared/GenericLineasTab.vue'
import GenericNotasTab from '../views/shared/GenericNotasTab.vue'
import GenericCreateView from '../views/shared/GenericCreateView.vue'
import GenericListView from '../views/shared/GenericListView.vue'
import GenericDetailView from '../views/shared/GenericDetailView.vue'

import { pluginsRegistry } from '../plugins/registry'

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

// ── Views: Core (Auth / Users) ──────────────────────────
import UserListView from '../views/core/UserListView.vue'
import UserDetailView from '../views/core/UserDetailView.vue'
import UserRolesTab from '../views/core/tabs/UserRolesTab.vue'

import RoleListView from '../views/core/RoleListView.vue'
import RoleDetailView from '../views/core/RoleDetailView.vue'
import RolePermissionsTab from '../views/core/tabs/RolePermissionsTab.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/login', name: 'login', component: () => import('../views/auth/LoginView.vue'), meta: { requiredAuth: false, title: 'Acceso' } },
    { path: '/', name: 'dashboard', component: DashboardView, meta: { title: 'Panel Principal', requiresAuth: true } },
    { path: '/comercial', name: 'commercial-dashboard', component: CommercialDashboardView, meta: { title: 'Área Comercial', requiresAuth: true } },
    { path: '/crear/:resource', name: 'resource-create', component: GenericCreateView, meta: { title: 'Nuevo Registro', requiresAuth: true } },

    // ── Users / Roles ─────────────────────────────────
    { path: '/usuarios', name: 'users', component: UserListView, meta: { title: 'Gestión de Usuarios', requiresAuth: true } },
    {
      path: '/usuarios/:id', component: UserDetailView, meta: { title: 'Ficha de Usuario', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'user-ficha' } },
        { path: 'ficha', name: 'user-ficha', component: GenericFichaTab },
        { path: 'roles', name: 'user-roles', component: UserRolesTab }
      ]
    },

    { path: '/roles', name: 'roles', component: RoleListView, meta: { title: 'Gestión de Roles', requiresAuth: true } },
    {
      path: '/roles/:id', component: RoleDetailView, meta: { title: 'Ficha de Rol', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'role-ficha' } },
        { path: 'ficha', name: 'role-ficha', component: GenericFichaTab },
        { path: 'permisos', name: 'role-permissions', component: RolePermissionsTab }
      ]
    },

    // ── Third Parties ─────────────────────────────────
    { path: '/terceros', name: 'thirdparties', component: ThirdPartyListView, meta: { title: 'Directorio de Terceros', requiresAuth: true } },
    {
      path: '/terceros/:id', component: ThirdPartyDetailView, meta: { title: 'Ficha de Tercero', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'thirdparty-ficha' } },
        { path: 'ficha', name: 'thirdparty-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'thirdparty-notas', component: GenericNotasTab },
      ]
    },

    // ── Contacts ──────────────────────────────────────
    { path: '/contactos', name: 'contacts', component: ContactListView, meta: { title: 'Agenda de Contactos', requiresAuth: true } },
    {
      path: '/contactos/:id', component: ContactDetailView, meta: { title: 'Ficha de Contacto', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'contact-ficha' } },
        { path: 'ficha', name: 'contact-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'contact-notas', component: GenericNotasTab },
      ]
    },

    // ── Products ──────────────────────────────────────
    { path: '/productos', name: 'products', component: ProductListView, meta: { title: 'Catálogo de Productos', requiresAuth: true } },
    {
      path: '/productos/:id', component: ProductDetailView, meta: { title: 'Ficha de Producto', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'product-ficha' } },
        { path: 'ficha', name: 'product-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'product-notas', component: GenericNotasTab },
      ]
    },

    // ── Invoices ──────────────────────────────────────
    { path: '/facturas', name: 'invoices', component: InvoiceListView, meta: { title: 'Facturas de Cliente', requiresAuth: true } },
    {
      path: '/facturas/:id', component: InvoiceDetailView, meta: { title: 'Factura', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'invoice-ficha' } },
        { path: 'ficha', name: 'invoice-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'invoice-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'invoice-notas', component: GenericNotasTab },
      ]
    },

    // ── Proposals ─────────────────────────────────────
    { path: '/presupuestos', name: 'proposals', component: ProposalListView, meta: { title: 'Presupuestos', requiresAuth: true } },
    {
      path: '/presupuestos/:id', component: ProposalDetailView, meta: { title: 'Presupuesto', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'proposal-ficha' } },
        { path: 'ficha', name: 'proposal-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'proposal-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'proposal-notas', component: GenericNotasTab },
      ]
    },

    // ── Orders ────────────────────────────────────────
    { path: '/pedidos', name: 'orders', component: OrderListView, meta: { title: 'Pedidos de Cliente', requiresAuth: true } },
    {
      path: '/pedidos/:id', component: OrderDetailView, meta: { title: 'Pedido', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'order-ficha' } },
        { path: 'ficha', name: 'order-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'order-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'order-notas', component: GenericNotasTab },
      ]
    },

    // ── Supplier Invoices ─────────────────────────────
    { path: '/facturas-proveedor', name: 'supplier-invoices', component: SupplierInvoiceListView, meta: { title: 'Facturas de Proveedor', requiresAuth: true } },
    {
      path: '/facturas-proveedor/:id', component: SupplierInvoiceDetailView, meta: { title: 'Factura Proveedor', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'supplier-invoice-ficha' } },
        { path: 'ficha', name: 'supplier-invoice-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'supplier-invoice-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'supplier-invoice-notas', component: GenericNotasTab },
      ]
    },

    // ── Supplier Orders ──────────────────────────────
    { path: '/pedidos-proveedor', name: 'supplier-orders', component: SupplierOrderListView, meta: { title: 'Pedidos de Proveedor', requiresAuth: true } },
    {
      path: '/pedidos-proveedor/:id', component: SupplierOrderDetailView, meta: { title: 'Pedido Proveedor', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'supplier-order-ficha' } },
        { path: 'ficha', name: 'supplier-order-ficha', component: GenericFichaTab },
        { path: 'lineas', name: 'supplier-order-lineas', component: GenericLineasTab },
        { path: 'notas', name: 'supplier-order-notas', component: GenericNotasTab },
      ]
    },

    // ── Projects ──────────────────────────────────────
    { path: '/proyectos', name: 'projects', component: ProjectListView, meta: { title: 'Proyectos', requiresAuth: true } },
    {
      path: '/proyectos/:id', component: ProjectDetailView, meta: { title: 'Proyecto', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'project-ficha' } },
        { path: 'ficha', name: 'project-ficha', component: GenericFichaTab },
        { path: 'tareas', name: 'project-tareas', component: ProjectTareasTab },
        { path: 'notas', name: 'project-notas', component: GenericNotasTab },
      ]
    },

    // ── Bank Accounts ─────────────────────────────────
    { path: '/bancos', name: 'bank-accounts', component: BankAccountListView, meta: { title: 'Cuentas Bancarias', requiresAuth: true } },
    {
      path: '/bancos/:id', component: BankAccountDetailView, meta: { title: 'Cuenta Bancaria', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'bank-ficha' } },
        { path: 'ficha', name: 'bank-ficha', component: GenericFichaTab },
        { path: 'movimientos', name: 'bank-movimientos', component: BankAccountMovimientosTab },
      ]
    },

    // ── Events / Agenda ───────────────────────────────
    { path: '/agenda', name: 'events', component: EventListView, meta: { title: 'Agenda / Eventos', requiresAuth: true } },
    {
      path: '/agenda/:id', component: EventDetailView, meta: { title: 'Evento', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'event-ficha' } },
        { path: 'ficha', name: 'event-ficha', component: GenericFichaTab },
        { path: 'notas', name: 'event-notas', component: GenericNotasTab },
      ]
    },

    // ── Logistics (Shipments & Receptions) ────────────────
    { path: '/expediciones', name: 'shipments', component: () => import('../views/logistics/ShipmentListView.vue'), meta: { title: 'Expediciones', requiresAuth: true } },
    {
      path: '/expediciones/:id', component: () => import('../views/logistics/ShipmentDetailView.vue'), meta: { title: 'Ficha de Expedición', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'shipment-ficha' } },
        { path: 'ficha', name: 'shipment-ficha', component: GenericFichaTab },
      ]
    },
    { path: '/recepciones', name: 'receptions', component: () => import('../views/logistics/ReceptionListView.vue'), meta: { title: 'Recepciones', requiresAuth: true } },
    {
      path: '/recepciones/:id', component: () => import('../views/logistics/ReceptionDetailView.vue'), meta: { title: 'Ficha de Recepción', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'reception-ficha' } },
        { path: 'ficha', name: 'reception-ficha', component: GenericFichaTab },
      ]
    },

    // ── Interventions ─────────────────────────────────────
    { path: '/intervenciones', name: 'interventions', component: () => import('../views/interventions/InterventionListView.vue'), meta: { title: 'Partes de Trabajo', requiresAuth: true } },
    {
      path: '/intervenciones/:id', component: () => import('../views/interventions/InterventionDetailView.vue'), meta: { title: 'Ficha de Parte', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'intervention-ficha' } },
        { path: 'ficha', name: 'intervention-ficha', component: GenericFichaTab },
      ]
    },

    // ── HR (Expense Reports) ──────────────────────────────
    { path: '/notas-gasto', name: 'expense-reports', component: () => import('../views/hr/ExpenseReportListView.vue'), meta: { title: 'Notas de Gasto', requiresAuth: true } },
    {
      path: '/notas-gasto/:id', component: () => import('../views/hr/ExpenseReportDetailView.vue'), meta: { title: 'Nota de Gasto', requiresAuth: true },
      children: [
        { path: '', redirect: { name: 'expensereport-ficha' } },
        { path: 'ficha', name: 'expensereport-ficha', component: GenericFichaTab },
      ]
    },



  ]
})

// === DYNAMIC PLUGIN ROUTING ===
pluginsRegistry.forEach(plugin => {
  // Check if we already registered a manual route (fallback for transition)
  if (!router.hasRoute(plugin.key)) {
    // Parent List View
    router.addRoute({
      path: `/${plugin.key}`,
      name: plugin.key,
      component: GenericListView,
      meta: { title: plugin.labels.plural, requiresAuth: true, pluginKey: plugin.key }
    })
  }

  if (!router.hasRoute(`${plugin.key}-detail`)) {
    // Detail View
    router.addRoute({
      path: `/${plugin.key}/:id`,
      name: `${plugin.key}-detail`,
      component: GenericDetailView,
      meta: { title: plugin.labels.singular, requiresAuth: true, pluginKey: plugin.key },
      children: [
        { path: '', redirect: { name: `${plugin.key}-ficha` } },
        { path: 'ficha', name: `${plugin.key}-ficha`, component: GenericFichaTab },
        { path: 'notas', name: `${plugin.key}-notas`, component: GenericNotasTab },
      ]
    })
  }
})
// ==============================

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('alixar_token')
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth !== false && record.name !== 'login')

  if (requiresAuth && !token) {
    next({ name: 'login' })
  } else if (to.name === 'login' && token) {
    next({ name: 'dashboard' })
  } else {
    next()
  }
})

export default router
