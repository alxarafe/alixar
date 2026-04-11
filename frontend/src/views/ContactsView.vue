<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../api'
import type { Contact } from '../api'
import DynamicForm, { type FormField } from '../components/DynamicForm.vue'

const contacts = ref<Contact[]>([])
const loading = ref(true)
const error = ref<string | null>(null)

// Schema for Dynamic Form
const schema: FormField[] = [
  { key: 'firstname', label: 'Nombre', type: 'text', required: true, placeholder: 'Ej. Ana' },
  { key: 'lastname', label: 'Apellidos', type: 'text', required: true, placeholder: 'Ej. Gómez' },
  { key: 'jobTitle', label: 'Puesto o Cargo', type: 'text', placeholder: 'Ej. Director de Compras' },
  { key: 'email', label: 'Correo Electrónico', type: 'email', placeholder: 'ana@empresa.com' },
  { key: 'phone_pro', label: 'Teléfono Profesional', type: 'text', placeholder: '+34...' }
]

const formVisible = ref(false)
const isSaving = ref(false)
const editingEntity = ref<Partial<Contact>>({})
const editingId = ref<number>(0)

onMounted(async () => {
  await loadData()
})

const loadData = async () => {
  try {
    loading.value = true
    contacts.value = await api.getContacts()
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

const startEdit = (c?: Contact) => {
  if (c) {
    editingId.value = c.id
    editingEntity.value = { ...c }
  } else {
    editingId.value = 0
    editingEntity.value = { firstname: '', lastname: '', email: '', phone_pro: '', jobTitle: '' }
  }
  formVisible.value = true
}

const handleSave = async () => {
  isSaving.value = true
  try {
    if (editingId.value) {
      await api.updateContact(editingId.value, editingEntity.value)
    } else {
      await api.createContact(editingEntity.value)
    }
    await loadData()
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
    <div v-else-if="loading" class="loading">Cargando Contactos...</div>

    <div v-else class="table-card glass-panel">
      <div class="card-header" style="display:flex; justify-content:space-between; align-items:center;">
        <h3>Directorio de Contactos</h3>
        <button class="btn-primary" @click="startEdit()">+ Crear Nuevo Contacto</button>
      </div>
      <div class="table-container">
        <table>
          <thead>
            <tr><th>ID</th><th>Nombre</th><th>Puesto</th><th>Email</th><th>Tlf. Profesional</th><th>Tercero Asociado</th><th>Acciones</th></tr>
          </thead>
          <tbody>
            <tr v-for="contact in contacts" :key="contact.id">
              <td>#{{ contact.id }}</td>
              <td><strong>{{ contact.firstname }} {{ contact.lastname }}</strong></td>
              <td>{{ contact.jobTitle || '-' }}</td>
              <td>{{ contact.email || '-' }}</td>
              <td>{{ contact.phone_pro || '-' }}</td>
              <td>{{ contact.thirdPartyId ? `#${contact.thirdPartyId}` : '-' }}</td>
              <td>
                <button class="btn-icon" @click="startEdit(contact)" title="Editar">✏️</button>
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
      v-model="editingEntity"
      :title="editingId ? `Editando Contacto #${editingId}` : 'Nuevo Contacto'"
      :is-saving="isSaving"
      @submit="handleSave"
      @cancel="formVisible = false"
    />
  </div>
</template>
