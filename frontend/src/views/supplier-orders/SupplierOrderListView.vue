<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { SupplierOrder } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const rows = ref<SupplierOrder[]>([]); const total = ref(0); const page = ref(1); const limit = ref(50); const loading = ref(true); const error = ref<string | null>(null)
const statusMap: Record<number, string> = { 0: 'Borrador', 1: 'Validado', 2: 'Aprobado', 3: 'En Proceso', 5: 'Recibido' }
const columns: Column[] = [
  { key: 'ref', label: 'Referencia' }, { key: 'ref_supplier', label: 'Ref. Proveedor' },
  { key: 'fk_soc', label: 'Proveedor', format: (_: any, row: SupplierOrder) => row.socname || `#${row.fk_soc}` },
  { key: 'date_commande', label: 'Fecha', format: (v: string) => v ? new Date(v).toLocaleDateString('es-ES') : '—' },
  { key: 'total_ttc', label: 'Total TTC', align: 'right', format: (v: number) => v ? `${Number(v).toFixed(2)} €` : '—' },
  { key: 'fk_statut', label: 'Estado', format: (v: number) => statusMap[v] ?? `Estado ${v}` },
]
const loadData = async () => { try { loading.value = true; rows.value = await api.getSupplierOrders({ limit: limit.value, page: page.value - 1 }); total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1 } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadData)
const handleCreate = () => router.push({ name: 'resource-create', params: { resource: 'pedidos-proveedor' } })
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Pedidos de Proveedor...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="Pedidos de Proveedor" detail-route="supplier-order-ficha"
      create-label="Nuevo Pedido a Proveedor" @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
