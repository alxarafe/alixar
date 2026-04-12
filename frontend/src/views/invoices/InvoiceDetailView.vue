<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { Invoice } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import StatusBadge from '../../components/StatusBadge.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<Invoice | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))

const statusMap = {
  0: { label: 'Borrador', color: '#94A3B8' },
  1: { label: 'Validada', color: '#34D399' },
  2: { label: 'Pagada', color: '#FBBF24' },
  3: { label: 'Abandonada', color: '#F87171' },
}

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'invoice-ficha', params: { id: entityId.value } } },
  { key: 'lineas', label: 'Líneas', icon: '📝', route: { name: 'invoice-lineas', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📎', route: { name: 'invoice-notas', params: { id: entityId.value } } },
])

const loadEntity = async () => {
  try { loading.value = true; entity.value = await api.getInvoice(entityId.value) }
  catch (e: any) { error.value = e.message } finally { loading.value = false }
}

onMounted(loadEntity)
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.invoice)
provide('linesConfig', {
  load: (id: number) => api.getInvoiceLines(id),
  mapLine: (l: any) => ({ id: l.id, description: l.description || l.product_label || '', qty: l.qty, unitPrice: l.subprice, vatRate: l.tva_tx, totalHt: l.total_ht }),
  add: (id: number, line: any) => api.addInvoiceLine(id, line),
  update: (id: number, lineId: number, line: any) => api.updateInvoiceLine(id, lineId, line),
  remove: (id: number, lineId: number) => api.deleteInvoiceLine(id, lineId),
  pricingMode: 'sales'
})
provide('updateEntity', (data: any) => api.updateInvoice(entityId.value, data).then(loadEntity))

const handleValidate = async () => {
  try { await api.validateInvoice(entityId.value); await loadEntity() }
  catch (e: any) { alert("Error: " + e.message) }
}
const handleSetPaid = async () => {
  try { await api.setInvoicePaid(entityId.value); await loadEntity() }
  catch (e: any) { alert("Error: " + e.message) }
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando factura...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/facturas" class="back-btn-title" title="Volver al listado">⬅️</router-link> Factura {{ entity.ref }}</h2>
        <StatusBadge :status="entity.fk_statut ?? 0" :status-map="statusMap" />
      </div>
      <div class="action-bar" v-if="entity.fk_statut === 0 || entity.fk_statut === 1">
        <button v-if="entity.fk_statut === 0" class="btn-action btn-validate" @click="handleValidate">✅ Validar</button>
        <button v-if="entity.fk_statut === 1" class="btn-action btn-close-doc" @click="handleSetPaid">💰 Marcar Pagada</button>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
