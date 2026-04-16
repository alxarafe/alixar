<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { api } from '../../api'
import { resourceSchemas } from '../../config/schemaRegistry'

const props = withDefaults(defineProps<{
  resource: string
  limit?: number
}>(), {
  limit: 5
})

const router = useRouter()
const items = ref<any[]>([])
const loading = ref(true)
const config = resourceSchemas[props.resource]

onMounted(async () => {
  if (!config) return
  try {
    const res = await api.request<any[]>(config.endpoint, 'GET', null, { 
      limit: props.limit,
      sortfield: 'tms',
      sortorder: 'DESC' 
    })
    
    items.value = res
  } catch (err) {
    console.error("Error fetching widget list", err)
  } finally {
    loading.value = false
  }
})

const goTo = (id: number) => {
  if (config.detailRoute) {
    router.push({ name: config.detailRoute, params: { id } })
  }
}
</script>

<template>
  <div class="list-widget glass-panel" v-if="config">
    <div class="widget-header">
      <div class="title-group">
        <i :class="config.widget?.icon || 'fas fa-list'"></i>
        <h3>Últimos {{ config.title }}</h3>
      </div>
      <button class="btn-text" @click="router.push({ name: 'resource-create', params: { resource: props.resource } })" title="Crear Nuevo">
        + Nuevo
      </button>
    </div>

    <div class="widget-body">
      <div v-if="loading" class="state-msg">Cargando datos...</div>
      <div v-else-if="items.length === 0" class="state-msg">No hay registros todavía.</div>
      
      <div v-else class="item-list">
        <div 
          v-for="item in items" 
          :key="item.id" 
          class="list-item"
          @click="goTo(item.id)"
        >
          <div class="item-content">
            <div class="item-title">{{ item[config.widget?.titleField] || item.id || 'Desconocido' }}</div>
            <div class="item-sub" v-if="config.widget?.subtitleField">{{ item[config.widget?.subtitleField] || 'Sin especificar' }}</div>
          </div>
          <div class="item-arrow">→</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.list-widget {
  display: flex;
  flex-direction: column;
  border-radius: 16px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  overflow: hidden;
  height: 100%;
}
.widget-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.25rem 1.5rem;
  background: rgba(255, 255, 255, 0.03);
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.title-group {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}
.title-group i {
  color: var(--primary-color, #a855f7);
  font-size: 1.2rem;
}
.widget-header h3 {
  margin: 0;
  font-size: 1.1rem;
  color: #fff;
  font-weight: 600;
}
.btn-text {
  background: transparent;
  border: none;
  color: var(--primary-color, #a855f7);
  cursor: pointer;
  font-weight: 500;
  font-size: 0.9rem;
  transition: opacity 0.2s;
}
.btn-text:hover {
  text-decoration: underline;
  opacity: 0.8;
}
.widget-body {
  padding: 1rem;
  flex-grow: 1;
}
.state-msg {
  padding: 2rem;
  text-align: center;
  color: rgba(255, 255, 255, 0.5);
}
.item-list {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
.list-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.02);
  cursor: pointer;
  transition: all 0.2s ease;
  border: 1px solid transparent;
}
.list-item:hover {
  background: rgba(255, 255, 255, 0.06);
  border-color: rgba(255, 255, 255, 0.1);
  transform: translateX(4px);
}
.item-title {
  font-weight: 500;
  color: #fff;
  margin-bottom: 0.25rem;
}
.item-sub {
  font-size: 0.85rem;
  color: rgba(255, 255, 255, 0.5);
}
.item-arrow {
  color: rgba(255, 255, 255, 0.1);
  font-size: 1.2rem;
  transition: color 0.2s;
}
.list-item:hover .item-arrow {
  color: var(--primary-color, #a855f7);
}
</style>
