<script setup lang="ts">
export interface InfoField {
  label: string
  value: string | number | null | undefined
  type?: 'text' | 'link' | 'email' | 'badge'
  badgeColor?: string
}

defineProps<{
  fields: InfoField[]
}>()
</script>

<template>
  <div class="info-card">
    <div v-for="(field, idx) in fields" :key="idx" class="info-row">
      <span class="info-label">{{ field.label }}</span>
      <span class="info-value">
        <template v-if="!field.value && field.value !== 0">—</template>
        <a v-else-if="field.type === 'email'" :href="`mailto:${field.value}`">{{ field.value }}</a>
        <a v-else-if="field.type === 'link'" :href="String(field.value)" target="_blank" rel="noopener">{{ field.value }}</a>
        <span v-else-if="field.type === 'badge'" class="status-badge" :style="{ '--badge-color': field.badgeColor || '#94A3B8' }">{{ field.value }}</span>
        <template v-else>{{ field.value }}</template>
      </span>
    </div>
  </div>
</template>
