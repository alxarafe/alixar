<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  total: number
  page: number
  limit: number
}>()

const emit = defineEmits<{
  (e: 'change', page: number): void
  (e: 'limit-change', limit: number): void
}>()

const totalPages = computed(() => Math.max(1, Math.ceil(props.total / props.limit)))
const from = computed(() => props.total === 0 ? 0 : (props.page - 1) * props.limit + 1)
const to = computed(() => Math.min(props.page * props.limit, props.total))

const canPrev = computed(() => props.page > 1)
const canNext = computed(() => props.page < totalPages.value)

const goTo = (p: number) => {
  if (p >= 1 && p <= totalPages.value) emit('change', p)
}

const visiblePages = computed(() => {
  const pages: number[] = []
  const tp = totalPages.value
  const current = props.page
  const delta = 2

  for (let i = 1; i <= tp; i++) {
    if (i === 1 || i === tp || (i >= current - delta && i <= current + delta)) {
      pages.push(i)
    }
  }

  // Insert -1 as ellipsis markers
  const result: number[] = []
  let prev = 0
  for (const p of pages) {
    if (prev && p - prev > 1) result.push(-1)
    result.push(p)
    prev = p
  }
  return result
})
</script>

<template>
  <div class="pagination" v-if="total > 0">
    <div class="pagination-info">
      Mostrando <strong>{{ from }}</strong>–<strong>{{ to }}</strong> de <strong>{{ total }}</strong>
    </div>

    <div class="pagination-controls">
      <button class="pagination-btn" :disabled="!canPrev" @click="goTo(page - 1)" title="Anterior">
        ‹
      </button>

      <template v-for="p in visiblePages" :key="p">
        <span v-if="p === -1" class="pagination-ellipsis">…</span>
        <button
          v-else
          class="pagination-btn"
          :class="{ active: p === page }"
          @click="goTo(p)"
        >
          {{ p }}
        </button>
      </template>

      <button class="pagination-btn" :disabled="!canNext" @click="goTo(page + 1)" title="Siguiente">
        ›
      </button>
    </div>

    <div class="pagination-limit">
      <select :value="limit" @change="emit('limit-change', Number(($event.target as HTMLSelectElement).value))">
        <option :value="20">20 / pág.</option>
        <option :value="50">50 / pág.</option>
        <option :value="100">100 / pág.</option>
      </select>
    </div>
  </div>
</template>
