<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../api'

const thirdPartiesCount = ref(0)
const contactsCount = ref(0)
const productsCount = ref(0)
const projectsCount = ref(0)
const events = ref<any[]>([])

onMounted(async () => {
  try {
    const [tpRes, projRes, evRes, contactRes, productRes] = await Promise.all([
      api.getThirdParties(),
      api.getProjects(),
      api.getEvents(),
      api.getContacts(),
      api.getProducts()
    ])
    thirdPartiesCount.value = tpRes.length
    projectsCount.value = projRes.length
    events.value = evRes
    contactsCount.value = contactRes.length
    productsCount.value = productRes.length
  } catch (e: any) {
    console.error("Error loading dashboard", e)
  }
})
</script>

<template>
  <div class="view-container">
    <div class="metrics-row">
      <div class="metric-card glass-panel">
        <h3>Terceros Activos</h3>
        <div class="value">{{ thirdPartiesCount }}</div>
      </div>
      <div class="metric-card glass-panel">
        <h3>Contactos</h3>
        <div class="value">{{ contactsCount }}</div>
      </div>
      <div class="metric-card glass-panel">
        <h3>Productos/Servicios</h3>
        <div class="value">{{ productsCount }}</div>
      </div>
      <div class="metric-card glass-panel">
        <h3>Proyectos Abiertos</h3>
        <div class="value">{{ projectsCount }}</div>
      </div>
    </div>

    <div class="table-card glass-panel" style="margin-top: 2rem;">
      <div class="card-header">
        <h3>Últimos Eventos CRM</h3>
      </div>
      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Fecha</th><th>Código</th><th>Asunto / Acción</th><th>Tercero ID</th><th>Nota</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="ev in events.slice(0, 10)" :key="ev.id">
              <td><strong>{{ ev.dateStart || '-' }}</strong></td>
              <td><span class="badge">{{ ev.typeCode }}</span></td>
              <td>{{ ev.title }}</td>
              <td>{{ ev.thirdPartyId ? `#${ev.thirdPartyId}` : '-' }}</td>
              <td style="max-width:300px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" :title="ev.note">{{ ev.note || '-' }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
