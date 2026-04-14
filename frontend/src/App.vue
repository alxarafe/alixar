<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { api } from './api'
import type { NavigationTree } from './api'
import { useAuthStore } from './stores/auth'

const route = useRoute()
const router = useRouter()
const authStore = useAuthStore()

// Fallback sidebar if API menus unavailable
interface MenuGroup {
  id: string
  label: string
  icon?: string
  route?: string
  children?: MenuGroup[]
  isOpen?: boolean
}

const sidebarGroups = ref<MenuGroup[]>([
  { id: 'home', label: 'Panel Principal', icon: '📊', route: '/' },
  {
    id: 'identity',
    label: 'Identidad y Seguridad',
    icon: '🛡️',
    isOpen: true,
    children: [
      { id: 'users', label: 'Usuarios', route: '/usuarios' },
      { id: 'roles', label: 'Roles y Permisos', route: '/roles' }
    ]
  },
  {
    id: 'crm',
    label: 'Facturación y CRM',
    icon: '🏢',
    isOpen: false,
    children: [
      { id: 'companies', label: 'Terceros (Clientes)', route: '/terceros' },
      { id: 'contacts', label: 'Contactos', route: '/contactos' },
      { id: 'invoices', label: 'Facturas', route: '/facturas' }
    ]
  },
  {
    id: 'catalog',
    label: 'Almacén y Catálogo',
    icon: '📦',
    isOpen: false,
    children: [
      { id: 'products', label: 'Productos y Servicios', route: '/productos' }
    ]
  }
])

const toggleGroup = (group: MenuGroup) => {
  if (group.children) {
    group.isOpen = !group.isOpen
  } else if (group.route) {
    router.push(group.route)
  }
}

const searchSpotlight = ref('')
const isSpotlightFocused = ref(false)

const handleLogout = () => {
  authStore.logout()
  router.push('/login')
}
</script>

<template>
  <template v-if="route.name === 'login'">
    <router-view></router-view>
  </template>
  <div v-else class="layout">
    <!-- Sidebar -->
    <aside class="sidebar glass-panel">
      <div class="logo">
        <h2>Alixar</h2>
        <span>Headless ERP</span>
      </div>
      <nav>
        <div v-for="group in sidebarGroups" :key="group.id" class="nav-group">
            <template v-if="group.children">
              <div class="nav-group-header" @click="toggleGroup(group)">
                <span class="group-title">{{ group.icon }} {{ group.label }}</span>
                <span class="chevron" :class="{ open: group.isOpen }">▼</span>
              </div>
              <div class="nav-group-items" v-show="group.isOpen">
                <router-link
                  v-for="child in group.children"
                  :key="child.id"
                  :to="child.route!"
                  active-class="active"
                >
                  {{ child.label }}
                </router-link>
              </div>
            </template>
            <template v-else>
              <router-link :to="group.route!" class="nav-single-item" active-class="active" exact-active-class="active">
                {{ group.icon }} {{ group.label }}
              </router-link>
            </template>
          </div>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header>
        <div class="header-left">
          <h1>{{ (route.meta?.title as string) || 'Alixar' }}</h1>
        </div>
        
        <div class="spotlight-container" :class="{ 'focused': isSpotlightFocused }">
          <span class="spotlight-icon">🔍</span>
          <input 
            type="text" 
            v-model="searchSpotlight" 
            placeholder="Buscar o saltar a (Ctrl + K)..." 
            @focus="isSpotlightFocused = true"
            @blur="isSpotlightFocused = false"
          />
          <div v-if="searchSpotlight" class="spotlight-results glass-panel">
            <div class="p-4 text-gray-400 text-sm">Buscando "{{ searchSpotlight }}"...</div>
          </div>
        </div>

        <div class="user-profile">
          <span class="user-name" v-if="authStore.user">{{ authStore.user.username }}</span>
          <div class="avatar">{{ authStore.user ? authStore.user.username.charAt(0).toUpperCase() : 'A' }}</div>
          <button @click="handleLogout" class="btn-logout" title="Cerrar Sessión">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
          </button>
        </div>
      </header>

      <div class="content-grid">
        <router-view></router-view>
      </div>
    </main>
  </div>
