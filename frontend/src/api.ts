// frontend/src/api.ts — Alixar Headless ERP API Client

export const DOLAPIKEY = 'test-key-or-change-me';

// ═══════════════════════════════════════════════════════════
// Pagination & Query Types
// ═══════════════════════════════════════════════════════════

export interface ListParams {
  limit?: number
  page?: number        // 0-indexed for Dolibarr compat
  sortfield?: string
  sortorder?: 'ASC' | 'DESC'
  [key: string]: any   // additional filters
}

export interface PaginatedResult<T> {
  data: T[]
  total: number
}

// ═══════════════════════════════════════════════════════════
// Domain Interfaces
// ═══════════════════════════════════════════════════════════

export interface ThirdParty {
  id: number
  name: string
  name_alias?: string
  email?: string
  phone?: string
  client: number
  fournisseur?: number
  address?: string
  zip?: string
  town?: string
  country_id?: number
  siren?: string
  url?: string
  code_client?: string
  code_fournisseur?: string
  status?: number
  [key: string]: any
}

export interface Contact {
  id: number
  lastname: string
  firstname?: string
  email?: string
  phone_pro?: string
  phone_mobile?: string
  jobTitle?: string
  town?: string
  thirdPartyId?: number
  fk_soc?: number
  [key: string]: any
}

export interface Product {
  id: number
  ref: string
  label: string
  type: string
  price?: number
  price_ttc?: number
  tva_tx?: number
  status?: number
  status_buy?: string
  description?: string
  barcode?: string
  [key: string]: any
}

