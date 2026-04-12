<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import { resourceSchemas } from '../../config/schemaRegistry'

const props = defineProps<{
  resource: string
}>()

const count = ref<number | null>(null)
const error = ref(false)

const config = resourceSchemas[props.resource]

onMounted(async () => {
  if (!config) return
  try {
    const res = await api.request<any[]>(config.endpoint, 'GET', null, { limit: 1000 })
    count.value = res.length
  } catch (err) {
    console.error(err)
    error.value = true
  }
})
</script>

<template>
  <div class="metric-card glass-panel" v-if="config">
    <div class="metric-icon">
      <i :class="config.widget?.icon || 'fas fa-chart-line'"></i>
    </div>
    <div class="metric-content">
      <h3>{{ config.title }}</h3>
      <div class="value" v-if="count !== null">{{ count }}</div>
      <div class="value loading" v-else-if="!error">...</div>
      <div class="value error" v-else>!</div>
    </div>
  </div>
</template>

<style scoped>
.metric-card {
  display: flex;
  align-items: center;
  padding: 1.5rem;
  gap: 1.5rem;
  border-radius: 16px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: transform 0.2s;
}
.metric-card:hover {
  transform: translateY(-4px);
}
.metric-icon {
  font-size: 2.5rem;
  color: var(--primary-color, #a855f7);
  opacity: 0.8;
}
.metric-content h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
  color: rgba(255, 255, 255, 0.7);
  font-weight: 500;
}
.value {
  font-size: 2.5rem;
  font-weight: 700;
  color: #fff;
  line-height: 1;
}
.value.loading { opacity: 0.5; font-size: 2rem; }
.value.error { color: #f87171; }
</style>
