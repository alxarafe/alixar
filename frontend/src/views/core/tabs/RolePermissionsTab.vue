<script setup lang="ts">
import { ref, inject, onMounted, computed, watch } from 'vue'
import { api } from '../../../api'

const entity = inject<any>('entity')
const reloadEntity = inject<() => Promise<void>>('reloadEntity')

const allPermissions = ref<any[]>([])
const selectedPermissionIds = ref<number[]>([])
const loading = ref(true)
const saving = ref(false)

const loadPermissions = async () => {
    loading.value = true
    try {
        allPermissions.value = await api.getPermissions()

        if (entity?.value?.permissions) {
            selectedPermissionIds.value = entity.value.permissions.map((p: any) => p.id)
        }
    } catch (e: any) {
        alert('Error cargando catálogo de permisos: ' + e.message)
    } finally {
        loading.value = false
    }
}

watch(() => entity?.value, () => {
    if (entity?.value?.permissions) {
        selectedPermissionIds.value = entity.value.permissions.map((p: any) => p.id)
    }
}, { immediate: true })

onMounted(loadPermissions)

// Agrupar permisos por plugin para la vista
const groupedPermissions = computed(() => {
    const groups: Record<string, any[]> = {}
    allPermissions.value.forEach(p => {
        const group = p.plugin || 'core'
        if (!groups[group]) groups[group] = []
        groups[group].push(p)
    })
    return groups
})

const isChanged = computed(() => {
    const current = entity?.value?.permissions?.map((p: any) => p.id).sort().join(',') || ''
    const modified = [...selectedPermissionIds.value].sort().join(',')
    return current !== modified
})

const save = async () => {
    if (!entity?.value) return
    saving.value = true
    try {
        await api.syncRolePermissions(entity.value.id, selectedPermissionIds.value)
        if (reloadEntity) {
            await reloadEntity()
        }
    } catch (e: any) {
        alert('No se pudieron guardar los permisos: ' + e.message)
    } finally {
        saving.value = false
    }
}
</script>

<template>
  <div class="glass-panel p-4">
    <div class="flex justify-between items-center mb-6 border-b pb-4 dark:border-gray-700">
      <div>
        <h3 class="text-xl font-bold">Matriz de Permisos</h3>
        <p class="text-sm text-gray-500">Reglas de acceso concedidas a este rol.</p>
      </div>
      <button v-if="isChanged" class="btn btn-primary" :disabled="saving" @click="save">
        {{ saving ? 'Guardando...' : '💾 Guardar Permisos' }}
      </button>
    </div>

    <div v-if="loading" class="loading">Cargando permisos...</div>
    <div v-else class="space-y-6">
      <div v-for="(perms, groupName) in groupedPermissions" :key="groupName" class="border border-gray-200 dark:border-gray-800 rounded-lg overflow-hidden">
        <div class="bg-gray-100 dark:bg-gray-800 px-4 py-2 font-semibold capitalize text-primary flex justify-between items-center">
            Poderes de módulo: {{ groupName }}
            <span class="text-xs bg-gray-200 dark:bg-gray-700 px-2 py-1 rounded text-gray-700 dark:text-gray-300">{{ perms.length }} permisos</span>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 p-4 gap-4 bg-white dark:bg-gray-900">
            <label v-for="perm in perms" :key="perm.id" class="flex items-start gap-3 cursor-pointer p-2 hover:bg-gray-50 dark:hover:bg-gray-800 rounded">
                <input 
                    type="checkbox" 
                    :value="perm.id" 
                    v-model="selectedPermissionIds"
                    class="mt-1 form-checkbox h-5 w-5 text-primary rounded border-gray-300"
                />
                <div>
                    <div class="font-medium text-gray-900 dark:text-gray-100">{{ perm.description || perm.key }}</div>
                    <div class="text-xs text-gray-500 font-mono mt-0.5">{{ perm.key }}</div>
                </div>
            </label>
        </div>
      </div>
    </div>
  </div>
</template>
