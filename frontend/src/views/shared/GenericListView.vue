<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { api } from '../../api'
import type { PluginDefinition } from '../../core/types'
import { pluginsRegistry } from '../../plugins/registry'
import EntityList from '../../components/EntityList.vue'

const route = useRoute()
const router = useRouter()

const plugin = ref<PluginDefinition | null>(null)
const rows = ref<any[]>([])
const total = ref(0)
const page = ref(1)
const limit = ref(50)
const loading = ref(true)
const error = ref<string | null>(null)

const resolvePlugin = () => {
  const metaPlugin = route.meta.pluginKey as string
  plugin.value = pluginsRegistry.find(p => p.key === metaPlugin) || null
  if (!plugin.value) {
    error.value = "Plugin definition not found for this route."
  }
}

const loadData = async () => {
  if (!plugin.value) return
  try {
    loading.value = true
    error.value = null
    const data = await api.list<any>(plugin.value.endpoint, { limit: limit.value, page: page.value - 1 })
    rows.value = data
    total.value = rows.value.length < limit.value 
      ? (page.value - 1) * limit.value + rows.value.length 
      : page.value * limit.value + 1
  } catch (e: any) { 
    error.value = e.message 
  } finally { 
    loading.value = false 
  }
}

watch(() => route.meta.pluginKey, () => {
  page.value = 1
  resolvePlugin()
  loadData()
}, { immediate: true })

const handleCreate = () => {
  if (plugin.value) {
    router.push({ name: 'resource-create', params: { resource: plugin.value.key } })
  }
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando {{ plugin?.labels.plural }}...</div>
    <EntityList v-else-if="plugin" 
      :columns="plugin.columns" 
      :rows="rows" 
      :total="total" 
      :page="page" 
      :limit="limit"
      :title="plugin.labels.plural" 
      :create-label="'Crear ' + plugin.labels.singular" 
      :detail-route="plugin.key + '-detail'"
      @create="handleCreate" 
      @page-change="(p: number) => { page = p; loadData() }" 
      @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
