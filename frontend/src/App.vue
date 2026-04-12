<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { api } from './api'
import type { NavigationTree } from './api'

const route = useRoute()
const menus = ref<NavigationTree | null>(null)

// Fallback sidebar if API menus unavailable
const sidebarLinks = [
  { label: '📊 Panel Principal', route: '/' },
  { label: '🏢 Terceros', route: '/terceros' },
  { label: '👤 Contactos', route: '/contactos' },
  { label: '📦 Productos', route: '/productos' },
  { label: '📋 Presupuestos', route: '/presupuestos' },
  { label: '🛒 Pedidos', route: '/pedidos' },
  { label: '🧾 Facturas', route: '/facturas' },
  { label: '📐 Proyectos', route: '/proyectos' },
  { label: '🏭 Pedidos Proveedor', route: '/pedidos-proveedor' },
  { label: '📑 Facturas Proveedor', route: '/facturas-proveedor' },
  { label: '🏦 Bancos', route: '/bancos' },
  { label: '📅 Agenda', route: '/agenda' },
]

const fetchMenus = async () => {
  try {
    menus.value = await api.getNavigationTree()
  } catch (e) {
    console.warn("Using fallback sidebar (API menus unavailable)", e)
  }
}

onMounted(() => {
  fetchMenus()
})
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
        <template v-if="menus?.top?.length">
          <router-link
            v-for="menu in menus.top"
            :key="menu.id"
            :to="menu.route"
            active-class="active"
          >
            {{ menu.label }}
          </router-link>
        </template>
        <template v-else>
          <router-link
            v-for="link in sidebarLinks"
            :key="link.route"
            :to="link.route"
            active-class="active"
            exact-active-class="active"
          >
            {{ link.label }}
          </router-link>
        </template>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header>
        <h1>{{ (route.meta?.title as string) || 'Alixar' }}</h1>
        <div class="user-profile">
          <div class="avatar">Admin</div>
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
  gap: 3px;
}

nav a {
  padding: 8px 12px;
  border-radius: 8px;
  color: var(--text-muted);
  text-decoration: none;
  font-weight: 500;
  font-size: 0.875rem;
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
  gap: 1.5rem;
  min-width: 0;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 0;
}

header h1 {
  font-size: 1.75rem;
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
