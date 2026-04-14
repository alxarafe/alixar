<script setup lang="ts">
import { ref, inject, onMounted, computed, watch } from 'vue'
import { api } from '../../../api'

const entity = inject<any>('entity')
const reloadEntity = inject<() => Promise<void>>('reloadEntity')

const allRoles = ref<any[]>([])
const selectedRoleIds = ref<number[]>([])
const loading = ref(true)
const saving = ref(false)

const loadRoles = async () => {
    loading.value = true
    try {
        const roles = await api.getRoles({ limit: 100 })
        allRoles.value = roles

        // Mapear los roles actuales del usuario (si existen)
        if (entity?.value?.roles) {
            selectedRoleIds.value = entity.value.roles.map((r: any) => r.id)
        }
    } catch (e: any) {
        alert('Error cargando roles: ' + e.message)
    } finally {
        loading.value = false
    }
}

watch(() => entity?.value, () => {
    if (entity?.value?.roles) {
        selectedRoleIds.value = entity.value.roles.map((r: any) => r.id)
    }
}, { immediate: true })

onMounted(loadRoles)

const isChanged = computed(() => {
    const current = entity?.value?.roles?.map((r: any) => r.id).sort().join(',') || ''
    const modified = [...selectedRoleIds.value].sort().join(',')
    return current !== modified
})

const save = async () => {
    if (!entity?.value) return
    saving.value = true
    try {
        await api.updateUserRoles(entity.value.id, selectedRoleIds.value)
        if (reloadEntity) {
            await reloadEntity()
        }
    } catch (e: any) {
        alert('No se pudieron asignar los roles: ' + e.message)
    } finally {
        saving.value = false
    }
}
</script>

<template>
  <div class="glass-panel p-4">
    <div class="flex justify-between items-center mb-4">
      <h3 class="text-xl font-bold">Roles de Sistema</h3>
      <button v-if="isChanged" class="btn btn-primary" :disabled="saving" @click="save">
        {{ saving ? 'Guardando...' : '💾 Guardar Cambios' }}
      </button>
    </div>

    <div v-if="loading" class="loading">Cargando catálogo de roles...</div>
    <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      <label v-for="role in allRoles" :key="role.id" class="card flex items-start gap-3 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors p-3 rounded-lg border border-gray-200 dark:border-gray-700">
        <input 
            type="checkbox" 
            :value="role.id" 
            v-model="selectedRoleIds"
            class="mt-1 form-checkbox h-5 w-5 text-primary rounded border-gray-300"
        />
        <div>
            <div class="font-semibold text-gray-900 dark:text-white">
                {{ role.name }}
                <span v-if="role.is_system" class="text-xs bg-red-100 text-red-800 px-2 py-0.5 rounded-full ml-2">Sistema</span>
            </div>
            <div class="text-sm text-gray-500 mt-1">{{ role.description || 'Sin descripción' }}</div>
        </div>
      </label>
    </div>
  </div>
</template>
