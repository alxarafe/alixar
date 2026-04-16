<script setup lang="ts">
import { useRoute } from 'vue-router'

export interface Tab {
  key: string
  label: string
  route?: { name: string; params?: Record<string, any> }
  icon?: string
}

defineProps<{
  tabs: Tab[]
}>()

const route = useRoute()

const isActive = (tab: Tab): boolean => {
  if (!tab.route) return false
  return route.name === tab.route.name
}
</script>

<template>
  <div class="tab-bar">
    <router-link
      v-for="tab in tabs"
      :key="tab.key"
      :to="tab.route ?? '#'"
      class="tab-item"
      :class="{ 'tab-active': isActive(tab) }"
    >
      <span v-if="tab.icon" class="tab-icon">{{ tab.icon }}</span>
      {{ tab.label }}
    </router-link>
  </div>
</template>
