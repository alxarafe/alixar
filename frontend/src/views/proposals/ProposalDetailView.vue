<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { Proposal } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import StatusBadge from '../../components/StatusBadge.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<Proposal | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))

const statusMap = {
  0: { label: 'Borrador', color: '#94A3B8' },
  1: { label: 'Validado', color: '#34D399' },
  2: { label: 'Firmado', color: '#FBBF24' },
  3: { label: 'No Firmado', color: '#F87171' },
  4: { label: 'Facturado', color: '#60A5FA' },
}

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'proposal-ficha', params: { id: entityId.value } } },
  { key: 'lineas', label: 'Líneas', icon: '📝', route: { name: 'proposal-lineas', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📎', route: { name: 'proposal-notas', params: { id: entityId.value } } },
])

const loadEntity = async () => {
  try { loading.value = true; entity.value = await api.getProposal(entityId.value) }
  catch (e: any) { error.value = e.message } finally { loading.value = false }
}
onMounted(loadEntity)
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.proposal)
provide('linesConfig', {
  load: (id: number) => api.getProposalLines(id),
  mapLine: (l: any) => ({ id: l.id, description: l.description || '', qty: l.qty, unitPrice: l.subprice, vatRate: l.tva_tx, totalHt: l.total_ht }),
  add: (id: number, line: any) => api.addProposalLine(id, line),
  update: (id: number, lineId: number, line: any) => api.updateProposalLine(id, lineId, line),
  remove: (id: number, lineId: number) => api.deleteProposalLine(id, lineId),
})
provide('updateEntity', (data: any) => api.updateProposal(entityId.value, data).then(loadEntity))

const handleValidate = async () => { try { await api.validateProposal(entityId.value); await loadEntity() } catch (e: any) { alert("Error: " + e.message) } }
const handleClose = async (status: number) => { try { await api.closeProposal(entityId.value, { status }); await loadEntity() } catch (e: any) { alert("Error: " + e.message) } }
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando presupuesto...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/presupuestos" class="back-btn-title">⬅️</router-link> Presupuesto {{ entity.ref }}</h2>
        <StatusBadge :status="entity.fk_statut ?? 0" :status-map="statusMap" />
      </div>
      <div class="action-bar" v-if="(entity.fk_statut ?? 0) < 2">
        <button v-if="entity.fk_statut === 0" class="btn-action btn-validate" @click="handleValidate">✅ Validar</button>
        <button v-if="entity.fk_statut === 1" class="btn-action btn-validate" @click="handleClose(2)">🤝 Firmado (Ganado)</button>
        <button v-if="entity.fk_statut === 1" class="btn-action btn-delete" @click="handleClose(3)">❌ No Firmado (Perdido)</button>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
