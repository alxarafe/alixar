<script setup lang="ts">
import { ref } from 'vue'

import DashboardView from './views/DashboardView.vue'
import ThirdPartiesView from './views/ThirdPartiesView.vue'
import ContactsView from './views/ContactsView.vue'
import ProductsView from './views/ProductsView.vue'

// Basic local state for orchestrator
const currentTab = ref('dashboard')
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
        <a href="#" :class="{ active: currentTab === 'thirdparties' }" @click.prevent="currentTab = 'thirdparties'">Terceros</a>
        <a href="#" :class="{ active: currentTab === 'contacts' }" @click.prevent="currentTab = 'contacts'">Contactos</a>
        <a href="#" :class="{ active: currentTab === 'products' }" @click.prevent="currentTab = 'products'">Productos/Servicios</a>
        <!-- Coming soon: -->
        <a href="#" style="opacity:0.4; cursor:not-allowed;">Historial CRM</a>
        <a href="#" style="opacity:0.4; cursor:not-allowed;">Proyectos</a>
        <a href="#" style="opacity:0.4; cursor:not-allowed;">Tesorería</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header>
        <h1 v-if="currentTab === 'dashboard'">Panel Principal</h1>
        <h1 v-else-if="currentTab === 'thirdparties'">Directorio de Terceros</h1>
        <h1 v-else-if="currentTab === 'contacts'">Agenda de Contactos</h1>
        <h1 v-else-if="currentTab === 'products'">Catálogo de Productos</h1>
        
        <div class="user-profile">
          <div class="avatar">Admin</div>
        </div>
      </header>

      <div class="content-grid">
        <DashboardView v-if="currentTab === 'dashboard'" />
        <ThirdPartiesView v-if="currentTab === 'thirdparties'" />
        <ContactsView v-if="currentTab === 'contacts'" />
        <ProductsView v-if="currentTab === 'products'" />
      </div>
    </main>
  </div>
</template>

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