export interface Invoice {
  id: number
  ref: string
  ref_ext?: string
  type: number
  fk_soc: number
  socname?: string
  datef?: string
  date_lim_reglement?: string
  total_ht?: number
  total_tva?: number
  total_ttc?: number
  paye?: number
  fk_statut?: number
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface InvoiceLine {
  id: number
  fk_facture?: number
  description: string
  qty: number
  subprice: number
  tva_tx: number
  total_ht: number
  total_tva: number
  total_ttc: number
  fk_product?: number
  product_ref?: string
  product_label?: string
  remise_percent?: number
  [key: string]: any
}

export interface Proposal {
  id: number
  ref: string
  ref_client?: string
  fk_soc: number
  socname?: string
  datep?: string
  fin_validite?: string
  total_ht?: number
  total_tva?: number
  total_ttc?: number
  fk_statut?: number
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface ProposalLine {
  id: number
  fk_propal?: number
  description: string
  qty: number
  subprice: number
  tva_tx: number
  total_ht: number
  total_tva: number
  total_ttc: number
  fk_product?: number
  product_ref?: string
  remise_percent?: number
  [key: string]: any
}

export interface Order {
  id: number
  ref: string
  ref_client?: string
  fk_soc: number
  socname?: string
  date_commande?: string
  total_ht?: number
  total_tva?: number
  total_ttc?: number
  fk_statut?: number
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface OrderLine {
  id: number
  fk_commande?: number
  description: string
  qty: number
  subprice: number
  tva_tx: number
  total_ht: number
  total_tva: number
  total_ttc: number
  fk_product?: number
  product_ref?: string
  remise_percent?: number
  [key: string]: any
}

export interface SupplierInvoice {
  id: number
  ref: string
  ref_supplier?: string
  fk_soc: number
  socname?: string
  datef?: string
  total_ht?: number
  total_tva?: number
  total_ttc?: number
  fk_statut?: number
  paye?: number
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface SupplierOrder {
  id: number
  ref: string
  ref_supplier?: string
  fk_soc: number
  socname?: string
  date_commande?: string
  total_ht?: number
  total_tva?: number
  total_ttc?: number
  fk_statut?: number
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface Project {
  id: number
  ref: string
  title: string
  fk_soc?: number
  socname?: string
  fk_statut?: number
  datec?: string
  dateo?: string
  datee?: string
  description?: string
  note_private?: string
  note_public?: string
  [key: string]: any
}

export interface Task {
  id: number
  ref?: string
  label: string
  fk_projet: number
  dateo?: string
  datee?: string
  progress?: number
  description?: string
  [key: string]: any
}

export interface BankAccount {
  id: number
  ref: string
  label: string
  bank: string
  iban_prefix?: string
  bic?: string
  currency_code: string
  account_number?: string
  min_allowed?: number
  min_desired?: number
  [key: string]: any
}

export interface BankTransaction {
  id: number
  fk_account: number
  dateo?: string
  datev?: string
  amount: number
  label: string
  num_chq?: string
  fk_type?: string
  [key: string]: any
}

export interface CRMEvent {
  id: number
  ref?: string
  title: string
  typeCode: string
  dateStart?: string
  dateEnd?: string
  note?: string
  percentage?: number
  thirdPartyId?: number
  contactId?: number
  projectId?: number
  [key: string]: any
}

export interface MenuNode {
  id: string
  label: string
  icon: string
  route: string
  position: number
  children: MenuNode[]
}

export interface NavigationTree {
  top: MenuNode[]
  left: MenuNode[]
}

// ═══════════════════════════════════════════════════════════
// API Service
// ═══════════════════════════════════════════════════════════

class ApiService {
  constructor(private baseUrl: string) {}

  /**
   * Generic HTTP request with optional query params for pagination/filtering.
   */
  async request<T>(
    endpoint: string,
    method: string = 'GET',
    data: any = null,
    params?: Record<string, any>
  ): Promise<T> {
    let url = `${this.baseUrl}${endpoint}`

    // Serialize query params
    if (params) {
      const filtered = Object.entries(params).filter(([, v]) => v !== undefined && v !== null && v !== '')
      if (filtered.length > 0) {
        const qs = new URLSearchParams(filtered.map(([k, v]) => [k, String(v)])).toString()
        url += (url.includes('?') ? '&' : '?') + qs
      }
    }

    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
      'DOLAPIKEY': DOLAPIKEY
    }

    const token = localStorage.getItem('alixar_token')
    if (token) {
      headers['Authorization'] = `Bearer ${token}`
    }

    const config: RequestInit = { method, headers }
    if (data) config.body = JSON.stringify(data)

    try {
      const response = await fetch(url, config)
      if (response.status === 401) {
        localStorage.removeItem('alixar_token')
        localStorage.removeItem('alixar_user')
        window.location.href = '/login'
        throw new Error('No autorizado. Sesión expirada.')
      }
      
      if (!response.ok) {
        let errorMsg = `Error ${response.status}: ${response.statusText}`
        try {
          const errData = await response.json()
          if (errData.error?.message) errorMsg = errData.error.message
        } catch (_) {}
        throw new Error(errorMsg)
      }
      return await response.json() as T
    } catch (error: any) {
      console.error(`API Error on ${method} ${endpoint}:`, error)
      throw error
    }
  }

  /**
   * Generic list with pagination support.
   * Returns the array directly (total can come from array length or a future header).
   */
  async list<T>(endpoint: string, params?: ListParams): Promise<T[]> {
    return this.request<T[]>(endpoint, 'GET', null, params)
  }

  // ── Third Parties ──────────────────────────────────────

  getThirdParties(params?: ListParams): Promise<ThirdParty[]> {
    return this.list<ThirdParty>('/thirdparties', params)
  }
  getThirdParty(id: number): Promise<ThirdParty> {
    return this.request<ThirdParty>(`/thirdparties/${id}`)
  }
  createThirdParty(data: Partial<ThirdParty>): Promise<number> {
    return this.request<number>('/thirdparties', 'POST', data)
  }
  updateThirdParty(id: number, data: Partial<ThirdParty>): Promise<ThirdParty> {
    return this.request<ThirdParty>(`/thirdparties/${id}`, 'PUT', data)
  }
  deleteThirdParty(id: number): Promise<any> {
    return this.request(`/thirdparties/${id}`, 'DELETE')
  }

  // ── Contacts ───────────────────────────────────────────

  getContacts(params?: ListParams): Promise<Contact[]> {
    return this.list<Contact>('/contacts', params)
  }
  getContact(id: number): Promise<Contact> {
    return this.request<Contact>(`/contacts/${id}`)
  }
  createContact(data: Partial<Contact>): Promise<number> {
    return this.request<number>('/contacts', 'POST', data)
  }
  updateContact(id: number, data: Partial<Contact>): Promise<Contact> {
    return this.request<Contact>(`/contacts/${id}`, 'PUT', data)
  }
  deleteContact(id: number): Promise<any> {
    return this.request(`/contacts/${id}`, 'DELETE')
  }

  // ── Products ───────────────────────────────────────────

  getProducts(params?: ListParams): Promise<Product[]> {
    return this.list<Product>('/products', params)
  }
  getProduct(id: number): Promise<Product> {
    return this.request<Product>(`/products/${id}`)
  }
  createProduct(data: Partial<Product>): Promise<number> {
    return this.request<number>('/products', 'POST', data)
  }
  updateProduct(id: number, data: Partial<Product>): Promise<Product> {
    return this.request<Product>(`/products/${id}`, 'PUT', data)
  }
  deleteProduct(id: number): Promise<any> {
    return this.request(`/products/${id}`, 'DELETE')
  }

  // ── Invoices ───────────────────────────────────────────

  getInvoices(params?: ListParams): Promise<Invoice[]> {
    return this.list<Invoice>('/invoices', params)
  }
  getInvoice(id: number): Promise<Invoice> {
    return this.request<Invoice>(`/invoices/${id}`)
  }
  createInvoice(data: Partial<Invoice>): Promise<number> {
    return this.request<number>('/invoices', 'POST', data)
  }
  updateInvoice(id: number, data: Partial<Invoice>): Promise<Invoice> {
    return this.request<Invoice>(`/invoices/${id}`, 'PUT', data)
  }
  deleteInvoice(id: number): Promise<any> {
    return this.request(`/invoices/${id}`, 'DELETE')
  }
  getInvoiceLines(id: number): Promise<InvoiceLine[]> {
    return this.request<InvoiceLine[]>(`/invoices/${id}/lines`)
  }
  addInvoiceLine(id: number, data: Partial<InvoiceLine>): Promise<number> {
    return this.request<number>(`/invoices/${id}/lines`, 'POST', data)
  }
  updateInvoiceLine(id: number, lineId: number, data: Partial<InvoiceLine>): Promise<InvoiceLine> {
    return this.request<InvoiceLine>(`/invoices/${id}/lines/${lineId}`, 'PUT', data)
  }
  deleteInvoiceLine(id: number, lineId: number): Promise<any> {
    return this.request(`/invoices/${id}/lines/${lineId}`, 'DELETE')
  }
  validateInvoice(id: number): Promise<any> {
    return this.request(`/invoices/${id}/validate`, 'POST')
  }
  setInvoicePaid(id: number): Promise<any> {
    return this.request(`/invoices/${id}/settopaid`, 'POST')
  }

  // ── Proposals ──────────────────────────────────────────

  getProposals(params?: ListParams): Promise<Proposal[]> {
    return this.list<Proposal>('/proposals', params)
  }
  getProposal(id: number): Promise<Proposal> {
    return this.request<Proposal>(`/proposals/${id}`)
  }
  createProposal(data: Partial<Proposal>): Promise<number> {
    return this.request<number>('/proposals', 'POST', data)
  }
  updateProposal(id: number, data: Partial<Proposal>): Promise<Proposal> {
    return this.request<Proposal>(`/proposals/${id}`, 'PUT', data)
  }
  deleteProposal(id: number): Promise<any> {
    return this.request(`/proposals/${id}`, 'DELETE')
  }
  getProposalLines(id: number): Promise<ProposalLine[]> {
    return this.request<ProposalLine[]>(`/proposals/${id}/lines`)
  }
  addProposalLine(id: number, data: Partial<ProposalLine>): Promise<number> {
    return this.request<number>(`/proposals/${id}/lines`, 'POST', data)
  }
  updateProposalLine(id: number, lineId: number, data: Partial<ProposalLine>): Promise<ProposalLine> {
    return this.request<ProposalLine>(`/proposals/${id}/lines/${lineId}`, 'PUT', data)
  }
  deleteProposalLine(id: number, lineId: number): Promise<any> {
    return this.request(`/proposals/${id}/lines/${lineId}`, 'DELETE')
  }
  validateProposal(id: number): Promise<any> {
    return this.request(`/proposals/${id}/validate`, 'POST')
  }
  closeProposal(id: number, data?: { status?: number; note_private?: string }): Promise<any> {
    return this.request(`/proposals/${id}/close`, 'POST', data)
  }

  // ── Orders ─────────────────────────────────────────────

  getOrders(params?: ListParams): Promise<Order[]> {
    return this.list<Order>('/orders', params)
  }
  getOrder(id: number): Promise<Order> {
    return this.request<Order>(`/orders/${id}`)
  }
  createOrder(data: Partial<Order>): Promise<number> {
    return this.request<number>('/orders', 'POST', data)
  }
  updateOrder(id: number, data: Partial<Order>): Promise<Order> {
    return this.request<Order>(`/orders/${id}`, 'PUT', data)
  }
  deleteOrder(id: number): Promise<any> {
    return this.request(`/orders/${id}`, 'DELETE')
  }
  getOrderLines(id: number): Promise<OrderLine[]> {
    return this.request<OrderLine[]>(`/orders/${id}/lines`)
  }
  addOrderLine(id: number, data: Partial<OrderLine>): Promise<number> {
    return this.request<number>(`/orders/${id}/lines`, 'POST', data)
  }
  updateOrderLine(id: number, lineId: number, data: Partial<OrderLine>): Promise<OrderLine> {
    return this.request<OrderLine>(`/orders/${id}/lines/${lineId}`, 'PUT', data)
  }
  deleteOrderLine(id: number, lineId: number): Promise<any> {
    return this.request(`/orders/${id}/lines/${lineId}`, 'DELETE')
  }
  validateOrder(id: number): Promise<any> {
    return this.request(`/orders/${id}/validate`, 'POST')
  }
  closeOrder(id: number): Promise<any> {
    return this.request(`/orders/${id}/close`, 'POST')
  }

  // ── Supplier Invoices ──────────────────────────────────

  getSupplierInvoices(params?: ListParams): Promise<SupplierInvoice[]> {
    return this.list<SupplierInvoice>('/supplierinvoices', params)
  }
  getSupplierInvoice(id: number): Promise<SupplierInvoice> {
    return this.request<SupplierInvoice>(`/supplierinvoices/${id}`)
  }
  createSupplierInvoice(data: Partial<SupplierInvoice>): Promise<number> {
    return this.request<number>('/supplierinvoices', 'POST', data)
  }
  updateSupplierInvoice(id: number, data: Partial<SupplierInvoice>): Promise<SupplierInvoice> {
    return this.request<SupplierInvoice>(`/supplierinvoices/${id}`, 'PUT', data)
  }
  deleteSupplierInvoice(id: number): Promise<any> {
    return this.request(`/supplierinvoices/${id}`, 'DELETE')
  }
  getSupplierInvoiceLines(id: number): Promise<InvoiceLine[]> {
    return this.request<InvoiceLine[]>(`/supplierinvoices/${id}/lines`)
  }
  addSupplierInvoiceLine(id: number, data: Partial<InvoiceLine>): Promise<number> {
    return this.request<number>(`/supplierinvoices/${id}/lines`, 'POST', data)
  }
  validateSupplierInvoice(id: number): Promise<any> {
    return this.request(`/supplierinvoices/${id}/validate`, 'POST')
  }
  setSupplierInvoicePaid(id: number): Promise<any> {
    return this.request(`/supplierinvoices/${id}/settopaid`, 'POST')
  }

  // ── Supplier Orders ────────────────────────────────────

  getSupplierOrders(params?: ListParams): Promise<SupplierOrder[]> {
    return this.list<SupplierOrder>('/supplierorders', params)
  }
  getSupplierOrder(id: number): Promise<SupplierOrder> {
    return this.request<SupplierOrder>(`/supplierorders/${id}`)
  }
  createSupplierOrder(data: Partial<SupplierOrder>): Promise<number> {
    return this.request<number>('/supplierorders', 'POST', data)
  }
  updateSupplierOrder(id: number, data: Partial<SupplierOrder>): Promise<SupplierOrder> {
    return this.request<SupplierOrder>(`/supplierorders/${id}`, 'PUT', data)
  }
  deleteSupplierOrder(id: number): Promise<any> {
    return this.request(`/supplierorders/${id}`, 'DELETE')
  }
  getSupplierOrderLines(id: number): Promise<OrderLine[]> {
    return this.request<OrderLine[]>(`/supplierorders/${id}/lines`)
  }
  addSupplierOrderLine(id: number, data: Partial<OrderLine>): Promise<number> {
    return this.request<number>(`/supplierorders/${id}/lines`, 'POST', data)
  }
  validateSupplierOrder(id: number): Promise<any> {
    return this.request(`/supplierorders/${id}/validate`, 'POST')
  }
  closeSupplierOrder(id: number): Promise<any> {
    return this.request(`/supplierorders/${id}/close`, 'POST')
  }

  // ── Projects ───────────────────────────────────────────

  getProjects(params?: ListParams): Promise<Project[]> {
    return this.list<Project>('/projects', params)
  }
  getProject(id: number): Promise<Project> {
    return this.request<Project>(`/projects/${id}`)
  }
  createProject(data: Partial<Project>): Promise<number> {
    return this.request<number>('/projects', 'POST', data)
  }
  updateProject(id: number, data: Partial<Project>): Promise<Project> {
    return this.request<Project>(`/projects/${id}`, 'PUT', data)
  }
  deleteProject(id: number): Promise<any> {
    return this.request(`/projects/${id}`, 'DELETE')
  }
  getProjectTasks(id: number): Promise<Task[]> {
    return this.request<Task[]>(`/projects/${id}/tasks`)
  }
  addProjectTask(id: number, data: Partial<Task>): Promise<number> {
    return this.request<number>(`/projects/${id}/tasks`, 'POST', data)
  }
  updateProjectTask(id: number, taskId: number, data: Partial<Task>): Promise<Task> {
    return this.request<Task>(`/projects/${id}/tasks/${taskId}`, 'PUT', data)
  }
  deleteProjectTask(id: number, taskId: number): Promise<any> {
    return this.request(`/projects/${id}/tasks/${taskId}`, 'DELETE')
  }
  validateProject(id: number): Promise<any> {
    return this.request(`/projects/${id}/validate`, 'POST')
  }

  // ── Bank Accounts ──────────────────────────────────────

  getBankAccounts(params?: ListParams): Promise<BankAccount[]> {
    return this.list<BankAccount>('/bankaccounts', params)
  }
  getBankAccount(id: number): Promise<BankAccount> {
    return this.request<BankAccount>(`/bankaccounts/${id}`)
  }
  createBankAccount(data: Partial<BankAccount>): Promise<number> {
    return this.request<number>('/bankaccounts', 'POST', data)
  }
  updateBankAccount(id: number, data: Partial<BankAccount>): Promise<BankAccount> {
    return this.request<BankAccount>(`/bankaccounts/${id}`, 'PUT', data)
  }
  deleteBankAccount(id: number): Promise<any> {
    return this.request(`/bankaccounts/${id}`, 'DELETE')
  }
  getBankTransactions(id: number): Promise<BankTransaction[]> {
    return this.request<BankTransaction[]>(`/bankaccounts/${id}/transactions`)
  }
  addBankTransaction(id: number, data: Partial<BankTransaction>): Promise<number> {
    return this.request<number>(`/bankaccounts/${id}/transactions`, 'POST', data)
  }

  // ── Events / Agenda ────────────────────────────────────

  getEvents(params?: ListParams): Promise<CRMEvent[]> {
    return this.list<CRMEvent>('/events', params)
  }
  getEvent(id: number): Promise<CRMEvent> {
    return this.request<CRMEvent>(`/events/${id}`)
  }
  createEvent(data: Partial<CRMEvent>): Promise<number> {
    return this.request<number>('/events', 'POST', data)
  }
  updateEvent(id: number, data: Partial<CRMEvent>): Promise<CRMEvent> {
    return this.request<CRMEvent>(`/events/${id}`, 'PUT', data)
  }
  deleteEvent(id: number): Promise<any> {
    return this.request(`/events/${id}`, 'DELETE')
  }

  // ── Setup / Navigation ─────────────────────────────────

  getNavigationTree(mainmenu: string = ''): Promise<NavigationTree> {
    return this.request<NavigationTree>(`/setup/menus?mainmenu=${mainmenu}`)
  }

  // ── Auth ───────────────────────────────────────────────

  login(credentials: { username?: string, email?: string, password: string }): Promise<{ token: string, expires_at: number, user: any }> {
    return this.request<{ token: string, expires_at: number, user: any }>('/auth/login', 'POST', credentials)
  }

  logout(): Promise<any> {
    return this.request('/auth/logout', 'POST')
  }

  // ── Core Domain (Users & Roles) ────────────────────────
  
  getUsers(params?: ListParams): Promise<any[]> {
    return this.list<any>('/users', params)
  }
  getUser(id: number): Promise<any> {
    return this.request<any>(`/users/${id}`)
  }
  createUser(data: any): Promise<number> {
    return this.request<number>('/users', 'POST', data)
  }
  updateUser(id: number, data: any): Promise<any> {
    return this.request<any>(`/users/${id}`, 'PUT', data)
  }
  deleteUser(id: number): Promise<any> {
    return this.request(`/users/${id}`, 'DELETE')
  }
  updateUserRoles(id: number, roleIds: number[]): Promise<any> {
    return this.request(`/users/${id}/roles`, 'PUT', { role_ids: roleIds })
  }

  getRoles(params?: ListParams): Promise<any[]> {
    return this.list<any>('/roles', params)
  }
  getRole(id: number): Promise<any> {
    return this.request<any>(`/roles/${id}`)
  }
  createRole(data: any): Promise<number> {
    return this.request<number>('/roles', 'POST', data)
  }
  updateRole(id: number, data: any): Promise<any> {
    return this.request<any>(`/roles/${id}`, 'PUT', data)
  }
  deleteRole(id: number): Promise<any> {
    return this.request(`/roles/${id}`, 'DELETE')
  }
  getPermissions(plugin: string = ''): Promise<any[]> {
    const endpoint = plugin ? `/permissions/${plugin}` : '/permissions';
    return this.request<any[]>(endpoint, 'GET')
  }
  syncRolePermissions(roleId: number, permissionIds: number[]): Promise<any> {
    return this.request(`/roles/${roleId}/permissions`, 'PUT', { permission_ids: permissionIds })
  }

  // ── Logistics (Shipments & Receptions) ─────────────────
  getShipments(params?: ListParams): Promise<any[]> { return this.list<any>('/shipments', params) }
  getShipment(id: number): Promise<any> { return this.request<any>(`/shipments/${id}`) }
  createShipment(data: any): Promise<number> { return this.request<number>('/shipments', 'POST', data) }
  updateShipment(id: number, data: any): Promise<any> { return this.request<any>(`/shipments/${id}`, 'PUT', data) }
  deleteShipment(id: number): Promise<any> { return this.request(`/shipments/${id}`, 'DELETE') }

  getReceptions(params?: ListParams): Promise<any[]> { return this.list<any>('/receptions', params) }
  getReception(id: number): Promise<any> { return this.request<any>(`/receptions/${id}`) }
  createReception(data: any): Promise<number> { return this.request<number>('/receptions', 'POST', data) }
  updateReception(id: number, data: any): Promise<any> { return this.request<any>(`/receptions/${id}`, 'PUT', data) }
  deleteReception(id: number): Promise<any> { return this.request(`/receptions/${id}`, 'DELETE') }

  // ── Interventions ──────────────────────────────────────
  getInterventions(params?: ListParams): Promise<any[]> { return this.list<any>('/interventions', params) }
  getIntervention(id: number): Promise<any> { return this.request<any>(`/interventions/${id}`) }
  createIntervention(data: any): Promise<number> { return this.request<number>('/interventions', 'POST', data) }
  updateIntervention(id: number, data: any): Promise<any> { return this.request<any>(`/interventions/${id}`, 'PUT', data) }
  deleteIntervention(id: number): Promise<any> { return this.request(`/interventions/${id}`, 'DELETE') }

  // ── HR (Expense Reports) ───────────────────────────────
  getExpenseReports(params?: ListParams): Promise<any[]> { return this.list<any>('/expensereports', params) }
  getExpenseReport(id: number): Promise<any> { return this.request<any>(`/expensereports/${id}`) }
  createExpenseReport(data: any): Promise<number> { return this.request<number>('/expensereports', 'POST', data) }
  updateExpenseReport(id: number, data: any): Promise<any> { return this.request<any>(`/expensereports/${id}`, 'PUT', data) }
  deleteExpenseReport(id: number): Promise<any> { return this.request(`/expensereports/${id}`, 'DELETE') }
}

// Ensure you point to your correct port!
export const api = new ApiService('http://localhost:8083/api')
