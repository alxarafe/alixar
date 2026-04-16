<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'

const route = useRoute()
const entity = ref<any>(null)
const loading = ref(true)

onMounted(async () => {
  try {
    entity.value = await api.getReception(Number(route.params.id))
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div v-if="loading" class="loading">Cargando...</div>
  <div v-else-if="entity" class="detail-layout">
    <div class="sidebar-detail glass-panel">
      <div class="detail-header"><h2><router-link to="/recepciones" class="back-btn-title">⬅️</router-link> Recepción {{ entity.ref }}</h2></div>
      <nav class="detail-nav"><router-link :to="{ name: 'reception-ficha' }" active-class="active">Ficha</router-link></nav>
    </div>
    <div class="main-detail glass-panel">
      <router-view :entity="entity" schemaName="recepciones"></router-view>
    </div>
  </div>
</template>

<style scoped>
.back-btn-title { text-decoration:none; margin-right:8px; opacity:0.8; }
.back-btn-title:hover { opacity:1; }
.detail-layout { display: flex; gap: 1.5rem; height: calc(100vh - 120px); }
.sidebar-detail { width: 300px; padding: 1.5rem; display: flex; flex-direction: column; gap: 1.5rem; }
.main-detail { flex: 1; padding: 1.5rem; overflow-y: auto; }
.detail-header h2 { margin: 0; font-size: 1.25rem; font-weight: 600; display:flex; align-items:center; gap:0.5rem; }
.detail-nav { display: flex; flex-direction: column; gap: 0.5rem; }
.detail-nav a { padding: 0.75rem 1rem; border-radius: 8px; color: var(--text-muted); text-decoration: none; transition: all 0.2s; }
.detail-nav a:hover { background: rgba(255,255,255,0.05); }
.detail-nav a.active { background: linear-gradient(90deg, rgba(168,85,247,0.1) 0%, transparent 100%); color: var(--primary); font-weight: 600; border-left: 3px solid var(--primary); }
</style>
