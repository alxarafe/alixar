<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../api'
import type { Product } from '../api'
import DynamicForm, { type FormField } from '../components/DynamicForm.vue'

const products = ref<Product[]>([])
const loading = ref(true)
const error = ref<string | null>(null)

// Schema for Dynamic Form
const schema: FormField[] = [
  { key: 'ref', label: 'Referencia', type: 'text', required: true, placeholder: 'Ej. PROD-001' },
  { key: 'label', label: 'Etiqueta Larga', type: 'text', required: true, placeholder: 'Ej. Licencia Anual ERP' },
  { 
    key: 'type', 
    label: 'Tipo', 
    type: 'select', 
    required: true,
    options: [
      { value: '0', text: '📦 Producto Físico' },
      { value: '1', text: '🛠️ Servicio' }
    ]
  },
  { 
    key: 'status_buy', 
    label: 'Estado de la Compra', 
    type: 'select',
    options: [
      { value: '1', text: 'En Compra / Activo' },
      { value: '0', text: 'Fuera de Compra' }
    ]
  },
  { key: 'price_ttc', label: 'Precio Base (TTC) €', type: 'number', step: '0.01' },
  { key: 'tva_tx', label: 'IVA (%)', type: 'number', step: '0.1' }
]

const formVisible = ref(false)
const isSaving = ref(false)
const editingEntity = ref<Partial<Product>>({})
const editingId = ref<number>(0)

onMounted(async () => {
  await loadData()
})

const loadData = async () => {
  try {
    loading.value = true
    products.value = await api.getProducts()
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

const startEdit = (p?: Product) => {
  if (p) {
    editingId.value = p.id
    editingEntity.value = { ...p }
  } else {
    editingId.value = 0
    editingEntity.value = { ref: '', label: '', type: '0', price_ttc: 0, tva_tx: 21, status_buy: '1' }
  }
  formVisible.value = true
}

const handleSave = async () => {
  isSaving.value = true
  try {
    if (editingId.value) {
      await api.updateProduct(editingId.value, editingEntity.value)
    } else {
      await api.createProduct(editingEntity.value)
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
    <div v-else-if="loading" class="loading">Cargando Productos...</div>

    <div v-else class="table-card glass-panel">
      <div class="card-header" style="display:flex; justify-content:space-between; align-items:center;">
        <h3>Catálogo de Productos y Servicios</h3>
        <button class="btn-primary" @click="startEdit()">+ Crear Nuevo Producto</button>
      </div>
      <div class="table-container">
        <table>
          <thead>
            <tr><th>ID</th><th>Ref</th><th>Etiqueta</th><th>Tipo</th><th>Precio Final</th><th>IVA</th><th>Estado de Compra</th><th>Acciones</th></tr>
          </thead>
          <tbody>
            <tr v-for="product in products" :key="product.id">
              <td>#{{ product.id }}</td>
              <td><span class="badge">{{ product.ref }}</span></td>
              <td><strong>{{ product.label }}</strong></td>
              <td>{{ product.type == '0' ? '📦 Producto' : '🛠️ Servicio' }}</td>
              <td>{{ product.price_ttc ? product.price_ttc + ' €' : '-' }}</td>
              <td>{{ product.tva_tx ? product.tva_tx + '%' : '-' }}</td>
              <td>{{ product.status_buy == '1' ? 'En Compra' : 'No Comprable' }}</td>
              <td>
                <button class="btn-icon" @click="startEdit(product)" title="Editar">✏️</button>
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
      :title="editingId ? `Editando Producto #${editingId}` : 'Nuevo Producto'"
      :is-saving="isSaving"
      @submit="handleSave"
      @cancel="formVisible = false"
    />
  </div>
</template>
