<script setup lang="ts">
import { computed } from 'vue'

export interface StatusOption {
  label: string
  color: string // CSS color value
}

const props = defineProps<{
  status: number | string
  statusMap: Record<number | string, StatusOption>
}>()

const current = computed(() => {
  return props.statusMap[props.status] ?? { label: `Estado ${props.status}`, color: '#94A3B8' }
})
</script>

<template>
  <span class="status-badge" :style="{ '--badge-color': current.color }">
    {{ current.label }}
  </span>
</template>
