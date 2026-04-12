<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { api } from '../../api'
import { resourceSchemas } from '../../config/schemaRegistry'
import FormNode from '../../components/FormNode.vue'

const route = useRoute()
const router = useRouter()

const formConfig = computed(() => {
  const r = route.params.resource as string
  return resourceSchemas[r]
})

const payload = ref<Record<string, any>>({})
const loading = ref(false)
const error = ref<string | null>(null)

const handleSubmit = async () => {
  if (!formConfig.value) return;
  error.value = null
  loading.value = true
  
  try {
    const newId = await api.request<number>(formConfig.value.endpoint, 'POST', payload.value)
    
    if (formConfig.value.detailRoute) {
       router.push({ name: formConfig.value.detailRoute, params: { id: newId } })
    } else {
       router.back()
    }
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="create-view">
    <div v-if="!formConfig" class="not-found">
      <h2>Error 404</h2>
      <p>No se encontró la configuración del formulario para: {{ route.params.resource }}</p>
      <button class="btn-secondary" @click="router.back()">Volver</button>
    </div>

    <form v-else @submit.prevent="handleSubmit" class="form-container">
      <div class="form-header">
        <button type="button" class="btn-icon-fallback" @click="router.back()" title="Volver al listado">
          ⬅️
        </button>
        <h2>Alta de {{ formConfig.title || 'Registro' }}</h2>
      </div>

      <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>

      <!-- Recursive Engine Render -->
      <FormNode 
        v-for="(rootNode, idx) in formConfig.schema" 
        :key="idx" 
        :node="rootNode" 
        v-model="payload" 
      />

      <!-- Form Actions -->
      <div class="form-actions">
        <button type="submit" class="btn-save" :disabled="loading">
          {{ loading ? 'Creando...' : 'Guardar y Crear' }}
        </button>
      </div>
    </form>
  </div>
</template>

<style scoped>
.create-view {
  padding: 1.5rem;
  max-width: 1200px;
  margin: 0 auto;
}
.form-container {
  display: flex;
  flex-direction: column;
}
.form-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 2rem;
}
.form-header h2 {
  margin: 0;
  font-size: 1.75rem;
  color: #fff;
}
.btn-icon-fallback {
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 8px;
  cursor: pointer;
}
.form-actions {
  margin-top: 2.5rem;
  display: flex;
  justify-content: flex-end;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 1.5rem;
}
.btn-save {
  background: linear-gradient(135deg, #a855f7 0%, #3b82f6 100%);
  color: white;
  padding: 0.75rem 2rem;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s;
}
.btn-save:hover {
  transform: scale(1.02);
}
.btn-save:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none;
}
.error-panel {
  padding: 1.5rem;
  background: rgba(239, 68, 68, 0.1);
  border-color: rgba(239, 68, 68, 0.2);
  color: #fca5a5;
  margin-bottom: 2rem;
}
</style>
