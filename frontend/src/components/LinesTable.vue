<script setup lang="ts">
import { ref } from 'vue'
import ProductAutocomplete from './ProductAutocomplete.vue'

export interface LineItem {
  id?: number
  description: string
  qty: number
  unitPrice: number
  vatRate: number
  totalHt?: number
  fk_product?: number
  [key: string]: any
}

const props = defineProps<{
  lines: LineItem[]
  readonly?: boolean
  pricingMode?: 'sales' | 'purchases'
}>()

const emit = defineEmits<{
  (e: 'add', line: Omit<LineItem, 'id'>): void
  (e: 'update', line: LineItem): void
  (e: 'delete', lineId: number): void
}>()

// New line form
const newLine = ref<Omit<LineItem, 'id'>>({
  description: '',
  qty: 1,
  unitPrice: 0,
  vatRate: 21,
  fk_product: undefined
})

const editingLineId = ref<number | null>(null)
const editBuffer = ref<LineItem | null>(null)

const calcSubtotal = (qty: number, price: number): number => {
  return Math.round(qty * price * 100) / 100
}

const addLine = () => {
  if (!newLine.value.description.trim()) return
  emit('add', { ...newLine.value })
  newLine.value = { description: '', qty: 1, unitPrice: 0, vatRate: 21, fk_product: undefined }
}

const startEditLine = (line: LineItem) => {
  editingLineId.value = line.id ?? null
  editBuffer.value = { ...line }
}

const cancelEditLine = () => {
  editingLineId.value = null
  editBuffer.value = null
}

const saveEditLine = () => {
  if (editBuffer.value) {
    emit('update', editBuffer.value)
    cancelEditLine()
  }
}

const deleteLine = (lineId: number) => {
  if (confirm('¿Eliminar esta línea?')) {
    emit('delete', lineId)
  }
}

const handleProductSelected = (product: any, target: 'new' | 'edit') => {
  const priceBase = props.pricingMode === 'purchases' ? (product.cost_price ?? 0) : (product.price ?? 0)
  
  if (target === 'new') {
    newLine.value.unitPrice = priceBase
    newLine.value.vatRate = product.tva_tx ?? 21
    newLine.value.fk_product = product.id
  } else if (target === 'edit' && editBuffer.value) {
    editBuffer.value.unitPrice = priceBase
    editBuffer.value.vatRate = product.tva_tx ?? 21
    editBuffer.value.fk_product = product.id
  }
}
</script>

<template>
  <div class="lines-table-wrapper">
    <table class="lines-table">
      <thead>
        <tr>
          <th style="width: 40%">Descripción</th>
          <th style="width: 10%">Cant.</th>
          <th style="width: 15%">P. Unitario</th>
          <th style="width: 10%">IVA %</th>
          <th style="width: 15%">Subtotal HT</th>
          <th v-if="!readonly" style="width: 10%">Acciones</th>
        </tr>
      </thead>
      <tbody>
        <!-- Existing lines -->
        <template v-for="line in lines" :key="line.id ?? Math.random()">
          <!-- Edit mode -->
          <tr v-if="editingLineId === line.id && editBuffer" class="line-editing">
            <td>
              <ProductAutocomplete 
                v-model="editBuffer.description" 
                @product-selected="p => handleProductSelected(p, 'edit')" 
              />
            </td>
            <td><input v-model.number="editBuffer.qty" type="number" min="0" step="0.01" class="line-input line-input-sm" /></td>
            <td><input v-model.number="editBuffer.unitPrice" type="number" min="0" step="0.01" class="line-input line-input-sm" /></td>
            <td><input v-model.number="editBuffer.vatRate" type="number" min="0" step="0.1" class="line-input line-input-sm" /></td>
            <td class="line-subtotal">{{ calcSubtotal(editBuffer.qty, editBuffer.unitPrice).toFixed(2) }} €</td>
            <td>
              <button class="btn-icon" @click="saveEditLine" title="Guardar">✅</button>
              <button class="btn-icon" @click="cancelEditLine" title="Cancelar">❌</button>
            </td>
          </tr>
          <!-- View mode -->
          <tr v-else>
            <td>{{ line.description }}</td>
            <td>{{ line.qty }}</td>
            <td>{{ (line.unitPrice ?? 0).toFixed(2) }} €</td>
            <td>{{ line.vatRate }}%</td>
            <td class="line-subtotal">{{ (line.totalHt ?? calcSubtotal(line.qty, line.unitPrice)).toFixed(2) }} €</td>
            <td v-if="!readonly">
              <button class="btn-icon" @click="startEditLine(line)" title="Editar">✏️</button>
              <button class="btn-icon" @click="deleteLine(line.id!)" title="Eliminar">🗑️</button>
            </td>
          </tr>
        </template>

        <!-- Empty state -->
        <tr v-if="lines.length === 0">
          <td :colspan="readonly ? 5 : 6" style="text-align: center; color: var(--text-muted); padding: 2rem;">
            No hay líneas de detalle
          </td>
        </tr>
      </tbody>

      <!-- Add new line row -->
      <tfoot v-if="!readonly">
        <tr class="line-add-row">
          <td>
            <ProductAutocomplete 
              v-model="newLine.description" 
              @product-selected="p => handleProductSelected(p, 'new')" 
            />
          </td>
          <td><input v-model.number="newLine.qty" type="number" min="0" step="0.01" class="line-input line-input-sm" /></td>
          <td><input v-model.number="newLine.unitPrice" type="number" min="0" step="0.01" class="line-input line-input-sm" /></td>
          <td><input v-model.number="newLine.vatRate" type="number" min="0" step="0.1" class="line-input line-input-sm" /></td>
          <td class="line-subtotal">{{ calcSubtotal(newLine.qty, newLine.unitPrice).toFixed(2) }} €</td>
          <td>
            <button class="btn-primary btn-sm" @click="addLine" :disabled="!newLine.description.trim()">+ Añadir</button>
          </td>
        </tr>
      </tfoot>
    </table>
  </div>
</template>
