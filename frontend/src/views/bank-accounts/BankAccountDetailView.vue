<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { BankAccount } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import { entityFields } from '../../config/fields'
const route = useRoute(); const entity = ref<BankAccount | null>(null); const loading = ref(true); const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))
const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: 'bank-ficha', params: { id: entityId.value } } },
  { key: 'movimientos', label: 'Movimientos', icon: '💸', route: { name: 'bank-movimientos', params: { id: entityId.value } } },
])
const loadEntity = async () => { try { loading.value = true; entity.value = await api.getBankAccount(entityId.value) } catch (e: any) { error.value = e.message } finally { loading.value = false } }
onMounted(loadEntity); provide('entity', entity); provide('reloadEntity', loadEntity); provide('fichaFields', entityFields.bankAccount)
</script>
<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando cuenta bancaria...</div>
    <template v-else-if="entity">
      <div class="detail-header"><h2><router-link to="/bancos" class="back-btn-title">⬅️</router-link> {{ entity.label }}</h2><span class="badge">{{ entity.ref }}</span></div>
      <TabBar :tabs="tabs" /><div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
