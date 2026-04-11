<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from './api'
import type { ThirdParty, Project, BankAccount, CRMEvent } from './api'

// Dashboard State
const thirdParties = ref<ThirdParty[]>([])
const projects = ref<Project[]>([])
const bankAccounts = ref<BankAccount[]>([])
const events = ref<CRMEvent[]>([])
const loading = ref<boolean>(true)
const error = ref<string | null>(null)

const currentTab = ref('dashboard')

// Edit State
const editingThirdParty = ref<ThirdParty | null>(null)
const thirdPartyForm = ref<Partial<ThirdParty>>({ 
  name: '', name_alias: '', email: '', phone: '',
  address: '', zip: '', town: '', siren: '', url: '', code_client: ''
})
const isSaving = ref<boolean>(false)

onMounted(async () => {
  try {
    const [tpRes, projRes, bankRes, evRes] = await Promise.all([
      api.getThirdParties(),
      api.getProjects(),
      api.getBankAccounts(),
      api.getEvents()
    ])
    thirdParties.value = tpRes
    projects.value = projRes
    bankAccounts.value = bankRes
    events.value = evRes
  } catch (e: any) {
    error.value = e.message || 'Unknown error occurred'
  } finally {
    loading.value = false
  }
})

// --- Controladores CRUD ---

const startEdit = (tp: ThirdParty) => {
  editingThirdParty.value = tp
  thirdPartyForm.value = { ...tp }
}

const cancelEdit = () => {
  editingThirdParty.value = null
}

const saveThirdParty = async () => {
  if (!editingThirdParty.value) return
  isSaving.value = true
  try {
    const updatedTp = await api.updateThirdParty(editingThirdParty.value.id, thirdPartyForm.value)
    
    // In-place refresh (reactivity)
    const index = thirdParties.value.findIndex(t => t.id === updatedTp.id)
    if (index !== -1) {
      thirdParties.value[index] = updatedTp
    }
    cancelEdit()
  } catch (e: any) {
    alert("Error al guardar: " + e.message)
  } finally {
    isSaving.value = false
  }
}
</script>

