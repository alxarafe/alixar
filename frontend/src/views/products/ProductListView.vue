<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { Product } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const rows = ref<Product[]>([])
const total = ref(0)
const page = ref(1)
const limit = ref(50)
const loading = ref(true)
const error = ref<string | null>(null)

const columns: Column[] = [
  { key: 'id', label: 'ID', width: '60px', format: (v: number) => `#${v}` },
  { key: 'ref', label: 'Referencia' },
  { key: 'label', label: 'Etiqueta' },
  { key: 'type', label: 'Tipo', format: (v: string) => v === '0' ? '📦 Producto' : '🛠️ Servicio' },
  { key: 'price_ttc', label: 'Precio TTC', align: 'right', format: (v: number) => v ? `${Number(v).toFixed(2)} €` : '—' },
  { key: 'tva_tx', label: 'IVA', align: 'right', format: (v: number) => v ? `${v}%` : '—' },
]

const loadData = async () => {
  try {
    loading.value = true
    rows.value = await api.getProducts({ limit: limit.value, page: page.value - 1 })
    total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1
  } catch (e: any) { error.value = e.message } finally { loading.value = false }
}

onMounted(loadData)

const handleCreate = () => {
  router.push({ name: 'resource-create', params: { resource: 'productos' } })
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Productos...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="Catálogo de Productos y Servicios" create-label="Crear Producto" detail-route="product-ficha"
      @create="handleCreate" @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
