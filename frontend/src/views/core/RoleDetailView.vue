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
  { key: 'ficha', label: 'Ficha', icon: '📝', route: { name: 'role-ficha', params: { id: entityId.value } } },
  { key: 'permissions', label: 'Permisos', icon: '🛡️', route: { name: 'role-permissions', params: { id: entityId.value } } }
])

const loadEntity = async () => {
  try {
    loading.value = true
    entity.value = await api.getRole(entityId.value)
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

onMounted(loadEntity)

provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.role)
provide('updateEntity', async (data: any) => {
  try {
    await api.updateRole(entityId.value, data)
    await loadEntity()
  } catch (e: any) {
    alert('Error al actualizar el rol: ' + e.message)
  }
})
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Rol...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/roles" class="back-btn-title">⬅️</router-link> {{ entity.name }}</h2>
        <span class="detail-ref">Rol #{{ entity.id }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content">
        <router-view />
      </div>
    </template>
  </div>
</template>