<template>
  <div class="layout">
    <!-- Sidebar -->
    <aside class="sidebar glass-panel">
      <div class="logo">
        <h2>Alixar</h2>
        <span>Headless ERP</span>
      </div>
      <nav>
        <a href="#" :class="{ active: currentTab === 'dashboard' }" @click.prevent="currentTab = 'dashboard'">Dashboard</a>
        <a href="#" :class="{ active: currentTab === 'events' }" @click.prevent="currentTab = 'events'">Historial CRM</a>
        <a href="#" :class="{ active: currentTab === 'thirdparties' }" @click.prevent="currentTab = 'thirdparties'">Terceros</a>
        <a href="#" :class="{ active: currentTab === 'projects' }" @click.prevent="currentTab = 'projects'">Proyectos</a>
        <a href="#" :class="{ active: currentTab === 'bankaccounts' }" @click.prevent="currentTab = 'bankaccounts'">Tesorería</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header>
        <h1 v-if="currentTab === 'dashboard'">Panel Principal</h1>
        <h1 v-else-if="currentTab === 'events'">Historial CRM (Eventos)</h1>
        <h1 v-else-if="currentTab === 'thirdparties'">Directorio de Terceros</h1>
        <h1 v-else-if="currentTab === 'projects'">Gestión de Proyectos</h1>
        <h1 v-else-if="currentTab === 'bankaccounts'">Control de Tesorería</h1>
        
        <div class="user-profile">
          <div class="avatar">Admin</div>
        </div>
      </header>

      <div v-if="error" class="glass-panel error-panel">
        ⚠️ Error de conexión: {{ error }}
      </div>

      <div v-else-if="loading" class="loading">
         Cargando datos del ERP...
      </div>

      <div v-else class="content-grid">
        
        <!-- DASHBOARD TAB -->
        <template v-if="currentTab === 'dashboard'">
          <div class="metrics-row">
            <div class="metric-card glass-panel">
              <h3>Terceros Activos</h3>
              <div class="value">{{ thirdParties.length }}</div>
            </div>
            <div class="metric-card glass-panel">
              <h3>Interacciones CRM</h3>
              <div class="value">{{ events.length }}</div>
            </div>
            <div class="metric-card glass-panel">
              <h3>Proyectos Abiertos</h3>
              <div class="value">{{ projects.length }}</div>
            </div>
            <div class="metric-card glass-panel">
              <h3>Cuentas Bancarias</h3>
              <div class="value">{{ bankAccounts.length }}</div>
            </div>
          </div>

          <div class="table-card glass-panel">
            <div class="card-header">
              <h3>Últimos Eventos CRM</h3>
            </div>
            <div class="table-container">
              <table>
                <thead>
                  <tr>
                    <th>Fecha</th><th>Código</th><th>Asunto / Acción</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="ev in events.slice(0, 5)" :key="ev.id">
                    <td>{{ ev.dateStart || '-' }}</td>
                    <td><span class="badge">{{ ev.typeCode }}</span></td>
                    <td>{{ ev.title }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </template>

        <!-- EVENTS TAB (Timeline Style Simulation) -->
        <template v-if="currentTab === 'events'">
          <div class="table-card glass-panel">
            <div class="table-container">
              <table>
                <thead>
                  <tr><th>Fecha</th><th>Tipo</th><th>Asunto</th><th>Nota</th><th>Tercero ID</th></tr>
                </thead>
                <tbody>
                  <tr v-for="ev in events" :key="ev.id">
                    <td><strong>{{ ev.dateStart || '-' }}</strong></td>
                    <td><span class="badge">{{ ev.typeCode }}</span></td>
                    <td>{{ ev.title }}</td>
                    <td style="max-width:300px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" :title="ev.note">{{ ev.note || '-' }}</td>
                    <td>{{ ev.thirdPartyId ? `#${ev.thirdPartyId}` : '-' }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </template>

        <!-- THIRDPARTIES TAB -->
        <template v-if="currentTab === 'thirdparties'">
          <div class="table-card glass-panel">
            <div class="table-container">
              <table>
                <thead>
                  <tr><th>ID</th><th>Nombre</th><th>Alias</th><th>NIF/CIF</th><th>Población</th><th>Tlf</th><th>Acciones</th></tr>
                </thead>
                <tbody>
                  <tr v-for="tp in thirdParties" :key="tp.id">
                    <td>#{{ tp.id }}</td>
                    <td><strong>{{ tp.name }}</strong></td>
                    <td>{{ tp.name_alias || '-' }}</td>
                    <td><span class="badge">{{ tp.siren || 'Sin Identificar' }}</span></td>
                    <td>{{ tp.town || '-' }}</td>
                    <td>{{ tp.phone || '-' }}</td>
                    <td>
                      <button class="btn-icon" @click="startEdit(tp)" title="Editar">✏️</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </template>

        <!-- PROJECTS TAB -->
        <template v-if="currentTab === 'projects'">
          <div class="table-card glass-panel">
            <div class="table-container">
              <table>
                <thead>
                  <tr><th>ID</th><th>Ref</th><th>Título</th><th>Estado</th></tr>
                </thead>
                <tbody>
                  <tr v-for="proj in projects" :key="proj.id">
                    <td>#{{ proj.id }}</td>
                    <td>{{ proj.ref }}</td>
                    <td><strong>{{ proj.title }}</strong></td>
                    <td><span class="badge">{{ proj.status === 1 ? 'Activo' : 'Borrador' }}</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </template>

        <!-- BANK ACCOUNTS TAB -->
        <template v-if="currentTab === 'bankaccounts'">
          <div class="table-card glass-panel">
            <div class="table-container">
              <table>
                <thead>
                  <tr><th>Ref</th><th>Banco</th><th>Etiqueta</th><th>IBAN</th><th>Divisa</th></tr>
                </thead>
                <tbody>
                  <tr v-for="bank in bankAccounts" :key="bank.id">
                    <td>{{ bank.ref }}</td>
                    <td><strong>{{ bank.bank }}</strong></td>
                    <td>{{ bank.label }}</td>
                    <td>{{ bank.iban_prefix || '-' }}</td>
                    <td>{{ bank.currency_code }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </template>

      </div>
    </main>

    <!-- Superposición Modal de Edición -->
    <div v-if="editingThirdParty" class="modal-overlay" @click.self="cancelEdit">
      <div class="modal-content glass-panel modal-lg">
        <h2>Ficha de Tercero #{{ editingThirdParty.id }}</h2>
        <form @submit.prevent="saveThirdParty" class="form-grid">
          
          <div class="form-row">
            <div class="input-group">
              <label>Nombre Fiscal (Razón Social)</label>
              <input v-model="thirdPartyForm.name" type="text" required placeholder="Ej. Corporación Acme S.A." />
            </div>
            <div class="input-group">
              <label>Nombre Comercial / Alias</label>
              <input v-model="thirdPartyForm.name_alias" type="text" placeholder="Ej. Acme" />
            </div>
          </div>

          <div class="form-row">
            <div class="input-group">
              <label>Identidad Fiscal (NIF/CIF/Siren)</label>
              <input v-model="thirdPartyForm.siren" type="text" placeholder="Ej. B-01234567" />
            </div>
            <div class="input-group">
              <label>Código de Cliente/Proveedor</label>
              <input v-model="thirdPartyForm.code_client" type="text" placeholder="CLI-001" />
            </div>
          </div>

          <hr class="divider"/>

          <div class="input-group">
            <label>Dirección Completa</label>
            <input v-model="thirdPartyForm.address" type="text" placeholder="C/ Industrial 42, Nave B" />
          </div>

          <div class="form-row">
            <div class="input-group">
              <label>Código Postal</label>
              <input v-model="thirdPartyForm.zip" type="text" placeholder="28001" />
            </div>
            <div class="input-group">
              <label>Localidad / Población</label>
              <input v-model="thirdPartyForm.town" type="text" placeholder="Madrid" />
            </div>
          </div>

          <hr class="divider"/>

          <div class="form-row">
            <div class="input-group">
              <label>Correo Electrónico Principal</label>
              <input v-model="thirdPartyForm.email" type="email" placeholder="contacto@empresa.com" />
            </div>
            <div class="input-group">
              <label>Teléfono Oficial</label>
              <input v-model="thirdPartyForm.phone" type="text" placeholder="+34 600..." />
            </div>
          </div>

          <div class="input-group">
            <label>Sitio Web</label>
            <input v-model="thirdPartyForm.url" type="url" placeholder="https://..." />
          </div>

          <div class="modal-actions">
            <button type="button" class="btn-secondary" @click="cancelEdit" :disabled="isSaving">Cerrar</button>
            <button type="submit" class="btn-primary" :disabled="isSaving">
              {{ isSaving ? 'Guardando en Dolibarr...' : 'Guardar Ficha' }}
            </button>
          </div>

        </form>
      </div>
    </div>

  </div>
</template>

<style scoped>
.badge {
  background: rgba(16, 185, 129, 0.2);
  color: #34D399;
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
}
.layout {
  display: flex;
  min-height: 100vh;
  padding: 1.5rem;
  gap: 1.5rem;
  max-width: 1600px;
  margin: 0 auto;
}

/* Sidebar */
.sidebar {
  width: 280px;
  padding: 2rem;
  display: flex;
  flex-direction: column;
  gap: 3rem;
}

.logo h2 {
  font-size: 1.75rem;
  font-weight: 700;
  background: linear-gradient(to right, #818CF8, #C084FC);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.logo span {
  font-size: 0.85rem;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

nav {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

nav a {
  padding: 0.75rem 1rem;
  border-radius: 8px;
  color: var(--text-muted);
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s;
}

nav a:hover, nav a.active {
  background: rgba(255, 255, 255, 0.05);
  color: var(--text-main);
}
nav a.active {
  border-left: 3px solid var(--primary);
  background: linear-gradient(90deg, rgba(79, 70, 229, 0.1) 0%, transparent 100%);
}

/* Main Content */
.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 0;
}

header h1 {
  font-size: 2rem;
  font-weight: 600;
}

.avatar {
  background: var(--primary);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 600;
}

/* Grid & Cards */
.content-grid {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.metrics-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 1.5rem;
}

.metric-card {
  padding: 2rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.metric-card h3 {
  font-size: 1rem;
  color: var(--text-muted);
  font-weight: 500;
}

.metric-card .value {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-main);
}

.table-card {
  padding: 2rem;
}

.card-header {
  margin-bottom: 1.5rem;
}
.card-header h3 {
  font-size: 1.25rem;
  font-weight: 600;
}

.error-panel {
  padding: 1.5rem;
  background: rgba(239, 68, 68, 0.1);
  border-color: rgba(239, 68, 68, 0.2);
  color: #FCA5A5;
}

.loading {
  font-size: 1.25rem;
  color: var(--text-muted);
  text-align: center;
  padding: 4rem;
}

/* Botones y Acciones */
.btn-icon {
  background: transparent;
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  cursor: pointer;
  padding: 6px 10px;
  border-radius: 8px;
  transition: all 0.2s ease;
}
.btn-icon:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-1px);
}

/* Modal UI */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.6);
  backdrop-filter: blur(4px);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 100;
}
.modal-content {
  width: 550px;
  max-width: 95%;
  padding: 30px;
}
.modal-lg {
  width: 700px;
}
.modal-content h2 {
  margin-top: 0;
  margin-bottom: 25px;
  font-size: 1.4rem;
  color: #fff;
  border-bottom: 1px solid rgba(255,255,255,0.1);
  padding-bottom: 15px;
}
.form-grid {
  display: flex;
  flex-direction: column;
  gap: 15px;
}
.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
}
.divider {
  border: 0;
  border-top: 1px dashed rgba(255,255,255,0.1);
  margin: 10px 0;
}
.input-group label {
  display: block;
  font-size: 0.85rem;
  color: rgba(255, 255, 255, 0.7);
  margin-bottom: 5px;
}
.input-group input {
  width: 100%;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  padding: 10px 15px;
  border-radius: 8px;
  font-family: inherit;
  font-size: 0.95rem;
  outline: none;
  transition: border 0.3s;
}
.input-group input:focus {
  border-color: #a855f7;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  margin-top: 20px;
}
.btn-secondary {
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  padding: 10px 20px;
  border-radius: 8px;
  cursor: pointer;
}
.btn-secondary:hover {
  background: rgba(255, 255, 255, 0.1);
}
.btn-primary {
  background: linear-gradient(135deg, #a855f7 0%, #3b82f6 100%);
  border: none;
  color: #fff;
  padding: 10px 20px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
}
.btn-primary:active {
  transform: scale(0.98);
}
.btn-primary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
