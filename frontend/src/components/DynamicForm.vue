<script setup lang="ts">
import { defineProps, defineEmits, watch, ref } from 'vue'

export interface FormField {
  key: string
  label: string
  type: 'text' | 'email' | 'number' | 'select' | 'textarea'
  required?: boolean
  placeholder?: string
  options?: { value: string | number; text: string }[]
  step?: string
}

const props = defineProps<{
  schema: FormField[]
  modelValue: Record<string, any>
  title: string
  isSaving?: boolean
}>()

const emit = defineEmits<{
  (e: 'update:modelValue', value: Record<string, any>): void
  (e: 'submit'): void
  (e: 'cancel'): void
}>()

// Copia reactiva local para no mutar props directamente, pero manteniendo enlace
const localData = ref({ ...props.modelValue })

// Sincronizar hacia afuera (v-model)
watch(localData, (newVal) => {
  emit('update:modelValue', newVal)
}, { deep: true })

// Manejadores
const onSubmit = () => {
  emit('submit')
}
</script>

<template>
  <div class="modal-overlay" @click.self="$emit('cancel')">
    <div class="modal-content glass-panel modal-lg">
      <h2>{{ title }}</h2>
      <form @submit.prevent="onSubmit" class="form-grid">
        <div class="form-row" style="flex-wrap: wrap;">
          <div v-for="field in schema" :key="field.key" class="input-group" style="flex: 1 1 45%; min-width: 250px;">
            <label>{{ field.label }} <span v-if="field.required" style="color:var(--danger)">*</span></label>
            
            <!-- Select -->
            <select 
              v-if="field.type === 'select'" 
              v-model="localData[field.key]" 
              :required="field.required" 
              class="glass-select"
            >
              <option v-for="opt in field.options" :key="opt.value" :value="opt.value">{{ opt.text }}</option>
            </select>
            
            <!-- Textarea -->
            <textarea 
              v-else-if="field.type === 'textarea'" 
              v-model="localData[field.key]" 
              :required="field.required" 
              :placeholder="field.placeholder"
              rows="3"
            ></textarea>

            <!-- Text / Email / Number -->
            <input 
              v-else 
              v-model="localData[field.key]" 
              :type="field.type" 
              :required="field.required" 
              :placeholder="field.placeholder" 
              :step="field.step"
            />
          </div>
        </div>

        <div class="modal-actions">
          <button type="button" class="btn-secondary" @click="$emit('cancel')" :disabled="isSaving">Cerrar</button>
          <button type="submit" class="btn-primary" :disabled="isSaving">
            {{ isSaving ? 'Guardando...' : 'Guardar Ficha' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</template>
