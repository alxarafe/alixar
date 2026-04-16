<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<any>(null)
const loading = ref(true)
const error = ref<string | null>(null)

const entityId = computed(() => Number(route.params.id))

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '👤', route: { name: 'user-ficha', params: { id: entityId.value } } },
  { key: 'roles', label: 'Roles', icon: '🛡️', route: { name: 'user-roles', params: { id: entityId.value } } }
])

const loadEntity = async () => {
  try {
    loading.value = true
    entity.value = await api.getUser(entityId.value)
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

onMounted(loadEntity)

provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.user)
provide('updateEntity', (data: any) => console.log('Pending update logic:', data)) // TO-DO: api.updateUser
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando usuario...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/usuarios" class="back-btn-title">⬅️</router-link> {{ entity.username }}</h2>
        <span class="detail-ref">User #{{ entity.id }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content">
        <router-view />
      </div>
    </template>
  </div>
</template>
