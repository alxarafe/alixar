<script setup lang="ts">
/**
 * Generic Notas Tab — renders textarea for note_public and note_private.
 *
 * The parent DetailView must:
 *   provide('entity', ref<T>)
 *   provide('updateEntity', (data: Partial<T>) => Promise<any>)
 */
import { ref, inject, watch } from 'vue'

const entity = inject<any>('entity')
const updateEntity = inject<(data: any) => Promise<any>>('updateEntity')

const notePublic = ref('')
const notePrivate = ref('')
const loading = ref(false)

watch(entity, (val) => {
  if (val) {
    notePublic.value = val.note_public || val.note || ''
    notePrivate.value = val.note_private || ''
  }
}, { immediate: true })

const handleSave = async () => {
  if (!updateEntity) return
  try {
    loading.value = true
    // If the entity only has 'note' instead of note_public/private (like CRMEvent), map it to note.
    const payload = entity.value.hasOwnProperty('typeCode') 
      ? { note: notePublic.value } 
      : { note_public: notePublic.value, note_private: notePrivate.value }
    await updateEntity(payload)
  } catch (e: any) {
    alert("Error al guardar notas: " + e.message)
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="generic-notas-tab">
    <div class="note-section">
      <h3>Nota Pública</h3>
      <textarea v-model="notePublic" class="note-textarea" placeholder="Escribe aquí las notas públicas..."></textarea>
    </div>
    
    <div class="note-section" v-if="!entity?.hasOwnProperty('typeCode')">
      <h3>Nota Privada</h3>
      <textarea v-model="notePrivate" class="note-textarea private-note" placeholder="Escribe aquí las notas privadas (sólo internos)..."></textarea>
    </div>

    <div class="action-bar-bottom">
      <button class="btn-action btn-save" @click="handleSave" :disabled="loading">
        {{ loading ? 'Guardando...' : '💾 Guardar Notas' }}
      </button>
    </div>
  </div>
</template>

<style scoped>
.generic-notas-tab {
  padding: 1rem;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 6px;
}
.note-section {
  margin-bottom: 2rem;
}
.note-section h3 {
  margin-top: 0;
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
  color: var(--text-color);
}
.note-textarea {
  width: 100%;
  min-height: 150px;
  padding: 1rem;
  border: 1px solid var(--border-color);
  border-radius: 8px;
  font-family: inherit;
  font-size: 0.95rem;
  resize: vertical;
  background: white;
  transition: border-color 0.2s;
}
.note-textarea:focus {
  outline: none;
  border-color: var(--primary-color);
  box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.1);
}
.private-note {
  background: #FFFBEB; /* Light yellow to denote private */
  border-color: #FCD34D;
}
.action-bar-bottom {
  display: flex;
  justify-content: flex-end;
  margin-top: 1rem;
}
.btn-save {
  background: var(--primary-color);
  color: white;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
}
.btn-save:hover {
  background: var(--primary-hover);
}
</style>
