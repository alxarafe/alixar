<script setup lang="ts">
/**
 * Generic Lineas Tab — renders LinesTable using API callbacks
 * provided by the parent DetailView via provide/inject.
 *
 * The parent DetailView must:
 *   provide('linesConfig', {
 *     load: (id) => Promise<RawLine[]>,
 *     mapLine: (raw) => LineItem,
 *     add: (id, line) => Promise<any>,
 *     update?: (id, lineId, line) => Promise<any>,
 *     delete?: (id, lineId) => Promise<any>,
 *   })
 */
import { ref, onMounted, computed, inject } from 'vue'
import { useRoute } from 'vue-router'
import LinesTable, { type LineItem } from '../../components/LinesTable.vue'

export interface LinesConfig {
  load: (entityId: number) => Promise<any[]>
  mapLine: (raw: any) => LineItem
  add: (entityId: number, line: { desc: string; qty: number; subprice: number; tva_tx: number; fk_product?: number | null }) => Promise<any>
  update?: (entityId: number, lineId: number, line: { desc: string; qty: number; subprice: number; tva_tx: number; fk_product?: number | null }) => Promise<any>
  remove?: (entityId: number, lineId: number) => Promise<any>
  pricingMode?: 'sales' | 'purchases'
}

const route = useRoute()
const entityId = computed(() => Number(route.params.id))
const config = inject<LinesConfig>('linesConfig')!
const lines = ref<LineItem[]>([])
const loading = ref(true)

const loadLines = async () => {
  try {
    loading.value = true
    const raw = await config.load(entityId.value)
    lines.value = raw.map(config.mapLine)
  } catch (e: any) {
    console.error("Error loading lines:", e)
  } finally {
    loading.value = false
  }
}

onMounted(loadLines)

const handleAdd = async (line: Omit<LineItem, 'id'>) => {
  try {
    const payload: any = { desc: line.description, qty: line.qty, subprice: line.unitPrice, tva_tx: line.vatRate }
    if (line.fk_product) payload.fk_product = line.fk_product
    await config.add(entityId.value, payload)
    await loadLines()
  } catch (e: any) { alert("Error: " + e.message) }
}

const handleUpdate = async (line: LineItem) => {
  if (!line.id || !config.update) return
  try {
    const payload: any = { desc: line.description, qty: line.qty, subprice: line.unitPrice, tva_tx: line.vatRate }
    if (line.fk_product) payload.fk_product = line.fk_product
    await config.update(entityId.value, line.id, payload)
    await loadLines()
  } catch (e: any) { alert("Error: " + e.message) }
}

const handleDelete = async (lineId: number) => {
  if (!config.remove) return
  try { await config.remove(entityId.value, lineId); await loadLines() }
  catch (e: any) { alert("Error: " + e.message) }
}

const isReadonly = computed(() => !config.update && !config.remove)
</script>

<template>
  <div>
    <div v-if="loading" class="loading">Cargando líneas...</div>
    <LinesTable v-else :lines="lines" :readonly="isReadonly" :pricing-mode="config.pricingMode || 'sales'"
      @add="handleAdd" @update="handleUpdate" @delete="handleDelete" />
  </div>
</template>
