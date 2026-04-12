<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { ThirdParty } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<ThirdParty | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)

const entityId = computed(() => Number(route.params.id))

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'thirdparty-ficha', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📝', route: { name: 'thirdparty-notas', params: { id: entityId.value } } },
])

const loadEntity = async () => {
  try {
    loading.value = true
    entity.value = await api.getThirdParty(entityId.value)
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

onMounted(loadEntity)

// Provide entity to child tabs
import { provide } from 'vue'
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.thirdParty)
provide('updateEntity', (data: any) => api.updateThirdParty(entityId.value, data).then(loadEntity))
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando tercero...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/terceros" class="back-btn-title">⬅️</router-link> {{ entity.name }}</h2>
        <span class="detail-ref">Ref. #{{ entity.id }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content">
        <router-view />
      </div>
    </template>
  </div>
</template>
