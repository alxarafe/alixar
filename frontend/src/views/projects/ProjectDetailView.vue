<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { Project } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import StatusBadge from '../../components/StatusBadge.vue'
import { entityFields } from '../../config/fields'
const route = useRoute(); const entity = ref<Project | null>(null); const loading = ref(true); const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))
const statusMap = { 0: { label: 'Borrador', color: '#94A3B8' }, 1: { label: 'Validado', color: '#34D399' }, 2: { label: 'Cerrado', color: '#60A5FA' } }
const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'project-ficha', params: { id: entityId.value } } },
  { key: 'tareas', label: 'Tareas', icon: '✅', route: { name: 'project-tareas', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📝', route: { name: 'project-notas', params: { id: entityId.value } } },
])
const loadEntity = async () => { try { loading.value = true; entity.value = await api.getProject(entityId.value) } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadEntity); provide('entity', entity); provide('reloadEntity', loadEntity); provide('fichaFields', entityFields.project)
provide('updateEntity', (data: any) => api.updateProject(entityId.value, data).then(loadEntity))
const handleValidate = async () => { try { await api.validateProject(entityId.value); await loadEntity() } catch (e: any) { alert("Error: " + e.message) } }
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando proyecto...</div>
    <template v-else-if="entity">
      <div class="detail-header"><h2><router-link to="/proyectos" class="back-btn-title" title="Volver a los proyectos">⬅️</router-link> {{ entity.title }}</h2><StatusBadge :status="entity.fk_statut ?? 0" :status-map="statusMap" /></div>
      <div class="action-bar" v-if="entity.fk_statut === 0">
        <button class="btn-action btn-validate" @click="handleValidate">✅ Validar Proyecto</button>
      </div>
      <TabBar :tabs="tabs" /><div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
