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
  { key: 'username', label: 'Usuario' },
  { key: 'email', label: 'Email' },
  { key: 'first_name', label: 'Nombre' },
  { key: 'last_name', label: 'Apellidos' },
  { key: 'is_active', label: 'Estado', format: (v: boolean) => v ? 'Activo' : 'Inactivo' },
]

const loadData = async () => {
  try {
    loading.value = true
    const result: any = await api.getUsers({ per_page: limit.value, page: page.value })
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
  router.push({ name: 'resource-create', params: { resource: 'usuarios' } })
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Usuarios...</div>
    <EntityList
      v-else
      :columns="columns"
      :rows="rows"
      :total="total"
      :page="page"
      :limit="limit"
      title="Gestión de Usuarios"
      create-label="Nuevo Usuario"
      detail-route="user-ficha"
      @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }"
      @limit-change="(l: number) => { limit = l; page = 1; loadData() }"
    />
  </div>
</template>
