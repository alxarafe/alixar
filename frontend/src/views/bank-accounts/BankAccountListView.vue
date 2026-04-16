<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { BankAccount } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const rows = ref<BankAccount[]>([]); const total = ref(0); const page = ref(1); const limit = ref(50); const loading = ref(true); const error = ref<string | null>(null)
const columns: Column[] = [
  { key: 'ref', label: 'Referencia' }, { key: 'label', label: 'Etiqueta' },
  { key: 'bank', label: 'Banco' }, { key: 'iban_prefix', label: 'IBAN' },
  { key: 'currency_code', label: 'Divisa', width: '80px' },
]
const loadData = async () => { try { loading.value = true; rows.value = await api.getBankAccounts({ limit: limit.value, page: page.value - 1 }); total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1 } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadData)
const handleCreate = () => router.push({ name: 'resource-create', params: { resource: 'bancos' } })
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando Cuentas Bancarias...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="Cuentas Bancarias" detail-route="bank-ficha"
      create-label="Nueva Cuenta Bancaria" @create="handleCreate"
      @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
