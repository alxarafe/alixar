<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import Pagination from './Pagination.vue'

export interface Column {
  key: string
  label: string
  format?: (value: any, row: any) => string
  align?: 'left' | 'center' | 'right'
  width?: string
}

const props = defineProps<{
  columns: Column[]
  rows: any[]
  total: number
  page: number
  limit: number
  title: string
  createLabel?: string
  detailRoute?: string  // route name base for detail, e.g. 'invoice-detail'
  idField?: string      // field to use as id, defaults to 'id'
}>()

const emit = defineEmits<{
  (e: 'create'): void
  (e: 'page-change', page: number): void
  (e: 'limit-change', limit: number): void
}>()

const router = useRouter()
const rowIdField = computed(() => props.idField ?? 'id')

const goToDetail = (row: any) => {
  if (!props.detailRoute) return
  router.push({ name: props.detailRoute, params: { id: row[rowIdField.value] } })
}

const getCellValue = (col: Column, row: any): string => {
  const raw = row[col.key]
  if (col.format) return col.format(raw, row)
  if (raw === null || raw === undefined) return '—'
  return String(raw)
}
</script>

<template>
  <div class="entity-list">
    <div class="table-card glass-panel">
      <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
        <h3>{{ title }}</h3>
        <button v-if="createLabel" class="btn-primary" @click="emit('create')">
          + {{ createLabel }}
        </button>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th
                v-for="col in columns"
                :key="col.key"
                :style="{ width: col.width, textAlign: col.align || 'left' }"
              >
                {{ col.label }}
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="row in rows"
              :key="row[rowIdField]"
              :class="{ 'row-clickable': !!detailRoute }"
              @click="goToDetail(row)"
            >
              <td
                v-for="col in columns"
                :key="col.key"
                :style="{ textAlign: col.align || 'left' }"
              >
                {{ getCellValue(col, row) }}
              </td>
            </tr>
            <tr v-if="rows.length === 0">
              <td :colspan="columns.length" style="text-align: center; padding: 3rem; color: var(--text-muted);">
                No se encontraron registros
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <Pagination
        :total="total"
        :page="page"
        :limit="limit"
        @change="emit('page-change', $event)"
        @limit-change="emit('limit-change', $event)"
      />
    </div>
  </div>
</template>
