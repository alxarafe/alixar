<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const rows = ref<any[]>([])
const total = ref(0)
const page = ref(1)
const limit = ref(50)
const loading = ref(true)
const error = ref<string | null>(null)
const router = useRouter()

const columns: Column[] = [
  { key: 'id', label: 'ID', width: '60px', format: (v: number) => `#${v}` },
  { key: 'name', label: 'Nombre del Rol' },
  { key: 'description', label: 'Descripción' },
  { key: 'is_system', label: 'Es de Sistema', format: (v: boolean) => v ? 'Sí' : 'No' },
]

const loadData = async () => {
  try {
    loading.value = true
    const result: any = await api.getRoles({ per_page: limit.value, page: page.value })
    rows.value = result.data || result
    total.value = result.total !== undefined ? result.total : (rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : (page.value) * limit.value + 1)
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

onMounted(loadData)

const handleCreate = () => {
  router.push({ name: 'resource-create', params: { resource: 'roles' } })
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Roles...</div>
    <EntityList
      v-else
      :columns="columns"
      :rows="rows"
      :total="total"
      :page="page"
      :limit="limit"
      title="Gestión de Roles"
      create-label="Nuevo Rol"
      detail-route="role-ficha"
      @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }"
      @limit-change="(l: number) => { limit = l; page = 1; loadData() }"
    />
  </div>
</template>
