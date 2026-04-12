<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../../api'
import type { BankTransaction } from '../../../api'

const route = useRoute()
const entityId = computed(() => Number(route.params.id))
const transactions = ref<BankTransaction[]>([])
const loading = ref(true)

const loadTransactions = async () => {
  try { loading.value = true; transactions.value = await api.getBankTransactions(entityId.value) }
  catch (e) { console.error(e) } finally { loading.value = false }
}
onMounted(loadTransactions)
</script>

<template>
  <div>
    <div v-if="loading" class="loading">Cargando movimientos...</div>
    <template v-else>
      <table class="lines-table">
        <thead>
          <tr><th>ID</th><th>Fecha Op.</th><th>Fecha Val.</th><th>Concepto</th><th style="text-align:right">Importe</th><th>Tipo</th></tr>
        </thead>
        <tbody>
          <tr v-for="tx in transactions" :key="tx.id">
            <td>#{{ tx.id }}</td>
            <td>{{ tx.dateo ? new Date(tx.dateo).toLocaleDateString('es-ES') : '—' }}</td>
            <td>{{ tx.datev ? new Date(tx.datev).toLocaleDateString('es-ES') : '—' }}</td>
            <td>{{ tx.label }}</td>
            <td :style="{ textAlign: 'right', color: tx.amount >= 0 ? '#34D399' : '#F87171', fontWeight: 600 }">
              {{ tx.amount >= 0 ? '+' : '' }}{{ Number(tx.amount).toFixed(2) }} €
            </td>
            <td>{{ tx.fk_type || '—' }}</td>
          </tr>
          <tr v-if="transactions.length === 0"><td colspan="6" style="text-align:center;padding:2rem;color:var(--text-muted);">Sin movimientos</td></tr>
        </tbody>
      </table>
    </template>
  </div>
</template>
