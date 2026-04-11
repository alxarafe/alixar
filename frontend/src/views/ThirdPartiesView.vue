<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../api'
import type { ThirdParty } from '../api'
import DynamicForm, { type FormField } from '../components/DynamicForm.vue'

const thirdParties = ref<ThirdParty[]>([])
const loading = ref(true)
const error = ref<string | null>(null)

// Schema for Dynamic Form
const schema: FormField[] = [
  { key: 'name', label: 'Nombre Legal', type: 'text', required: true, placeholder: 'Ej. Acme Corp' },
  { key: 'name_alias', label: 'Nombre Comercial / Alias', type: 'text' },
  { key: 'siren', label: 'NIF / CIF', type: 'text', placeholder: 'Ej. B12345678' },
  { key: 'phone', label: 'Teléfono', type: 'text', placeholder: '+34...' },
  { key: 'email', label: 'Email', type: 'email' },
  { key: 'url', label: 'Sitio Web', type: 'text', placeholder: 'https://...' },
  { key: 'address', label: 'Dirección Completa', type: 'text' },
  { key: 'zip', label: 'Código Postal', type: 'text' },
  { key: 'town', label: 'Ciudad / Población', type: 'text' },
  { key: 'code_client', label: 'Código Cliente ERP', type: 'text' }
]

const formVisible = ref(false)
const isSaving = ref(false)
const editingTp = ref<Partial<ThirdParty>>({})
const editingId = ref<number>(0)

onMounted(async () => {
  await loadData()
})

const loadData = async () => {
  try {
    loading.value = true
    thirdParties.value = await api.getThirdParties()
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

const startEdit = (tp?: ThirdParty) => {
  if (tp) {
    editingId.value = tp.id
    editingTp.value = { ...tp }
  } else {
    editingId.value = 0
    editingTp.value = { name: '', name_alias: '', email: '', phone: '', address: '', zip: '', town: '', siren: '', url: '', code_client: '' }
  }
  formVisible.value = true
}

const handleSave = async () => {
  isSaving.value = true
  try {
    if (editingId.value) {
      await api.updateThirdParty(editingId.value, editingTp.value)
    } else {
      await api.createThirdParty(editingTp.value)
    }
    await loadData() // Re-fetch
    formVisible.value = false
  } catch (e: any) {
    alert("Error al guardar: " + e.message)
  } finally {
    isSaving.value = false
  }
}
</script>

<template>
  <div class="view-container">
    <div v-if="error" class="glass-panel error-panel">⚠️ Error: {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Terceros...</div>
    
    <div v-else class="table-card glass-panel">
      <div class="card-header" style="display:flex; justify-content:space-between; align-items:center;">
        <h3>Directorio de Terceros</h3>
        <button class="btn-primary" @click="startEdit()">+ Crear Nuevo Tercero</button>
      </div>
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

    <!-- Modal Dinámico -->
    <DynamicForm 
      v-if="formVisible"
      :schema="schema"
      v-model="editingTp"
      :title="editingId ? `Editando Tercero #${editingId}` : 'Nuevo Tercero'"
      :is-saving="isSaving"
      @submit="handleSave"
      @cancel="formVisible = false"
    />
  </div>
</template>
