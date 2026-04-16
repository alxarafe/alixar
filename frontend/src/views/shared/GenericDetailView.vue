<script setup lang="ts">
import { ref, onMounted, computed, provide, watch } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { PluginDefinition } from '../../core/types'
import { pluginsRegistry } from '../../plugins/registry'
import TabBar, { type Tab } from '../../components/TabBar.vue'

const route = useRoute()
const plugin = ref<PluginDefinition | null>(null)
const entity = ref<any | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))

const resolvePlugin = () => {
  const metaPlugin = route.meta.pluginKey as string
  plugin.value = pluginsRegistry.find(p => p.key === metaPlugin) || null
  if (!plugin.value) {
    error.value = "Plugin definition not found for this route."
  }
}

const loadEntity = async () => {
  if (!plugin.value) return
  try { 
    loading.value = true
    error.value = null
    entity.value = await api.request<any>(`${plugin.value.endpoint}/${entityId.value}`)
  } catch (e: any) { 
    error.value = e.message 
  } finally { 
    loading.value = false 
  }
}

watch(() => route.params.id, () => {
  resolvePlugin()
  loadEntity()
}, { immediate: true })

const tabs = computed<Tab[]>(() => {
  if (!plugin.value) return []
  const baseTabs: Tab[] = [
    { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: `${plugin.value.key}-ficha`, params: { id: entityId.value } } },
  ]
  
  if (plugin.value.tabs) {
      plugin.value.tabs.forEach(t => {
          baseTabs.push({
             key: t.key,
             label: t.label,
             icon: t.icon,
             route: { name: `${plugin.value!.key}-${t.key}`, params: { id: entityId.value } }
          })
      })
  } else {
      // By default add 'notas' if no tabs are defined specially (assuming all have it for now)
      baseTabs.push({ key: 'notas', label: 'Notas', icon: '📝', route: { name: `${plugin.value.key}-notas`, params: { id: entityId.value } } })
  }
  return baseTabs
})

// Expose standard injects for downstream tabs (like GenericFichaTab / GenericNotasTab)
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', computed(() => plugin.value && entity.value ? plugin.value.fields(entity.value) : []))
provide('updateEntity', (data: any) => {
    if (!plugin.value) return Promise.reject()
    return api.request(`${plugin.value.endpoint}/${entityId.value}`, 'PUT', data).then(loadEntity)
})
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando {{ plugin?.labels.singular }}...</div>
    <template v-else-if="entity && plugin">
      <div class="detail-header">
        <h2>
          <router-link :to="'/' + plugin.key" class="back-btn-title">⬅️</router-link> 
          {{ entity.title || entity.subject || entity.label || entity.ref || 'ID #' + entity.id }}
        </h2>
        <span v-if="entity.ref" class="badge">{{ entity.ref }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
