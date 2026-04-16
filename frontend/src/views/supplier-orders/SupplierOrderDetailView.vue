<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { SupplierOrder } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import StatusBadge from '../../components/StatusBadge.vue'
import { entityFields } from '../../config/fields'
const route = useRoute(); const entity = ref<SupplierOrder | null>(null); const loading = ref(true); const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))
const statusMap = { 0: { label: 'Borrador', color: '#94A3B8' }, 1: { label: 'Validado', color: '#34D399' }, 2: { label: 'Aprobado', color: '#60A5FA' }, 3: { label: 'En Proceso', color: '#FBBF24' }, 5: { label: 'Recibido', color: '#34D399' } }
const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'supplier-order-ficha', params: { id: entityId.value } } },
  { key: 'lineas', label: 'Líneas', icon: '📝', route: { name: 'supplier-order-lineas', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📎', route: { name: 'supplier-order-notas', params: { id: entityId.value } } },
])
const loadEntity = async () => { try { loading.value = true; entity.value = await api.getSupplierOrder(entityId.value) } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadEntity); provide('entity', entity); provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.supplierOrder)
provide('linesConfig', {
  load: (id: number) => api.getSupplierOrderLines(id),
  mapLine: (l: any) => ({ id: l.id, description: l.description || '', qty: l.qty, unitPrice: l.subprice, vatRate: l.tva_tx, totalHt: l.total_ht }),
  add: (id: number, line: any) => api.addSupplierOrderLine(id, line),
  pricingMode: 'purchases'
})
provide('updateEntity', (data: any) => api.updateSupplierOrder(entityId.value, data).then(loadEntity))
const handleValidate = async () => { try { await api.validateSupplierOrder(entityId.value); await loadEntity() } catch (e: any) { alert("Error: " + e.message) } }
const handleClose = async () => { try { await api.closeSupplierOrder(entityId.value); await loadEntity() } catch (e: any) { alert("Error: " + e.message) } }
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando pedido proveedor...</div>
    <template v-else-if="entity">
      <div class="detail-header"><h2><router-link to="/pedidos-proveedor" class="back-btn-title">⬅️</router-link> Pedido Proveedor {{ entity.ref }}</h2><StatusBadge :status="entity.fk_statut ?? 0" :status-map="statusMap" /></div>
      <div class="action-bar" v-if="(entity.fk_statut ?? 0) < 3">
        <button v-if="entity.fk_statut === 0" class="btn-action btn-validate" @click="handleValidate">✅ Validar</button>
        <button v-if="entity.fk_statut === 1 || entity.fk_statut === 2" class="btn-action btn-close-doc" @click="handleClose">📦 Cerrar (Recibido)</button>
      </div>
      <TabBar :tabs="tabs" /><div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
