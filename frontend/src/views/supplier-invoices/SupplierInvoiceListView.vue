<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { SupplierInvoice } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const rows = ref<SupplierInvoice[]>([])
const total = ref(0); const page = ref(1); const limit = ref(50); const loading = ref(true); const error = ref<string | null>(null)
const statusMap: Record<number, string> = { 0: 'Borrador', 1: 'Validada', 2: 'Pagada', 3: 'Abandonada' }
const columns: Column[] = [
  { key: 'ref', label: 'Referencia' },
  { key: 'ref_supplier', label: 'Ref. Proveedor' },
  { key: 'fk_soc', label: 'Proveedor', format: (_: any, row: SupplierInvoice) => row.socname || `#${row.fk_soc}` },
  { key: 'datef', label: 'Fecha', format: (v: string) => v ? new Date(v).toLocaleDateString('es-ES') : '—' },
  { key: 'total_ttc', label: 'Total TTC', align: 'right', format: (v: number) => v ? `${Number(v).toFixed(2)} €` : '—' },
  { key: 'fk_statut', label: 'Estado', format: (v: number) => statusMap[v] ?? `Estado ${v}` },
]
const loadData = async () => { try { loading.value = true; rows.value = await api.getSupplierInvoices({ limit: limit.value, page: page.value - 1 }); total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1 } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadData)
const handleCreate = () => router.push({ name: 'resource-create', params: { resource: 'facturas-proveedor' } })
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Facturas de Proveedor...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="Facturas de Proveedor" detail-route="supplier-invoice-ficha"
      create-label="Nueva Factura" @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
