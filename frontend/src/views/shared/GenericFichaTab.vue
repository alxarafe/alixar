<script setup lang="ts">
/**
 * Generic Ficha Tab — renders InfoCard or Dynamic Edit Form
 * 
 * The parent DetailView must:
 *   provide('entity', ref<T>)
 *   provide('fichaFields', (entity: T) => InfoField[])
 *   provide('updateEntity', (data: any) => Promise<any>)
 */
import { ref, inject, computed, type Ref } from 'vue'
import { useRoute, onBeforeRouteLeave } from 'vue-router'
import InfoCard, { type InfoField } from '../../components/InfoCard.vue'
import { resourceSchemas } from '../../config/schemaRegistry'
import FormNode from '../../components/FormNode.vue'

const route = useRoute()

const entity = inject<Ref<any>>('entity')
const fieldMapper = inject<(entity: any) => InfoField[]>('fichaFields')
const updateEntity = inject<(data: any) => Promise<any>>('updateEntity')

// Display fields for InfoCard
const fields = computed<InfoField[]>(() => {
  if (!entity?.value || !fieldMapper) return []
  return fieldMapper(entity.value)
})

// Edit Mode Logic
const isEditing = ref(false)
const payload = ref<Record<string, any>>({})
const isSaving = ref(false)

const resourceKey = computed(() => route.path.split('/')[1]) // e.g. "terceros"
const formConfig = computed(() => resourceSchemas[resourceKey.value])

// Extract all field keys recursively from schema definition to populate payload
const extractKeys = (nodes: any[]): ExtractFieldDef[] => {
  let keys: ExtractFieldDef[] = [];
  for (const node of nodes) {
    if (node.type === 'Field' && node.key) {
      keys.push(node);
    } else if (node.children) {
      keys = keys.concat(extractKeys(node.children));
    }
  }
  return keys;
}

interface ExtractFieldDef { key: string }

const toggleEdit = () => {
  // Pre-fill payload with current entity properties
  if (formConfig.value && entity?.value) {
    payload.value = {}
    const flatFields = extractKeys(formConfig.value.schema)
    for (const field of flatFields) {
      payload.value[field.key] = entity.value[field.key]
    }
  }
  isEditing.value = true
}

const cancelEdit = () => {
  isEditing.value = false
  payload.value = {}
}

const hasUnsavedChanges = computed(() => {
  if (!isEditing.value || !entity?.value || !formConfig.value) return false
  const flatFields = extractKeys(formConfig.value.schema)
  for (const field of flatFields) {
    const originalVal = entity.value[field.key] ?? ''
    const currentVal = payload.value[field.key] ?? ''
    if (String(originalVal) !== String(currentVal)) {
      return true
    }
  }
  return false
})

onBeforeRouteLeave((to, from, next) => {
  if (hasUnsavedChanges.value) {
    const answer = window.confirm("Tienes modificaciones pendientes de aceptar o cancelar. ¿Deseas descartar los cambios y salir?")
    if (answer) {
      isEditing.value = false
      next()
    } else {
      next(false)
    }
  } else {
    next()
  }
})

const saveChanges = async () => {
  if (!updateEntity) return alert('updateEntity no inyectado')
  isSaving.value = true
  try {
    await updateEntity(payload.value)
    isEditing.value = false
  } catch (e: any) {
    alert('Error al guardar: ' + e.message)
  } finally {
    isSaving.value = false
  }
}
</script>

<template>
  <div class="generic-ficha">
    <!-- View Mode -->
    <template v-if="!isEditing">
      <div class="action-bar" v-if="formConfig">
        <button class="btn-secondary btn-icon" @click="toggleEdit" title="Modificar">
          ✏️ Modificar
        </button>
      </div>
      <InfoCard v-if="fields.length" :fields="fields" />
    </template>

    <!-- Edit Mode -->
    <template v-else-if="formConfig">
      <form @submit.prevent="saveChanges" class="form-container">
        <h3 class="edit-title">Modificando {{ formConfig.title || 'Registro' }}</h3>
        
        <FormNode 
          v-for="(rootNode, idx) in formConfig.schema" 
          :key="idx" 
          :node="rootNode" 
          v-model="payload" 
        />
        
        <div class="form-actions">
          <button type="button" class="btn-cancel" @click="cancelEdit" :disabled="isSaving">Cancelar</button>
          <button type="submit" class="btn-save" :disabled="isSaving">
            {{ isSaving ? 'Guardando...' : 'Guardar Cambios' }}
          </button>
        </div>
      </form>
    </template>
  </div>
</template>

<style scoped>
.action-bar {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1rem;
}
.btn-icon {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.85rem;
  padding: 0.5rem 1rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;
}
.btn-icon:hover {
  background: rgba(255, 255, 255, 0.15);
}
.form-container {
  display: flex;
  flex-direction: column;
}
.edit-title {
  margin-top: 0;
  margin-bottom: 2rem;
  color: var(--text-main);
  font-size: 1.5rem;
}
.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
  margin-top: 2rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 1.5rem;
}
.btn-cancel {
  background: transparent;
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: #fff;
  padding: 0.5rem 1.5rem;
  border-radius: 8px;
  cursor: pointer;
}
.btn-cancel:hover {
  background: rgba(255, 255, 255, 0.05);
}
.btn-save {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  padding: 0.5rem 1.5rem;
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
</style>
