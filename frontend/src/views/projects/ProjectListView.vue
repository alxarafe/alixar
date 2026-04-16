<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { Project } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const rows = ref<Project[]>([]); const total = ref(0); const page = ref(1); const limit = ref(50); const loading = ref(true); const error = ref<string | null>(null)
const statusMap: Record<number, string> = { 0: 'Borrador', 1: 'Validado', 2: 'Cerrado' }
const columns: Column[] = [
  { key: 'ref', label: 'Referencia' }, { key: 'title', label: 'Título' },
  { key: 'fk_soc', label: 'Tercero', format: (_: any, row: Project) => row.socname || (row.fk_soc ? `#${row.fk_soc}` : '—') },
  { key: 'dateo', label: 'Inicio', format: (v: string) => v ? new Date(v).toLocaleDateString('es-ES') : '—' },
  { key: 'datee', label: 'Fin', format: (v: string) => v ? new Date(v).toLocaleDateString('es-ES') : '—' },
  { key: 'fk_statut', label: 'Estado', format: (v: number) => statusMap[v] ?? `Estado ${v}` },
]
const loadData = async () => { try { loading.value = true; rows.value = await api.getProjects({ limit: limit.value, page: page.value - 1 }); total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1 } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadData)
const handleCreate = () => router.push({ name: 'resource-create', params: { resource: 'proyectos' } })
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Proyectos...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="Proyectos" detail-route="project-ficha"
      create-label="Nuevo Proyecto" @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