</template>

<style scoped>
  .nav-loading {
    color: var(--text-muted);
    font-size: 0.8rem;
    font-weight: 600;
  }
</style>

<style>
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
  width: 260px;
  min-width: 260px;
  padding: 2rem 1.25rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
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
  gap: 12px;
}

.nav-group {
  display: flex;
  flex-direction: column;
}

.nav-group-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 12px;
  cursor: pointer;
  border-radius: 8px;
  color: var(--text-main);
  font-weight: 600;
  font-size: 0.9rem;
  transition: background 0.2s;
}

.nav-group-header:hover {
  background: rgba(255, 255, 255, 0.05);
}

.chevron {
  font-size: 0.7rem;
  transition: transform 0.2s;
  color: var(--text-muted);
}
.chevron.open {
  transform: rotate(180deg);
}

.nav-group-items {
  display: flex;
  flex-direction: column;
  margin-top: 4px;
  margin-left: 12px;
  border-left: 1px solid rgba(255,255,255,0.1);
  padding-left: 8px;
  gap: 2px;
}

nav a, .nav-single-item {
  padding: 8px 12px;
  border-radius: 8px;
  color: var(--text-muted);
  text-decoration: none;
  font-weight: 500;
  font-size: 0.85rem;
  transition: all 0.2s;
}

nav a:hover, nav a.active, .nav-single-item:hover {
  background: rgba(255, 255, 255, 0.05);
  color: var(--text-main);
}
nav a.active {
  color: var(--primary);
  background: linear-gradient(90deg, rgba(79, 70, 229, 0.1) 0%, transparent 100%);
}

/* Main Content */
.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  min-width: 0;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.5rem 0 1rem;
  border-bottom: 1px solid rgba(255,255,255,0.05);
  margin-bottom: 1rem;
}

.header-left {
  display: flex;
  align-items: center;
  width: 250px;
}

header h1 {
  font-size: 1.5rem;
  font-weight: 600;
  margin: 0;
}

.spotlight-container {
  flex: 1;
  max-width: 500px;
  position: relative;
  display: flex;
  align-items: center;
  background: rgba(0, 0, 0, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  padding: 0 1rem;
  transition: all 0.3s ease;
}

.spotlight-container.focused {
  border-color: var(--primary);
  box-shadow: 0 0 0 2px rgba(168, 85, 247, 0.2);
  background: rgba(0, 0, 0, 0.3);
}

.spotlight-icon {
  font-size: 1rem;
  opacity: 0.6;
}

.spotlight-container input {
  width: 100%;
  background: transparent;
  border: none;
  padding: 12px;
  color: white;
  font-size: 0.95rem;
  outline: none;
}

.spotlight-container input::placeholder {
  color: rgba(255, 255, 255, 0.4);
}

.spotlight-results {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  margin-top: 8px;
  border-radius: 12px;
  min-height: 100px;
  z-index: 50;
}

.user-profile {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.avatar {
  background: var(--primary);
  color: white;
  width: 38px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  font-size: 1rem;
  font-weight: 600;
  box-shadow: 0 4px 10px rgba(168, 85, 247, 0.3);
}

.user-name {
  font-weight: 600;
  color: var(--text-main);
  font-size: 0.95rem;
}

.btn-logout {
  background: rgba(239, 68, 68, 0.1);
  border: 1px solid rgba(239, 68, 68, 0.2);
  color: #fca5a5;
  width: 38px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.2s;
  margin-left: 0.5rem;
}

.btn-logout:hover {
  background: rgba(239, 68, 68, 0.2);
  transform: translateY(-1px);
  color: #fff;
}

/* Grid & Cards */
.content-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
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
.input-group input, .input-group textarea {
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
.input-group input:focus, .input-group textarea:focus {
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
