<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../../api'
import type { Task } from '../../../api'

const route = useRoute()
const entityId = computed(() => Number(route.params.id))
const tasks = ref<Task[]>([])
const loading = ref(true)

const loadTasks = async () => {
  try { loading.value = true; tasks.value = await api.getProjectTasks(entityId.value) }
  catch (e) { console.error(e) } finally { loading.value = false }
}
onMounted(loadTasks)

// Inline add
const newLabel = ref('')
const addTask = async () => {
  if (!newLabel.value.trim()) return
  try {
    await api.addProjectTask(entityId.value, { label: newLabel.value, fk_projet: entityId.value })
    newLabel.value = ''
    await loadTasks()
  } catch (e: any) { alert("Error: " + e.message) }
}

const deleteTask = async (taskId: number) => {
  if (!confirm('¿Eliminar esta tarea?')) return
  try { await api.deleteProjectTask(entityId.value, taskId); await loadTasks() }
  catch (e: any) { alert("Error: " + e.message) }
}
</script>

<template>
  <div>
    <div v-if="loading" class="loading">Cargando tareas...</div>
    <template v-else>
      <table class="lines-table">
        <thead>
          <tr><th>ID</th><th>Tarea</th><th>Progreso</th><th>Inicio</th><th>Fin</th><th>Acciones</th></tr>
        </thead>
        <tbody>
          <tr v-for="task in tasks" :key="task.id">
            <td>#{{ task.id }}</td>
            <td><strong>{{ task.label }}</strong></td>
            <td>{{ task.progress ?? 0 }}%</td>
            <td>{{ task.dateo ? new Date(task.dateo).toLocaleDateString('es-ES') : '—' }}</td>
            <td>{{ task.datee ? new Date(task.datee).toLocaleDateString('es-ES') : '—' }}</td>
            <td><button class="btn-icon" @click="deleteTask(task.id)" title="Eliminar">🗑️</button></td>
          </tr>
          <tr v-if="tasks.length === 0"><td colspan="6" style="text-align:center;padding:2rem;color:var(--text-muted);">Sin tareas</td></tr>
        </tbody>
        <tfoot>
          <tr class="line-add-row">
            <td></td>
            <td><input v-model="newLabel" type="text" placeholder="Nueva tarea…" class="line-input" @keyup.enter="addTask" /></td>
            <td colspan="3"></td>
            <td><button class="btn-primary btn-sm" @click="addTask" :disabled="!newLabel.trim()">+ Añadir</button></td>
          </tr>
        </tfoot>
      </table>
    </template>
  </div>
</template>
