const fs = require('fs');
const path = require('path');

const resources = [
  { name: 'Ticket', folder: 'tickets', pathKey: 'tickets', Spanish: 'Tickets' },
  { name: 'Category', folder: 'categories', pathKey: 'categorias', Spanish: 'Categorías' },
  { name: 'Contract', folder: 'contracts', pathKey: 'contratos', Spanish: 'Contratos' },
  { name: 'SupplierProposal', folder: 'supplier-proposals', pathKey: 'presupuestos-proveedor', Spanish: 'Presupuestos de Proveedor' }
];

const basePath = path.join(__dirname, 'src', 'views');

resources.forEach(res => {
  const dirPath = path.join(basePath, res.folder);
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }

  // Write ListView
  fs.writeFileSync(path.join(dirPath, `${res.name}ListView.vue`), `<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { ${res.name} } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const rows = ref<${res.name}[]>([])
const total = ref(0)
const page = ref(1)
const limit = ref(50)
const loading = ref(true)
const error = ref<string | null>(null)

const columns: Column[] = [
  { key: 'id', label: 'ID', width: '60px', format: (v: number) => \`#\${v}\` },
  { key: 'ref', label: 'Referencia' }
]

const loadData = async () => {
  try {
    loading.value = true
    rows.value = await api.get${res.name}s({ limit: limit.value, page: page.value - 1 })
    total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1
  } catch (e: any) { error.value = e.message } finally { loading.value = false }
}

onMounted(loadData)

const handleCreate = () => {
  router.push({ name: 'resource-create', params: { resource: '${res.pathKey}' } })
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando ${res.Spanish}...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="${res.Spanish}" create-label="Crear ${res.name}" detail-route="${res.name.toLowerCase()}-ficha"
      @create="handleCreate" @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
`);

  // Write DetailView
  fs.writeFileSync(path.join(dirPath, `${res.name}DetailView.vue`), `<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { ${res.name} } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<${res.name} | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: '${res.name.toLowerCase()}-ficha', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📝', route: { name: '${res.name.toLowerCase()}-notas', params: { id: entityId.value } } },
])

const loadEntity = async () => {
  try { loading.value = true; entity.value = await api.get${res.name}(entityId.value) }
  catch (e: any) { error.value = e.message } finally { loading.value = false }
}
onMounted(loadEntity)
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', entityFields.${res.name.charAt(0).toLowerCase() + res.name.slice(1)})
provide('updateEntity', (data: any) => api.update${res.name}(entityId.value, data).then(loadEntity))
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando ${res.name}...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/${res.pathKey}" class="back-btn-title">⬅️</router-link> {{ entity.ref || 'ID #'+entity.id }}</h2>
        <span class="badge">{{ entity.ref }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
`);
});

console.log('Views generated successfully!');
